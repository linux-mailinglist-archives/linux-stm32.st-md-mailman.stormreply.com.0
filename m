Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0E026BD3B
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Sep 2020 08:34:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BCDCC3FADF;
	Wed, 16 Sep 2020 06:34:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 816AFC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 06:34:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08G6RUsd004867; Wed, 16 Sep 2020 08:33:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=HxkrC3S6cMK+LXNjlN3kJlmPK+4qpTmLNr0JbnzCSBU=;
 b=bg7mu+oo8kgfBOeXm2rqvGuQ4DVXDiaLLt9lWTjhaFsSHY/XH2niyRQXUh049LMQgDwv
 VukskLSsMq5a6u2Kv5w3CYl5LzRqTkH96kICTMbtJMpySW9ckjTvYiUV+YahxHJW1WxX
 WzjqlZ6GRctgXWJSLHM8u1GmoYvlBdaUFq1jVXyaxMhYuedNjwHIVJS3gjfPNQa7dEdU
 VfnSxmQsGVAfM1i9BYvMvtxjcsnS9pPwJ97ObdumL6a7qi8hCQoew3bfUvrhJl4HlLXG
 InuKtOxDpctniXu2xz2ASw4mNoNZUdIdZSzP509rqm/D8B3vHw/L4tT0Lt1i4dXeb6VK QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33k6919s4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 08:33:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01A68100034;
 Wed, 16 Sep 2020 08:33:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AAF8120759A;
 Wed, 16 Sep 2020 08:33:48 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 16 Sep 2020 08:33:47 +0200
From: Nicolas Toromanoff <nicolas.toromanoff@st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Wed, 16 Sep 2020 08:33:44 +0200
Message-ID: <20200916063344.15054-1-nicolas.toromanoff@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_02:2020-09-15,
 2020-09-16 signatures=0
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] crypto: stm32/crc32 - Avoid lock if
	hardware is already used
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

If STM32 CRC device is already in use, calculate CRC by software.

This will release CPU constraint for a concurrent access to the
hardware, and avoid masking irqs during the whole block processing.

Fixes: 7795c0baf5ac ("crypto: stm32/crc32 - protect from concurrent accesses")

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@st.com>
---
v2: select CRC32 and not (CRYPTO_CRC32 and CRYPTO_CRC32C) in Kconfig
---
 drivers/crypto/stm32/Kconfig       |  1 +
 drivers/crypto/stm32/stm32-crc32.c | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/stm32/Kconfig b/drivers/crypto/stm32/Kconfig
index 4ef3eb11361c..4a4c3284ae1f 100644
--- a/drivers/crypto/stm32/Kconfig
+++ b/drivers/crypto/stm32/Kconfig
@@ -3,6 +3,7 @@ config CRYPTO_DEV_STM32_CRC
 	tristate "Support for STM32 crc accelerators"
 	depends on ARCH_STM32
 	select CRYPTO_HASH
+	select CRC32
 	help
 	  This enables support for the CRC32 hw accelerator which can be found
 	  on STMicroelectronics STM32 SOC.
diff --git a/drivers/crypto/stm32/stm32-crc32.c b/drivers/crypto/stm32/stm32-crc32.c
index 783a64f3f635..75867c0b0017 100644
--- a/drivers/crypto/stm32/stm32-crc32.c
+++ b/drivers/crypto/stm32/stm32-crc32.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitrev.h>
 #include <linux/clk.h>
+#include <linux/crc32.h>
 #include <linux/crc32poly.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -149,7 +150,6 @@ static int burst_update(struct shash_desc *desc, const u8 *d8,
 	struct stm32_crc_desc_ctx *ctx = shash_desc_ctx(desc);
 	struct stm32_crc_ctx *mctx = crypto_shash_ctx(desc->tfm);
 	struct stm32_crc *crc;
-	unsigned long flags;
 
 	crc = stm32_crc_get_next_crc();
 	if (!crc)
@@ -157,7 +157,15 @@ static int burst_update(struct shash_desc *desc, const u8 *d8,
 
 	pm_runtime_get_sync(crc->dev);
 
-	spin_lock_irqsave(&crc->lock, flags);
+	if (!spin_trylock(&crc->lock)) {
+		/* Hardware is busy, calculate crc32 by software */
+		if (mctx->poly == CRC32_POLY_LE)
+			ctx->partial = crc32_le(ctx->partial, d8, length);
+		else
+			ctx->partial = __crc32c_le(ctx->partial, d8, length);
+
+		goto pm_out;
+	}
 
 	/*
 	 * Restore previously calculated CRC for this context as init value
@@ -197,8 +205,9 @@ static int burst_update(struct shash_desc *desc, const u8 *d8,
 	/* Store partial result */
 	ctx->partial = readl_relaxed(crc->regs + CRC_DR);
 
-	spin_unlock_irqrestore(&crc->lock, flags);
+	spin_unlock(&crc->lock);
 
+pm_out:
 	pm_runtime_mark_last_busy(crc->dev);
 	pm_runtime_put_autosuspend(crc->dev);
 
-- 
2.18.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
