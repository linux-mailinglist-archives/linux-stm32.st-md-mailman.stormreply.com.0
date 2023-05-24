Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390370FCAD
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 19:31:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB553C6B442;
	Wed, 24 May 2023 17:31:07 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1730C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=UW92ufDuHDQa/8zkJAYoDYkMfqyRGPbyr6wWCuYK70M=; b=k3MER93/VUdCYomBAyXSBQfMJP
 g2j7r3trlgqHzFI6DrHbflc3zGanqHcb6V1+Dtke1TX1E5G1Nry2Tvv2Xh0rTWmFpdgxQB8Gad5Yy
 y+2Uwo9i8QM9c9ZbjgBiw76VgzuQ9tQRksJOakBJPpj1QOa/kZKuwgWjBdI/ZO2uoBP0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1q1sK3-00DonO-3H; Wed, 24 May 2023 19:30:51 +0200
Date: Wed, 24 May 2023 19:30:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <8f779d98-d437-4d8b-914d-8e315b4aca17@lunn.ch>
References: <20230524130807.310089-1-maxime.chevallier@bootlin.com>
 <20230524130807.310089-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230524130807.310089-2-maxime.chevallier@bootlin.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Mark Brown <broonie@kernel.org>, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
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

> +	mii->name = DRV_NAME;
> +	strscpy(mii->id, config->name, MII_BUS_ID_SIZE);
> +	mii->parent = config->parent;
> +	mii->read = mdio_regmap_read_c22;
> +	mii->write = mdio_regmap_write_c22;

Since there is only one valid address on the bus, you can set
mii->phy_mask to make the scanning of the bus a little faster.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
