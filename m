Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0436219B1E
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jul 2020 10:40:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E19EC36B38;
	Thu,  9 Jul 2020 08:40:32 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3AFDC36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2020 08:40:27 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01355;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=22; SR=0;
 TI=SMTPD_---0U2BJEwx_1594284023; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U2BJEwx_1594284023) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 09 Jul 2020 16:40:23 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, dhowells@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, jmorris@namei.org,
 serge@hallyn.com, nramas@linux.microsoft.com, tusharsu@linux.microsoft.com,
 zohar@linux.ibm.com, vt@altlinux.org, gilad@benyossef.com,
 pvanleeuwen@rambus.com, zhang.jia@linux.alibaba.com
Date: Thu,  9 Jul 2020 16:40:15 +0800
Message-Id: <20200709084015.21886-9-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709084015.21886-1-tianjia.zhang@linux.alibaba.com>
References: <20200709084015.21886-1-tianjia.zhang@linux.alibaba.com>
Cc: tianjia.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 8/8] integrity: Asymmetric digsig supports
	SM2-with-SM3 algorithm
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Asymmetric digsig supports SM2-with-SM3 algorithm combination,
so that IMA can also verify SM2's signature data.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 security/integrity/digsig_asymmetric.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/security/integrity/digsig_asymmetric.c b/security/integrity/digsig_asymmetric.c
index 4e0d6778277e..9350fcfb9bf2 100644
--- a/security/integrity/digsig_asymmetric.c
+++ b/security/integrity/digsig_asymmetric.c
@@ -99,14 +99,22 @@ int asymmetric_verify(struct key *keyring, const char *sig,
 	memset(&pks, 0, sizeof(pks));
 
 	pks.hash_algo = hash_algo_name[hdr->hash_algo];
-	if (hdr->hash_algo == HASH_ALGO_STREEBOG_256 ||
-	    hdr->hash_algo == HASH_ALGO_STREEBOG_512) {
+	switch (hdr->hash_algo) {
+	case HASH_ALGO_STREEBOG_256:
+	case HASH_ALGO_STREEBOG_512:
 		/* EC-RDSA and Streebog should go together. */
 		pks.pkey_algo = "ecrdsa";
 		pks.encoding = "raw";
-	} else {
+		break;
+	case HASH_ALGO_SM3_256:
+		/* SM2 and SM3 should go together. */
+		pks.pkey_algo = "sm2";
+		pks.encoding = "raw";
+		break;
+	default:
 		pks.pkey_algo = "rsa";
 		pks.encoding = "pkcs1";
+		break;
 	}
 	pks.digest = (u8 *)data;
 	pks.digest_size = datalen;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
