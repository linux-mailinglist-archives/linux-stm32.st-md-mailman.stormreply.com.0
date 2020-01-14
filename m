Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0817313AB9D
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 15:00:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C58F9C36B10;
	Tue, 14 Jan 2020 13:59:59 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E653C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 13:59:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d139so2389860wmd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 05:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjPV4Ha5BYE0MCX17Wl6xnLI6QAy5DnWASz8VTCVvYQ=;
 b=EUO5m76UvmdUwWtNzcIKhgu1b3wsytiLJXK+nCU8Jd+QLUFj3sjQ6tp4GDPLdz01Tk
 CqD2W85UbyrcCOMSjLf/dFpOusOr7BW9TGliVE1RP6bXsB8Sxe8ahdtC2GAFpvVWPHtu
 huctNx72GCsTAiGkF1SCKWPEXR1HgUR4pAxwdKl8372GYVvlcoKFEIjoubnexI0StKy6
 x656qiDvIBYjjnHT10RUOQDzOjyDF4tIiOjDG3EtntrJNHGhnm/SU9hhc3qJmCNhKtuH
 mUG4dI9ncJ9bO9nTWh1qxkJkNIl9HucXdHS5WgPs9si0eKsDk+9KCo/JNtoxvjSE9hva
 LINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjPV4Ha5BYE0MCX17Wl6xnLI6QAy5DnWASz8VTCVvYQ=;
 b=mmo6MfbmoEAwl69bz8EhFyHyWi+/EUPU5GssBNt5ltSoCxUf/ibbhD3LzhjEKVa1Hl
 nprFN9tkj1ZS/sSFGlJ8x8ZujDyVmU5PR5X05oKNdLnHC/2FU5I+9izEUxX0LS6vzwXd
 F7y3KbaeX4WjfbitxeLBquOVE5SK544CFOhiGzdwOCeNWPF1aSYs0IPmoDvJfTmkiD2R
 KxAi9xyW+muzroQ/+M3gxO47OebcveduTGUTAy3o5MRru3A/Zp8JJ5d7VSWlgiyxdBs4
 2aln8sCFyN6jj2KZCm4BXNUw6ed6naR1TCk3xgLH/cojjWWA/nwuZj5X0NvnfyxvUoGT
 ldvg==
X-Gm-Message-State: APjAAAUJy2VEGMQJfXGMQpnqp/9nRQdHUExcQtsTWb9OpByuwjqLE+t4
 2q1yQljzozyo1wkxUnbD+eiiYiWn
X-Google-Smtp-Source: APXvYqzVCraPGaXbAoGqhP1ygDTY7R+QHVftrzEYOGKAwqSEbThaIsz0cQp5wFfFNd9DXBamDMmh5Q==
X-Received: by 2002:a1c:62c1:: with SMTP id
 w184mr28138545wmb.150.1579010396021; 
 Tue, 14 Jan 2020 05:59:56 -0800 (PST)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 4sm17854448wmg.22.2020.01.14.05.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 05:59:55 -0800 (PST)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: alexandre.torgue@st.com, davem@davemloft.net, herbert@gondor.apana.org.au,
 mcoquelin.stm32@gmail.com, mripard@kernel.org, wens@csie.org,
 iuliana.prodan@nxp.com, horia.geanta@nxp.com, aymen.sghaier@nxp.com
Date: Tue, 14 Jan 2020 14:59:30 +0100
Message-Id: <20200114135936.32422-5-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
References: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 04/10] crypto: sun8i-ce: introduce the
	slot number
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

This patch adds the slot position, for choosing which task in the task
list should be prepared/unprepared.
The slot is for the moment is always 0 until the infrastructure will handle
non 0 value.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 6 ++++--
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 401f39f144ea..9c1f6c9eaaf9 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -96,6 +96,7 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	int flow, i;
 	int nr_sgs = 0;
 	int nr_sgd = 0;
+	int slot = 0;
 	int err = 0;
 
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.skcipher);
@@ -114,7 +115,7 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 
 	chan = &ce->chanlist[flow];
 
-	cet = chan->tl;
+	cet = &chan->tl[slot];
 	memset(cet, 0, sizeof(struct ce_task));
 
 	cet->t_id = cpu_to_le32(flow);
@@ -301,11 +302,12 @@ static int sun8i_ce_cipher_unprepare(struct crypto_engine *engine, void *async_r
 	unsigned int ivsize, offset;
 	int nr_sgs = rctx->nr_sgs;
 	int nr_sgd = rctx->nr_sgd;
+	int slot = 0;
 	int flow;
 
 	flow = rctx->flow;
 	chan = &ce->chanlist[flow];
-	cet = chan->tl;
+	cet = &chan->tl[slot];
 	ivsize = crypto_skcipher_ivsize(tfm);
 
 	if (areq->src == areq->dst) {
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index e8bf7bf31061..bd355f4b95f3 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -120,7 +120,7 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 	/* Be sure all data is written before enabling the task */
 	wmb();
 
-	v = 1 | (ce->chanlist[flow].tl->t_common_ctl & 0x7F) << 8;
+	v = 1 | (ce->chanlist[flow].tl[0].t_common_ctl & 0x7F) << 8;
 	writel(v, ce->base + CE_TLR);
 	mutex_unlock(&ce->mlock);
 
-- 
2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
