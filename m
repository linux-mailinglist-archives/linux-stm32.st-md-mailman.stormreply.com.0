Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB2768DBA
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3358C6C83E;
	Mon, 31 Jul 2023 07:17:27 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CE51C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 13:16:17 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qLkYW-0005P3-T3; Tue, 18 Jul 2023 15:15:56 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qLkYW-0002nJ-1f; Tue, 18 Jul 2023 15:15:56 +0200
Date: Tue, 18 Jul 2023 15:15:56 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20230718131556.bdp3sykrkkylp4pb@pengutronix.de>
References: <20230717164307.2868264-1-m.felsch@pengutronix.de>
 <20230717164307.2868264-2-m.felsch@pengutronix.de>
 <accc8d89-7565-460e-a874-a491b755bbb8@lunn.ch>
 <20230718083504.r3znx6iixtq7vkjt@pengutronix.de>
 <427214fb-6206-47b3-bf5b-8b1cfc8b7677@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <427214fb-6206-47b3-bf5b-8b1cfc8b7677@lunn.ch>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:17 +0000
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: platform: add
 support for phy-supply
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

On 23-07-18, Andrew Lunn wrote:
> On Tue, Jul 18, 2023 at 10:35:04AM +0200, Marco Felsch wrote:
> > On 23-07-18, Andrew Lunn wrote:
> > > On Mon, Jul 17, 2023 at 06:43:07PM +0200, Marco Felsch wrote:
> > > > Add generic phy-supply handling support to control the phy regulator.
> > > > Use the common stmmac_platform code path so all drivers using
> > > > stmmac_probe_config_dt() and stmmac_pltfr_pm_ops can use it.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  .../ethernet/stmicro/stmmac/stmmac_platform.c | 51 +++++++++++++++++++
> > > >  include/linux/stmmac.h                        |  1 +
> > > >  2 files changed, 52 insertions(+)
> > > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > > index eb0b2898daa3d..6193d42b53fb7 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > > @@ -10,6 +10,7 @@
> > > >  
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/pm_runtime.h>
> > > > +#include <linux/regulator/consumer.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/of.h>
> > > > @@ -423,6 +424,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> > > >  	if (plat->interface < 0)
> > > >  		plat->interface = plat->phy_interface;
> > > >  
> > > > +	/* Optional regulator for PHY */
> > > > +	plat->phy_regulator = devm_regulator_get_optional(&pdev->dev, "phy");
> > > > +	if (IS_ERR(plat->phy_regulator)) {
> > > > +		if (PTR_ERR(plat->phy_regulator) == -EPROBE_DEFER)
> > > > +			return ERR_CAST(plat->phy_regulator);
> > > > +		dev_info(&pdev->dev, "No regulator found\n");
> > > > +		plat->phy_regulator = NULL;
> > > > +	}
> > > > +
> > > 
> > > So this gets the regulator. When do you actually turn it on?
> > 
> > During the suspend/resume logic like the rockchip, sun8i platform
> > integrations did.
> 
> So you are assuming the boot loader has turned it on?
> 
> You also might have a difference between the actual state, and what
> kernel thinks the state is, depending on how the regulator is
> implemented.
> 
> It would be better to explicitly turn it on before registering the
> MDIO bus.

You're right, I changed this. Thanks for the hint.

Regards,
  Marco
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
