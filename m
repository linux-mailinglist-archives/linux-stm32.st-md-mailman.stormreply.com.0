Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 235F0712B57
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 19:03:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1752C6A615;
	Fri, 26 May 2023 17:03:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C62F4C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 17:03:09 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685120589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWL96i2b6wLdc7YFdYrED44ksL215UVHjxBXdsVvpkg=;
 b=dJrvSZ0w7jWKXlkvJy6LRn2l1Po5KnPlV9dToIWd+vf2A66cp3cQTc13GLMXU8aOUicbcO
 m9zQsJbqFN1Ja+oSK1YgC/pP7Yzz5rflqUDLjRFR5gvZLveyuQlhLc0qysL45sCA4QdSJK
 O42yMaMjZ194KFrM/RYpm7HX78FlKY5JM05ChCIv+egvwu9gb2pleQF9SvDJPmk3fNk2JF
 oIl8xNiWOKqUFxhQhB01EUL2rOg3pH/gSNKlnDMSutaf0tPRDqGe+wUYCxCSrST3CjUha4
 2JYgkknvshk1s/ftK74053h1F/fQEEEBiVwrUdo+TKsxdezrI1GV8PxWm3US0w==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFCD0C000C;
 Fri, 26 May 2023 17:03:05 +0000 (UTC)
Date: Fri, 26 May 2023 19:03:04 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <20230526190304.0b9ce032@pc-7.home>
In-Reply-To: <ZHBwLBnKacQCG2/U@corigine.com>
References: <20230526074252.480200-1-maxime.chevallier@bootlin.com>
 <20230526074252.480200-3-maxime.chevallier@bootlin.com>
 <ZHBwLBnKacQCG2/U@corigine.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/4] net: ethernet:
 altera-tse: Convert to mdio-regmap and use PCS Lynx
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

On Fri, 26 May 2023 10:39:08 +0200
Simon Horman <simon.horman@corigine.com> wrote:

> On Fri, May 26, 2023 at 09:42:50AM +0200, Maxime Chevallier wrote:
> > The newly introduced regmap-based MDIO driver allows for an easy
> > mapping of an mdiodevice onto the memory-mapped TSE PCS, which is
> > actually a Lynx PCS.
> > 
> > Convert Altera TSE to use this PCS instead of the pcs-altera-tse,
> > which is nothing more than a memory-mapped Lynx PCS.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>  
> 
> Hi Maxime,
> 
> I have some concerns about the error paths in this patch.

Heh I didn't do a very good job in that regard indeed :/ I'll address
these, but I'll wait for Russell series to make it through though.

Thanks for spotting this.

> ...
> 
> > @@ -1134,13 +1136,21 @@ static int altera_tse_probe(struct
> > platform_device *pdev) const struct of_device_id *of_id = NULL;
> >  	struct altera_tse_private *priv;
> >  	struct resource *control_port;
> > +	struct regmap *pcs_regmap;
> >  	struct resource *dma_res;
> >  	struct resource *pcs_res;
> > +	struct mii_bus *pcs_bus;
> >  	struct net_device *ndev;
> >  	void __iomem *descmap;
> > -	int pcs_reg_width = 2;
> >  	int ret = -ENODEV;
> >  
> > +	struct regmap_config pcs_regmap_cfg;  
> 
> nit: this probably belongs in with the bunch of declarations above it.
> 
> > +
> > +	struct mdio_regmap_config mrc = {
> > +		.parent = &pdev->dev,
> > +		.valid_addr = 0x0,
> > +	};  
> 
> nit: maybe this too.
> 
> > +
> >  	ndev = alloc_etherdev(sizeof(struct altera_tse_private));
> >  	if (!ndev) {
> >  		dev_err(&pdev->dev, "Could not allocate network
> > device\n"); @@ -1258,10 +1268,29 @@ static int
> > altera_tse_probe(struct platform_device *pdev) ret =
> > request_and_map(pdev, "pcs", &pcs_res, &priv->pcs_base);
> >  	if (ret) {
> > +		/* If we can't find a dedicated resource for the
> > PCS, fallback
> > +		 * to the internal PCS, that has a different
> > address stride
> > +		 */
> >  		priv->pcs_base = priv->mac_dev +
> > tse_csroffs(mdio_phy0);
> > -		pcs_reg_width = 4;
> > +		pcs_regmap_cfg.reg_bits = 32;
> > +		/* Values are MDIO-like values, on 16 bits */
> > +		pcs_regmap_cfg.val_bits = 16;
> > +		pcs_regmap_cfg.reg_shift = REGMAP_UPSHIFT(2);
> > +	} else {
> > +		pcs_regmap_cfg.reg_bits = 16;
> > +		pcs_regmap_cfg.val_bits = 16;
> > +		pcs_regmap_cfg.reg_shift = REGMAP_UPSHIFT(1);
> >  	}
> >  
> > +	/* Create a regmap for the PCS so that it can be used by
> > the PCS driver */
> > +	pcs_regmap = devm_regmap_init_mmio(&pdev->dev,
> > priv->pcs_base,
> > +					   &pcs_regmap_cfg);
> > +	if (IS_ERR(pcs_regmap)) {
> > +		ret = PTR_ERR(pcs_regmap);
> > +		goto err_free_netdev;
> > +	}
> > +	mrc.regmap = pcs_regmap;
> > +
> >  	/* Rx IRQ */
> >  	priv->rx_irq = platform_get_irq_byname(pdev, "rx_irq");
> >  	if (priv->rx_irq == -ENXIO) {
> > @@ -1384,7 +1413,20 @@ static int altera_tse_probe(struct
> > platform_device *pdev) (unsigned long) control_port->start,
> > priv->rx_irq, priv->tx_irq);
> >  
> > -	priv->pcs = alt_tse_pcs_create(ndev, priv->pcs_base,
> > pcs_reg_width);
> > +	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii",
> > ndev->name);
> > +	pcs_bus = devm_mdio_regmap_register(&pdev->dev, &mrc);
> > +	if (IS_ERR(pcs_bus)) {
> > +		ret = PTR_ERR(pcs_bus);
> > +		goto err_init_phy;
> > +	}
> > +
> > +	priv->pcs_mdiodev = mdio_device_create(pcs_bus, 0);  
> 
> mdio_device_create() can fail. Should that be handled here?
> 
> > +
> > +	priv->pcs = lynx_pcs_create(priv->pcs_mdiodev);
> > +	if (!priv->pcs) {
> > +		ret = -ENODEV;
> > +		goto err_init_phy;  
> 
> Does this leak priv->pcs_mdiodev?
> 
> > +	}
> >  
> >  	priv->phylink_config.dev = &ndev->dev;
> >  	priv->phylink_config.type = PHYLINK_NETDEV;
> > @@ -1407,11 +1449,12 @@ static int altera_tse_probe(struct
> > platform_device *pdev) if (IS_ERR(priv->phylink)) {
> >  		dev_err(&pdev->dev, "failed to create phylink\n");
> >  		ret = PTR_ERR(priv->phylink);
> > -		goto err_init_phy;
> > +		goto err_pcs;  
> 
> Does this leak priv->pcs ?
> 
> >  	}
> >  
> >  	return 0;
> > -
> > +err_pcs:
> > +	mdio_device_free(priv->pcs_mdiodev);
> >  err_init_phy:
> >  	unregister_netdev(ndev);
> >  err_register_netdev:
> > @@ -1433,6 +1476,8 @@ static int altera_tse_remove(struct
> > platform_device *pdev) altera_tse_mdio_destroy(ndev);
> >  	unregister_netdev(ndev);
> >  	phylink_destroy(priv->phylink);
> > +	mdio_device_free(priv->pcs_mdiodev);
> > +
> >  	free_netdev(ndev);
> >  
> >  	return 0;
> > diff --git a/include/linux/mdio/mdio-regmap.h
> > b/include/linux/mdio/mdio-regmap.h index b8508f152552..679d9069846b
> > 100644 --- a/include/linux/mdio/mdio-regmap.h
> > +++ b/include/linux/mdio/mdio-regmap.h
> > @@ -7,6 +7,8 @@
> >  #ifndef MDIO_REGMAP_H
> >  #define MDIO_REGMAP_H
> >  
> > +#include <linux/phy.h>
> > +
> >  struct device;
> >  struct regmap;
> >    
> 
> This hunk doesn't seem strictly related to the patch.
> Perhaps the include belongs elsewhere.
> Or the hunk belongs in another patch.

Indeed, I had the same issue in another patch in this series. I'll
re-split everything correctly.

Thank you for the review,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
