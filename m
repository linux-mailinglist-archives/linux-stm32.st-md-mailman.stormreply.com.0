Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DF37CA044
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Oct 2023 09:14:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA983C6B458;
	Mon, 16 Oct 2023 07:14:46 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 841BCC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 09:30:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so2684285f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697275828; x=1697880628;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0v0ZmldTmEHElH0nzfPoImpxhHxc/jfxnYXGlHkEaSw=;
 b=MN28dgdijWUPU3A3KEsiZIh2+mNZbkNeEJY6b3SYrl1yxOQwdcCIQvC0l3O+EDHfra
 SVx1WNhy2T3Eaeg2EPEb+fuLQcfvFgDedgon5Z+95Y+EMI6pZUbVT/MJMra6bGpDfu2O
 bTGp5dYnJvkOpfnDs9SUNAIL4PAIV9EJmyDgip6DUwobMS6b6ZbdfY84TlLoCpEYsxoT
 3/9+/+k84qC+LK2iZaHvdumUb1X3MGLAWh8mTJqD0Ccd2FVzFuEI0NQFKdLBj8AH82E5
 tJJqP3KQADX8mLWHv7NotiPeNsNNJEYHaP8mqmIcp26wOLNmhRXmeAZ3RRc4bcQwFFCV
 jOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697275828; x=1697880628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0v0ZmldTmEHElH0nzfPoImpxhHxc/jfxnYXGlHkEaSw=;
 b=QO3x05QWcZKGWMgpBASRN6p+Kz80mJXW3XyUuDtPSdAzPqH+FvhmxDOjTr48GbBJlO
 yE6RV1BPzFdJZzsFsfW1BktEKFaCBxNB+rmOO9diZnFhL9Yeko/FPB24fB57ZuMWnKEr
 Bi0zqbM9G0gir+FZLWzkeZCGsmkkOy4SW17dqB4YNtnLDywfp54c4av8dVFrf7PRUEZx
 6/yAf0AYVdp29gMyWxR4/qDtcFwt2le+4DeCgtw8mCzZvpRHUJZWpG1TOqOio2yRpvEj
 SIehPbHl39DUXgxJBN3oHw5pXhaJHQImEj6yuvK8a6hEC/MOSY/0PkmNFUj7BPxQ9Tl1
 n01w==
X-Gm-Message-State: AOJu0YxESL1DhCnPn6HEDLKA9+rGAxjFSHzJLyr1BvJjGEt+TY8oggi4
 8wemr13oNljtxXLItMcRdDw=
X-Google-Smtp-Source: AGHT+IHITaCYYgaDaVYdlugdBcEmiB2Gm3AaeA1KbHU6EX4IsmQglBgvAzr4PDY46n1dhLmgiWfDpQ==
X-Received: by 2002:adf:f48e:0:b0:324:8239:2873 with SMTP id
 l14-20020adff48e000000b0032482392873mr27747535wro.37.1697275827698; 
 Sat, 14 Oct 2023 02:30:27 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 u12-20020adff88c000000b0032d9a1f2ec3sm3691564wrp.27.2023.10.14.02.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 02:30:27 -0700 (PDT)
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
Date: Sat, 14 Oct 2023 11:29:51 +0200
Message-Id: <20231014092954.1850-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231014092954.1850-1-ansuelsmth@gmail.com>
References: <20231014092954.1850-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Oct 2023 07:14:45 +0000
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v3 1/4] net: introduce
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
