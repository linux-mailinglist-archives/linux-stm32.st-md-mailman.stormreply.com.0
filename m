Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1EF4BD6BB
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Feb 2022 08:05:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16033C60473;
	Mon, 21 Feb 2022 07:05:17 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78001C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Feb 2022 15:54:13 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 w25-20020a6bd619000000b00640ddd0ad11so1404636ioa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Feb 2022 07:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=/jAKQWywRbjkCW1vm16BADmhGiyY4nbess2Zmzgstyo=;
 b=Hhi3CSTghMcpMqN2PCfcymHLskJnxEFQ1FxOQAMBply+8CYXgNwHL+jOYvnBk4p5/T
 MuOPpXs2B6NgwQf1933zs76B9rPWjAtEHPBmJqKesp8m1OWBiibgOBpL84uCDq08YgQ/
 MftO8tTS8sxsbwhv+LC77EY7DXrTqUPHAwXdFHvHhsF/w7O/6Kq2r7lOrgewlIb+Bo2Y
 m0HIv6/laJX7/X0EQ4BsU0mR5nifouWfx+6aCDeXH+scspQmkbIjRQj4bNg+qrjl/RLg
 wrs4h4twBOL8DAracIz8B3//ehci3W+JgE2aFJ+5a9CzfRODt7Zrn8USRXVoiThtVw2X
 E9eQ==
X-Gm-Message-State: AOAM533CmWLMrHGia+651u5qHFkDzK4nVaturx4HZV4DPZ/XA4dLEejb
 NzZt+0MpWdHsYdKFEgLHHE/3ZVi4PUIEc66dYN9tAtrEWSGG
X-Google-Smtp-Source: ABdhPJwMXxFZQ8UZcNlJ/kMhe+N7a/AVJBAovKtGkkifMPhJAhYz0pfqVHEfvJAak5fcXLhRufk6f+GBuzfFcD2w9HoNOJayBxN9
MIME-Version: 1.0
X-Received: by 2002:a02:8664:0:b0:30d:e657:7847 with SMTP id
 e91-20020a028664000000b0030de6577847mr12046321jai.283.1645372450899; Sun, 20
 Feb 2022 07:54:10 -0800 (PST)
Date: Sun, 20 Feb 2022 07:54:10 -0800
In-Reply-To: <cd08c05f-f648-071f-d8f5-0a022cd35b7b@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000758ca405d87520c7@google.com>
From: syzbot <syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com>
To: alexandre.torgue@foss.st.com, benjamin.tissoires@redhat.com, 
 jikos@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com, 
 paskripkin@gmail.com, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 21 Feb 2022 07:05:16 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com

Tested on:

commit:         4f12b742 Merge tag 'nfs-for-5.17-3' of git://git.linux..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a78b064590b9f912
dashboard link: https://syzkaller.appspot.com/bug?extid=35eebd505e97d315d01c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16de330a700000

Note: testing is done by a robot and is best-effort only.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
