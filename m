Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBF774969D
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 09:39:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A34DC6B45D;
	Thu,  6 Jul 2023 07:39:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B15E2C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 07:39:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3667F86T024912; Thu, 6 Jul 2023 09:39:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=7jQuFbyhi9oBByrkOGyTO9QAiVDuFMurbnmrQMP9Gy4=;
 b=3mB7b7PYi4JcASinOkZCl2umwtmmCLJD5RhzT2iAGZe1bqaOtXzu0z2EpI+vAce1WkWW
 aioJvNii2ZcjOoAeaMvvxt4Jt3VNuRxPMUd38xWMdhu2xdKpM4kiCSNwzl5XdCUtGPLC
 WTG65NtdSC8XUKfsMkuPcF9UIrDT59ztB+7KCnd5lCFx56xjbEaRR2CbD4gWoRl+kF6N
 GzxME4+BLAcva/jSimQ5GYD26nLdyotfghgCGJkn771Jarw1ZPRRkiouUpMYxX7aAwQJ
 vdxgUqUjvkbkNzh2SA0AAO6DgnzQI0g6fpMDlqdeEQTFGoaO1opl2ZjvpIwURIR/7oHw BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rnkt8jeg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 09:39:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 903B0100052;
 Thu,  6 Jul 2023 09:39:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 877B9212FA9;
 Thu,  6 Jul 2023 09:39:24 +0200 (CEST)
Received: from localhost (10.201.22.9) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 6 Jul
 2023 09:39:24 +0200
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Jul 2023 09:37:17 +0200
Message-ID: <20230706073719.1156288-6-thomas.bourgoin@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706073719.1156288-1-thomas.bourgoin@foss.st.com>
References: <20230706073719.1156288-1-thomas.bourgoin@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.9]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_04,2023-07-06_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 5/7] crypto: stm32 - check request size and
	scatterlist size when using DMA.
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

From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>

When we are sending the data to HASH with the DMA, we send all the data
provided in the scatterlists of the request.
But in some cases (ex : tcrypt performances tests), we should only send
req->nbytes
When iterating through the scatterlist we verify if it is the last
scatterlist or if the number of bytes sent plus the data of the current
scatterlist is superior of the total number of bytes to hash.

Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
---
 drivers/crypto/stm32/stm32-hash.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index bc2651ef5208..ee68e38b6e28 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -659,8 +659,9 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev->req);
 	u32 *buffer = (void *)rctx->state.buffer;
 	struct scatterlist sg[1], *tsg;
-	int err = 0, len = 0, reg, ncp = 0;
-	unsigned int i;
+	int err = 0, reg, ncp = 0;
+	unsigned int i, len = 0, bufcnt = 0;
+	bool is_last = false;
 
 	rctx->sg = hdev->req->src;
 	rctx->total = hdev->req->nbytes;
@@ -681,7 +682,9 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 		sg[0] = *tsg;
 		len = sg->length;
 
-		if (sg_is_last(sg)) {
+		if (sg_is_last(sg) || (bufcnt + sg[0].length) >= rctx->total) {
+			sg->length = rctx->total - bufcnt;
+			is_last = true;
 			if (hdev->dma_mode == 1) {
 				len = (ALIGN(sg->length, 16) - 16);
 
@@ -707,13 +710,15 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 			return -ENOMEM;
 		}
 
-		err = stm32_hash_xmit_dma(hdev, sg, len,
-					  !sg_is_last(sg));
+		err = stm32_hash_xmit_dma(hdev, sg, len, !is_last);
 
+		bufcnt += sg[0].length;
 		dma_unmap_sg(hdev->dev, sg, 1, DMA_TO_DEVICE);
 
 		if (err == -ENOMEM)
 			return err;
+		if (is_last)
+			break;
 	}
 
 	if (hdev->dma_mode == 1) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
