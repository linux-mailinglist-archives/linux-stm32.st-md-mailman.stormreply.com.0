Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B43DA7C6A7B
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 12:08:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67489C6C838;
	Thu, 12 Oct 2023 10:08:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B878EC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 10:08:39 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so718123f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697105319; x=1697710119;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+fXPfuQFbOLDaAm3isa5Mto3s8GQTNxK9ZpHoavLmQ=;
 b=Rk0t4Swj1+ljRzwkqeRLUy2mrXPQ5hQYBzxV6VQjTSEVk1mU6wq6U/0PMNaZZCb9eV
 g/bRJTuCsmbNY3bXI0XCsbmb4jx8SW6iysiP8Zc6+ypx/jt1uyyUr8NBUVq0INvevTn8
 knhZh5dgMragz0Snirg0lrI1Z8pA+xgoegubZhvgPzJDSTogI4xHwHOyZ1if1RSQ+iEv
 +YstbSPQbgMuRtNFdifa7cB/pWjkTYMxmPb8XgNfAICX+OPyVRWeusH/17LY53x2EVd9
 TMXJWddXfZD2mPo+qOOzyMrsFkqk7q/tiM4jlV1FUIOmJovGpFFjR2PPbhKJEHeQdUoP
 tj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697105319; x=1697710119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+fXPfuQFbOLDaAm3isa5Mto3s8GQTNxK9ZpHoavLmQ=;
 b=m718il8QoSH/jqvYiEHxCCn35QhbinSwr5ZoRJhxLm+gAbZ9RJcyxgzZRPYW5ddR29
 5jYAB9oqRNag/7aEzgugUjX/CC6ChGEIHXn3ZwrPdvEmYUPt9q6rSNorlmsZztHWEj+e
 /b7R5gx/aqoU9g61Z6byhxVKTkAStdAC7xoYo2DR8/m/G1YamIWIjhSCcWBuvHodz3kf
 vr7idTTBP/18QEyHCqaIBGw46xs8JvwjnlDcpEfGRhNvvLRts+motJHbc7w78DCl3WLS
 eKS1iZVzDD6BHVhbzRHnRxGoX9J0WBAv0DdSZqexoFd+bY1KyitqCLOP/jkpoP354IMq
 slog==
X-Gm-Message-State: AOJu0YweiNVExphxHF9tjVnS2EcCpKuq5BfaNg2bi2JeNJaVWFFZmLXp
 7+dRNrKE5wz/ldAv6DmzHpo=
X-Google-Smtp-Source: AGHT+IHltHLJC8hhVtlccIc/Xfw4D1hVrWKY3835qupMDM2NnVVGZetkTqBYcRWK9c3pUY4nLHFDAQ==
X-Received: by 2002:a5d:6e85:0:b0:323:10b8:543e with SMTP id
 k5-20020a5d6e85000000b0032310b8543emr19294869wrz.49.1697105319104; 
 Thu, 12 Oct 2023 03:08:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 dj16-20020a0560000b1000b003198a9d758dsm922737wrb.78.2023.10.12.03.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:08:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Raju Rangoju <rajur@chelsio.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Simon Horman <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jiri Pirko <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Thu, 12 Oct 2023 12:04:58 +0200
Message-Id: <20231012100459.6158-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231012100459.6158-1-ansuelsmth@gmail.com>
References: <20231012100459.6158-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v2 3/4] net: stmmac: move TX timer
	arm after DMA enable
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

Move TX timer arm call after DMA interrupt is enabled again.

The TX timer arm function changed logic and now is skipped if a napi is
already scheduled. By moving the TX timer arm call after DMA is enabled,
we permit to correctly skip if a DMA interrupt has been fired and a napi
has been scheduled again.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5124ee87286c..b2f63f12aee5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2545,7 +2545,8 @@ static void stmmac_bump_dma_threshold(struct stmmac_priv *priv, u32 chan)
  * @queue: TX queue index
  * Description: it reclaims the transmit resources after transmission completes.
  */
-static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue)
+static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue
+			   bool *pending_packets)
 {
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
@@ -2706,7 +2707,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue)
 
 	/* We still have pending packets, let's call for a new scheduling */
 	if (tx_q->dirty_tx != tx_q->cur_tx)
-		stmmac_tx_timer_arm(priv, queue);
+		*pending_packets = true;
 
 	flags = u64_stats_update_begin_irqsave(&txq_stats->syncp);
 	txq_stats->tx_packets += tx_packets;
@@ -5572,6 +5573,7 @@ static int stmmac_napi_poll_tx(struct napi_struct *napi, int budget)
 		container_of(napi, struct stmmac_channel, tx_napi);
 	struct stmmac_priv *priv = ch->priv_data;
 	struct stmmac_txq_stats *txq_stats;
+	bool pending_packets = false;
 	u32 chan = ch->index;
 	unsigned long flags;
 	int work_done;
@@ -5581,7 +5583,7 @@ static int stmmac_napi_poll_tx(struct napi_struct *napi, int budget)
 	txq_stats->napi_poll++;
 	u64_stats_update_end_irqrestore(&txq_stats->syncp, flags);
 
-	work_done = stmmac_tx_clean(priv, budget, chan);
+	work_done = stmmac_tx_clean(priv, budget, chan, &pending_packets);
 	work_done = min(work_done, budget);
 
 	if (work_done < budget && napi_complete_done(napi, work_done)) {
@@ -5592,6 +5594,10 @@ static int stmmac_napi_poll_tx(struct napi_struct *napi, int budget)
 		spin_unlock_irqrestore(&ch->lock, flags);
 	}
 
+	/* TX still have packet to handle, check if we need to arm tx timer */
+	if (pending_packets)
+		stmmac_tx_timer_arm(priv, chan);
+
 	return work_done;
 }
 
@@ -5600,6 +5606,7 @@ static int stmmac_napi_poll_rxtx(struct napi_struct *napi, int budget)
 	struct stmmac_channel *ch =
 		container_of(napi, struct stmmac_channel, rxtx_napi);
 	struct stmmac_priv *priv = ch->priv_data;
+	bool tx_pending_packets = false;
 	int rx_done, tx_done, rxtx_done;
 	struct stmmac_rxq_stats *rxq_stats;
 	struct stmmac_txq_stats *txq_stats;
@@ -5616,7 +5623,7 @@ static int stmmac_napi_poll_rxtx(struct napi_struct *napi, int budget)
 	txq_stats->napi_poll++;
 	u64_stats_update_end_irqrestore(&txq_stats->syncp, flags);
 
-	tx_done = stmmac_tx_clean(priv, budget, chan);
+	tx_done = stmmac_tx_clean(priv, budget, chan, &tx_pending_packets);
 	tx_done = min(tx_done, budget);
 
 	rx_done = stmmac_rx_zc(priv, budget, chan);
@@ -5641,6 +5648,10 @@ static int stmmac_napi_poll_rxtx(struct napi_struct *napi, int budget)
 		spin_unlock_irqrestore(&ch->lock, flags);
 	}
 
+	/* TX still have packet to handle, check if we need to arm tx timer */
+	if (tx_pending_packets)
+		stmmac_tx_timer_arm(priv, chan);
+
 	return min(rxtx_done, budget - 1);
 }
 
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
