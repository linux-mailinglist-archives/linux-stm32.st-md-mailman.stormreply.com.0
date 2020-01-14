Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DCD13ABA4
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 15:00:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3417C36B13;
	Tue, 14 Jan 2020 14:00:07 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4F50C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 14:00:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so13892095wmj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 06:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mmCo0cmcYxTYUl0HTh9b5uPHQjBF+Ornrl4fpC6nIuw=;
 b=YwKwklKFwVrhQTbq9+emPqf95apR1314k05ofi1R4X4ecmLMYVeTbhUyQp8rc6JOOE
 1OtSdz22N7qTe1XPnouOPYwL70jWyR9WzmlK2ZXg2p4vGpwHbn4BMRc+jo0MBgwO6T0l
 kwj1Qo0YWV0mSI6WuIA9JmgmgulgXFJC/X0mzv2VstuVM/XkmTbkjnaL13iIDmY92It8
 5oNt9CMr3GzgOVZqxWqargG03QKjOuUSUMJbmcmPXGbcmT0gddtiaVxm7R4gWVDD353H
 OJ5ZNctjqERrdhzXqK1zFZdA3CDKpvZ79XSCt2HQ6upbF63gIHwk+/f4B7j0TroYbesC
 L5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mmCo0cmcYxTYUl0HTh9b5uPHQjBF+Ornrl4fpC6nIuw=;
 b=Vxj633WTQ7c5sKXvKv4Kp+Oak5+CK3arTS3BGNhAJgzTLqebIS1w/Lx8Gdhzf58E9h
 3Zu6jDPfYRb3mEam1cARoa3UZkt6vjU3ELlf4qJ22T+DMPAG7raszDLj9eruNZV9fvmF
 wu/3tsQ2DVP0vDjXbhlB6BWkve0BEiCM2+c72LHes9s6D62mYKnvx3XuMG8JsBNirZ9C
 MMffNzB4CRQe3WmV9Cc0qHeAz/OMRuacJjiFbddMLwtMb8a9hZMS08ezrrNDz1OO2zv2
 5lWdb3WfScpNFfEQwGijCWBy386AkMLCmwn3YPfKbRLsAhZtwfod+peuiB4Dt5NkMngm
 WHOQ==
X-Gm-Message-State: APjAAAWXxq/qjY1t09zqIW8XoBygQf4MVYgzmmuh33uSulxnf2q4MV6v
 gvw1CBSues8mIpegCG9py0Q=
X-Google-Smtp-Source: APXvYqxIi99Bpxvcwct69pL122PlCYsc6pFqFmQLsPv1kKKkDRC+0KM4vq6kSF3tJBiUx5oECNcNKw==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr27249334wmj.7.1579010405396;
 Tue, 14 Jan 2020 06:00:05 -0800 (PST)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 4sm17854448wmg.22.2020.01.14.06.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 06:00:04 -0800 (PST)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: alexandre.torgue@st.com, davem@davemloft.net, herbert@gondor.apana.org.au,
 mcoquelin.stm32@gmail.com, mripard@kernel.org, wens@csie.org,
 iuliana.prodan@nxp.com, horia.geanta@nxp.com, aymen.sghaier@nxp.com
Date: Tue, 14 Jan 2020 14:59:36 +0100
Message-Id: <20200114135936.32422-11-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
References: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 10/10] crypto: sun8i-ce: use the new batch
	mechanism
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

Now all infrastructure to batch request are in place, it is time to use
it.
Introduce some debug for it also.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c    | 14 ++++++++------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c  |  9 ++++++---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h       |  2 ++
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 41d18c18d1d1..fe5374788304 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -103,20 +103,22 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.skcipher);
 
-	dev_dbg(ce->dev, "%s %s %u %x IV(%p %u) key=%u\n", __func__,
+	dev_dbg(ce->dev, "%s %s %u %x IV(%p %u) key=%u slot=%d\n", __func__,
 		crypto_tfm_alg_name(areq->base.tfm),
 		areq->cryptlen,
 		rctx->op_dir, areq->iv, crypto_skcipher_ivsize(tfm),
-		op->keylen);
-
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-	algt->stat_req++;
-#endif
+		op->keylen, slot);
 
 	flow = rctx->flow;
 
 	chan = &ce->chanlist[flow];
 
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
+	algt->stat_req++;
+	if (chan->engine->ct + 1 > chan->tmax)
+		chan->tmax = chan->engine->ct + 1;
+#endif
+
 	cet = &chan->tl[slot];
 	memset(cet, 0, sizeof(struct ce_task));
 
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 39bf684c0ff5..7cd98c227357 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -104,7 +104,7 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 	int err = 0;
 
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-	ce->chanlist[flow].stat_req++;
+	ce->chanlist[flow].stat_req += ce->chanlist[flow].engine->ct;
 #endif
 	/* mark last one */
 	ce->chanlist[flow].tl[ce->chanlist[flow].engine->ct - 1].t_common_ctl |= cpu_to_le32(CE_COMM_INT);
@@ -287,7 +287,10 @@ static int sun8i_ce_dbgfs_read(struct seq_file *seq, void *v)
 	int i;
 
 	for (i = 0; i < MAXFLOW; i++)
-		seq_printf(seq, "Channel %d: nreq %lu\n", i, ce->chanlist[i].stat_req);
+		seq_printf(seq, "Channel %d: nreq %lu tmax %d eqlen=%d/%d\n", i,
+			   ce->chanlist[i].stat_req, ce->chanlist[i].tmax,
+			   ce->chanlist[i].engine->queue.qlen,
+			   ce->chanlist[i].engine->queue.max_qlen);
 
 	for (i = 0; i < ARRAY_SIZE(ce_algs); i++) {
 		if (!ce_algs[i].ce)
@@ -345,7 +348,7 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
 	for (i = 0; i < MAXFLOW; i++) {
 		init_completion(&ce->chanlist[i].complete);
 
-		ce->chanlist[i].engine = crypto_engine_alloc_init(ce->dev, true);
+		ce->chanlist[i].engine = crypto_engine_alloc_init2(ce->dev, true, MAXTASK, MAXTASK * 2);
 		if (!ce->chanlist[i].engine) {
 			dev_err(ce->dev, "Cannot allocate engine\n");
 			i--;
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 2d3325a13bf1..22bb15fea476 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -135,6 +135,7 @@ struct ce_task {
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
  * @stat_req:	number of request done by this flow
+ * @tmax:	The maximum number of tasks done in one batch
  */
 struct sun8i_ce_flow {
 	struct crypto_engine *engine;
@@ -145,6 +146,7 @@ struct sun8i_ce_flow {
 	struct ce_task *tl;
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	unsigned long stat_req;
+	int tmax;
 #endif
 };
 
-- 
2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
