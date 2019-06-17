Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C28CF4897E
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 18:58:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 131D7C67C8A
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 16:58:45 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B48D7C67C88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 16:58:44 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hcuxo-0000Ez-Te; Mon, 17 Jun 2019 16:58:37 +0000
From: Colin King <colin.king@canonical.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 17 Jun 2019 17:58:36 +0100
Message-Id: <20190617165836.4673-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: add sanity check to
	device_property_read_u32_array call
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

From: Colin Ian King <colin.king@canonical.com>

Currently the call to device_property_read_u32_array is not error checked
leading to potential garbage values in the delays array that are then used
in msleep delays.  Add a sanity check to the property fetching.

Addresses-Coverity: ("Uninitialized scalar variable")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index da310de06bf6..5b7923c0698c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -242,6 +242,7 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	if (priv->device->of_node) {
 		struct gpio_desc *reset_gpio;
 		u32 delays[3];
+		int ret;
 
 		reset_gpio = devm_gpiod_get_optional(priv->device,
 						     "snps,reset",
@@ -249,9 +250,15 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		if (IS_ERR(reset_gpio))
 			return PTR_ERR(reset_gpio);
 
-		device_property_read_u32_array(priv->device,
-					       "snps,reset-delays-us",
-					       delays, ARRAY_SIZE(delays));
+		ret = device_property_read_u32_array(priv->device,
+						     "snps,reset-delays-us",
+						     delays,
+						     ARRAY_SIZE(delays));
+		if (ret) {
+			dev_err(ndev->dev.parent,
+				"invalid property snps,reset-delays-us\n");
+			return -EINVAL;
+		}
 
 		if (delays[0])
 			msleep(DIV_ROUND_UP(delays[0], 1000));
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
