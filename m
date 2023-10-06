Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C527BC131
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 23:38:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8937EC6C837;
	Fri,  6 Oct 2023 21:38:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C286C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 21:38:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B603B61AAF;
 Fri,  6 Oct 2023 21:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC90C433C7;
 Fri,  6 Oct 2023 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696628323;
 bh=mtOK85aeQi5zxtQ5qxl21dr+kSNJG6tsBGqhON2xals=;
 h=From:To:Cc:Subject:Date:From;
 b=mdA3EliYhLBRpICdZsSU/iSXwksjuJCbPBVnMmVEXFlTNPi4yUhxf5ukz9QIMWj5W
 B2iCefR1QD8PN2ISKt18ovC8btGFvYO4HSXQhvNJagWYw+oI5iwUa6HROCmKqznthQ
 +dqEN11aHAySxDS7qK5Yk7YUIx+GMCAogv9FoTsJysUo8dSfshzP4Gn0dEv4OkjpSr
 /eeNZ1JrfFMt2AoYaw6+XsIpWrgFob+Cc8snCZaV25CNCUraZagwFw28wEBcmC8OFK
 g362ICGYQbYa1Z/hjCDITCmz2lXa9m/RCck7Pios36Fbw1WwljU8whA5WHZrTEsfex
 E1/8Qk4EMB2RQ==
Received: (nullmailer pid 332965 invoked by uid 1000);
 Fri, 06 Oct 2023 21:38:40 -0000
From: Rob Herring <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  6 Oct 2023 16:38:35 -0500
Message-Id: <20231006213835.332848-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dmaengine: Drop unnecessary of_match_device()
	calls
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

If probe is reached, we've already matched the device and in the case of
DT matching, the struct device_node pointer will be set. Therefore, there
is no need to call of_match_device() in probe.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/dma/k3dma.c     | 25 ++++++++++---------------
 drivers/dma/mmp_pdma.c  |  5 +----
 drivers/dma/pxa_dma.c   |  7 ++-----
 drivers/dma/stm32-dma.c |  8 --------
 4 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index 22b37b525a48..5de8c21d41e7 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -15,7 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/of_dma.h>
@@ -839,7 +838,6 @@ static int k3_dma_probe(struct platform_device *op)
 {
 	const struct k3dma_soc_data *soc_data;
 	struct k3_dma_dev *d;
-	const struct of_device_id *of_id;
 	int i, ret, irq = 0;
 
 	d = devm_kzalloc(&op->dev, sizeof(*d), GFP_KERNEL);
@@ -854,19 +852,16 @@ static int k3_dma_probe(struct platform_device *op)
 	if (IS_ERR(d->base))
 		return PTR_ERR(d->base);
 
-	of_id = of_match_device(k3_pdma_dt_ids, &op->dev);
-	if (of_id) {
-		of_property_read_u32((&op->dev)->of_node,
-				"dma-channels", &d->dma_channels);
-		of_property_read_u32((&op->dev)->of_node,
-				"dma-requests", &d->dma_requests);
-		ret = of_property_read_u32((&op->dev)->of_node,
-				"dma-channel-mask", &d->dma_channel_mask);
-		if (ret) {
-			dev_warn(&op->dev,
-				 "dma-channel-mask doesn't exist, considering all as available.\n");
-			d->dma_channel_mask = (u32)~0UL;
-		}
+	of_property_read_u32((&op->dev)->of_node,
+			"dma-channels", &d->dma_channels);
+	of_property_read_u32((&op->dev)->of_node,
+			"dma-requests", &d->dma_requests);
+	ret = of_property_read_u32((&op->dev)->of_node,
+			"dma-channel-mask", &d->dma_channel_mask);
+	if (ret) {
+		dev_warn(&op->dev,
+			 "dma-channel-mask doesn't exist, considering all as available.\n");
+		d->dma_channel_mask = (u32)~0UL;
 	}
 
 	if (!(soc_data->flags & K3_FLAG_NOCLK)) {
diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 492ec491a59b..136fcaeff8dd 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -15,7 +15,6 @@
 #include <linux/device.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1019,7 +1018,6 @@ static struct dma_chan *mmp_pdma_dma_xlate(struct of_phandle_args *dma_spec,
 static int mmp_pdma_probe(struct platform_device *op)
 {
 	struct mmp_pdma_device *pdev;
-	const struct of_device_id *of_id;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
@@ -1039,8 +1037,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(pdev->base))
 		return PTR_ERR(pdev->base);
 
-	of_id = of_match_device(mmp_pdma_dt_ids, pdev->dev);
-	if (of_id) {
+	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",
 					 &dma_channels))
diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index 3c574dc0613b..e260cadfc46f 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -15,9 +15,8 @@
 #include <linux/device.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
-#include <linux/of_device.h>
-#include <linux/of_dma.h>
 #include <linux/of.h>
+#include <linux/of_dma.h>
 #include <linux/wait.h>
 #include <linux/dma/pxa-dma.h>
 
@@ -1342,7 +1341,6 @@ static int pxad_init_dmadev(struct platform_device *op,
 static int pxad_probe(struct platform_device *op)
 {
 	struct pxad_device *pdev;
-	const struct of_device_id *of_id;
 	const struct dma_slave_map *slave_map = NULL;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
 	int ret, dma_channels = 0, nb_requestors = 0, slave_map_cnt = 0;
@@ -1360,8 +1358,7 @@ static int pxad_probe(struct platform_device *op)
 	if (IS_ERR(pdev->base))
 		return PTR_ERR(pdev->base);
 
-	of_id = of_match_device(pxad_dt_ids, &op->dev);
-	if (of_id) {
+	if (op->dev.of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(op->dev.of_node, "dma-channels",
 					 &dma_channels))
diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index a732b3807b11..c8089e77c950 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -21,7 +21,6 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -1561,17 +1560,10 @@ static int stm32_dma_probe(struct platform_device *pdev)
 	struct stm32_dma_chan *chan;
 	struct stm32_dma_device *dmadev;
 	struct dma_device *dd;
-	const struct of_device_id *match;
 	struct resource *res;
 	struct reset_control *rst;
 	int i, ret;
 
-	match = of_match_device(stm32_dma_of_match, &pdev->dev);
-	if (!match) {
-		dev_err(&pdev->dev, "Error: No device match found\n");
-		return -ENODEV;
-	}
-
 	dmadev = devm_kzalloc(&pdev->dev, sizeof(*dmadev), GFP_KERNEL);
 	if (!dmadev)
 		return -ENOMEM;
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
