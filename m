Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C027A9A2FB
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 09:12:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48400C78F72;
	Thu, 24 Apr 2025 07:12:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D675BC7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 07:12:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C216243A39;
 Thu, 24 Apr 2025 07:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745478752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcCvskkAvrE3dpzstivzwhhvcSYs52ScThWYLV//VMw=;
 b=FH64OYzN4ny6D8XvWJGI1+JqPMBtzoiw0J5FosX91MoJQ77obJ9tlfJacevOlh2LwkDCdW
 mdzeLjuoAjddgSIm4zn9NNwj3GHnYK1T471kttz1fPQFjmYIGkUJaODH+86Pn/sNWw2IJ1
 B24reWtN+2yu625G1qI6G+L98W8fQ653NwLnMe+xz04OFcEeGzivoPFLeCNkLe1oKS5gmn
 xGtxyBFT8U5a+63nzv6Zi9hr4vSKSKAs6V6NjJh09GIA59r4odws4C7IWxaHod71fQqFYA
 cJ3AneYbCufIv3qa4ZHVo23GzUPrL/RsTiha6Jp2w148fXxCN5LaCpG8gWvTbQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Date: Thu, 24 Apr 2025 09:12:21 +0200
Message-ID: <20250424071223.221239-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
References: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhto
 hepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: socfpga: Don't
	check for phy to enable the SGMII adapter
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

The SGMII adapter needs to be enabled for both Cisco SGMII and 1000BaseX
operations. It doesn't make sense to check for an attached phydev here,
as we simply might not have any, in particular if we're using the
1000BaseX interface mode.

Make so that we only re-enable the SGMII adapter when it's present, and
when we use a phy_mode that is handled by said adapter.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 027356033e5e..c832a41c1747 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -62,14 +62,13 @@ struct socfpga_dwmac {
 	struct mdio_device *pcs_mdiodev;
 };
 
-static void socfpga_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static void socfpga_dwmac_fix_mac_speed(void *bsp_priv, int speed,
+					unsigned int mode)
 {
-	struct socfpga_dwmac *dwmac = (struct socfpga_dwmac *)priv;
+	struct socfpga_dwmac *dwmac = (struct socfpga_dwmac *)bsp_priv;
+	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dwmac->dev));
 	void __iomem *splitter_base = dwmac->splitter_base;
 	void __iomem *sgmii_adapter_base = dwmac->sgmii_adapter_base;
-	struct device *dev = dwmac->dev;
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct phy_device *phy_dev = ndev->phydev;
 	u32 val;
 
 	if (sgmii_adapter_base)
@@ -96,7 +95,9 @@ static void socfpga_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode
 		writel(val, splitter_base + EMAC_SPLITTER_CTRL_REG);
 	}
 
-	if (phy_dev && sgmii_adapter_base)
+	if ((priv->plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
+	     priv->plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) &&
+	     sgmii_adapter_base)
 		writew(SGMII_ADAPTER_ENABLE,
 		       sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
 }
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
