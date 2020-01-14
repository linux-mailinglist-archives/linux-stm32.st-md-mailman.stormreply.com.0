Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA213ABA0
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 15:00:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E32F0C36B14;
	Tue, 14 Jan 2020 14:00:01 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 780C6C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 13:59:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d73so13885850wmd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 05:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vwz74GVw3RqN4zv8KJzc6WOhikJUNutjS1yfSHb85f4=;
 b=LRbl4YL7xfmzQ1ubfonhUq+riBVo7Eyg2CecNwz5sXvOhYgCzzU5f4KizEPmiziF4m
 D5jqMuwxJGXYuIgRLNfSlIMO+OvP0h0nyl6yQNA07t23ws19poi5JoP44FXZMMfT1blT
 T3g1hisBu9zecBZnslMBQqKKbPPRXL+YE/DWuBrcGUUkV79ew8rqEstIc7XJNGwgFxr4
 3iIX6iHzJCNHtV57Fr2N1q7nvQvfgoyA65gMyrBolpyP0gZSZgu2GCp/UZhTJaZcRuV4
 BIIJ1IGwfAmSGYq+Sz31qndyOjB9icWSWIwv2nO1LrhDw0SIB1FsPcGfwJW5AK9eqv2g
 ZHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vwz74GVw3RqN4zv8KJzc6WOhikJUNutjS1yfSHb85f4=;
 b=uilp69jFnzkINmMNKU4zcyGHXPXO6ocJ49IomA7/AMQB8OFsKa1/dW+CvyP0HBFfaO
 7s80pnAoGolf9JN7a3tvbGPkAUevir34DT9srU9X45520Iot0GIv/fna8Zu7CaJLRgOg
 oW3OunPvxIYRHqgStOtKsh7mR8G2uwG65JRhYINbhC9Aeggi0V5wjiM7qkRWVY29eY+0
 7r+bDhHB2dY6k6JlpRbDqDNMjTBJiTWta5FB/E3NbVcVnUjFWd74goEi1hKsJ5akaQMJ
 U+O1Pm3FsT916CbMQDd5eHC16LXiZ0Ke4Bm5ogaVtcinLevN/G/LJ+7GLQqznA1ajERG
 6G0w==
X-Gm-Message-State: APjAAAXTGXwSZikY8UD9vbV8G/SEx065B04JZZ4utW4sOCs08kq+9RbJ
 vQVTndl2ltKbfMfTimIEnk4=
X-Google-Smtp-Source: APXvYqy5IpziUXqSl8mzGqH49R4MKas13Mk/3/YX/GN9HtlxDzqVTADoOUc6wXiGyyxKvj7oJv29NA==
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr26421503wme.26.1579010399002; 
 Tue, 14 Jan 2020 05:59:59 -0800 (PST)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 4sm17854448wmg.22.2020.01.14.05.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 05:59:58 -0800 (PST)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: alexandre.torgue@st.com, davem@davemloft.net, herbert@gondor.apana.org.au,
 mcoquelin.stm32@gmail.com, mripard@kernel.org, wens@csie.org,
 iuliana.prodan@nxp.com, horia.geanta@nxp.com, aymen.sghaier@nxp.com
Date: Tue, 14 Jan 2020 14:59:32 +0100
Message-Id: <20200114135936.32422-7-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
References: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 06/10] crypto: engine: introduce ct
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

We will store the number of request in a batch in engine->ct.
This patch adds all loop to unprepare all requests of a batch.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 crypto/crypto_engine.c  | 30 ++++++++++++++++++------------
 include/crypto/engine.h |  2 ++
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/crypto/crypto_engine.c b/crypto/crypto_engine.c
index b72873550587..591dea5ddeec 100644
--- a/crypto/crypto_engine.c
+++ b/crypto/crypto_engine.c
@@ -28,6 +28,7 @@ static void crypto_finalize_request(struct crypto_engine *engine,
 	bool finalize_cur_req = false;
 	int ret;
 	struct crypto_engine_ctx *enginectx;
+	int i = 0;
 
 	spin_lock_irqsave(&engine->queue_lock, flags);
 	if (engine->cur_reqs[0].req == req)
@@ -35,17 +36,20 @@ static void crypto_finalize_request(struct crypto_engine *engine,
 	spin_unlock_irqrestore(&engine->queue_lock, flags);
 
 	if (finalize_cur_req) {
-		enginectx = crypto_tfm_ctx(engine->cur_reqs[0].req->tfm);
-		if (engine->cur_reqs[0].prepared &&
-		    enginectx->op.unprepare_request) {
-			ret = enginectx->op.unprepare_request(engine, engine->cur_reqs[0].req);
-			if (ret)
-				dev_err(engine->dev, "failed to unprepare request\n");
-		}
-		engine->cur_reqs[0].req->complete(engine->cur_reqs[0].req, err);
+		do {
+			enginectx = crypto_tfm_ctx(engine->cur_reqs[i].req->tfm);
+			if (engine->cur_reqs[i].prepared &&
+			    enginectx->op.unprepare_request) {
+				ret = enginectx->op.unprepare_request(engine, engine->cur_reqs[i].req);
+				if (ret)
+					dev_err(engine->dev, "failed to unprepare request\n");
+			}
+			engine->cur_reqs[i].prepared = false;
+			engine->cur_reqs[i].req->complete(engine->cur_reqs[i].req, err);
+		} while (++i < engine->ct);
 		spin_lock_irqsave(&engine->queue_lock, flags);
-		engine->cur_reqs[0].prepared = false;
-		engine->cur_reqs[0].req = NULL;
+		while (engine->ct-- > 0)
+			engine->cur_reqs[engine->ct].req = NULL;
 		spin_unlock_irqrestore(&engine->queue_lock, flags);
 	} else {
 		req->complete(req, err);
@@ -109,13 +113,14 @@ static void crypto_pump_requests(struct crypto_engine *engine,
 		goto out;
 	}
 
+	engine->ct = 0;
 	/* Get the fist request from the engine queue to handle */
 	backlog = crypto_get_backlog(&engine->queue);
 	async_req = crypto_dequeue_request(&engine->queue);
 	if (!async_req)
 		goto out;
 
-	engine->cur_reqs[0].req = async_req;
+	engine->cur_reqs[engine->ct].req = async_req;
 	if (backlog)
 		backlog->complete(backlog, -EINPROGRESS);
 
@@ -144,8 +149,9 @@ static void crypto_pump_requests(struct crypto_engine *engine,
 				ret);
 			goto req_err;
 		}
-		engine->cur_reqs[0].prepared = true;
+		engine->cur_reqs[engine->ct].prepared = true;
 	}
+	engine->ct++;
 	if (!enginectx->op.do_one_request) {
 		dev_err(engine->dev, "failed to do request\n");
 		ret = -EINVAL;
diff --git a/include/crypto/engine.h b/include/crypto/engine.h
index 362134e226f4..021136a47b93 100644
--- a/include/crypto/engine.h
+++ b/include/crypto/engine.h
@@ -50,6 +50,7 @@ struct cur_req {
  * @priv_data: the engine private data
  * @rmax:	The number of request which can be processed in one batch
  * @cur_reqs: 	A list for requests to be processed
+ * @ct:		How many requests will be handled in one batch
  */
 struct crypto_engine {
 	char			name[ENGINE_NAME_LEN];
@@ -73,6 +74,7 @@ struct crypto_engine {
 	void				*priv_data;
 	int 				rmax;
 	struct cur_req 			*cur_reqs;
+	int ct;
 };
 
 /*
-- 
2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
