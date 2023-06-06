Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E5724623
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 16:33:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8FA1C65E70;
	Tue,  6 Jun 2023 14:33:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B7CC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+6wSVTqC9hZ5yHI/YY+rD+TrYLWp05DjiD+d7o8/gMY=; b=yc5efNVbf19ymsAUUBaBnelebW
 JyPWfx8REfOqdg5mC0LbkgJmSxIHCLoHZnt1fwAd9Fb5fhMIGrRHRZGK7fy3cJf+WE/4st62wQM5+
 MOqXIOAFOBxT38GvyJnHWLcDmysjFpSEIAyjGe6F8rMIWrlnXnjUn3lVmLnvaoJ9sISul+HRAvj5j
 /EXmlgr4td587HKgTQSC5TzgBkjUYp6hQx9Be3A/FhskmJuqzh0lH+r38Q8PX4/x+6ZhjZQuOmIix
 3Lp2CsuH/l5Plxbdh2M5eVjziM82JUbkWg/dif1UHsooLS370KkCj/ULsxrD+gEltO5MmN0TtMOXe
 KumfUCXg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53228)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q6Xk2-0005rf-Rf; Tue, 06 Jun 2023 15:32:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q6Xjx-0007Dl-Vz; Tue, 06 Jun 2023 15:32:54 +0100
Date: Tue, 6 Jun 2023 15:32:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <ZH9DlUqwm3YsNPu6@shell.armlinux.org.uk>
References: <20230606142144.308675-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606142144.308675-1-maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] Followup fixes for the
 dwmac and altera lynx conversion
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

On Tue, Jun 06, 2023 at 04:21:41PM +0200, Maxime Chevallier wrote:
> Following the TSE PCS removal and port of altera_tse and dwmac_socfpga,
> this series fixes some issues that slipped through the cracks.
> 
> Patch 1 fixes an unitialized struct in altera_tse
> 
> Patch 2 uses the correct Kconfig option for altera_tse
> 
> Patch 3 makes the Lynx PCS specific to dwmac_socfpga. This patch was
> originally written by Russell, my modifications just moves the
> #include<linux/pcs-lynx.h> around, to use it only in dwmac_socfpga.

Hi Maxime,

I'm sorry, but I think you need an extra patch added to this series.
Looking at include/linux/mdio/mdio-regmap.h, that defines:

struct mdio_regmap_config {
        struct device *parent;
        struct regmap *regmap;
        char name[MII_BUS_ID_SIZE];
        u8 valid_addr;
        bool autoscan;
};

In dwmac-socfpga.c, you have:

                struct mdio_regmap_config mrc;

                mrc.regmap = pcs_regmap;
                mrc.parent = &pdev->dev;
                mrc.valid_addr = 0x0;

                snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii", ndev->name);

So that's a tick for parent, tick for regmap, tick for name, tick
for valid_addr, but... autoscan is left uninitialised.
devm_mdio_regmap_register() reads this, and uses it to decide
how to set mii->phy_mask, which will be randomly ~0 or ~BIT(0)
depending on the value of mrc.autoscan.

Other than that, the series looks good. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
