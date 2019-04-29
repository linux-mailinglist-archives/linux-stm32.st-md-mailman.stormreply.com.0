Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC70F0EF
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 09:10:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0F39C35E03
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 07:10:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2035FC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 15:15:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 08:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="144581521"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
 by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2019 08:15:44 -0700
Received: from pgsmsx114.gar.corp.intel.com ([169.254.4.194]) by
 PGSMSX101.gar.corp.intel.com ([169.254.1.108]) with mapi id 14.03.0415.000;
 Mon, 29 Apr 2019 23:15:43 +0800
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: Biao Huang <biao.huang@mediatek.com>, Jose Abreu <joabreu@synopsys.com>,
 "davem@davemloft.net" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH 2/2] net-next: stmmac: add mdio clause 45 access from
 mac device for dwmac4
Thread-Index: AQHU/lXS6cVDj4S/ZU28LSGbOEZpuqZTPxvA
Date: Mon, 29 Apr 2019 15:15:42 +0000
Message-ID: <AF233D1473C1364ABD51D28909A1B1B75C0C27ED@pgsmsx114.gar.corp.intel.com>
References: <1556519724-1576-1-git-send-email-biao.huang@mediatek.com>
 <1556519724-1576-3-git-send-email-biao.huang@mediatek.com>
In-Reply-To: <1556519724-1576-3-git-send-email-biao.huang@mediatek.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGRjNjhhMGEtMzNiNS00NWY5LWE3YmYtYmRlODJiMjZkNTI2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQVBHT2FQM1gzc1k1YmZhQmVlRU01VzFtSCthVGFKbVwveW5HenJWdWdBUGVWblo5VndIRFYzK2VCekVGbW9IM1cifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Apr 2019 07:10:11 +0000
Cc: "Kweh, Hock Leong" <hock.leong.kweh@intel.com>,
 "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yt.shen@mediatek.com" <yt.shen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] net-next: stmmac: add mdio clause 45
 access from mac device for dwmac4
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

>Subject: [PATCH 2/2] net-next: stmmac: add mdio clause 45 access from mac
>device for dwmac4
>
>add clause 45 mdio read and write from mac device for dwmac4.
>
>Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Hi,

I would like to point out that there is another C45 implementation
proposed here "net: stmmac: enable clause 45 mdio support" at
https://marc.info/?l=linux-netdev&m=155609745200339&w=2 

What is the preference of the driver maintainer here?  

Thanks
Boon Leong
>---
> drivers/net/ethernet/stmicro/stmmac/common.h      |   11 +-
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c |    3 +
> drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  167
>+++++++++++++++++++--
> 3 files changed, 165 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h
>b/drivers/net/ethernet/stmicro/stmmac/common.h
>index 709dcec..06573b3 100644
>--- a/drivers/net/ethernet/stmicro/stmmac/common.h
>+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
>@@ -410,12 +410,15 @@ struct mac_link {
> struct mii_regs {
> 	unsigned int addr;	/* MII Address */
> 	unsigned int data;	/* MII Data */
>-	unsigned int addr_shift;	/* MII address shift */
>-	unsigned int reg_shift;		/* MII reg shift */
>-	unsigned int addr_mask;		/* MII address mask */
>-	unsigned int reg_mask;		/* MII reg mask */
>+	unsigned int addr_shift;	/* PHY address shift */
>+	unsigned int cl45_reg_shift;	/* CL45 reg address shift */
>+	unsigned int reg_shift;		/* CL22 reg/CL45 dev shift */
>+	unsigned int addr_mask;		/* PHY address mask */
>+	unsigned int cl45_reg_mask;	/* CL45 reg mask */
>+	unsigned int reg_mask;		/* CL22 reg/CL45 dev mask */
> 	unsigned int clk_csr_shift;
> 	unsigned int clk_csr_mask;
>+	unsigned int cl45_en;	/* CL45 Enable*/
> };
>
> struct mac_device_info {
>diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
>b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
>index 2a41c64..1ca03f9 100644
>--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
>+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
>@@ -835,6 +835,9 @@ int dwmac4_setup(struct stmmac_priv *priv)
> 	mac->mii.reg_mask = GENMASK(20, 16);
> 	mac->mii.clk_csr_shift = 8;
> 	mac->mii.clk_csr_mask = GENMASK(11, 8);
>+	mac->mii.cl45_reg_shift = 16;
>+	mac->mii.cl45_reg_mask = GENMASK(31, 16);
>+	mac->mii.cl45_en = BIT(1);
>
> 	return 0;
> }
>diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
>b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
>index bdd3515..a70c967 100644
>--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
>+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
>@@ -150,16 +150,16 @@ static int stmmac_xgmac2_mdio_write(struct
>mii_bus *bus, int phyaddr,
> }
>
> /**
>- * stmmac_mdio_read
>+ * stmmac_c22_read
>  * @bus: points to the mii_bus structure
>- * @phyaddr: MII addr
>- * @phyreg: MII reg
>- * Description: it reads data from the MII register from within the phy device.
>+ * @phyaddr: clause 22 phy address
>+ * @phyreg: clause 22 phy register
>+ * Description: it reads data from the MII register follow clause 22.
>  * For the 7111 GMAC, we must set the bit 0 in the MII address register while
>  * accessing the PHY registers.
>  * Fortunately, it seems this has no drawback for the 7109 MAC.
>  */
>-static int stmmac_mdio_read(struct mii_bus *bus, int phyaddr, int phyreg)
>+static int stmmac_c22_read(struct mii_bus *bus, int phyaddr, int phyreg)
> {
> 	struct net_device *ndev = bus->priv;
> 	struct stmmac_priv *priv = netdev_priv(ndev);
>@@ -194,15 +194,15 @@ static int stmmac_mdio_read(struct mii_bus *bus,
>int phyaddr, int phyreg)
> }
>
> /**
>- * stmmac_mdio_write
>+ * stmmac_c22_write
>  * @bus: points to the mii_bus structure
>- * @phyaddr: MII addr
>- * @phyreg: MII reg
>- * @phydata: phy data
>- * Description: it writes the data into the MII register from within the device.
>+ * @phyaddr: clause-22 phy address
>+ * @phyreg: clause-22 phy register
>+ * @phydata: clause-22 phy data
>+ * Description: it writes the data into the MII register follow clause 22.
>  */
>-static int stmmac_mdio_write(struct mii_bus *bus, int phyaddr, int phyreg,
>-			     u16 phydata)
>+static int stmmac_c22_write(struct mii_bus *bus, int phyaddr, int phyreg,
>+			    u16 phydata)
> {
> 	struct net_device *ndev = bus->priv;
> 	struct stmmac_priv *priv = netdev_priv(ndev);
>@@ -237,6 +237,149 @@ static int stmmac_mdio_write(struct mii_bus *bus,
>int phyaddr, int phyreg,
> }
>
> /**
>+ * stmmac_c45_read
>+ * @bus: points to the mii_bus structure
>+ * @phyaddr: clause-45 phy address
>+ * @devad: clause-45 device address
>+ * @prtad: clause-45 register address
>+ * @phydata: phy data
>+ * Description: it reads the data from the  MII register follow clause 45.
>+ */
>+static int stmmac_c45_read(struct mii_bus *bus, int phyaddr,
>+			   int devad, int prtad)
>+{
>+	struct net_device *ndev = bus->priv;
>+	struct stmmac_priv *priv = netdev_priv(ndev);
>+	unsigned int mii_address = priv->hw->mii.addr;
>+	unsigned int mii_data = priv->hw->mii.data;
>+	u32 v, value;
>+	int data;
>+
>+	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
>+			       100, 10000))
>+		return -EIO;
>+
>+	value = 0;
>+	value |= (prtad << priv->hw->mii.cl45_reg_shift)
>+			& priv->hw->mii.cl45_reg_mask;
>+	writel(value, priv->ioaddr + mii_data);
>+
>+	/* delay 2ms to avoid error value of get_phy_c45_devs_in_pkg */
>+	mdelay(2);
>+
>+	value = MII_BUSY;
>+	value |= (phyaddr << priv->hw->mii.addr_shift)
>+		& priv->hw->mii.addr_mask;
>+	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
>+	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
>+		& priv->hw->mii.clk_csr_mask;
>+	if (priv->plat->has_gmac4) {
>+		value |= MII_GMAC4_READ;
>+		value |= priv->hw->mii.cl45_en;
>+	}
>+	writel(value, priv->ioaddr + mii_address);
>+
>+	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
>+			       100, 10000))
>+		return -EIO;
>+
>+	/* Read the data from the MII data register */
>+	data = (int)(readl(priv->ioaddr + mii_data) & 0xffff);
>+
>+	return data;
>+}
>+
>+/**
>+ * stmmac_c45_write
>+ * @bus: points to the mii_bus structure
>+ * @phyaddr: clause-45 phy address
>+ * @devad: clause-45 device address
>+ * @prtad: clause-45 register address
>+ * @phydata: phy data
>+ * Description: it writes the data into the MII register follow clause 45.
>+ */
>+static int stmmac_c45_write(struct mii_bus *bus, int phyaddr, int devad,
>+			    int prtad, u16 phydata)
>+{
>+	struct net_device *ndev = bus->priv;
>+	struct stmmac_priv *priv = netdev_priv(ndev);
>+	unsigned int mii_address = priv->hw->mii.addr;
>+	unsigned int mii_data = priv->hw->mii.data;
>+	u32 v, value;
>+
>+	/* Wait until any existing MII operation is complete */
>+	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
>+			       100, 10000))
>+		return -EIO;
>+
>+	value = phydata;
>+	value |= (prtad << priv->hw->mii.cl45_reg_shift) &
>+		 priv->hw->mii.cl45_reg_mask;
>+	writel(value, priv->ioaddr + mii_data);
>+
>+	mdelay(2);
>+
>+	value = MII_BUSY;
>+	value |= (phyaddr << priv->hw->mii.addr_shift) &
>+		 priv->hw->mii.addr_mask;
>+	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
>+	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift) &
>+		 priv->hw->mii.clk_csr_mask;
>+
>+	if (priv->plat->has_gmac4) {
>+		value |= MII_GMAC4_WRITE;
>+		value |= priv->hw->mii.cl45_en;
>+	}
>+	writel(value, priv->ioaddr + mii_address);
>+
>+	/* Wait until any existing MII operation is complete */
>+	return readl_poll_timeout(priv->ioaddr + mii_address, v, !(v &
>MII_BUSY),
>+				  100, 10000);
>+}
>+
>+/**
>+ * stmmac_mdio_read
>+ * @bus: points to the mii_bus structure
>+ * @phyaddr: MII addr
>+ * @phyreg: MII reg
>+ * Description: it reads data from the MII register from within the phy device.
>+ */
>+static int stmmac_mdio_read(struct mii_bus *bus, int phyaddr, int phyreg)
>+{
>+	if (phyreg & MII_ADDR_C45) {
>+		int devad, prtad;
>+
>+		devad = (phyreg >> 16) & 0x1f;
>+		prtad = phyreg & 0xffff;
>+		return stmmac_c45_read(bus, phyaddr, devad, prtad);
>+	} else {
>+		return stmmac_c22_read(bus, phyaddr, phyreg);
>+	}
>+}
>+
>+/**
>+ * stmmac_mdio_write
>+ * @bus: points to the mii_bus structure
>+ * @phyaddr: MII addr
>+ * @phyreg: MII reg
>+ * @phydata: phy data
>+ * Description: it writes the data into the MII register from within the device.
>+ */
>+static int stmmac_mdio_write(struct mii_bus *bus, int phyaddr, int phyreg,
>+			     u16 phydata)
>+{
>+	if (phyreg & MII_ADDR_C45) {
>+		int devad, prtad;
>+
>+		devad = (phyreg >> 16) & 0x1f;
>+		prtad = phyreg & 0xffff;
>+		return stmmac_c45_write(bus, phyaddr, devad, prtad,
>phydata);
>+	} else {
>+		return stmmac_c22_write(bus, phyaddr, phyreg, phydata);
>+	}
>+}
>+
>+/**
>  * stmmac_mdio_reset
>  * @bus: points to the mii_bus structure
>  * Description: reset the MII bus
>--
>1.7.9.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
