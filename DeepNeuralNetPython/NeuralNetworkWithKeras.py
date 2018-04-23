import keras
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense, Dropout
from keras.optimizers import RMSprop
import pandas as pd

## 1. Import File
data = pd.read_csv("/Users/trailbrazer/Desktop/udemy/DataScience-Python3/mammographic_masses.data.txt", na_values=['?'],
                   header=None)

## Preprocessing using Pandas
data.dropna(inplace=True)

#Splitting Training and Testing Data
trainingData = data.iloc[:700, 0:4]
trainingLabel = data.iloc[:700, 5]

testingData = data.iloc[700:, 0:4]
testingLabel = data.iloc[700:, 5]

(mnist_train_images, mnist_train_labels), (mnist_test_images, mnist_test_labels) = (trainingData, trainingLabel), (testingData, testingLabel)

#Categorical Labels: For 0 and 1 would be 2. Number of Categories
train_labels = keras.utils.to_categorical(mnist_train_labels, 2)
test_labels = keras.utils.to_categorical(mnist_test_labels, 2)

# Model Boiler Plate from Keras, TensorFlow
model = Sequential()
#Input Layer Must match the input features
model.add(Dense(5, activation='relu', input_shape=(4,)))
model.add(Dense(12, activation='relu'))
model.add(Dense(2, activation='softmax'))
#Output Categories = 2 must match the number of categories
#Activation Function = Relu, Softmax is nothing but determining what ouput => classifier

# Model Sumaary 
model.summary()

model.compile(loss='categorical_crossentropy',
              optimizer=RMSprop(),
              metrics=['accuracy'])

# Start the training
history = model.fit(trainingData, train_labels,
                    batch_size=100,
                    epochs=1000,
                    verbose=2,
                    validation_data=(testingData, test_labels))

#Evaluates the prediction
score = model.evaluate(mnist_test_images, test_labels, verbose=0)
# Accuracy and loss
print('Test loss:', score[0])
print('Test accuracy:', score[1])
