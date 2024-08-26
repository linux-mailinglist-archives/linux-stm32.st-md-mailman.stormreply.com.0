Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B495ED5D
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 11:36:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DAEAC7801C;
	Mon, 26 Aug 2024 09:36:12 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7F21C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 09:36:07 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wsls40rFFz14HGd;
 Mon, 26 Aug 2024 17:35:20 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 8D364140120;
 Mon, 26 Aug 2024 17:36:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 17:36:04 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <miquel.raynal@bootlin.com>, <michal.simek@amd.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <liang.yang@amlogic.com>, <neil.armstrong@linaro.org>,
 <khilman@baylibre.com>, <jbrunet@baylibre.com>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <heiko@sntech.de>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>, 
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
 <ruanjinjie@huawei.com>, <gustavoars@kernel.org>, <linux@treblig.org>,
 <robh@kernel.org>, <u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
 <christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
 <christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
 <jic23@kernel.org>
Date: Mon, 26 Aug 2024 17:43:26 +0800
Message-ID: <20240826094328.2991664-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826094328.2991664-1-ruanjinjie@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Subject: [Linux-stm32] [PATCH -next RESEND 08/10] mtd: rawnand: renesas: Use
	for_each_child_of_node_scoped()
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

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index c9a01feff8df..0e92d50c5249 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1297,23 +1297,17 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 
 static int rnandc_chips_init(struct rnandc *rnandc)
 {
-	struct device_node *np;
 	int ret;
 
-	for_each_child_of_node(rnandc->dev->of_node, np) {
+	for_each_child_of_node_scoped(rnandc->dev->of_node, np) {
 		ret = rnandc_chip_init(rnandc, np);
 		if (ret) {
-			of_node_put(np);
-			goto cleanup_chips;
+			rnandc_chips_cleanup(rnandc);
+			return ret;
 		}
 	}
 
 	return 0;
-
-cleanup_chips:
-	rnandc_chips_cleanup(rnandc);
-
-	return ret;
 }
 
 static int rnandc_probe(struct platform_device *pdev)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
