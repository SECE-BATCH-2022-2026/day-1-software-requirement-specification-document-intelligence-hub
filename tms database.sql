CREATE DATABASE IF NOT EXISTS task_management_system;
USE task_management_system;
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(255) NOT NULL,
    Description TEXT,
    DueDate DATE,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);
CREATE TABLE TaskCategories (
    TaskID INT,
    CategoryID INT,
    PRIMARY KEY (TaskID, CategoryID),
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
INSERT INTO Users (UserID, UserName, Email) VALUES
(1, 'JohnDoe', 'john.doe@email.com'),
(2, 'JaneSmith', 'jane.smith@email.com'),
(3, 'BobJohnson', 'bob.johnson@email.com'),
(4, 'AliceBrown', 'alice.brown@email.com'),
(5, 'CharlieDavis', 'charlie.davis@email.com');

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Personal'),
(2, 'Work'),
(3, 'Home'),
(4, 'Study'),
(5, 'Fitness');
INSERT INTO Tasks (TaskID, TaskName, Description, DueDate, UserID) VALUES
(1, 'Task 1', 'Description for Task 1', '2023-12-10', 1),
(2, 'Task 2', 'Description for Task 2', '2023-12-15', 2),
(3, 'Task 3', 'Description for Task 3', '2023-12-20', 3),
(4, 'Task 4', 'Description for Task 4', '2023-12-25', 4),
(5, 'Task 5', 'Description for Task 5', '2023-12-30', 5);
INSERT INTO TaskCategories (TaskID, CategoryID) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);
SELECT Tasks.TaskID, TaskName, Description, DueDate, Users.UserName, Categories.CategoryName
FROM Tasks
JOIN Users ON Tasks.UserID = Users.UserID
LEFT JOIN TaskCategories ON Tasks.TaskID = TaskCategories.TaskID
LEFT JOIN Categories ON TaskCategories.CategoryID = Categories.CategoryID;
desc Users;
desc tasks;
desc categories;
desc taskcategories;