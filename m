Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4CE712B45
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 18:59:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BF46C6A61A;
	Fri, 26 May 2023 16:59:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 296FBC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 16:59:42 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685120381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZ4try5mxxCJlBunlZdGkrN9b4onog+w6GD5OBfPZ7k=;
 b=P9YxnulzHQAoElHA1eGhvpXma1e61ONUekwqIi37lQ4rGilzyW0Ixv3nmGR3cuA1955htB
 CleYfzQ+DVF8Kzp33TFBmiQPmPRAd0WCU4SNRsR/xrGoNDQiTWJMI9OTzutuUy7lhENix2
 aUxmIn/Qz0p0VtcWwS6rkG7k7gyZWyaeQUVmgKjrZ5UDwXUgqvxKfznXhWSFgFdZ61ipL7
 7zQAf83MjminoiClr/xlj7CsqqbZKVtrsfqvXvbBzWWzScxdBTE/yQ9S+yEChojsQEYV/Y
 P8zx/MXsfmbcMHX76y4VdfW15Z5d02mV7fvffMh4/HREhwzr8w1SEpOZpmFU7w==
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 840FC1BF208;
 Fri, 26 May 2023 16:59:37 +0000 (UTC)
Date: Fri, 26 May 2023 18:59:36 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Message-ID: <20230526185936.0a95b9e9@pc-7.home>
In-Reply-To: <20230526102139.dwttilkquihvp7bs@skbuf>
References: <20230526074252.480200-1-maxime.chevallier@bootlin.com>
 <20230526074252.480200-2-maxime.chevallier@bootlin.com>
 <20230526102139.dwttilkquihvp7bs@skbuf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: mdio: Introduce a
 regmap-based mdio driver
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

Hello Vlad,

On Fri, 26 May 2023 13:21:39 +0300
Vladimir Oltean <vladimir.oltean@nxp.com> wrote:

> >  M:	William Breathitt Gray <william.gray@linaro.org>
> >  L:	linux-iio@vger.kernel.org
> > diff --git a/drivers/net/ethernet/altera/Kconfig
> > b/drivers/net/ethernet/altera/Kconfig index
> > dd7fd41ccde5..0a7c0a217536 100644 ---
> > a/drivers/net/ethernet/altera/Kconfig +++
> > b/drivers/net/ethernet/altera/Kconfig @@ -5,6 +5,8 @@ config
> > ALTERA_TSE select PHYLIB
> >  	select PHYLINK
> >  	select PCS_ALTERA_TSE
> > +	select MDIO_REGMAP
> > +	depends on REGMAP  
> 
> I don't think this bit belongs in this patch.
> Also: depends on REGMAP or select REGMAP?

Ugh sorry about that... I'll address both the dependency and the wrong
patch splitting in next revision.

> >  	help
> >  	  This driver supports the Altera Triple-Speed (TSE)
> > Ethernet MAC. 
> > diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
> > index 9ff2e6f22f3f..aef39c89cf44 100644
> > --- a/drivers/net/mdio/Kconfig
> > +++ b/drivers/net/mdio/Kconfig
> > @@ -185,6 +185,16 @@ config MDIO_IPQ8064
> >  	  This driver supports the MDIO interface found in the
> > network interface units of the IPQ8064 SoC
> >  
> > +config MDIO_REGMAP
> > +	tristate
> > +	help
> > +	  This driver allows using MDIO devices that are not
> > sitting on a
> > +	  regular MDIO bus, but still exposes the standard 802.3
> > register
> > +	  layout. It's regmap-based so that it can be used on
> > integrated,
> > +	  memory-mapped PHYs, SPI PHYs and so on. A new virtual
> > MDIO bus is
> > +	  created, and its read/write operations are mapped to the
> > underlying
> > +	  regmap.  
> 
> It would probably be helpful to state that those who select this
> option should also explicitly select REGMAP.

You're right, I'll update this

> > +
> >  config MDIO_THUNDER
> >  	tristate "ThunderX SOCs MDIO buses"
> >  	depends on 64BIT
> > diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
> > index 7d4cb4c11e4e..1015f0db4531 100644
> > --- a/drivers/net/mdio/Makefile
> > +++ b/drivers/net/mdio/Makefile
> > @@ -19,6 +19,7 @@ obj-$(CONFIG_MDIO_MOXART)		+=
> > mdio-moxart.o obj-$(CONFIG_MDIO_MSCC_MIIM)		+=
> > mdio-mscc-miim.o obj-$(CONFIG_MDIO_MVUSB)		+=
> > mdio-mvusb.o obj-$(CONFIG_MDIO_OCTEON)		+=
> > mdio-octeon.o +obj-$(CONFIG_MDIO_REGMAP)		+=
> > mdio-regmap.o obj-$(CONFIG_MDIO_SUN4I)		+=
> > mdio-sun4i.o obj-$(CONFIG_MDIO_THUNDER)		+=
> > mdio-thunder.o obj-$(CONFIG_MDIO_XGENE)		+=
> > mdio-xgene.o diff --git a/include/linux/mdio/mdio-regmap.h
> > b/include/linux/mdio/mdio-regmap.h new file mode 100644
> > index 000000000000..b8508f152552
> > --- /dev/null
> > +++ b/include/linux/mdio/mdio-regmap.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Driver for MMIO-Mapped MDIO devices. Some IPs expose internal
> > PHYs or PCS
> > + * within the MMIO-mapped area
> > + *
> > + * Copyright (C) 2023 Maxime Chevallier
> > <maxime.chevallier@bootlin.com>
> > + */
> > +#ifndef MDIO_REGMAP_H
> > +#define MDIO_REGMAP_H
> > +
> > +struct device;
> > +struct regmap;
> > +
> > +struct mdio_regmap_config {
> > +	struct device *parent;
> > +	struct regmap *regmap;
> > +	char name[MII_BUS_ID_SIZE];  
> 
> don't we need a header included for the MII_BUS_ID_SIZE macro?
> An empty C file which includes just <linux/mdio/mdio-regmap.h> must
> build without errors.

You're correct, I'll include the proper header.

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
