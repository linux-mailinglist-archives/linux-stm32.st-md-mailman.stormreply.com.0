Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F33F7487
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Aug 2021 13:47:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 544AFC59780;
	Wed, 25 Aug 2021 11:47:57 +0000 (UTC)
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98057C57B60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Aug 2021 11:21:57 +0000 (UTC)
Received: from BC-Mail-Ex19.internal.baidu.com (unknown [172.31.51.13])
 by Forcepoint Email with ESMTPS id 69BB2EF880CE6D117B12;
 Wed, 25 Aug 2021 19:21:55 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex19.internal.baidu.com (172.31.51.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 25 Aug 2021 19:21:55 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 25 Aug 2021 19:21:54 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <nicolas.toromanoff@st.com>
Date: Wed, 25 Aug 2021 19:21:46 +0800
Message-ID: <20210825112147.2669-2-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210825112147.2669-1-caihuoqing@baidu.com>
References: <20210825112147.2669-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex14.internal.baidu.com (10.127.64.37) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Mailman-Approved-At: Wed, 25 Aug 2021 11:47:54 +0000
Cc: Cai Huoqing <caihuoqing@baidu.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/2] crypto: stm32 - Add support of
	COMPILE_TEST
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

it's helpful for complie test in other platform(e.g.X86)

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/crypto/stm32/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/stm32/Kconfig b/drivers/crypto/stm32/Kconfig
index 4a4c3284ae1f..0fa30260300f 100644
--- a/drivers/crypto/stm32/Kconfig
+++ b/drivers/crypto/stm32/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config CRYPTO_DEV_STM32_CRC
 	tristate "Support for STM32 crc accelerators"
-	depends on ARCH_STM32
+	depends on ARCH_STM32 || (COMPILE_TEST && OF)
 	select CRYPTO_HASH
 	select CRC32
 	help
@@ -10,7 +10,7 @@ config CRYPTO_DEV_STM32_CRC
 
 config CRYPTO_DEV_STM32_HASH
 	tristate "Support for STM32 hash accelerators"
-	depends on ARCH_STM32
+	depends on ARCH_STM32 || (COMPILE_TEST && OF)
 	depends on HAS_DMA
 	select CRYPTO_HASH
 	select CRYPTO_MD5
@@ -23,7 +23,7 @@ config CRYPTO_DEV_STM32_HASH
 
 config CRYPTO_DEV_STM32_CRYP
 	tristate "Support for STM32 cryp accelerators"
-	depends on ARCH_STM32
+	depends on ARCH_STM32 || (COMPILE_TEST && OF)
 	select CRYPTO_HASH
 	select CRYPTO_ENGINE
 	select CRYPTO_LIB_DES
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
