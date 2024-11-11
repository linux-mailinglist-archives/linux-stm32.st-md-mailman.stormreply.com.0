Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7D9D417E
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1153C7A83E;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE80BC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 13:50:35 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 58C102010CF;
 Mon, 11 Nov 2024 14:50:35 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 52B662010C6;
 Mon, 11 Nov 2024 14:50:35 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 10FFE20326;
 Mon, 11 Nov 2024 14:50:35 +0100 (CET)
Date: Mon, 11 Nov 2024 14:50:35 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Simon Horman <horms@kernel.org>
Message-ID: <ZzILq99H/Zj4I/6Q@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
 <20241105134206.GE4507@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241105134206.GE4507@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
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
Subject: Re: [Linux-stm32] [PATCH v4 05/16] net: dwmac-dwc-qos-eth: Use
	helper rgmii_clock
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

On Tue, Nov 05, 2024 at 01:42:06PM +0000, Simon Horman wrote:
> On Mon, Oct 28, 2024 at 09:24:47PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > Utilize a new helper function rgmii_clock().
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> > index ec924c6c76c6..5080891c33e0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> > @@ -181,24 +181,19 @@ static void dwc_qos_remove(struct platform_device *pdev)
> >  static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> >  {
> >  	struct tegra_eqos *eqos = priv;
> > -	unsigned long rate = 125000000;
> > +	long rate = 125000000;
> >  	bool needs_calibration = false;
> >  	u32 value;
> >  	int err;
> 
> Hi Jan,
> 
> As it seems that there will be another revision anyway,
> please update the above so that the local variable declarations
> are in reverse xmas tree order - longest line to shortest.
> 
> Likewise in s32_dwmac_probe() in the patch
> "net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver".
> 

Hi Simon,
thanks for review, I will add those formating fixes in v5.

BR.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
