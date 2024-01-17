Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6AD83006E
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jan 2024 08:20:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30864C6B457;
	Wed, 17 Jan 2024 07:20:05 +0000 (UTC)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C74D4C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 07:20:02 +0000 (UTC)
X-QQ-mid: bizesmtp73t1705475881tkpi85e2
X-QQ-Originating-IP: FYn/tP70RTD9loVdowaM081VuTJVAfGriLwvRblxkgg=
Received: from john-PC ( [123.114.60.34]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 17 Jan 2024 15:17:59 +0800 (CST)
X-QQ-SSF: 01400000000000E0L000000A0000000
X-QQ-FEAT: eSZ1CZgv+JDSNC9R2Ts4bQ0s1IO7bzp2HpCI/alvnKdhK2ce+ScKIRclelfo3
 i51jCIHNe3Uj0pPQHcTQ95pOKWuRXyWDW3I9EGM/2puBgCYmHjq/2LsRwKbvE8rv6M5YShX
 +RNX5hNAQwHK5GlakP/+rmSaZPV4Jze6Hh7zG0jGrCC3kwxNTeRiFJYGCNKwUr99q3dVr8t
 f+0cmctmjGHstn0Ykxofmi0OZOsisfjMKTq/Vw9O+J/1J7ablmQ+b8WymrCzYFhREA+LddF
 fiKyVAcNfB0IeKrlBRtrroOyZIeNv3DOE7Ku78ZkHncoEnEqd5a3HQFjmmAuCq989imHmoP
 5S2bya1XPNgQKhDPSAPYfRuBj5e+cYxdQ42NnVXpxG1xk254xAu7hSsHPwT9nenjC5nq8yA
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10667195349907418171
Date: Wed, 17 Jan 2024 15:17:59 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <264E2933B2545567+20240117151759.0dc40c3d@john-PC>
In-Reply-To: <97106e8a-df9a-429a-a4ff-c47277de70d9@lunn.ch>
References: <20240112021249.24598-1-maqianga@uniontech.com>
 <97106e8a-df9a-429a-a4ff-c47277de70d9@lunn.ch>
Organization: UOS
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: ethtool: Fixed calltrace
 caused by unbalanced disable_irq_wake calls
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

On Tue, 16 Jan 2024 23:27:39 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> On Fri, Jan 12, 2024 at 10:12:49AM +0800, Qiang Ma wrote:
> > We found the following dmesg calltrace when testing the GMAC NIC
> > notebook:
> > 
> > [9.448656] ------------[ cut here ]------------
> > [9.448658] Unbalanced IRQ 43 wake disable
> > [9.448673] WARNING: CPU: 3 PID: 1083 at kernel/irq/manage.c:688
> > irq_set_irq_wake+0xe0/0x128 [9.448717] CPU: 3 PID: 1083 Comm:
> > ethtool Tainted: G           O      4.19 #1 [9.448773]         ...
> > [9.448774] Call Trace:
> > [9.448781] [<9000000000209b5c>] show_stack+0x34/0x140
> > [9.448788] [<9000000000d52700>] dump_stack+0x98/0xd0
> > [9.448794] [<9000000000228610>] __warn+0xa8/0x120
> > [9.448797] [<9000000000d2fb60>] report_bug+0x98/0x130
> > [9.448800] [<900000000020a418>] do_bp+0x248/0x2f0
> > [9.448805] [<90000000002035f4>] handle_bp_int+0x4c/0x78
> > [9.448808] [<900000000029ea40>] irq_set_irq_wake+0xe0/0x128
> > [9.448813] [<9000000000a96a7c>] stmmac_set_wol+0x134/0x150
> > [9.448819] [<9000000000be6ed0>] dev_ethtool+0x1368/0x2440
> > [9.448824] [<9000000000c08350>] dev_ioctl+0x1f8/0x3e0
> > [9.448827] [<9000000000bb2a34>] sock_ioctl+0x2a4/0x450
> > [9.448832] [<900000000046f044>] do_vfs_ioctl+0xa4/0x738
> > [9.448834] [<900000000046f778>] ksys_ioctl+0xa0/0xe8
> > [9.448837] [<900000000046f7d8>] sys_ioctl+0x18/0x28
> > [9.448840] [<9000000000211ab4>] syscall_common+0x20/0x34
> > [9.448842] ---[ end trace 40c18d9aec863c3e ]---
> > 
> > Multiple disable_irq_wake() calls will keep decreasing the IRQ
> > wake_depth, When wake_depth is 0, calling disable_irq_wake() again,
> > will report the above calltrace.
> > 
> > Due to the need to appear in pairs, we cannot call
> > disable_irq_wake() without calling enable_irq_wake(). Fix this by
> > making sure there are no unbalanced disable_irq_wake() calls.  
> 
> Just for my understanding. You trigger this by doing lots of
> 
> ethtool -s eth42 wol g
> 
> or similar without doing a matching
> 
> ethtool -s eth42 wol d
> 
> to disable wol?
> 
> Its a bit late now, but its good to give instructions how to reproduce
> the issue in the commit message.
> 
>     Andrew
> 

yes, my environment has not call enable_irq_wake(), so calling
disable_irq_wake() directly through the "ethtool -s ethxx wol d"
command will cause this problem.

    Qiang Ma

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
