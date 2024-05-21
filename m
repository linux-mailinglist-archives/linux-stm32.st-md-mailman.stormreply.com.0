Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 424328CA9AE
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 10:10:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE23EC6C820;
	Tue, 21 May 2024 08:10:58 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B147BC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 08:10:51 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L3erfQ001469;
 Tue, 21 May 2024 10:10:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=kgVIqvtcxNrOP/hhUaH+aAauOzdwnKf+O8volStLKIM=; b=PR
 6cgwFU08k5djMiJSDVnM2+kkjGf9xJIgyBcUlk6LHGgychCGmNPghYhphz98SIvh
 zI30qP5oO06+98R0fDQh1qS2ztfw/K967A/Ra/XndS8PvsLArlOxJcc2JoCdhJ0F
 nQEBpQPdGCCzawUZTBS2TXWYWzwXPSbL5LCsnxmmUPMalW61s026C0nm2TovE7eZ
 r/Y/gDhitOMdr1VX0/0fPl5blwiz2znSm6B0a5XrSgIZFpt0BTyEkjOEmtt/9Mrf
 DLvOoXe9n6RO3SJQMjs0QaM+TnyMlPm3eFG/8V0X08jNKmnO3/NJfF/6QiLigXX2
 +I6wXYcziJLVh47aOGtA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y779hrdyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 May 2024 10:10:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9E6084004D;
 Tue, 21 May 2024 10:10:39 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28EDA2122F9;
 Tue, 21 May 2024 10:10:14 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:14 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:13 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Tue, 21 May 2024 10:09:58 +0200
Message-ID: <20240521081001.2989417-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_04,2024-05-21_01,2024-05-17_01
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 4/7] remoteproc: core introduce
	rproc_set_rsc_table_on_start function
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

Split rproc_start()to prepare the update of the management of
the cache table on start, for the support of the firmware loading
by the TEE interface.
- create rproc_set_rsc_table_on_start() to address the management of
  the cache table in a specific function, as done in
  rproc_reset_rsc_table_on_stop().
- rename rproc_set_rsc_table in rproc_set_rsc_table_on_attach()
- move rproc_reset_rsc_table_on_stop() to be close to the
  rproc_set_rsc_table_on_start() function

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 116 ++++++++++++++-------------
 1 file changed, 62 insertions(+), 54 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f276956f2c5c..42bca01f3bde 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1264,18 +1264,9 @@ void rproc_resource_cleanup(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_resource_cleanup);
 
-static int rproc_start(struct rproc *rproc, const struct firmware *fw)
+static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
 {
 	struct resource_table *loaded_table;
-	struct device *dev = &rproc->dev;
-	int ret;
-
-	/* load the ELF segments to memory */
-	ret = rproc_load_segments(rproc, fw);
-	if (ret) {
-		dev_err(dev, "Failed to load program segments: %d\n", ret);
-		return ret;
-	}
 
 	/*
 	 * The starting device has been given the rproc->cached_table as the
@@ -1291,6 +1282,64 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 		rproc->table_ptr = loaded_table;
 	}
 
+	return 0;
+}
+
+static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
+{
+	/* A resource table was never retrieved, nothing to do here */
+	if (!rproc->table_ptr)
+		return 0;
+
+	/*
+	 * If a cache table exists the remote processor was started by
+	 * the remoteproc core.  That cache table should be used for
+	 * the rest of the shutdown process.
+	 */
+	if (rproc->cached_table)
+		goto out;
+
+	/*
+	 * If we made it here the remote processor was started by another
+	 * entity and a cache table doesn't exist.  As such make a copy of
+	 * the resource table currently used by the remote processor and
+	 * use that for the rest of the shutdown process.  The memory
+	 * allocated here is free'd in rproc_shutdown().
+	 */
+	rproc->cached_table = kmemdup(rproc->table_ptr,
+				      rproc->table_sz, GFP_KERNEL);
+	if (!rproc->cached_table)
+		return -ENOMEM;
+
+	/*
+	 * Since the remote processor is being switched off the clean table
+	 * won't be needed.  Allocated in rproc_set_rsc_table_on_start().
+	 */
+	kfree(rproc->clean_table);
+
+out:
+	/*
+	 * Use a copy of the resource table for the remainder of the
+	 * shutdown process.
+	 */
+	rproc->table_ptr = rproc->cached_table;
+	return 0;
+}
+
+static int rproc_start(struct rproc *rproc, const struct firmware *fw)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	/* load the ELF segments to memory */
+	ret = rproc_load_segments(rproc, fw);
+	if (ret) {
+		dev_err(dev, "Failed to load program segments: %d\n", ret);
+		return ret;
+	}
+
+	rproc_set_rsc_table_on_start(rproc, fw);
+
 	ret = rproc_prepare_subdevices(rproc);
 	if (ret) {
 		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
@@ -1450,7 +1499,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int rproc_set_rsc_table(struct rproc *rproc)
+static int rproc_set_rsc_table_on_attach(struct rproc *rproc)
 {
 	struct resource_table *table_ptr;
 	struct device *dev = &rproc->dev;
@@ -1540,54 +1589,13 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
 
 	/*
 	 * The clean resource table is no longer needed.  Allocated in
-	 * rproc_set_rsc_table().
+	 * rproc_set_rsc_table_on_attach().
 	 */
 	kfree(rproc->clean_table);
 
 	return 0;
 }
 
-static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
-{
-	/* A resource table was never retrieved, nothing to do here */
-	if (!rproc->table_ptr)
-		return 0;
-
-	/*
-	 * If a cache table exists the remote processor was started by
-	 * the remoteproc core.  That cache table should be used for
-	 * the rest of the shutdown process.
-	 */
-	if (rproc->cached_table)
-		goto out;
-
-	/*
-	 * If we made it here the remote processor was started by another
-	 * entity and a cache table doesn't exist.  As such make a copy of
-	 * the resource table currently used by the remote processor and
-	 * use that for the rest of the shutdown process.  The memory
-	 * allocated here is free'd in rproc_shutdown().
-	 */
-	rproc->cached_table = kmemdup(rproc->table_ptr,
-				      rproc->table_sz, GFP_KERNEL);
-	if (!rproc->cached_table)
-		return -ENOMEM;
-
-	/*
-	 * Since the remote processor is being switched off the clean table
-	 * won't be needed.  Allocated in rproc_set_rsc_table().
-	 */
-	kfree(rproc->clean_table);
-
-out:
-	/*
-	 * Use a copy of the resource table for the remainder of the
-	 * shutdown process.
-	 */
-	rproc->table_ptr = rproc->cached_table;
-	return 0;
-}
-
 /*
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
@@ -1614,7 +1622,7 @@ static int rproc_attach(struct rproc *rproc)
 		goto disable_iommu;
 	}
 
-	ret = rproc_set_rsc_table(rproc);
+	ret = rproc_set_rsc_table_on_attach(rproc);
 	if (ret) {
 		dev_err(dev, "can't load resource table: %d\n", ret);
 		goto unprepare_device;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
