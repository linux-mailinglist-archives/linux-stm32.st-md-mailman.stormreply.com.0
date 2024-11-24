Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A14B99D787E
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Nov 2024 23:18:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52B3CC78F62;
	Sun, 24 Nov 2024 22:18:48 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E22FC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Nov 2024 22:18:41 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D40F01A07D4;
 Sun, 24 Nov 2024 23:18:40 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C192A1A07F5;
 Sun, 24 Nov 2024 23:18:40 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 722BA203B1;
 Sun, 24 Nov 2024 23:18:39 +0100 (CET)
Date: Sun, 24 Nov 2024 23:18:40 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <Z0OmQI+4sEbA0lFs@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-14-7dcc90fcffef@oss.nxp.com>
 <ZzzDu0tcyixAZ8l1@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZzzDu0tcyixAZ8l1@shell.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH v5 14/16] net: stmmac: dwmac-s32: add
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

On Tue, Nov 19, 2024 at 04:58:35PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 19, 2024 at 04:00:20PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > NXP S32G2xx/S32G3xx and S32R45 are automotive grade SoCs
> > that integrate one or two Synopsys DWMAC 5.10/5.20 IPs.
> > 
> > The basic driver supports only RGMII interface.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> One thing that stands out to me in this is the duplication of the PHY
> interface mode. I would much prefer if we didn't end up with multiple
> copies, but instead made use of the one already in plat_stmmacenet_data
> maybe by storing a its pointer in struct s32_priv_data?

I missed the struct plat_stmmacenet_data's phy_interface member. I
switch the duplicate member intf_mode in struct s32_priv_data to
pointer.

> 
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig     |  12 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile    |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 204 ++++++++++++++++++++++++
> >  3 files changed, 217 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > index 05cc07b8f48c..a6579377bedb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -154,6 +154,18 @@ config DWMAC_RZN1
> >  	  the stmmac device driver. This support can make use of a custom MII
> >  	  converter PCS device.
> >  
> > +config DWMAC_S32
> > +	tristate "NXP S32G/S32R GMAC support"
> > +	default ARCH_S32
> > +	depends on OF && (ARCH_S32 || COMPILE_TEST)
> > +	help
> > +	  Support for ethernet controller on NXP S32CC SOCs.
> > +
> > +	  This selects NXP SoC glue layer support for the stmmac
> > +	  device driver. This driver is used for the S32CC series
> > +	  SOCs GMAC ethernet controller, ie. S32G2xx, S32G3xx and
> > +	  S32R45.
> > +
> >  config DWMAC_SOCFPGA
> >  	tristate "SOCFPGA dwmac support"
> >  	default ARCH_INTEL_SOCFPGA
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > index c2f0e91f6bf8..1e87e2652c82 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > @@ -22,6 +22,7 @@ obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
> >  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
> >  obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
> >  obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
> > +obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
> >  obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
> >  obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
> >  obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > new file mode 100644
> > index 000000000000..9af7cd093100
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > @@ -0,0 +1,204 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * NXP S32G/R GMAC glue layer
> > + *
> > + * Copyright 2019-2024 NXP
> > + *
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/ethtool.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of_mdio.h>
> > +#include <linux/of_address.h>
> > +#include <linux/phy.h>
> > +#include <linux/phylink.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/stmmac.h>
> > +
> > +#include "stmmac_platform.h"
> > +
> > +#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
> > +
> > +/* SoC PHY interface control register */
> > +#define PHY_INTF_SEL_MII	0x00
> > +#define PHY_INTF_SEL_SGMII	0x01
> > +#define PHY_INTF_SEL_RGMII	0x02
> > +#define PHY_INTF_SEL_RMII	0x08
> > +
> > +struct s32_priv_data {
> > +	void __iomem *ioaddr;
> > +	void __iomem *ctrl_sts;
> > +	struct device *dev;
> > +	phy_interface_t intf_mode;
> > +	struct clk *tx_clk;
> > +	struct clk *rx_clk;
> > +};
> > +
> > +static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
> > +{
> > +	u32 intf_sel;
> > +
> > +	switch (gmac->intf_mode) {
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		intf_sel = PHY_INTF_SEL_RGMII;
> > +		break;
> > +	default:
> > +		dev_err(gmac->dev, "Unsupported PHY interface: %s\n",
> > +			phy_modes(gmac->intf_mode));
> > +		return -EINVAL;
> > +	}
> 
> This can be simplfied to:
> 
> 	if (!phy_interface_mode_is_rgmii(...)) {
> 		dev_err(gmac->dev, "Unsupported PHY interface: %s\n",
> 			phy_modes(...));
> 		return -EINVAL;
> 	}
> 
> Also, would it not be better to validate this in s32_dwmac_probe()?
> 

Thanks, I move the interface mode to s32_dwmac_probe() in v6.

BR.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
