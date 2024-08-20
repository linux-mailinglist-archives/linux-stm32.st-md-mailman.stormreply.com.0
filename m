Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2C9582D4
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 11:39:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDAFDC6DD66;
	Tue, 20 Aug 2024 09:39:11 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 401AFC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 09:39:10 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2d394313aceso4036696a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724146749; x=1724751549;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJl6m7/HvoZr28SwAJK1VeVNaeP/xxoxJA+ZuNmUMD8=;
 b=byCAh7zkPtTjxEn7Lo01xouCSAi32DYfTmUGhmVbX4pwmGe4r5VQaU6C2EK/9ZASWY
 IHUGqkiDYPa6kRiUohlwBMuEUHvcLrrLGS9FF167ZuB+6hkgmJASi52nFoAuVG5KvdpF
 0OuZ+HPcm4fYvTtez7ye6flaiMG1Ys4qfJygLcHlUdKfyljPbqxz6gMQqwgMwLMEv6YQ
 QffAxtYAl/GAtYiVT1FwmL/2fzC2w1/83BlEGNxi9j9PnURHU15NxWgjG5GEVoQhtNgj
 lPsjqqKfKnufqlRvOMpsoe/aGfX02JKpTN+VwPxK3LLzdy42adoL/ZPYqcRjPGnSsLP3
 PpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724146749; x=1724751549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJl6m7/HvoZr28SwAJK1VeVNaeP/xxoxJA+ZuNmUMD8=;
 b=iRU9VbcF2QslqtaPygDNBcoDifmZD6Bqk1MgomiG+dEP4eYDOyHLRBt3ejqFqe+fvR
 khBer547/E4EXLwQY4IpDPNKMd1laeLLqv5VARU5IKydVyBMV56ao1M7mZ5Vd6LhJPlR
 FwwKYjAmI5Wma/wj15hFKZb9CkMRTV+kuV8aBKYnW9n1U+IC2e3X2dRGVZyGeYwCCBVd
 UVPR7XfC3tlxtnGebDWxYwEbo4WSSX20+8rquIWmaqruhxFHMlGmPAdXHX9kevKBctKA
 zfFCPr80eql8IdDxJIyQtqp4/QT60cvIUQ1MbzazVgdhgSwjzbdVN4Iw06p91y1Nr9Z+
 DehQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4L6GQ7rtXKjtSVDtAfXT0MqtYiJ3yHCX6m7XjF5XW9IY/U6NlV5xymB6iwojKPbuHSgfF13RRjjuJvg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzY2cv8i1Xkq6YSsKIc9KdPNykTtHzckARpyuqkNTCh3Ib7ng0Y
 hDcxhSXxVZT1Ipv2rJ+PT6o3+pClg+zsAaZEoGC6d0O5mQ35cSDJ
X-Google-Smtp-Source: AGHT+IEWvJvyPCpenUFu/CX0YxxvoGQ5X9ndvVt1LC/JpcJaRw96JuDl6cRLq2eoBHrgSnwodk7d8Q==
X-Received: by 2002:a17:90a:c58f:b0:2c9:6a2d:b116 with SMTP id
 98e67ed59e1d1-2d3dfc2a9dfmr14721226a91.7.1724146748502; 
 Tue, 20 Aug 2024 02:39:08 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d45246061dsm3230608a91.8.2024.08.20.02.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:39:08 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 20 Aug 2024 17:38:31 +0800
Message-Id: <bc4940c244c7e261bb00c2f93e216e9d7a925ba6.1724145786.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724145786.git.0x1207@gmail.com>
References: <cover.1724145786.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 3/7] net: stmmac: refactor FPE
	verification process
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

Drop driver defined stmmac_fpe_state, and switch to common
ethtool_mm_verify_status for local TX verification status.

Local side and remote side verification processes are completely
independent. There is no reason at all to keep a local state and
a remote state.

Add a spinlock to avoid races among ISR, workqueue, link update
and register configuration.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  21 +--
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 172 ++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   6 -
 3 files changed, 102 insertions(+), 97 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 458d6b16ce21..407b59f2783f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -146,14 +146,6 @@ struct stmmac_channel {
 	u32 index;
 };
 
-/* FPE link state */
-enum stmmac_fpe_state {
-	FPE_STATE_OFF = 0,
-	FPE_STATE_CAPABLE = 1,
-	FPE_STATE_ENTERING_ON = 2,
-	FPE_STATE_ON = 3,
-};
-
 /* FPE link-partner hand-shaking mPacket type */
 enum stmmac_mpacket_type {
 	MPACKET_VERIFY = 0,
@@ -166,11 +158,16 @@ enum stmmac_fpe_task_state_t {
 };
 
 struct stmmac_fpe_cfg {
-	bool enable;				/* FPE enable */
-	bool hs_enable;				/* FPE handshake enable */
-	enum stmmac_fpe_state lp_fpe_state;	/* Link Partner FPE state */
-	enum stmmac_fpe_state lo_fpe_state;	/* Local station FPE state */
+	/* Serialize access to MAC Merge state between ethtool requests
+	 * and link state updates.
+	 */
+	spinlock_t lock;
+
 	u32 fpe_csr;				/* MAC_FPE_CTRL_STS reg cache */
+	u32 verify_time;			/* see ethtool_mm_state */
+	bool pmac_enabled;			/* see ethtool_mm_state */
+	bool verify_enabled;			/* see ethtool_mm_state */
+	enum ethtool_mm_verify_status status;
 };
 
 struct stmmac_tc_entry {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3072ad33b105..6ae95f20b24f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -969,17 +969,21 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
 static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 {
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
-	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
-	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
-	bool *hs_enable = &fpe_cfg->hs_enable;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
+
+	if (!fpe_cfg->pmac_enabled)
+		goto __unlock_out;
 
-	if (is_up && *hs_enable) {
+	if (is_up && fpe_cfg->verify_enabled)
 		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
 					MPACKET_VERIFY);
-	} else {
-		*lo_state = FPE_STATE_OFF;
-		*lp_state = FPE_STATE_OFF;
-	}
+	else
+		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
+
+__unlock_out:
+	spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
 }
 
 static void stmmac_mac_link_down(struct phylink_config *config,
@@ -4091,11 +4095,25 @@ static int stmmac_release(struct net_device *dev)
 
 	stmmac_release_ptp(priv);
 
-	pm_runtime_put(priv->device);
-
-	if (priv->dma_cap.fpesel)
+	if (priv->dma_cap.fpesel) {
 		stmmac_fpe_stop_wq(priv);
 
+		/* stmmac_ethtool_ops.begin() guarantees that all ethtool
+		 * requests to fail with EBUSY when !netif_running()
+		 *
+		 * Prepare some params here, then fpe_cfg can keep consistent
+		 * with the register states after a SW reset by __stmmac_open().
+		 */
+		priv->fpe_cfg.pmac_enabled = false;
+		priv->fpe_cfg.verify_enabled = false;
+		priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
+
+		/* Reset MAC_FPE_CTRL_STS reg cache */
+		priv->fpe_cfg.fpe_csr = 0;
+	}
+
+	pm_runtime_put(priv->device);
+
 	return 0;
 }
 
@@ -5979,44 +5997,34 @@ static int stmmac_set_features(struct net_device *netdev,
 static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
 {
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
-	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
-	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
-	bool *hs_enable = &fpe_cfg->hs_enable;
 
-	if (status == FPE_EVENT_UNKNOWN || !*hs_enable)
-		return;
+	spin_lock(&priv->fpe_cfg.lock);
 
-	/* If LP has sent verify mPacket, LP is FPE capable */
-	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER) {
-		if (*lp_state < FPE_STATE_CAPABLE)
-			*lp_state = FPE_STATE_CAPABLE;
+	if (!fpe_cfg->pmac_enabled || status == FPE_EVENT_UNKNOWN)
+		goto __unlock_out;
 
-		/* If user has requested FPE enable, quickly response */
-		if (*hs_enable)
-			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
-						fpe_cfg,
-						MPACKET_RESPONSE);
-	}
+	/* LP has sent verify mPacket */
+	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER)
+		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
+					MPACKET_RESPONSE);
 
-	/* If Local has sent verify mPacket, Local is FPE capable */
-	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER) {
-		if (*lo_state < FPE_STATE_CAPABLE)
-			*lo_state = FPE_STATE_CAPABLE;
-	}
+	/* Local has sent verify mPacket */
+	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER &&
+	    fpe_cfg->status != ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED)
+		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_VERIFYING;
 
-	/* If LP has sent response mPacket, LP is entering FPE ON */
+	/* LP has sent response mPacket */
 	if ((status & FPE_EVENT_RRSP) == FPE_EVENT_RRSP)
-		*lp_state = FPE_STATE_ENTERING_ON;
-
-	/* If Local has sent response mPacket, Local is entering FPE ON */
-	if ((status & FPE_EVENT_TRSP) == FPE_EVENT_TRSP)
-		*lo_state = FPE_STATE_ENTERING_ON;
+		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED;
 
 	if (!test_bit(__FPE_REMOVING, &priv->fpe_task_state) &&
 	    !test_and_set_bit(__FPE_TASK_SCHED, &priv->fpe_task_state) &&
 	    priv->fpe_wq) {
 		queue_work(priv->fpe_wq, &priv->fpe_task);
 	}
+
+__unlock_out:
+	spin_unlock(&priv->fpe_cfg.lock);
 }
 
 static void stmmac_common_interrupt(struct stmmac_priv *priv)
@@ -7372,50 +7380,57 @@ int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size)
 	return ret;
 }
 
-#define SEND_VERIFY_MPAKCET_FMT "Send Verify mPacket lo_state=%d lp_state=%d\n"
-static void stmmac_fpe_lp_task(struct work_struct *work)
+static void stmmac_fpe_verify_task(struct work_struct *work)
 {
 	struct stmmac_priv *priv = container_of(work, struct stmmac_priv,
 						fpe_task);
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
-	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
-	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
-	bool *hs_enable = &fpe_cfg->hs_enable;
-	bool *enable = &fpe_cfg->enable;
-	int retries = 20;
-
-	while (retries-- > 0) {
-		/* Bail out immediately if FPE handshake is OFF */
-		if (*lo_state == FPE_STATE_OFF || !*hs_enable)
+	int verify_limit = 3; /* defined by 802.3 */
+	unsigned long flags;
+	u32 sleep_ms;
+
+	spin_lock(&priv->fpe_cfg.lock);
+	sleep_ms = fpe_cfg->verify_time;
+	spin_unlock(&priv->fpe_cfg.lock);
+
+	while (1) {
+		/* The initial VERIFY was triggered by linkup event or
+		 * stmmac_set_mm(), sleep then check MM_VERIFY_STATUS.
+		 */
+		msleep(sleep_ms);
+
+		if (!netif_running(priv->dev))
 			break;
 
-		if (*lo_state == FPE_STATE_ENTERING_ON &&
-		    *lp_state == FPE_STATE_ENTERING_ON) {
-			stmmac_fpe_configure(priv, priv->ioaddr,
-					     fpe_cfg,
-					     priv->plat->tx_queues_to_use,
-					     priv->plat->rx_queues_to_use,
-					     *enable);
+		spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
 
-			netdev_info(priv->dev, "configured FPE\n");
+		if (fpe_cfg->status == ETHTOOL_MM_VERIFY_STATUS_DISABLED ||
+		    fpe_cfg->status == ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED ||
+		    !fpe_cfg->pmac_enabled || !fpe_cfg->verify_enabled) {
+			spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
+			break;
+		}
 
-			*lo_state = FPE_STATE_ON;
-			*lp_state = FPE_STATE_ON;
-			netdev_info(priv->dev, "!!! BOTH FPE stations ON\n");
+		if (verify_limit == 0) {
+			fpe_cfg->verify_enabled = false;
+			fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
+			stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
+					     priv->plat->tx_queues_to_use,
+					     priv->plat->rx_queues_to_use,
+					     false);
+			spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
 			break;
 		}
 
-		if ((*lo_state == FPE_STATE_CAPABLE ||
-		     *lo_state == FPE_STATE_ENTERING_ON) &&
-		     *lp_state != FPE_STATE_ON) {
-			netdev_info(priv->dev, SEND_VERIFY_MPAKCET_FMT,
-				    *lo_state, *lp_state);
-			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
-						fpe_cfg,
+		if (fpe_cfg->status == ETHTOOL_MM_VERIFY_STATUS_VERIFYING)
+			stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
 						MPACKET_VERIFY);
-		}
-		/* Sleep then retry */
-		msleep(500);
+
+		sleep_ms = fpe_cfg->verify_time;
+
+		spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
+
+		verify_limit--;
 	}
 
 	clear_bit(__FPE_TASK_SCHED, &priv->fpe_task_state);
@@ -7535,8 +7550,8 @@ int stmmac_dvr_probe(struct device *device,
 
 	INIT_WORK(&priv->service_task, stmmac_service_task);
 
-	/* Initialize Link Partner FPE workqueue */
-	INIT_WORK(&priv->fpe_task, stmmac_fpe_lp_task);
+	/* Initialize FPE verify workqueue */
+	INIT_WORK(&priv->fpe_task, stmmac_fpe_verify_task);
 
 	/* Override with kernel parameters if supplied XXX CRS XXX
 	 * this needs to have multiple instances
@@ -7702,6 +7717,12 @@ int stmmac_dvr_probe(struct device *device,
 
 	mutex_init(&priv->lock);
 
+	spin_lock_init(&priv->fpe_cfg.lock);
+	priv->fpe_cfg.pmac_enabled = false;
+	priv->fpe_cfg.verify_time = 128; /* ethtool_mm_state.max_verify_time */
+	priv->fpe_cfg.verify_enabled = false;
+	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
+
 	/* If a specific clk_csr value is passed from the platform
 	 * this means that the CSR Clock Range selection cannot be
 	 * changed at run-time and it is fixed. Viceversa the driver'll try to
@@ -7875,15 +7896,8 @@ int stmmac_suspend(struct device *dev)
 	}
 	rtnl_unlock();
 
-	if (priv->dma_cap.fpesel) {
-		/* Disable FPE */
-		stmmac_fpe_configure(priv, priv->ioaddr,
-				     &priv->fpe_cfg,
-				     priv->plat->tx_queues_to_use,
-				     priv->plat->rx_queues_to_use, false);
-
+	if (priv->dma_cap.fpesel)
 		stmmac_fpe_stop_wq(priv);
-	}
 
 	priv->speed = SPEED_UNKNOWN;
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index b0cc45331ff7..783829a6479c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1063,11 +1063,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		return -EOPNOTSUPP;
 	}
 
-	/* Actual FPE register configuration will be done after FPE handshake
-	 * is success.
-	 */
-	priv->fpe_cfg.enable = fpe;
-
 	ret = stmmac_est_configure(priv, priv, priv->est,
 				   priv->plat->clk_ptp_rate);
 	mutex_unlock(&priv->est_lock);
@@ -1094,7 +1089,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_unlock(&priv->est_lock);
 	}
 
-	priv->fpe_cfg.enable = false;
 	stmmac_fpe_configure(priv, priv->ioaddr,
 			     &priv->fpe_cfg,
 			     priv->plat->tx_queues_to_use,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
