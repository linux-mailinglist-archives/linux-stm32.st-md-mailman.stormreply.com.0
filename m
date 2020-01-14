Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC513ABA1
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 15:00:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EECDCC36B0C;
	Tue, 14 Jan 2020 14:00:01 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6628C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 14:00:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t14so13842670wmi.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 06:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qS8cmFG129sXx7XLwvT27GqZEqHpjOOs5rdHnFSHiU=;
 b=IZGzjrkKewPPH+1qPChWS+BhLPaglsstZcFbIFMqVrWlnEyYo4D//EwlO073t5dWRt
 wsEUkhhhPmT8ar86gm41TZiFZdKhJ2hH3xwEbn3ADew+ZParRG4n8k5o10jGL1LVRUU2
 BrBFsb3E1LCR5wy9kjfteNYmsmUS3a6zFMW85ywB2QE/McqEpFsR6LhS7Q4jCZc/iMUv
 PlIJAqPajK75h7F0rRdhNWoe63r2OhG9YYn/0wMxi/hX/wkIBchGVH/aHmOKmpMenkfJ
 zmjXb4+u1GtLTbLFq3gs2YUvR/hG+0pZd1Z57g5j0ZHtScUCIuDBo32GjFTElntjiR5m
 nDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qS8cmFG129sXx7XLwvT27GqZEqHpjOOs5rdHnFSHiU=;
 b=bCBHKY9cMeYq8BV4GJrmDoomMhY+L2OA8iKGsP5bfROSn7AriIoQ8Qq/37ZrBQKkqg
 TfXApLQcAgC+9wO99Q61BOjTxQ/UscvWKB4ZmJmET9AKGbp7fX6v2yV/3neWXcR1IWQM
 MHnG4ervv+u3epSOyoZRsgCNR6rzsJ9V+GVXihDCVs36l7muArPCjLkXFESYc/QhrLCu
 1ktBJHbRZ2c4J3cioHQX4wFZG3bN5Z148sMH1oEPkgk0m25KlBHO4TSuFvRUt87VGxG3
 MIFZa38IPIJnRE+BObdeVUP84smjNU7qg9tqw5sbyp3Kpgzm/4pgrL8AAH6htpvmy3F3
 rtBw==
X-Gm-Message-State: APjAAAVu10ffqHKvmYrJP7fpirWsX4VpRunY3/lDCxg7XFvDsxtlrIID
 CvYw0N1Vtsm2JxtkZKveBug=
X-Google-Smtp-Source: APXvYqww13Rw2lNgkQnVrqZqhVvYRprXFy6sm0G6g1K6ZSDEAxdwdk/Iiwdc3bXXKo2jLD2F6nJdKg==
X-Received: by 2002:a1c:a702:: with SMTP id q2mr27788126wme.6.1579010400417;
 Tue, 14 Jan 2020 06:00:00 -0800 (PST)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 4sm17854448wmg.22.2020.01.14.05.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 05:59:59 -0800 (PST)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: alexandre.torgue@st.com, davem@davemloft.net, herbert@gondor.apana.org.au,
 mcoquelin.stm32@gmail.com, mripard@kernel.org, wens@csie.org,
 iuliana.prodan@nxp.com, horia.geanta@nxp.com, aymen.sghaier@nxp.com
Date: Tue, 14 Jan 2020 14:59:33 +0100
Message-Id: <20200114135936.32422-8-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
References: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 07/10] crypto: sun8i-ce: handle slot > 0
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

Handle the fact a slot could be different than 0.
This imply:
- linking two task via next
- set interrupt flag just before running the batch in the last task.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 8 +++++++-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 9c1f6c9eaaf9..d56c992fbf93 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -99,6 +99,9 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	int slot = 0;
 	int err = 0;
 
+	if (slot < 0 || slot >= MAXTASK)
+		return -EINVAL;
+
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.skcipher);
 
 	dev_dbg(ce->dev, "%s %s %u %x IV(%p %u) key=%u\n", __func__,
@@ -120,8 +123,11 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 
 	cet->t_id = cpu_to_le32(flow);
 	common = ce->variant->alg_cipher[algt->ce_algo_id];
-	common |= rctx->op_dir | CE_COMM_INT;
+	common |= rctx->op_dir;
 	cet->t_common_ctl = cpu_to_le32(common);
+	if (slot > 0)
+		chan->tl[slot - 1].next = cpu_to_le32(chan->t_phy + 176 * slot);
+
 	/* CTS and recent CE (H6) need length in bytes, in word otherwise */
 	if (ce->variant->has_t_dlen_in_bytes)
 		cet->t_dlen = cpu_to_le32(areq->cryptlen);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index bd355f4b95f3..39bf684c0ff5 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -106,6 +106,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	ce->chanlist[flow].stat_req++;
 #endif
+	/* mark last one */
+	ce->chanlist[flow].tl[ce->chanlist[flow].engine->ct - 1].t_common_ctl |= cpu_to_le32(CE_COMM_INT);
 
 	mutex_lock(&ce->mlock);
 
-- 
2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
