# Mini Project-Advanced Linux Commands

## Advanced Linux Commands

### File Permissions and Access Rights

Understanding how to manage file permissions and ownership is crucial in Linux. This knowledge empowers you to control access to files and directories, ensuring the security and integrity of your system. Let's explore some essential commands and concepts related to file permissions and ownership.

In Linux, managing file permissions and ownership is vital for controlling who can access, modify, or execute files and directories. Understanding these concepts allows you to maintain the security and integrity of your system. Let's delve into the key commands and concepts related to file permissions and ownership.

### Numeric Representation of Permissions

In Linux, permissions are represented using numeric values. Each permission (no permission, read, write, and execute) is assigned a numeric value:

no permissions = 0
read = 4
write = 2, and
execute = 1.

These values are combined to represent the permissions for each user class. Lets consider a few examples.

### Permissions Represented by 7

4 (read) + 2 (write) + 1 (execute) = 7
Symbolic: rwx
Meaning: Read, write, and execute permissions are all granted.
Example Context: A script file that the owner needs to read, modify, and execute.

### Permissions Represented by 5

4 (read) + 1 (execute) = 5
Symbolic: r-x
Meaning: Read and execute permissions are granted, but write permission is not.
Example Context: A shared library or a command tool that users can execute and read but not modify.

### Permissions Represented by 6

4 (read) + 2 (write) = 6
Symbolic: rw-
Meaning: Read and write permissions are granted, but execute permission is not.
Example Context: A document or a configuration file that the owner needs to read and modify but not execute.

### Shorthand Representation of Permissions**

In addition to the numeric way of showing permissions, Linux also has a shorthand, or symbolic, method for representing file permissions.

### Understanding User Classes from a Permissions Perspective

Before diving into shorthand permissions, it's important to understand the concept of "user classes" in the context of Linux permissions. Think of user classes as categories of users that Linux recognizes when deciding who can do what with a file. There are three main classes:

Owner: The person who created the file. Often referred to as 'user'.

Group: A collection of users who share certain permissions for the file.

Others: Anyone else who has access to the computer but doesn't fall into the first two categories.

### The Role of Hyphens (-) in Permission Representation

When discussing permissions, you might notice hyphens (-) being mentioned. In the context of Linux file permissions, a hyphen doesn't actually represent a user class. Instead, it's used in the symbolic representation of permissions to show the absence of a permission.

Lets get a bit practical with examples. Lets get onto our Linux terminal and run ls -latr
![Ls -Latr](./img/Ls%20-Latr.png)

Let's break it down to understand what each part means:

In the output above, we notice that some of the first character can be a - or d: d means it's a directory, - means it's a file.
The next three characters (rwx) show the permissions for the owner. r stands for read, w for write, and x for execute.
If a permission is not granted, you'll see a - in its place (e.g., r-x means read and execute permissions are granted, but write permission is not).
The hyphen separates, owner, group, and others
The following three characters after the owner's permissions represent the group's permissions, using the same r, w, and x notation.
The last three characters show the permissions for others.
The order the user class is represented is as follow;

The first hyphen "-" is the user
The second hyphen "-" is the group
The third hyphen "-" is others

### File Permission Commands

To manage file permissions and ownership, Linux provides several commands:

### chmod command

The chmod command allows you to modify file permissions. You can use both symbolic and numeric representations to assign permissions to the user, group, and others.

Lets see an example.

Create an emply file using the touch command:

touch script.sh
![Touch Script.sh](./img/Touch%20Script.sh.png)

Lets check the permission of the file

ls -latr script.sh

Now lets update the permission so that all the user classes will have execute permission

chmod +x script.sh

The above command uses the chmod command with the +x option to grant execute permission to the file script.sh. The +x option adds the execute permission to the existing permissions for all the user classes.

Now lets check what the file permissions look like:

ls -latr script.sh
![File permission](./img/File%20permission.png)

The same command can be executed to achieve the same result using the numbers approach.

chmod 755 script.sh

To add execute permissions for all (user, group, others), you would add 1 to each of the three categories, resulting in 755:

(4+2+1) = 7 for the user (read, write, and execute),
(4+1) = 5 for the group (read and execute),
(4+1) = 5 for others (read and execute).
Lets consider another example. Imagine the owner of a file is currently the only one with full permissions to note.txt.

To allow group members and others to read, write, and execute the file, change it to the -rwxrwxrwx permission type, whose numeric value is 777:

Lets check the output

ls -latr note.txt
![Chmod 777 note.txt](./img/Chmod%20777%20note.txt.png)

Now, we notice the dash ("-") in the first position represents the file type and not a user class. It indicates that the entry is a regular file.

### chown command

The chown command allows us to change the ownership of files, directories, or symbolic links to a specified username or group.

For example, lets assume there is a user on the server called "john", a group on the server called "developers" and you want the owner of filename.txt changed from "Akinwale" to "john", and to also ensure that any user in the developer group has ownership of the file as well:

The command would look like below;

chown john:developer filename.txt
![Chown command](./img/Chown%20command.png)

### Superuser Privilledges

It is often necessary to become the superuser to perform important tasks in linux, but as we know, we should not stay logged in as the superuser. In most linux distributions, there is a command that can give you temporary access to the superuser's privileges. This program is called sudo (short for super user) and can be used in those cases when you need to be the superuser for a small number of tasks. To use the superuser privilledes, simply type sudo before the command you will be invoking

To switch to the root user, simply run:

sudo -i

We can type exit to leave the shell
![Root user-sudo -i](./img/Root%20user-sudo%20-i.png)

### User Management on Linux

As a DevOps engineer, we are also going to be doing systems administration which involves managing different users on the servers. we should know how to create a new user, or group, modify their permissions, update password and such similar tasks.

### Creating a User

To create a new user on Ubuntu Server, we can use the adduser command. Assuming the name of the user to be created is Johndoe. we will open the terminal and run the following command:

sudo useradd johndoe
![Sudo useradd](./img/sudo%20adduser%20johndoe.png)

### Granting Administrative Privileges

By default, newly created user accounts do not have administrative privileges. To grant administrative access to a user, you can add the user to the sudo group. Users in the sudo group can run commands with administrative privileges. To add the Johndoe user to the sudo group, run:

sudo usermod -aG sudo Johndoe

usermod: This is a command that modifies user account properties.
-aG: These are flags used with the usermod command.
-a stands for "append" and is used to add the user to the specified group(s) without removing them from other groups they may already belong to.
-G stands for "supplementary groups" and is followed by a comma-separated list of groups. It specifies the groups to which the user should be added or modified.
In the given command, -aG sudo is used to add the user akinwale to the sudo group.
The sudo group is typically associated with administrative or superuser privileges. By adding akinwale to the sudo group, the user gains the ability to execute commands with elevated privileges.

### Tasks:

Log out and log back in as the newly created user

Navigate to the /home/johndoe directory to explore what has been created.

📌 Tip: Use the cd command. Switching User Accounts

To start using the system as another user, you will need to use the su command to switch.

To switch to another user account, use the su command followed by the username. For example, to switch to the johndoe account, run:

su johndoe

You will be prompted to enter the password for the user. Once authenticated, you will switch to the user's environment.
![su johndoe](./img/su%20johndoe.png)

### Modifying User Accounts

Changing User Password

To change the password for a user, we use the passwd command followed by the username. For example, to change the password for akinwale, run:

sudo passwd johndoe

We will be prompted to enter and confirm the new password for the user.
![Sudo Passwrd johndoe](./img/Sudo%20passwrd%20johndoe.png)

Test the updated password by logging on to the server, using the newly updated password.
![Update Password](./img/Update%20password.png)

### Creating a Group

To create a new group, use the groupadd command. For example, to create a group named "developers," use:

sudo groupadd developers

### Adding user to the Group

Use the usermod command to add users to the group. For instance, to add users "suleiman and sulazo to the 'developers' group:

sudo usermod -aG developers suleiman

The -aG options append the "developers" group to the users' existing group memberships.

### verifying Group Memberships

To confirm the group memberships for a specific user, use the id command. For example, to check the group memberships for the user "suleiman"

id suleiman

This command displays information about the user "suleiman" including the groups they belong to, such as "developers."
![id Suleiman](./img/id%20Suleiman.png)

### Deleting a User

To delete a user, run the command below

sudo userdel username

### Ensuring Proper Group Permissions

Groups in Linux are often used to manage permissions for files and directories. Ensure that the relevant files or directories have the appropriate group ownership and permissions.

For example, to grant the "developers" group ownership of a directory:

sudo chown :developers /path/to/directory

And to grant read and write permissions to the group:

sudo chmod g+rw /path/to/directory

### Side Hustle Task:

Create a group on the server and name it devops
![sudo groupadd devops](./img/sudo%20groupadd%20devops.png)

Create 5 users ["mary", "mohammed", "ravi", "tunji", "sofia" ], and ensure each user belong to the devops group
![Sudo Adduser Mohammed](./img/Sudo%20adduser%20Mohammed.png)
![Sudo adduser Ravi](./img/Sudo%20adduser%20Ravi.png)
![Sudo adduser Tunji](./img/Sudo%20adduser%20Tunji.png)
![Sudo adduser Sofia](./img/Sudo%20adduser%20Sofia.png)

Add user to group
![Adding user to the group](./img/Adding%20user%20to%20the%20group.png)

create a folder for each user in the /home directory. For example /home/mohammed

Mohammed Directory!
![Mohammed Directory](./img/Mohammed%20Directory.png)

Ravi Directory!
![Ravi's directory](./img/Ravi's%20Directory.png)

Tunji Directory!
![Tunji's Directory](./img/Tunji's%20Directory.png)

Sofia Directory!
![Sofia's directory](./img/Sofia's%20Directory.png)

Ensure that the group ownership of each created folder belongs to "devops". using;

grep devops /etc/group
![Grep DevOps](./img/Grep%20DevOps.png)

End.