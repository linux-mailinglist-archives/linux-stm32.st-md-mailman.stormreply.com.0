Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EA6798AE2
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Sep 2023 18:52:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BEE1C6B475;
	Fri,  8 Sep 2023 16:52:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78A74C6B468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Sep 2023 16:52:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3889vkt6012516; Fri, 8 Sep 2023 18:51:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=G8EhQbj3Y2d5kGyFRRSXdWRplKfMjsPAQezvHj9+23E=; b=A+
 S/kUfQhw7cABLC1xHEf5IEhygHtSX5iSJqE5FXbFNyI3YQUMU6DWoaz8RAfoYefr
 MT53ggnWzn0Thb+4GKrigz/Ddf0fOSGI78lOemyKEoBaGrE70Z6gALmEXkZy8g33
 Bbvk0L8bGd86RSfsViTlqnklHGEzr7w863g9J8Jndxx16N041coEXNJkDr4KQG2P
 gX5Ppce0WWaxcusilJFERnA/VDGEewUTe/CdIKEDqVDzXDv0/3smaaVZU/51cV79
 LCPW7uNuJ5I08Bq5YwYEg+pcNMRayzR2PkycZLoozoUpFOAY2ZxtS87/SCHUesGl
 qv9eYUJiEAFLO48Uulbw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3suuxcnd7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 18:51:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F0C610005B;
 Fri,  8 Sep 2023 18:51:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0129E209EEE;
 Fri,  8 Sep 2023 18:51:30 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 8 Sep
 2023 18:51:29 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 8 Sep 2023 18:51:12 +0200
Message-ID: <20230908165120.730867-3-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
References: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_12,2023-09-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 02/10] hwrng: stm32 - use
	devm_platform_get_and_ioremap_resource() API
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

Use devm_platform_get_and_ioremap_resource() to get and ioremap a
resource.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/char/hw_random/stm32-rng.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index efb6a9f9a11b..d64d25d0fee8 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -118,18 +118,13 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = ofdev->dev.of_node;
 	struct stm32_rng_private *priv;
-	struct resource res;
-	int err;
+	struct resource *res;
 
 	priv = devm_kzalloc(dev, sizeof(struct stm32_rng_private), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	err = of_address_to_resource(np, 0, &res);
-	if (err)
-		return err;
-
-	priv->base = devm_ioremap_resource(dev, &res);
+	priv->base = devm_platform_get_and_ioremap_resource(ofdev, 0, &res);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
