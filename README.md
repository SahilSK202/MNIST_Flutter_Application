# HELLO MNIST

## A Flutter Application For Handwritten Digit Classifier

This is a deep learning project where we have classified hand written digits using simple ANN. <br><br>A flutter application is made where we can draw a digit, upload a image consisting of a digit and ANN model will display the predicted digit.

# Dataset - tensorflow.keras.datasets.mnist

MNIST is a dataset of handwritten digit images consisting of a training set of 50,000 images and a test set of 10,000 images. Each example is a 28x28 grayscale image, associated with a label from 10 classes ( 0 - 9 )

## Experiment Results:

- **Performance Evaluation**
  - Out of 50000 training images 10000 images were used for validation set.
- **Training and Validation**
  - Dense ANN with 2 layers is used with RELU as activation function and softmax for output.
- **Performance Results**
  - Training Score: 100.0%
  - Validation Score: 98.03%
  - Testing Score: 98.0%

# Demo

## App Launch Icon and Name

<img src="https://github.com/SahilSK202/MNIST_Flutter_Application/blob/main/assets/images/1.png" width="300" height="500">

## First Look

<img src="https://github.com/SahilSK202/MNIST_Flutter_Application/blob/main/assets/images/2.png" width="300" height="500">
<!-- ![](https://github.com/SahilSK202/MNIST_Flutter_Application/blob/main/assets/images/2.png) -->

## Draw and Predict

<img src="https://github.com/SahilSK202/MNIST_Flutter_Application/blob/main/assets/images/3.png" width="300" height="500">
<img src="https://github.com/SahilSK202/MNIST_Flutter_Application/blob/main/assets/images/4.png" width="300" height="500">


## Predicting saved image

<img src="https://github.com/SahilSK202/MNIST_Flutter_Application/blob/main/assets/images/5.png" width="300" height="500">


## About Me

<img src="https://github.com/SahilSK202/MNIST_Flutter_Application/blob/main/assets/images/6.png" width="300" height="500">
<img src="https://github.com/SahilSK202/MNIST_Flutter_Application/blob/main/assets/images/7.png" width="300" height="500">




## Further Improvements

There are lot of things to improve upon

- CNN can be used to increase accuracy on unknown data.
- More data can be provided.
- Preprocess any image to Black background and white digit
- Train a model in such a way it will be able to have digit on different part of the image (corners etc.)
- While drawing digits different brush sizes can be used.
- Multiple digits can be recognized in a single image or canvas.

### [ Click here to view MNIST GUI with TKINTER ](https://github.com/SahilSK202/MNIST_Digit_Classifier_GUI)
