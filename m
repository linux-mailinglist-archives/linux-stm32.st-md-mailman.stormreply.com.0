Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B02651CF721
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 16:27:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69502C32E93;
	Tue, 12 May 2020 14:27:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0370BC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 14:13:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CEA4KT023888; Tue, 12 May 2020 16:11:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cLOcXVTJTl2YdjnAoAVjct3Ud4S1kdOOPT3HLYuoqxs=;
 b=czBxOxQwxr7dHfdSo5n5GxzJagQrBEzxxTH06rqVx9wpyqg3NWRwlR2ylgWYT0pVh0FR
 FPemvNNVefANHNvMVhATmYUA9QnW9WkbDb6ogQl+EmhrMhQO7uYinjBu5Yr1ZedUkqMH
 yLkdjG+gcyhtFm7WDdym9LEmGgEPeq+OcPp5l05wEVSgA/uNmqBtfwSFOaAGZ8RxwmB7
 tZ75tjjHrn9BtOXqbOIWn7gFbRw6i6uCM8b/xbO3DcCUeQOAz7xWLPUvTTRrlHGte23z
 mOggxvuwGW+QW62gPlTqnfX/q+ipncDFxI3IQst/wLFnUSeU68JXczwUxeoEjbFCjnGb 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj021236-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 16:11:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79EBF100038;
 Tue, 12 May 2020 16:11:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C7562BAE54;
 Tue, 12 May 2020 16:11:56 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 May 2020 16:11:56 +0200
From: Nicolas Toromanoff <nicolas.toromanoff@st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 12 May 2020 16:11:09 +0200
Message-ID: <20200512141113.18972-2-nicolas.toromanoff@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512141113.18972-1-nicolas.toromanoff@st.com>
References: <20200512141113.18972-1-nicolas.toromanoff@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_03:2020-05-11,
 2020-05-12 signatures=0
X-Mailman-Approved-At: Tue, 12 May 2020 14:27:26 +0000
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/5] crypto: stm32/crc: fix ext4 chksum
	BUG_ON()
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

Allow use of crc_update without prior call to crc_init.
And change (and fix) driver to use CRC device even on unaligned buffers.

Fixes: b51dbe90912a ("crypto: stm32 - Support for STM32 CRC32 crypto module")

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@st.com>
---
 drivers/crypto/stm32/stm32-crc32.c | 98 +++++++++++++++---------------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-crc32.c b/drivers/crypto/stm32/stm32-crc32.c
index 8e92e4ac79f1..c6156bf6c603 100644
--- a/drivers/crypto/stm32/stm32-crc32.c
+++ b/drivers/crypto/stm32/stm32-crc32.c
@@ -28,8 +28,10 @@
 
 /* Registers values */
 #define CRC_CR_RESET            BIT(0)
-#define CRC_CR_REVERSE          (BIT(7) | BIT(6) | BIT(5))
 #define CRC_INIT_DEFAULT        0xFFFFFFFF
+#define CRC_CR_REV_IN_WORD      (BIT(6) | BIT(5))
+#define CRC_CR_REV_IN_BYTE      BIT(5)
+#define CRC_CR_REV_OUT          BIT(7)
 
 #define CRC_AUTOSUSPEND_DELAY	50
 
@@ -38,8 +40,6 @@ struct stm32_crc {
 	struct device    *dev;
 	void __iomem     *regs;
 	struct clk       *clk;
-	u8               pending_data[sizeof(u32)];
-	size_t           nb_pending_bytes;
 };
 
 struct stm32_crc_list {
@@ -59,7 +59,6 @@ struct stm32_crc_ctx {
 
 struct stm32_crc_desc_ctx {
 	u32    partial; /* crc32c: partial in first 4 bytes of that struct */
-	struct stm32_crc *crc;
 };
 
 static int stm32_crc32_cra_init(struct crypto_tfm *tfm)
@@ -99,25 +98,22 @@ static int stm32_crc_init(struct shash_desc *desc)
 	struct stm32_crc *crc;
 
 	spin_lock_bh(&crc_list.lock);
-	list_for_each_entry(crc, &crc_list.dev_list, list) {
-		ctx->crc = crc;
-		break;
-	}
+	crc = list_first_entry(&crc_list.dev_list, struct stm32_crc, list);
 	spin_unlock_bh(&crc_list.lock);
 
-	pm_runtime_get_sync(ctx->crc->dev);
+	pm_runtime_get_sync(crc->dev);
 
 	/* Reset, set key, poly and configure in bit reverse mode */
-	writel_relaxed(bitrev32(mctx->key), ctx->crc->regs + CRC_INIT);
-	writel_relaxed(bitrev32(mctx->poly), ctx->crc->regs + CRC_POL);
-	writel_relaxed(CRC_CR_RESET | CRC_CR_REVERSE, ctx->crc->regs + CRC_CR);
+	writel_relaxed(bitrev32(mctx->key), crc->regs + CRC_INIT);
+	writel_relaxed(bitrev32(mctx->poly), crc->regs + CRC_POL);
+	writel_relaxed(CRC_CR_RESET | CRC_CR_REV_IN_WORD | CRC_CR_REV_OUT,
+		       crc->regs + CRC_CR);
 
 	/* Store partial result */
-	ctx->partial = readl_relaxed(ctx->crc->regs + CRC_DR);
-	ctx->crc->nb_pending_bytes = 0;
+	ctx->partial = readl_relaxed(crc->regs + CRC_DR);
 
-	pm_runtime_mark_last_busy(ctx->crc->dev);
-	pm_runtime_put_autosuspend(ctx->crc->dev);
+	pm_runtime_mark_last_busy(crc->dev);
+	pm_runtime_put_autosuspend(crc->dev);
 
 	return 0;
 }
@@ -126,31 +122,49 @@ static int stm32_crc_update(struct shash_desc *desc, const u8 *d8,
 			    unsigned int length)
 {
 	struct stm32_crc_desc_ctx *ctx = shash_desc_ctx(desc);
-	struct stm32_crc *crc = ctx->crc;
-	u32 *d32;
-	unsigned int i;
+	struct stm32_crc_ctx *mctx = crypto_shash_ctx(desc->tfm);
+	struct stm32_crc *crc;
+
+	spin_lock_bh(&crc_list.lock);
+	crc = list_first_entry(&crc_list.dev_list, struct stm32_crc, list);
+	spin_unlock_bh(&crc_list.lock);
 
 	pm_runtime_get_sync(crc->dev);
 
-	if (unlikely(crc->nb_pending_bytes)) {
-		while (crc->nb_pending_bytes != sizeof(u32) && length) {
-			/* Fill in pending data */
-			crc->pending_data[crc->nb_pending_bytes++] = *(d8++);
+	/*
+	 * Restore previously calculated CRC for this context as init value
+	 * Restore polynomial configuration
+	 * Configure in register for word input data,
+	 * Configure out register in reversed bit mode data.
+	 */
+	writel_relaxed(bitrev32(ctx->partial), crc->regs + CRC_INIT);
+	writel_relaxed(bitrev32(mctx->poly), crc->regs + CRC_POL);
+	writel_relaxed(CRC_CR_RESET | CRC_CR_REV_IN_WORD | CRC_CR_REV_OUT,
+		       crc->regs + CRC_CR);
+
+	if (d8 != PTR_ALIGN(d8, sizeof(u32))) {
+		/* Configure for byte data */
+		writel_relaxed(CRC_CR_REV_IN_BYTE | CRC_CR_REV_OUT,
+			       crc->regs + CRC_CR);
+		while (d8 != PTR_ALIGN(d8, sizeof(u32)) && length) {
+			writeb_relaxed(*d8++, crc->regs + CRC_DR);
 			length--;
 		}
-
-		if (crc->nb_pending_bytes == sizeof(u32)) {
-			/* Process completed pending data */
-			writel_relaxed(*(u32 *)crc->pending_data,
-				       crc->regs + CRC_DR);
-			crc->nb_pending_bytes = 0;
-		}
+		/* Configure for word data */
+		writel_relaxed(CRC_CR_REV_IN_WORD | CRC_CR_REV_OUT,
+			       crc->regs + CRC_CR);
 	}
 
-	d32 = (u32 *)d8;
-	for (i = 0; i < length >> 2; i++)
-		/* Process 32 bits data */
-		writel_relaxed(*(d32++), crc->regs + CRC_DR);
+	for (; length >= sizeof(u32); d8 += sizeof(u32), length -= sizeof(u32))
+		writel_relaxed(*((u32 *)d8), crc->regs + CRC_DR);
+
+	if (length) {
+		/* Configure for byte data */
+		writel_relaxed(CRC_CR_REV_IN_BYTE | CRC_CR_REV_OUT,
+			       crc->regs + CRC_CR);
+		while (length--)
+			writeb_relaxed(*d8++, crc->regs + CRC_DR);
+	}
 
 	/* Store partial result */
 	ctx->partial = readl_relaxed(crc->regs + CRC_DR);
@@ -158,22 +172,6 @@ static int stm32_crc_update(struct shash_desc *desc, const u8 *d8,
 	pm_runtime_mark_last_busy(crc->dev);
 	pm_runtime_put_autosuspend(crc->dev);
 
-	/* Check for pending data (non 32 bits) */
-	length &= 3;
-	if (likely(!length))
-		return 0;
-
-	if ((crc->nb_pending_bytes + length) >= sizeof(u32)) {
-		/* Shall not happen */
-		dev_err(crc->dev, "Pending data overflow\n");
-		return -EINVAL;
-	}
-
-	d8 = (const u8 *)d32;
-	for (i = 0; i < length; i++)
-		/* Store pending data */
-		crc->pending_data[crc->nb_pending_bytes++] = *(d8++);
-
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
