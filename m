Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1C7710C41
	for <lists+linux-stm32@lfdr.de>; Thu, 25 May 2023 14:44:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECF71C6905A;
	Thu, 25 May 2023 12:44:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 135F2C04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 May 2023 12:44:04 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685018644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=feQW98atuVGJR2g0z3VlLS9I5fF0OgwIq8sXEMfFC28=;
 b=d2q9GAMDrDVfcZSPsOhWMuyyoXiCcYlXwPhHX3iLR80pY8cnEsNDVhuflsLM1uEys7WC3Q
 iEk/QVY+mnBmjDGSB3MW4JvhtiMokHVMM04OkEC1kzROmDIBxrLJlP+PlFHiSYfCN11lP3
 2DZhxM4AtrVs7tWNVv/SHhSJzPEX6xUHfNdmPwz/SfBJvgbQRTwHRGohnvU9gELWmwU/kP
 dTXDtu5DL7U2BInP48pr7dfIWP8EzQKQV8B75aGxMr1H4hLldw8CTJcb2PjHuBxIrkqnzw
 SVMspbG1cBVIBsd2YXO5IzXPlnai3Hu5uq+siLA5CoF22I2JX8K+jxyZgBe8rQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9647C0013;
 Thu, 25 May 2023 12:44:00 +0000 (UTC)
Date: Thu, 25 May 2023 14:43:59 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <20230525144359.0cb16996@pc-7.home>
In-Reply-To: <ZG9AT4EeCmoyN5N2@corigine.com>
References: <20230525101126.370108-1-maxime.chevallier@bootlin.com>
 <20230525101126.370108-2-maxime.chevallier@bootlin.com>
 <ZG9AT4EeCmoyN5N2@corigine.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/4] net: mdio: Introduce a
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

Hello Simon,

On Thu, 25 May 2023 13:02:39 +0200
Simon Horman <simon.horman@corigine.com> wrote:

> On Thu, May 25, 2023 at 12:11:23PM +0200, Maxime Chevallier wrote:
> > There exists several examples today of devices that embed an
> > ethernet PHY or PCS directly inside an SoC. In this situation,
> > either the device is controlled through a vendor-specific register
> > set, or sometimes exposes the standard 802.3 registers that are
> > typically accessed over MDIO.
> > 
> > As phylib and phylink are designed to use mdiodevices, this driver
> > allows creating a virtual MDIO bus, that translates mdiodev register
> > accesses to regmap accesses.
> > 
> > The reason we use regmap is because there are at least 3 such
> > devices known today, 2 of them are Altera TSE PCS's, memory-mapped,
> > exposed with a 4-byte stride in stmmac's dwmac-socfpga variant, and
> > a 2-byte stride in altera-tse. The other one
> > (nxp,sja1110-base-tx-mdio) is exposed over SPI.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>  
> 
> ...
> 
> > +struct mii_bus *devm_mdio_regmap_register(struct device *dev,
> > +					  const struct
> > mdio_regmap_config *config) +{
> > +	struct mdio_regmap_config *mrc;
> > +	struct mii_bus *mii;
> > +	int rc;
> > +
> > +	if (!config->parent)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	mii = devm_mdiobus_alloc_size(config->parent,
> > sizeof(*mrc));
> > +	if (!mii)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	mrc = mii->priv;
> > +	memcpy(mrc, config, sizeof(*mrc));
> > +
> > +	mrc->regmap = config->regmap;
> > +	mrc->valid_addr = config->valid_addr;
> > +
> > +	mii->name = DRV_NAME;
> > +	strscpy(mii->id, config->name, MII_BUS_ID_SIZE);
> > +	mii->parent = config->parent;
> > +	mii->read = mdio_regmap_read_c22;
> > +	mii->write = mdio_regmap_write_c22;
> > +
> > +	if (config->autoscan)
> > +		mii->phy_mask = ~BIT(config->valid_addr);
> > +	else
> > +		mii->phy_mask = ~0UL;  
> 
> Hi Maxime,
> 
> phy_mask is a u32.
> But 0UL may be either 32 or 64 bits wide.

Right

> I think a better approach would be to use U32_MAX.

I guess ~0 would also work, and this would also align with what
fixed-phy and sfp do for their internal MDIO bus.

I'll fix that for next revision

Thanks,

Maxime
> > +
> > +	rc = devm_mdiobus_register(dev, mii);
> > +	if (rc) {
> > +		dev_err(config->parent, "Cannot register MDIO
> > bus![%s] (%d)\n", mii->id, rc);
> > +		return ERR_PTR(rc);
> > +	}
> > +
> > +	return mii;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_mdio_regmap_register);
> > +
> > +MODULE_DESCRIPTION("MDIO API over regmap");
> > +MODULE_AUTHOR("Maxime Chevallier <maxime.chevallier@bootlin.com>");
> > +MODULE_LICENSE("GPL");  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
