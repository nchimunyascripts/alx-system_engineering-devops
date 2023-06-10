# Postmortem
![what just happened.(meme)](https://s3.memeshappen.com/memes/what-just-happened-.jpg) 
## Issue Summary:

On 09-06-2023 at 3:00 pm CAT, I experienced an SSH connectivity issue with my web-server_1. The service was reinstated at 3:30 pm, and both web-servers resumed normal functioning. The root cause of the outage was my oversight during the installation of the firewall. I forgot to allow connections on port 22/TCP and inadvertently logged out.

## Timeline for 9/06/23 (CAT):

- **3:00 pm:** After installing the firewall and logging out, I attempted to reconnect but received a `Connection refused` message.
- **3:20 pm:** To investigate, I ran the command `sudo lsof -i -P -n | grep LISTEN` to check if the server was listening on port 22.
- **3:22 pm:** I discovered that the server was not listening on port `22/TCP`.
- **3:30 pm:** I requested a new web-server installation and reinstalled all necessary files, effectively redoing all the tasks on web-01 that were lost.

## Root cause and resolution:

The root cause of the issue was my failure to allow connections on port 22 during the firewall installation (ufw). To resolve the problem, I ensured that SSH connections were permitted by executing the command `$ sudo ufw allow 22/tcp` during the configuration of the new server.

## Corrective and preventative measures:

To prevent similar issues from occurring in the future, I will consistently check the server's listening ports before executing any commands. This proactive approach will help avoid overlooking crucial configurations and maintain smooth operations.
