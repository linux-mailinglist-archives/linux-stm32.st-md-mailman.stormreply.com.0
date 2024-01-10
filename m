Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD42D825B3C
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 20:54:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 575C5C6C83C;
	Fri,  5 Jan 2024 19:54:16 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 847DFC6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Eyi451cj+KaNnkxMkyMiaR+M6T5nRPxn2ux4L1vEcqQ=; b=pqJnL2U69d2M5nR7iyo1cEWugG
 HTgEtks88S8iqKm5VsYDazfaXSUUmepFnchhboGdy6nqkNcROKYo9Gw5Aku9MZmhfyWVP9iM+moBU
 5dngObrnZSCqqorkTvC0QLvj12y6iwt5lkncRkbvJ53QMplkeIQphalKI9MXPO1zOwoU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rLqGX-004UBZ-7Q; Fri, 05 Jan 2024 20:54:01 +0100
Date: Fri, 5 Jan 2024 20:54:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Petr Tesarik <petr@tesarici.cz>
Message-ID: <14d3ba8c-c01f-42d2-9f5a-d681d9ce3a55@lunn.ch>
References: <20240105181024.14418-1-petr@tesarici.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240105181024.14418-1-petr@tesarici.cz>
Cc: open list <linux-kernel@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix ethtool per-queue
	statistics
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

On Fri, Jan 05, 2024 at 07:10:24PM +0100, Petr Tesarik wrote:
> Fix per-queue statistics for devices with more than one queue.
> 
> The output data pointer is currently reset in each loop iteration,
> effectively summing all queue statistics in the first four u64 values.
> 
> The summary values are not even labeled correctly. For example, if eth0 has
> 2 queues, ethtool -S eth0 shows:
> 
>      q0_tx_pkt_n: 374 (actually tx_pkt_n over all queues)
>      q0_tx_irq_n: 23  (actually tx_normal_irq_n over all queues)
>      q1_tx_pkt_n: 462 (actually rx_pkt_n over all queues)
>      q1_tx_irq_n: 446 (actually rx_normal_irq_n over all queues)
>      q0_rx_pkt_n: 0
>      q0_rx_irq_n: 0
>      q1_rx_pkt_n: 0
>      q1_rx_irq_n: 0
> 
> While touching this code, change the pointer type to u64 and get rid of the
> weird pointer arithmetic.
> 
> Signed-off-by: Petr Tesarik <petr@tesarici.cz>
> Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics where necessary")

Hi Petr

There are a few process things you are missing. Please take a look at

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

You need to indicate which tree this is for.

Additionally, your Signed-off-by comes last.

Patches for stable should ideally be minimal. And obviously correct. See:

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

So the bits about changing the pointer type and removing the weird
arithmetic might be better suited for net-next, not net.

	      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
