#  STACKOVERFLOWLITE APP

## Account Feature Specs

### Story: Customer request to create and log in an account

### Narrative #1
```
As an online customer 
I want to register on the app
So I can post a question or an answer
```

#### Scenarios (Acceptance criteria):
```
Given the customer has connectivity
    When the customer request to register
    Then app should display a message the user has been registered

Given the customer already has an account
    When the customer request to register
    Then the app should display an error message
```

### Register Customer Use Case

#### Data:
- URL

#### Primary course(happy path):
1. Execute "Create User Data" command with above data
2. System submits data from the URL
3. System validates submitted data.
4. System delivers success message

#### No connectivity - error course(sad path):
1. System delivers connectivity error

#### Invalid data – error course (sad path):
1. System delivers invalid data error.

## Model Specs

### Register

| Property         | Type          |
| ---------------- | ------------- |
| `username`       | `String`      |
| `email`          | `String`      |
| `password`       | `String`      |
| `confirm_password` | `String`    |


---


## Article Question Feature Specs

### Story: Customer request to post a question

### Narrative
```
As an online customer
I want to be able to post a question
So I can get an answer to the question
```

#### Scenario(Acceptance criteria)
```
Given the customer has connectivity
When the customer request to post a question
Then app should display a success message that the question has been posted


Given the customer does not have connectivity
When the customer request to post a question
Then the app should display an error message
```

### Post Question Data From Remote Use Case

#### Data:
- URL

#### Primary course (happy path)
1. Execute "Post Question Data" command with the above data.
2. System submits data from the URL
3. System validates submitted data.
4. System delivers success message

#### No connectivity - error course (sad path):
1. System delivers connectivity error

#### Invalid data – error course (sad path):
1. System delivers invalid data error.

---

## Model Specs

### Question

| Property         | Type          |
| ---------------- | ------------- |
| `question_title` | `String`      |
| `question_desc`  | `String`      |

### Payload contract
```
POST /question

201 RESPONSE

{
    "question_title": "What is the '-->' operator in C/C++? ",
    "question_desc": "After reading Hidden Features and Dark Corners of C++/STL on comp.lang c+= moderated, I was completely surprised that the following snippet compiled and worked in both Visual Studio 2008 and G++ 4.4."
}
```



