Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC43A6A8AA
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 15:35:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F763C78F73;
	Thu, 20 Mar 2025 14:35:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D098FC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 14:35:15 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so550181f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742481315; x=1743086115;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tB7SSr5qHjLk82f0/M0QS8n9LPwrSTx6b2GWWmdwSjE=;
 b=KiLfiRmWb9rGfbh86xWVQtOIf5gsNkiDNy/rR9/J+gmLI04ze4a6rrVa1LvbSEDlms
 BBCn3SIMqeMee8MUZP3ju3Gkft7CBx/G+V7VtIzg6+mNkA+T9oXTeNJulsSbaAr8eKzW
 BTFq592YklWPf+eSgDXfwKj22KaIf7/WDUv0D/JqjRjIMtxe8+bZwQiAl8ktwZ0qAaAg
 9XhI3Hz/JIvrzQRK0DUhOuDfJScBdIXKzbeTuu1zdSV8h/1a3LGCx2orMUO4kcn/PGHF
 j4CV0g/05TEfAIQrq1XzKfcZBwGN4AYbu2RidwJt7LAwtp6lfoRpE+21Zv6joNLxFPQq
 iF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481315; x=1743086115;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tB7SSr5qHjLk82f0/M0QS8n9LPwrSTx6b2GWWmdwSjE=;
 b=Ew18gq0gSgLlRdC2bxPLVhDOA8/CN6uO4TXAVlh/Ia8jP3rR/WOUemfDG3SGP9l1Qk
 goyJx6Zm1khRUn8bbaKaBgaYSv+Gz5vYG4hjEy4osddE5P8d6IDg2MW5RqDnDHQ9GtSV
 U8LVly9Tdu4N9SA5ipoVVKYcmEvDnUBAB/tReswZuKga0qey8pP8Z2JRodB2VLGrksJE
 WmwAEZIgxW0gcCu7lKSKNBDaQlFK+kP/IUVeF8SXEwkb8ZA2+Hd64Wt+5Jrn+t+u8FHo
 xPOUzpFiQo/m+WqkNboSYZqdTh5cRRIV8MUsq0niAKQcbP/PBr+FCnEplUhOZQy7Qy+/
 k5RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2+xcGmrP2ysoK2wIBG5MJKU/XiG8CSsv8jMcwbIehmenc/BGhyxRXlhzCMuW31nzBHoZ70wHqIDjMJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjM5IvtNR/uqc5fIpCpziBgfS+14dyg5djyTgdfM5X+5qDrNbu
 JgDLR3FUTgwJJL1cT/lEcHA+RcPajDTZAhT+mK37mOUzvp2BfYmw4CCna8DNUZk=
X-Gm-Gg: ASbGncsE5ZfyQAsyru562646Ks8thDOscAIMgoYvJ3GICeaTGKAgVyMVnQ/I+5qxiA/
 Zp9zuhvFGC2ADg98sNFtZzUYAcVFWBg5dQ2EZWq6oOSL2ojQI1vNxED0P9QGl4UDZuP+y6aHuOj
 RkoM5hs9iyGDwVh1fLvs6QqwvEtpDonqV550Ags6/huG/9eImnB9SZ+gJjwxF7TRFyZKgXA/nrK
 zp/pjKgyk5s3lOathTbkiEyPA80TtytWpEdOmxnsurZEBTEpD6z/yEi2H01mtUJeRCeljSVWwYf
 j2BIGKpHbHcQPBg8X9upaSnm/oEYU2e7BnQdoYQjY6msTCcfYUeSU+4V0g==
X-Google-Smtp-Source: AGHT+IHDmmdY4VUL5L4KbnffzGJUjNC+8s8FzRo9gwQMyNUedKwlip4qfatQhWovbYiwSMeS9n9mpQ==
X-Received: by 2002:a05:6000:381:b0:390:e853:85bd with SMTP id
 ffacd0b85a97d-39973b254e2mr6002863f8f.48.1742481315124; 
 Thu, 20 Mar 2025 07:35:15 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:35:14 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:15 +0000
MIME-Version: 1.0
Message-Id: <20250320-james-coresight-claim-tags-v3-6-d3145c153820@linaro.org>
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
In-Reply-To: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 6/7] coresight: Remove inlines from static
 function definitions
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

These are all static and in one compilation unit so the inline has no
effect on the binary. Except if FTRACE is enabled, then some functions
which were already not inlined now get the nops added which allows them
to be traced.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 11 +++++----
 drivers/hwtracing/coresight/coresight-core.c       | 14 ++++++------
 drivers/hwtracing/coresight/coresight-etb10.c      |  2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  8 +++----
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |  4 ++--
 drivers/hwtracing/coresight/coresight-platform.c   | 26 +++++++++++-----------
 drivers/hwtracing/coresight/coresight-replicator.c |  2 +-
 drivers/hwtracing/coresight/coresight-stm.c        |  6 ++---
 .../coresight/coresight-syscfg-configfs.c          |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  8 +++----
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 16 ++++++-------
 drivers/hwtracing/coresight/coresight-trbe.c       | 18 +++++++--------
 12 files changed, 57 insertions(+), 60 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index deaacfd875af..6f411db24a54 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -113,9 +113,8 @@ typedef u64 cate_t;
  * containing the data page pointer for @offset. If @daddrp is not NULL,
  * @daddrp points the DMA address of the beginning of the table.
  */
-static inline cate_t *catu_get_table(struct tmc_sg_table *catu_table,
-				     unsigned long offset,
-				     dma_addr_t *daddrp)
+static cate_t *catu_get_table(struct tmc_sg_table *catu_table, unsigned long offset,
+			      dma_addr_t *daddrp)
 {
 	unsigned long buf_size = tmc_sg_table_buf_size(catu_table);
 	unsigned int table_nr, pg_idx, pg_offset;
@@ -165,12 +164,12 @@ static void catu_dump_table(struct tmc_sg_table *catu_table)
 }
 
 #else
-static inline void catu_dump_table(struct tmc_sg_table *catu_table)
+static void catu_dump_table(struct tmc_sg_table *catu_table)
 {
 }
 #endif
 
-static inline cate_t catu_make_entry(dma_addr_t addr)
+static cate_t catu_make_entry(dma_addr_t addr)
 {
 	return addr ? CATU_VALID_ENTRY(addr) : 0;
 }
@@ -390,7 +389,7 @@ static const struct attribute_group *catu_groups[] = {
 };
 
 
-static inline int catu_wait_for_ready(struct catu_drvdata *drvdata)
+static int catu_wait_for_ready(struct catu_drvdata *drvdata)
 {
 	struct csdev_access *csa = &drvdata->csdev->access;
 
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 2b5a7cceb719..074dbf8a6876 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -129,13 +129,13 @@ coresight_find_out_connection(struct coresight_device *csdev,
 	return ERR_PTR(-ENODEV);
 }
 
-static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
+static u32 coresight_read_claim_tags(struct coresight_device *csdev)
 {
 	return FIELD_GET(CORESIGHT_CLAIM_MASK,
 			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
 }
 
-static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
+static void coresight_set_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMSET);
@@ -604,7 +604,7 @@ struct coresight_device *coresight_get_sink_by_id(u32 id)
  * Return true in successful case and power up the device.
  * Return false when failed to get reference of module.
  */
-static inline bool coresight_get_ref(struct coresight_device *csdev)
+static bool coresight_get_ref(struct coresight_device *csdev)
 {
 	struct device *dev = csdev->dev.parent;
 
@@ -623,7 +623,7 @@ static inline bool coresight_get_ref(struct coresight_device *csdev)
  *
  * @csdev: The coresight device to decrement a reference from.
  */
-static inline void coresight_put_ref(struct coresight_device *csdev)
+static void coresight_put_ref(struct coresight_device *csdev)
 {
 	struct device *dev = csdev->dev.parent;
 
@@ -846,7 +846,7 @@ void coresight_release_path(struct coresight_path *path)
 }
 
 /* return true if the device is a suitable type for a default sink */
-static inline bool coresight_is_def_sink_type(struct coresight_device *csdev)
+static bool coresight_is_def_sink_type(struct coresight_device *csdev)
 {
 	/* sink & correct subtype */
 	if (((csdev->type == CORESIGHT_DEV_TYPE_SINK) ||
@@ -1410,8 +1410,8 @@ EXPORT_SYMBOL_GPL(coresight_unregister);
  *
  * Returns the index of the entry, when found. Otherwise, -ENOENT.
  */
-static inline int coresight_search_device_idx(struct coresight_dev_list *dict,
-					      struct fwnode_handle *fwnode)
+static int coresight_search_device_idx(struct coresight_dev_list *dict,
+				       struct fwnode_handle *fwnode)
 {
 	int i;
 
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 2bfcb669aa84..d5efb085b30d 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -95,7 +95,7 @@ struct etb_drvdata {
 static int etb_set_buffer(struct coresight_device *csdev,
 			  struct perf_output_handle *handle);
 
-static inline unsigned int etb_get_buffer_depth(struct etb_drvdata *drvdata)
+static unsigned int etb_get_buffer_depth(struct etb_drvdata *drvdata)
 {
 	return readl_relaxed(drvdata->base + ETB_RAM_DEPTH_REG);
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 52c9aa56e8b9..2ca35ef35f77 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -84,7 +84,7 @@ static int etm4_probe_cpu(unsigned int cpu);
  *		TRCIDR4.NUMPC > 0b0000 .
  *		TRCSSCSR<n>.PC == 0b1
  */
-static inline bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
+static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
 {
 	return (n < drvdata->nr_ss_cmp) &&
 	       drvdata->nr_pe &&
@@ -185,7 +185,7 @@ static void etm_write_os_lock(struct etmv4_drvdata *drvdata,
 	isb();
 }
 
-static inline void etm4_os_unlock_csa(struct etmv4_drvdata *drvdata,
+static void etm4_os_unlock_csa(struct etmv4_drvdata *drvdata,
 				      struct csdev_access *csa)
 {
 	WARN_ON(drvdata->cpu != smp_processor_id());
@@ -1070,7 +1070,7 @@ static const struct coresight_ops etm4_cs_ops = {
 	.source_ops	= &etm4_source_ops,
 };
 
-static inline bool cpu_supports_sysreg_trace(void)
+static bool cpu_supports_sysreg_trace(void)
 {
 	u64 dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
 
@@ -1378,7 +1378,7 @@ static void etm4_init_arch_data(void *info)
 	cpu_detect_trace_filtering(drvdata);
 }
 
-static inline u32 etm4_get_victlr_access_type(struct etmv4_config *config)
+static u32 etm4_get_victlr_access_type(struct etmv4_config *config)
 {
 	return etm4_get_access_type(config) << __bf_shf(TRCVICTLR_EXLEVEL_MASK);
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index fdd0956fecb3..49d5fb87a74b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -2440,7 +2440,7 @@ static u32 etmv4_cross_read(const struct etmv4_drvdata *drvdata, u32 offset)
 	return reg.data;
 }
 
-static inline u32 coresight_etm4x_attr_to_offset(struct device_attribute *attr)
+static u32 coresight_etm4x_attr_to_offset(struct device_attribute *attr)
 {
 	struct dev_ext_attribute *eattr;
 
@@ -2464,7 +2464,7 @@ static ssize_t coresight_etm4x_reg_show(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);
 }
 
-static inline bool
+static bool
 etm4x_register_implemented(struct etmv4_drvdata *drvdata, u32 offset)
 {
 	switch (offset) {
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 8192ba3279f0..0db64c5f4995 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -139,7 +139,7 @@ coresight_find_csdev_by_fwnode(struct fwnode_handle *r_fwnode)
 EXPORT_SYMBOL_GPL(coresight_find_csdev_by_fwnode);
 
 #ifdef CONFIG_OF
-static inline bool of_coresight_legacy_ep_is_input(struct device_node *ep)
+static bool of_coresight_legacy_ep_is_input(struct device_node *ep)
 {
 	return of_property_read_bool(ep, "slave-mode");
 }
@@ -159,7 +159,7 @@ static struct device_node *of_coresight_get_port_parent(struct device_node *ep)
 	return parent;
 }
 
-static inline struct device_node *
+static struct device_node *
 of_coresight_get_output_ports_node(const struct device_node *node)
 {
 	return of_get_child_by_name(node, "out-ports");
@@ -327,14 +327,14 @@ static int of_get_coresight_platform_data(struct device *dev,
 	return 0;
 }
 #else
-static inline int
+static int
 of_get_coresight_platform_data(struct device *dev,
 			       struct coresight_platform_data *pdata)
 {
 	return -ENOENT;
 }
 
-static inline int of_coresight_get_cpu(struct device *dev)
+static int of_coresight_get_cpu(struct device *dev)
 {
 	return -ENODEV;
 }
@@ -356,7 +356,7 @@ static const guid_t coresight_graph_uuid = GUID_INIT(0x3ecbc8b6, 0x1d0e, 0x4fb3,
 #define ACPI_CORESIGHT_LINK_SLAVE	0
 #define ACPI_CORESIGHT_LINK_MASTER	1
 
-static inline bool is_acpi_guid(const union acpi_object *obj)
+static bool is_acpi_guid(const union acpi_object *obj)
 {
 	return (obj->type == ACPI_TYPE_BUFFER) && (obj->buffer.length == 16);
 }
@@ -365,24 +365,24 @@ static inline bool is_acpi_guid(const union acpi_object *obj)
  * acpi_guid_matches	- Checks if the given object is a GUID object and
  * that it matches the supplied the GUID.
  */
-static inline bool acpi_guid_matches(const union acpi_object *obj,
+static bool acpi_guid_matches(const union acpi_object *obj,
 				   const guid_t *guid)
 {
 	return is_acpi_guid(obj) &&
 	       guid_equal((guid_t *)obj->buffer.pointer, guid);
 }
 
-static inline bool is_acpi_dsd_graph_guid(const union acpi_object *obj)
+static bool is_acpi_dsd_graph_guid(const union acpi_object *obj)
 {
 	return acpi_guid_matches(obj, &acpi_graph_uuid);
 }
 
-static inline bool is_acpi_coresight_graph_guid(const union acpi_object *obj)
+static bool is_acpi_coresight_graph_guid(const union acpi_object *obj)
 {
 	return acpi_guid_matches(obj, &coresight_graph_uuid);
 }
 
-static inline bool is_acpi_coresight_graph(const union acpi_object *obj)
+static bool is_acpi_coresight_graph(const union acpi_object *obj)
 {
 	const union acpi_object *graphid, *guid, *links;
 
@@ -469,7 +469,7 @@ static inline bool is_acpi_coresight_graph(const union acpi_object *obj)
  *	}, // End of ACPI Graph Property
  *  })
  */
-static inline bool acpi_validate_dsd_graph(const union acpi_object *graph)
+static bool acpi_validate_dsd_graph(const union acpi_object *graph)
 {
 	int i, n;
 	const union acpi_object *rev, *nr_graphs;
@@ -553,7 +553,7 @@ acpi_get_dsd_graph(struct acpi_device *adev, struct acpi_buffer *buf)
 	return NULL;
 }
 
-static inline bool
+static bool
 acpi_validate_coresight_graph(const union acpi_object *cs_graph)
 {
 	int nlinks;
@@ -794,14 +794,14 @@ acpi_get_coresight_platform_data(struct device *dev,
 
 #else
 
-static inline int
+static int
 acpi_get_coresight_platform_data(struct device *dev,
 				 struct coresight_platform_data *pdata)
 {
 	return -ENOENT;
 }
 
-static inline int acpi_coresight_get_cpu(struct device *dev)
+static int acpi_coresight_get_cpu(struct device *dev)
 {
 	return -ENODEV;
 }
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index b2acd4535c74..52beb2fc4094 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -63,7 +63,7 @@ static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
 /*
  * replicator_reset : Reset the replicator configuration to sane values.
  */
-static inline void replicator_reset(struct replicator_drvdata *drvdata)
+static void replicator_reset(struct replicator_drvdata *drvdata)
 {
 	if (drvdata->base)
 		dynamic_replicator_reset(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 26f9339f38b9..8c0741583a2c 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -301,7 +301,7 @@ static const struct coresight_ops stm_cs_ops = {
 	.source_ops	= &stm_source_ops,
 };
 
-static inline bool stm_addr_unaligned(const void *addr, u8 write_bytes)
+static bool stm_addr_unaligned(const void *addr, u8 write_bytes)
 {
 	return ((unsigned long)addr & (write_bytes - 1));
 }
@@ -685,7 +685,7 @@ static int of_stm_get_stimulus_area(struct device *dev, struct resource *res)
 	return of_address_to_resource(np, index, res);
 }
 #else
-static inline int of_stm_get_stimulus_area(struct device *dev,
+static int of_stm_get_stimulus_area(struct device *dev,
 					   struct resource *res)
 {
 	return -ENOENT;
@@ -729,7 +729,7 @@ static int acpi_stm_get_stimulus_area(struct device *dev, struct resource *res)
 	return rc;
 }
 #else
-static inline int acpi_stm_get_stimulus_area(struct device *dev,
+static int acpi_stm_get_stimulus_area(struct device *dev,
 					     struct resource *res)
 {
 	return -ENOENT;
diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
index 213b4159b062..2b40e556be87 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -10,7 +10,7 @@
 #include "coresight-syscfg-configfs.h"
 
 /* create a default ci_type. */
-static inline struct config_item_type *cscfg_create_ci_type(void)
+static struct config_item_type *cscfg_create_ci_type(void)
 {
 	struct config_item_type *ci_type;
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index a09579eff3fd..6f6d51c13454 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -287,8 +287,8 @@ static int tmc_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static inline ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata,
-					  loff_t pos, size_t len, char **bufpp)
+static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
+				   char **bufpp)
 {
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -591,7 +591,7 @@ static const struct attribute_group *coresight_etr_groups[] = {
 	NULL,
 };
 
-static inline bool tmc_etr_can_use_sg(struct device *dev)
+static bool tmc_etr_can_use_sg(struct device *dev)
 {
 	int ret;
 	u8 val_u8;
@@ -621,7 +621,7 @@ static inline bool tmc_etr_can_use_sg(struct device *dev)
 	return false;
 }
 
-static inline bool tmc_etr_has_non_secure_access(struct tmc_drvdata *drvdata)
+static bool tmc_etr_has_non_secure_access(struct tmc_drvdata *drvdata)
 {
 	u32 auth = readl_relaxed(drvdata->base + TMC_AUTHSTATUS);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb29b68a..3f31ad2ae65d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -125,7 +125,7 @@ struct etr_sg_table {
  * If we spill over to a new page for mapping 1 entry, we could as
  * well replace the link entry of the previous page with the last entry.
  */
-static inline unsigned long __attribute_const__
+static unsigned long __attribute_const__
 tmc_etr_sg_table_entries(int nr_pages)
 {
 	unsigned long nr_sgpages = nr_pages * ETR_SG_PAGES_PER_SYSPAGE;
@@ -239,13 +239,13 @@ static int tmc_pages_alloc(struct tmc_pages *tmc_pages,
 	return -ENOMEM;
 }
 
-static inline long
+static long
 tmc_sg_get_data_page_offset(struct tmc_sg_table *sg_table, dma_addr_t addr)
 {
 	return tmc_pages_get_offset(&sg_table->data_pages, addr);
 }
 
-static inline void tmc_free_table_pages(struct tmc_sg_table *sg_table)
+static void tmc_free_table_pages(struct tmc_sg_table *sg_table)
 {
 	if (sg_table->table_vaddr)
 		vunmap(sg_table->table_vaddr);
@@ -481,7 +481,7 @@ static void tmc_etr_sg_table_dump(struct etr_sg_table *etr_table)
 	dev_dbg(sg_table->dev, "******* End of Table *****\n");
 }
 #else
-static inline void tmc_etr_sg_table_dump(struct etr_sg_table *etr_table) {}
+static void tmc_etr_sg_table_dump(struct etr_sg_table *etr_table) {}
 #endif
 
 /*
@@ -886,10 +886,8 @@ void tmc_etr_remove_catu_ops(void)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_remove_catu_ops);
 
-static inline int tmc_etr_mode_alloc_buf(int mode,
-					 struct tmc_drvdata *drvdata,
-					 struct etr_buf *etr_buf, int node,
-					 void **pages)
+static int tmc_etr_mode_alloc_buf(int mode, struct tmc_drvdata *drvdata, struct etr_buf *etr_buf,
+				  int node, void **pages)
 {
 	int rc = -EINVAL;
 
@@ -1009,7 +1007,7 @@ static ssize_t tmc_etr_buf_get_data(struct etr_buf *etr_buf,
 	return etr_buf->ops->get_data(etr_buf, (u64)offset, len, bufpp);
 }
 
-static inline s64
+static s64
 tmc_etr_buf_insert_barrier_packet(struct etr_buf *etr_buf, u64 offset)
 {
 	ssize_t len;
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index fff67aac8418..8267dd1a2130 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -160,22 +160,22 @@ static void trbe_check_errata(struct trbe_cpudata *cpudata)
 	}
 }
 
-static inline bool trbe_has_erratum(struct trbe_cpudata *cpudata, int i)
+static bool trbe_has_erratum(struct trbe_cpudata *cpudata, int i)
 {
 	return (i < TRBE_ERRATA_MAX) && test_bit(i, cpudata->errata);
 }
 
-static inline bool trbe_may_overwrite_in_fill_mode(struct trbe_cpudata *cpudata)
+static bool trbe_may_overwrite_in_fill_mode(struct trbe_cpudata *cpudata)
 {
 	return trbe_has_erratum(cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE);
 }
 
-static inline bool trbe_may_write_out_of_range(struct trbe_cpudata *cpudata)
+static bool trbe_may_write_out_of_range(struct trbe_cpudata *cpudata)
 {
 	return trbe_has_erratum(cpudata, TRBE_WORKAROUND_WRITE_OUT_OF_RANGE);
 }
 
-static inline bool trbe_needs_drain_after_disable(struct trbe_cpudata *cpudata)
+static bool trbe_needs_drain_after_disable(struct trbe_cpudata *cpudata)
 {
 	/*
 	 * Errata affected TRBE implementation will need TSB CSYNC and
@@ -185,7 +185,7 @@ static inline bool trbe_needs_drain_after_disable(struct trbe_cpudata *cpudata)
 	return trbe_has_erratum(cpudata, TRBE_NEEDS_DRAIN_AFTER_DISABLE);
 }
 
-static inline bool trbe_needs_ctxt_sync_after_enable(struct trbe_cpudata *cpudata)
+static bool trbe_needs_ctxt_sync_after_enable(struct trbe_cpudata *cpudata)
 {
 	/*
 	 * Errata affected TRBE implementation will need an additional
@@ -196,7 +196,7 @@ static inline bool trbe_needs_ctxt_sync_after_enable(struct trbe_cpudata *cpudat
 	return trbe_has_erratum(cpudata, TRBE_NEEDS_CTXT_SYNC_AFTER_ENABLE);
 }
 
-static inline bool trbe_is_broken(struct trbe_cpudata *cpudata)
+static bool trbe_is_broken(struct trbe_cpudata *cpudata)
 {
 	return trbe_has_erratum(cpudata, TRBE_IS_BROKEN);
 }
@@ -208,13 +208,13 @@ static int trbe_alloc_node(struct perf_event *event)
 	return cpu_to_node(event->cpu);
 }
 
-static inline void trbe_drain_buffer(void)
+static void trbe_drain_buffer(void)
 {
 	tsb_csync();
 	dsb(nsh);
 }
 
-static inline void set_trbe_enabled(struct trbe_cpudata *cpudata, u64 trblimitr)
+static void set_trbe_enabled(struct trbe_cpudata *cpudata, u64 trblimitr)
 {
 	/*
 	 * Enable the TRBE without clearing LIMITPTR which
@@ -231,7 +231,7 @@ static inline void set_trbe_enabled(struct trbe_cpudata *cpudata, u64 trblimitr)
 		isb();
 }
 
-static inline void set_trbe_disabled(struct trbe_cpudata *cpudata)
+static void set_trbe_disabled(struct trbe_cpudata *cpudata)
 {
 	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
