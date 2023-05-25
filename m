Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 158DC710C37
	for <lists+linux-stm32@lfdr.de>; Thu, 25 May 2023 14:41:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7745C6905A;
	Thu, 25 May 2023 12:41:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF13BC04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 May 2023 12:41:26 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685018486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LATq8y11VRK+GDnUyeoDnyHykvQtZzA+fhIGVKjKY/U=;
 b=OGofsE+mR6iQKrs/9UPk/kfzFlZ3sYngSppWGdbBDEN8LMeuuBybN3pbzUOaLcG8BOVY50
 TAuIl6LQPms5JDcysh30Vv7UULvEuwIbFjnaiCyKyCV7u8OXbUNwJ6up6P8zquak+GVywq
 kr/RCiEH0Di34lJxSHTINUqeOkldbzSHoGWllzmKKvCoEh7GLPVEVVQcuQVRB5d5ZFbrk2
 yPo88m59D6AQdd8LOoXAkps0ThJVqa/tH4eowLWICFcVoBW62NDHZP/YPlLT74SNWy19Ee
 lvu37L8+0b4ZpgLOwhByES6qIRs3fNSOb0DkjWrzyWLRomw4fC7xBf9n4tWguA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70B8660007;
 Thu, 25 May 2023 12:41:23 +0000 (UTC)
Date: Thu, 25 May 2023 14:41:22 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230525144122.3d2d8aba@pc-7.home>
In-Reply-To: <ZG9CajddFYKAFlO/@shell.armlinux.org.uk>
References: <20230525101126.370108-1-maxime.chevallier@bootlin.com>
 <20230525101126.370108-2-maxime.chevallier@bootlin.com>
 <ZG9CajddFYKAFlO/@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, linux-stm32@st-md-mailman.stormreply.com,
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

Hello Russell,

On Thu, 25 May 2023 12:11:38 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Thu, May 25, 2023 at 12:11:23PM +0200, Maxime Chevallier wrote:
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
> 
> You have just memcpy'd everything from config into mrc. Doesn't this
> already include "regmap" and "valid_addr" ?

Oh right... good catch, thanks !

> However, these are the only two things used, so does it really make
> sense to allocate the full mdio_regmap_config structure, or would a
> smaller data structure (of one pointer and one u8) be more
> appropriate?
> 

You are correct, other fields are unused so I'll use a new struct for
the mii->priv field.

Thank you for reviewing,

Best regards,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
