Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC714433B8
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Nov 2021 17:48:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 512E3C5E2C6;
	Tue,  2 Nov 2021 16:48:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F94C5E2C9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 16:48:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2G39t4025654;
 Tue, 2 Nov 2021 17:48:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=AvLW6/k4bd6TATcPdoATdn/HWLAD3uHiP4K+O5Y0WxE=;
 b=gVE8kwwH+qCGHyygD5m0fvKDB9ch9+54Gm8BoHRgP0CP1c0+onrsXtwbnH2rBsB/CF0+
 prX/gmlt9aKs/SxbRuwo7i14Ws62Gm5WLheSx1a98oLoRf66j3Us/tcHndN65KHjsZl/
 UENSy+AAD/VZYomjYXQyK7aIX26hHuTwIM32ZxrN+xi6hHmIjfi7UyJQYjHv36UP6ns3
 4Qvd0lF7LevIaGOdf+X8C0sZ7jcxfATc9+wVtyfOsDxpVJUjtu1QGufcKRchYQAE1V5I
 8tTE5lJ+ewCDyh2Yvx7XLU5Z/fc5iuhz1r/3D8hP5dGGNRY0rbQi1syZmcFWlYn9JDX+ qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c30vnbqhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 17:48:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2DB6E10002A;
 Tue,  2 Nov 2021 17:48:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2601623B83F;
 Tue,  2 Nov 2021 17:48:36 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov 2021 17:48:35
 +0100
From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 2 Nov 2021 17:47:26 +0100
Message-ID: <20211102164729.9957-6-nicolas.toromanoff@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211102164729.9957-1-nicolas.toromanoff@foss.st.com>
References: <20211102164729.9957-1-nicolas.toromanoff@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/8] crypto: stm32/cryp - check early input
	data
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

Some auto tests failed because driver wasn't returning the expected
error with some input size/iv value/tag size.
Now:
 Return 0 early for empty buffer. (We don't need to start the engine for
 an empty input buffer).
 Accept any valid authsize for gcm(aes).
 Return -EINVAL if iv for ccm(aes) is invalid.
 Return -EINVAL if buffer size is a not a multiple of algorithm block size.

Fixes: 9e054ec21ef8 ("crypto: stm32 - Support for STM32 CRYP crypto module")

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 114 +++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index c0903025a4cc..8cea7d3abf87 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -801,7 +801,20 @@ static int stm32_cryp_aes_aead_setkey(struct crypto_aead *tfm, const u8 *key,
 static int stm32_cryp_aes_gcm_setauthsize(struct crypto_aead *tfm,
 					  unsigned int authsize)
 {
-	return authsize == AES_BLOCK_SIZE ? 0 : -EINVAL;
+	switch (authsize) {
+	case 4:
+	case 8:
+	case 12:
+	case 13:
+	case 14:
+	case 15:
+	case 16:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int stm32_cryp_aes_ccm_setauthsize(struct crypto_aead *tfm,
@@ -825,31 +838,61 @@ static int stm32_cryp_aes_ccm_setauthsize(struct crypto_aead *tfm,
 
 static int stm32_cryp_aes_ecb_encrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % AES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_AES | FLG_ECB | FLG_ENCRYPT);
 }
 
 static int stm32_cryp_aes_ecb_decrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % AES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_AES | FLG_ECB);
 }
 
 static int stm32_cryp_aes_cbc_encrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % AES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_AES | FLG_CBC | FLG_ENCRYPT);
 }
 
 static int stm32_cryp_aes_cbc_decrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % AES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_AES | FLG_CBC);
 }
 
 static int stm32_cryp_aes_ctr_encrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_AES | FLG_CTR | FLG_ENCRYPT);
 }
 
 static int stm32_cryp_aes_ctr_decrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_AES | FLG_CTR);
 }
 
@@ -863,53 +906,122 @@ static int stm32_cryp_aes_gcm_decrypt(struct aead_request *req)
 	return stm32_cryp_aead_crypt(req, FLG_AES | FLG_GCM);
 }
 
+static inline int crypto_ccm_check_iv(const u8 *iv)
+{
+	/* 2 <= L <= 8, so 1 <= L' <= 7. */
+	if (iv[0] < 1 || iv[0] > 7)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int stm32_cryp_aes_ccm_encrypt(struct aead_request *req)
 {
+	int err;
+
+	err = crypto_ccm_check_iv(req->iv);
+	if (err)
+		return err;
+
 	return stm32_cryp_aead_crypt(req, FLG_AES | FLG_CCM | FLG_ENCRYPT);
 }
 
 static int stm32_cryp_aes_ccm_decrypt(struct aead_request *req)
 {
+	int err;
+
+	err = crypto_ccm_check_iv(req->iv);
+	if (err)
+		return err;
+
 	return stm32_cryp_aead_crypt(req, FLG_AES | FLG_CCM);
 }
 
 static int stm32_cryp_des_ecb_encrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % DES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_DES | FLG_ECB | FLG_ENCRYPT);
 }
 
 static int stm32_cryp_des_ecb_decrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % DES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_DES | FLG_ECB);
 }
 
 static int stm32_cryp_des_cbc_encrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % DES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_DES | FLG_CBC | FLG_ENCRYPT);
 }
 
 static int stm32_cryp_des_cbc_decrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % DES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_DES | FLG_CBC);
 }
 
 static int stm32_cryp_tdes_ecb_encrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % DES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_TDES | FLG_ECB | FLG_ENCRYPT);
 }
 
 static int stm32_cryp_tdes_ecb_decrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % DES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_TDES | FLG_ECB);
 }
 
 static int stm32_cryp_tdes_cbc_encrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % DES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_TDES | FLG_CBC | FLG_ENCRYPT);
 }
 
 static int stm32_cryp_tdes_cbc_decrypt(struct skcipher_request *req)
 {
+	if (req->cryptlen % DES_BLOCK_SIZE)
+		return -EINVAL;
+
+	if (req->cryptlen == 0)
+		return 0;
+
 	return stm32_cryp_crypt(req, FLG_TDES | FLG_CBC);
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
