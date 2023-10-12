Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7DF7C6A7A
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 12:08:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DE58C6B45E;
	Thu, 12 Oct 2023 10:08:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 808CDC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 10:08:38 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so736132f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697105318; x=1697710118;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIsjeim7XUbQUze6bD56uxG9gvOx0giE5m3S+sNf+CI=;
 b=GJJEbYHFm/B0DIjV8467brNJMGKeTNsraGtdSkbtP9CcfN2lHArYqsr0SSyWffgi86
 Cz5kfrtES5C+Hpo9YFYQiFRl6Dkk7lFTr7t20i3x7EG4Ty6ibwfvPvkOz13/79Vw83yy
 u7mau4Qcx6Ok2a7Qzddb0EyjhSWIt9gHLPJMwByBe/qlDoMeC5YHAn89Ozwpn8MxTlGA
 ydQVPJS0BWevf/EXTMWYo7jUDVfjT4zDU+rxPi9Dv1Q8elXe2xZjsAAXngIXmLwaZ5Xw
 vfLFvZTYWebhjBtrQswn3veUg7HymOeeSvcyj2SjchY8CsNA5H6bd02dEHsMk3hchBfN
 9tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697105318; x=1697710118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zIsjeim7XUbQUze6bD56uxG9gvOx0giE5m3S+sNf+CI=;
 b=KynzqE82aKOALjzPBpdT400nXLgS9djGjEqDzgOeZQlNOzHSwgUOfg07to5w0Ik9c+
 ver+72VtfPLm3RocaviN+3skok4oInBSdzfXV7OeZ6PRxXp6oQKKKuPClOB8DQrSX62t
 ptNsQv1OEeBlJ+aDDgcwuDfHGCR+sa+UsSMhcLovCz2r5IapE+WR6LTVfqWmB5jhMB14
 4trAiIOEJZMCCnUVjjP04id3705RNQ6N4L+1FYow84chctEmn1B6pVCDNGiOMLDknkmR
 v6tljNv5oJjrty+TpoHw8rHIo242yNp4hpk5arEO1EI70VoK5uUG1e/otU73KXaPqKPN
 KIDQ==
X-Gm-Message-State: AOJu0YykxHoEZTq6EOpqJZ2FuUoLK4j1aHA92i4eCFBnNFrzmN+gC59d
 k5HqC8DjwdxdVEizyQJP6bs=
X-Google-Smtp-Source: AGHT+IHpdKVnN91CglYdASUt5zwHQXrdDBnHHb+85IX/ZvGINItZUurXQ7kVAD8loaEYbKmTZ81veA==
X-Received: by 2002:a05:6000:4e1:b0:31f:ea18:6f6b with SMTP id
 cr1-20020a05600004e100b0031fea186f6bmr20124897wrb.19.1697105317932; 
 Thu, 12 Oct 2023 03:08:37 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 dj16-20020a0560000b1000b003198a9d758dsm922737wrb.78.2023.10.12.03.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:08:37 -0700 (PDT)
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
Date: Thu, 12 Oct 2023 12:04:57 +0200
Message-Id: <20231012100459.6158-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231012100459.6158-1-ansuelsmth@gmail.com>
References: <20231012100459.6158-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v2 2/4] net: stmmac: improve TX timer
	arm logic
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

There is currently a problem with the TX timer getting armed multiple
unnecessary times causing big performance regression on some device that
suffer from heavy handling of hrtimer rearm.

The use of the TX timer is an old implementation that predates the napi
implementation and the interrupt enable/disable handling.

Due to stmmac being a very old code, the TX timer was never evaluated
again with this new implementation and was kept there causing
performance regression. The performance regression started to appear
with kernel version 4.19 with 8fce33317023 ("net: stmmac: Rework coalesce
timer and fix multi-queue races") where the timer was reduced to 1ms
causing it to be armed 40 times more than before.

Decreasing the timer made the problem more present and caused the
regression in the other of 600-700mbps on some device (regression where
this was notice is ipq806x).

The problem is in the fact that handling the hrtimer on some target is
expensive and recent kernel made the timer armed much more times.
A solution that was proposed was reverting the hrtimer change and use
mod_timer but such solution would still hide the real problem in the
current implementation.

To fix the regression, apply some additional logic and skip arming the
timer when not needed.

Arm the timer ONLY if a napi is not already scheduled. Running the timer
is redundant since the same function (stmmac_tx_clean) will run in the
napi TX poll. Also try to cancel any timer if a napi is scheduled to
prevent redundant run of TX call.

With the following new logic the original performance are restored while
keeping using the hrtimer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bb1dbf4c9f6c..5124ee87286c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2996,13 +2996,25 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	u32 tx_coal_timer = priv->tx_coal_timer[queue];
+	struct stmmac_channel *ch;
+	struct napi_struct *napi;
 
 	if (!tx_coal_timer)
 		return;
 
-	hrtimer_start(&tx_q->txtimer,
-		      STMMAC_COAL_TIMER(tx_coal_timer),
-		      HRTIMER_MODE_REL);
+	ch = &priv->channel[tx_q->queue_index];
+	napi = tx_q->xsk_pool ? &ch->rxtx_napi : &ch->tx_napi;
+
+	/* Arm timer only if napi is not already scheduled.
+	 * Try to cancel any timer if napi is scheduled, timer will be armed
+	 * again in the next scheduled napi.
+	 */
+	if (unlikely(!napi_is_scheduled(napi)))
+		hrtimer_start(&tx_q->txtimer,
+			      STMMAC_COAL_TIMER(tx_coal_timer),
+			      HRTIMER_MODE_REL);
+	else
+		hrtimer_try_to_cancel(&tx_q->txtimer);
 }
 
 /**
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
