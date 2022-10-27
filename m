Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310F60F0A7
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Oct 2022 08:55:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1C58C04003;
	Thu, 27 Oct 2022 06:55:16 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 531D1C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 06:55:14 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VTAEOSO_1666853709; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0VTAEOSO_1666853709) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 14:55:11 +0800
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
Date: Thu, 27 Oct 2022 14:54:53 +0800
Message-Id: <20221027065505.15306-2-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221027065505.15306-1-tianjia.zhang@linux.alibaba.com>
References: <20221027065505.15306-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: [Linux-stm32] [PATCH v3 01/13] crypto: arm64/sm3 - raise the
	priority of the CE implementation
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

Raise the priority of the sm3-ce algorithm from 200 to 400, this is
to make room for the implementation of sm3-neon.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 arch/arm64/crypto/sm3-ce-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/crypto/sm3-ce-glue.c b/arch/arm64/crypto/sm3-ce-glue.c
index ee98954ae8ca..54bf6ebcfffb 100644
--- a/arch/arm64/crypto/sm3-ce-glue.c
+++ b/arch/arm64/crypto/sm3-ce-glue.c
@@ -84,7 +84,7 @@ static struct shash_alg sm3_alg = {
 	.base.cra_driver_name	= "sm3-ce",
 	.base.cra_blocksize	= SM3_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
-	.base.cra_priority	= 200,
+	.base.cra_priority	= 400,
 };
 
 static int __init sm3_ce_mod_init(void)
-- 
2.24.3 (Apple Git-128)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
