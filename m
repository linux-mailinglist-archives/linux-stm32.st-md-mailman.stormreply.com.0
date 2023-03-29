Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0498F6CD8D9
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 13:54:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C15D1C65E6E;
	Wed, 29 Mar 2023 11:54:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA9EEC69069
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 11:54:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A302E1FB;
 Wed, 29 Mar 2023 04:55:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9470E3F6C4;
 Wed, 29 Mar 2023 04:54:35 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org, quic_jinlmao@quicinc.com,
 mike.leach@linaro.org, suzuki.poulose@arm.com
Date: Wed, 29 Mar 2023 12:53:24 +0100
Message-Id: <20230329115329.2747724-12-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329115329.2747724-1-james.clark@arm.com>
References: <20230329115329.2747724-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 11/13] coresight: Refactor out buffer
	allocation function for ETR
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

When CATU is moved to the generic enable/disable path system in the
next commit, it will need to call into ETR and get it to pre-allocate
its buffer so add a function for it.

No functional changes

Signed-off-by: James Clark <james.clark@arm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 50 ++++++++++++++++---
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 689ba6abc70b..00a0c2aa8481 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1169,7 +1169,7 @@ void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 	drvdata->etr_buf = NULL;
 }
 
-static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
+static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 {
 	int ret = 0;
 	unsigned long flags;
@@ -1192,7 +1192,7 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 		/* Allocate memory with the locks released */
 		free_buf = new_buf = tmc_etr_setup_sysfs_buf(drvdata);
 		if (IS_ERR(new_buf))
-			return PTR_ERR(new_buf);
+			return new_buf;
 
 		/* Let's try again */
 		spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -1223,17 +1223,33 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 		drvdata->sysfs_buf = new_buf;
 	}
 
-	ret = tmc_etr_enable_hw(drvdata, drvdata->sysfs_buf);
-	if (!ret) {
-		drvdata->mode = CS_MODE_SYSFS;
-		atomic_inc(&csdev->refcnt);
-	}
 out:
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	/* Free memory outside the spinlock if need be */
 	if (free_buf)
 		tmc_etr_free_sysfs_buf(free_buf);
+	return ret ? ERR_PTR(ret) : drvdata->sysfs_buf;
+}
+
+static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
+{
+	int ret;
+	unsigned long flags;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
+
+	if (IS_ERR(sysfs_buf))
+		return PTR_ERR(sysfs_buf);
+
+	spin_lock_irqsave(&drvdata->spinlock, flags);
+	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
+	if (!ret) {
+		drvdata->mode = CS_MODE_SYSFS;
+		atomic_inc(&csdev->refcnt);
+	}
+
+	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (!ret)
 		dev_dbg(&csdev->dev, "TMC-ETR enabled\n");
@@ -1241,6 +1257,26 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
+struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
+				   enum cs_mode mode, void *data)
+{
+	struct perf_output_handle *handle = data;
+	struct etr_perf_buffer *etr_perf;
+
+	switch (mode) {
+	case CS_MODE_SYSFS:
+		return tmc_etr_get_sysfs_buffer(csdev);
+	case CS_MODE_PERF:
+		etr_perf = etm_perf_sink_config(handle);
+		if (WARN_ON(!etr_perf || !etr_perf->etr_buf))
+			return ERR_PTR(-EINVAL);
+		return etr_perf->etr_buf;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_buffer);
+
 /*
  * alloc_etr_buf: Allocate ETR buffer for use by perf.
  * The size of the hardware buffer is dependent on the size configured
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 01c0382a29c0..b97da39652d2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -332,5 +332,7 @@ struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);
+struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
+				   enum cs_mode mode, void *data);
 
 #endif
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
