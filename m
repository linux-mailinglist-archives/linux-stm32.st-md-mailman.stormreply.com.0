Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6BA6ED35
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 11:01:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1D74C78F6A;
	Tue, 25 Mar 2025 10:01:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B031C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 10:01:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P7cmeL001618;
 Tue, 25 Mar 2025 11:00:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 gzYR5cNQ0ecmLOA9GQWS3MuyWMyDZ9dNGuAlrYXRKm0=; b=oiobuiIMnOga2G2b
 yrt8BwGqvXQPfdoPzTkuvJrh+LvSbS1f813ED7BXHy0eBHqiIRdhc41QbSF/8XcK
 3QxK2IV07C8xljKfaSU1WDvsL1c4+eF19JcK0mM3bMuNM88MgUlJQNWN/hzF7tr0
 KI3hKgutR/OkLZ4nqLlsgs2zmhGP7xyxJRrnH02dYv+hOVjUTclJmOZcHUQKCELX
 FaRa4PHjcVfUexrNko0t1vXd0CqmXR/ISITJZslDPhpM2D8NPY8bmV2fEFwfjFIK
 LjJ6GZvjG5MBmH8nwK8r/mvyXyMDM5zsVBn/lkGYV6GXJbI/yL0Gsq6ihgNmZMbf
 QMNy/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45hk7d3yhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Mar 2025 11:00:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 44DB040047;
 Tue, 25 Mar 2025 10:59:56 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EE818265C6;
 Tue, 25 Mar 2025 10:58:47 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 10:58:47 +0100
Received: from localhost (10.252.12.99) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 10:58:47 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Tue, 25 Mar 2025 10:58:30 +0100
Message-ID: <20250325095833.3059895-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250325095833.3059895-1-arnaud.pouliquen@foss.st.com>
References: <20250325095833.3059895-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.12.99]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_04,2025-03-25_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v16 3/6] remoteproc: Introduce release_fw
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

The release_fw operation is the inverse operation of the load, responsible
for releasing the remote processor resources configured from the loading
of the remoteproc firmware (e.g., memories).

The operation is called in the following cases:
 - An error occurs on boot of the remote processor.
 - An error occurs on recovery start of the remote processor.
 - After stopping the remote processor.

This operation is needed for the remoteproc_tee implementation after stop
and on error.
Indeed, as the remoteproc image is loaded when we parse the resource
table, there are many situations where something can go wrong before
the start of the remote processor(resource handling, carveout allocation,
...).

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Updates vs previous version:
- remove the rproc:load_fw() ops introduced in previous version
- remove duplicate call of rproc_release_fw in rproc_fw_boot and rproc_boot
---
 drivers/remoteproc/remoteproc_core.c     | 6 ++++++
 drivers/remoteproc/remoteproc_internal.h | 6 ++++++
 include/linux/remoteproc.h               | 3 +++
 3 files changed, 15 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f05122b699b7..79317d148651 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1857,6 +1857,8 @@ static int rproc_boot_recovery(struct rproc *rproc)
 
 	/* boot the remote processor up again */
 	ret = rproc_start(rproc, firmware_p);
+	if (ret)
+		rproc_release_fw(rproc);
 
 	release_firmware(firmware_p);
 
@@ -1998,6 +2000,8 @@ int rproc_boot(struct rproc *rproc)
 		}
 
 		ret = rproc_fw_boot(rproc, firmware_p);
+		if (ret)
+			rproc_release_fw(rproc);
 
 		release_firmware(firmware_p);
 	}
@@ -2067,6 +2071,8 @@ int rproc_shutdown(struct rproc *rproc)
 
 	rproc_disable_iommu(rproc);
 
+	rproc_release_fw(rproc);
+
 	/* Free the copy of the resource table */
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0cd09e67ac14..c7fb908f8652 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -221,4 +221,10 @@ bool rproc_u64_fit_in_size_t(u64 val)
 	return (val <= (size_t) -1);
 }
 
+static inline void rproc_release_fw(struct rproc *rproc)
+{
+	if (rproc->ops->release_fw)
+		rproc->ops->release_fw(rproc);
+}
+
 #endif /* REMOTEPROC_INTERNAL_H */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 8fd0d7f63c8e..80128461972b 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -381,6 +381,8 @@ enum rsc_handling_status {
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
  * @coredump:	  collect firmware dump after the subsystem is shutdown
+ * @release_fw:	optional function to release the loaded firmware, called after
+ *              stopping the remote processor or in case of error
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
