Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 769494BD6BA
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Feb 2022 08:05:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02438C6046F;
	Mon, 21 Feb 2022 07:05:17 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95453C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Feb 2022 15:44:32 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id e8so3299509ljj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Feb 2022 07:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to;
 bh=IcItXc+sNrCk2+Q4Jyfa3crAb0rYqmVxEFy4N4i47uU=;
 b=RI1owrYqtNeZRwrAKKfUgRot+GcPpwydXGZXta9gNZfGegbchDMEgmkfTobvff9XOa
 ztoU7p0V++IDCzv/9sgAK2hJXfPBb+BJQ57KrT5TOjfsI162Ddj4CUQxEtGviivvt72s
 XK5kMP+hG+0kr6q4WtvC5s7VJHGs006bICQSlOxRFDL1BexOAo9y9YZY08DcfTgip8uY
 ARzPRY2o1WD5SpY1cNGZ2M8y1h3ouh3fZVN6+K0hNrtzUVcsfJQkMSd/3Yn+hJ/u3NmG
 OQC5K907g8q1d/Z4dFlTt1TB0tRIjpvW+x4nTr4/4ZRTvWeTksRPlvswzLOjb1bFIYNy
 DK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to;
 bh=IcItXc+sNrCk2+Q4Jyfa3crAb0rYqmVxEFy4N4i47uU=;
 b=bJ5jHnF1NGr2llMNbciskMQeE7PIsBCLbROa0mKTAcfF7V86RrtOVyNOy6laN68XRG
 8ZK8mYfEM96HnF7d4qzoP3UFEKBz62JZbAJw7xeWEEucx6+7wx9HiNeLJjdzKOZwyvfP
 W8dZA9Jk7p3sPnmxgqtZNlzShdjq+gmacf1yQGEpXOm3CQZbfT4Ca9rwutdct6PoXdlY
 RAIq2LtXkxXxVWiofbSTXDTkmmnPKxLuHb83hY7cGXdl+JcnXaACQgLWL+wuJBkU15vw
 bZgLbyhcRXc4gTDylrZQRzFmnJ09ONbvJifC5XH3kJBb+fpHcl5xrNqBLwJ0AbIspL7T
 Lhhw==
X-Gm-Message-State: AOAM533CVOGLh2u+EcNadQN+qbnQp2u3SsvLR6By3LiX2+wrygIOKab2
 xsB5+XuAs2i9Eb5k0sXnZb4=
X-Google-Smtp-Source: ABdhPJwFUNXtcXfFkMdgXhgbQ4Y6ITGtpNl3UJPY5b45UdtubRh2rHcY2853wgdyMPNi4Jb/I1ZtvQ==
X-Received: by 2002:a2e:9019:0:b0:22e:1b3:190d with SMTP id
 h25-20020a2e9019000000b0022e01b3190dmr12173130ljg.160.1645371871767; 
 Sun, 20 Feb 2022 07:44:31 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.64])
 by smtp.gmail.com with ESMTPSA id j3sm854767lfr.132.2022.02.20.07.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 07:44:31 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------j63aUzZwTrBB7psgfIP2n1nX"
Message-ID: <cd08c05f-f648-071f-d8f5-0a022cd35b7b@gmail.com>
Date: Sun, 20 Feb 2022 18:44:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: syzbot <syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com>,
 alexandre.torgue@foss.st.com, benjamin.tissoires@redhat.com,
 jikos@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 syzkaller-bugs@googlegroups.com
References: <000000000000d181a205d874c066@google.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <000000000000d181a205d874c066@google.com>
X-Mailman-Approved-At: Mon, 21 Feb 2022 07:05:15 +0000
Subject: Re: [Linux-stm32] [syzbot] KASAN: slab-out-of-bounds Read in
	thrustmaster_probe
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--------------j63aUzZwTrBB7psgfIP2n1nX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/22 18:27, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    c5d9ae265b10 Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14ccc65c700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a78b064590b9f912
> dashboard link: https://syzkaller.appspot.com/bug?extid=35eebd505e97d315d01c
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175ecbf2700000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=109973f2700000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com
> 
> usb 1-1: config 0 interface 0 altsetting 0 endpoint 0x81 has invalid wMaxPacketSize 0
> usb 1-1: New USB device found, idVendor=044f, idProduct=b65d, bcdDevice= 0.40
> usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 1-1: config 0 descriptor??
> hid-thrustmaster 0003:044F:B65D.0001: unknown main item tag 0x0
> hid-thrustmaster 0003:044F:B65D.0001: hidraw0: USB HID v0.00 Device [HID 044f:b65d] on usb-dummy_hcd.0-1/input0
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in thrustmaster_interrupts drivers/hid/hid-thrustmaster.c:162 [inline]
> BUG: KASAN: slab-out-of-bounds in thrustmaster_probe+0x8d5/0xb50 drivers/hid/hid-thrustmaster.c:330
> Read of size 1 at addr ffff88807f1a59d2 by task kworker/1:1/35
> 

Looks like missing check for malicious device. Need to check number of 
endpoints before accessing endpoints array


#syz test
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master





With regards,
Pavel Skripkin
--------------j63aUzZwTrBB7psgfIP2n1nX
Content-Type: text/plain; charset=UTF-8; name="ph"
Content-Disposition: attachment; filename="ph"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC10aHJ1c3RtYXN0ZXIuYyBiL2RyaXZlcnMv
aGlkL2hpZC10aHJ1c3RtYXN0ZXIuYwppbmRleCAwM2I5MzVmZjAyZDUuLjI0NGMzYWE0ZDBj
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlkLXRocnVzdG1hc3Rlci5jCisrKyBiL2Ry
aXZlcnMvaGlkL2hpZC10aHJ1c3RtYXN0ZXIuYwpAQCAtMTU4LDYgKzE1OCwxMSBAQCBzdGF0
aWMgdm9pZCB0aHJ1c3RtYXN0ZXJfaW50ZXJydXB0cyhzdHJ1Y3QgaGlkX2RldmljZSAqaGRl
dikKIAkJcmV0dXJuOwogCX0KIAorCWlmICh1c2JpZi0+Y3VyX2FsdHNldHRpbmctPmRlc2Mu
Yk51bUVuZHBvaW50cyA8IDIpIHsKKwkJaGlkX2VycihoZGV2LCAiV3JvbmcgbnVtYmVyIG9m
IGVuZHBvaW50cz9cbiIpOworCQlyZXR1cm47CisJfQorCiAJZXAgPSAmdXNiaWYtPmN1cl9h
bHRzZXR0aW5nLT5lbmRwb2ludFsxXTsKIAliX2VwID0gZXAtPmRlc2MuYkVuZHBvaW50QWRk
cmVzczsKIAo=

--------------j63aUzZwTrBB7psgfIP2n1nX
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--------------j63aUzZwTrBB7psgfIP2n1nX--
