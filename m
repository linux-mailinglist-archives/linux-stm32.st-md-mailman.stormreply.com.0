Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC859932
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 13:27:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69AADC35E03;
	Fri, 28 Jun 2019 11:27:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6462EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 11:27:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SBQSq5008465; Fri, 28 Jun 2019 13:26:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3acCB+/2oJupGcCDZjqJgsqu3sTcxGcFU4Yg5GquxDg=;
 b=O85tGj8z/N9wFxbYQZC0SC8zZsT3lwtB6gFnR0p7TfWfPffAfE+Cdg+Os67QQLFVltNO
 sXVA1yIfOtsHyR11wl+LJQcynvK+Anru79KHuQVBmZm8QUXzC0UMMBouKBcQxTWjb4N2
 pWqRZOFzjnwcNy6cpTeJ2RadVJFBdZ4ZKq3HKgeymQPVFR2sOj5yE3xiBZJDy9rOZknN
 l9NySoh4VwnTwCM7OkEdckylicnr950xl6GzCdiz+z38JTwPeyWRqOhfULxJVahTF3qh
 LWFX989O9YvPTZcU5ADD6qSb864LirR5dqECKjWT0Dr/aVHKZeMnCc2q7KjG9GUu+Wv1 /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2gwgkw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Jun 2019 13:26:44 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83F3331;
 Fri, 28 Jun 2019 11:26:43 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2389527A5;
 Fri, 28 Jun 2019 11:26:43 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 28 Jun
 2019 13:26:43 +0200
Received: from localhost (10.201.23.65) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 28 Jun 2019 13:26:42
 +0200
From: Lionel Debieve <lionel.debieve@st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@st.com>,
 <linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 28 Jun 2019 13:26:41 +0200
Message-ID: <20190628112641.9269-1-lionel.debieve@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.65]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_04:, , signatures=0
Cc: Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/1] crypto: stm32/crc32 - rename driver file
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

Use the same naming convention for all stm32 crypto
drivers.

Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
---
 drivers/crypto/stm32/Makefile                         | 2 +-
 drivers/crypto/stm32/{stm32_crc32.c => stm32-crc32.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/crypto/stm32/{stm32_crc32.c => stm32-crc32.c} (100%)

diff --git a/drivers/crypto/stm32/Makefile b/drivers/crypto/stm32/Makefile
index ce77e38c77e0..518e0e0b11a9 100644
--- a/drivers/crypto/stm32/Makefile
+++ b/drivers/crypto/stm32/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_CRYPTO_DEV_STM32_CRC) += stm32_crc32.o
+obj-$(CONFIG_CRYPTO_DEV_STM32_CRC) += stm32-crc32.o
 obj-$(CONFIG_CRYPTO_DEV_STM32_HASH) += stm32-hash.o
 obj-$(CONFIG_CRYPTO_DEV_STM32_CRYP) += stm32-cryp.o
diff --git a/drivers/crypto/stm32/stm32_crc32.c b/drivers/crypto/stm32/stm32-crc32.c
similarity index 100%
rename from drivers/crypto/stm32/stm32_crc32.c
rename to drivers/crypto/stm32/stm32-crc32.c
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
