Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAAA5A77E9
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 09:46:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5099C5EC6B;
	Wed, 31 Aug 2022 07:46:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B312C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 17:26:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD0121042;
 Tue, 30 Aug 2022 10:26:41 -0700 (PDT)
Received: from e121896.arm.com (unknown [10.57.15.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4DE33F7B4;
 Tue, 30 Aug 2022 10:26:33 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: suzuki.poulose@arm.com, coresight@lists.linaro.org,
 mathieu.poirier@linaro.org
Date: Tue, 30 Aug 2022 18:26:09 +0100
Message-Id: <20220830172614.340962-2-james.clark@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20220830172614.340962-1-james.clark@arm.com>
References: <20220830172614.340962-1-james.clark@arm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Aug 2022 07:46:20 +0000
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@linaro.org,
 german.gomez@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Subject: [Linux-stm32] [PATCH v2 1/5] coresight: Remove unused function
	parameter
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

The ability to use a custom function in this sysfs show function isn't
used so remove it.

No functional changes.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index ff1dd2092ac5..f2458b794ef3 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -40,31 +40,23 @@
 #define ETM_MODE_EXCL_KERN	BIT(30)
 #define ETM_MODE_EXCL_USER	BIT(31)
 
-typedef u32 (*coresight_read_fn)(const struct device *, u32 offset);
-#define __coresight_simple_func(type, func, name, lo_off, hi_off)	\
+#define __coresight_simple_show(type, name, lo_off, hi_off)		\
 static ssize_t name##_show(struct device *_dev,				\
 			   struct device_attribute *attr, char *buf)	\
 {									\
 	type *drvdata = dev_get_drvdata(_dev->parent);			\
-	coresight_read_fn fn = func;					\
 	u64 val;							\
 	pm_runtime_get_sync(_dev->parent);				\
-	if (fn)								\
-		val = (u64)fn(_dev->parent, lo_off);			\
-	else								\
-		val = coresight_read_reg_pair(drvdata->base,		\
-						 lo_off, hi_off);	\
+	val = coresight_read_reg_pair(drvdata->base, lo_off, hi_off);	\
 	pm_runtime_put_sync(_dev->parent);				\
 	return scnprintf(buf, PAGE_SIZE, "0x%llx\n", val);		\
 }									\
 static DEVICE_ATTR_RO(name)
 
-#define coresight_simple_func(type, func, name, offset)			\
-	__coresight_simple_func(type, func, name, offset, -1)
 #define coresight_simple_reg32(type, name, offset)			\
-	__coresight_simple_func(type, NULL, name, offset, -1)
+	__coresight_simple_show(type, name, offset, -1)
 #define coresight_simple_reg64(type, name, lo_off, hi_off)		\
-	__coresight_simple_func(type, NULL, name, lo_off, hi_off)
+	__coresight_simple_show(type, name, lo_off, hi_off)
 
 extern const u32 coresight_barrier_pkt[4];
 #define CORESIGHT_BARRIER_PKT_SIZE (sizeof(coresight_barrier_pkt))
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
