Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5F0287F3E
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Oct 2020 01:46:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 406CDC32EA8;
	Thu,  8 Oct 2020 23:46:14 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 287D6C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 23:46:11 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id i5so7574590edr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Oct 2020 16:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AEjSqknP1oCJUZw0NkEtwBPT55uFfupDNX0nujX92jY=;
 b=GWrG7ZlJxcztuWXZUvIrAfhi9uwncN6XEo0oq2M8JMsQwFXvq8h68Sr9KLnM+ZwIfa
 Owsc9GtFHci0SVMizGU3PBTiCPtPLSbsvkZ2pfupp3lsTOVandmq650Z36VYdeVoujtU
 V3wEarJGtCdTo5AWhh9NS8bMTcmMv6nn/3Ybmc8J12fZCJuojQqB1b/P4nuyqDa6+lJ7
 o9NMkI3LWj+Uh/44vGL39oJVrS02UexTPTNFI0vuMVNdQhUulySxkkOAN0rK1duWzhEe
 rSla9Lin8zL2p51R84dvU3fIftLx3rxgXwkRgKbkwDkLDNQ9lwzRUaC/opKsDcDp1pQK
 2Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AEjSqknP1oCJUZw0NkEtwBPT55uFfupDNX0nujX92jY=;
 b=NbqS6t6ZuwySDTcKn9EpzNNu1qSzOjwLRLGYcJIIe2MA9JXxkfZd5wOCfGkiOrF2xL
 LLfRw1dOdxKDJqj7s2Ai0KTJQSsApD6Ta6tcnY4wi0zXxINVFN4uA/eWID014k2NMmSh
 TwI6SBrn5qUzmjcB/HQQuHx0IaaqWch58mXywbjKLyYfhXQ3HB76ETjUOGiUBm3/Tznu
 OeKaaLTtSKB0TR8X9H4pLwXS7jea+KUifnaX+e2r7nlTrvNVhjuU0qAcKmNE/RNfNLq6
 /RxyODP8/1N6GTLQOyTSTYAbnoF5y0fITGShetUkwM55T5fepjjfk72LueWPt/9xzEUe
 Pi+w==
X-Gm-Message-State: AOAM532nUKNh1QVmCGuC00P8coxukLQdOvBpq9PrUGbP2HPXLw7pWiTx
 VbUwOs0ldxNSr6r0BwHPTaA=
X-Google-Smtp-Source: ABdhPJzH871e6pCRv5eB3S6xhjqB+QCnAVWqXh0JUJ33ZffSYMGwr7HfLigoej2Ld+mdkGD7QY9/kQ==
X-Received: by 2002:aa7:ccd9:: with SMTP id y25mr11332579edt.375.1602200771361; 
 Thu, 08 Oct 2020 16:46:11 -0700 (PDT)
Received: from skbuf ([188.26.229.171])
 by smtp.gmail.com with ESMTPSA id n4sm5189280ejj.19.2020.10.08.16.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 16:46:10 -0700 (PDT)
Date: Fri, 9 Oct 2020 02:46:09 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: John Keeping <john@metanate.com>
Message-ID: <20201008234609.x3iy65g445hmmt73@skbuf>
References: <20201008162749.860521-1-john@metanate.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201008162749.860521-1-john@metanate.com>
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

On Thu, Oct 08, 2020 at 05:27:49PM +0100, John Keeping wrote:
> With threadirqs, stmmac_interrupt() is called on a thread with hardirqs
> enabled so we cannot call __napi_schedule_irqoff().  Under lockdep it
> leads to:
> 
> 	------------[ cut here ]------------
> 	WARNING: CPU: 0 PID: 285 at kernel/softirq.c:598 __raise_softirq_irqoff+0x6c/0x1c8
> 	IRQs not disabled as expected
> 	Modules linked in: brcmfmac hci_uart btbcm cfg80211 brcmutil
> 	CPU: 0 PID: 285 Comm: irq/41-eth0 Not tainted 5.4.69-rt39 #1
> 	Hardware name: Rockchip (Device Tree)
> 	[<c0110d3c>] (unwind_backtrace) from [<c010c284>] (show_stack+0x10/0x14)
> 	[<c010c284>] (show_stack) from [<c0855504>] (dump_stack+0xa8/0xe0)
> 	[<c0855504>] (dump_stack) from [<c0120a9c>] (__warn+0xe0/0xfc)
> 	[<c0120a9c>] (__warn) from [<c0120e80>] (warn_slowpath_fmt+0x7c/0xa4)
> 	[<c0120e80>] (warn_slowpath_fmt) from [<c01278c8>] (__raise_softirq_irqoff+0x6c/0x1c8)
> 	[<c01278c8>] (__raise_softirq_irqoff) from [<c056bccc>] (stmmac_interrupt+0x388/0x4e0)
> 	[<c056bccc>] (stmmac_interrupt) from [<c0178714>] (irq_forced_thread_fn+0x28/0x64)
> 	[<c0178714>] (irq_forced_thread_fn) from [<c0178924>] (irq_thread+0x124/0x260)
> 	[<c0178924>] (irq_thread) from [<c0142ee8>] (kthread+0x154/0x164)
> 	[<c0142ee8>] (kthread) from [<c01010bc>] (ret_from_fork+0x14/0x38)
> 	Exception stack(0xeb7b5fb0 to 0xeb7b5ff8)
> 	5fa0:                                     00000000 00000000 00000000 00000000
> 	5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 	5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> 	irq event stamp: 48
> 	hardirqs last  enabled at (50): [<c085c200>] prb_unlock+0x7c/0x8c
> 	hardirqs last disabled at (51): [<c085c0dc>] prb_lock+0x58/0x100
> 	softirqs last  enabled at (0): [<c011e770>] copy_process+0x550/0x1654
> 	softirqs last disabled at (25): [<c01786ec>] irq_forced_thread_fn+0x0/0x64
> 	---[ end trace 0000000000000002 ]---
> 
> Use __napi_schedule() instead which will save & restore the interrupt
> state.
> 
> Fixes: 4ccb45857c2c ("net: stmmac: Fix NAPI poll in TX path when in multi-queue")
> Signed-off-by: John Keeping <john@metanate.com>
> ---

Don't get me wrong, this is so cool that the new lockdep warning is really
helping out finding real bugs, but the patch that adds that warning
(https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=cdabce2e3dff7e4bcef73473987618569d178af3)
isn't in 5.4.69-rt39, is it?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
