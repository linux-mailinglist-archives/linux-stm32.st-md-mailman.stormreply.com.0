Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6F6752734
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 17:34:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EBECC6B452;
	Thu, 13 Jul 2023 15:34:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3435C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 15:34:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36DDXpKr024913; Thu, 13 Jul 2023 17:33:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=mQ77rmUyH9rg1PoSz6HuZMMbsLdDRRJxDPlGFsUrsBs=;
 b=RrESI/ZBXi+XCAZdgVfX6p4+n5b4liGBY64NvlomXDtO1m55NSnfmL2I2U6E+T0kELFO
 OPKDS5Lxr0nKkQoyeqQut2QSaavk8Ll7dzmvUaOSYZuaMg5XNP9UBYcimQPLfCqeNk5i
 5zrjLXuKfxMpeUP+a4DvONS1L+jd44qudVyI1eLR1oVt8j8p16zNRIfNBYHfFcJKwmxB
 dWyJdONIj2JJCt6+5kN3BCpiUPHFjru2od3vrGAglMGtc0dwtwIsRl+WEUlodVbIbcoj
 uCs6rVdn+qsenE0jTih5nHocX0mK+3hxC/tBdqKsCyJFY5cEEU5AiepMgSRbCCiAYnm0 /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rtejyth2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 17:33:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80DE4100056;
 Thu, 13 Jul 2023 17:33:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78C7522A6FF;
 Thu, 13 Jul 2023 17:33:58 +0200 (CEST)
Received: from localhost (10.201.22.9) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 13 Jul
 2023 17:34:00 +0200
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jul 2023 17:15:18 +0200
Message-ID: <20230713151518.1513949-8-thomas.bourgoin@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
References: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.9]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_06,2023-07-13_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/7] crypto: stm32 - remove flag
	HASH_FLAGS_DMA_READY
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

Remove flag HASH_FLAGS_DMA_READY as it can put the driver in a deadlock
state.
If the DMA automatically set the DCAL bit, the interrupt indicating the
end of a computation can be raised before the DMA complete sequence.

Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
---
 drivers/crypto/stm32/stm32-hash.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index a48e6a14da2e..88a186c3dd78 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -84,12 +84,11 @@
 #define HASH_FLAGS_INIT			BIT(0)
 #define HASH_FLAGS_OUTPUT_READY		BIT(1)
 #define HASH_FLAGS_CPU			BIT(2)
-#define HASH_FLAGS_DMA_READY		BIT(3)
-#define HASH_FLAGS_DMA_ACTIVE		BIT(4)
-#define HASH_FLAGS_HMAC_INIT		BIT(5)
-#define HASH_FLAGS_HMAC_FINAL		BIT(6)
-#define HASH_FLAGS_HMAC_KEY		BIT(7)
-#define HASH_FLAGS_SHA3_MODE		BIT(8)
+#define HASH_FLAGS_DMA_ACTIVE		BIT(3)
+#define HASH_FLAGS_HMAC_INIT		BIT(4)
+#define HASH_FLAGS_HMAC_FINAL		BIT(5)
+#define HASH_FLAGS_HMAC_KEY		BIT(6)
+#define HASH_FLAGS_SHA3_MODE		BIT(7)
 #define HASH_FLAGS_FINAL		BIT(15)
 #define HASH_FLAGS_FINUP		BIT(16)
 #define HASH_FLAGS_ALGO_MASK		GENMASK(20, 17)
@@ -585,8 +584,6 @@ static void stm32_hash_dma_callback(void *param)
 	struct stm32_hash_dev *hdev = param;
 
 	complete(&hdev->dma_completion);
-
-	hdev->flags |= HASH_FLAGS_DMA_READY;
 }
 
 static int stm32_hash_hmac_dma_send(struct stm32_hash_dev *hdev)
@@ -1241,11 +1238,9 @@ static irqreturn_t stm32_hash_irq_thread(int irq, void *dev_id)
 			hdev->flags &= ~HASH_FLAGS_OUTPUT_READY;
 			goto finish;
 		}
-	} else if (HASH_FLAGS_DMA_READY & hdev->flags) {
-		if (HASH_FLAGS_DMA_ACTIVE & hdev->flags) {
-			hdev->flags &= ~HASH_FLAGS_DMA_ACTIVE;
-				goto finish;
-		}
+	} else if (HASH_FLAGS_DMA_ACTIVE & hdev->flags) {
+		hdev->flags &= ~HASH_FLAGS_DMA_ACTIVE;
+			goto finish;
 	}
 
 	return IRQ_HANDLED;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
