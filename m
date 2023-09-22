Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A927AB2B9
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 15:30:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9FC2C6A5EF;
	Fri, 22 Sep 2023 13:30:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E39B5C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 11:13:06 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so1895077f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 04:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695381186; x=1695985986;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mo60L/CqsBXTZMp9OSNBO8agQpgsikCTWPBLj8xU0z8=;
 b=KwUzumPuSVFh40F0MoU9DcJR7mOsw59gFGdrJlCFbI7ZhaM6NEDZvOUB+4MNvMKAEg
 i5ZdocTF8ZNRs8Q4plbKOpZzJVw5sw77llq954HM1pOkrXNi2W/vhpGUaIR3n/v1h0CF
 +OZiAJaqko0i+AsOPLeclB1BtIO1Yhf2/Xg+eokfDZMisHTLUotk2Eq6O/1cbMyP/xwE
 tqgoZceaLb8Uh/7GAx3+bje+YUz7KVyFcwJkYXfoGVNRmPNjaX/sE6DS6N4++joT4rXI
 zE0njwlQ5MNFa5B5u73d++u2Cp652XsBdv40N/KZuI9h0pzPcP4wDMX/MMz/1T+KYGsz
 TzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695381186; x=1695985986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mo60L/CqsBXTZMp9OSNBO8agQpgsikCTWPBLj8xU0z8=;
 b=oYz1wdO09Q6qAcl6edkvhWUDaw6h5ewdcJklRroXqDtc0PdOm4hwu8LSN+74FDHS/R
 ZBZt3iEyimzq1NKkMpCNRnPiLDADd7ZTuFDtU9Y39t0EsSIh0NRQAS9KvAArhqOHwvjJ
 qfodqxIV288eQuzxLzAzKIv7nVhPWnCA5akebDPW96uCSzR9tJNpDIx+4SgeSZKUlYSV
 bon2Xm0AmYAiXXMF+nqCmIQOs5EqhoGcGcvmDTJ08aOz4NZPM8uTnlhqLpg7ZiIct4JX
 bSiN/IE9hK0+hBjrtSCjrfMb7BsMIt+rB53MfYvtyApAaGoES+kHcVLdt/bwqR4D71Df
 wlhg==
X-Gm-Message-State: AOJu0Yx2wGkSmUBwRWugNhakR2Ribd0l8JQSnj6fxuyFCXrMzULRerIZ
 l/xIBov57DfK5yiuPK2bfmU=
X-Google-Smtp-Source: AGHT+IH7mPXmlPp61fOS1UbXVt881rz7wfseEorF4MkXdznkIZPNZgazS5rBLuHv+qOU+uGgsaXdlQ==
X-Received: by 2002:a5d:694d:0:b0:314:12c:4322 with SMTP id
 r13-20020a5d694d000000b00314012c4322mr7281735wrw.4.1695381185667; 
 Fri, 22 Sep 2023 04:13:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 g10-20020adffc8a000000b003176c6e87b1sm4191765wrr.81.2023.09.22.04.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:13:04 -0700 (PDT)
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
Date: Fri, 22 Sep 2023 13:12:45 +0200
Message-Id: <20230922111247.497-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Sep 2023 13:30:52 +0000
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH 1/3] net: introduce napi_is_scheduled
	helper
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
 drivers/net/ethernet/chelsio/cxgb3/sge.c  | 8 --------
 drivers/net/wireless/realtek/rtw89/core.c | 2 +-
 include/linux/netdevice.h                 | 5 +++++
 net/core/dev.c                            | 2 +-
 4 files changed, 7 insertions(+), 10 deletions(-)

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
index 133bf289bacb..bbf4ea3639d4 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1744,7 +1744,7 @@ static void rtw89_core_rx_to_mac80211(struct rtw89_dev *rtwdev,
 	struct napi_struct *napi = &rtwdev->napi;
 
 	/* In low power mode, napi isn't scheduled. Receive it to netif. */
-	if (unlikely(!test_bit(NAPI_STATE_SCHED, &napi->state)))
+	if (unlikely(!napi_is_scheduled(napi)))
 		napi = NULL;
 
 	rtw89_core_hw_to_sband_rate(rx_status);
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index db3d8429d50d..8eac00cd3b92 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -482,6 +482,11 @@ static inline bool napi_prefer_busy_poll(struct napi_struct *n)
 	return test_bit(NAPI_STATE_PREFER_BUSY_POLL, &n->state);
 }
 
+static inline bool napi_is_scheduled(struct napi_struct *n)
+{
+	return test_bit(NAPI_STATE_SCHED, &n->state);
+}
+
 bool napi_schedule_prep(struct napi_struct *n);
 
 /**
diff --git a/net/core/dev.c b/net/core/dev.c
index cc03a5758d2d..32ba8002f65a 100644
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
