Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EBCA48B87
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 23:28:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74C97CFAC45;
	Thu, 27 Feb 2025 22:28:05 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9546CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 22:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=SHOEZHu/+tii/WYRiY6/uQoRwGdb261OsJSFtvsTK3A=; b=VpEv/xRoCufejRZ7XLrUfeeTRj
 wm9DCyNUBIe+2f1wR69e6f6gEyiAWArsnbN5nyylqdzs+pbhKYUokYYEDRbyaBGmWYszG7bBK6aLz
 kdfphHaWibb8WWXtvvp13bFFKSZEqbZHTTtMnGaGL5ZE9iGDtHi+vt0m32cEQSGLE7wU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tnmMH-000jvl-IG; Thu, 27 Feb 2025 23:27:57 +0100
Date: Thu, 27 Feb 2025 23:27:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <92442281-9896-4271-a040-0c14331cb1d3@lunn.ch>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 1/5] net: stmmac: call
 phylink_start() and phylink_stop() in XDP functions
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

On Thu, Feb 27, 2025 at 03:05:02PM +0000, Russell King (Oracle) wrote:
> Phylink does not permit drivers to mess with the netif carrier, as
> this will de-synchronise phylink with the MAC driver. Moreover,
> setting and clearing the TE and RE bits via stmmac_mac_set() in this
> path is also wrong as the link may not be up.
> 
> Replace the netif_carrier_on(), netif_carrier_off() and
> stmmac_mac_set() calls with the appropriate phylink_start() and
> phylink_stop() calls, thereby allowing phylink to manage the netif
> carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> methods.
> 
> Note that RE should only be set after the DMA is ready to avoid the
> receive FIFO between the MAC and DMA blocks overflowing, so
> phylink_start() needs to be placed after DMA has been started.

Sorry, i don't know enough about XDP to review this :-(

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
