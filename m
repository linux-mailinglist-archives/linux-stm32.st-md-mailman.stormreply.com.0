Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F5B8A7FA1
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 11:29:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2A21C6B444;
	Wed, 17 Apr 2024 09:29:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3C22C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:29:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1E9040003;
 Wed, 17 Apr 2024 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713346173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j3i344ERuSxhSsjZp4G790f+W4T/PKZQWnrVfudLzaQ=;
 b=mhwQPRAl2eAxgm367WvffpWd2HLo4U9HRWSem6zyjyJ4qTy+wDutGvj550D/e+ToldascP
 mD6PDSlmlwsqRAAIdY2F5HL1J0VuFuLEQXBXpASBgc773GYY2DIeruPSNIfeZQgLz38wtZ
 HPlxt9dfu/J813/WWZTz3dXqSN2KlTIhVzpOAxRCdML9ylMtidCRvcduhqxpZ3eFivDi1j
 jY2w1UyhmXOEXZ9i9CXjnOYwblYD1bhYgHrJtqKMyBjjZv543catHdGXquiH5xY9anoTkQ
 U2pWEoVvcXWgV56po0F7Nm0O6rq3tBf7xnpDjIY2GUT2bDaIdLIcnqWxRzixyg==
Date: Wed, 17 Apr 2024 11:30:09 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <42chuecdt7dpgm6fcrtt2crifvv5hflmtnmdrw5fvk3r7pwjgu@hlcv56dbeosf>
Message-ID: <77722ced-4956-0e70-9492-c7b2e8557253@bootlin.com>
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-2-ab12f2c4401d@bootlin.com>
 <42chuecdt7dpgm6fcrtt2crifvv5hflmtnmdrw5fvk3r7pwjgu@hlcv56dbeosf>
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
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/5] net: stmmac: introduce
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

Hi Serge,

On Tue, 16 Apr 2024, Serge Semin wrote:

> I am currently working on my Memory-mapped DW XPCS patchset cooking:
> https://lore.kernel.org/netdev/20231205103559.9605-1-fancer.lancer@gmail.com/
> The changes in this series seems to intersect to what is/will be
> introduced in my patchset. In particular as before I am going to
> use the "pcs-handle" property for getting the XPCS node. If so what
> about collecting PCS-related things in a single place. Like this:
> 
> int stmmac_xpcs_setup(struct net_device *ndev)
> {
> 	...
> 
> 	if (priv->plat->pcs_init) {
> 		return priv->plat->pcs_init(priv); /* Romain' part */
>	} else if (fwnode_property_present(priv->plat->port_node, "pcs-handle")) {
> 		/* My DW XPCS part */
> 	} else if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> 		/* Currently implemented procedure */
> 	}
> 
> 	...
> }

That seems like a good idea to me, although those setup functions would have to 
be renamed to stmmac_pcs_setup/exit.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
