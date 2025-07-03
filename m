Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE27AF802B
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 20:35:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60B66C3F953;
	Thu,  3 Jul 2025 18:35:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6444C3F952
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 18:35:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9599B5C546D;
 Thu,  3 Jul 2025 18:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4F4C4CEE3;
 Thu,  3 Jul 2025 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751567742;
 bh=IC0AaW5NceEW8wxtKNxGomplDZEXFb+Zwef0eWisnmM=;
 h=From:To:Cc:Subject:Date:From;
 b=PheJp7dWH1mp9+0iIi+SIENaoI39JddxSfVd9oADxS2XX9TvHBmG8aVj5XsY99dtU
 8GAh+dffJIKsFZ87UQTsXNggJL2zVcssdldw1A/BPNtjcUGxZyfkO19lnr+vK3Ranr
 nVI1qh0IZZ5HuI7yfcgdZeHuio9qskwZ7ooRvlHSgai/C6+YjSFCPthc8wDkg2p19s
 smvV/H1emWZbk3ie33DnFEt5FzUk2naSynnrHwRE0iNQ20RArlo+bL8Avz5McfVqaJ
 lzQDY2QlYjYs2khC6a74BnjN/pY7fzWFIhwOD65jbP652AkmRX03pqBcST9M8yjwDc
 Ub8ed2A0aHHWA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu,  3 Jul 2025 13:35:37 -0500
Message-ID: <20250703183537.2075746-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH] spi: stm32-ospi: Use
	of_reserved_mem_region_to_resource() for "memory-region"
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

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/spi/spi-stm32-ospi.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 7c1fa55fbc47..fbf00909b6c5 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -771,7 +771,7 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_ospi *ospi = platform_get_drvdata(pdev);
-	struct resource *res;
+	struct resource *res, _res;
 	struct reserved_mem *rmem = NULL;
 	struct device_node *node;
 	int ret;
@@ -825,17 +825,13 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 			goto err_dma;
 	}
 
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (node)
-		rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-
-	if (rmem) {
-		ospi->mm_size = rmem->size;
-		ospi->mm_base = devm_ioremap(dev, rmem->base, rmem->size);
+	res = &_res;
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, res);
+	if (!ret) {
+		ospi->mm_size = resource_size(res);
+		ospi->mm_base = devm_ioremap_resource(dev, res);
 		if (!ospi->mm_base) {
-			dev_err(dev, "unable to map memory region: %pa+%pa\n",
-				&rmem->base, &rmem->size);
+			dev_err(dev, "unable to map memory region: %pR\n", res);
 			ret = -ENOMEM;
 			goto err_dma;
 		}
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
