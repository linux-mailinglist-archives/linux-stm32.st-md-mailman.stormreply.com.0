Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E27CE219
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 18:03:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE62BC6C838;
	Wed, 18 Oct 2023 16:03:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B7BBC6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 12:35:59 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4083cd39188so4660245e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697632558; x=1698237358;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0v0ZmldTmEHElH0nzfPoImpxhHxc/jfxnYXGlHkEaSw=;
 b=dfJxSEJyVEYS+7savJQSvwHJV1XYrhT7ydJNpIj1LIG6yxMEvhO1WagNQAELC1VJTT
 AcUhNR3b0KF4HiftwEbwdPSAtLVg4c/v0PsRTpX7HenbAuMjFY+3hfntnrMO0dfGmIsP
 xE83m0pBzkiilzI0yA1Bv4z6RL4iK8yvnfUSILwjd1cRTBkxDtlJpDJTFw/VOb2i6ww3
 GP2kdEX9nIoES3xuhitXPCcpikkFZlovpOopQ7671uf5SVfhy13TvvkD89eNEylIP7Zb
 2TnLZ0khpKlz8LwRGXQGiG3oUdDQ2lbmqiLAEn8rpV60g1vlRz0OK3HQhY2KHhPV/Q+K
 yHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697632558; x=1698237358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0v0ZmldTmEHElH0nzfPoImpxhHxc/jfxnYXGlHkEaSw=;
 b=tHFuW/aB2HsohL/xuqnAzb0l4Za0+BJ8wNaUk/T0d7Nl4XoR3Th4co11ehRN7oFXkH
 2/1AqdmOSRxhDHEiIt6x6XPwhOTtZiG/xSwMFNIV7IlGPx5qvn57As5upSJGUyug1ePn
 kEvG8s6gB2yR627MOM+xiDAnAu+0VMbbCFkApsoE+p9fq111jl72J4ZiO/JsJezONL5R
 IdELd0ebGONJZbkxCeiMyVpMv6vlhRXOIHpxMe3w8cKlCzYIy4rG76DCTuoof4PM+Mvr
 faFJs3ZnT4kbR0rFOxNnJ2tzmLCoHhMCZiINMzYAycFj9Fr22K3PGSqYzqsGwTfDUNS9
 EgZQ==
X-Gm-Message-State: AOJu0YzRvbBxQCOdWy6DSfbmfVgBikhuGH5/21r6STQPkxXLBpFnuIyO
 YcfL8SR93H9rPkMW0Ehdn7A=
X-Google-Smtp-Source: AGHT+IHYxeHjCIR/FT2JDqNfUwmEd2G8A/49wx/hETYLT6M/03g9TnduO1+10bkcfRpmv5Wp7ErFMw==
X-Received: by 2002:a05:600c:3511:b0:404:72fe:ed5c with SMTP id
 h17-20020a05600c351100b0040472feed5cmr4380670wmq.29.1697632558280; 
 Wed, 18 Oct 2023 05:35:58 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 q28-20020adfab1c000000b003248a490e3asm2048211wrc.39.2023.10.18.05.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 05:35:57 -0700 (PDT)
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
Date: Wed, 18 Oct 2023 14:35:47 +0200
Message-Id: <20231018123550.27110-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018123550.27110-1-ansuelsmth@gmail.com>
References: <20231018123550.27110-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Oct 2023 16:03:55 +0000
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v4 1/4] net: introduce
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
index 1c7681263d30..b8bf669212cc 100644
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
index 3ca746a5f0ad..8d267fc0b988 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6527,7 +6527,7 @@ static int __napi_poll(struct napi_struct *n, bool *repoll)
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
