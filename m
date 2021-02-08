Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A9313444
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:03:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 034D0C57B57;
	Mon,  8 Feb 2021 14:03:48 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27935C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:03:46 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Joao Pinto
 <Joao.Pinto@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>
Date: Mon, 8 Feb 2021 17:03:22 +0300
Message-ID: <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 01/20] net: phy: realtek: Fix events detection
	failure in LPI mode
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

It has been noticed that RTL8211E PHY stops detecting and reporting events
when EEE is successfully advertised and RXC stopping in LPI is enabled.
The freeze happens right after 3.0.10 bit (PC1R "Clock Stop Enable"
register) is set. At the same time LED2 stops blinking as if EEE mode has
been disabled. Notably the network traffic still flows through the PHY
with no obvious problem. Anyway if any MDIO read procedure is performed
after the "RXC stop in LPI" mode is enabled PHY gets to be unfrozen, LED2
starts blinking and PHY interrupts happens again. The problem has been
noticed on RTL8211E PHY working together with DW GMAC 3.73a MAC and
reporting its event via a dedicated IRQ signal. (Obviously the problem has
been unnoticed in the polling mode, since it gets naturally fixed by the
periodic MDIO read procedure from the PHY status register - BMSR.)

In order to fix that problem we suggest to locally re-implement the MMD
write method for RTL8211E PHY and perform a dummy read right after the
PC1R register is accessed to enable the RXC stopping in LPI mode.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/net/phy/realtek.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 99ecd6c4c15a..cbb86c257aae 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -559,6 +559,42 @@ static int rtl822x_write_mmd(struct phy_device *phydev, int devnum, u16 regnum,
 	return ret;
 }
 
+static int rtl8211e_write_mmd(struct phy_device *phydev, int devnum, u16 regnum,
+			      u16 val)
+{
+	int ret;
+
+	/* Write to the MMD registers by using the standard control/data pair.
+	 * The only difference is that we need to perform a dummy read after
+	 * the PC1R.CLKSTOP_EN bit is set. It's required to workaround an issue
+	 * of a partial core freeze so LED2 stops blinking in EEE mode, PHY
+	 * stops detecting the link change and raising IRQs until any read from
+	 * its registers performed. That happens only if and right after the PHY
+	 * is enabled to stop RXC in LPI mode.
+	 */
+	ret = __phy_write(phydev, MII_MMD_CTRL, devnum);
+	if (ret)
+		return ret;
+
+	ret = __phy_write(phydev, MII_MMD_DATA, regnum);
+	if (ret)
+		return ret;
+
+	ret = __phy_write(phydev, MII_MMD_CTRL, devnum | MII_MMD_CTRL_NOINCR);
+	if (ret)
+		return ret;
+
+	ret = __phy_write(phydev, MII_MMD_DATA, val);
+	if (ret)
+		return ret;
+
+	if (devnum == MDIO_MMD_PCS && regnum == MDIO_CTRL1 &&
+	    val & MDIO_PCS_CTRL1_CLKSTOP_EN)
+		ret =  __phy_read(phydev, MII_MMD_DATA);
+
+	return ret < 0 ? ret : 0;
+}
+
 static int rtl822x_get_features(struct phy_device *phydev)
 {
 	int val;
@@ -725,6 +761,7 @@ static struct phy_driver realtek_drvs[] = {
 		.resume		= genphy_resume,
 		.read_page	= rtl821x_read_page,
 		.write_page	= rtl821x_write_page,
+		.write_mmd	= rtl8211e_write_mmd,
 	}, {
 		PHY_ID_MATCH_EXACT(0x001cc916),
 		.name		= "RTL8211F Gigabit Ethernet",
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
