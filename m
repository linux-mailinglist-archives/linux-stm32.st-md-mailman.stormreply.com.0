Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2D288673
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Oct 2020 12:00:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 482BDC32EA8;
	Fri,  9 Oct 2020 10:00:00 +0000 (UTC)
Received: from metanate.com (dougal.metanate.com [90.155.101.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AB74C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Content-Type:
 References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID
 :Content-Description; bh=lDxXbMg3sqgtLNJ8JfGfAKeSro7IxzBb9f7HzRAxIHc=; b=ivfM
 1cQJ4LxPv3ygCYNCSQfpTsmHalnPEbYPC9Q54L16FXH+BSbYYaj7pwTfTnFC/SYgOUeS312lSs74k
 FdNxGGwujXw9Um2TCdWYT4lggtLuCGU4+GqmuLaH38pENyF0eSWcprJr4CY9OD/vuPzGIwZfhUvkI
 +aO/GVlaHxALQXIbf8EfJ9GvSEt9Ks/z2okKr3ORJP9LLYo0YaN901JEyUaHNGAX9/ZAWtmrGjALb
 92sf1VxCC3cxeQJLi0COpeHCvqlBv/Bb3Koa/lD4uJuEdAc/r7RyyNHrsdTUlwHBhhBRnCJfjfY4w
 cPGcwg/VRF3maSpEeQhdj5C5qEEUfg==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1kQpBj-0006U9-7D; Fri, 09 Oct 2020 10:59:47 +0100
Date: Fri, 9 Oct 2020 10:59:45 +0100
From: John Keeping <john@metanate.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20201009105945.432de706.john@metanate.com>
In-Reply-To: <20201008234609.x3iy65g445hmmt73@skbuf>
References: <20201008162749.860521-1-john@metanate.com>
 <20201008234609.x3iy65g445hmmt73@skbuf>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Authenticated: YES
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Don't call _irqoff() with
	hardirqs enabled
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

On Fri, 9 Oct 2020 02:46:09 +0300
Vladimir Oltean <olteanv@gmail.com> wrote:

> On Thu, Oct 08, 2020 at 05:27:49PM +0100, John Keeping wrote:
> > With threadirqs, stmmac_interrupt() is called on a thread with hardirqs
> > enabled so we cannot call __napi_schedule_irqoff().  Under lockdep it
> > leads to:
> > 
> > 	------------[ cut here ]------------
> > 	WARNING: CPU: 0 PID: 285 at kernel/softirq.c:598 __raise_softirq_irqoff+0x6c/0x1c8
> > 	IRQs not disabled as expected
> > 	Modules linked in: brcmfmac hci_uart btbcm cfg80211 brcmutil
> > 	CPU: 0 PID: 285 Comm: irq/41-eth0 Not tainted 5.4.69-rt39 #1
> > 	Hardware name: Rockchip (Device Tree)
> > 	[<c0110d3c>] (unwind_backtrace) from [<c010c284>] (show_stack+0x10/0x14)
> > 	[<c010c284>] (show_stack) from [<c0855504>] (dump_stack+0xa8/0xe0)
> > 	[<c0855504>] (dump_stack) from [<c0120a9c>] (__warn+0xe0/0xfc)
> > 	[<c0120a9c>] (__warn) from [<c0120e80>] (warn_slowpath_fmt+0x7c/0xa4)
> > 	[<c0120e80>] (warn_slowpath_fmt) from [<c01278c8>] (__raise_softirq_irqoff+0x6c/0x1c8)
> > 	[<c01278c8>] (__raise_softirq_irqoff) from [<c056bccc>] (stmmac_interrupt+0x388/0x4e0)
> > 	[<c056bccc>] (stmmac_interrupt) from [<c0178714>] (irq_forced_thread_fn+0x28/0x64)
> > 	[<c0178714>] (irq_forced_thread_fn) from [<c0178924>] (irq_thread+0x124/0x260)
> > 	[<c0178924>] (irq_thread) from [<c0142ee8>] (kthread+0x154/0x164)
> > 	[<c0142ee8>] (kthread) from [<c01010bc>] (ret_from_fork+0x14/0x38)
> > 	Exception stack(0xeb7b5fb0 to 0xeb7b5ff8)
> > 	5fa0:                                     00000000 00000000 00000000 00000000
> > 	5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 	5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > 	irq event stamp: 48
> > 	hardirqs last  enabled at (50): [<c085c200>] prb_unlock+0x7c/0x8c
> > 	hardirqs last disabled at (51): [<c085c0dc>] prb_lock+0x58/0x100
> > 	softirqs last  enabled at (0): [<c011e770>] copy_process+0x550/0x1654
> > 	softirqs last disabled at (25): [<c01786ec>] irq_forced_thread_fn+0x0/0x64
> > 	---[ end trace 0000000000000002 ]---
> > 
> > Use __napi_schedule() instead which will save & restore the interrupt
> > state.
> > 
> > Fixes: 4ccb45857c2c ("net: stmmac: Fix NAPI poll in TX path when in multi-queue")
> > Signed-off-by: John Keeping <john@metanate.com>
> > ---  
> 
> Don't get me wrong, this is so cool that the new lockdep warning is really
> helping out finding real bugs, but the patch that adds that warning
> (https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=cdabce2e3dff7e4bcef73473987618569d178af3)
> isn't in 5.4.69-rt39, is it?

No, it's not, although I would have saved several days debugging if it
was!  I backported the lockdep warning to prove that it caught this
issue.

The evidence it is possible to see on vanilla 5.4.x is:

	$ trace-cmd report -l
	irq/43-e-280     0....2    74.017658: softirq_raise:        vec=3 [action=NET_RX]

Note the missing "d" where this should be "0d...2" to indicate hardirqs
disabled.


Regards,
John
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
