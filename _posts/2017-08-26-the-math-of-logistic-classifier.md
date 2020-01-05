---
layout:     post
title:      The math of logistic classifier
tags: ["AI", "Machine Learning"]
image: '/images/posts/2017-08-26-the-math-of-logistic-classifier/neuron.png'
---

This post demonstrates the mathematical model behind **logistic regression**, which serves as the building block of the [deep learning](https://en.wikipedia.org/wiki/Deep_learning). I write this post to help others understand deep learning, I also write it for myself to learn deep learning more deeply.

## Model after biological neuron

Modern deep learning techniques model after biological cognition, the basic unit of which is neuron. It is the building block of deep learning starts with neuron-inspired math modeling using logistic regression. The math behind a simple logistic regression classifier looks like below:

![](/images/posts/2017-08-26-the-math-of-logistic-classifier/neuron.png)

Image this function represents a neuron in your brain, the **input** is the stimulus your brain received (sound, touch, etc.), represented by the data captured in {% katex %} x {% endkatex %}; and the **output** is a binary decision of whether that neuron gets triggered or not, represented by the binary value of {% katex %} \hat{y} {% endkatex %}.

In order to have the neuron work properly, we need to have decent value for weights and bias terms, denoted as {% katex %} w {% endkatex %} and {% katex %} b {% endkatex %} respectively. However, we don't have good values for {% katex %} w {% endkatex %} nor {% katex %} b {% endkatex %} automatically, we need to **train our model and acquire good weights and bias terms.** Image our function as a newborn baby, and it takes training to teach a baby to walk, speak etc. We need to train our neuron model and figure out good values for {% katex %} w {% endkatex %} and {% katex %} b {% endkatex %}.

So the question is **how to train for logistic regression**? Given we have a set of training dataset, we can measure the error of our current model by comparing predicted value and actual value, then take the result to do better. We can break down the question of **how to train for logistic regression** into a set of smaller problems:

- question 1: how to define the error of predictions from our model?
- question 2: how to take the error to refine our model?

The technique to address question 1 is called **forward propagation**, and the technique to address question 2 is called **backward progation**. 


## Forward Propagation

Forward progation enables two things. First, it provides a predicted value {% katex %} \hat{y} {% endkatex %} based on the input {% katex %} x {% endkatex %}. To break down the calculation mathematically:

- {% katex %} z^{(i)} = w^{T}x^{(i)} + b {% endkatex %}
- {% katex %} a^{(i)} = \frac{1}{1+ e^{-z^{(i)}}} {% endkatex %}

If the value of {% katex %} a^{(i)} {% endkatex %} is greater than or equal to 0.5, then {% katex %} y^{(i)} {% endkatex %} is predicted as 1, otherwise {% katex %} y^{(i)} {% endkatex %} is 0.

Second, it allows the model to calculate an **error** based on a **loss function**, this error quantifies how well our current model is performing using {% katex %} w {% endkatex %} and {% katex %} b {% endkatex %}. The loss function for the logistic regression is below:

- {% katex %} \iota(a, y) = ylog(a) + (1 - y)log(1-a) {% endkatex %}

How does this loss function makes sense? The way I think about is that if the prediction is close to actual value, the value should be low. If the prediction is far from actual value, the value should be high. Gi

### cost function based on loss function

Next we define a **cost function** for the entire dataset based on the **loss function** because we have many rows of training data, say {% katex %} m {% endkatex %} records. The value of the error based on the cost function is avaraged out across all errors:

- {% katex %} \iota(a^{(i)}, y^{(i)}) = - \frac{1}{m} \sum_{i=1}^{m} y^{(i)}log(a^{(i)}) + (1 - y^{(i)})log(1-a^{(i)}) {% endkatex %}
- {% katex %} J = \frac{1}{m}\sum_{i=1}^{m}\iota(a^{(1)}, y^{(i)}) {% endkatex %}

Given we have a way to measure the error of our prediction model, we can set the goal to **minimize prediction error by adjusting our model parameters**, and this is where backward propagation comes in.

## Backward Propagation

To tackle the problem of **how to refine our model to reduce training error**, we can more formally define our problem as following:

1. Given a dataset {% katex %} X {% endkatex %}
2. The model computes {% katex %} A = \sigma(w^T X + b) = (a^{(0)}, a^{(1)}, ..., a^{(m-1)}, a^{(m)}) {% endkatex %}
3. The model calculates the cost function: {% katex %} J = -\frac{1}{m}\sum_{i=1}^{m}y^{(i)}\log(a^{(i)})+(1-y^{(i)})\log(1-a^{(i)}) {% endkatex %}
4. Apply cost function {% katex %}J{% endkatex %} to adjust {% katex %}w{% endkatex %} and {% katex %}b{% endkatex %}

To implement step 4, we need to apply **gradient descent**.

### Gradient Descent

Quote from [Wikipedia on gradient descent](https://en.wikipedia.org/wiki/Gradient_descent):

> Gradient descent is a first-order iterative optimization alogirthm for finding the **minimum of a function**.

Great! We want to find the minimum of our cost function by adjusting {% katex %}w{% endkatex %} and {% katex %}b{% endkatex %}. Following the gradient descent algorithm, we take the following steps:

1. taking partial derivatives off our parameters, which tells us the delta values of adjusting that value
2. update our parameters based on the delta value from the partial derivatives

![](/images/gradient_descent.png)

The goal is to learn {% katex %}w{% endkatex %} and {% katex %}b{% endkatex %} by minimizing the cost function {% katex %}J{% endkatex %}. For a parameter {% katex %}\theta{% endkatex %}, the update rule is {% katex %} \theta = \theta - \alpha \text{ } d\theta{% endkatex %}, where {% katex %}\alpha{% endkatex %} is the learning rate.

Translate the steps above mathematically, we get:

**update w**

- {% katex %} \frac{\partial J}{\partial w} = \frac{1}{m}X(A-Y)^T {% endkatex %}
- {% katex %} w := w - \alpha\frac{\partial J}{\partial w} {% endkatex %}

**update b**

- {% katex %} \frac{\partial J}{\partial b} = \frac{1}{m} \sum_{i=1}^{m} (a^{(i)}-y^{(i)}) {% endkatex %}
- {% katex %} b := b - \alpha\frac{\partial J}{\partial b} {% endkatex %}

## Put it all togher

We can now have a big picture of how we want to use logistic regression classifier to predict future dataset based on training dataset. A high-level architectural steps can be summarized as:

1. Gather training dataset {% katex %} (X_{train}, Y_{train}) {% endkatex %} and test dataset {% katex %} (X_{test}, Y_{test}) {% endkatex %}.
2. Initialize model parameters {% katex %} w {% endkatex %} and {% katex %} b {% endkatex %}.
3. Define learning rate {% katex %} \alpha {% endkatex %}, and number of training iterations.
4. For each training iteration, run through:
    - apply forward propagation with {% katex %} (X_{train}, Y_{train}) {% endkatex %}, {% katex %} w {% endkatex %} and {% katex %} b {% endkatex %}
    - calculate cost funtion {% katex %} J {% endkatex %}
    - apply backward propagation to adjust {% katex %} w {% endkatex %} and {% katex %} b {% endkatex %}
5. Verify the accuracy of the model using {% katex %} (X_{test}, Y_{test}) {% endkatex %}
