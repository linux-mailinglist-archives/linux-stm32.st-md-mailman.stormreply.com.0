Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D439965D7B
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 11:53:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D37CFC71289;
	Fri, 30 Aug 2024 09:53:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3932BC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 09:53:27 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U7T05s005594;
 Fri, 30 Aug 2024 11:53:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0DlUTkUaPavTozbvsNzJHph9lUJ8rhMJbIvd+RFIDXU=; b=XHyn1gCeEcu6GMeE
 Tnfw5YP8LI/TAMks9Mo0CCENu6SyrHuhfgzyLBxIV//EPQFgYmmPMtf9SCE/z28T
 UJ4eKObCmPrMhmIFs4O45WzbUScfx5AO/Jqd8t9KHdI8lfrin+z/m7Tr0eQRkt2W
 k23+rrEAWBYWetFRCnd8SwelykdqqLADbf/nLLI0dnnlGouk5tkoZCNPLqrSF32O
 860j75F1a+tyiqUis9YKDgMk7b887tFT09uTSnfuHwCXUFqIxqzJhi2r6D59dadr
 DDUmMeAXM4wUkE9gqBjc616inTaPM6/LkhrLIUrOsoB90PITu75Md5dxK/ZOclDQ
 iJhOUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41b14tabey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 11:53:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5902A4004B;
 Fri, 30 Aug 2024 11:53:06 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC31A256519;
 Fri, 30 Aug 2024 11:52:17 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 11:52:17 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 11:52:17 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Fri, 30 Aug 2024 11:51:43 +0200
Message-ID: <20240830095147.3538047-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_04,2024-08-30_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 3/7] remoteproc: core: Refactor resource
	table cleanup into rproc_release_fw
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

This patch centralizing the cleanup of the resource table into a new
helper function rproc_release_fw().

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ace11ea17097..7694817f25d4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1256,6 +1256,13 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 	return 0;
 }
 
+static void rproc_release_fw(struct rproc *rproc)
+{
+	/* Free the copy of the resource table */
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
+}
 
 /**
  * rproc_resource_cleanup() - clean up and free all acquired resources
@@ -1485,9 +1492,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 
 clean_up_resources:
 	rproc_resource_cleanup(rproc);
-	kfree(rproc->cached_table);
-	rproc->cached_table = NULL;
-	rproc->table_ptr = NULL;
+	rproc_release_fw(rproc);
 unprepare_rproc:
 	/* release HW resources if needed */
 	rproc_unprepare_device(rproc);
@@ -2067,10 +2072,7 @@ int rproc_shutdown(struct rproc *rproc)
 
 	rproc_disable_iommu(rproc);
 
-	/* Free the copy of the resource table */
-	kfree(rproc->cached_table);
-	rproc->cached_table = NULL;
-	rproc->table_ptr = NULL;
+	rproc_release_fw(rproc);
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
@@ -2133,10 +2135,7 @@ int rproc_detach(struct rproc *rproc)
 
 	rproc_disable_iommu(rproc);
 
-	/* Free the copy of the resource table */
-	kfree(rproc->cached_table);
-	rproc->cached_table = NULL;
-	rproc->table_ptr = NULL;
+	rproc_release_fw(rproc);
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
