Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D283A66299
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 00:24:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55808C78F62;
	Mon, 17 Mar 2025 23:24:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA4D3C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 23:24:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C92AC5C5756;
 Mon, 17 Mar 2025 23:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F75C4CEE3;
 Mon, 17 Mar 2025 23:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742253875;
 bh=Y8+t9clPnh89DnSPz7TWk9ja/LPy9tPGrfLadkVOg7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eonmL7W/lY/c158S+9qVmf+A+vPP7qeEsqTo6GsYu5Yia+9FYhdQ21U1cwq2bpAMd
 y1qEooJUN0+L9fLZRrKpzgtI/Cui9sWSRlR2A9gohcejqulcHsWb5dpBr/xsbQjmk9
 2nlK04SGalUaMu9mpPhdc4JjPcIo8Sf4HJAZurLMKNZJRXP/f45E5EGRVOpJGC2pXg
 zhVgFizdPfU4MzxM9FaVPpW3zFXfevUodh//IXB0y6jSygdaQBPhDEqbKRMDBqKF2l
 7Ck2cekHGzgAp2+S+9UjRTN3Y21WR300hUB1T6AyLupOh7z/lrz5Hj3hoR+v7Q5x/e
 NNU0G6JimbZuA==
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
Date: Mon, 17 Mar 2025 18:24:21 -0500
Message-ID: <20250317232426.952188-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317232426.952188-1-robh@kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] of: reserved_mem: Add functions to parse
	"memory-region"
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

Drivers with "memory-region" properties currently have to do their own
parsing of "memory-region" properties. The result is all the drivers
have similar patterns of a call to parse "memory-region" and then get
the region's address and size. As this is a standard property, it should
have common functions for drivers to use. Add new functions to count the
number of regions and retrieve the region's address as a resource.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/of_reserved_mem.c    | 77 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 26 +++++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 75e819f66a56..fd50038dff76 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -12,6 +12,7 @@
 #define pr_fmt(fmt)	"OF: reserved mem: " fmt
 
 #include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -740,3 +741,79 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
+
+/**
+ * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
+ * @np:		node containing 'memory-region' property
+ * @idx:	index of 'memory-region' property to lookup
+ * @res:	Pointer to a struct resource to fill in with reserved region
+ *
+ * This function allows drivers to lookup a node's 'memory-region' property
+ * entries by index and return a struct resource for the entry.
+ *
+ * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
+ * is missing or unavailable, -EINVAL for any other error.
+ */
+int of_reserved_mem_region_to_resource(const struct device_node *np, unsigned int idx, struct resource *res)
+{
+	struct reserved_mem *rmem;
+
+	if (!np)
+		return -EINVAL;
+
+	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
+	if (!target || !of_device_is_available(target))
+		return -ENODEV;
+
+	rmem = of_reserved_mem_lookup(target);
+	if (!rmem)
+		return -EINVAL;
+
+	resource_set_range(res, rmem->base, rmem->size);
+	res->name = rmem->name;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource);
+
+/**
+ * of_reserved_mem_region_to_resource_byname() - Get a reserved memory region as a resource
+ * @np:		node containing 'memory-region' property
+ * @name:	name of 'memory-region' property entry to lookup
+ * @res:	Pointer to a struct resource to fill in with reserved region
+ *
+ * This function allows drivers to lookup a node's 'memory-region' property
+ * entries by name and return a struct resource for the entry.
+ *
+ * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
+ * is missing or unavailable, -EINVAL for any other error.
+ */
+int of_reserved_mem_region_to_resource_byname(const struct device_node *np, const char *name, struct resource *res)
+{
+	int idx;
+
+	if (!name)
+		return -EINVAL;
+
+	idx = of_property_match_string(np, "memory-region-names", name);
+	if (idx < 0)
+		return idx;
+
+	return of_reserved_mem_region_to_resource(np, idx, res);
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource_byname);
+
+/**
+ * of_reserved_mem_region_count() - Return the number of 'memory-region' entries
+ * @np:		node containing 'memory-region' property
+ *
+ * This function allows drivers to retrieve the number of entries for a node's
+ * 'memory-region' property.
+ *
+ * Returns the number of entries on success, or negative error code on a
+ * malformed property.
+ */
+int of_reserved_mem_region_count(const struct device_node *np)
+{
+	return of_count_phandle_with_args(np, "memory-region", NULL);
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_count);
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e338282da652..f573423359f4 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -7,6 +7,7 @@
 
 struct of_phandle_args;
 struct reserved_mem_ops;
+struct resource;
 
 struct reserved_mem {
 	const char			*name;
@@ -39,6 +40,12 @@ int of_reserved_mem_device_init_by_name(struct device *dev,
 void of_reserved_mem_device_release(struct device *dev);
 
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
+int of_reserved_mem_region_to_resource(const struct device_node *np,
+				       unsigned int idx, struct resource *res);
+int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
+					      const char *name, struct resource *res);
+int of_reserved_mem_region_count(const struct device_node *np);
+
 #else
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
@@ -63,6 +70,25 @@ static inline struct reserved_mem *of_reserved_mem_lookup(struct device_node *np
 {
 	return NULL;
 }
+
+static inline int of_reserved_mem_region_to_resource(const struct device_node *np,
+						     unsigned int idx,
+						     struct resource *res)
+{
+	return -ENOSYS;
+}
+
+static inline int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
+							    const char *name,
+							    struct resource *res)
+{
+	return -ENOSYS;
+}
+
+static inline int of_reserved_mem_region_count(const struct device_node *np)
+{
+	return 0;
+}
 #endif
 
 /**
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
