Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C549D950411
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2024 13:48:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8860FC71289;
	Tue, 13 Aug 2024 11:48:38 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E010C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 11:48:37 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-710ce81bf7dso3425852b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 04:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723549716; x=1724154516;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDULy9R5aolragO6msHBT0HPtFhiOQINnhQwxle7rjU=;
 b=kiNijK+mCKQv1QDola7PQOMbtzZSr3Sut9sQeJum7SAavXRNWHc1hMYJ729YoIm2c2
 eJmvpZZVGI5e900l1/a1cG+Dsth/enj2KK3e3Pi2i690V017h997TSWywvvGHXXDNiJu
 QLogBloeBKLV25Tu0VqnRWU0QgIluHAK8YqVuu18AuElHCP2Vlv7kuUP96FRnA3ocL0M
 URYLM2z0pOLhqczt1nrmQxRS3Wk84vm7+SXNmrY9RB5Hs3o0VBRrCGH5FBnUhFQ/fkEj
 nV/Lh/3yzt/rqE3KocYWoRyF4ADrpJnvkmuOi62PYibEvlKEKGHuP8R46riFz57EZpnV
 7rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723549716; x=1724154516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDULy9R5aolragO6msHBT0HPtFhiOQINnhQwxle7rjU=;
 b=iSAvYVyV6TeQYJOQPec1RHuqiCQT+Os/1HFw2ygyytKmtprWLTJWGi+8pGdIdj3AA3
 ZYPGUQ+WM/tGljqqY7uR/dBNXiFBPwm5LnBX9Gg6mVH+x7z1cADHo35kiyQLgB8eOhBd
 fw7PE5s8t/s70Kp6BtmscrDIShYVme5y7I6tIF6HFHvvh/IdPf6Epa6TAusIX9q7APBR
 myQKp173zb+6P2CSJID7ORNeyYrz/4rAxZ6Y3gqiczjeIuSGxSa55TsUxsifZG6jWxBV
 UT9LAgzHlHt1d146R989uYGpZBF+NJQnuJrn5Uphbte8nzETIZV/qRA1Yz6lL3+f8lZz
 R/tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5u4q8lVES+O1L7JwPI0bjlSqy6zmzuv2o52xD8D2I/dKoYaoQC1sBtQoT98dlpXvYB4cJeUhjzNqb2uTftgNSqYSDcuLI4UJaRi+4ECjQt83PZdbWepIj
X-Gm-Message-State: AOJu0Yxg77THQ3h9uQ+Ipv9CZhVZiD30On0WxW6BHkGvYjUya2N4nAdO
 t1lryBFc2DBKJN/HGhqNfCiUoRLaDcHd1g6PuDDJQ0OEBUIuOneZ
X-Google-Smtp-Source: AGHT+IGaJJk8vUqkv8CzrWeCknNZeINOQ1lAv+QM2zOw+3i53Ywda0A4Jo9uBJjnBDtmz/JXVweZnQ==
X-Received: by 2002:a05:6a00:2d0e:b0:70d:2cf6:5e6 with SMTP id
 d2e1a72fcca58-7125516a0ebmr4285730b3a.15.1723549715439; 
 Tue, 13 Aug 2024 04:48:35 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-710e5a562bbsm5548755b3a.111.2024.08.13.04.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 04:48:35 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 13 Aug 2024 19:47:29 +0800
Message-Id: <5c59d8c52a774c083162b6d558228132d899326c.1723548320.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723548320.git.0x1207@gmail.com>
References: <cover.1723548320.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/7] net: stmmac: refactor FPE
	verification processe
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

Add a spinlock to avoid races between ISR and workqueue.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  17 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 150 ++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   6 -
 3 files changed, 87 insertions(+), 86 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 2c2181febb39..26ee1dbcccae 100644
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
@@ -166,10 +158,10 @@ enum stmmac_fpe_task_state_t {
 };
 
 struct stmmac_fpe_cfg {
-	bool enable;				/* FPE enable */
-	bool hs_enable;				/* FPE handshake enable */
-	enum stmmac_fpe_state lp_fpe_state;	/* Link Partner FPE state */
-	enum stmmac_fpe_state lo_fpe_state;	/* Local station FPE state */
+	bool pmac_enabled;			/* see ethtool_mm_state */
+	bool verify_enabled;			/* see ethtool_mm_state */
+	u32 verify_time;			/* see ethtool_mm_state */
+	enum ethtool_mm_verify_status status;
 	u32 fpe_csr;				/* MAC_FPE_CTRL_STS reg cache */
 };
 
@@ -366,6 +358,7 @@ struct stmmac_priv {
 	struct workqueue_struct *wq;
 	struct work_struct service_task;
 
+	spinlock_t mm_lock;
 	struct stmmac_fpe_cfg fpe_cfg;
 
 	/* Workqueue for handling FPE hand-shaking */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3072ad33b105..a21268492475 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -969,16 +969,18 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
 static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 {
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
-	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
-	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
-	bool *hs_enable = &fpe_cfg->hs_enable;
+	unsigned long flags;
+
+	if (!fpe_cfg->pmac_enabled)
+		return;
 
-	if (is_up && *hs_enable) {
+	if (is_up && fpe_cfg->verify_enabled) {
 		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
 					MPACKET_VERIFY);
 	} else {
-		*lo_state = FPE_STATE_OFF;
-		*lp_state = FPE_STATE_OFF;
+		spin_lock_irqsave(&priv->mm_lock, flags);
+		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
+		spin_unlock_irqrestore(&priv->mm_lock, flags);
 	}
 }
 
@@ -3533,9 +3535,16 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 
-	if (priv->dma_cap.fpesel)
+	if (priv->dma_cap.fpesel) {
 		stmmac_fpe_start_wq(priv);
 
+		stmmac_fpe_configure(priv, priv->ioaddr,
+				     &priv->fpe_cfg,
+				     priv->plat->tx_queues_to_use,
+				     priv->plat->rx_queues_to_use,
+				     false);
+	}
+
 	return 0;
 }
 
@@ -3978,6 +3987,11 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
+	priv->fpe_cfg.pmac_enabled = false;
+	priv->fpe_cfg.verify_time = 128; /* ethtool_mm_state.max_verify_time */
+	priv->fpe_cfg.verify_enabled = false;
+	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
+
 	ret = stmmac_hw_setup(dev, true);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
@@ -4091,6 +4105,16 @@ static int stmmac_release(struct net_device *dev)
 
 	stmmac_release_ptp(priv);
 
+	stmmac_fpe_configure(priv, priv->ioaddr,
+			     &priv->fpe_cfg,
+			     priv->plat->tx_queues_to_use,
+			     priv->plat->rx_queues_to_use,
+			     false);
+
+	priv->fpe_cfg.pmac_enabled = false;
+	priv->fpe_cfg.verify_enabled = false;
+	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
+
 	pm_runtime_put(priv->device);
 
 	if (priv->dma_cap.fpesel)
@@ -5979,38 +6003,26 @@ static int stmmac_set_features(struct net_device *netdev,
 static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
 {
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
-	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
-	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
-	bool *hs_enable = &fpe_cfg->hs_enable;
 
-	if (status == FPE_EVENT_UNKNOWN || !*hs_enable)
+	if (!fpe_cfg->pmac_enabled || status == FPE_EVENT_UNKNOWN)
 		return;
 
-	/* If LP has sent verify mPacket, LP is FPE capable */
-	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER) {
-		if (*lp_state < FPE_STATE_CAPABLE)
-			*lp_state = FPE_STATE_CAPABLE;
+	/* LP has sent verify mPacket */
+	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER)
+		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
+					MPACKET_RESPONSE);
 
-		/* If user has requested FPE enable, quickly response */
-		if (*hs_enable)
-			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
-						fpe_cfg,
-						MPACKET_RESPONSE);
-	}
+	spin_lock(&priv->mm_lock);
 
-	/* If Local has sent verify mPacket, Local is FPE capable */
-	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER) {
-		if (*lo_state < FPE_STATE_CAPABLE)
-			*lo_state = FPE_STATE_CAPABLE;
-	}
+	/* Local has sent verify mPacket */
+	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER)
+		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_VERIFYING;
 
-	/* If LP has sent response mPacket, LP is entering FPE ON */
+	/* LP has sent response mPacket */
 	if ((status & FPE_EVENT_RRSP) == FPE_EVENT_RRSP)
-		*lp_state = FPE_STATE_ENTERING_ON;
+		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED;
 
-	/* If Local has sent response mPacket, Local is entering FPE ON */
-	if ((status & FPE_EVENT_TRSP) == FPE_EVENT_TRSP)
-		*lo_state = FPE_STATE_ENTERING_ON;
+	spin_unlock(&priv->mm_lock);
 
 	if (!test_bit(__FPE_REMOVING, &priv->fpe_task_state) &&
 	    !test_and_set_bit(__FPE_TASK_SCHED, &priv->fpe_task_state) &&
@@ -7372,50 +7384,51 @@ int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size)
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
-			break;
-
-		if (*lo_state == FPE_STATE_ENTERING_ON &&
-		    *lp_state == FPE_STATE_ENTERING_ON) {
-			stmmac_fpe_configure(priv, priv->ioaddr,
-					     fpe_cfg,
-					     priv->plat->tx_queues_to_use,
-					     priv->plat->rx_queues_to_use,
-					     *enable);
-
-			netdev_info(priv->dev, "configured FPE\n");
+	int verify_limit = 3; /* defined by 802.3 */
+	unsigned long flags;
 
-			*lo_state = FPE_STATE_ON;
-			*lp_state = FPE_STATE_ON;
-			netdev_info(priv->dev, "!!! BOTH FPE stations ON\n");
+	while (verify_limit > 0) {
+		if (fpe_cfg->status == ETHTOOL_MM_VERIFY_STATUS_DISABLED ||
+		    fpe_cfg->status == ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED ||
+		    !fpe_cfg->pmac_enabled || !fpe_cfg->verify_enabled)
 			break;
-		}
 
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
+
 		/* Sleep then retry */
-		msleep(500);
+		msleep(fpe_cfg->verify_time);
+		verify_limit--;
+	}
+
+	if (fpe_cfg->status == ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED) {
+		spin_lock_irqsave(&priv->mm_lock, flags);
+
+		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
+				     priv->plat->tx_queues_to_use,
+				     priv->plat->rx_queues_to_use,
+				     true);
+
+		spin_unlock_irqrestore(&priv->mm_lock, flags);
+	}
+
+	if (verify_limit == 0) {
+		spin_lock_irqsave(&priv->mm_lock, flags);
+
+		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
+		fpe_cfg->verify_enabled = false;
+		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
+				     priv->plat->tx_queues_to_use,
+				     priv->plat->rx_queues_to_use,
+				     false);
+
+		spin_unlock_irqrestore(&priv->mm_lock, flags);
 	}
 
 	clear_bit(__FPE_TASK_SCHED, &priv->fpe_task_state);
@@ -7535,8 +7548,8 @@ int stmmac_dvr_probe(struct device *device,
 
 	INIT_WORK(&priv->service_task, stmmac_service_task);
 
-	/* Initialize Link Partner FPE workqueue */
-	INIT_WORK(&priv->fpe_task, stmmac_fpe_lp_task);
+	/* Initialize FPE verify workqueue */
+	INIT_WORK(&priv->fpe_task, stmmac_fpe_verify_task);
 
 	/* Override with kernel parameters if supplied XXX CRS XXX
 	 * this needs to have multiple instances
@@ -7701,6 +7714,7 @@ int stmmac_dvr_probe(struct device *device,
 	stmmac_napi_add(ndev);
 
 	mutex_init(&priv->lock);
+	spin_lock_init(&priv->mm_lock);
 
 	/* If a specific clk_csr value is passed from the platform
 	 * this means that the CSR Clock Range selection cannot be
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
