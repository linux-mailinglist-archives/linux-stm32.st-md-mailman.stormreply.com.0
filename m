Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DF07AB040
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 13:13:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AB18C6C830;
	Fri, 22 Sep 2023 11:13:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C754FC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 11:13:07 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-31dd10c2b8bso1914065f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695381187; x=1695985987;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NO4PPCAYeBqa8N3X8iNMzO62NO9a8Aa1IWA9xi7rYvw=;
 b=f/a2JwsEHKjYdCtMtSv/YjbFWPcPtbF7raGQIz1Pt7PvPmAvSMSohCg7vcBjs+Fr6a
 qwCFNt0Z4CnJHizMmfs2bde53V1dAT8QDdQ+VKR9wXeOiRFX2xoeGHDFDb+IgjupcDRE
 N7l83828Yin2V1uv5e5K8Q9XAjcmMIXBL4KS69kV6Bd3f8bMyc8CRPb2V/AfZyTOjT8D
 DKBgeuhVV8ayZCdf3WGCBAF3T5Nn97uC/y7QWwK88rdPdonznXGWyZYv7EunD9aOO+AX
 nMqpWHy31xL3z+MqWj6i5cinxUVzPW3h8Ovv0Ip30WCQ2wFN+D3nUzCeD8Yw4Nxf13Z4
 roig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695381187; x=1695985987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NO4PPCAYeBqa8N3X8iNMzO62NO9a8Aa1IWA9xi7rYvw=;
 b=jR8mtT0mHORd61DFuNDw1uqxdGaFEuAKyXabap2H0Ko3Fn0t39/1cNrCeukXppl/Ue
 OwVL+RjMBLJSPFPk/qhdg1bGGBxYQgBIHa3JwpcX89i3fyHpeSZMhIeZIch+6xSt+F4D
 txtjOek/YNSIAdaJISDmme94UJnoWjOt5Bt5C3Jw6SlStP/rzMmMT4S5fCADCGBprOec
 E9OrjJVIID3uFcXF9MRNIFJP3JmxU1jDFocgS4laZ+RssC8ErCTvuu2GYXuHQrfh7BEh
 FUVHhXIBKqz9OFT+8kiPxMS9MC5D4x6BjQKtyDjl0QGoZuijEbWTKWIC1fz9ToMKiwei
 4ZAw==
X-Gm-Message-State: AOJu0YxKcX1rRfcAcRZm41U46u89802xxqZD5c8qLSSjlQMs0iapuMRG
 TbK52jJlO0PZXo//BPkQgnc=
X-Google-Smtp-Source: AGHT+IGt2zxWyI/cHaEIM9YNy0bqvfBVCcm7j3twnx0VeOiWaEz6/6Yr9n/oPYq1bGBQ0w34CKjfgA==
X-Received: by 2002:adf:fbcf:0:b0:31f:d8b3:e9f5 with SMTP id
 d15-20020adffbcf000000b0031fd8b3e9f5mr6831681wrs.34.1695381186972; 
 Fri, 22 Sep 2023 04:13:06 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 g10-20020adffc8a000000b003176c6e87b1sm4191765wrr.81.2023.09.22.04.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:13:06 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Raju Rangoju <rajur@chelsio.com>, "David S. Miller" <davem@davemloft.net>,
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
Date: Fri, 22 Sep 2023 13:12:46 +0200
Message-Id: <20230922111247.497-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230922111247.497-1-ansuelsmth@gmail.com>
References: <20230922111247.497-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH 2/3] net: stmmac: improve TX timer
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
index 9201ed778ebc..14bf6fae6662 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2994,13 +2994,25 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
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
