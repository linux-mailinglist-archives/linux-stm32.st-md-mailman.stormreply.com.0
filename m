Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A55FDA6629D
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 00:24:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F93BC78F62;
	Mon, 17 Mar 2025 23:24:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CFB0C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 23:24:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B33C85C5759;
 Mon, 17 Mar 2025 23:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16309C4CEE3;
 Mon, 17 Mar 2025 23:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742253877;
 bh=ntMn2ITUTPUhGAIqv6TVX+CHm+RKieyU9jYM8nDojVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WtBxQCHGCCUfaRKilodwzCHd2KyUvLLbflwi3znhIMfAIrEogRngrjwN/2zDHaKhV
 1m6cYo+M8AMILvzXmBYO9M10VyotHIYJAuh4uxpRb2aMlv8+eM9t+9etq4BtmxvQKI
 piDkWV/+jKEzbGPvLHqPwvU5Q/UO4zGBLaVwLR5ZGHfzbf+7IpMiw98f3jxusNhKs9
 DPBTjiLsnlvLK3/Q/J0R4/GcKUo+pSLhtE5gfyPs4kHjQ6uTgJplaOolCUbN368oZe
 okHiCMB22lQNevyhqZko759YeC5aonjysf6ArbpbLKCx0haWFwc8/5B2fkqyJqNBae
 RTQWIdonPVVUQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Saravana Kannan <saravanak@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 17 Mar 2025 18:24:22 -0500
Message-ID: <20250317232426.952188-3-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317232426.952188-1-robh@kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] of: Simplify
	of_dma_set_restricted_buffer() to use of_for_each_phandle()
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

Simplify of_dma_set_restricted_buffer() by using of_property_present()
and of_for_each_phandle() iterator.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/device.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index edf3be197265..bb4a47d58249 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -35,44 +35,36 @@ EXPORT_SYMBOL(of_match_device);
 static void
 of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
 {
-	struct device_node *node, *of_node = dev->of_node;
-	int count, i;
+	struct device_node *of_node = dev->of_node;
+	struct of_phandle_iterator it;
+	int rc, i = 0;
 
 	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
 		return;
 
-	count = of_property_count_elems_of_size(of_node, "memory-region",
-						sizeof(u32));
 	/*
 	 * If dev->of_node doesn't exist or doesn't contain memory-region, try
 	 * the OF node having DMA configuration.
 	 */
-	if (count <= 0) {
+	if (!of_property_present(of_node, "memory-region"))
 		of_node = np;
-		count = of_property_count_elems_of_size(
-			of_node, "memory-region", sizeof(u32));
-	}
 
-	for (i = 0; i < count; i++) {
-		node = of_parse_phandle(of_node, "memory-region", i);
+	of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, 0) {
 		/*
 		 * There might be multiple memory regions, but only one
 		 * restricted-dma-pool region is allowed.
 		 */
-		if (of_device_is_compatible(node, "restricted-dma-pool") &&
-		    of_device_is_available(node)) {
-			of_node_put(node);
-			break;
+		if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
+		    of_device_is_available(it.node)) {
+			if (!of_reserved_mem_device_init_by_idx(dev, of_node, i)) {
+				of_node_put(it.node);
+				return;
+			}
 		}
-		of_node_put(node);
+		i++;
 	}
 
-	/*
-	 * Attempt to initialize a restricted-dma-pool region if one was found.
-	 * Note that count can hold a negative error code.
-	 */
-	if (i < count && of_reserved_mem_device_init_by_idx(dev, of_node, i))
-		dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
+	dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
 }
 
 /**
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
