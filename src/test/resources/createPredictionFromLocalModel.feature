Feature: Create Predictions from Local Model
    In order to create a prediction
    I need to have a local model first	
	
  Scenario Outline: Successfully creating a prediction from local model
		Given that I use development mode
		Given I create a data source uploading a "<data>" file
        And I wait until the source is ready less than <time_1> secs
        And I create a dataset
        And I wait until the dataset is ready less than <time_2> secs
        And I create a model
        And I wait until the model is ready less than <time_3> secs
        And I create a local model
        Then the local prediction for "<objective1>" is "<prediction1>"
        Then the local prediction by name for "<objective2>" is "<prediction2>"
        
  Examples: 
        | data	| time_1  | time_2 | time_3 | objective1 | prediction1  | objective2 | prediction2  |
        | data/iris.csv | 15      | 15     | 15     | {"petal width": 0.5}    | Iris-setosa | {"000003": 0.5}    | Iris-setosa |
