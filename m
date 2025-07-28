Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E449B14891
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDC2FC3F92F;
	Tue, 29 Jul 2025 06:49:43 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7474C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=wyxR7Bm/Ol+TxP5+zw7WuA3v6FPnTthLLIDlKJiwW3k=; b=1FsNGckeU+WK5cG+tmTzYMRJaQ
 b85pYQyyffBg/suM8jGSCmz/xJG3vVRTHC5qtqyJ3vcJuHsZANzL+2G2xep2cvsSveqrXobVkygWt
 3Bdfcds26/26kypiDfb4fyyoIV1JrZ9hHeX+Zd3cHT/PU0N4weO0L62xVGaXcIiMz1Ak=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ugRdp-0037R9-Dh; Mon, 28 Jul 2025 19:28:01 +0200
Date: Mon, 28 Jul 2025 19:28:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
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

> +static inline bool stmmac_wol_enabled_mac(struct stmmac_priv *priv)
> +{
> +	return priv->plat->pmt && device_may_wakeup(priv->device);
> +}
> +
> +static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
> +{
> +	return !priv->plat->pmt && device_may_wakeup(priv->device);
> +}

I agree this is a direct translation into a helper.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

I'm guessing at some point you want to change these two
helpers. e.g. at some point, you want to try getting the PHY to do the
WoL, independent of !priv->plat->pmt? 

> -	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> +	if (stmmac_wol_enabled_phy(priv))
>  		phylink_speed_down(priv->phylink, false);

This might be related to the next patch. But why only do speed down
when PHY is doing WoL? If the MAC is doing WoL, you could also do a
speed_down.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
