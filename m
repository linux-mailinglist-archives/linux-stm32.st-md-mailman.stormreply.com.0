Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A754EA6791E
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 17:22:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E1E7C78F61;
	Tue, 18 Mar 2025 16:22:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 316A7C78F8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 16:22:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so22908525e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 09:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742314954; x=1742919754;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mzygv1zmoSmMBR9C/JBm6BBitk8sK5gCp8CQa+ZR77A=;
 b=IIPy60eyg5ADsdCltdRDE3RAzti4poRF9pO5XAyOYHKp0qxNg2W8yXsfuGumuSs9dx
 +gd3PkxOhBqVW+IsVDK+J0oVRBOM3toVfxppqCCvAdxEAg1DsiN0MWht/g0F/72uEacU
 0BUf64gOV05hFoX1g1DSKb7UlCJfa6Z/rTd00F2r4Vbe/vkfKtQ2CwSeiFWX4llThCdC
 5kQFxmImUWZPHIOuCXMNO1DNVHRWse4BrM8FuVenmJ490+lrzvsdSwLL5/LMuaX2SMVy
 odGlRo4vn0Jkbm0/cjmrVtbcawkG8Q/F6AcH1Xi11j78dxei88yECxweQweSgpIgf1qZ
 dzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742314954; x=1742919754;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mzygv1zmoSmMBR9C/JBm6BBitk8sK5gCp8CQa+ZR77A=;
 b=RXgUJjXpeJDnWl5WTNSU+158Npcu6cUdZDvjXQi6SVrvcmElcSdJTjQEW4OoBfFj+O
 lggr4kiyqzS0a8cKzOOwIz2wQQT9HWiCy9kma3wvF1nBfkxELyrKblu+HeJJEZra+Bh9
 dlBKTc0cs994ZOxPkrdrqv3zwcI+vsU/UGvS065+7buXt9fIRY9n+f/v2MBUmsKSeK+U
 hOeF5ZaKeW53lXFXE81YR9eezjPmZbhOOW5aXETdCMIx/qgriKxy+1EiflU+tl/sQbbd
 QubfAVUTmu43sDGwA4FOfHk3w4z+glnMzUG3GEfKJtgT0HS23UL94P/mYUhgPIpuqUP2
 o4wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0dO0bVXYDZHIcu4z9E6y+2dLXgzFeS/H9EMT7vCd69sQo9twIc2Slcfs0CgTg6UmCMVca+FkAgjyqrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz61QVJ2bVcaHQuP2SMSbhofZXvdsV/HlP7A2tqq1jyyEpPXGwD
 k/PqpOs6UmR3zu2Bxl5vHWNWFiVnolv9k7jD9s08HKmPebsUaA9b27LggQ0w0TI=
X-Gm-Gg: ASbGnct8hb0M8i/GzT9y0tjE5uUzu+Grhv3my+DiEJgtje3hp15WuwPOdzFFQqX6dvu
 kizmkF3uedzm/00BkSiq7rUkLfDmF0qeXXR5+Eh9twIE0xZF4N1Ajv07uvuaLfKUo6O+jPNCb02
 IZcLwe5OcW9nmcjml2hopbHo214o1Hy4hIuAexdSrM3ftFyfBGDeJcHck9q+7P/pXWg9VGy+GHJ
 MgDR/770CfSCivVF6TF1MyjJILpg+TAsUKZjFMDvWIL0Kz/hzl8+l9cKsMpoXlQUTV9NcMqF8Un
 6Kgxx/DxicnOajb7aTifbeU/6DKgAgI8UZa/Qtd4UIYGssmRRKmMxzDLjA==
X-Google-Smtp-Source: AGHT+IGpSddBncNMoEXkZiQy0s8cXmEBTKDy/mE2aWQMjEHGlYCnQRPpg0LV8lnQqkoTl3pXBsNtng==
X-Received: by 2002:a5d:5f4c:0:b0:390:f9d0:5e3 with SMTP id
 ffacd0b85a97d-3971d136265mr16833640f8f.1.1742314953579; 
 Tue, 18 Mar 2025 09:22:33 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:22:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:22:01 +0000
MIME-Version: 1.0
Message-Id: <20250318-james-coresight-claim-tags-v2-7-e9c8a9cde84e@linaro.org>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
In-Reply-To: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 7/8] coresight: Remove inlines from static
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
index 5f08845faf0d..69388e2dd386 100644
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
@@ -602,7 +602,7 @@ struct coresight_device *coresight_get_sink_by_id(u32 id)
  * Return true in successful case and power up the device.
  * Return false when failed to get reference of module.
  */
-static inline bool coresight_get_ref(struct coresight_device *csdev)
+static bool coresight_get_ref(struct coresight_device *csdev)
 {
 	struct device *dev = csdev->dev.parent;
 
@@ -621,7 +621,7 @@ static inline bool coresight_get_ref(struct coresight_device *csdev)
  *
  * @csdev: The coresight device to decrement a reference from.
  */
-static inline void coresight_put_ref(struct coresight_device *csdev)
+static void coresight_put_ref(struct coresight_device *csdev)
 {
 	struct device *dev = csdev->dev.parent;
 
@@ -844,7 +844,7 @@ void coresight_release_path(struct coresight_path *path)
 }
 
 /* return true if the device is a suitable type for a default sink */
-static inline bool coresight_is_def_sink_type(struct coresight_device *csdev)
+static bool coresight_is_def_sink_type(struct coresight_device *csdev)
 {
 	/* sink & correct subtype */
 	if (((csdev->type == CORESIGHT_DEV_TYPE_SINK) ||
@@ -1408,8 +1408,8 @@ EXPORT_SYMBOL_GPL(coresight_unregister);
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
