Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 935B09C405C
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 15:08:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B2FFC78F66;
	Mon, 11 Nov 2024 14:08:59 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5E33C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 14:08:52 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7999E1A117E;
 Mon, 11 Nov 2024 15:08:52 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6CDCC1A1174;
 Mon, 11 Nov 2024 15:08:52 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2C4EF2037A;
 Mon, 11 Nov 2024 15:08:52 +0100 (CET)
Date: Mon, 11 Nov 2024 15:08:52 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZzIP9OrIi+X/akgg@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
 <c902dc2a-9b2a-44a0-be1d-88fb150f4f17@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c902dc2a-9b2a-44a0-be1d-88fb150f4f17@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
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
Subject: Re: [Linux-stm32] [PATCH v4 14/16] net: stmmac: dwmac-s32: add
 basic NXP S32G/S32R glue driver
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

On Tue, Oct 29, 2024 at 01:15:52PM +0100, Andrew Lunn wrote:
> > +#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
> > +#define GMAC_TX_RATE_25M	25000000	/* 25MHz */
> > +#define GMAC_TX_RATE_2M5	2500000		/* 2.5MHz */
> 
> With the swap to the new helper, i think 25M and 2M5 are no longer
> needed.
> 

Sure, I will fix it in v5.

> > +static int s32_gmac_init(struct platform_device *pdev, void *priv)
> > +{
> > +	struct s32_priv_data *gmac = priv;
> > +	int ret;
> > +
> > +	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> > +	if (!ret)
> > +		ret = clk_prepare_enable(gmac->tx_clk);
> > +
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Can't set tx clock\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = clk_prepare_enable(gmac->rx_clk);
> > +	if (ret)
> > +		dev_dbg(&pdev->dev, "Can't set rx, clock source is disabled.\n");
> > +	else
> > +		gmac->rx_clk_enabled = true;
> 
> Why would this fail? And if it does fail, why is it not fatal? Maybe a
> comment here.
> 
> > +static void s32_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > +{
> > +	struct s32_priv_data *gmac = priv;
> > +	long tx_clk_rate;
> > +	int ret;
> > +
> > +	if (!gmac->rx_clk_enabled) {
> > +		ret = clk_prepare_enable(gmac->rx_clk);
> > +		if (ret) {
> > +			dev_err(gmac->dev, "Can't set rx clock\n");
> 
> dev_err(), so is failing now fatal, but since this is a void function,
> you cannot report the error up the call stack?
> 

I did a homework and checked the issue which was fixed by that 'lazy' rx
clock enable procedure and got conslusion it is not needed anymore, as I
was not able to reproduce the issue on the same board but with newer
kernel version (6.6.32 versus 5.15.73).

So I will simplify rx clock management in v5.

BR.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
