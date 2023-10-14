Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD97C93D1
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 11:30:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9587DC6B460;
	Sat, 14 Oct 2023 09:30:30 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5744C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 09:30:29 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so1033093e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697275829; x=1697880629;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIsjeim7XUbQUze6bD56uxG9gvOx0giE5m3S+sNf+CI=;
 b=edbkAq7kg+wv5QKk0Opd93sv48DZ0IsNnh3zw24A64hvPONd4962ulf7/pMG02RcOA
 4qmY4d2Hs3Oyg2M+0PEvMuPzVpfSLixCFPB3VDSZQyjmLA6jcAL/qiVoTEIwUkJK1yVP
 Nhhv3WcrBF4n0evwGpNlgHGTesXWW+QBb6NYWWLRAaA7/8mvMIx24QPK9wgwI0lY/ui8
 tpcbbHr6jt7zzvFsDGMWnrTLP9Px85Cosnz7Y44CiR6w4Q0KxHvYJ3P4zIUppu7pA65Z
 aHwQZLp+fAI6pR8TKFqtrQI1TJ/y0rlKWCeNoutFHYM5Lt+I+ShmRLUs+ETLsfa6TjXg
 +axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697275829; x=1697880629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zIsjeim7XUbQUze6bD56uxG9gvOx0giE5m3S+sNf+CI=;
 b=bKTBaNCaLg+Eb3gRVj9/nzZW3zkTzeLkUM7SRmx98onLBO5+AkYd9scvOVtnDoVxJT
 wmT/L4imctvPCJ7HbLxW9R35bJGsXoEy5/5rTH9NIJgPL3q4hy6gkmZKQgQV4jSZ921S
 Q4MbgmXZ7gBWPJDIc8r3D1Qv6Wq3JqgDfpamqBqkKDlsjqDC7ComGsLBVFbzt0d4arCs
 M1+tAvTrAvoF/Xtmy/gHjPyCKCpuXY5YVV1V65OX/V7lx6fRvk1HcsLiOVpmo2IGYPOQ
 eyMMuYlBTIJQaR62cBKKqA3rf/RufdulmepXlU82Kagx8b/q+qqs7CV6soBFVcy9dQDH
 y53A==
X-Gm-Message-State: AOJu0YzMhrR2NDC+0cF4Wr4Xiq4Z+oBGcRjLcZeo9LPJDZWoA3jDzBFj
 GQbbNecOHT7ORYg2mu4XzYI=
X-Google-Smtp-Source: AGHT+IHVrOO1wPcko18xxaQmmFK7C0es+S3+Li2IbTeY8u0EpHzu8ELCVikX+oTyjyAEdTud1lJOTQ==
X-Received: by 2002:ac2:5976:0:b0:507:96cd:9288 with SMTP id
 h22-20020ac25976000000b0050796cd9288mr4322052lfp.45.1697275828840; 
 Sat, 14 Oct 2023 02:30:28 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 u12-20020adff88c000000b0032d9a1f2ec3sm3691564wrp.27.2023.10.14.02.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 02:30:28 -0700 (PDT)
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
Date: Sat, 14 Oct 2023 11:29:52 +0200
Message-Id: <20231014092954.1850-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231014092954.1850-1-ansuelsmth@gmail.com>
References: <20231014092954.1850-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v3 2/4] net: stmmac: improve TX timer
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
