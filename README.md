QUESTION PAPER SCREEN BASE FUNCTIONALITY:
1. show radio type option having two types as of now(MCQ/Objective, Subjective)
2. after choosing the type of part show the first card module of the respective type.(say for mcq create first mcq input fields having inscribed in a bootstrap card)
3. this first card module should have options to add or remove any element(inputs) in any point of time.
4. these element values must be stored in db accordingly in order to edit in future.

INTIAL WORK ACTIVITY:
1. create ui functionality and other operations without db design

IN DEPTH STEPS:

1. create jquery functionality for creating editing and deleting dynamic elements.
2. passing them to the web api as json objects using post request
3. store static elements used for formatting question paper with inline css styles in a constant file.
4. finally export and test the question paper in possible scenarios applicable to the implemented features
5. let a teacher use the module and see if he/she can able to construct the complete question paper without strain and at ease.