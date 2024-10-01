Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A998C7F6
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2024 00:09:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4399C78019;
	Tue,  1 Oct 2024 22:09:46 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 743A5C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 22:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=udSbcyfEMfJgdgpqH6I5MbyBPW4Wm04lU8PD76G0N2g=; b=HESE6ZykHS7rrlzReeyyn+ptSJ
 aDPHtUstobL4w/72soEp5moL7PoA3lKfFpIvdp6LcjZVJQlGtd9lvSrKaAJwH4+aiHWe0CBswtaN+
 VsWoYdR2hqgMolDbGYZ1atEO/f/cazF5cO7Sb/sUTrt+moAbrowd2t/kGo6fXNy9qGic=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1svl3a-008mQr-1n; Wed, 02 Oct 2024 00:09:22 +0200
Date: Wed, 2 Oct 2024 00:09:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <68bc05c2-6904-4d33-866f-c828dde43dff@lunn.ch>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
 <E1svfMA-005ZI3-Va@rmk-PC.armlinux.org.uk>
 <fp2h6mc2346egjtcshek4jvykzklu55cbzly3sj3zxhy6sfblj@waakp6lr6u5t>
 <ZvxxJWCTD4PgoMwb@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvxxJWCTD4PgoMwb@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 01/10] net: pcs: xpcs: move PCS
 reset to .pcs_pre_config()
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

> I'm wondering why we seem to be having a communication issue here.
> 
> I'm not sure which part of "keeping the functional changes to a
> minimum for a cleanup series" you're not understanding. This is
> one of the basics for kernel development... and given that you're
> effectively maintaining stmmac, it's something you _should_ know.
> 
> So no, I'm going to outright refuse to merge your patch in to this
> series, because as I see it, it would be wrong to do so. This is
> a _cleanup_ series, not a functional change series, and what you're
> proposing _changes_ the _way_ reset happens in this driver beyond
> the minimum that is required for this cleanup. It's introducing a
> completely _new_ way of writing to the devices registers to do
> the reset that's different.

I have to agree with Russell. Cleanups should be as simple as
possible, and hopefully obviously correct. They should be low risk.

Lets do all the simple cleanups first. Later we can consider more
invasive and risky changes.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
