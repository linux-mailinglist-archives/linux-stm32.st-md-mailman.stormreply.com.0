Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A6DD0433F
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 17:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CB62C8F284;
	Thu,  8 Jan 2026 16:10:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3ACB5C8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9t7RCksMujyX8swqWhQFyBcp3/5sZoVMAXP5liIPnO4=; b=MUkuf7d4NGuYAxwkVk9mclIZTv
 rQkxwMcTmvPhz/Kw12SRCpYrQqIrghTkAih2KJBlTQo1HL0t49AXbFxUMnWSEnYh8/au6xX3OgSm+
 Gdz/GE2hMy9Q/PNkbAGPAdwXozpQpeqMwvm56lget2bUVOTy6JWwu2Rg0QB8whV/FgcnHdMDVCj9q
 838POOGOoyKQPyiuetEPrUTs3m5GKgZJkcQS5I6SQVWtfkTm6pXayDHWOv7Ki+NPx9yTJ4emGhWji
 KCOjGpln/bNT4P2649CWeMQkBW2X5bT4wfktefrIul/Yf3WGxZNHpDXBMe6KtKWyOoU7adosVGaHH
 EmItGm0w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54696)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vdsaN-000000002ps-3OJZ;
 Thu, 08 Jan 2026 16:10:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vdsaJ-000000002TW-45kC; Thu, 08 Jan 2026 16:10:03 +0000
Date: Thu, 8 Jan 2026 16:10:03 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <aV_W2yLmnHrTvbTP@shell.armlinux.org.uk>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
 <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 bsp-development.geo@leica-geosystems.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/3] net: stmmac: socfpga: add call to
 assert/deassert ahb reset line
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

On Thu, Jan 08, 2026 at 07:08:09AM -0600, Dinh Nguyen wrote:
> The "stmmaceth-ocp" reset line of stmmac controller on the SoCFPGA
> platform is essentially the "ahb" reset on the standard stmmac
> controller. But since stmmaceth-ocp has already been introduced into
> the wild, we cannot just remove support for it. But what we can do is
> to support both "stmmaceth-ocp" and "ahb" reset names. Going forward we
> will be using "ahb", but in order to not break ABI, we will be call reset
> assert/de-assert both ahb and stmmaceth-ocp.
> 
> The ethernet hardware on SoCFPGA requires either the stmmaceth-ocp or
> ahb reset to be asserted every time before changing the phy mode, then
> de-asserted when the phy mode has been set.

This is not SoCFPGA specific. The dwmac core only samples its
phy_intf_sel_i signals when coming out of reset, and then latches
that as the operating mode.

Currently, the dwmac core driver does not support dynamically changing
plat_dat->phy_interface at runtime. That may change in the future, but
as it requires a hardware reset which will clear out the PTP state, it
would need consideration of that effect.

The SoCFPGA driver only calls the set_phy_mode() methods from
socfpga_dwmac_init(), which in turn is called from the plat_dat->init
hook. This will be called from:

1. When stmmac_dvr_probe() is called, prior to allocating any
   resources, and prior to the core driver's first call to:
   reset_control_deassert(priv->plat->stmmac_ahb_rst);

2. As plat_dat->resume is not populated by the glue driver, the init
   hook will also be called when resuming from stmmac_resume().

Lastly, nothing in the main driver corrently writes to ->phy_interface.

I would like to see the platform glue drivers using more of what is
in the core driver, rather than re-inventing it, so I support the
idea of getting rid of dwmac->stmmac_ocp_rst.

What I suggest is to get rid of dwmac->stmmac_ocp_rst now.
devm_stmmac_probe_config_dt() will parse the device tree, looking for
the "ahb" reset, and assigning that to plat->stmmac_ahb_rst. If it
doesn't exist, then plat->stmmac-ahb_rst will be NULL.

So, in socfpga_dwmac_probe(), do something like this:

	struct reset_control *ocp_rst;
...
	if (!plat_dat->stmmac_ahb_rst) {
		ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");
		if (IS_ERR(ocp_rst))
			return dev_err_probe(dev, PTR_ERR(ocp_rst),
					     "failed to get ocp reset");

		if (ocp_rst)
			dev_warn(dev, "ocp reset is deprecated, please update device tree.\n");

		plat_dat->stmmac_ahb_rst = ocp_rst;
	}

Then, change all remaining instances of dwmac->stmmac_ocp_rst to
dwmac->plat_dat->stmmac_ahb_rst... and job done. You have compatibility
with device trees that use "ahb", and with device trees that use
"stmmaceth-ocp".

Given that struct socfpga_dwmac contains the plat_dat pointer, rather
than copying plat_dat->stmmac_rst to your private structure, please
use the one in the plat_dat structure.

The next question I have is - do you need to assert both the AHB reset
and stmmac_rst to set the PHY interface mode? I don't see a dependency
between these two resets in the socfpga code - the driver doesn't treat
them as nested. It asserts the AHB reset _then_ the stmmac reset, and
then releases them in the same order rather than reverse order. This
suggests there's no interdependence between them, and probably it's
only necessary to assert the stmmac core's reset (stmmac_rst).

So, maybe the driver can leave the handling of plat_dat->stmmac_ahb_rst
to the stmmac core code?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
