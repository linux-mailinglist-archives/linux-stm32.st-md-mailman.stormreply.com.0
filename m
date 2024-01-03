Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F28CD8230BB
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 16:45:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3814C6B476;
	Wed,  3 Jan 2024 15:45:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99915C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 15:45:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E18B8FF811;
 Wed,  3 Jan 2024 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704296726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IWjkiu+Pn7NSDSot/BDX4VO1c88sUMIDcvmCdxNCc2o=;
 b=dnwFiQ8z9oNvUtQevzNXWb9RtQCaxMbcs8LC/XVnb2Yn+ucN6HP/mYzEDfyF1iGn2gOs1j
 hRj/WlrUINF8U5SsNiY9h5Ox3SppS9zCQsCkz3Iijr6ATYQQNPEi0kn7zc0/MYGpo6EXTB
 bygE7iVp73Ew8ybVHZu/bLbCgfN6KGdM/kVYsx0k4ZGfMbByXztgzaAlSL+YuzaXDKiJJ5
 Drh8v/js8uUfffKGYnpZ00GSCSIvYKP5jA8oLg6MZUPIUpJffsCfQaVulgjbyv8VzKd0xY
 yPJMD3iD7EAQQkLR+A0fNjPMGqg76lSutfu7bkyQDe3NuXGNlbKCaVIluI5fAw==
Date: Wed, 3 Jan 2024 16:45:48 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
In-Reply-To: <ZZV2s/TGKanl76TI@shell.armlinux.org.uk>
Message-ID: <7712bd49-3827-636c-ceff-998b37cc2738@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
 <20240103142827.168321-6-romain.gantois@bootlin.com>
 <ZZV2s/TGKanl76TI@shell.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Marek Vasut <marex@denx.de>, Andrew Lunn <andrew@lunn.ch>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net 5/5] net: pcs: rzn1-miic: Init RX
 clock early if MAC requires it
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

Hello Russel,

On Wed, 3 Jan 2024, Russell King (Oracle) wrote:
...
> Since the MAC driver has to itself provide the PCS to phylink via the
> mac_select_pcs() method, the MAC driver already has knowledge of which
> PCS it is going to be using. Therefore, I think it may make sense
> to do something like this:
> 
> int phylink_pcs_preconfig(struct phylink *pl, struct phylink_pcs *pcs)
> {
> 	if (pl->config->mac_requires_rxc)
> 		pcs->rxc_always_on = true;
> 
> 	if (pcs->ops->preconfig)
> 		pcs->ops->pcs_preconfig(pcs);
> }
> 
> and have stmmac call phylink_pcs_preconfig() for each PCS that it will
> be using during initialisation / resume paths?

Yes, that is definitely a much cleaner solution. I'll reimplement the PCS 
changes in this way.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
