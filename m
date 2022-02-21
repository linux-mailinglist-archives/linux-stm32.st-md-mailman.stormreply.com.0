Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A44BD769
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Feb 2022 09:01:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C76BCC6046B;
	Mon, 21 Feb 2022 08:01:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C7AFC60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Feb 2022 08:01:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3459260F9C;
 Mon, 21 Feb 2022 08:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F76BC340E9;
 Mon, 21 Feb 2022 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645430467;
 bh=qvDbxDiZRGEUPbWcdjncapc1GDhk0SQWWnmNRy79Mas=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sM4h5lKiTLkqUCWxFoLINDUqlZ3U6PPvmpfswxsW7S7Kb/80voes0CqIilU1K5ROX
 2nwG+c8ZsPvxgr87X7MucXAMuUL1a94BjiZW76hbDLwv6tAFCsmaUGpY4m42DcFd3J
 ntVAIPPH/LO++ZimKpdfYPsAhbhAKT8aDMUHEHGBg8pIsAJ20fOU0g8ZxB0kTZQQlM
 Q52FWb+Uity8rUcuG2EYeXYteaTlO6rNJ5fWWqHj93xOrDt6Q3GVfyxO7RFQpKM2sq
 K/6BI4mCI7cJYJPZu3Ai7V4bC/E1X+6QeRqHoa5KOA8JjzDSOYIw7YnqEWD3DgMlpl
 c2qoWKyS2MYUg==
Date: Mon, 21 Feb 2022 09:01:02 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <cd08c05f-f648-071f-d8f5-0a022cd35b7b@gmail.com>
Message-ID: <nycvar.YFH.7.76.2202210900420.11721@cbobk.fhfr.pm>
References: <000000000000d181a205d874c066@google.com>
 <cd08c05f-f648-071f-d8f5-0a022cd35b7b@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Cc: syzbot <syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, benjamin.tissoires@redhat.com,
 mcoquelin.stm32@gmail.com, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Sun, 20 Feb 2022, Pavel Skripkin wrote:

> On 2/20/22 18:27, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    c5d9ae265b10 Merge tag 'for-linus' of git://git.kernel.org..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14ccc65c700000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=a78b064590b9f912
> > dashboard link: https://syzkaller.appspot.com/bug?extid=35eebd505e97d315d01c
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils
> > for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175ecbf2700000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=109973f2700000
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com
> > 
> > usb 1-1: config 0 interface 0 altsetting 0 endpoint 0x81 has invalid
> > wMaxPacketSize 0
> > usb 1-1: New USB device found, idVendor=044f, idProduct=b65d, bcdDevice=
> > 0.40
> > usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > usb 1-1: config 0 descriptor??
> > hid-thrustmaster 0003:044F:B65D.0001: unknown main item tag 0x0
> > hid-thrustmaster 0003:044F:B65D.0001: hidraw0: USB HID v0.00 Device [HID
> > 044f:b65d] on usb-dummy_hcd.0-1/input0
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in thrustmaster_interrupts
> > BUG: KASAN: drivers/hid/hid-thrustmaster.c:162 [inline]
> > BUG: KASAN: slab-out-of-bounds in thrustmaster_probe+0x8d5/0xb50
> > BUG: KASAN: drivers/hid/hid-thrustmaster.c:330
> > Read of size 1 at addr ffff88807f1a59d2 by task kworker/1:1/35
> > 
> 
> Looks like missing check for malicious device. Need to check number of
> endpoints before accessing endpoints array
> 
> 
> #syz test
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Thanks Pavel. Could you please send the patch with proper changelog and 
SOB my way?

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
