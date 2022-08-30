Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F50E5A77EC
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 09:46:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2120DC6410D;
	Wed, 31 Aug 2022 07:46:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60FABC640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 17:26:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AC9B1570;
 Tue, 30 Aug 2022 10:26:52 -0700 (PDT)
Received: from e121896.arm.com (unknown [10.57.15.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB1563F7B4;
 Tue, 30 Aug 2022 10:26:43 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: suzuki.poulose@arm.com, coresight@lists.linaro.org,
 mathieu.poirier@linaro.org
Date: Tue, 30 Aug 2022 18:26:12 +0100
Message-Id: <20220830172614.340962-5-james.clark@arm.com>
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
Subject: [Linux-stm32] [PATCH v2 4/5] coresight: cti-sysfs: Re-use same
	functions for similar sysfs register accessors
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

Currently each accessor macro creates an identical function which wastes
space in the text area and pollutes the ftrace function name list.
Change it so that the same function is used, but the register to access
is passed in as parameter rather than baked into each function.

Note that only the single accessor is used here and not
csdev_access_relaxed_read_pair() like in the previous commit, so
so a single unsigned offset value is stored instead.

Signed-off-by: James Clark <james.clark@arm.com>
---
 .../hwtracing/coresight/coresight-cti-sysfs.c | 213 +++++++-----------
 drivers/hwtracing/coresight/coresight-priv.h  |   5 +
 2 files changed, 91 insertions(+), 127 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 7ff7e7780bbf..478b8d38b744 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -163,48 +163,82 @@ static struct attribute *coresight_cti_attrs[] = {
 
 /* register based attributes */
 
-/* macro to access RO registers with power check only (no enable check). */
-#define coresight_cti_reg(name, offset)			\
-static ssize_t name##_show(struct device *dev,				\
-			   struct device_attribute *attr, char *buf)	\
-{									\
-	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
-	u32 val = 0;							\
-	pm_runtime_get_sync(dev->parent);				\
-	spin_lock(&drvdata->spinlock);					\
-	if (drvdata->config.hw_powered)					\
-		val = readl_relaxed(drvdata->base + offset);		\
-	spin_unlock(&drvdata->spinlock);				\
-	pm_runtime_put_sync(dev->parent);				\
-	return sprintf(buf, "0x%x\n", val);				\
-}									\
-static DEVICE_ATTR_RO(name)
+/* Read registers with power check only (no enable check). */
+static ssize_t coresight_cti_reg_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
+	u32 val = 0;
 
-/* coresight management registers */
-coresight_cti_reg(devaff0, CTIDEVAFF0);
-coresight_cti_reg(devaff1, CTIDEVAFF1);
-coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS);
-coresight_cti_reg(devarch, CORESIGHT_DEVARCH);
-coresight_cti_reg(devid, CORESIGHT_DEVID);
-coresight_cti_reg(devtype, CORESIGHT_DEVTYPE);
-coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0);
-coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1);
-coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2);
-coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3);
-coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4);
+	pm_runtime_get_sync(dev->parent);
+	spin_lock(&drvdata->spinlock);
+	if (drvdata->config.hw_powered)
+		val = readl_relaxed(drvdata->base + cti_attr->off);
+	spin_unlock(&drvdata->spinlock);
+	pm_runtime_put_sync(dev->parent);
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+
+/* Write registers with power check only (no enable check). */
+static ssize_t coresight_cti_reg_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t size)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
+	unsigned long val = 0;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
 
+	pm_runtime_get_sync(dev->parent);
+	spin_lock(&drvdata->spinlock);
+	if (drvdata->config.hw_powered)
+		cti_write_single_reg(drvdata, cti_attr->off, val);
+	spin_unlock(&drvdata->spinlock);
+	pm_runtime_put_sync(dev->parent);
+	return size;
+}
+
+#define coresight_cti_reg(name, offset)					\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_cti_reg_show, NULL),	\
+		offset							\
+	   }								\
+	})[0].attr.attr)
+
+#define coresight_cti_reg_rw(name, offset)				\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0644, coresight_cti_reg_show,		\
+		       coresight_cti_reg_store),			\
+		offset							\
+	   }								\
+	})[0].attr.attr)
+
+#define coresight_cti_reg_wo(name, offset)				\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0200, NULL, coresight_cti_reg_store),	\
+		offset							\
+	   }								\
+	})[0].attr.attr)
+
+/* coresight management registers */
 static struct attribute *coresight_cti_mgmt_attrs[] = {
-	&dev_attr_devaff0.attr,
-	&dev_attr_devaff1.attr,
-	&dev_attr_authstatus.attr,
-	&dev_attr_devarch.attr,
-	&dev_attr_devid.attr,
-	&dev_attr_devtype.attr,
-	&dev_attr_pidr0.attr,
-	&dev_attr_pidr1.attr,
-	&dev_attr_pidr2.attr,
-	&dev_attr_pidr3.attr,
-	&dev_attr_pidr4.attr,
+	coresight_cti_reg(devaff0, CTIDEVAFF0),
+	coresight_cti_reg(devaff1, CTIDEVAFF1),
+	coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
+	coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
+	coresight_cti_reg(devid, CORESIGHT_DEVID),
+	coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
+	coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
+	coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
+	coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
+	coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
+	coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
 	NULL,
 };
 
@@ -454,86 +488,11 @@ static ssize_t apppulse_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(apppulse);
 
-coresight_cti_reg(triginstatus, CTITRIGINSTATUS);
-coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS);
-coresight_cti_reg(chinstatus, CTICHINSTATUS);
-coresight_cti_reg(choutstatus, CTICHOUTSTATUS);
-
 /*
  * Define CONFIG_CORESIGHT_CTI_INTEGRATION_REGS to enable the access to the
  * integration control registers. Normally only used to investigate connection
  * data.
  */
-#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
-
-/* macro to access RW registers with power check only (no enable check). */
-#define coresight_cti_reg_rw(name, offset)				\
-static ssize_t name##_show(struct device *dev,				\
-			   struct device_attribute *attr, char *buf)	\
-{									\
-	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
-	u32 val = 0;							\
-	pm_runtime_get_sync(dev->parent);				\
-	spin_lock(&drvdata->spinlock);					\
-	if (drvdata->config.hw_powered)					\
-		val = readl_relaxed(drvdata->base + offset);		\
-	spin_unlock(&drvdata->spinlock);				\
-	pm_runtime_put_sync(dev->parent);				\
-	return sprintf(buf, "0x%x\n", val);				\
-}									\
-									\
-static ssize_t name##_store(struct device *dev,				\
-			    struct device_attribute *attr,		\
-			    const char *buf, size_t size)		\
-{									\
-	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
-	unsigned long val = 0;						\
-	if (kstrtoul(buf, 0, &val))					\
-		return -EINVAL;						\
-									\
-	pm_runtime_get_sync(dev->parent);				\
-	spin_lock(&drvdata->spinlock);					\
-	if (drvdata->config.hw_powered)					\
-		cti_write_single_reg(drvdata, offset, val);		\
-	spin_unlock(&drvdata->spinlock);				\
-	pm_runtime_put_sync(dev->parent);				\
-	return size;							\
-}									\
-static DEVICE_ATTR_RW(name)
-
-/* macro to access WO registers with power check only (no enable check). */
-#define coresight_cti_reg_wo(name, offset)				\
-static ssize_t name##_store(struct device *dev,				\
-			    struct device_attribute *attr,		\
-			    const char *buf, size_t size)		\
-{									\
-	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
-	unsigned long val = 0;						\
-	if (kstrtoul(buf, 0, &val))					\
-		return -EINVAL;						\
-									\
-	pm_runtime_get_sync(dev->parent);				\
-	spin_lock(&drvdata->spinlock);					\
-	if (drvdata->config.hw_powered)					\
-		cti_write_single_reg(drvdata, offset, val);		\
-	spin_unlock(&drvdata->spinlock);				\
-	pm_runtime_put_sync(dev->parent);				\
-	return size;							\
-}									\
-static DEVICE_ATTR_WO(name)
-
-coresight_cti_reg_rw(itchout, ITCHOUT);
-coresight_cti_reg_rw(ittrigout, ITTRIGOUT);
-coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL);
-coresight_cti_reg_wo(itchinack, ITCHINACK);
-coresight_cti_reg_wo(ittriginack, ITTRIGINACK);
-coresight_cti_reg(ittrigin, ITTRIGIN);
-coresight_cti_reg(itchin, ITCHIN);
-coresight_cti_reg(itchoutack, ITCHOUTACK);
-coresight_cti_reg(ittrigoutack, ITTRIGOUTACK);
-
-#endif /* CORESIGHT_CTI_INTEGRATION_REGS */
-
 static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_inout_sel.attr,
 	&dev_attr_inen.attr,
@@ -544,20 +503,20 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_appset.attr,
 	&dev_attr_appclear.attr,
 	&dev_attr_apppulse.attr,
-	&dev_attr_triginstatus.attr,
-	&dev_attr_trigoutstatus.attr,
-	&dev_attr_chinstatus.attr,
-	&dev_attr_choutstatus.attr,
+	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
+	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
+	coresight_cti_reg(chinstatus, CTICHINSTATUS),
+	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
-	&dev_attr_itctrl.attr,
-	&dev_attr_ittrigin.attr,
-	&dev_attr_itchin.attr,
-	&dev_attr_ittrigout.attr,
-	&dev_attr_itchout.attr,
-	&dev_attr_itchoutack.attr,
-	&dev_attr_ittrigoutack.attr,
-	&dev_attr_ittriginack.attr,
-	&dev_attr_itchinack.attr,
+	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
+	coresight_cti_reg(ittrigin, ITTRIGIN),
+	coresight_cti_reg(itchin, ITCHIN),
+	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
+	coresight_cti_reg_rw(itchout, ITCHOUT),
+	coresight_cti_reg(itchoutack, ITCHOUTACK),
+	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
+	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
+	coresight_cti_reg_wo(itchinack, ITCHINACK),
 #endif
 	NULL,
 };
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 07b392bfdbcd..c211979deca5 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -45,6 +45,11 @@ struct cs_pair_attribute {
 	s32 hi_off;
 };
 
+struct cs_off_attribute {
+	struct device_attribute attr;
+	u32 off;
+};
+
 extern ssize_t coresight_simple_show(struct device *_dev,
 				     struct device_attribute *attr, char *buf);
 
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
