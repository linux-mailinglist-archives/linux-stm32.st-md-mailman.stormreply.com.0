Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E17710842
	for <lists+linux-stm32@lfdr.de>; Thu, 25 May 2023 11:04:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0699DC6A61E;
	Thu, 25 May 2023 09:04:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B86DC6A611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 May 2023 09:04:35 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3DCB460013;
 Thu, 25 May 2023 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685005475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8AnUzsP3UiJT5MlwCjsZ+EyBtgzsenG9IYcBknz1kBQ=;
 b=U2M8IBLinR/uVFzSNOYp/JLVIV4pHW8pufMV2Zwvzee1LzdOwuJE1bMW6bWaMWJsNDmvSp
 x/3aTpevugcHU38/xepiBW7Sze2R82WDfkHxpB5skOSFvbT44byBFf+Q6dMFT2/F7N2huE
 Lds8/8E4zgK67x7VwXM6Y/DKtOlxlePfu8vDsCtGWfk/uAbDDltY1kFBWMIhP+gBN6hAI4
 jCozUHi3CGSgjNaz5ey+RK3dPL2f1EAqo7kivOGX3oiZT03/W+/WNraV6IZzr8uw2acXk0
 7klvjDcM+HPd7bnQjcAnHzpowAxnzoRK1Iid2cTwu8rRXSmDvx0mp2ZIkxZ4oQ==
Date: Thu, 25 May 2023 11:04:29 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Message-ID: <20230525110429.66ba241b@pc-7.home>
In-Reply-To: <20230524174145.hhurl4olnzmfadww@skbuf>
References: <20230524130807.310089-1-maxime.chevallier@bootlin.com>
 <20230524130807.310089-2-maxime.chevallier@bootlin.com>
 <8f779d98-d437-4d8b-914d-8e315b4aca17@lunn.ch>
 <20230524174145.hhurl4olnzmfadww@skbuf>
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
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] net: mdio: Introduce a
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

Hello Vlad, Andrew,

On Wed, 24 May 2023 20:41:45 +0300
Vladimir Oltean <vladimir.oltean@nxp.com> wrote:

> On Wed, May 24, 2023 at 07:30:51PM +0200, Andrew Lunn wrote:
> > > +	mii->name = DRV_NAME;
> > > +	strscpy(mii->id, config->name, MII_BUS_ID_SIZE);
> > > +	mii->parent = config->parent;
> > > +	mii->read = mdio_regmap_read_c22;
> > > +	mii->write = mdio_regmap_write_c22;  
> > 
> > Since there is only one valid address on the bus, you can set
> > mii->phy_mask to make the scanning of the bus a little faster.  

Good point, I'll add that.

> Sorry, I didn't reach this thread yet, I don't have the full context.
> Just wanted to add: if the caller knows that there's only a PCS and
> not a PHY on this bus, you don't want auto-scanning at all, since
> that will create an unconnected phy_device. It would be good if the
> caller provided the phy_mask.

As there can only be one mdiodevice on that bus, and we are already
passing the address of the only available device in struct
mdio_rgmap_config.valid_addr, I guess we can simply add a flag to
indicate if autoscan needs to be enabled or not, and set phy_mask to
either unmask the only valid address, or plain ~0UL if we don't want
autoscan at all.

Thanks both of you for the reviews,

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
