Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46778729903
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jun 2023 14:05:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7298C65E70;
	Fri,  9 Jun 2023 12:05:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D90C9C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jun 2023 12:05:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94ECA65774;
 Fri,  9 Jun 2023 12:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126EBC433EF;
 Fri,  9 Jun 2023 12:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686312353;
 bh=0xeuT9v4fiVIQ2TWUy+BIFV+LLciMbqdOwHUGdNMBBo=;
 h=From:To:Cc:Subject:Date:From;
 b=oZoQAjHbfaE4Fz82un+OED+1HwW3L563SsDXCk/AFA9K5QBdgeypsgX+IleJE5+LL
 YrX2+zSmLjsS+WiBpEmT6snpaibEgIGkAk13/ab1+HtUGcCGzAuzaQ+ABRja1t3yyX
 zpgG2yoexAgGYK7RDRed+G1wDw68Y2rlTDMyKQGVTVas6d6VDp4wVArXwiJXxspXeE
 neLajz4OCht7jrXVwtSTFEfLxnBrQALiUCIElZNSutrwusfXw5M/GnyfmYd6tRP78O
 44v62LbU2FbwJcgX4FfqDYyQjlu+eX5WSfGFc6oyW5kjfW7OX/D1zvxhw4Bp0DuDON
 MTPGuQVza6Xwg==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  9 Jun 2023 14:05:39 +0200
Message-Id: <20230609120546.3937821-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Tanmay Shah <tanmay.shah@amd.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ben Levinsky <ben.levinsky@amd.com>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [Linux-stm32] [PATCH] remoteproc: stm32: use correct format strings
	on 64-bit
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

From: Arnd Bergmann <arnd@arndb.de>

With CONFIG_ARCH_STM32 making it into arch/arm64, a couple of format
strings no longer work, since they rely on size_t being compatible
with %x, or they print an 'int' using %z:

drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_mem_alloc':
drivers/remoteproc/stm32_rproc.c:122:22: error: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Werror=format=]
drivers/remoteproc/stm32_rproc.c:122:40: note: format string is defined here
  122 |         dev_dbg(dev, "map memory: %pa+%x\n", &mem->dma, mem->len);
      |                                       ~^
      |                                        |
      |                                        unsigned int
      |                                       %lx
drivers/remoteproc/stm32_rproc.c:125:30: error: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Werror=format=]
drivers/remoteproc/stm32_rproc.c:125:65: note: format string is defined here
  125 |                 dev_err(dev, "Unable to map memory region: %pa+%x\n",
      |                                                                ~^
      |                                                                 |
      |                                                                 unsigned int
      |                                                                %lx
drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_get_loaded_rsc_table':
drivers/remoteproc/stm32_rproc.c:646:30: error: format '%zx' expects argument of type 'size_t', but argument 4 has type 'int' [-Werror=format=]
drivers/remoteproc/stm32_rproc.c:646:66: note: format string is defined here
  646 |                 dev_err(dev, "Unable to map memory region: %pa+%zx\n",
      |                                                                ~~^
      |                                                                  |
      |                                                                  long unsigned int
      |                                                                %x

Fix up all three instances to work across architectures, and enable
compile testing for this driver to ensure it builds everywhere.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig       | 2 +-
 drivers/remoteproc/stm32_rproc.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index a850e9f486dd6..48845dc8fa852 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -313,7 +313,7 @@ config ST_SLIM_REMOTEPROC
 
 config STM32_RPROC
 	tristate "STM32 remoteproc support"
-	depends on ARCH_STM32
+	depends on ARCH_STM32 || COMPILE_TEST
 	depends on REMOTEPROC
 	select MAILBOX
 	help
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a7457777aae43..cf073bac79f73 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -119,10 +119,10 @@ static int stm32_rproc_mem_alloc(struct rproc *rproc,
 	struct device *dev = rproc->dev.parent;
 	void *va;
 
-	dev_dbg(dev, "map memory: %pa+%x\n", &mem->dma, mem->len);
+	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
 	va = ioremap_wc(mem->dma, mem->len);
 	if (IS_ERR_OR_NULL(va)) {
-		dev_err(dev, "Unable to map memory region: %pa+%x\n",
+		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
 			&mem->dma, mem->len);
 		return -ENOMEM;
 	}
@@ -643,7 +643,7 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
 
 	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
 	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
-		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+		dev_err(dev, "Unable to map memory region: %pa+%x\n",
 			&rsc_pa, RSC_TBL_SIZE);
 		ddata->rsc_va = NULL;
 		return ERR_PTR(-ENOMEM);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
