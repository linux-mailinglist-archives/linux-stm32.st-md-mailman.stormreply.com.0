Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6082AE89AA
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 18:24:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BF0EC32EB0;
	Wed, 25 Jun 2025 16:24:28 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 879A1C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+7wYN+JWrEX2DiySLiFAD6+bfGgv+ghfIoHHTi5gyD0=; b=Q3GkIrz+ddO3ijUSB9rqOi0dkl
 BMPu60NXivpY/5rM1/UYb8eYYR3WRE6QJN/jYk+UoaNy4ec1hLdtB59IOoltGLq0gOrZ9PNa8WZKM
 4XyqUxkqXhj3m2XhYe/ekQe4hm3TYSawabSf/a5RE1LvkltaTepEP0BUXxOZgyBovFiM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uUSus-00Gwzd-Lr; Wed, 25 Jun 2025 18:24:06 +0200
Date: Wed, 25 Jun 2025 18:24:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4861a4cb-d653-4c5d-8d96-c7acac501004@lunn.ch>
References: <20250612062032.293275-1-jonathanh@nvidia.com>
 <aEqyrWDPykceDM2x@a5393a930297>
 <85e27a26-b115-49aa-8e23-963bff11f3f6@lunn.ch>
 <e720596d-6fbb-40a4-9567-e8d05755cf6f@nvidia.com>
 <353f4fd1-5081-48f4-84fd-ff58f2ba1698@lunn.ch>
 <9544a718-1c1a-4c6b-96ae-d777400305a7@nvidia.com>
 <5a3e1026-740a-4829-bfd2-ce4c4525d2a0@lunn.ch>
 <b54afc33-5863-4c8b-8d6d-24b4447631e1@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b54afc33-5863-4c8b-8d6d-24b4447631e1@nvidia.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Alexis Lothorrr <alexis.lothore@bootlin.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix PTP ref clock for
	Tegra234
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

> > Now, lets consider the case some devices do actually work. How are
> > they working? Must it be the fallback? The ptp-ref clock is actually
> > turned on, and if the ptp-ref clock and the main clock tick at the
> > same rate, ptp would work. I _guess_, if the main clock and the
> > ptp-ref clock tick at different rates, you get something from the ptp
> > hardware, but it probably does not get sync with a grand master, or if
> > it does, the jitter is high etc. So in effect it is still broken.
> > 
> > Can somebody with the datasheet actually determine where ptp-ref clock
> > comes from? Is it just a gated main clock? Is it from a pin?
> 
> Looking at the datasheet, this is a pin to the controller and sourced from
> an external clock.

So the fallback of the main clock is not likely to help, unless by
chance the external clock and the main clock happen to be the same
frequency.

> AFAIK we have never tested PTP with this driver on this device. So the risk
> of breaking something is low for this device.

So it seems like the simple fix is to list both ptp-ref and ptp_ref,
pointing to the same clock, along with a comment explaining why you
have this odd construction.

Please could you test that?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
