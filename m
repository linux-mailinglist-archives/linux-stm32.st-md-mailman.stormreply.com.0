Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A25E9DD4
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Sep 2022 11:36:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C73CC6334A;
	Mon, 26 Sep 2022 09:36:45 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CADA0C63328
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 09:36:43 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VQkJzFp_1664184999; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0VQkJzFp_1664184999) by smtp.aliyun-inc.com;
 Mon, 26 Sep 2022 17:36:40 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Jussi Kivilinna <jussi.kivilinna@iki.fi>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 26 Sep 2022 17:36:12 +0800
Message-Id: <20220926093620.99898-9-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20220926093620.99898-1-tianjia.zhang@linux.alibaba.com>
References: <20220926093620.99898-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH 08/16] crypto: arm64/sm4 - export reusable CE
	acceleration functions
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

In the accelerated implementation of the SM4 algorithm using the Crypto
Extension instructions, there are some functions that can be reused in
the upcoming accelerated implementation of the GCM/CCM mode, and the
CBC/CFB encryption is reused in the optimized implementation of SVESM4.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 arch/arm64/crypto/sm4-ce-glue.c |  5 +++++
 arch/arm64/crypto/sm4-ce.h      | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 arch/arm64/crypto/sm4-ce.h

diff --git a/arch/arm64/crypto/sm4-ce-glue.c b/arch/arm64/crypto/sm4-ce-glue.c
index ff2d8442d473..63abcadc684b 100644
--- a/arch/arm64/crypto/sm4-ce-glue.c
+++ b/arch/arm64/crypto/sm4-ce-glue.c
@@ -36,6 +36,11 @@ asmlinkage void sm4_ce_cfb_dec(const u32 *rkey, u8 *dst, const u8 *src,
 asmlinkage void sm4_ce_ctr_enc(const u32 *rkey, u8 *dst, const u8 *src,
 			       u8 *iv, unsigned int nblks);
 
+EXPORT_SYMBOL(sm4_ce_expand_key);
+EXPORT_SYMBOL(sm4_ce_crypt_block);
+EXPORT_SYMBOL(sm4_ce_cbc_enc);
+EXPORT_SYMBOL(sm4_ce_cfb_enc);
+
 static int sm4_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		      unsigned int key_len)
 {
diff --git a/arch/arm64/crypto/sm4-ce.h b/arch/arm64/crypto/sm4-ce.h
new file mode 100644
index 000000000000..109c21b37590
--- /dev/null
+++ b/arch/arm64/crypto/sm4-ce.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SM4 common functions for Crypto Extensions
+ * Copyright (C) 2022 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+ */
+
+void sm4_ce_expand_key(const u8 *key, u32 *rkey_enc, u32 *rkey_dec,
+		       const u32 *fk, const u32 *ck);
+
+void sm4_ce_crypt_block(const u32 *rkey, u8 *dst, const u8 *src);
+
+void sm4_ce_cbc_enc(const u32 *rkey_enc, u8 *dst, const u8 *src,
+		    u8 *iv, unsigned int nblocks);
+
+void sm4_ce_cfb_enc(const u32 *rkey_enc, u8 *dst, const u8 *src,
+		    u8 *iv, unsigned int nblocks);
-- 
2.24.3 (Apple Git-128)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
