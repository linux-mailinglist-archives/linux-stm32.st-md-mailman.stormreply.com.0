Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2A75267F
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 17:16:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B3C9C6B457;
	Thu, 13 Jul 2023 15:16:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED8E9C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 15:16:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36DDW6wG024917; Thu, 13 Jul 2023 17:16:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=EBYL+++8Y7QXiKb+alEJuFsEPa+FX5GJFw0gOxYXtAc=;
 b=YntLMC7FvzRyVO0A3ot3sFHT6TPlaq5bi2D2HrD+6k23NFxoSvaR4EladsdvFA/I6KUR
 eGk54JP00iktO2asypRGpMyoUSkMZPUv3FtvCqOP8PaYL5GFhVbrrgn3Rlnni0TWQrRs
 IzOhUdCAfyyVUkRdptPt/BvB+ETWoWc9EwQ01TipzlqhuLqmTO9C9rUGewA3EMX6yFsH
 799ok1UBUV3mG9l+uoxrMBZlV3034FHcYX/IO8qzDtjCnMLSTtsVdczF232b1R1CfZYN
 ePCUm2SS9dQozFU25FBQW9IEod2OGbqPtS1ZPQf80KqAGQgdYL6tFdUCED57cP3zyldB sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rtejytdef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 17:16:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A95F100056;
 Thu, 13 Jul 2023 17:16:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62F8522A6D9;
 Thu, 13 Jul 2023 17:16:28 +0200 (CEST)
Received: from localhost (10.201.22.9) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 13 Jul
 2023 17:16:30 +0200
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jul 2023 17:15:14 +0200
Message-ID: <20230713151518.1513949-4-thomas.bourgoin@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
References: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.9]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_05,2023-07-13_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/7] crypto: stm32 - remove bufcnt in
	stm32_hash_write_ctrl.
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

Commit "crypto: stm32 - Fix empty message processing" remove the use of
the argument bufcnt in stm32_hash_write_ctrl.
Hence, we can remove it from the function prototype and simplify the
function declaration.

Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
---
 drivers/crypto/stm32/stm32-hash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 30e42a402aa7..c179a6c1a457 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -286,7 +286,7 @@ static int stm32_hash_write_key(struct stm32_hash_dev *hdev)
 	return 0;
 }
 
-static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev, int bufcnt)
+static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev->req);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(hdev->req);
@@ -395,7 +395,7 @@ static int stm32_hash_xmit_cpu(struct stm32_hash_dev *hdev,
 
 	hdev->flags |= HASH_FLAGS_CPU;
 
-	stm32_hash_write_ctrl(hdev, length);
+	stm32_hash_write_ctrl(hdev);
 
 	if (stm32_hash_wait_busy(hdev))
 		return -ETIMEDOUT;
@@ -669,7 +669,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 	if (rctx->nents < 0)
 		return -EINVAL;
 
-	stm32_hash_write_ctrl(hdev, rctx->total);
+	stm32_hash_write_ctrl(hdev);
 
 	if (hdev->flags & HASH_FLAGS_HMAC) {
 		err = stm32_hash_hmac_dma_send(hdev);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
