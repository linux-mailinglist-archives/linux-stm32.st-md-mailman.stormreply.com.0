Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EF99961B4
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2024 10:03:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D924BC7802E;
	Wed,  9 Oct 2024 08:03:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C29CC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 08:03:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994SC5N004331;
 Wed, 9 Oct 2024 10:03:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 y79txdEzzDmqftwd9hTeqbAyi+c6QQoV0XV6rE4nuds=; b=ts9XTxB2g/v3BgVo
 ysdWtb+x7d1wDbzAIahwnSNqLJPGZdGgHAdelzd+Footb4oOXbHu95XVmRtfRZ23
 RJgDcVGm/7240d5a7R75c2uXVvukvRjT9hx7AmZboU4YOU76XL8+qzquSbzXCmDe
 evCsE/nhfRbC170CWINz+YMTbmHO2do0wfDKhGoCseQDIEAD6j0OqY1pnL0T8qz0
 c4ent0f8VgXxUt5DM75psKpLFQGy3cs0HtPeNNP5RHfDrn7e4fe3f2c3HhnKYBE3
 rDA3ftd3w/2R8jrpVuljiN3doAhrJi0smPCcfvUz0BxxbheTZdSqHu8b55Y40K9c
 Jgn66Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv7ahqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2024 10:03:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CBA8440052;
 Wed,  9 Oct 2024 10:02:15 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 231B4219BB4;
 Wed,  9 Oct 2024 10:01:26 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 9 Oct
 2024 10:01:25 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 9 Oct
 2024 10:01:25 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Wed, 9 Oct 2024 10:01:04 +0200
Message-ID: <20241009080108.4170320-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009080108.4170320-1-arnaud.pouliquen@foss.st.com>
References: <20241009080108.4170320-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v11 3/7] remoteproc: core: Refactor resource
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

More than just factorizing the code into a common function, it is the
first step to integrate the release of the firmware image loaded by the
OP-TEE remoteproc framework.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update vs v9 revision:
- add justification of the patch in the commit message
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
