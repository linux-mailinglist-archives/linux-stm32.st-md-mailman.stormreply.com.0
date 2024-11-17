Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A98859D0484
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Nov 2024 16:39:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52038C7802E;
	Sun, 17 Nov 2024 15:39:13 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF60AC78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Nov 2024 15:39:05 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 604521A033D;
 Sun, 17 Nov 2024 16:39:05 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5302A1A0018;
 Sun, 17 Nov 2024 16:39:05 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0CBCC203CE;
 Sun, 17 Nov 2024 16:39:05 +0100 (CET)
Date: Sun, 17 Nov 2024 16:39:05 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZzoOGdlbQXQVxPkv@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-16-03618f10e3e2@oss.nxp.com>
 <9154cc5f-a330-4f6d-b161-827e64231e35@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9154cc5f-a330-4f6d-b161-827e64231e35@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Andrei Botila <andrei.botila@nxp.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: Re: [Linux-stm32] [PATCH v4 16/16] net: stmmac: dwmac-s32: Read PTP
 clock rate when ready
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

On Tue, Oct 29, 2024 at 01:18:43PM +0100, Andrew Lunn wrote:
> On Mon, Oct 28, 2024 at 09:24:58PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The PTP clock is read by stmmac_platform during DT parse.
> > On S32G/R the clock is not ready and returns 0. Postpone
> > reading of the clock on PTP init.
> 
> This needs more explanation as to why this is a feature, not a bug,
> for the PTP clock.
> 

Thanks for comment. I did a homework and found out the root cause is
using PTP clocks before they are properly enabled. As I understand,
the clocks, especially the composite variant, require preparation and/or
enabling them, what is not managed correctly for PTP clocks when
stmmac_platform is used. In this case, the PTP clock value is read this way:

   stmmac_probe_config_dt:
   // https://github.com/torvalds/linux/blob/4a5df37964673effcd9f84041f7423206a5ae5f2/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c#L634

	/* Fall-back to main clock in case of no PTP ref is passed */
	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
	if (IS_ERR(plat->clk_ptp_ref)) {
		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
		plat->clk_ptp_ref = NULL;
		dev_info(&pdev->dev, "PTP uses main clock\n");
	} else {
		plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
	}

If I change getter to enabled getter:
	plat->clk_ptp_ref = devm_clk_get_enabled(&pdev->dev, "ptp_ref");

The driver got valid rate and the patch is not needed anymore.

So, if I didn't miss something, it seems like I have to replace the current
patch with one fixing clk getter.

BR.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
