Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F81C8219F
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Nov 2025 19:28:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ABE6C56600;
	Mon, 24 Nov 2025 18:28:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48E20C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 18:28:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 73CB960176;
 Mon, 24 Nov 2025 18:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81B8C4CEF1;
 Mon, 24 Nov 2025 18:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764008893;
 bh=LveFK3svzwr3240pinEzhr4cRcEQRM0RRxCFeTRmktU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JGq6Jx7pBzvR2a+xdiqPUncCy1FvjZRbHZDBF+ugQBicvMnPobpFHPoZHIQMCce+J
 9qpdLngMVe17YC25iva5Kv0+tr1Z502VyIo48cTJeLzt+e/sTE589Ib8NqihaP3Owl
 GaZMkeokHq7NgRUQqA9aJNY5LsS5iAz5bSqpsMXSv4XZKwsQ06gQ9BdHk2MRlTgd8X
 geRahs6QZeiu7vVGLMetG0eXeNctJdJ3GOhG2vThlKG/DQiERnrF4wXdVaV6gjZZGe
 Utcp5ttWxDaiAxjKYH/xDtUR/FLmRGWrqPHpdhFq3XVvI7g8Eo94rWzcfhpCEyHF7Y
 ed9VCgAY54w5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 24 Nov 2025 12:27:48 -0600
Message-ID: <20251124182751.507624-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124182751.507624-1-robh@kernel.org>
References: <20251124182751.507624-1-robh@kernel.org>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Beleswar Padhi <b-padhi@ti.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 2/2] remoteproc: qcom: Use
	of_reserved_mem_region_* functions for "memory-region"
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

Use the newly added of_reserved_mem_region_to_resource() and
of_reserved_mem_region_count() functions to handle "memory-region"
properties.

The error handling is a bit different in some cases. Often
"memory-region" is optional, so failed lookup is not an error. But then
an error in of_reserved_mem_lookup() is treated as an error. However,
that distinction is not really important. Either the region is available
and usable or it is not. So now, it is just
of_reserved_mem_region_to_resource() which is checked for an error.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v7:
 - Split QCom to separate patch
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 24 ++++------
 drivers/remoteproc/qcom_q6v5_mss.c  | 60 ++++++++-----------------
 drivers/remoteproc/qcom_q6v5_pas.c  | 69 +++++++++++------------------
 drivers/remoteproc/qcom_q6v5_wcss.c | 25 +++++------
 drivers/remoteproc/qcom_wcnss.c     | 23 ++++------
 5 files changed, 72 insertions(+), 129 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index e98b7e03162c..d3933a66ed3d 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -625,26 +625,20 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
 
 static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 {
-	struct reserved_mem *rmem = NULL;
-	struct device_node *node;
-
-	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
-	if (node)
-		rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
+	int ret;
+	struct resource res;
 
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(adsp->dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(adsp->dev, "unable to resolve memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	adsp->mem_phys = adsp->mem_reloc = rmem->base;
-	adsp->mem_size = rmem->size;
-	adsp->mem_region = devm_ioremap_wc(adsp->dev,
-				adsp->mem_phys, adsp->mem_size);
+	adsp->mem_phys = adsp->mem_reloc = res.start;
+	adsp->mem_size = resource_size(&res);
+	adsp->mem_region = devm_ioremap_resource_wc(adsp->dev, &res);
 	if (!adsp->mem_region) {
-		dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
-			&rmem->base, adsp->mem_size);
+		dev_err(adsp->dev, "unable to map memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 3087d895b87f..91940977ca89 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1970,8 +1970,8 @@ static int q6v5_init_reset(struct q6v5 *qproc)
 static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 {
 	struct device_node *child;
-	struct reserved_mem *rmem;
-	struct device_node *node;
+	struct resource res;
+	int ret;
 
 	/*
 	 * In the absence of mba/mpss sub-child, extract the mba and mpss
@@ -1979,71 +1979,49 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 	 */
 	child = of_get_child_by_name(qproc->dev->of_node, "mba");
 	if (!child) {
-		node = of_parse_phandle(qproc->dev->of_node,
-					"memory-region", 0);
+		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 0, &res);
 	} else {
-		node = of_parse_phandle(child, "memory-region", 0);
+		ret = of_reserved_mem_region_to_resource(child, 0, &res);
 		of_node_put(child);
 	}
 
-	if (!node) {
-		dev_err(qproc->dev, "no mba memory-region specified\n");
-		return -EINVAL;
-	}
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	if (ret) {
 		dev_err(qproc->dev, "unable to resolve mba region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	qproc->mba_phys = rmem->base;
-	qproc->mba_size = rmem->size;
+	qproc->mba_phys = res.start;
+	qproc->mba_size = resource_size(&res);
 
 	if (!child) {
-		node = of_parse_phandle(qproc->dev->of_node,
-					"memory-region", 1);
+		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 1, &res);
 	} else {
 		child = of_get_child_by_name(qproc->dev->of_node, "mpss");
-		node = of_parse_phandle(child, "memory-region", 0);
+		ret = of_reserved_mem_region_to_resource(child, 0, &res);
 		of_node_put(child);
 	}
 
-	if (!node) {
-		dev_err(qproc->dev, "no mpss memory-region specified\n");
-		return -EINVAL;
-	}
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	if (ret) {
 		dev_err(qproc->dev, "unable to resolve mpss region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	qproc->mpss_phys = qproc->mpss_reloc = rmem->base;
-	qproc->mpss_size = rmem->size;
+	qproc->mpss_phys = qproc->mpss_reloc = res.start;
+	qproc->mpss_size = resource_size(&res);
 
 	if (!child) {
-		node = of_parse_phandle(qproc->dev->of_node, "memory-region", 2);
+		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 2, &res);
 	} else {
 		child = of_get_child_by_name(qproc->dev->of_node, "metadata");
-		node = of_parse_phandle(child, "memory-region", 0);
+		ret = of_reserved_mem_region_to_resource(child, 0, &res);
 		of_node_put(child);
 	}
 
-	if (!node)
+	if (ret)
 		return 0;
 
-	rmem = of_reserved_mem_lookup(node);
-	if (!rmem) {
-		dev_err(qproc->dev, "unable to resolve metadata region\n");
-		return -EINVAL;
-	}
-
-	qproc->mdata_phys = rmem->base;
-	qproc->mdata_size = rmem->size;
+	qproc->mdata_phys = res.start;
+	qproc->mdata_size = resource_size(&res);
 
 	return 0;
 }
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 158bcd6cc85c..7bac843ce406 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -547,53 +547,37 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
 
 static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 {
-	struct reserved_mem *rmem;
-	struct device_node *node;
-
-	node = of_parse_phandle(pas->dev->of_node, "memory-region", 0);
-	if (!node) {
-		dev_err(pas->dev, "no memory-region specified\n");
-		return -EINVAL;
-	}
+	struct resource res;
+	int ret;
 
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(pas->dev, "unable to resolve memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	pas->mem_phys = pas->mem_reloc = rmem->base;
-	pas->mem_size = rmem->size;
-	pas->mem_region = devm_ioremap_wc(pas->dev, pas->mem_phys, pas->mem_size);
+	pas->mem_phys = pas->mem_reloc = res.start;
+	pas->mem_size = resource_size(&res);
+	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
 	if (!pas->mem_region) {
-		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
-			&rmem->base, pas->mem_size);
+		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
 	if (!pas->dtb_pas_id)
 		return 0;
 
-	node = of_parse_phandle(pas->dev->of_node, "memory-region", 1);
-	if (!node) {
-		dev_err(pas->dev, "no dtb memory-region specified\n");
-		return -EINVAL;
-	}
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 1, &res);
+	if (ret) {
 		dev_err(pas->dev, "unable to resolve dtb memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	pas->dtb_mem_phys = pas->dtb_mem_reloc = rmem->base;
-	pas->dtb_mem_size = rmem->size;
-	pas->dtb_mem_region = devm_ioremap_wc(pas->dev, pas->dtb_mem_phys, pas->dtb_mem_size);
+	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
+	pas->dtb_mem_size = resource_size(&res);
+	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
 	if (!pas->dtb_mem_region) {
-		dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
-			&rmem->base, pas->dtb_mem_size);
+		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
@@ -603,7 +587,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 static int qcom_pas_assign_memory_region(struct qcom_pas *pas)
 {
 	struct qcom_scm_vmperm perm[MAX_ASSIGN_COUNT];
-	struct device_node *node;
 	unsigned int perm_size;
 	int offset;
 	int ret;
@@ -612,17 +595,15 @@ static int qcom_pas_assign_memory_region(struct qcom_pas *pas)
 		return 0;
 
 	for (offset = 0; offset < pas->region_assign_count; ++offset) {
-		struct reserved_mem *rmem = NULL;
-
-		node = of_parse_phandle(pas->dev->of_node, "memory-region",
-					pas->region_assign_idx + offset);
-		if (node)
-			rmem = of_reserved_mem_lookup(node);
-		of_node_put(node);
-		if (!rmem) {
+		struct resource res;
+
+		ret = of_reserved_mem_region_to_resource(pas->dev->of_node,
+							 pas->region_assign_idx + offset,
+							 &res);
+		if (ret) {
 			dev_err(pas->dev, "unable to resolve shareable memory-region index %d\n",
 				offset);
-			return -EINVAL;
+			return ret;
 		}
 
 		if (pas->region_assign_shared)  {
@@ -637,8 +618,8 @@ static int qcom_pas_assign_memory_region(struct qcom_pas *pas)
 			perm_size = 1;
 		}
 
-		pas->region_assign_phys[offset] = rmem->base;
-		pas->region_assign_size[offset] = rmem->size;
+		pas->region_assign_phys[offset] = res.start;
+		pas->region_assign_size[offset] = resource_size(&res);
 		pas->region_assign_owners[offset] = BIT(QCOM_SCM_VMID_HLOS);
 
 		ret = qcom_scm_assign_mem(pas->region_assign_phys[offset],
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 07c88623f597..ca748e3bcc7f 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -873,27 +873,22 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 
 static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 {
-	struct reserved_mem *rmem = NULL;
-	struct device_node *node;
 	struct device *dev = wcss->dev;
+	struct resource res;
+	int ret;
 
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (node)
-		rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(dev, "unable to acquire memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	wcss->mem_phys = rmem->base;
-	wcss->mem_reloc = rmem->base;
-	wcss->mem_size = rmem->size;
-	wcss->mem_region = devm_ioremap_wc(dev, wcss->mem_phys, wcss->mem_size);
+	wcss->mem_phys = res.start;
+	wcss->mem_reloc = res.start;
+	wcss->mem_size = resource_size(&res);
+	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
 	if (!wcss->mem_region) {
-		dev_err(dev, "unable to map memory region: %pa+%pa\n",
-			&rmem->base, &rmem->size);
+		dev_err(dev, "unable to map memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 2c7e519a2254..14005fb049a2 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -526,25 +526,20 @@ static int wcnss_request_irq(struct qcom_wcnss *wcnss,
 
 static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 {
-	struct reserved_mem *rmem = NULL;
-	struct device_node *node;
-
-	node = of_parse_phandle(wcnss->dev->of_node, "memory-region", 0);
-	if (node)
-		rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
+	struct resource res;
+	int ret;
 
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(wcnss->dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(wcnss->dev, "unable to resolve memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	wcnss->mem_phys = wcnss->mem_reloc = rmem->base;
-	wcnss->mem_size = rmem->size;
-	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
+	wcnss->mem_phys = wcnss->mem_reloc = res.start;
+	wcnss->mem_size = resource_size(&res);
+	wcnss->mem_region = devm_ioremap_resource_wc(wcnss->dev, &res);
 	if (!wcnss->mem_region) {
-		dev_err(wcnss->dev, "unable to map memory region: %pa+%zx\n",
-			&rmem->base, wcnss->mem_size);
+		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
