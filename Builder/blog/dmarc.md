# Don't Forget DMARC
#### 19 March 2019

![Blackmail](/images/blackmail.jpg)

I recently received a spam email that gave me a fright. It was the typical script in broken English claiming "my account" was hacked, but what made this one convincing was that it came from my own address. Luckily I had heard that it was possible to spoof email headers, and there were several things about the message itself that didn't make the threat credible.

The message comprised only of an image attachment. Naturally, the Bitcoin address is not copy-pastable, which is pretty funny. The message claims to have a "tracking pixel" embedded in the image, which is a lie with some basis in reality. Tracking images work in HTML emails by making a network request, but I'm reasonably sure attachments don't have any way of accessing the network. Regardless, it's a good idea to disable loading remote content automatically in your mail client. Kudos to the spammer for mentioning Facebook -- less savvy users might fall for that.

The spammer spoofed my email address as the sender, but wasn't completely thorough.

![Raw source](/images/blackmail_raw_source.png)

Looking through my email logs, I saw that there had been multiple messages claiming to be from me, but had been blocked as spam, which proved to me that it was definitely spoofing at work, and I hadn't been pwned.

![Email logs](/images/blackmail_email_logs.png)

### Solution

Being a decentralized system, email doesn't have a surefire way of ensuring senders are who they say they are. The current methods of fighting address spoofing are SPF, DKIM, and DMARC. My webhost already set up SPF and DKIM DNS records for my domain, which until now was enough to keep my inbox completely spam-free. Adding a DMARC record is easy and there are a lot of verification tools online. If you own a domain, don't put off doing it.