Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 848DC6900A9
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 08:03:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12BEDC6A5EE;
	Thu,  9 Feb 2023 07:03:41 +0000 (UTC)
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A9FDC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 11:23:48 +0000 (UTC)
X-QQ-mid: bizesmtp83t1675855333tqlmoazp
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 08 Feb 2023 19:22:11 +0800 (CST)
X-QQ-SSF: 01400000002000C0E000B00A0000000
X-QQ-FEAT: +ynUkgUhZJkgxBW25sgaiH/6+7B8q4hv7dUbmG0IJXh+FcLwy8TJioLF9lJc4
 i+qkeJQGYAtgftz4SDjv9+M4Lq5UcfLVXneqXU7H9hVHpgNVYAEHH9qcCf9bJRPa1pQqkOd
 S8tJICcyYfOTZlEOGMkReFWc91aFitazJX9a8h/NpkwcJng7F2zEGVtzXhxh7/GEnqbfL+U
 2mpNWYr1oqwZDbs6mHqps3b+XDWp5jGd9H1pZ/kxTpnV1Z7lfDrXfMoIXBL322HPn5EeCMr
 DPTuZbQbrTbSgl0XyRmC5EjieOsUEGZ1aPmOim3rV0VAOPgRTenPSi3xYmYXvRZe1qltvzU
 xLLnC8uA/58XqeL6/GYdip5VLGODZBl0JxqHGnGQqRJkyVxfdeW0kVCjcwakg==
X-QQ-GoodBg: 2
From: Guan Wentao <guanwentao@uniontech.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com
Date: Wed,  8 Feb 2023 19:20:54 +0800
Message-Id: <20230208112054.22965-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Thu, 09 Feb 2023 07:03:39 +0000
Cc: Guan Wentao <guanwentao@uniontech.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: get phydev->interface from mac
	for mdio phy init
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

The phy->interface from mdiobus_get_phy is default from phy_device_create.
In some phy devices like at803x, we need the correct value to init delay.
Use priv->plat->interface to init if we know.

Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1a5b8dab5e9b..1dc9c7f3d714 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1162,6 +1162,12 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
+		/* If we know the interface, it defines which PHY interface */
+		if (priv->plat->interface > 0) {
+			phydev->interface = priv->plat->interface;
+			netdev_dbg(priv->dev, "Override default phy interface\n");
+		}
+
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	}
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
