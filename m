Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DCB842644
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 14:40:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C8EEC6C820;
	Tue, 30 Jan 2024 13:40:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BBDDC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 13:40:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB1221C0005;
 Tue, 30 Jan 2024 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706622010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3wtrD2uoXhVlXOQf9qkwgkVdNZsFSpbdjrR4OR46j4=;
 b=LrKfnFVsBIoEn/8B5X8Q4FrVyf8P3XnWHnYRgT04wSxgpV6el0DMo9SCrOYyuTlNWRy9F6
 HiMifCO0TYFOfj1nXd7yppKz47BmgspAYw26tmMHKIroClhx4tqd94/B2C7y1n9iIs7nM2
 5AhD1nOEdr729xRmPWHdrlVN+0yjF3PF3u4ih5/SG2gfgZTc7l46mgcAWQ2OhaNeJMiwJd
 hJmhwDRxnp3iwd88Jqru9WGzBoBTH1yEWeMs6ITKE79IvuRZtRyQzWckvB5Qid55y+yUrd
 ZCfiUJZfROj1ZhBBYxDvSMdZQrem47kgWHWsZX5uxyP+SYZu1LypAurOGVhPyw==
Date: Tue, 30 Jan 2024 14:40:31 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
In-Reply-To: <ZbjLN+FzBSohg1c2@shell.armlinux.org.uk>
Message-ID: <3e1617d8-b8c9-64d6-030d-5b6781544692@bootlin.com>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
 <20240130-rxc_bugfix-v2-2-5e6c3168e5f0@bootlin.com>
 <ZbjLN+FzBSohg1c2@shell.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/7] net: phy: add
 rxc_always_on flag to phylink_pcs
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

Hello Russell,

On Tue, 30 Jan 2024, Russell King (Oracle) wrote:
...
> > +int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs)
> > +{
> > +	int ret = 0;
> > +
> > +	/* Signal to PCS driver that MAC requires RX clock for init */
> > +	if (pl->config->mac_requires_rxc)
> > +		pcs->rxc_always_on = true;
> > +
> > +	if (pcs->ops->pcs_pre_init)
> > +		ret = pcs->ops->pcs_pre_init(pcs, pl->link_config.interface);
> 
> Given that:
> 1) phylink supports switching between mutliple different interfaces,
> 2) from what I can see you are only calling this from stmmac's
>    initialisation path,
> 3) you pass the interface mode to the PCS here
> 
> then we don't want the PCS to configure itself for the interface mode
> passed in, because this function won't be called when the interface
> mode changes - and PCS driver authors will have to bear that in mind.
> So...
> 
...
> However, do we really need it - if the PCS is supplying the RXC to
> the MAC, then is the interface mode between the PCS and PHY all that
> relevant at this point?

If a PCS can set the needed clock signal without configuring the details 
of a particular link mode, then passing the interface mode to pcs_pre_init() 
would indeed not be relevant. Generally, I agree that setting the interface mode 
shouldn't be the concern of the pre-initialization function. I'll dig a bit 
more into the PCS datasheet and run more tests to see if I can get away with 
enabling the RX clock selectively for this particular PCS model. If not, then 
maybe I can hardcode a "default" interface mode for the pre-initialization that 
will not interfere with the rest of the link setup process.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
