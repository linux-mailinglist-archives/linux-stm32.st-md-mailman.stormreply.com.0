Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C2A9D3B6E
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 14:00:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A20B7C7803C;
	Wed, 20 Nov 2024 13:00:04 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 221EBC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 12:59:57 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BC7771A01D3;
 Wed, 20 Nov 2024 13:59:56 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AF1A01A01C6;
 Wed, 20 Nov 2024 13:59:56 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6EBB3202E4;
 Wed, 20 Nov 2024 13:59:56 +0100 (CET)
Date: Wed, 20 Nov 2024 13:59:56 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <Zz3dTNCb2/I0iDXV@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
 <ZzzGO5zgDvIK6JJ_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZzzGO5zgDvIK6JJ_@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v5 16/16] net: stmmac: platform: Fix PTP
 clock rate reading
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

On Tue, Nov 19, 2024 at 05:09:15PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 19, 2024 at 04:00:22PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The stmmac driver supports many vendors SoCs using Synopsys-licensed
> > Ethernet controller IP. Most of these vendors reuse the stmmac_platform
> > codebase, which has a potential PTP clock initialization issue.
> > The PTP clock rate reading might require ungating what is not provided.
> > 
> > Fix the PTP clock initialization by enabling it immediately.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index b1e4df1a86a0..db3e8ef4fc3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -632,7 +632,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >  	clk_prepare_enable(plat->pclk);
> >  
> >  	/* Fall-back to main clock in case of no PTP ref is passed */
> > -	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
> > +	plat->clk_ptp_ref = devm_clk_get_enabled(&pdev->dev, "ptp_ref");
> >  	if (IS_ERR(plat->clk_ptp_ref)) {
> >  		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
> >  		plat->clk_ptp_ref = NULL;
> 
> Looking at where the driver makes use of clk_ptp_ref, it currently
> prepares and enables this clock via stmmac_open(), disables and
> unprepares via stmmac_release().
> 
> There could be a platform where this is being used as a power saving
> measure, and replacing devm_clk_get() with devm_clk_get_enabled() will
> defeat that.
> 
> I would suggest that if you need the clock to be enabled in order to
> get its rate, then the call to clk_get_rate() should have the
> enable/disable around it to allow these other sites to work as they
> have done.
> 
> Alternatively, we may take the view that the power saving is not
> necessary, or stopping the clock is not a good idea (loss of time
> in the 1588 block?) so the above changed would be sensible but only
> if the clk_prepare_enable() and clk_disable_unprepare() calls on
> this particular clock are also removed.
> 
> I can't say which is the correct way forward.
> 

For me it looks more conservative way to use first option = enclose
the clk_get_rate() with clk_prepare_enable() and clk_disable_unprepare()
as this don't change the PTP clock status for other glue drivers.

BR.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
