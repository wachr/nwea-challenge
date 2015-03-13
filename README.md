# NWEA DevOps Tech Quiz

As part of an interview process, I was given the following request.

> Complete the following goals with your configuration management tool of
> choice.
>
> Objective goals:  
> Automate the configuration and installation of Nginx on a Linux system,
> ideally RedHat, CentOS, or Fedora.
>
> - Nginx should listen on port 8888.
> - The content served should be from the following [repository][0]:
>
> Requirements:  
> - Submit working code as a complete tarball, or link to your repository on
>   [Github][myGithub], with a short description of how to use the solution.  
> - Answer the following questions in a few paragraphs:  
>   - Why did you choose this solution?  
>   - What is the best/worst part of your solution?  
>   - Why would automating a task like this be helpful?  

My solution uses Puppet and Vagrant to provision a CentOS 7 VM. Just run these
commands and point your browser to [localhost:8888]() to see it in action:

    git clone git@github.com:wachr/nwea-challenge.git
    cd nwea-challenge && vagrant up

Note, the above requires that you have Vagrant installed. If you don't have
Vagrant, but you have a CentOS 7 machine available you can run `provision.sh`
as root and to install Puppet and then apply Puppet manifest file manually.

    git clone git@github.com:wachr/nwea-challenge.git
    cd nwea-challenge
    chmod +x provision.sh
    sudo provision.sh
    puppet apply manifests/nwea-tech-quiz.pp

[myGithub]: https://github.com/wachr
[0]: https://github.com/nwea-techops/tech_quiz

