Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E393660F0AB
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Oct 2022 08:55:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A89F5C64105;
	Thu, 27 Oct 2022 06:55:23 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B82FFC640F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 06:55:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VTAKhzB_1666853717; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0VTAKhzB_1666853717) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 14:55:18 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Jussi Kivilinna <jussi.kivilinna@iki.fi>, Ard Biesheuvel <ardb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 27 Oct 2022 14:54:57 +0800
Message-Id: <20221027065505.15306-6-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221027065505.15306-1-tianjia.zhang@linux.alibaba.com>
References: <20221027065505.15306-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: [Linux-stm32] [PATCH v3 05/13] crypto: tcrypt - add SM4
	cts-cbc/xts/xcbc test
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

Added CTS-CBC/XTS/XCBC tests for SM4 algorithms, as well as
corresponding speed tests, this is to test performance-optimized
implementations of these modes.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 crypto/tcrypt.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/crypto/tcrypt.c b/crypto/tcrypt.c
index a82679b576bb..464049ec8f35 100644
--- a/crypto/tcrypt.c
+++ b/crypto/tcrypt.c
@@ -1711,6 +1711,10 @@ static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
 		ret += tcrypt_test("gcm(aria)");
 		break;
 
+	case 59:
+		ret += tcrypt_test("cts(cbc(sm4))");
+		break;
+
 	case 100:
 		ret += tcrypt_test("hmac(md5)");
 		break;
@@ -1811,6 +1815,10 @@ static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
 		ret += tcrypt_test("cmac(sm4)");
 		break;
 
+	case 160:
+		ret += tcrypt_test("xcbc(sm4)");
+		break;
+
 	case 181:
 		ret += tcrypt_test("authenc(hmac(sha1),cbc(des))");
 		break;
@@ -1846,6 +1854,7 @@ static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
 		ret += tcrypt_test("cbc(sm4)");
 		ret += tcrypt_test("cfb(sm4)");
 		ret += tcrypt_test("ctr(sm4)");
+		ret += tcrypt_test("xts(sm4)");
 		break;
 	case 192:
 		ret += tcrypt_test("ecb(aria)");
@@ -2109,6 +2118,10 @@ static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
 				speed_template_16);
 		test_cipher_speed("cbc(sm4)", DECRYPT, sec, NULL, 0,
 				speed_template_16);
+		test_cipher_speed("cts(cbc(sm4))", ENCRYPT, sec, NULL, 0,
+				speed_template_16);
+		test_cipher_speed("cts(cbc(sm4))", DECRYPT, sec, NULL, 0,
+				speed_template_16);
 		test_cipher_speed("cfb(sm4)", ENCRYPT, sec, NULL, 0,
 				speed_template_16);
 		test_cipher_speed("cfb(sm4)", DECRYPT, sec, NULL, 0,
@@ -2117,6 +2130,10 @@ static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
 				speed_template_16);
 		test_cipher_speed("ctr(sm4)", DECRYPT, sec, NULL, 0,
 				speed_template_16);
+		test_cipher_speed("xts(sm4)", ENCRYPT, sec, NULL, 0,
+				speed_template_32);
+		test_cipher_speed("xts(sm4)", DECRYPT, sec, NULL, 0,
+				speed_template_32);
 		break;
 
 	case 219:
@@ -2630,6 +2647,10 @@ static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
 				speed_template_16);
 		test_acipher_speed("ctr(sm4)", DECRYPT, sec, NULL, 0,
 				speed_template_16);
+		test_acipher_speed("xts(sm4)", ENCRYPT, sec, NULL, 0,
+				speed_template_32);
+		test_acipher_speed("xts(sm4)", DECRYPT, sec, NULL, 0,
+				speed_template_32);
 		break;
 
 	case 519:
-- 
2.24.3 (Apple Git-128)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
