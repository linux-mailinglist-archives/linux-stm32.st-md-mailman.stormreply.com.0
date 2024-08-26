Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ADE95ED5E
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 11:36:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 787ABC78020;
	Mon, 26 Aug 2024 09:36:12 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F31FDC78036
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 09:36:08 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wslp91RsWz1HHQH;
 Mon, 26 Aug 2024 17:32:49 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id A991E140120;
 Mon, 26 Aug 2024 17:36:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 17:36:05 +0800
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
Date: Mon, 26 Aug 2024 17:43:27 +0800
Message-ID: <20240826094328.2991664-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826094328.2991664-1-ruanjinjie@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Subject: [Linux-stm32] [PATCH -next RESEND 09/10] mtd: rawnand: stm32_fmc2:
	Use for_each_child_of_node_scoped()
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
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 264556939a00..0f67e96cc240 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1851,7 +1851,6 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
 static int stm32_fmc2_nfc_parse_dt(struct stm32_fmc2_nfc *nfc)
 {
 	struct device_node *dn = nfc->dev->of_node;
-	struct device_node *child;
 	int nchips = of_get_child_count(dn);
 	int ret = 0;
 
@@ -1865,12 +1864,10 @@ static int stm32_fmc2_nfc_parse_dt(struct stm32_fmc2_nfc *nfc)
 		return -EINVAL;
 	}
 
-	for_each_child_of_node(dn, child) {
+	for_each_child_of_node_scoped(dn, child) {
 		ret = stm32_fmc2_nfc_parse_child(nfc, child);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return ret;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
