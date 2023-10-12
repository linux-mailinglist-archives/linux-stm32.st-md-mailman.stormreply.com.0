Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4927C7DE3
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 08:48:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C68A9C6A5EA;
	Fri, 13 Oct 2023 06:48:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F4ADC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 10:08:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so736117f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697105317; x=1697710117;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMV6knP2vLu/vHdHEBOSBg5/6andL2RYQDxRoSzD5RA=;
 b=lCkTCoUVHq6m63+q6PD+gxt2XY3zX1NJlYQBq647H45vU+Cxme5mjGZDmMCt5p3N6+
 4Qzlko0kZxdBn+6fb4Trns/hU02ZdAm+ZAbYKiadk70vsBKSU/U9SAp1DVuP+1Dz69bR
 1bgcIZ2cbTUQTLS1InllNnaiUD842YJKm5BAWd5xr1oyLKiA+vByBgogf3CGaM+KD74E
 xSoIrdW+f3OctZlFNNpELzn5xNMg9qk2xyXc9d9IT18DuWbnfIoDzQi49ZE5Zu/FywbF
 nvE1Na6ENY+QwG//WeSLQnUsjMGepf2dQLd4gLyt5zRyzrEFjR7v61PvkILAxcUud9qL
 E+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697105317; x=1697710117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMV6knP2vLu/vHdHEBOSBg5/6andL2RYQDxRoSzD5RA=;
 b=plWW/TZ8EyPilNpOiBWtd5sM8KnQ6nqgUiGvIzYQoVv2kriwu8utmz1aNFb0j1eXSE
 vJj3YbkJxskcun5dywzyVdEeVSn9ykV0o5wxzRoFV9LXXis1Y2rvCeTpkQcd22eYng0v
 AfAbv0IENGD/bbr2fjeo7SXhh6jS+578rkjD09ISESQYBcqf99Ft9pIhDoYIPKxBHDyx
 Ifc1fmgSWnh1CZiw3nHsFNoefjuW0Q8tWa+Pxq5Bm7oNuuvJuoVpm+IVIdsTOtrD8etK
 9M5lbw7yJOHyXTRZZB7KOhtrqsUZSG96Gkeeh0I5ltxla1+D12B+/Co4A5TMYM3YFyL+
 901Q==
X-Gm-Message-State: AOJu0YwkgA8mANMQwTWKfLNDo9fOIqNcHZ/V1nKQ2XGt0HjpOmWNWERu
 O13lFTru6rXZ0R53dvkRQp4=
X-Google-Smtp-Source: AGHT+IFjKjcTaHf2NJ6N29120b+8wBoJ+W6K+tl9kn9/Z768BH9cEbvLUKjARc7MjgjfPGjGv95C4A==
X-Received: by 2002:adf:e8ca:0:b0:324:7a6b:d504 with SMTP id
 k10-20020adfe8ca000000b003247a6bd504mr23080121wrn.4.1697105316670; 
 Thu, 12 Oct 2023 03:08:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 dj16-20020a0560000b1000b003198a9d758dsm922737wrb.78.2023.10.12.03.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:08:36 -0700 (PDT)
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
Date: Thu, 12 Oct 2023 12:04:56 +0200
Message-Id: <20231012100459.6158-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231012100459.6158-1-ansuelsmth@gmail.com>
References: <20231012100459.6158-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Oct 2023 06:48:01 +0000
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v2 1/4] net: introduce
	napi_is_scheduled helper
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

We currently have napi_if_scheduled_mark_missed that can be used to
check if napi is scheduled but that does more thing than simply checking
it and return a bool. Some driver already implement custom function to
check if napi is scheduled.

Drop these custom function and introduce napi_is_scheduled that simply
check if napi is scheduled atomically.

Update any driver and code that implement a similar check and instead
use this new helper.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/chelsio/cxgb3/sge.c  |  8 --------
 drivers/net/wireless/realtek/rtw89/core.c |  2 +-
 include/linux/netdevice.h                 | 23 +++++++++++++++++++++++
 net/core/dev.c                            |  2 +-
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/chelsio/cxgb3/sge.c
index 2e9a74fe0970..71fa2dc19034 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
@@ -2501,14 +2501,6 @@ static int napi_rx_handler(struct napi_struct *napi, int budget)
 	return work_done;
 }
 
-/*
- * Returns true if the device is already scheduled for polling.
- */
-static inline int napi_is_scheduled(struct napi_struct *napi)
-{
-	return test_bit(NAPI_STATE_SCHED, &napi->state);
-}
-
 /**
  *	process_pure_responses - process pure responses from a response queue
  *	@adap: the adapter
diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index cca18d7ea1dd..6faf4dcf007c 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1919,7 +1919,7 @@ static void rtw89_core_rx_to_mac80211(struct rtw89_dev *rtwdev,
 	struct napi_struct *napi = &rtwdev->napi;
 
 	/* In low power mode, napi isn't scheduled. Receive it to netif. */
-	if (unlikely(!test_bit(NAPI_STATE_SCHED, &napi->state)))
+	if (unlikely(!napi_is_scheduled(napi)))
 		napi = NULL;
 
 	rtw89_core_hw_to_sband_rate(rx_status);
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index ae553f886796..ad75875a854d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -482,6 +482,29 @@ static inline bool napi_prefer_busy_poll(struct napi_struct *n)
 	return test_bit(NAPI_STATE_PREFER_BUSY_POLL, &n->state);
 }
 
+/**
+ * napi_is_scheduled - test if NAPI is scheduled
+ * @n: NAPI context
+ *
+ * This check is "best-effort". With no locking implemented,
+ * a NAPI can be scheduled or terminate right after this check
+ * and produce not precise results.
+ *
+ * NAPI_STATE_SCHED is an internal state, napi_is_scheduled
+ * should not be used normally and napi_schedule should be
+ * used instead.
+ *
+ * Use only if the driver really needs to check if a NAPI
+ * is scheduled for example in the context of delayed timer
+ * that can be skipped if a NAPI is already scheduled.
+ *
+ * Return True if NAPI is scheduled, False otherwise.
+ */
+static inline bool napi_is_scheduled(struct napi_struct *n)
+{
+	return test_bit(NAPI_STATE_SCHED, &n->state);
+}
+
 bool napi_schedule_prep(struct napi_struct *n);
 
 /**
diff --git a/net/core/dev.c b/net/core/dev.c
index 02949a929e7f..c2ec535bc9b4 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6523,7 +6523,7 @@ static int __napi_poll(struct napi_struct *n, bool *repoll)
 	 * accidentally calling ->poll() when NAPI is not scheduled.
 	 */
 	work = 0;
-	if (test_bit(NAPI_STATE_SCHED, &n->state)) {
+	if (napi_is_scheduled(n)) {
 		work = n->poll(n, weight);
 		trace_napi_poll(n, work, weight);
 	}
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
