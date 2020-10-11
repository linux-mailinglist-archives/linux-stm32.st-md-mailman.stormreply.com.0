Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6C28A82E
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Oct 2020 18:06:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AA0CC3FAD9;
	Sun, 11 Oct 2020 16:06:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E7A5C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Oct 2020 16:06:24 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3813120678;
 Sun, 11 Oct 2020 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602432382;
 bh=0pTIrX9OOi88NEgA5/B1qpPHXrYAtUk/EQDmA++8rfg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=curs9miwdNGXwW227Ox77jhLxuxvZqJYBGf0THsTih8EyPRna/vlPjhUXv+ZptM4U
 pC4azNuqNh+QQJkV0hUxcibYF1f9ivO0lONG3GxRernnQzhbAa37XWmz8XDCn9Q7UW
 I4Yxe82xhjMJbf2oJKhUy+FL0j0SDX9My/eSQUvI=
Date: Sun, 11 Oct 2020 09:06:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <20201011090620.48afafd7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <c73866a9-2ee8-b549-f578-75d62b9263b4@gmail.com>
References: <20201008162749.860521-1-john@metanate.com>
 <8036d473-68bd-7ee7-e2e9-677ff4060bd3@gmail.com>
 <20201009085805.65f9877a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <725ba7ca-0818-074b-c380-15abaa5d037b@gmail.com>
 <070b2b87-f38c-088d-4aaf-12045dbd92f7@gmail.com>
 <20201010082248.22cc7656@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <c73866a9-2ee8-b549-f578-75d62b9263b4@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, John Keeping <john@metanate.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

On Sun, 11 Oct 2020 11:24:41 +0200 Heiner Kallweit wrote:
> >> qeth_qdio_poll
> >> netvsc_channel_cb
> >> napi_watchdog  
> > 
> > This one runs from a hrtimer, which I believe will be a hard irq
> > context on anything but RT. I could be wrong.
> >   
> 
> A similar discussion can be found e.g. here:
> https://lore.kernel.org/netdev/20191126222013.1904785-1-bigeasy@linutronix.de/
> However I don't see any actual outcome.

Interesting, hopefully Eric will chime in. I think the hrtimer issue
was solved. But I'm not actually seeing a lockdep_assert_irqs_disabled()
in __raise_softirq_irqoff() in net, so IDK what that's for?

In any case if NAPI thinks it has irqs off while they're not, and
interacts with other parts of the kernel we may be in for a game of
whack-a-mole. 

Perhaps a way around touching force_irqthreads directly in net/ would 
be some form of a helper like "theaded_local_irq_save" or such that'd
disable IRQs only if force_irqthreads == 1? Is that cheating? :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
