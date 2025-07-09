Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C0CAFDD4D
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 04:16:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 196FDC36B2A;
	Wed,  9 Jul 2025 02:16:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A018C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 02:16:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DBF555C655E;
 Wed,  9 Jul 2025 02:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F00C4CEED;
 Wed,  9 Jul 2025 02:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752027404;
 bh=W34gJZJ0Sfv42p0qrt0l9Q2E2RvLRp6jugQiTNTywbQ=;
 h=From:To:Cc:Subject:Date:From;
 b=NYuBtwURYidvFrxE2AGzKqfUZEwQg0sXZHw9tBkUQqrEGAg5kj/AB3C8AlscQh32C
 Gg53ryOb/isxZK9bck+A3vH+ri0b6mZWiroR5GCMknrmp9Ejnge7Cq7iW1rOsaj8TM
 3vIvhYp6t0TEMpwfhq22KtJmK1xOA1Bo3VUFiQkCSUUBmjUlwBTRJEWtEX46peQHoe
 As7yzZWmW24q4FB5mE7Lm0QvRCGAce5DJwHDMyEm1pqXeUHEwsIZSdxShKj1RKfA1U
 3o7GLzCue1reKRq2PTYr1wl4zfIpZ53k1Y1kqOvFR6f0dvkgnlMlx6rsXoYxsJ+pag
 +GMqZeG2WrOyw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue,  8 Jul 2025 21:16:37 -0500
Message-ID: <20250709021638.2047365-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] spi: stm32-ospi: Use
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
v2:
 - Fix unused variable warnings
---
 drivers/spi/spi-stm32-ospi.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 7c1fa55fbc47..4753e02a7d2f 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -771,9 +771,7 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_ospi *ospi = platform_get_drvdata(pdev);
-	struct resource *res;
-	struct reserved_mem *rmem = NULL;
-	struct device_node *node;
+	struct resource *res, _res;
 	int ret;
 
 	ospi->regs_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -825,17 +823,13 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
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
