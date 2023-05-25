Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3C2710A9D
	for <lists+linux-stm32@lfdr.de>; Thu, 25 May 2023 13:11:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0099C6A61A;
	Thu, 25 May 2023 11:11:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92FACC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 May 2023 11:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7pnqEDqTdXXIQOBLwb2FYHGZeiwAvkXUoR0xGIGm1tA=; b=Y5fWM8svQePSKhhdt6bnlWPjdN
 pZ6uBLzdn+6ZLX66yd6iAQSOPELpAsm2thocsaCrSBICaQtZpH+w3bUnUeot4cjW6uoEiJiKCNeEo
 Hn0UM8Oruh62o+WHwv+tl/PZnTilFT6xDZElEoyuozcUNcdyGxv0ln3N6Tg1Z5bTdz4KuHbdZTdI0
 v2NBZQ7iyQDxoBpGtCoF5ZRHR0YuQHEmi39yJynaQ4m0hD2JXpm1ux/qofPOcxXtoejMnAD2T2VSz
 UjuSYtERGhniQnzXMm9lrmwgxVsD3ZwcekQwK/a061aLpV7X72NKqDLos/hahiKnIEIhHTZCBX9nb
 JX3EUG6Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49710)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q28sj-0003y0-FZ; Thu, 25 May 2023 12:11:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q28sc-0002ct-V3; Thu, 25 May 2023 12:11:38 +0100
Date: Thu, 25 May 2023 12:11:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <ZG9CajddFYKAFlO/@shell.armlinux.org.uk>
References: <20230525101126.370108-1-maxime.chevallier@bootlin.com>
 <20230525101126.370108-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525101126.370108-2-maxime.chevallier@bootlin.com>
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

On Thu, May 25, 2023 at 12:11:23PM +0200, Maxime Chevallier wrote:
> +struct mii_bus *devm_mdio_regmap_register(struct device *dev,
> +					  const struct mdio_regmap_config *config)
> +{
> +	struct mdio_regmap_config *mrc;
> +	struct mii_bus *mii;
> +	int rc;
> +
> +	if (!config->parent)
> +		return ERR_PTR(-EINVAL);
> +
> +	mii = devm_mdiobus_alloc_size(config->parent, sizeof(*mrc));
> +	if (!mii)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mrc = mii->priv;
> +	memcpy(mrc, config, sizeof(*mrc));
> +
> +	mrc->regmap = config->regmap;
> +	mrc->valid_addr = config->valid_addr;

You have just memcpy'd everything from config into mrc. Doesn't this
already include "regmap" and "valid_addr" ?

However, these are the only two things used, so does it really make
sense to allocate the full mdio_regmap_config structure, or would a
smaller data structure (of one pointer and one u8) be more appropriate?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
