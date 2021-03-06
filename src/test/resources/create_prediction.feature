Feature: Create Predictions
    In order to create a prediction
    I need to create a model first

    Scenario Outline: Successfully creating a prediction:
        Given that I use development mode
        Given I create a data source uploading a "<data>" file
        And I wait until the source is ready less than <time_1> secs
        And I create a dataset
        And I wait until the dataset is ready less than <time_2> secs
        And I create a model
        And I wait until the model is ready less than <time_3> secs
        When I create a prediction by name=<by_name> for "<data_input>"
        Then the prediction for "<objective>" is "<prediction>"
        Then delete test data

        Examples:
        | data                | time_1  | time_2 | time_3 | by_name | data_input    | objective | prediction  |
        | data/iris.csv | 10      | 10     | 10     | true     | {"petal width": 0.5} | 000004    | Iris-setosa |

    
    Scenario Outline: Successfully creating a prediction from a source in a remote location:
        Given that I use development mode
        Given I create a data source using the url "<url>"
        And I wait until the source is ready less than <time_1> secs
        And I create a dataset
        And I wait until the dataset is ready less than <time_2> secs
        And I create a model
        And I wait until the model is ready less than <time_3> secs
        When I create a prediction by name=<by_name> for "<data_input>"
        Then the prediction for "<objective>" is "<prediction>"
        Then delete test data

        Examples:
        | url                | time_1  | time_2 | time_3 | by_name | data_input    | objective | prediction  |
        | s3://bigml-public/csv/iris.csv | 10      | 10     | 10     | true     | {"petal width": 0.5} | 000004    | Iris-setosa |
