Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9178CA9B5
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 10:10:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 320A9C7128F;
	Tue, 21 May 2024 08:10:59 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8D5CC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 08:10:52 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L3UH7N009128;
 Tue, 21 May 2024 10:10:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=WsAawMTax3oHIlOFWQKZnqllSyCUDt+4e8kM5A/lBqE=; b=Ce
 yisO0JrtMFmaxV4XMc+f5uItsfYuCqLXxAxv5XCtP+ymA7cfJWAOt7wyqCTBRj05
 aRzXGFwitcA7ZcEf4i3BoHzXdYtBMFa4aWhw+dwo8aLDApD/qDAf85a8fpKUr8LB
 +5RVmS6Vavo6vfbMpb9jS2JP7+mliKpZWYElmOgXOHOn5XKC286DUWWqd2N//tSX
 CsdmHap+5iz2JNrs/elV10/+ZKnVjHNLPptw0LnY7luskebRcfb4/uiVx3NQpBDo
 /gkvZChc0lmhp2Mwr8qRuG3VbxG+u+B/3e0b1eu0JqBfil521ZwSI0bHvU0cW3TB
 0avvniGOHtiuU6s5czIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y779hrdyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 May 2024 10:10:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 90C724004F;
 Tue, 21 May 2024 10:10:41 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E135A2122F7;
 Tue, 21 May 2024 10:10:14 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:14 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:14 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Tue, 21 May 2024 10:09:59 +0200
Message-ID: <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v5 5/7] remoteproc: core: support of the tee
	interface
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

1) on start:
- Using the TEE loader, the resource table is loaded by an external entity.
In such case the resource table address is not find from the firmware but
provided by the TEE remoteproc framework.
Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
- test that rproc->cached_table is not null before performing the memcpy

2)on stop
The use of the cached_table seems mandatory:
- during recovery sequence to have a snapshot of the resource table
  resources used,
- on stop to allow  for the deinitialization of resources after the
  the remote processor has been shutdown.
However if the TEE interface is being used, we first need to unmap the
table_ptr before setting it to rproc->cached_table.
The update of rproc->table_ptr to rproc->cached_table is performed in
tee_remoteproc.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 42bca01f3bde..3a642151c983 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
 static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
 {
 	struct resource_table *loaded_table;
+	struct device *dev = &rproc->dev;
 
 	/*
 	 * The starting device has been given the rproc->cached_table as the
@@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
 	 * this information to device memory. We also update the table_ptr so
 	 * that any subsequent changes will be applied to the loaded version.
 	 */
-	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
-	if (loaded_table) {
-		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
-		rproc->table_ptr = loaded_table;
+	if (rproc->tee_interface) {
+		loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
+		if (IS_ERR(loaded_table)) {
+			dev_err(dev, "can't get resource table\n");
+			return PTR_ERR(loaded_table);
+		}
+	} else {
+		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
 	}
 
+	if (loaded_table && rproc->cached_table)
+		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
+
+	rproc->table_ptr = loaded_table;
+
 	return 0;
 }
 
@@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
 	kfree(rproc->clean_table);
 
 out:
-	/*
-	 * Use a copy of the resource table for the remainder of the
-	 * shutdown process.
+	/* If the remoteproc_tee interface is used, then we have first to unmap the resource table
+	 * before updating the proc->table_ptr reference.
 	 */
-	rproc->table_ptr = rproc->cached_table;
+	if (!rproc->tee_interface) {
+		/*
+		 * Use a copy of the resource table for the remainder of the
+		 * shutdown process.
+		 */
+		rproc->table_ptr = rproc->cached_table;
+	}
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
