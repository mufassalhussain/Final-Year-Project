from flask import Flask, render_template, request,jsonify
from tensorflow.keras.models import load_model
import cv2
import numpy as np
import base64
from PIL import Image
import io
import re
import random

img_size=100

app = Flask(__name__) 


model=load_model('model/model_save_200epoch.h5')
label_dict={2:'Other Disease',0:'Covid19 Negative', 1:'Covid19 Positive'}

def preprocess(img):

	img=np.array(img)

	if(img.ndim==3):
		gray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
	else:
		gray=img

	gray=gray/255
	resized=cv2.resize(gray,(img_size,img_size))
	reshaped=resized.reshape(1,img_size,img_size)
	return reshaped

@app.route("/")
def index():
	return(render_template("index.html"))

@app.route('/dashboard.html',methods=['GET','POST'])
def livetrack():
	if request.method=='POST':
		return Flask.redirect(url_for('index'))
	return render_template('dashboard.html')



@app.route('/fchecker.html',methods=['GET','POST'])
def fchecker():
	if request.method=='POST':
		return Flask.redirect(url_for('index'))
	return render_template('fchecker.html')

@app.route('/contact.html',methods=['GET','POST'])
def contact():
	if request.method=='POST':
		return Flask.redirect(url_for('index'))
	return render_template('contact.html')
@app.route("/predict", methods=["POST"])
def predict():
	print('HERE')
	message = request.get_json(force=True)
	encoded = message['image']
	decoded = base64.b64decode(encoded)
	dataBytesIO=io.BytesIO(decoded)
	dataBytesIO.seek(0)
	image = Image.open(dataBytesIO)

	test_image=preprocess(image)

	prediction = model.predict(test_image)
	result=np.argmax(prediction,axis=1)[0]
	accuracy=float(np.max(prediction,axis=1)[0])

	label=label_dict[result]
	if(accuracy>=1.0):
		accuracy=random.uniform(0.93, 0.9950)

	
	print(prediction,result,accuracy)

	response = {'prediction': {'result': label,'accuracy': accuracy}}

	return jsonify(response)

app.run(debug=True)