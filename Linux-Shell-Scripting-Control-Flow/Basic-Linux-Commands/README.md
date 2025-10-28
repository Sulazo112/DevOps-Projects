# Mini Project-Basic Linux Commands

## Linux Commands Deep Dive

### What is a Linux Command?

A Linux command refers to a program or utility that runs in the command-line interface (CLI). The CLI is a text-based environment where we interact with the system by typing commands.

Linux commands are executed by entering text in the Terminal and pressing Enter. These commands enable you to perform a wide range of tasks, including installing packages, managing users, manipulating files and directories, configuring system settings, and more.

The general syntax of a Linux command is as follows: (Try the commands used as example as you read along)

CommandName [option(s)] [parameter(s)] 

A command may consist of options and parameters, but they are not always required. Here are the key components of a command:

CommandName: This represents the action or task you want to perform using the command. For example if you wish to list files in a folder, you basically use the ls command.

Option or Flag: An option modifies the behavior of a command. It is typically preceded by a hyphen (-) or double hyphen (--) and can be used to customize the command's functionality. For example, if I want to show extra information for each listed file, i will run the command ls -l

Parameter or Argument: A parameter provides specific information or data required by the command to execute the desired action. For example, if I want to create a new directory (or folder), I will use the mkdir command. The parameter will be the name of the directory in which I will pass to it. mkdir photos will create a photos directory.

It's important to note that Linux commands are case-sensitive, so you need to enter them exactly as they are spelled and formatted.

### Manipulating files and directories on Linux

Most of the time on Linux, I will be working with files and directories. Hence, it is very important to know how to work with them. In the next section, we will focus on different commands that covers different use cases of manipulating files and directories on linux.

### The sudo command

In Linux, some actions need special permission to be carried out, like creating files in certain areas or changing important system settings. This is where the sudo command comes into play. "sudo" stands for "superuser do," and it allows you to run commands with the security privileges of another user, typically the superuser or "root."

### Why Use sudo?

Security: It helps in keeping the system secure by limiting access to powerful commands. Tracking: It logs who executed which command, adding a layer of accountability.

### How sudo Works:

When we precede a command with sudo, Linux asks for your password. Once you enter it correctly, you can run commands as if you were the system's superuser for a short period (usually 15 minutes). This means you won't need to enter your password for each sudo command within this timeframe.

### Creating a Folder with sudo:

Sometimes, you need superuser privileges to create a folder in certain locations on our system. Here's how you can do it:

Open your terminal, and connect to your linux server using SSH.
![Connecting Linux-server](./img/Connecting%20Linux%20server.png)

Try creating a folder in a restricted location. For example, let's try to create a folder named "example" in the /root directory, which is reserved for the root user:

mkdir /root/example
![Permission denied](./img/Permission%20denied.png)

Observe the failure encounter a permission denied error like this:

mkdir: cannot create directory ‘/root/example’: Permission denied

This error occurs because regular users do not have the necessary permissions to create directories in /root.

Let's use sudo to Successfully Create the Folder

sudo mkdir /root/example
![Sudo Mkdir](./img/Sudo%20Mkdir.png)

Because I included sudo in the command. It executes successfully without error. In some cases, we may be prompted to provide a password. If it does, and you know the password, simply provide it and the elevated permission will be used to create the folder.

Verify the folder's creation: The command should succeed without errors. You can check the folder's existence by listing the contents of /root using the ls command. It should include the newly created folder in the output on your screen. Though you may need to use sudo again to view the contents of this directory:

sudo ls /root
![Sudo ls-root](./img/Sudo%20ls-root.png)

Note: Using sudo gives significant power over our system, including the ability to change or delete crucial system files. So, it's wise to use it carefully and only when necessary.

### pwd command

Use the pwd command to find the path of your current working directory. Simply entering pwd will return the full current path – a path of all the directories that starts with a forward slash (/). For example, /home/username.

The pwd command uses the following syntax:

pwd
![pwd](./img/pwd.png)

### The Root Directory ("/")

At the top of the Linux filesystem hierarchy is the root directory, denoted by a single slash (/). Unlike Windows, which uses different drives (C, D:, etc.), Linux organizes everything starting from this root directory. Under /, you'll find various directories with specific purposes:

/bin: Essential user command binaries (programs) that need to be available to all users are stored here (e.g., ls, cp).

/etc: Configuration files for the system can be found in here..

/home: Personal directories for users.

/root: The home directory for the root user.

/var: Variable data like logs.

/usr: Secondary hierarchy for user data; contains majority of user utilities and applications.

We will use the ls command to explore them and get some experience navigating Linux.

### cd command

To navigate through the Linux files and directories, use the cd command.

Let’s say want to navigate to the root filesystem on our server. Remember, the root filesystem is like the "C:" drive on windows. It is the starting point of folders and it is represented by / on Linux. To go to the root filesystem, simply type;

cd /

To confirm that we are there, use the pwd command to check where you are.

To list the files and directories on in the root filesystem, simply type sudo ls -l.

Below is my output, but yours may be slightly different
![Output](./img/Output.png)

If I want to navigate to any of the directories in the output, lets say the usr, then I can use the cd command to enter that directory.

sudo cd /usr
![Sudo cd-user](./img/Sudo%20cd-user.png)

### Side Hustle Task 1 :

Create a directory called photos inside the /usr directory

sudo mkdir photos
![Sudo mkdir-photo](./img/Sudo%20mkdir-photo.png)

Navigate into the photos directory

cd photos
![cd-photo](./img/cd-photo.png)

Create 3 more random directories inside the photos directory
sudo mkdir Dev1 Dev2 Dev3

Show the newly created directories on the terminal
ls and ls -l
![ls and ls -l](./img/ls%20and%20ls%20-l.png)

Navigate into one of them

cd Dev1

Show the full path where you currently are on the screen

pwd
![Showing the full path with pwd](./img/Showing%20the%20full%20path%20with%20pwd.png)

### ls command

The ls command lists files and directories. Running it without a flag or parameter will show the current working directory’s content.

To see other directories’ content, type ls followed by the desired path. For example, to view files in the Documents folder, enter:

ls /home/ubuntu/Documents

Here are some options you can use with the ls command:

ls -R lists all the files in the subdirectories.

ls -a shows hidden files in addition to the visible ones.

ls -lh shows the file sizes in easily readable formats, such as MB, GB, and TB.
![Options with ls-command](./img/Options%20with%20ls%20command.png)

### cat command

Concatenate, or cat, is one of the most frequently used Linux commands. It lists, combines, and writes file content to the standard output (i.e to the terminal console). To run the cat command, type cat followed by the file name and its extension. For example:

sudo cat /etc/os-release
![Sudo-cat-etc-os-release](./img/sudo%20cat-etc-os-release.png)

### cp command

Use the cp command to copy files or directories and their content. Take a look at the following use cases.

To copy one file from the current directory to another, enter cp followed by the file name and the destination directory. For example:

cp filename.txt /home/ubuntu/Documents

This will copy filename.txt into the /home/ubuntu/Documents directory. If you list the directory, you will find the file copied there.

To copy multiple files to a directory, enter the file names followed by the destination directory:

cp filename1.txt filename2.txt filename3.txt /home/username/Documents

To copy the content of a file to a new file in the same directory, enter cp followed by the source file and the destination file:

cp filename1.txt filename2.txt

To copy an entire directory, pass the -R flag before typing the source directory, followed by the destination directory:

cp -R /home/ubuntu/Documents /home/ubuntu/Documents_backup

### mv command

The primary use of the mv command is to move and rename files and directories. Additionally, it doesn’t produce an output upon execution.

Simply type mv followed by the filename and the destination directory. For example, you want to move filename.txt to the /home/ubuntu/Documents directory:

mv filename.txt /home/ubuntu/Documents

You can also use the mv command to rename a file:

mv old_filename.txt new_filename.txt

### rm command

The rm command is used to delete files within a directory.

Caution: This is a very dangerous command as it deletes the files completely. So must be used with care.

To remove a single file:

rm filename.txt

To remove multiple files, enter the following command:

rm filename1.txt filename2.txt filename3.txt

Here are some acceptable options you can add:

-i prompts system confirmation before deleting a file. (Denotes "interractive")

-f allows the system to remove without a confirmation. (Denotes "force")

-r deletes files and directories recursively

### touch command

The touch command allows you to create an empty file.

For example, enter the following command to create an HTML file named Web in the Documents directory:

touch /home/ubuntu/Documents/Web.html

### find command

Use the find command to search for files within a specific directory and perform subsequent operations. Here’s the general syntax:

find [option] [path] [expression]

For example, you want to look for a file called notes.txt within the home directory and its subfolders:

find /home/ubuntu -name notes.txt

End.