Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F645A77ED
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 09:46:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36D60C64111;
	Wed, 31 Aug 2022 07:46:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D637DC640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 17:26:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6E31576;
 Tue, 30 Aug 2022 10:26:55 -0700 (PDT)
Received: from e121896.arm.com (unknown [10.57.15.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B5603F7B4;
 Tue, 30 Aug 2022 10:26:47 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: suzuki.poulose@arm.com, coresight@lists.linaro.org,
 mathieu.poirier@linaro.org
Date: Tue, 30 Aug 2022 18:26:13 +0100
Message-Id: <20220830172614.340962-6-james.clark@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20220830172614.340962-1-james.clark@arm.com>
References: <20220830172614.340962-1-james.clark@arm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Aug 2022 07:46:21 +0000
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@linaro.org,
 german.gomez@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Subject: [Linux-stm32] [PATCH v2 5/5] coresight: Make new csdev_access
	offsets unsigned
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

New csdev_access functions were added as part of the previous
refactor. In order to make them more consistent with the
existing ones, change any signed offset types to be unsigned.

Now that they are unsigned, stop using hi_off = -1 to signify
a single 32bit access. Instead just call the existing 32bit
accessors. This is also applied to other parts of the codebase,
and the coresight_{read,write}_reg_pair() functions can be
deleted.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.h |  8 ++---
 drivers/hwtracing/coresight/coresight-core.c | 18 ++++++++--
 drivers/hwtracing/coresight/coresight-priv.h | 35 +++++---------------
 drivers/hwtracing/coresight/coresight-tmc.h  |  4 +--
 include/linux/coresight.h                    | 27 +++++++++------
 5 files changed, 47 insertions(+), 45 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 6160c2d75a56..442e034bbfba 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -70,24 +70,24 @@ struct catu_drvdata {
 static inline u32							\
 catu_read_##name(struct catu_drvdata *drvdata)				\
 {									\
-	return coresight_read_reg_pair(drvdata->base, offset, -1);	\
+	return csdev_access_relaxed_read32(&drvdata->csdev->access, offset); \
 }									\
 static inline void							\
 catu_write_##name(struct catu_drvdata *drvdata, u32 val)		\
 {									\
-	coresight_write_reg_pair(drvdata->base, val, offset, -1);	\
+	csdev_access_relaxed_write32(&drvdata->csdev->access, val, offset); \
 }
 
 #define CATU_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
 catu_read_##name(struct catu_drvdata *drvdata)				\
 {									\
-	return coresight_read_reg_pair(drvdata->base, lo_off, hi_off);	\
+	return csdev_access_relaxed_read_pair(&drvdata->csdev->access, lo_off, hi_off); \
 }									\
 static inline void							\
 catu_write_##name(struct catu_drvdata *drvdata, u64 val)		\
 {									\
-	coresight_write_reg_pair(drvdata->base, val, lo_off, hi_off);	\
+	csdev_access_relaxed_write_pair(&drvdata->csdev->access, val, lo_off, hi_off); \
 }
 
 CATU_REG32(control, CATU_CONTROL);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c63b2167a69f..d5dbc67bacb4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -60,7 +60,7 @@ EXPORT_SYMBOL_GPL(coresight_barrier_pkt);
 
 static const struct cti_assoc_op *cti_assoc_ops;
 
-ssize_t coresight_simple_show(struct device *_dev,
+ssize_t coresight_simple_show_pair(struct device *_dev,
 			      struct device_attribute *attr, char *buf)
 {
 	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
@@ -72,7 +72,21 @@ ssize_t coresight_simple_show(struct device *_dev,
 	pm_runtime_put_sync(_dev->parent);
 	return sysfs_emit(buf, "0x%llx\n", val);
 }
-EXPORT_SYMBOL_GPL(coresight_simple_show);
+EXPORT_SYMBOL_GPL(coresight_simple_show_pair);
+
+ssize_t coresight_simple_show32(struct device *_dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
+	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
+	u64 val;
+
+	pm_runtime_get_sync(_dev->parent);
+	val = csdev_access_relaxed_read32(&csdev->access, cs_attr->off);
+	pm_runtime_put_sync(_dev->parent);
+	return sysfs_emit(buf, "0x%llx\n", val);
+}
+EXPORT_SYMBOL_GPL(coresight_simple_show32);
 
 void coresight_set_cti_ops(const struct cti_assoc_op *cti_op)
 {
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index c211979deca5..595ce5862056 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -41,8 +41,8 @@
 #define ETM_MODE_EXCL_USER	BIT(31)
 struct cs_pair_attribute {
 	struct device_attribute attr;
-	s32 lo_off;
-	s32 hi_off;
+	u32 lo_off;
+	u32 hi_off;
 };
 
 struct cs_off_attribute {
@@ -50,21 +50,23 @@ struct cs_off_attribute {
 	u32 off;
 };
 
-extern ssize_t coresight_simple_show(struct device *_dev,
+extern ssize_t coresight_simple_show32(struct device *_dev,
+				     struct device_attribute *attr, char *buf);
+extern ssize_t coresight_simple_show_pair(struct device *_dev,
 				     struct device_attribute *attr, char *buf);
 
 #define coresight_simple_reg32(name, offset)				\
-	(&((struct cs_pair_attribute[]) {				\
+	(&((struct cs_off_attribute[]) {				\
 	   {								\
-		__ATTR(name, 0444, coresight_simple_show, NULL),	\
-		offset, -1						\
+		__ATTR(name, 0444, coresight_simple_show32, NULL),	\
+		offset							\
 	   }								\
 	})[0].attr.attr)
 
 #define coresight_simple_reg64(name, lo_off, hi_off)			\
 	(&((struct cs_pair_attribute[]) {				\
 	   {								\
-		__ATTR(name, 0444, coresight_simple_show, NULL),	\
+		__ATTR(name, 0444, coresight_simple_show_pair, NULL),	\
 		lo_off, hi_off						\
 	   }								\
 	})[0].attr.attr)
@@ -130,25 +132,6 @@ static inline void CS_UNLOCK(void __iomem *addr)
 	} while (0);
 }
 
-static inline u64
-coresight_read_reg_pair(void __iomem *addr, s32 lo_offset, s32 hi_offset)
-{
-	u64 val;
-
-	val = readl_relaxed(addr + lo_offset);
-	val |= (hi_offset < 0) ? 0 :
-	       (u64)readl_relaxed(addr + hi_offset) << 32;
-	return val;
-}
-
-static inline void coresight_write_reg_pair(void __iomem *addr, u64 val,
-						 s32 lo_offset, s32 hi_offset)
-{
-	writel_relaxed((u32)val, addr + lo_offset);
-	if (hi_offset >= 0)
-		writel_relaxed((u32)(val >> 32), addr + hi_offset);
-}
-
 void coresight_disable_path(struct list_head *path);
 int coresight_enable_path(struct list_head *path, u32 mode, void *sink_data);
 struct coresight_device *coresight_get_sink(struct list_head *path);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6bec20a392b3..66959557cf39 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -282,12 +282,12 @@ ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 static inline u64							\
 tmc_read_##name(struct tmc_drvdata *drvdata)				\
 {									\
-	return coresight_read_reg_pair(drvdata->base, lo_off, hi_off);	\
+	return csdev_access_relaxed_read_pair(&drvdata->csdev->access, lo_off, hi_off); \
 }									\
 static inline void							\
 tmc_write_##name(struct tmc_drvdata *drvdata, u64 val)			\
 {									\
-	coresight_write_reg_pair(drvdata->base, val, lo_off, hi_off);	\
+	csdev_access_relaxed_write_pair(&drvdata->csdev->access, val, lo_off, hi_off); \
 }
 
 TMC_REG_PAIR(rrp, TMC_RRP, TMC_RRPHI)
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index a47dd1f62216..1554021231f9 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -373,21 +373,26 @@ static inline u32 csdev_access_relaxed_read32(struct csdev_access *csa,
 }
 
 static inline u64 csdev_access_relaxed_read_pair(struct csdev_access *csa,
-						 s32 lo_offset, s32 hi_offset)
+						 u32 lo_offset, u32 hi_offset)
 {
-	u64 val;
-
 	if (likely(csa->io_mem)) {
-		val = readl_relaxed(csa->base + lo_offset);
-		val |= (hi_offset < 0) ? 0 :
-		       (u64)readl_relaxed(csa->base + hi_offset) << 32;
-		return val;
+		return readl_relaxed(csa->base + lo_offset) |
+			((u64)readl_relaxed(csa->base + hi_offset) << 32);
 	}
 
-	val = csa->read(lo_offset, true, false);
-	val |= (hi_offset < 0) ? 0 :
-	       (u64)csa->read(hi_offset, true, false) << 32;
-	return val;
+	return csa->read(lo_offset, true, false) | (csa->read(hi_offset, true, false) << 32);
+}
+
+static inline void csdev_access_relaxed_write_pair(struct csdev_access *csa, u64 val,
+						   u32 lo_offset, u32 hi_offset)
+{
+	if (likely(csa->io_mem)) {
+		writel_relaxed((u32)val, csa->base + lo_offset);
+		writel_relaxed((u32)(val >> 32), csa->base + hi_offset);
+	} else {
+		csa->write((u32)val, lo_offset, true, false);
+		csa->write((u32)(val >> 32), hi_offset, true, false);
+	}
 }
 
 static inline u32 csdev_access_read32(struct csdev_access *csa, u32 offset)
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
