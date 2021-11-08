Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 209AA449828
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Nov 2021 16:26:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B054AC5EC75;
	Mon,  8 Nov 2021 15:26:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5475BC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Oct 2021 14:01:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TDDEAB016827; 
 Fri, 29 Oct 2021 15:57:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=d+ZzAaK0N0k7DcIz7hPS+LHVpJl9iHaguTQhblAOdAE=;
 b=FP2fCB5BJ8EUH5HokFz7y68YSYWQlAOSQielFWC6FYTTrCw9wknGmnGPxblsk6eVyVKO
 A2jsDLOHRm6yeN7MMCwBsV1RNYet/B1JZ0ngFqa3jVKTCjvtukfXAb+f3aj1H42KMXyt
 cDr+dyC9SFiHnNBuX+jZoeSmfderYGtDH1DbOSZKpeg7s/czncDK7gUzKcr3V6GKooxa
 GpbBSZMAakC82XFuUuD8u5ipMc0xKpmJyMqiRfOzT/vmRvVL4JkIePN7U5xO+ReBpy7A
 GRGSV5fo/D9AyXjF9nAWV4PvLVMkI9GnrUetJ+LcGyZn2xL5a/Fmm5MvbqyISqI+vWhY Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3c089rujam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 15:57:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A37AE100034;
 Fri, 29 Oct 2021 15:57:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 985B124C742;
 Fri, 29 Oct 2021 15:57:04 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 29 Oct 2021 15:57:04
 +0200
From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 29 Oct 2021 15:54:53 +0200
Message-ID: <20211029135454.4383-8-nicolas.toromanoff@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029135454.4383-1-nicolas.toromanoff@foss.st.com>
References: <20211029135454.4383-1-nicolas.toromanoff@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-29_03,2021-10-29_01,2020-04-07_01
X-Mailman-Approved-At: Mon, 08 Nov 2021 15:26:11 +0000
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/8] crypto: stm32/cryp - fix bugs and crash
	in tests
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

In case buffers are copied from userspace, directly accessing the page
will most likely fail because it hasn't been mapped into the kernel
memory space. Fix the issue by using scatterwalk_copychunks() that will
map and copy each block.
Using this api and copy full block will also fix unaligned data
access, avoid early copy of in/out buffer, and we doesn't need to add
alignment constraint.
Thanks to memcopy, we don't need to manage alignment of buffer.

Fixes: 9e054ec21ef8 ("crypto: stm32 - Support for STM32 CRYP crypto module")

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 790 +++++++++---------------------
 1 file changed, 243 insertions(+), 547 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 632f21f6e15b..54e19cbe35c9 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -37,7 +37,6 @@
 /* Mode mask = bits [15..0] */
 #define FLG_MODE_MASK           GENMASK(15, 0)
 /* Bit [31..16] status  */
-#define FLG_CCM_PADDED_WA       BIT(16)
 
 /* Registers */
 #define CRYP_CR                 0x00000000
@@ -105,8 +104,6 @@
 /* Misc */
 #define AES_BLOCK_32            (AES_BLOCK_SIZE / sizeof(u32))
 #define GCM_CTR_INIT            2
-#define _walked_in              (cryp->in_walk.offset - cryp->in_sg->offset)
-#define _walked_out             (cryp->out_walk.offset - cryp->out_sg->offset)
 #define CRYP_AUTOSUSPEND_DELAY	50
 
 struct stm32_cryp_caps {
@@ -144,21 +141,11 @@ struct stm32_cryp {
 	size_t                  authsize;
 	size_t                  hw_blocksize;
 
-	size_t                  total_in;
-	size_t                  total_in_save;
-	size_t                  total_out;
-	size_t                  total_out_save;
+	size_t                  payload_in;
+	size_t                  header_in;
+	size_t                  payload_out;
 
-	struct scatterlist      *in_sg;
 	struct scatterlist      *out_sg;
-	struct scatterlist      *out_sg_save;
-
-	struct scatterlist      in_sgl;
-	struct scatterlist      out_sgl;
-	bool                    sgs_copied;
-
-	int                     in_sg_len;
-	int                     out_sg_len;
 
 	struct scatter_walk     in_walk;
 	struct scatter_walk     out_walk;
@@ -262,6 +249,7 @@ static inline int stm32_cryp_wait_output(struct stm32_cryp *cryp)
 }
 
 static int stm32_cryp_read_auth_tag(struct stm32_cryp *cryp);
+static void stm32_cryp_finish_req(struct stm32_cryp *cryp, int err);
 
 static struct stm32_cryp *stm32_cryp_find_dev(struct stm32_cryp_ctx *ctx)
 {
@@ -283,103 +271,6 @@ static struct stm32_cryp *stm32_cryp_find_dev(struct stm32_cryp_ctx *ctx)
 	return cryp;
 }
 
-static int stm32_cryp_check_aligned(struct scatterlist *sg, size_t total,
-				    size_t align)
-{
-	int len = 0;
-
-	if (!total)
-		return 0;
-
-	if (!IS_ALIGNED(total, align))
-		return -EINVAL;
-
-	while (sg) {
-		if (!IS_ALIGNED(sg->offset, sizeof(u32)))
-			return -EINVAL;
-
-		if (!IS_ALIGNED(sg->length, align))
-			return -EINVAL;
-
-		len += sg->length;
-		sg = sg_next(sg);
-	}
-
-	if (len != total)
-		return -EINVAL;
-
-	return 0;
-}
-
-static int stm32_cryp_check_io_aligned(struct stm32_cryp *cryp)
-{
-	int ret;
-
-	ret = stm32_cryp_check_aligned(cryp->in_sg, cryp->total_in,
-				       cryp->hw_blocksize);
-	if (ret)
-		return ret;
-
-	ret = stm32_cryp_check_aligned(cryp->out_sg, cryp->total_out,
-				       cryp->hw_blocksize);
-
-	return ret;
-}
-
-static void sg_copy_buf(void *buf, struct scatterlist *sg,
-			unsigned int start, unsigned int nbytes, int out)
-{
-	struct scatter_walk walk;
-
-	if (!nbytes)
-		return;
-
-	scatterwalk_start(&walk, sg);
-	scatterwalk_advance(&walk, start);
-	scatterwalk_copychunks(buf, &walk, nbytes, out);
-	scatterwalk_done(&walk, out, 0);
-}
-
-static int stm32_cryp_copy_sgs(struct stm32_cryp *cryp)
-{
-	void *buf_in, *buf_out;
-	int pages, total_in, total_out;
-
-	if (!stm32_cryp_check_io_aligned(cryp)) {
-		cryp->sgs_copied = 0;
-		return 0;
-	}
-
-	total_in = ALIGN(cryp->total_in, cryp->hw_blocksize);
-	pages = total_in ? get_order(total_in) : 1;
-	buf_in = (void *)__get_free_pages(GFP_ATOMIC, pages);
-
-	total_out = ALIGN(cryp->total_out, cryp->hw_blocksize);
-	pages = total_out ? get_order(total_out) : 1;
-	buf_out = (void *)__get_free_pages(GFP_ATOMIC, pages);
-
-	if (!buf_in || !buf_out) {
-		dev_err(cryp->dev, "Can't allocate pages when unaligned\n");
-		cryp->sgs_copied = 0;
-		return -EFAULT;
-	}
-
-	sg_copy_buf(buf_in, cryp->in_sg, 0, cryp->total_in, 0);
-
-	sg_init_one(&cryp->in_sgl, buf_in, total_in);
-	cryp->in_sg = &cryp->in_sgl;
-	cryp->in_sg_len = 1;
-
-	sg_init_one(&cryp->out_sgl, buf_out, total_out);
-	cryp->out_sg_save = cryp->out_sg;
-	cryp->out_sg = &cryp->out_sgl;
-	cryp->out_sg_len = 1;
-
-	cryp->sgs_copied = 1;
-
-	return 0;
-}
-
 static void stm32_cryp_hw_write_iv(struct stm32_cryp *cryp, __be32 *iv)
 {
 	if (!iv)
@@ -481,16 +372,99 @@ static int stm32_cryp_gcm_init(struct stm32_cryp *cryp, u32 cfg)
 
 	/* Wait for end of processing */
 	ret = stm32_cryp_wait_enable(cryp);
-	if (ret)
+	if (ret) {
 		dev_err(cryp->dev, "Timeout (gcm init)\n");
+		return ret;
+	}
 
-	return ret;
+	/* Prepare next phase */
+	if (cryp->areq->assoclen) {
+		cfg |= CR_PH_HEADER;
+		stm32_cryp_write(cryp, CRYP_CR, cfg);
+	} else if (stm32_cryp_get_input_text_len(cryp)) {
+		cfg |= CR_PH_PAYLOAD;
+		stm32_cryp_write(cryp, CRYP_CR, cfg);
+	}
+
+	return 0;
+}
+
+static void stm32_crypt_gcmccm_end_header(struct stm32_cryp *cryp)
+{
+	u32 cfg;
+	int err;
+
+	/* Check if whole header written */
+	if (!cryp->header_in) {
+		/* Wait for completion */
+		err = stm32_cryp_wait_busy(cryp);
+		if (err) {
+			dev_err(cryp->dev, "Timeout (gcm/ccm header)\n");
+			stm32_cryp_write(cryp, CRYP_IMSCR, 0);
+			stm32_cryp_finish_req(cryp, err);
+			return;
+		}
+
+		if (stm32_cryp_get_input_text_len(cryp)) {
+			/* Phase 3 : payload */
+			cfg = stm32_cryp_read(cryp, CRYP_CR);
+			cfg &= ~CR_CRYPEN;
+			stm32_cryp_write(cryp, CRYP_CR, cfg);
+
+			cfg &= ~CR_PH_MASK;
+			cfg |= CR_PH_PAYLOAD | CR_CRYPEN;
+			stm32_cryp_write(cryp, CRYP_CR, cfg);
+		} else {
+			/*
+			 * Phase 4 : tag.
+			 * Nothing to read, nothing to write, caller have to
+			 * end request
+			 */
+		}
+	}
+}
+
+static void stm32_cryp_write_ccm_first_header(struct stm32_cryp *cryp)
+{
+	unsigned int i;
+	size_t written;
+	size_t len;
+	u32 alen = cryp->areq->assoclen;
+	u32 block[AES_BLOCK_32] = {0};
+	u8 *b8 = (u8 *)block;
+
+	if (alen <= 65280) {
+		/* Write first u32 of B1 */
+		b8[0] = (alen >> 8) & 0xFF;
+		b8[1] = alen & 0xFF;
+		len = 2;
+	} else {
+		/* Build the two first u32 of B1 */
+		b8[0] = 0xFF;
+		b8[1] = 0xFE;
+		b8[2] = alen & 0xFF000000 >> 24;
+		b8[3] = alen & 0x00FF0000 >> 16;
+		b8[4] = alen & 0x0000FF00 >> 8;
+		b8[5] = alen & 0x000000FF;
+		len = 6;
+	}
+
+	written = min_t(size_t, AES_BLOCK_SIZE - len, alen);
+
+	scatterwalk_copychunks((char *)block + len, &cryp->in_walk, written, 0);
+	for (i = 0; i < AES_BLOCK_32; i++)
+		stm32_cryp_write(cryp, CRYP_DIN, block[i]);
+
+	cryp->header_in -= written;
+
+	stm32_crypt_gcmccm_end_header(cryp);
 }
 
 static int stm32_cryp_ccm_init(struct stm32_cryp *cryp, u32 cfg)
 {
 	int ret;
-	u8 iv[AES_BLOCK_SIZE], b0[AES_BLOCK_SIZE];
+	u32 iv_32[AES_BLOCK_32], b0_32[AES_BLOCK_32];
+	u8 *iv = (u8 *)iv_32, *b0 = (u8 *)b0_32;
 	__be32 *bd;
 	u32 *d;
 	unsigned int i, textlen;
@@ -531,17 +505,30 @@ static int stm32_cryp_ccm_init(struct stm32_cryp *cryp, u32 cfg)
 
 	/* Wait for end of processing */
 	ret = stm32_cryp_wait_enable(cryp);
-	if (ret)
+	if (ret) {
 		dev_err(cryp->dev, "Timeout (ccm init)\n");
+		return ret;
+	}
 
-	return ret;
+	/* Prepare next phase */
+	if (cryp->areq->assoclen) {
+		cfg |= CR_PH_HEADER | CR_CRYPEN;
+		stm32_cryp_write(cryp, CRYP_CR, cfg);
+
+		/* Write first (special) block (may move to next phase [payload]) */
+		stm32_cryp_write_ccm_first_header(cryp);
+	} else if (stm32_cryp_get_input_text_len(cryp)) {
+		cfg |= CR_PH_PAYLOAD;
+		stm32_cryp_write(cryp, CRYP_CR, cfg);
+	}
+
+	return 0;
 }
 
 static int stm32_cryp_hw_init(struct stm32_cryp *cryp)
 {
 	int ret;
 	u32 cfg, hw_mode;
-
 	pm_runtime_resume_and_get(cryp->dev);
 
 	/* Disable interrupt */
@@ -605,16 +592,6 @@ static int stm32_cryp_hw_init(struct stm32_cryp *cryp)
 		if (ret)
 			return ret;
 
-		/* Phase 2 : header (authenticated data) */
-		if (cryp->areq->assoclen) {
-			cfg |= CR_PH_HEADER;
-		} else if (stm32_cryp_get_input_text_len(cryp)) {
-			cfg |= CR_PH_PAYLOAD;
-			stm32_cryp_write(cryp, CRYP_CR, cfg);
-		} else {
-			cfg |= CR_PH_INIT;
-		}
-
 		break;
 
 	case CR_DES_CBC:
@@ -633,8 +610,6 @@ static int stm32_cryp_hw_init(struct stm32_cryp *cryp)
 
 	stm32_cryp_write(cryp, CRYP_CR, cfg);
 
-	cryp->flags &= ~FLG_CCM_PADDED_WA;
-
 	return 0;
 }
 
@@ -647,25 +622,6 @@ static void stm32_cryp_finish_req(struct stm32_cryp *cryp, int err)
 	if (!err && (!(is_gcm(cryp) || is_ccm(cryp))))
 		stm32_cryp_get_iv(cryp);
 
-	if (cryp->sgs_copied) {
-		void *buf_in, *buf_out;
-		int pages, len;
-
-		buf_in = sg_virt(&cryp->in_sgl);
-		buf_out = sg_virt(&cryp->out_sgl);
-
-		sg_copy_buf(buf_out, cryp->out_sg_save, 0,
-			    cryp->total_out_save, 1);
-
-		len = ALIGN(cryp->total_in_save, cryp->hw_blocksize);
-		pages = len ? get_order(len) : 1;
-		free_pages((unsigned long)buf_in, pages);
-
-		len = ALIGN(cryp->total_out_save, cryp->hw_blocksize);
-		pages = len ? get_order(len) : 1;
-		free_pages((unsigned long)buf_out, pages);
-	}
-
 	memset(cryp->ctx->key, 0, sizeof(cryp->ctx->key));
 
 	pm_runtime_mark_last_busy(cryp->dev);
@@ -1031,6 +987,7 @@ static int stm32_cryp_prepare_req(struct skcipher_request *req,
 	struct stm32_cryp_ctx *ctx;
 	struct stm32_cryp *cryp;
 	struct stm32_cryp_reqctx *rctx;
+	struct scatterlist *in_sg;
 	int ret;
 
 	if (!req && !areq)
@@ -1056,76 +1013,55 @@ static int stm32_cryp_prepare_req(struct skcipher_request *req,
 	if (req) {
 		cryp->req = req;
 		cryp->areq = NULL;
-		cryp->total_in = req->cryptlen;
-		cryp->total_out = cryp->total_in;
+		cryp->header_in = 0;
+		cryp->payload_in = req->cryptlen;
+		cryp->payload_out = req->cryptlen;
+		cryp->authsize = 0;
 	} else {
 		/*
 		 * Length of input and output data:
 		 * Encryption case:
-		 *  INPUT  =   AssocData  ||   PlainText
+		 *  INPUT  = AssocData   ||     PlainText
 		 *          <- assoclen ->  <- cryptlen ->
-		 *          <------- total_in ----------->
 		 *
-		 *  OUTPUT =   AssocData  ||  CipherText  ||   AuthTag
-		 *          <- assoclen ->  <- cryptlen ->  <- authsize ->
-		 *          <---------------- total_out ----------------->
+		 *  OUTPUT = AssocData    ||   CipherText   ||      AuthTag
+		 *          <- assoclen ->  <-- cryptlen -->  <- authsize ->
 		 *
 		 * Decryption case:
-		 *  INPUT  =   AssocData  ||  CipherText  ||  AuthTag
-		 *          <- assoclen ->  <--------- cryptlen --------->
-		 *                                          <- authsize ->
-		 *          <---------------- total_in ------------------>
+		 *  INPUT  =  AssocData     ||    CipherTex   ||       AuthTag
+		 *          <- assoclen --->  <---------- cryptlen ---------->
 		 *
-		 *  OUTPUT =   AssocData  ||   PlainText
-		 *          <- assoclen ->  <- crypten - authsize ->
-		 *          <---------- total_out ----------------->
+		 *  OUTPUT = AssocData    ||               PlainText
+		 *          <- assoclen ->  <- cryptlen - authsize ->
 		 */
 		cryp->areq = areq;
 		cryp->req = NULL;
 		cryp->authsize = crypto_aead_authsize(crypto_aead_reqtfm(areq));
-		cryp->total_in = areq->assoclen + areq->cryptlen;
-		if (is_encrypt(cryp))
-			/* Append auth tag to output */
-			cryp->total_out = cryp->total_in + cryp->authsize;
-		else
-			/* No auth tag in output */
-			cryp->total_out = cryp->total_in - cryp->authsize;
+		if (is_encrypt(cryp)) {
+			cryp->payload_in = areq->cryptlen;
+			cryp->header_in = areq->assoclen;
+			cryp->payload_out = areq->cryptlen;
+		} else {
+			cryp->payload_in = areq->cryptlen - cryp->authsize;
+			cryp->header_in = areq->assoclen;
+			cryp->payload_out = cryp->payload_in;
+		}
 	}
 
-	cryp->total_in_save = cryp->total_in;
-	cryp->total_out_save = cryp->total_out;
+	in_sg = req ? req->src : areq->src;
+	scatterwalk_start(&cryp->in_walk, in_sg);
 
-	cryp->in_sg = req ? req->src : areq->src;
 	cryp->out_sg = req ? req->dst : areq->dst;
-	cryp->out_sg_save = cryp->out_sg;
-
-	cryp->in_sg_len = sg_nents_for_len(cryp->in_sg, cryp->total_in);
-	if (cryp->in_sg_len < 0) {
-		dev_err(cryp->dev, "Cannot get in_sg_len\n");
-		ret = cryp->in_sg_len;
-		return ret;
-	}
-
-	cryp->out_sg_len = sg_nents_for_len(cryp->out_sg, cryp->total_out);
-	if (cryp->out_sg_len < 0) {
-		dev_err(cryp->dev, "Cannot get out_sg_len\n");
-		ret = cryp->out_sg_len;
-		return ret;
-	}
-
-	ret = stm32_cryp_copy_sgs(cryp);
-	if (ret)
-		return ret;
-
-	scatterwalk_start(&cryp->in_walk, cryp->in_sg);
 	scatterwalk_start(&cryp->out_walk, cryp->out_sg);
 
 	if (is_gcm(cryp) || is_ccm(cryp)) {
 		/* In output, jump after assoc data */
-		scatterwalk_advance(&cryp->out_walk, cryp->areq->assoclen);
-		cryp->total_out -= cryp->areq->assoclen;
+		scatterwalk_copychunks(NULL, &cryp->out_walk, cryp->areq->assoclen, 2);
 	}
 
+	if (is_ctr(cryp))
+		memset(cryp->last_ctr, 0, sizeof(cryp->last_ctr));
+
 	ret = stm32_cryp_hw_init(cryp);
 	return ret;
 }
@@ -1173,8 +1109,7 @@ static int stm32_cryp_aead_one_req(struct crypto_engine *engine, void *areq)
 	if (!cryp)
 		return -ENODEV;
 
-	if (unlikely(!cryp->areq->assoclen &&
-		     !stm32_cryp_get_input_text_len(cryp))) {
+	if (unlikely(!cryp->payload_in && !cryp->header_in)) {
 		/* No input data to process: get tag and finish */
 		stm32_cryp_finish_req(cryp, 0);
 		return 0;
@@ -1183,43 +1118,10 @@ static int stm32_cryp_aead_one_req(struct crypto_engine *engine, void *areq)
 	return stm32_cryp_cpu_start(cryp);
 }
 
-static u32 *stm32_cryp_next_out(struct stm32_cryp *cryp, u32 *dst,
-				unsigned int n)
-{
-	scatterwalk_advance(&cryp->out_walk, n);
-
-	if (unlikely(cryp->out_sg->length == _walked_out)) {
-		cryp->out_sg = sg_next(cryp->out_sg);
-		if (cryp->out_sg) {
-			scatterwalk_start(&cryp->out_walk, cryp->out_sg);
-			return (sg_virt(cryp->out_sg) + _walked_out);
-		}
-	}
-
-	return (u32 *)((u8 *)dst + n);
-}
-
-static u32 *stm32_cryp_next_in(struct stm32_cryp *cryp, u32 *src,
-			       unsigned int n)
-{
-	scatterwalk_advance(&cryp->in_walk, n);
-
-	if (unlikely(cryp->in_sg->length == _walked_in)) {
-		cryp->in_sg = sg_next(cryp->in_sg);
-		if (cryp->in_sg) {
-			scatterwalk_start(&cryp->in_walk, cryp->in_sg);
-			return (sg_virt(cryp->in_sg) + _walked_in);
-		}
-	}
-
-	return (u32 *)((u8 *)src + n);
-}
-
 static int stm32_cryp_read_auth_tag(struct stm32_cryp *cryp)
 {
-	u32 cfg, size_bit, *dst, d32;
-	u8 *d8;
-	unsigned int i, j;
+	u32 cfg, size_bit;
+	unsigned int i;
 	int ret = 0;
 
 	/* Update Config */
@@ -1242,7 +1144,7 @@ static int stm32_cryp_read_auth_tag(struct stm32_cryp *cryp)
 		stm32_cryp_write(cryp, CRYP_DIN, size_bit);
 
 		size_bit = is_encrypt(cryp) ? cryp->areq->cryptlen :
-				cryp->areq->cryptlen - AES_BLOCK_SIZE;
+				cryp->areq->cryptlen - cryp->authsize;
 		size_bit *= 8;
 		if (cryp->caps->swap_final)
 			size_bit = (__force u32)cpu_to_be32(size_bit);
@@ -1251,11 +1153,9 @@ static int stm32_cryp_read_auth_tag(struct stm32_cryp *cryp)
 		stm32_cryp_write(cryp, CRYP_DIN, size_bit);
 	} else {
 		/* CCM: write CTR0 */
-		u8 iv[AES_BLOCK_SIZE];
-		u32 *iv32 = (u32 *)iv;
-		__be32 *biv;
-
-		biv = (void *)iv;
+		u32 iv32[AES_BLOCK_32];
+		u8 *iv = (u8 *)iv32;
+		__be32 *biv = (__be32 *)iv32;
 
 		memcpy(iv, cryp->areq->iv, AES_BLOCK_SIZE);
 		memset(iv + AES_BLOCK_SIZE - 1 - iv[0], 0, iv[0] + 1);
@@ -1277,39 +1177,18 @@ static int stm32_cryp_read_auth_tag(struct stm32_cryp *cryp)
 	}
 
 	if (is_encrypt(cryp)) {
+		u32 out_tag[AES_BLOCK_32];
+
 		/* Get and write tag */
-		dst = sg_virt(cryp->out_sg) + _walked_out;
+		for (i = 0; i < AES_BLOCK_32; i++)
+			out_tag[i] = stm32_cryp_read(cryp, CRYP_DOUT);
 
-		for (i = 0; i < AES_BLOCK_32; i++) {
-			if (cryp->total_out >= sizeof(u32)) {
-				/* Read a full u32 */
-				*dst = stm32_cryp_read(cryp, CRYP_DOUT);
-
-				dst = stm32_cryp_next_out(cryp, dst,
-							  sizeof(u32));
-				cryp->total_out -= sizeof(u32);
-			} else if (!cryp->total_out) {
-				/* Empty fifo out (data from input padding) */
-				stm32_cryp_read(cryp, CRYP_DOUT);
-			} else {
-				/* Read less than an u32 */
-				d32 = stm32_cryp_read(cryp, CRYP_DOUT);
-				d8 = (u8 *)&d32;
-
-				for (j = 0; j < cryp->total_out; j++) {
-					*((u8 *)dst) = *(d8++);
-					dst = stm32_cryp_next_out(cryp, dst, 1);
-				}
-				cryp->total_out = 0;
-			}
-		}
+		scatterwalk_copychunks(out_tag, &cryp->out_walk, cryp->authsize, 1);
 	} else {
 		/* Get and check tag */
 		u32 in_tag[AES_BLOCK_32], out_tag[AES_BLOCK_32];
 
-		scatterwalk_map_and_copy(in_tag, cryp->in_sg,
-					 cryp->total_in_save - cryp->authsize,
-					 cryp->authsize, 0);
+		scatterwalk_copychunks(in_tag, &cryp->in_walk, cryp->authsize, 0);
 
 		for (i = 0; i < AES_BLOCK_32; i++)
 			out_tag[i] = stm32_cryp_read(cryp, CRYP_DOUT);
@@ -1353,92 +1232,37 @@ static void stm32_cryp_check_ctr_counter(struct stm32_cryp *cryp)
 	cryp->last_ctr[3] = cpu_to_be32(stm32_cryp_read(cryp, CRYP_IV1RR));
 }
 
-static bool stm32_cryp_irq_read_data(struct stm32_cryp *cryp)
+static void stm32_cryp_irq_read_data(struct stm32_cryp *cryp)
 {
-	unsigned int i, j;
-	u32 d32, *dst;
-	u8 *d8;
-	size_t tag_size;
-
-	/* Do no read tag now (if any) */
-	if (is_encrypt(cryp) && (is_gcm(cryp) || is_ccm(cryp)))
-		tag_size = cryp->authsize;
-	else
-		tag_size = 0;
-
-	dst = sg_virt(cryp->out_sg) + _walked_out;
-
-	for (i = 0; i < cryp->hw_blocksize / sizeof(u32); i++) {
-		if (likely(cryp->total_out - tag_size >= sizeof(u32))) {
-			/* Read a full u32 */
-			*dst = stm32_cryp_read(cryp, CRYP_DOUT);
+	unsigned int i;
+	u32 block[AES_BLOCK_32];
 
-			dst = stm32_cryp_next_out(cryp, dst, sizeof(u32));
-			cryp->total_out -= sizeof(u32);
-		} else if (cryp->total_out == tag_size) {
-			/* Empty fifo out (data from input padding) */
-			d32 = stm32_cryp_read(cryp, CRYP_DOUT);
-		} else {
-			/* Read less than an u32 */
-			d32 = stm32_cryp_read(cryp, CRYP_DOUT);
-			d8 = (u8 *)&d32;
-
-			for (j = 0; j < cryp->total_out - tag_size; j++) {
-				*((u8 *)dst) = *(d8++);
-				dst = stm32_cryp_next_out(cryp, dst, 1);
-			}
-			cryp->total_out = tag_size;
-		}
-	}
+	for (i = 0; i < cryp->hw_blocksize / sizeof(u32); i++)
+		block[i] = stm32_cryp_read(cryp, CRYP_DOUT);
 
-	return !(cryp->total_out - tag_size) || !cryp->total_in;
+	scatterwalk_copychunks(block, &cryp->out_walk, min_t(size_t, cryp->hw_blocksize,
+							     cryp->payload_out), 1);
+	cryp->payload_out -= min_t(size_t, cryp->hw_blocksize,
+				   cryp->payload_out);
 }
 
 static void stm32_cryp_irq_write_block(struct stm32_cryp *cryp)
 {
-	unsigned int i, j;
-	u32 *src;
-	u8 d8[4];
-	size_t tag_size;
-
-	/* Do no write tag (if any) */
-	if (is_decrypt(cryp) && (is_gcm(cryp) || is_ccm(cryp)))
-		tag_size = cryp->authsize;
-	else
-		tag_size = 0;
-
-	src = sg_virt(cryp->in_sg) + _walked_in;
+	unsigned int i;
+	u32 block[AES_BLOCK_32] = {0};
 
-	for (i = 0; i < cryp->hw_blocksize / sizeof(u32); i++) {
-		if (likely(cryp->total_in - tag_size >= sizeof(u32))) {
-			/* Write a full u32 */
-			stm32_cryp_write(cryp, CRYP_DIN, *src);
+	scatterwalk_copychunks(block, &cryp->in_walk, min_t(size_t, cryp->hw_blocksize,
+							    cryp->payload_in), 0);
+	for (i = 0; i < cryp->hw_blocksize / sizeof(u32); i++)
+		stm32_cryp_write(cryp, CRYP_DIN, block[i]);
 
-			src = stm32_cryp_next_in(cryp, src, sizeof(u32));
-			cryp->total_in -= sizeof(u32);
-		} else if (cryp->total_in == tag_size) {
-			/* Write padding data */
-			stm32_cryp_write(cryp, CRYP_DIN, 0);
-		} else {
-			/* Write less than an u32 */
-			memset(d8, 0, sizeof(u32));
-			for (j = 0; j < cryp->total_in - tag_size; j++) {
-				d8[j] = *((u8 *)src);
-				src = stm32_cryp_next_in(cryp, src, 1);
-			}
-
-			stm32_cryp_write(cryp, CRYP_DIN, *(u32 *)d8);
-			cryp->total_in = tag_size;
-		}
-	}
+	cryp->payload_in -= min_t(size_t, cryp->hw_blocksize, cryp->payload_in);
 }
 
 static void stm32_cryp_irq_write_gcm_padded_data(struct stm32_cryp *cryp)
 {
 	int err;
-	u32 cfg, tmp[AES_BLOCK_32];
-	size_t total_in_ori = cryp->total_in;
-	struct scatterlist *out_sg_ori = cryp->out_sg;
+	u32 cfg, block[AES_BLOCK_32] = {0};
 	unsigned int i;
 
 	/* 'Special workaround' procedure described in the datasheet */
@@ -1463,18 +1287,25 @@ static void stm32_cryp_irq_write_gcm_padded_data(struct stm32_cryp *cryp)
 
 	/* b) pad and write the last block */
 	stm32_cryp_irq_write_block(cryp);
-	cryp->total_in = total_in_ori;
+	/* wait end of process */
 	err = stm32_cryp_wait_output(cryp);
 	if (err) {
-		dev_err(cryp->dev, "Timeout (write gcm header)\n");
+		dev_err(cryp->dev, "Timeout (write gcm last data)\n");
 		return stm32_cryp_finish_req(cryp, err);
 	}
 
 	/* c) get and store encrypted data */
-	stm32_cryp_irq_read_data(cryp);
-	scatterwalk_map_and_copy(tmp, out_sg_ori,
-				 cryp->total_in_save - total_in_ori,
-				 total_in_ori, 0);
+	/*
+	 * Same code as stm32_cryp_irq_read_data(), but we want to store
+	 * block value
+	 */
+	for (i = 0; i < cryp->hw_blocksize / sizeof(u32); i++)
+		block[i] = stm32_cryp_read(cryp, CRYP_DOUT);
+
+	scatterwalk_copychunks(block, &cryp->out_walk, min_t(size_t, cryp->hw_blocksize,
+							     cryp->payload_out), 1);
+	cryp->payload_out -= min_t(size_t, cryp->hw_blocksize,
+				   cryp->payload_out);
 
 	/* d) change mode back to AES GCM */
 	cfg &= ~CR_ALGO_MASK;
@@ -1487,19 +1318,13 @@ static void stm32_cryp_irq_write_gcm_padded_data(struct stm32_cryp *cryp)
 	stm32_cryp_write(cryp, CRYP_CR, cfg);
 
 	/* f) write padded data */
-	for (i = 0; i < AES_BLOCK_32; i++) {
-		if (cryp->total_in)
-			stm32_cryp_write(cryp, CRYP_DIN, tmp[i]);
-		else
-			stm32_cryp_write(cryp, CRYP_DIN, 0);
-
-		cryp->total_in -= min_t(size_t, sizeof(u32), cryp->total_in);
-	}
+	for (i = 0; i < AES_BLOCK_32; i++)
+		stm32_cryp_write(cryp, CRYP_DIN, block[i]);
 
 	/* g) Empty fifo out */
 	err = stm32_cryp_wait_output(cryp);
 	if (err) {
-		dev_err(cryp->dev, "Timeout (write gcm header)\n");
+		dev_err(cryp->dev, "Timeout (write gcm padded data)\n");
 		return stm32_cryp_finish_req(cryp, err);
 	}
 
@@ -1512,16 +1337,14 @@ static void stm32_cryp_irq_write_gcm_padded_data(struct stm32_cryp *cryp)
 
 static void stm32_cryp_irq_set_npblb(struct stm32_cryp *cryp)
 {
-	u32 cfg, payload_bytes;
+	u32 cfg;
 
 	/* disable ip, set NPBLB and reneable ip */
 	cfg = stm32_cryp_read(cryp, CRYP_CR);
 	cfg &= ~CR_CRYPEN;
 	stm32_cryp_write(cryp, CRYP_CR, cfg);
 
-	payload_bytes = is_decrypt(cryp) ? cryp->total_in - cryp->authsize :
-					   cryp->total_in;
-	cfg |= (cryp->hw_blocksize - payload_bytes) << CR_NBPBL_SHIFT;
+	cfg |= (cryp->hw_blocksize - cryp->payload_in) << CR_NBPBL_SHIFT;
 	cfg |= CR_CRYPEN;
 	stm32_cryp_write(cryp, CRYP_CR, cfg);
 }
@@ -1530,13 +1353,11 @@ static void stm32_cryp_irq_write_ccm_padded_data(struct stm32_cryp *cryp)
 {
 	int err = 0;
 	u32 cfg, iv1tmp;
-	u32 cstmp1[AES_BLOCK_32], cstmp2[AES_BLOCK_32], tmp[AES_BLOCK_32];
-	size_t last_total_out, total_in_ori = cryp->total_in;
-	struct scatterlist *out_sg_ori = cryp->out_sg;
+	u32 cstmp1[AES_BLOCK_32], cstmp2[AES_BLOCK_32];
+	u32 block[AES_BLOCK_32] = {0};
 	unsigned int i;
 
 	/* 'Special workaround' procedure described in the datasheet */
-	cryp->flags |= FLG_CCM_PADDED_WA;
 
 	/* a) disable ip */
 	stm32_cryp_write(cryp, CRYP_IMSCR, 0);
@@ -1566,7 +1387,7 @@ static void stm32_cryp_irq_write_ccm_padded_data(struct stm32_cryp *cryp)
 
 	/* b) pad and write the last block */
 	stm32_cryp_irq_write_block(cryp);
-	cryp->total_in = total_in_ori;
+	/* wait end of process */
 	err = stm32_cryp_wait_output(cryp);
 	if (err) {
 		dev_err(cryp->dev, "Timeout (wite ccm padded data)\n");
@@ -1574,13 +1395,16 @@ static void stm32_cryp_irq_write_ccm_padded_data(struct stm32_cryp *cryp)
 	}
 
 	/* c) get and store decrypted data */
-	last_total_out = cryp->total_out;
-	stm32_cryp_irq_read_data(cryp);
+	/*
+	 * Same code as stm32_cryp_irq_read_data(), but we want to store
+	 * block value
+	 */
+	for (i = 0; i < cryp->hw_blocksize / sizeof(u32); i++)
+		block[i] = stm32_cryp_read(cryp, CRYP_DOUT);
 
-	memset(tmp, 0, sizeof(tmp));
-	scatterwalk_map_and_copy(tmp, out_sg_ori,
-				 cryp->total_out_save - last_total_out,
-				 last_total_out, 0);
+	scatterwalk_copychunks(block, &cryp->out_walk, min_t(size_t, cryp->hw_blocksize,
+							     cryp->payload_out), 1);
+	cryp->payload_out -= min_t(size_t, cryp->hw_blocksize, cryp->payload_out);
 
 	/* d) Load again CRYP_CSGCMCCMxR */
 	for (i = 0; i < ARRAY_SIZE(cstmp2); i++)
@@ -1597,10 +1421,10 @@ static void stm32_cryp_irq_write_ccm_padded_data(struct stm32_cryp *cryp)
 	stm32_cryp_write(cryp, CRYP_CR, cfg);
 
 	/* g) XOR and write padded data */
-	for (i = 0; i < ARRAY_SIZE(tmp); i++) {
-		tmp[i] ^= cstmp1[i];
-		tmp[i] ^= cstmp2[i];
-		stm32_cryp_write(cryp, CRYP_DIN, tmp[i]);
+	for (i = 0; i < ARRAY_SIZE(block); i++) {
+		block[i] ^= cstmp1[i];
+		block[i] ^= cstmp2[i];
+		stm32_cryp_write(cryp, CRYP_DIN, block[i]);
 	}
 
 	/* h) wait for completion */
@@ -1614,30 +1438,34 @@ static void stm32_cryp_irq_write_ccm_padded_data(struct stm32_cryp *cryp)
 
 static void stm32_cryp_irq_write_data(struct stm32_cryp *cryp)
 {
-	if (unlikely(!cryp->total_in)) {
+	if (unlikely(!cryp->payload_in)) {
 		dev_warn(cryp->dev, "No more data to process\n");
 		return;
 	}
 
-	if (unlikely(cryp->total_in < AES_BLOCK_SIZE &&
+	if (unlikely(cryp->payload_in < AES_BLOCK_SIZE &&
 		     (stm32_cryp_get_hw_mode(cryp) == CR_AES_GCM) &&
 		     is_encrypt(cryp))) {
 		/* Padding for AES GCM encryption */
-		if (cryp->caps->padding_wa)
+		if (cryp->caps->padding_wa) {
 			/* Special case 1 */
-			return stm32_cryp_irq_write_gcm_padded_data(cryp);
+			stm32_cryp_irq_write_gcm_padded_data(cryp);
+			return;
+		}
 
 		/* Setting padding bytes (NBBLB) */
 		stm32_cryp_irq_set_npblb(cryp);
 	}
 
-	if (unlikely((cryp->total_in - cryp->authsize < AES_BLOCK_SIZE) &&
+	if (unlikely((cryp->payload_in < AES_BLOCK_SIZE) &&
 		     (stm32_cryp_get_hw_mode(cryp) == CR_AES_CCM) &&
 		     is_decrypt(cryp))) {
 		/* Padding for AES CCM decryption */
-		if (cryp->caps->padding_wa)
+		if (cryp->caps->padding_wa) {
 			/* Special case 2 */
-			return stm32_cryp_irq_write_ccm_padded_data(cryp);
+			stm32_cryp_irq_write_ccm_padded_data(cryp);
+			return;
+		}
 
 		/* Setting padding bytes (NBBLB) */
 		stm32_cryp_irq_set_npblb(cryp);
@@ -1649,192 +1477,60 @@ static void stm32_cryp_irq_write_data(struct stm32_cryp *cryp)
 	stm32_cryp_irq_write_block(cryp);
 }
 
-static void stm32_cryp_irq_write_gcm_header(struct stm32_cryp *cryp)
+static void stm32_cryp_irq_write_gcmccm_header(struct stm32_cryp *cryp)
 {
-	int err;
-	unsigned int i, j;
-	u32 cfg, *src;
-
-	src = sg_virt(cryp->in_sg) + _walked_in;
-
-	for (i = 0; i < AES_BLOCK_32; i++) {
-		stm32_cryp_write(cryp, CRYP_DIN, *src);
-
-		src = stm32_cryp_next_in(cryp, src, sizeof(u32));
-		cryp->total_in -= min_t(size_t, sizeof(u32), cryp->total_in);
-
-		/* Check if whole header written */
-		if ((cryp->total_in_save - cryp->total_in) ==
-				cryp->areq->assoclen) {
-			/* Write padding if needed */
-			for (j = i + 1; j < AES_BLOCK_32; j++)
-				stm32_cryp_write(cryp, CRYP_DIN, 0);
-
-			/* Wait for completion */
-			err = stm32_cryp_wait_busy(cryp);
-			if (err) {
-				dev_err(cryp->dev, "Timeout (gcm header)\n");
-				return stm32_cryp_finish_req(cryp, err);
-			}
-
-			if (stm32_cryp_get_input_text_len(cryp)) {
-				/* Phase 3 : payload */
-				cfg = stm32_cryp_read(cryp, CRYP_CR);
-				cfg &= ~CR_CRYPEN;
-				stm32_cryp_write(cryp, CRYP_CR, cfg);
-
-				cfg &= ~CR_PH_MASK;
-				cfg |= CR_PH_PAYLOAD;
-				cfg |= CR_CRYPEN;
-				stm32_cryp_write(cryp, CRYP_CR, cfg);
-			} else {
-				/* Phase 4 : tag */
-				stm32_cryp_write(cryp, CRYP_IMSCR, 0);
-				stm32_cryp_finish_req(cryp, 0);
-			}
-
-			break;
-		}
-
-		if (!cryp->total_in)
-			break;
-	}
-}
+	unsigned int i;
+	u32 block[AES_BLOCK_32] = {0};
+	size_t written;
 
-static void stm32_cryp_irq_write_ccm_header(struct stm32_cryp *cryp)
-{
-	int err;
-	unsigned int i = 0, j, k;
-	u32 alen, cfg, *src;
-	u8 d8[4];
-
-	src = sg_virt(cryp->in_sg) + _walked_in;
-	alen = cryp->areq->assoclen;
-
-	if (!_walked_in) {
-		if (cryp->areq->assoclen <= 65280) {
-			/* Write first u32 of B1 */
-			d8[0] = (alen >> 8) & 0xFF;
-			d8[1] = alen & 0xFF;
-			d8[2] = *((u8 *)src);
-			src = stm32_cryp_next_in(cryp, src, 1);
-			d8[3] = *((u8 *)src);
-			src = stm32_cryp_next_in(cryp, src, 1);
-
-			stm32_cryp_write(cryp, CRYP_DIN, *(u32 *)d8);
-			i++;
-
-			cryp->total_in -= min_t(size_t, 2, cryp->total_in);
-		} else {
-			/* Build the two first u32 of B1 */
-			d8[0] = 0xFF;
-			d8[1] = 0xFE;
-			d8[2] = alen & 0xFF000000;
-			d8[3] = alen & 0x00FF0000;
-
-			stm32_cryp_write(cryp, CRYP_DIN, *(u32 *)d8);
-			i++;
-
-			d8[0] = alen & 0x0000FF00;
-			d8[1] = alen & 0x000000FF;
-			d8[2] = *((u8 *)src);
-			src = stm32_cryp_next_in(cryp, src, 1);
-			d8[3] = *((u8 *)src);
-			src = stm32_cryp_next_in(cryp, src, 1);
-
-			stm32_cryp_write(cryp, CRYP_DIN, *(u32 *)d8);
-			i++;
-
-			cryp->total_in -= min_t(size_t, 2, cryp->total_in);
-		}
-	}
+	written = min_t(size_t, AES_BLOCK_SIZE, cryp->header_in);
 
-	/* Write next u32 */
-	for (; i < AES_BLOCK_32; i++) {
-		/* Build an u32 */
-		memset(d8, 0, sizeof(u32));
-		for (k = 0; k < sizeof(u32); k++) {
-			d8[k] = *((u8 *)src);
-			src = stm32_cryp_next_in(cryp, src, 1);
-
-			cryp->total_in -= min_t(size_t, 1, cryp->total_in);
-			if ((cryp->total_in_save - cryp->total_in) == alen)
-				break;
-		}
+	scatterwalk_copychunks(block, &cryp->in_walk, written, 0);
+	for (i = 0; i < AES_BLOCK_32; i++)
+		stm32_cryp_write(cryp, CRYP_DIN, block[i]);
 
-		stm32_cryp_write(cryp, CRYP_DIN, *(u32 *)d8);
-
-		if ((cryp->total_in_save - cryp->total_in) == alen) {
-			/* Write padding if needed */
-			for (j = i + 1; j < AES_BLOCK_32; j++)
-				stm32_cryp_write(cryp, CRYP_DIN, 0);
-
-			/* Wait for completion */
-			err = stm32_cryp_wait_busy(cryp);
-			if (err) {
-				dev_err(cryp->dev, "Timeout (ccm header)\n");
-				return stm32_cryp_finish_req(cryp, err);
-			}
-
-			if (stm32_cryp_get_input_text_len(cryp)) {
-				/* Phase 3 : payload */
-				cfg = stm32_cryp_read(cryp, CRYP_CR);
-				cfg &= ~CR_CRYPEN;
-				stm32_cryp_write(cryp, CRYP_CR, cfg);
-
-				cfg &= ~CR_PH_MASK;
-				cfg |= CR_PH_PAYLOAD;
-				cfg |= CR_CRYPEN;
-				stm32_cryp_write(cryp, CRYP_CR, cfg);
-			} else {
-				/* Phase 4 : tag */
-				stm32_cryp_write(cryp, CRYP_IMSCR, 0);
-				stm32_cryp_finish_req(cryp, 0);
-			}
+	cryp->header_in -= written;
 
-			break;
-		}
-	}
+	stm32_crypt_gcmccm_end_header(cryp);
 }
 
 static irqreturn_t stm32_cryp_irq_thread(int irq, void *arg)
 {
 	struct stm32_cryp *cryp = arg;
 	u32 ph;
+	u32 it_mask = stm32_cryp_read(cryp, CRYP_IMSCR);
 
 	if (cryp->irq_status & MISR_OUT)
 		/* Output FIFO IRQ: read data */
-		if (unlikely(stm32_cryp_irq_read_data(cryp))) {
-			/* All bytes processed, finish */
-			stm32_cryp_write(cryp, CRYP_IMSCR, 0);
-			stm32_cryp_finish_req(cryp, 0);
-			return IRQ_HANDLED;
-		}
+		stm32_cryp_irq_read_data(cryp);
 
 	if (cryp->irq_status & MISR_IN) {
-		if (is_gcm(cryp)) {
-			ph = stm32_cryp_read(cryp, CRYP_CR) & CR_PH_MASK;
-			if (unlikely(ph == CR_PH_HEADER))
-				/* Write Header */
-				stm32_cryp_irq_write_gcm_header(cryp);
-			else
-				/* Input FIFO IRQ: write data */
-				stm32_cryp_irq_write_data(cryp);
-			cryp->gcm_ctr++;
-		} else if (is_ccm(cryp)) {
+		if (is_gcm(cryp) || is_ccm(cryp)) {
 			ph = stm32_cryp_read(cryp, CRYP_CR) & CR_PH_MASK;
 			if (unlikely(ph == CR_PH_HEADER))
 				/* Write Header */
-				stm32_cryp_irq_write_ccm_header(cryp);
+				stm32_cryp_irq_write_gcmccm_header(cryp);
 			else
 				/* Input FIFO IRQ: write data */
 				stm32_cryp_irq_write_data(cryp);
+			if (is_gcm(cryp))
+				cryp->gcm_ctr++;
 		} else {
 			/* Input FIFO IRQ: write data */
 			stm32_cryp_irq_write_data(cryp);
 		}
 	}
 
+	/* Mask useless interrupts */
+	if (!cryp->payload_in && !cryp->header_in)
+		it_mask &= ~IMSCR_IN;
+	if (!cryp->payload_out)
+		it_mask &= ~IMSCR_OUT;
+	stm32_cryp_write(cryp, CRYP_IMSCR, it_mask);
+
+	if (!cryp->payload_in && !cryp->header_in && !cryp->payload_out)
+		stm32_cryp_finish_req(cryp, 0);
+
 	return IRQ_HANDLED;
 }
 
@@ -1855,7 +1551,7 @@ static struct skcipher_alg crypto_algs[] = {
 	.base.cra_flags		= CRYPTO_ALG_ASYNC,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct stm32_cryp_ctx),
-	.base.cra_alignmask	= 0xf,
+	.base.cra_alignmask	= 0,
 	.base.cra_module	= THIS_MODULE,
 
 	.init			= stm32_cryp_init_tfm,
@@ -1872,7 +1568,7 @@ static struct skcipher_alg crypto_algs[] = {
 	.base.cra_flags		= CRYPTO_ALG_ASYNC,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct stm32_cryp_ctx),
-	.base.cra_alignmask	= 0xf,
+	.base.cra_alignmask	= 0,
 	.base.cra_module	= THIS_MODULE,
 
 	.init			= stm32_cryp_init_tfm,
@@ -1890,7 +1586,7 @@ static struct skcipher_alg crypto_algs[] = {
 	.base.cra_flags		= CRYPTO_ALG_ASYNC,
 	.base.cra_blocksize	= 1,
 	.base.cra_ctxsize	= sizeof(struct stm32_cryp_ctx),
-	.base.cra_alignmask	= 0xf,
+	.base.cra_alignmask	= 0,
 	.base.cra_module	= THIS_MODULE,
 
 	.init			= stm32_cryp_init_tfm,
@@ -1908,7 +1604,7 @@ static struct skcipher_alg crypto_algs[] = {
 	.base.cra_flags		= CRYPTO_ALG_ASYNC,
 	.base.cra_blocksize	= DES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct stm32_cryp_ctx),
-	.base.cra_alignmask	= 0xf,
+	.base.cra_alignmask	= 0,
 	.base.cra_module	= THIS_MODULE,
 
 	.init			= stm32_cryp_init_tfm,
@@ -1925,7 +1621,7 @@ static struct skcipher_alg crypto_algs[] = {
 	.base.cra_flags		= CRYPTO_ALG_ASYNC,
 	.base.cra_blocksize	= DES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct stm32_cryp_ctx),
-	.base.cra_alignmask	= 0xf,
+	.base.cra_alignmask	= 0,
 	.base.cra_module	= THIS_MODULE,
 
 	.init			= stm32_cryp_init_tfm,
@@ -1943,7 +1639,7 @@ static struct skcipher_alg crypto_algs[] = {
 	.base.cra_flags		= CRYPTO_ALG_ASYNC,
 	.base.cra_blocksize	= DES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct stm32_cryp_ctx),
-	.base.cra_alignmask	= 0xf,
+	.base.cra_alignmask	= 0,
 	.base.cra_module	= THIS_MODULE,
 
 	.init			= stm32_cryp_init_tfm,
@@ -1960,7 +1656,7 @@ static struct skcipher_alg crypto_algs[] = {
 	.base.cra_flags		= CRYPTO_ALG_ASYNC,
 	.base.cra_blocksize	= DES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct stm32_cryp_ctx),
-	.base.cra_alignmask	= 0xf,
+	.base.cra_alignmask	= 0,
 	.base.cra_module	= THIS_MODULE,
 
 	.init			= stm32_cryp_init_tfm,
@@ -1990,7 +1686,7 @@ static struct aead_alg aead_algs[] = {
 		.cra_flags		= CRYPTO_ALG_ASYNC,
 		.cra_blocksize		= 1,
 		.cra_ctxsize		= sizeof(struct stm32_cryp_ctx),
-		.cra_alignmask		= 0xf,
+		.cra_alignmask		= 0,
 		.cra_module		= THIS_MODULE,
 	},
 },
@@ -2010,7 +1706,7 @@ static struct aead_alg aead_algs[] = {
 		.cra_flags		= CRYPTO_ALG_ASYNC,
 		.cra_blocksize		= 1,
 		.cra_ctxsize		= sizeof(struct stm32_cryp_ctx),
-		.cra_alignmask		= 0xf,
+		.cra_alignmask		= 0,
 		.cra_module		= THIS_MODULE,
 	},
 },
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
