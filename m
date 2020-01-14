Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F0713ABA3
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 15:00:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9ABCC36B0B;
	Tue, 14 Jan 2020 14:00:06 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6537BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 14:00:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so12271766wrw.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 06:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lxb7PN4lvjObtQ59KMU2hHjHYfZBsU9IrbvtHskV7n0=;
 b=CMlWfiRvaRRJU+hOQ4WPokjIT8GHSX3vkbMyfsBc8DCF2hmxmKbLRl3XuVhkhou0oY
 8ildadcB1t+iC3etvIdUbg1E1UntznuFyodZFJWT/fKIama5xaeApXEASHJT7JgN2ozv
 QCnT8RndunnruzJfnh/71PB8HtxvyO7XJKZnUF7uB+UEQl7A2erDumW8cUH7LVKRRVSc
 clHmeeo+WxvTbERdluTb53uZ8A62/xxsCsI0ksjNmkSLPYzaqbl3ZsQ8rb2gQr+2OhwQ
 umwgvNEbrkvZ6ozlVfbhYTa8lSeqFFXS2E6ACT6PSnFlW92eK2gHkYubDtNs9tVVSPeA
 TMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lxb7PN4lvjObtQ59KMU2hHjHYfZBsU9IrbvtHskV7n0=;
 b=oukwAsuVzAv9BJvA4ZfYNjWHK69MyY5PhcN7pEdrSTKF1w/Mde/0OjWcERHxaDhCrW
 3t3Ou4Ouu+6agfTwowDWZDq+OfoGZQcCBdonK/s4T8rTfalhV4rIuu7rPkM2P1S0zrhe
 +ND7cf6eRW98oMUcnbfk0/hc0ZaeMS7HbDdtnetOozclBEVloJHfTuWe27Cbyyl/XTj3
 CakeRgd6yb0ODO6AArlZWyzYWKeYIyumuIq5MNd7w3wnecmHP4bN8/sxBMljv2+E380l
 Q43W98M1UFwxePShAdQkJmWs2O053gT6bbXAiwHWOKw8+TFta6Cc6PHbfAWFhcHFzsah
 MolQ==
X-Gm-Message-State: APjAAAU9OLzT8J/DiM6b0j5oi+tDTIJat8w9VUpXHNiBZEJb7j2eaUQM
 DvS572b1nBVVmKaGM/L/Afg=
X-Google-Smtp-Source: APXvYqxq5XivXy1rjI7OaJJ+olOKx4Pgt9tO+9ND8MTyENMvSQ3szmCgKQXFPKTU/w3I7VW7kOqisA==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr26245596wrs.237.1579010403794; 
 Tue, 14 Jan 2020 06:00:03 -0800 (PST)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 4sm17854448wmg.22.2020.01.14.06.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 06:00:03 -0800 (PST)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: alexandre.torgue@st.com, davem@davemloft.net, herbert@gondor.apana.org.au,
 mcoquelin.stm32@gmail.com, mripard@kernel.org, wens@csie.org,
 iuliana.prodan@nxp.com, horia.geanta@nxp.com, aymen.sghaier@nxp.com
Date: Tue, 14 Jan 2020 14:59:35 +0100
Message-Id: <20200114135936.32422-10-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
References: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 09/10] crypto: engine: permit to batch
	requests
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

Now everything is ready, this patch permits to choose the number of
request to batch.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 crypto/crypto_engine.c  | 32 +++++++++++++++++++++++++++-----
 include/crypto/engine.h |  2 ++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/crypto/crypto_engine.c b/crypto/crypto_engine.c
index e23a398ba330..e9cd9ec9a732 100644
--- a/crypto/crypto_engine.c
+++ b/crypto/crypto_engine.c
@@ -114,6 +114,7 @@ static void crypto_pump_requests(struct crypto_engine *engine,
 	}
 
 	engine->ct = 0;
+retry:
 	/* Get the fist request from the engine queue to handle */
 	backlog = crypto_get_backlog(&engine->queue);
 	async_req = crypto_dequeue_request(&engine->queue);
@@ -151,7 +152,10 @@ static void crypto_pump_requests(struct crypto_engine *engine,
 		}
 		engine->cur_reqs[engine->ct].prepared = true;
 	}
-	engine->ct++;
+	if (++engine->ct < engine->rmax && engine->queue.qlen > 0) {
+		spin_lock_irqsave(&engine->queue_lock, flags);
+		goto retry;
+	}
 	if (!enginectx->op.do_one_request) {
 		dev_err(engine->dev, "failed to do request\n");
 		ret = -EINVAL;
@@ -393,15 +397,18 @@ int crypto_engine_stop(struct crypto_engine *engine)
 EXPORT_SYMBOL_GPL(crypto_engine_stop);
 
 /**
- * crypto_engine_alloc_init - allocate crypto hardware engine structure and
+ * crypto_engine_alloc_init2 - allocate crypto hardware engine structure and
  * initialize it.
  * @dev: the device attached with one hardware engine
  * @rt: whether this queue is set to run as a realtime task
+ * @rmax: The number of request that the engine can batch in one
+ * @qlen: The size of the crypto queue
  *
  * This must be called from context that can sleep.
  * Return: the crypto engine structure on success, else NULL.
  */
-struct crypto_engine *crypto_engine_alloc_init(struct device *dev, bool rt)
+struct crypto_engine *crypto_engine_alloc_init2(struct device *dev, bool rt,
+						int rmax, int qlen)
 {
 	struct sched_param param = { .sched_priority = MAX_RT_PRIO / 2 };
 	struct crypto_engine *engine;
@@ -421,12 +428,12 @@ struct crypto_engine *crypto_engine_alloc_init(struct device *dev, bool rt)
 	engine->priv_data = dev;
 	snprintf(engine->name, sizeof(engine->name),
 		 "%s-engine", dev_name(dev));
-	engine->rmax = 1;
+	engine->rmax = rmax;
 	engine->cur_reqs = devm_kzalloc(dev, sizeof(struct cur_req) * engine->rmax, GFP_KERNEL);
 	if (!engine->cur_reqs)
 		return NULL;
 
-	crypto_init_queue(&engine->queue, CRYPTO_ENGINE_MAX_QLEN);
+	crypto_init_queue(&engine->queue, qlen);
 	spin_lock_init(&engine->queue_lock);
 
 	engine->kworker = kthread_create_worker(0, "%s", engine->name);
@@ -443,6 +450,21 @@ struct crypto_engine *crypto_engine_alloc_init(struct device *dev, bool rt)
 
 	return engine;
 }
+EXPORT_SYMBOL_GPL(crypto_engine_alloc_init2);
+
+/**
+ * crypto_engine_alloc_init - allocate crypto hardware engine structure and
+ * initialize it.
+ * @dev: the device attached with one hardware engine
+ * @rt: whether this queue is set to run as a realtime task
+ *
+ * This must be called from context that can sleep.
+ * Return: the crypto engine structure on success, else NULL.
+ */
+struct crypto_engine *crypto_engine_alloc_init(struct device *dev, bool rt)
+{
+	return crypto_engine_alloc_init2(dev, rt, 1, CRYPTO_ENGINE_MAX_QLEN);
+}
 EXPORT_SYMBOL_GPL(crypto_engine_alloc_init);
 
 /**
diff --git a/include/crypto/engine.h b/include/crypto/engine.h
index 55d3dbc2498c..fe0dfea8bf07 100644
--- a/include/crypto/engine.h
+++ b/include/crypto/engine.h
@@ -115,6 +115,8 @@ void crypto_finalize_skcipher_request(struct crypto_engine *engine,
 int crypto_engine_start(struct crypto_engine *engine);
 int crypto_engine_stop(struct crypto_engine *engine);
 struct crypto_engine *crypto_engine_alloc_init(struct device *dev, bool rt);
+struct crypto_engine *crypto_engine_alloc_init2(struct device *dev, bool rt,
+						int rmax, int qlen);
 int crypto_engine_exit(struct crypto_engine *engine);
 
 #endif /* _CRYPTO_ENGINE_H */
-- 
2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
