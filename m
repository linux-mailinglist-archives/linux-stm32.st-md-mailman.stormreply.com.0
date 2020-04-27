Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9291B9799
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 08:43:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 555BCC36B10;
	Mon, 27 Apr 2020 06:43:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A057FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 06:43:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R6cFpq024199; Mon, 27 Apr 2020 08:42:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tCfxJ7AYA01s98UE4V0m7JDke4Id5IZKext6NMmW5s4=;
 b=kIGb4VL+fyuhhQWMEYWLDDOnc4kVtN9LNk+6HKks+iQb5vaDh1XQhetQ0NkZZVRzzQiS
 HdkxMrvx+iFBO1Z93KBwZXFRf9cmlfNja7NaaMTlvuiUmMnBIiXwjuG5yGIAIhRw5WaU
 4ItH9on/vWyzuhF8eTD4nwTe3F3fkQbep9DEMKg9rp9MXjHwI5CBKTd52T2E2StxZGhV
 NsGM4SsVdQDyRK7xtMy4X2mRUK/xfv6zDvjyq409TidiDLoS1hxhloZMNmEO2yJGv12b
 jxK9oRDsfpxM0dRwqzrHv2jlJ743O9Y9gFkJ4F4q2bg9jDYrtQkjEFPTrrVIujmvcCWd lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjwg3gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 08:42:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47134100038;
 Mon, 27 Apr 2020 08:42:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag7node2.st.com [10.75.127.20])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34F5921F67A;
 Mon, 27 Apr 2020 08:42:56 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG7NODE2.st.com (10.75.127.20)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 27 Apr 2020 08:42:55 +0200
From: Lionel Debieve <lionel.debieve@st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, <linux-crypto@vger.kernel.org>
Date: Mon, 27 Apr 2020 08:42:24 +0200
Message-ID: <20200427064226.6991-2-lionel.debieve@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427064226.6991-1-lionel.debieve@st.com>
References: <20200427064226.6991-1-lionel.debieve@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG7NODE2.st.com
 (10.75.127.20)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_03:2020-04-24,
 2020-04-27 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] crypto: stm32/hash - defer probe for
	reset controller
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

From: Etienne Carriere <etienne.carriere@st.com>

Change stm32 HASH driver to defer its probe operation when
reset controller device is registered but has not been probed yet.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Reviewed-by: Lionel DEBIEVE <lionel.debieve@st.com>
---
 drivers/crypto/stm32/stm32-hash.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 167b80eec437..fad6190be088 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -1482,7 +1482,12 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	hdev->rst = devm_reset_control_get(&pdev->dev, NULL);
-	if (!IS_ERR(hdev->rst)) {
+	if (IS_ERR(hdev->rst)) {
+		if (PTR_ERR(hdev->rst) == -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
+			goto err_reset;
+		}
+	} else {
 		reset_control_assert(hdev->rst);
 		udelay(2);
 		reset_control_deassert(hdev->rst);
@@ -1535,7 +1540,7 @@ static int stm32_hash_probe(struct platform_device *pdev)
 
 	if (hdev->dma_lch)
 		dma_release_channel(hdev->dma_lch);
-
+err_reset:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
