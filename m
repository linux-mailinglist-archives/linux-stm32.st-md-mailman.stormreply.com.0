Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A450D840A4B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 16:42:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D254C6DD6D;
	Mon, 29 Jan 2024 15:42:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B50EC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 15:42:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F116DA7;
 Mon, 29 Jan 2024 07:43:04 -0800 (PST)
Received: from e127643.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D2D2D3F738;
 Mon, 29 Jan 2024 07:42:17 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Mon, 29 Jan 2024 15:40:39 +0000
Message-Id: <20240129154050.569566-9-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129154050.569566-1-james.clark@arm.com>
References: <20240129154050.569566-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH v2 08/12] coresight: Remove unused stubs
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

These are a bit annoying to keep up to date when the function signatures
change. But if CONFIG_CORESIGHT isn't enabled, then they're not used
anyway so just delete them.

Signed-off-by: James Clark <james.clark@arm.com>
---
 include/linux/coresight.h | 79 ---------------------------------------
 1 file changed, 79 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4400d554a16b..c5be46d7f85c 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -391,8 +391,6 @@ struct coresight_ops {
 	const struct coresight_ops_helper *helper_ops;
 };
 
-#if IS_ENABLED(CONFIG_CORESIGHT)
-
 static inline u32 csdev_access_relaxed_read32(struct csdev_access *csa,
 					      u32 offset)
 {
@@ -611,83 +609,6 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 			       u64 val, u32 offset);
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
-#else
-static inline struct coresight_device *
-coresight_register(struct coresight_desc *desc) { return NULL; }
-static inline void coresight_unregister(struct coresight_device *csdev) {}
-static inline int
-coresight_enable_sysfs(struct coresight_device *csdev) { return -ENOSYS; }
-static inline void coresight_disable_sysfs(struct coresight_device *csdev) {}
-
-static inline int coresight_timeout(struct csdev_access *csa, u32 offset,
-				    int position, int value)
-{
-	return 1;
-}
-
-static inline int coresight_claim_device_unlocked(struct coresight_device *csdev)
-{
-	return -EINVAL;
-}
-
-static inline int coresight_claim_device(struct coresight_device *csdev)
-{
-	return -EINVAL;
-}
-
-static inline void coresight_disclaim_device(struct coresight_device *csdev) {}
-static inline void coresight_disclaim_device_unlocked(struct coresight_device *csdev) {}
-
-static inline bool coresight_loses_context_with_cpu(struct device *dev)
-{
-	return false;
-}
-
-static inline u32 coresight_relaxed_read32(struct coresight_device *csdev, u32 offset)
-{
-	WARN_ON_ONCE(1);
-	return 0;
-}
-
-static inline u32 coresight_read32(struct coresight_device *csdev, u32 offset)
-{
-	WARN_ON_ONCE(1);
-	return 0;
-}
-
-static inline void coresight_write32(struct coresight_device *csdev, u32 val, u32 offset)
-{
-}
-
-static inline void coresight_relaxed_write32(struct coresight_device *csdev,
-					     u32 val, u32 offset)
-{
-}
-
-static inline u64 coresight_relaxed_read64(struct coresight_device *csdev,
-					   u32 offset)
-{
-	WARN_ON_ONCE(1);
-	return 0;
-}
-
-static inline u64 coresight_read64(struct coresight_device *csdev, u32 offset)
-{
-	WARN_ON_ONCE(1);
-	return 0;
-}
-
-static inline void coresight_relaxed_write64(struct coresight_device *csdev,
-					     u64 val, u32 offset)
-{
-}
-
-static inline void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset)
-{
-}
-
-#endif		/* IS_ENABLED(CONFIG_CORESIGHT) */
-
 extern int coresight_get_cpu(struct device *dev);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
