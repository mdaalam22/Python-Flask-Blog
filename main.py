from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from datetime import datetime
import json
import os
import math
from flask_mail import Mail


local_server = True
with open('config.json') as c:
    params = json.load(c)['params']

app = Flask(__name__)
app.secret_key = "super-secret-key"
app.config['UPLOAD_FOLDER'] = params['upload_location']

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_user'],
    MAIL_PASSWORD = params['gmail_password']
)
mail = Mail(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(25), nullable=False)





@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    # [0:params['no_of_posts']]
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    # posts = posts[]
    #pagination
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)    

    posts = posts[(page-1) * int(params['no_of_posts']) : (page-1) * int(params['no_of_posts']) + int(params['no_of_posts']) ]    

    if page == 1:
        prev = "#"
        nxt = "/?page="+str(page+1)    

    elif page == last:
        prev = "/?page="+str(page-1) 
        nxt = "#"
    else:
        nxt = "/?page="+str(page+1) 
        prev = "/?page="+str(page-1)




    
    return render_template('index.html',params=params,posts=posts,prev=prev,nxt=nxt)

@app.route('/about')
def about():
    return render_template('about.html',params=params) 

@app.route('/contact',methods=['GET','POST'])
def contact():
    if request.method == 'POST':
        ''' Add Entry to database '''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name, email=email,phone_num=phone,msg=message,date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New Message from ' +name,
                          sender=email,
                          recipients=[params['gmail_user']],
                          body = message + '\n' + phone
                          )




    return render_template('contact.html',params=params) 

@app.route('/post/<string:post_slug>',methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=post) 


@app.route('/dashboard', methods=['GET','POST'])
def dashboard():

    if('user' in session and session['user'] == params['admin_username']):
         posts = Posts.query.all()
         return render_template('dashboard.html',params=params,posts=posts)


    if request.method == 'POST':
        username = request.form.get('user')
        userpass = request.form.get('pass')
        if username == params['admin_username'] and userpass == params['admin_password']:
            #set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html',params=params,posts=posts)


    return render_template('login.html',params=params) 

@app.route('/edit/<string:sno>',methods=['GET','POST'])
def edit(sno):
    if('user' in session and session['user'] == params['admin_username']):
        if request.method == "POST":
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            img_file = request.form.get('img_file')
            content = request.form.get('content')
            date = datetime.now()

            if sno == '0':
                post = Posts(title = box_title,slug = slug,img_file=img_file,content=content,date=date)
                db.session.add(post)
                db.session.commit()

            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.img_file = img_file
                post.content = content
                post.date = date

                db.session.commit()
                return redirect('/edit/'+sno)

        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',params=params,post=post,sno=sno)    
    

@app.route('/uploader',methods=['GET','POST'])
def uploader():
    if('user' in session and session['user'] == params['admin_username']):
        if request.method == "POST":
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return "Uploaded successfully"


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route('/delete/<string:sno>',methods=['GET','POST'])
def delete(sno):
    if('user' in session and session['user'] == params['admin_username']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')    




app.run(debug=True)    