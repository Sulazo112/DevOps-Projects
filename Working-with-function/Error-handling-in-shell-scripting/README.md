# Mini Project - Error Handling in Shell Scripting

Error handling is a crucial aspect of scripting that involves anticipating and managing errors that may occur during script execution. These errors could arise from various factors such as incorrect user input, unexpected system behavior, or resource unavailability. Proper error handling is essential for improving the reliability, robustness, and usability of shell scripts.

## Implementing Error Handling

When implementing error handling in shell scripting, it's essential to consider various scenarios and develop strategies to handle them effectively. Here are some key steps to think through and implement error handling:

Identify Potential Errors: Begin by identifying potential sources of errors in your script, such as user input validation, command execution, or file operations. Anticipate scenarios where errors may occur and how they could impact script execution.

Use Conditional Statements: Utilize conditional statements (if, elif, else) to check for error conditions and respond accordingly. Evaluate the exit status ($?) of commands to determine whether they executed successfully or encountered an error.

Provide Informative Messages: When errors occur, provide descriptive error messages that clearly indicate what went wrong and how users can resolve the issue.

### Handling S3 Bucket Existence Error
In the context of our script to create S3 buckets, an error scenario could arise if the bucket already exists when attempting to create it. To handle this error, we can modify the script to check if the bucket exists before attempting to create it. If the bucket already exists, we can display a message indicating that the bucket is already present.

If you try to run your script more than once, you will end up creating more EC2 instances than required, and S3 bucket creation will fail because the bucket would already exist.

So, you can be as creative as you like, by thinking about the different errors that may occur during script execution and then handle each one carefully.

# Function to create S3 buckets for different departments

create_s3_buckets() {"\n company="datawise"\n departments=("Marketing" "Sales" "HR" "Operations" "Media")\n \n for department in "${departments[@]"}"; do bucket_name="${company}-${department}-Data-Bucket"

![Function to create S3 buckets for different department](./img/Function%20to%20create%20S3%20bucket%20for%20different%20department.png)

In this updated version, before attempting to create each bucket, we use the aws s3api head-bucket command to check if the bucket already exists. If the bucket exists, a message is displayed indicating its presence. Otherwise, the script proceeds to create the bucket as before. This approach helps prevent errors and ensures that existing buckets are not recreated unnecessarily.

Task:

In summary

This project focuses on implementing error handling in shell scripting to enhance script reliability and usability. It emphasizes identifying potential errors, such as invalid user input or system issues and using conditional statements to manage them effectively. A key example is handling the error that occurs when attempting to create an S3 bucket that already exists. The updated create_s3_buckets function checks for the existence of each bucket using aws s3api head-bucket before attempting creation. If the bucket exists, it notifies the user, otherwise, it proceeds with creation and confirms success or failure. This approach prevents redundant operations and ensures smoother script execution.

End.
