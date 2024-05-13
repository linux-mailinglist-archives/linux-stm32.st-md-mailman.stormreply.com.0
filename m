Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734A8C3BF3
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 09:25:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A445C71287;
	Mon, 13 May 2024 07:25:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EDE2C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 07:25:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06AE8FF805;
 Mon, 13 May 2024 07:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715585133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iN0ItRZDrnSlN4ReBOmK3jB09/b+zxkMx2rwDWFhp0=;
 b=cCy6F3dbOTlV7pzWtlwoZ44WYFXoU2cAF7OG54Sc0QLZlnlGdhfHRvYqZvFzxYGjujiUdd
 nQMhXPhZvumnfIkPQX0/ZrFylRcn46YaJGRJVqp652RjQLRG3da0gI6o5MdCsINxr97hcw
 lihvuOARiHJcz9HqMhPW++79zSKHs0OPOpgwmTCBon18G8sOmK8wAc+bonYwEXXrOakIti
 2mZHmm/x873gCXflMPdJJbhmybgoZOR5BGt9+II4f+ax6EkdwN2lVsUDQFqprigpmRoUvX
 0ku1un7VeG7ZvTmlOoomwYrb4SczoLhLhHPCJJ9fOI/4At6FnuuZ4IR5fe0Gxg==
Date: Mon, 13 May 2024 09:26:12 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Simon Horman <horms@kernel.org>
In-Reply-To: <20240511181119.GU2347895@kernel.org>
Message-ID: <64f188d8-9336-2578-fb47-ce6ff615acab@bootlin.com>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
 <20240510-rzn1-gmac1-v6-4-b63942be334c@bootlin.com>
 <20240511181119.GU2347895@kernel.org>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v6 4/7] net: stmmac: introduce
 pcs_init/pcs_exit stmmac operations
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

Hello Simon,

On Sat, 11 May 2024, Simon Horman wrote:

> > -	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> > +	if (priv->plat->pcs_init) {
> > +		ret = priv->plat->pcs_init(priv);
> > +	} else if (priv->plat->mdio_bus_data &&
> > +		   priv->plat->mdio_bus_data->has_xpcs) {
> >  		/* Try to probe the XPCS by scanning all addresses */
> >  		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> >  			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
> 
> I am unsure if this can occur, but if priv->plat->pcs_init returns 0 then
> xpcs will be used while uninitialised towards the end of this function.

Indeed this could occur, I've just sent a v7 that fixes this.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
