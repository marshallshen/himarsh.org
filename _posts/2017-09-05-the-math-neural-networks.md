---
layout:     post
title:      The math of neural networks
tags: ["tech"]
image: '/images/posts/2017-09-05-the-math-neural-networks/cover.svg'
---

Building neural networks is at the heart of any deep learning technique. Neural networks is a series of forward and backward propagations to train paramters in the model, and it is built on the unit of logistic regression classifiers. This post will expand based on [the math of logistic regression](http://himarsh.org/the-math-of-logistic-regression/) to build more advanced neural networks in mathematical terms.

A neural network is composed of **layers**, and there are three types of layers in a neural network: one **input layer**, one **output layer**, and one or many **hidden layers**. Each layer is built based on the same structure of logistic regression classifier, with **a linear transformation** and **an activation function**. Given a fixed set of input layer and output layer, we can build more complex neural network by adding more **hidden layers**. 

Before diving into the details of the mathematical model, we need to have a big picture of the computation. To quote from [deeplearning.ai](https://www.deeplearning.ai/) class:

> the general methodology to build a Neural Network is to:
>
>  Define the neural network structure (number of input units, number of hidden units, etc.)
>
>  Initialize the model's parameters
>  
>  Loop
>   - Implement forward propagation
>   - Compute loss
>   - Implement backward propagation to get the gradients
>   - Update parameters (gradients)

To make it easier to understand, we take an iterative approach to break down the math of neural networks, first we analyze a **2-layer neural network**, then we analyze **L-layer neural network**.

## Two-layer neural network

Let's think of the following hypothetical scenario: we have two nodes {% katex %}x_{1}{% endkatex %} and {% katex %}x_{2}{% endkatex %} for input layer, three nodes defined in the hidden layer, and we have one node {% katex %}y{% endkatex %} for the output layer. Converting the graph below into mathematical terms, we have:

![two_layer_neural_network.png](/images/posts/2017-09-05-the-math-neural-networks/2_layer_neural_network.png)

The following is our input parameters where we specify the 2-layer neural network:

1. Input layer {% katex %}X \in (2, 1){% endkatex %}, with its weight {% katex %}W_{1}{% endkatex %} and bias {% katex %}b_{1}{% endkatex %}
2. Oput layer {% katex %}Y \in (1, 1){% endkatex %}, with its weight {% katex %}W_{2}{% endkatex %} and bias {% katex %}b_{2}{% endkatex %}
3. Hidden layer {% katex %}A \in (4, 1){% endkatex %}

To perform forward propagation, we have the following calculation:

- {% katex %}z^{[1]} =  W^{[1]} x^{(i)} + b^{[1]}{% endkatex %}
- {% katex %}a^{[1]} = \tanh(z^{[1]}){% endkatex %}
- {% katex %}z^{[2]} = W^{[2]} a^{[1]} + b^{[2]}{% endkatex %}
- {% katex %}\hat{y}^{(i)} = a^{[2]} = \sigma(z^{[2]}){% endkatex %}
- If {% katex %}a^{[2]} > 0.5 {% endkatex %} then {% katex %}\hat{y}^{(i)} = 1{% endkatex %}, otherwise {% katex %}\hat{y}^{(i)} = 0{% endkatex %}.

Given that we have computed {% katex %}A^{[2]}{% endkatex %}, which contains {% katex %}a^{[2](i)}{% endkatex %} for every example, we can compute the cost function as follows:

- {% katex %}J = - \frac{1}{m} \sum\limits_{i = 0}^{m} \large{(} \small y^{(i)}\log\left(a^{[2](i)}\right) + (1-y^{(i)})\log\left(1- a^{[2](i)}\right) \large{)} \small{% endkatex %}

Given the loss function, we want to implement the **backward propagation** starting from {% katex %}z_{2}{% endkatex %} back to {% katex %}z_{1}{% endkatex%}:

- {% katex %}dz^{[2]} = a^{[2]} - y{% endkatex %}
- {% katex %}dW^{[2]} = dz^{[2]}(a^{[1]})^{T}{% endkatex %}
- {% katex %}db^{[2]} = dz^{[2]}{% endkatex %}
- {% katex %}dz^{[1]} = (W^{[2]})^{T}dz^{[2]} * g^{[1]'}(z^{[1]}){% endkatex %}
- {% katex %}dW^{[1]} = dz^{[1]}x^{T}{% endkatex %}
- {% katex %}db^{[1]} = dz^{[1]}{% endkatex %}

Then we use **gradient descent** to calculate {% katex %}W^{[1]}{% endkatex %}, {% katex %}b^{[1]}{% endkatex %} and {% katex %}W^{[2]}{% endkatex %}, {% katex %}b^{[2]}{% endkatex %}, with a specified **learning rate** {% katex %}\alpha{% endkatex %}:

- {% katex %}W^{[1]} = W^{[1]} - \alpha * dW^{[1]}{% endkatex %}
- {% katex %}b^{[1]} = b^{[1]} - \alpha * db^{[1]}{% endkatex %}
- {% katex %}W^{[2]} = W^{[2]} - \alpha * dW^{[2]}{% endkatex %}
- {% katex %}b^{[2]} = b^{[2]} - \alpha * db^{[2]}{% endkatex %}

After one iteration of the loop is finished, we then run the model again with the training set, and we expect to see the value of **loss function** descreases.

## L-layer neural network

A l-layer neural network follows the same logical loop as the 2-layer neural network, however activation function for the hidden layers is different.

Rather than using {% katex %}tanh{% endkatex %} as the activation function, in recent years people have started using [rectified linear function](https://en.wikipedia.org/wiki/Rectifier_(neural_networks)), ReLU for short. ReLU has two advantages, first is that it is a non-linear function so it provides the similar benefit as other non-linear function such as {% katex %}tanh{% endkatex %} or {% katex %}sigmoid{% endkatex %}. Also, the derivative of ReLU is a constant, making it much faster when calculating the backward propagation step.

In addition, we need to make sure we initialize **non-zero values** for {% katex %}W^{[1]}{% endkatex %}. if {% katex %}W^{[1]}{% endkatex %} is a vector of zeros, then the forward and backward propagation will effectively update parameters during each iteration, making the model ineffective.

![L layer propagation](/images/posts/2017-09-05-the-math-neural-networks/L-layer-propagation.png)

Following the general pattern of building the neural network, we can specify the input parameters in mathmatical terms:

- We have {% katex %}L{% endkatex %} layers with input layer {% katex %}X{% endkatex %} and output layer {% katex %}Y{% endkatex %}.

The forward propagation is computed using following equations:

- The first activation layer: {% katex %}Z^{[1]} = W^{[1]}X + b^{[1]}{% endkatex %}, {% katex %}A^{[1]} = ReLU(Z^{[1]}){% endkatex %}
- The nth activation layer: {% katex %}Z^{[n]} = W^{[n]}A^{[n-1]} + b^{[1]}{% endkatex %}, {% katex %}A^{[n]} = ReLU(Z^{[n]}){% endkatex %}
- The last activation layer: {% katex %}Z^{[L]} = W^{[L]}A^{[L-1]} + b^{[1]}{% endkatex %}, {% katex %}A^{[n]} = sigmoid(Z^{[L]}){% endkatex %}

Next we want to implement the loss function to check if our model is actually learning:

{% katex %}-\frac{1}{m} \sum\limits_{i = 1}^{m} (y^{(i)}\log\left(a^{[L](i)}\right) + (1-y^{(i)})\log\left(1- a^{[L](i)}\right)){% endkatex %}

Then we calculate the backward propagation, which follows steps similar to forward propagation:

- linear backward
- linear to activation backward where activation computes the derivative of {% katex %}ReLU{% endkatex %} or {% katex %}sigmoid{% endkatex %} activation
- [linear to {% katex %}ReLU{% endkatex %}] X (L-1) to Linear to {% katex %}sigmoid{% endkatex %} backward (whole model)

For layer {% katex %}l{% endkatex %}, the linear part is: {% katex %}Z^{[l]} = W^{[l]} A^{[l-1]} + b^{[l]}{% endkatex %} (followed by an activation).

Given we have already calculated the derivative {% katex %}dZ^{[l]} = \frac{\partial \mathcal{L} }{\partial Z^{[l]}}{% endkatex %}. We want to get {% katex %}(dW^{[l]}, db^{[l]} dA^{[l-1]}){% endkatex %}.

- {% katex %}dW^{[l]} = \frac{\partial \mathcal{L} }{\partial W^{[l]}} = \frac{1}{m} dZ^{[l]} A^{[l-1] T}{% endkatex %}
- {% katex %}db^{[l]} = \frac{\partial \mathcal{L} }{\partial b^{[l]}} = \frac{1}{m} \sum_{i = 1}^{m} dZ^{[l](i)}{% endkatex %}
- {% katex %}dA^{[l-1]} = \frac{\partial \mathcal{L} }{\partial A^{[l-1]}} = W^{[l] T} dZ^{[l]}{% endkatex %}

Now that we have {% katex %}(dW^{[l]}, db^{[l]} dA^{[l-1]}){% endkatex %}, we can update our parameters using gradient descent:

- {% katex %}W^{[l]} = W^{[l]} - \alpha \text{ } dW^{[l]}{% endkatex %}
- {% katex %}b^{[l]} = b^{[l]} - \alpha \text{ } db^{[l]}{% endkatex %}

Similar to 2 layer neural network, after one iteration of the loop is finished, we then run the model again with the training set, and we expect to see the value of **loss function** descreases.
