Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E79BB658
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 14:38:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13F7CC6DD94;
	Mon,  4 Nov 2024 13:38:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31B84C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2024 13:38:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BWHLq005420;
 Mon, 4 Nov 2024 14:37:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DpNxfYQ9w9uj3zA5tkqI7DDD0FoNZ9ESpUJcJBY8miU=; b=o2IYA7xS0zHP9mw0
 5/Lc5vFxCJpUseeAFgVBtJkhcBX0ioeYyWJz/4wrpxeFmCxQa+8HmO7Mp256WoRj
 tl2ZoklMlKhVSlyCxDG2VIQO7rFmBrmWk7JTDeQOCdqJYt4+/8kI5fdH4Ft2H9xC
 z0LMp4g5iUOcaZUG9/Pb2qTPPQ0u/SOYA2hFOk7NtOkWtmZQ5aJ9sbx5984ghkeI
 OZyncnoj6EPD+C/xvXfxKCBG9evXI3FeCPd8NzhlcMwziVwXUKVFhzI7tnwU8Xs1
 djdePEwnEbWk9A6HQt3i8zQDDDf1UW2WLqJGD6S3t/eEyBwj1XejMpjYUNfXQ7Yi
 4byAiw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nd0578u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Nov 2024 14:37:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B3E0840048;
 Mon,  4 Nov 2024 14:36:55 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D30BD28C10B;
 Mon,  4 Nov 2024 14:35:56 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 4 Nov
 2024 14:35:56 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 4 Nov
 2024 14:35:56 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Mon, 4 Nov 2024 14:35:12 +0100
Message-ID: <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v13 4/7] remoteproc: Introduce release_fw
	optional operation
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

This patch updates the rproc_ops struct to include an optional
release_fw function.

The release_fw ops is responsible for releasing the remote processor
firmware image. The ops is called in the following cases:

 - An error occurs in rproc_start() between the loading of the segments and
      the start of the remote processor.
 - after stopping the remote processor.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Updates from version V11:
- fix typo in @release_fw comment
---
 drivers/remoteproc/remoteproc_core.c | 5 +++++
 include/linux/remoteproc.h           | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7694817f25d4..46863e1ca307 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 
 static void rproc_release_fw(struct rproc *rproc)
 {
+	if (rproc->ops->release_fw)
+		rproc->ops->release_fw(rproc);
+
 	/* Free the copy of the resource table */
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
@@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
 reset_table_ptr:
+	if (rproc->ops->release_fw)
+		rproc->ops->release_fw(rproc);
 	rproc->table_ptr = rproc->cached_table;
 
 	return ret;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 2e0ddcb2d792..08e0187a84d9 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -381,6 +381,8 @@ enum rsc_handling_status {
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
  * @coredump:	  collect firmware dump after the subsystem is shutdown
+ * @release_fw:	optional function to release the firmware image from ROM memories.
+ *		This function is called after stopping the remote processor or in case of an error
  */
 struct rproc_ops {
 	int (*prepare)(struct rproc *rproc);
@@ -403,6 +405,7 @@ struct rproc_ops {
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
 	void (*coredump)(struct rproc *rproc);
+	void (*release_fw)(struct rproc *rproc);
 };
 
 /**
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
