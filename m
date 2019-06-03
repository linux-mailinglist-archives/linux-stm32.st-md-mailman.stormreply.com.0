Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA61633437
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 17:55:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68B0FCBA4D4
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 15:55:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F034CBA4D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 15:55:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53Frao7004235; Mon, 3 Jun 2019 17:55:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=oj2i9QotepYR2OEJaRA4rA4osloqDgU7KpWmr2xHAV4=;
 b=Z5RTgstEjTOu3kJzZDKFMDW0pptuG4kynxRZd4pfrSSzUfc5448kRLvPE9By7hDZtOII
 AVFchbmjzobh8nvqt9IUvPQahxuv0ayDJDl+IISHGEbIGM8Ggr8TLriFO9L+obMcUhWA
 apQnahQGLNggaqyqciQ5SjUkCXrjnGVqufkmHVpYOMwlrTozcf3uiy+s8srrwn7cYK+J
 ptm56t88CzYu6ViQzX5fReyuLsava8GrQ2hlKtzD1qgYFYqHM3voavDPr2pUfORMSDQS
 S/p9D6pkw9EvMm/aAD8LdiRo7swQcOfAjQgWPqBWuH1iI+padv5R34fNJNjoabGRdPtV 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sunmeb8pu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 03 Jun 2019 17:55:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A7D931;
 Mon,  3 Jun 2019 15:55:31 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69E414E66;
 Mon,  3 Jun 2019 15:55:31 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019
 17:55:31 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019
 17:55:30 +0200
From: Ludovic Barre <ludovic.Barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 3 Jun 2019 17:55:25 +0200
Message-ID: <1559577325-19266-4-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559577325-19266-1-git-send-email-ludovic.Barre@st.com>
References: <1559577325-19266-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_12:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V3 3/3] mmc: mmci: add busy detect for stm32
	sdmmc variant
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

From: Ludovic Barre <ludovic.barre@st.com>

This patch enables busy detection for stm32 sdmmc which requires
to set data timer to define the busy timeout.
sdmmc has 2 flags:
-busyd0: inverted value of d0 line.
-busyd0end which indicates only end of busy following a cmd response.
Only one interrupt on busyd0end.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci.c | 4 ++++
 drivers/mmc/host/mmci.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 5a8b232..6210f1f 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -264,6 +264,10 @@ static struct variant_data variant_stm32_sdmmc = {
 	.datalength_bits	= 25,
 	.datactrl_blocksz	= 14,
 	.stm32_idmabsize_mask	= GENMASK(12, 5),
+	.busy_detect		= true,
+	.busy_timeout		= true,
+	.busy_detect_flag	= MCI_STM32_BUSYD0,
+	.busy_detect_mask	= MCI_STM32_BUSYD0ENDMASK,
 	.init			= sdmmc_variant_init,
 };
 
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index b43a958..ac19de8 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -167,6 +167,7 @@
 #define MCI_ST_CARDBUSY		(1 << 24)
 /* Extended status bits for the STM32 variants */
 #define MCI_STM32_BUSYD0	BIT(20)
+#define MCI_STM32_BUSYD0END	BIT(21)
 
 #define MMCICLEAR		0x038
 #define MCI_CMDCRCFAILCLR	(1 << 0)
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
