Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F338E7BEC73
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 23:14:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C5A7C6A61D;
	Mon,  9 Oct 2023 21:14:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E37C6C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 21:14:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B95761408;
 Mon,  9 Oct 2023 21:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E11C433C9;
 Mon,  9 Oct 2023 21:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696886050;
 bh=ap+N4R7Wc3zrVcWCqueifWjRY3gKqtLPPObPANvaRsk=;
 h=From:To:Cc:Subject:Date:From;
 b=TVSZcFjRyC7NOrF9so6qHNBtuo+KIMrX90xu8b0s84vESKo1rjdBKTP5arrqgz4dU
 vczOV3E0se5gfXpwDbWENgDdv2gyIykl4ipD6b5oW5mZrwoUw+UHdowlMhnPNfznlq
 goKjV9SX1G3g1SpdbUFQdGP8e3ZCCEF4onWxTx3x9quk3pMQ3QSBWSk8YMg4TOO3Af
 FY7n8xJQJcSZb8aHSPX1fAUBxczb/xH6oLOFdxs2C29TikoQ2nIoN95nDlJGoau2io
 MoCA05Y1aABlgrGECtgnbeupVBbR2BCORCXChMYO4/nb+UBP4Sd3HfCrlsLhSDlbwp
 Wk0FkMr0ACigg==
Received: (nullmailer pid 3245212 invoked by uid 1000);
 Mon, 09 Oct 2023 21:14:07 -0000
From: Rob Herring <robh@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon,  9 Oct 2023 16:13:32 -0500
Message-ID: <20231009211356.3242037-2-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: stm32-dcmi: Drop unnecessary
	of_match_device() call
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
 drivers/media/platform/st/stm32/stm32-dcmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 8cb4fdcae137..48140fdf40bb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -20,7 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
@@ -1890,7 +1889,6 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 static int dcmi_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *match = NULL;
 	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
 	struct stm32_dcmi *dcmi;
 	struct vb2_queue *q;
@@ -1899,12 +1897,6 @@ static int dcmi_probe(struct platform_device *pdev)
 	struct clk *mclk;
 	int ret = 0;
 
-	match = of_match_device(of_match_ptr(stm32_dcmi_of_match), &pdev->dev);
-	if (!match) {
-		dev_err(&pdev->dev, "Could not find a match in devicetree\n");
-		return -ENODEV;
-	}
-
 	dcmi = devm_kzalloc(&pdev->dev, sizeof(struct stm32_dcmi), GFP_KERNEL);
 	if (!dcmi)
 		return -ENOMEM;
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
