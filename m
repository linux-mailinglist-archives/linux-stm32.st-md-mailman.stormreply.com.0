Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7378EA998CE
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 21:42:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 353A4C78F68;
	Wed, 23 Apr 2025 19:42:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0AA9C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 19:42:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4A6854A154;
 Wed, 23 Apr 2025 19:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54300C4CEE2;
 Wed, 23 Apr 2025 19:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745437369;
 bh=V9munzrKNGK1uPGGF90m0wh4+CAwjcqhZiXGwBDHs9w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DnBZ/eLBZ50dQ3zkjMDw5JcmXJgBV+iHNLTJuIkKa0e5K2eeRAifaVzEmwP3rO9KH
 vd97PFlFnrkuEBF+r+007qpzx9ngASys/K6uQxukC1dBLop3rKujWdAuaOEuuYykLv
 kLjKO1uQGsH5QzU1A6IT9xmgH0cTy6DzOYEH9bnoZ54rdQGPya2WkbjmgGRoQaKpwu
 q7qPUqM3QQ/NL56TqYR3YdQvxrU8Kt/1OUiTg9QvjxDckgOUYSboq5wnQoKEHW+Ynt
 BYkeczeJwpy4dVYUjm/7JgAFpcPQnb3klTcTPP0/BxnjJsTm+UHfW+e0BHg22mc7/O
 ah4FrQXjWucWA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 23 Apr 2025 14:42:16 -0500
MIME-Version: 1.0
Message-Id: <20250423-dt-memory-region-v2-v2-4-2fbd6ebd3c88@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.15-dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/4] remoteproc: Use
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
v2:
 - Use strstarts instead of strcmp for resource names as they include
   the unit-address.
 - Drop the unit-address from resource name for imx and st drivers
---
 drivers/remoteproc/imx_dsp_rproc.c        | 45 ++++++++------------
 drivers/remoteproc/imx_rproc.c            | 68 ++++++++++++------------------
 drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++-------
 drivers/remoteproc/qcom_q6v5_mss.c        | 60 +++++++++------------------
 drivers/remoteproc/qcom_q6v5_pas.c        | 69 +++++++++++--------------------
 drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++++------
 drivers/remoteproc/qcom_wcnss.c           | 23 ++++-------
 drivers/remoteproc/rcar_rproc.c           | 36 +++++++---------
 drivers/remoteproc/st_remoteproc.c        | 41 +++++++++---------
 drivers/remoteproc/stm32_rproc.c          | 44 +++++++++-----------
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++--------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++--------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++--------
 drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 +++++++++--------------
 14 files changed, 221 insertions(+), 349 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 90cb1fc13e71..fffae6ff4a5c 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -598,11 +598,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 	struct rproc *rproc = priv->rproc;
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
-	struct of_phandle_iterator it;
 	struct rproc_mem_entry *mem;
-	struct reserved_mem *rmem;
 	void __iomem *cpu_addr;
-	int a;
+	int a, i = 0;
 	u64 da;
 
 	/* Remap required addresses */
@@ -633,45 +631,38 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 		rproc_add_carveout(rproc, mem);
 	}
 
-	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
-	while (of_phandle_iterator_next(&it) == 0) {
+	while (1) {
+		int err;
+		struct resource res;
+
+		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		if (err)
+			return 0;
+
 		/*
 		 * Ignore the first memory region which will be used vdev buffer.
 		 * No need to do extra handlings, rproc_add_virtio_dev will handle it.
 		 */
-		if (!strcmp(it.node->name, "vdev0buffer"))
+		if (strstarts(res.name, "vdev0buffer"))
 			continue;
 
-		rmem = of_reserved_mem_lookup(it.node);
-		if (!rmem) {
-			of_node_put(it.node);
-			dev_err(dev, "unable to acquire memory-region\n");
+		if (imx_dsp_rproc_sys_to_da(priv, res.start, resource_size(&res), &da))
 			return -EINVAL;
-		}
 
-		if (imx_dsp_rproc_sys_to_da(priv, rmem->base, rmem->size, &da)) {
-			of_node_put(it.node);
-			return -EINVAL;
-		}
-
-		cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
+		cpu_addr = devm_ioremap_resource_wc(dev, &res);
 		if (!cpu_addr) {
-			of_node_put(it.node);
-			dev_err(dev, "failed to map memory %p\n", &rmem->base);
+			dev_err(dev, "failed to map memory %pR\n", &res);
 			return -ENOMEM;
 		}
 
 		/* Register memory region */
-		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)rmem->base,
-					   rmem->size, da, NULL, NULL, it.node->name);
-
-		if (mem) {
-			rproc_coredump_add_segment(rproc, da, rmem->size);
-		} else {
-			of_node_put(it.node);
+		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)res.start,
+					   resource_size(&res), da, NULL, NULL,
+					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);
+		if (!mem)
 			return -ENOMEM;
-		}
 
+		rproc_coredump_add_segment(rproc, da, resource_size(&res));
 		rproc_add_carveout(rproc, mem);
 	}
 
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..31999741fbac 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -549,46 +549,42 @@ static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device_node *np = priv->dev->of_node;
-	struct of_phandle_iterator it;
 	struct rproc_mem_entry *mem;
-	struct reserved_mem *rmem;
+	int i = 0;
 	u32 da;
 
 	/* Register associated reserved memory regions */
-	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
-	while (of_phandle_iterator_next(&it) == 0) {
+	while (1) {
+		int err;
+		struct resource res;
+
+		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		if (err)
+			return 0;
+
 		/*
 		 * Ignore the first memory region which will be used vdev buffer.
 		 * No need to do extra handlings, rproc_add_virtio_dev will handle it.
 		 */
-		if (!strcmp(it.node->name, "vdev0buffer"))
+		if (strstarts(res.name, "vdev0buffer"))
 			continue;
 
-		if (!strcmp(it.node->name, "rsc-table"))
+		if (strstarts(res.name, "rsc-table"))
 			continue;
 
-		rmem = of_reserved_mem_lookup(it.node);
-		if (!rmem) {
-			of_node_put(it.node);
-			dev_err(priv->dev, "unable to acquire memory-region\n");
-			return -EINVAL;
-		}
-
 		/* No need to translate pa to da, i.MX use same map */
-		da = rmem->base;
+		da = res.start;
 
 		/* Register memory region */
-		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)rmem->base, rmem->size, da,
+		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
+					   resource_size(&res), da,
 					   imx_rproc_mem_alloc, imx_rproc_mem_release,
-					   it.node->name);
-
-		if (mem) {
-			rproc_coredump_add_segment(rproc, da, rmem->size);
-		} else {
-			of_node_put(it.node);
+					   "%.*s", strchrnul(res.name, '@') - res.name,
+					   res.name);
+		if (!mem)
 			return -ENOMEM;
-		}
 
+		rproc_coredump_add_segment(rproc, da, resource_size(&res));
 		rproc_add_carveout(rproc, mem);
 	}
 
@@ -723,47 +719,37 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	}
 
 	/* memory-region is optional property */
-	nph = of_count_phandle_with_args(np, "memory-region", NULL);
+	nph = of_reserved_mem_region_count(np);
 	if (nph <= 0)
 		return 0;
 
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
-		struct device_node *node;
 		struct resource res;
 
-		node = of_parse_phandle(np, "memory-region", a);
-		if (!node)
-			continue;
-		/* Not map vdevbuffer, vdevring region */
-		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
-			of_node_put(node);
-			continue;
-		}
-		err = of_address_to_resource(node, 0, &res);
+		err = of_reserved_mem_region_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
-			of_node_put(node);
 			return err;
 		}
 
-		if (b >= IMX_RPROC_MEM_MAX) {
-			of_node_put(node);
+		/* Not map vdevbuffer, vdevring region */
+		if (strstarts(res.name, "vdev"))
+			continue;
+
+		if (b >= IMX_RPROC_MEM_MAX)
 			break;
-		}
 
 		/* Not use resource version, because we might share region */
-		priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));
+		priv->mem[b].cpu_addr = devm_ioremap_resource_wc(&pdev->dev, &res);
 		if (!priv->mem[b].cpu_addr) {
 			dev_err(dev, "failed to remap %pr\n", &res);
-			of_node_put(node);
 			return -ENOMEM;
 		}
 		priv->mem[b].sys_addr = res.start;
 		priv->mem[b].size = resource_size(&res);
-		if (!strcmp(node->name, "rsc-table"))
+		if (!strcmp(res.name, "rsc-table"))
 			priv->rsc_table = priv->mem[b].cpu_addr;
-		of_node_put(node);
 		b++;
 	}
 
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 94af77baa7a1..a5b7cbb8fe07 100644
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
+	if (!ret) {
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
index 0c0199fb0e68..0fea5f91dd1c 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1961,8 +1961,8 @@ static int q6v5_init_reset(struct q6v5 *qproc)
 static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 {
 	struct device_node *child;
-	struct reserved_mem *rmem;
-	struct device_node *node;
+	struct resource res;
+	int ret;
 
 	/*
 	 * In the absence of mba/mpss sub-child, extract the mba and mpss
@@ -1970,71 +1970,49 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
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
index b306f223127c..73f415ff2678 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -546,53 +546,37 @@ static void adsp_pds_detach(struct qcom_adsp *adsp, struct device **pds,
 
 static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 {
-	struct reserved_mem *rmem;
-	struct device_node *node;
-
-	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
-	if (!node) {
-		dev_err(adsp->dev, "no memory-region specified\n");
-		return -EINVAL;
-	}
+	struct resource res;
+	int ret;
 
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(adsp->dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(adsp->dev, "unable to resolve memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	adsp->mem_phys = adsp->mem_reloc = rmem->base;
-	adsp->mem_size = rmem->size;
-	adsp->mem_region = devm_ioremap_wc(adsp->dev, adsp->mem_phys, adsp->mem_size);
+	adsp->mem_phys = adsp->mem_reloc = res.start;
+	adsp->mem_size = resource_size(&res);
+	adsp->mem_region = devm_ioremap_resource_wc(adsp->dev, &res);
 	if (!adsp->mem_region) {
-		dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
-			&rmem->base, adsp->mem_size);
+		dev_err(adsp->dev, "unable to map memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
 	if (!adsp->dtb_pas_id)
 		return 0;
 
-	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 1);
-	if (!node) {
-		dev_err(adsp->dev, "no dtb memory-region specified\n");
-		return -EINVAL;
-	}
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(adsp->dev->of_node, 1, &res);
+	if (ret) {
 		dev_err(adsp->dev, "unable to resolve dtb memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	adsp->dtb_mem_phys = adsp->dtb_mem_reloc = rmem->base;
-	adsp->dtb_mem_size = rmem->size;
-	adsp->dtb_mem_region = devm_ioremap_wc(adsp->dev, adsp->dtb_mem_phys, adsp->dtb_mem_size);
+	adsp->dtb_mem_phys = adsp->dtb_mem_reloc = res.start;
+	adsp->dtb_mem_size = resource_size(&res);
+	adsp->dtb_mem_region = devm_ioremap_resource_wc(adsp->dev, &res);
 	if (!adsp->dtb_mem_region) {
-		dev_err(adsp->dev, "unable to map dtb memory region: %pa+%zx\n",
-			&rmem->base, adsp->dtb_mem_size);
+		dev_err(adsp->dev, "unable to map dtb memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
@@ -602,7 +586,6 @@ static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 static int adsp_assign_memory_region(struct qcom_adsp *adsp)
 {
 	struct qcom_scm_vmperm perm[MAX_ASSIGN_COUNT];
-	struct device_node *node;
 	unsigned int perm_size;
 	int offset;
 	int ret;
@@ -611,17 +594,15 @@ static int adsp_assign_memory_region(struct qcom_adsp *adsp)
 		return 0;
 
 	for (offset = 0; offset < adsp->region_assign_count; ++offset) {
-		struct reserved_mem *rmem = NULL;
-
-		node = of_parse_phandle(adsp->dev->of_node, "memory-region",
-					adsp->region_assign_idx + offset);
-		if (node)
-			rmem = of_reserved_mem_lookup(node);
-		of_node_put(node);
-		if (!rmem) {
+		struct resource res;
+
+		ret = of_reserved_mem_region_to_resource(adsp->dev->of_node,
+							 adsp->region_assign_idx + offset,
+							 &res);
+		if (ret) {
 			dev_err(adsp->dev, "unable to resolve shareable memory-region index %d\n",
 				offset);
-			return -EINVAL;
+			return ret;
 		}
 
 		if (adsp->region_assign_shared)  {
@@ -636,8 +617,8 @@ static int adsp_assign_memory_region(struct qcom_adsp *adsp)
 			perm_size = 1;
 		}
 
-		adsp->region_assign_phys[offset] = rmem->base;
-		adsp->region_assign_size[offset] = rmem->size;
+		adsp->region_assign_phys[offset] = res.start;
+		adsp->region_assign_size[offset] = resource_size(&res);
 		adsp->region_assign_owners[offset] = BIT(QCOM_SCM_VMID_HLOS);
 
 		ret = qcom_scm_assign_mem(adsp->region_assign_phys[offset],
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 93648734a2f2..4a3235ee0963 100644
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
index 775b056d795a..7893a5a67306 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -525,25 +525,20 @@ static int wcnss_request_irq(struct qcom_wcnss *wcnss,
 
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
 
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index 921d853594f4..0be1a4073a94 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -52,41 +52,33 @@ static int rcar_rproc_prepare(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
-	struct of_phandle_iterator it;
 	struct rproc_mem_entry *mem;
-	struct reserved_mem *rmem;
+	int i = 0;
 	u32 da;
 
 	/* Register associated reserved memory regions */
-	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
-	while (of_phandle_iterator_next(&it) == 0) {
-
-		rmem = of_reserved_mem_lookup(it.node);
-		if (!rmem) {
-			of_node_put(it.node);
-			dev_err(&rproc->dev,
-				"unable to acquire memory-region\n");
-			return -EINVAL;
-		}
+	while (1) {
+		struct resource res;
+		int ret;
+
+		ret = of_reserved_mem_region_to_resource(np, i++, &res);
+		if (ret)
+			return 0;
 
-		if (rmem->base > U32_MAX) {
-			of_node_put(it.node);
+		if (res.start > U32_MAX)
 			return -EINVAL;
-		}
 
 		/* No need to translate pa to da, R-Car use same map */
-		da = rmem->base;
+		da = res.start;
 		mem = rproc_mem_entry_init(dev, NULL,
-					   rmem->base,
-					   rmem->size, da,
+					   res.start,
+					   resource_size(&res), da,
 					   rcar_rproc_mem_alloc,
 					   rcar_rproc_mem_release,
-					   it.node->name);
+					   res.name);
 
-		if (!mem) {
-			of_node_put(it.node);
+		if (!mem)
 			return -ENOMEM;
-		}
 
 		rproc_add_carveout(rproc, mem);
 	}
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index e6566a9839dc..043348366926 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -120,40 +120,37 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
 	struct rproc_mem_entry *mem;
-	struct reserved_mem *rmem;
-	struct of_phandle_iterator it;
-	int index = 0;
-
-	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
-	while (of_phandle_iterator_next(&it) == 0) {
-		rmem = of_reserved_mem_lookup(it.node);
-		if (!rmem) {
-			of_node_put(it.node);
-			dev_err(dev, "unable to acquire memory-region\n");
-			return -EINVAL;
-		}
+	int index = 0, mr = 0;
+
+	while (1) {
+		struct resource res;
+		int ret;
+
+		ret = of_reserved_mem_region_to_resource(np, mr++, &res);
+		if (ret)
+			return 0;
 
 		/*  No need to map vdev buffer */
-		if (strcmp(it.node->name, "vdev0buffer")) {
+		if (!strstarts(res.name, "vdev0buffer")) {
 			/* Register memory region */
 			mem = rproc_mem_entry_init(dev, NULL,
-						   (dma_addr_t)rmem->base,
-						   rmem->size, rmem->base,
+						   (dma_addr_t)res.start,
+						   resource_size(&res), res.start,
 						   st_rproc_mem_alloc,
 						   st_rproc_mem_release,
-						   it.node->name);
+						   "%.*s",
+						   strchrnul(res.name, '@') - res.name,
+						   res.name);
 		} else {
 			/* Register reserved memory for vdev buffer allocation */
 			mem = rproc_of_resm_mem_entry_init(dev, index,
-							   rmem->size,
-							   rmem->base,
-							   it.node->name);
+							   resource_size(&res),
+							   res.start,
+							   "vdev0buffer");
 		}
 
-		if (!mem) {
-			of_node_put(it.node);
+		if (!mem)
 			return -ENOMEM;
-		}
 
 		rproc_add_carveout(rproc, mem);
 		index++;
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index b02b36a3f515..61939b80a957 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
-	struct of_phandle_iterator it;
 	struct rproc_mem_entry *mem;
-	struct reserved_mem *rmem;
 	u64 da;
-	int index = 0;
+	int index = 0, mr = 0;
 
 	/* Register associated reserved memory regions */
-	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
-	while (of_phandle_iterator_next(&it) == 0) {
-		rmem = of_reserved_mem_lookup(it.node);
-		if (!rmem) {
-			of_node_put(it.node);
-			dev_err(dev, "unable to acquire memory-region\n");
-			return -EINVAL;
-		}
+	while (1) {
+		struct resource res;
+		int ret;
 
-		if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
-			of_node_put(it.node);
-			dev_err(dev, "memory region not valid %pa\n",
-				&rmem->base);
+		ret = of_reserved_mem_region_to_resource(np, mr++, &res);
+		if (ret)
+			return 0;
+
+		if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) {
+			dev_err(dev, "memory region not valid %pR\n", &res);
 			return -EINVAL;
 		}
 
 		/*  No need to map vdev buffer */
-		if (strcmp(it.node->name, "vdev0buffer")) {
+		if (!strstarts(res.name, "vdev0buffer")) {
 			/* Register memory region */
 			mem = rproc_mem_entry_init(dev, NULL,
-						   (dma_addr_t)rmem->base,
-						   rmem->size, da,
+						   (dma_addr_t)res.start,
+						   resource_size(&res), da,
 						   stm32_rproc_mem_alloc,
 						   stm32_rproc_mem_release,
-						   it.node->name);
-
+						   "%.*s", strchrnul(res.name, '@') - res.name,
+						   res.name);
 			if (mem)
 				rproc_coredump_add_segment(rproc, da,
-							   rmem->size);
+							   resource_size(&res));
 		} else {
 			/* Register reserved memory for vdev buffer alloc */
 			mem = rproc_of_resm_mem_entry_init(dev, index,
-							   rmem->size,
-							   rmem->base,
-							   it.node->name);
+							   resource_size(&res),
+							   res.start,
+							   "vdev0buffer");
 		}
 
 		if (!mem) {
-			of_node_put(it.node);
 			return -ENOMEM;
 		}
 
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a695890254ff..f02c835535bc 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -535,13 +535,10 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *rmem_np;
-	struct reserved_mem *rmem;
 	int num_rmems;
 	int ret, i;
 
-	num_rmems = of_property_count_elems_of_size(np, "memory-region",
-						    sizeof(phandle));
+	num_rmems = of_reserved_mem_region_count(np);
 	if (num_rmems < 0) {
 		dev_err(dev, "device does not reserved memory regions (%pe)\n",
 			ERR_PTR(num_rmems));
@@ -571,23 +568,20 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
 
 	/* use remaining reserved memory regions for static carveouts */
 	for (i = 0; i < num_rmems; i++) {
-		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np)
-			return -EINVAL;
+		struct resource res;
 
-		rmem = of_reserved_mem_lookup(rmem_np);
-		of_node_put(rmem_np);
-		if (!rmem)
-			return -EINVAL;
+		ret = of_reserved_mem_region_to_resource(np, i + 1, &res);
+		if (ret)
+			return ret;
 
-		kproc->rmem[i].bus_addr = rmem->base;
+		kproc->rmem[i].bus_addr = res.start;
 		/* 64-bit address regions currently not supported */
-		kproc->rmem[i].dev_addr = (u32)rmem->base;
-		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
+		kproc->rmem[i].dev_addr = (u32)res.start;
+		kproc->rmem[i].size = resource_size(&res);
+		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
 		if (!kproc->rmem[i].cpu_addr) {
-			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
-				i + 1, &rmem->base, &rmem->size);
+			dev_err(dev, "failed to map reserved memory#%d at %pR\n",
+				i + 1, &res);
 			return -ENOMEM;
 		}
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index a16fb165fced..8c7772cd6baf 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -393,13 +393,10 @@ static int k3_m4_reserved_mem_init(struct k3_m4_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *rmem_np;
-	struct reserved_mem *rmem;
 	int num_rmems;
 	int ret, i;
 
-	num_rmems = of_property_count_elems_of_size(np, "memory-region",
-						    sizeof(phandle));
+	num_rmems = of_reserved_mem_region_count(np);
 	if (num_rmems < 0) {
 		dev_err(dev, "device does not reserved memory regions (%d)\n",
 			num_rmems);
@@ -428,23 +425,20 @@ static int k3_m4_reserved_mem_init(struct k3_m4_rproc *kproc)
 
 	/* use remaining reserved memory regions for static carveouts */
 	for (i = 0; i < num_rmems; i++) {
-		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np)
-			return -EINVAL;
+		struct resource res;
 
-		rmem = of_reserved_mem_lookup(rmem_np);
-		of_node_put(rmem_np);
-		if (!rmem)
-			return -EINVAL;
+		ret = of_reserved_mem_region_to_resource(np, i + 1, &res);
+		if (ret)
+			return ret;
 
-		kproc->rmem[i].bus_addr = rmem->base;
+		kproc->rmem[i].bus_addr = res.start;
 		/* 64-bit address regions currently not supported */
-		kproc->rmem[i].dev_addr = (u32)rmem->base;
-		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
+		kproc->rmem[i].dev_addr = (u32)res.start;
+		kproc->rmem[i].size = resource_size(&res);
+		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
 		if (!kproc->rmem[i].cpu_addr) {
-			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
-				i + 1, &rmem->base, &rmem->size);
+			dev_err(dev, "failed to map reserved memory#%d at %pR\n",
+				i + 1, &res);
 			return -ENOMEM;
 		}
 
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index dbc513c5569c..9a7a61e0ecb8 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -966,13 +966,10 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev_of_node(dev);
-	struct device_node *rmem_np;
-	struct reserved_mem *rmem;
 	int num_rmems;
 	int ret, i;
 
-	num_rmems = of_property_count_elems_of_size(np, "memory-region",
-						    sizeof(phandle));
+	num_rmems = of_reserved_mem_region_count(np);
 	if (num_rmems <= 0) {
 		dev_err(dev, "device does not have reserved memory regions, ret = %d\n",
 			num_rmems);
@@ -1003,16 +1000,13 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 
 	/* use remaining reserved memory regions for static carveouts */
 	for (i = 0; i < num_rmems; i++) {
-		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np)
-			return -EINVAL;
+		struct resource res;
 
-		rmem = of_reserved_mem_lookup(rmem_np);
-		of_node_put(rmem_np);
-		if (!rmem)
-			return -EINVAL;
+		ret = of_reserved_mem_region_to_resource(np, i + 1, &res);
+		if (ret)
+			return ret;
 
-		kproc->rmem[i].bus_addr = rmem->base;
+		kproc->rmem[i].bus_addr = res.start;
 		/*
 		 * R5Fs do not have an MMU, but have a Region Address Translator
 		 * (RAT) module that provides a fixed entry translation between
@@ -1023,12 +1017,12 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 		 * addresses/supported memory regions are restricted to 32-bit
 		 * bus addresses, and are identical
 		 */
-		kproc->rmem[i].dev_addr = (u32)rmem->base;
-		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
+		kproc->rmem[i].dev_addr = (u32)res.start;
+		kproc->rmem[i].size = resource_size(&res);
+		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
 		if (!kproc->rmem[i].cpu_addr) {
-			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
-				i + 1, &rmem->base, &rmem->size);
+			dev_err(dev, "failed to map reserved memory#%d at %pR\n",
+				i + 1, &res);
 			return -ENOMEM;
 		}
 
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 5aeedeaf3c41..b73e97074c01 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -460,49 +460,44 @@ static int add_mem_regions_carveout(struct rproc *rproc)
 {
 	struct rproc_mem_entry *rproc_mem;
 	struct zynqmp_r5_core *r5_core;
-	struct of_phandle_iterator it;
-	struct reserved_mem *rmem;
 	int i = 0;
 
 	r5_core = rproc->priv;
 
 	/* Register associated reserved memory regions */
-	of_phandle_iterator_init(&it, r5_core->np, "memory-region", NULL, 0);
+	while (1) {
+		int err;
+		struct resource res;
 
-	while (of_phandle_iterator_next(&it) == 0) {
-		rmem = of_reserved_mem_lookup(it.node);
-		if (!rmem) {
-			of_node_put(it.node);
-			dev_err(&rproc->dev, "unable to acquire memory-region\n");
-			return -EINVAL;
-		}
+		err = of_reserved_mem_region_to_resource(r5_core->np, i++, &res);
+		if (err)
+			return 0;
 
-		if (!strcmp(it.node->name, "vdev0buffer")) {
+		if (strstarts(res.name, "vdev0buffer")) {
 			/* Init reserved memory for vdev buffer */
 			rproc_mem = rproc_of_resm_mem_entry_init(&rproc->dev, i,
-								 rmem->size,
-								 rmem->base,
-								 it.node->name);
+								 resource_size(&res),
+								 res.start,
+								 "vdev0buffer");
 		} else {
 			/* Register associated reserved memory regions */
 			rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
-							 (dma_addr_t)rmem->base,
-							 rmem->size, rmem->base,
+							 (dma_addr_t)res.start,
+							 resource_size(&res), res.start,
 							 zynqmp_r5_mem_region_map,
 							 zynqmp_r5_mem_region_unmap,
-							 it.node->name);
+							 "%.*s",
+							 strchrnul(res.name, '@') - res.name,
+							 res.name);
 		}
 
-		if (!rproc_mem) {
-			of_node_put(it.node);
+		if (!rproc_mem)
 			return -ENOMEM;
-		}
 
 		rproc_add_carveout(rproc, rproc_mem);
-		rproc_coredump_add_segment(rproc, rmem->base, rmem->size);
+		rproc_coredump_add_segment(rproc, res.start, resource_size(&res));
 
-		dev_dbg(&rproc->dev, "reserved mem carveout %s addr=%llx, size=0x%llx",
-			it.node->name, rmem->base, rmem->size);
+		dev_dbg(&rproc->dev, "reserved mem carveout %pR\n", &res);
 		i++;
 	}
 
@@ -776,7 +771,6 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 	struct device *dev = r5_core->dev;
 	struct rsc_tbl_data *rsc_data_va;
 	struct resource res_mem;
-	struct device_node *np;
 	int ret;
 
 	/*
@@ -786,14 +780,7 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 	 * contains that data structure which holds resource table address, size
 	 * and some magic number to validate correct resource table entry.
 	 */
-	np = of_parse_phandle(r5_core->np, "memory-region", 0);
-	if (!np) {
-		dev_err(dev, "failed to get memory region dev node\n");
-		return -EINVAL;
-	}
-
-	ret = of_address_to_resource(np, 0, &res_mem);
-	of_node_put(np);
+	ret = of_reserved_mem_region_to_resource(r5_core->np, 0, &res_mem);
 	if (ret) {
 		dev_err(dev, "failed to get memory-region resource addr\n");
 		return -EINVAL;

-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
