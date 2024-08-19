Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA52956491
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 09:26:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E18BC71287;
	Mon, 19 Aug 2024 07:26:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A189C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 07:26:04 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-202089e57d8so15625455ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 00:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724052363; x=1724657163;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QzYPT2ZqD2cekSd63MSZe2hxfKjemgnKJ40EagzCcZM=;
 b=a7EglxXHyTupQhXnXKmTUkDS1EupyIzVkE/OqSdUF278GAUSWbJqlNSFX6lDgcs5ae
 qslCj+B+M88lkYy/mPqKCycQy5qwaQpHQUFp+hU6Pt8GWBXEQw4pp566fiP6op6ofYcw
 cUh2pDb4bhSMFFHV02etzZu5hH1ZyjGonrVCrhkdrzS+yVFXhRj90VpRs7r0WD0hOMUk
 2aE4Za1fBxyAdYxROeijUjjMojD73fs7cE272RO+hcqD4S7buT8ZXS1HDhsX5DA2oOPz
 LWyva24ItjIjBOzTtulT6uj+/YKK3hvA9Y0AAJDV3LI2/6PBQePYnxO0j9pquHIfELla
 lHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724052363; x=1724657163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzYPT2ZqD2cekSd63MSZe2hxfKjemgnKJ40EagzCcZM=;
 b=CGtd47mEgB5okORMQQYC8J+foL9cwjXrkm0UPnv3dAlOW0GO5+DIVVSofQxhJe3QSj
 nSF6ayPKX+DYj7Xnpw0K2BjCKzhtFN48gkI9Z62K4gsuRFrEHD4kvu+P2BmeOg40gK4o
 TAaSQICWy7N/fjzdS3vM9IyYQZCJKFcmN/TSq4h26JhsV4jgvvNPX9yj47qcVXtXj5Bq
 QVsgFAP7Tomfch2VQ4m7YeXPq0SsbsO7N/jBsrKES9QI1JG2ULHQxiTQ9WZcfbdm5pe0
 17BnA+gFl+5OClwcfkpt0sAHW7Tf6ZQOhYHaVhgkRpcNOOe1AvcONlsm5uEuAK4qoS7Y
 q4VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX93JVoZGydIFaw7/W3iiEoOeMa5ZIh7EOb0NR/t5mCRn1OhlxlBKiUa07f/FFrYunCEqOgDI8fk1pCEFoc3ZUVUKVD/cRTRUsDqskmbgUojU2Aub2+6/Jm
X-Gm-Message-State: AOJu0YyB5pgojgGeoQy6SEUMMaPvmk+iNWv4A8Tlxu3LMxTsBpcjeyjM
 VXTfaI5eBRQ6GSFYJMMESENqQVkn/gFOcoWEmnMP3ByFlhf3275w
X-Google-Smtp-Source: AGHT+IG+G4JJBNCGzR8HHLfgBtlxyC7RvE4+q/FzM1zP/vp6W1JGMHm/ljJRYUpFqcJCFQjDXwTqlA==
X-Received: by 2002:a17:902:fa8c:b0:201:dc7b:a88f with SMTP id
 d9443c01a7336-201ee505cb5mr162759905ad.25.1724052362855; 
 Mon, 19 Aug 2024 00:26:02 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-201f02faa5dsm58340855ad.2.2024.08.19.00.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 00:26:02 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Mon, 19 Aug 2024 15:25:14 +0800
Message-Id: <b1e63dfc1ca886f11ed0e9ae80fca16082de905e.1724051326.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724051326.git.0x1207@gmail.com>
References: <cover.1724051326.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 1/7] net: stmmac: move
	stmmac_fpe_cfg to stmmac_priv data
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

By moving the fpe_cfg field to the stmmac_priv data, stmmac_fpe_cfg
becomes platform-data eventually, instead of a run-time config.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  | 29 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++-------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 16 ++--------
 include/linux/stmmac.h                        | 28 ------------------
 5 files changed, 44 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 7e90f34b8c88..28dfc0054a3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -31,6 +31,8 @@ struct stmmac_safety_stats;
 struct dma_desc;
 struct dma_extended_desc;
 struct dma_edesc;
+struct stmmac_fpe_cfg;
+enum stmmac_mpacket_type;
 
 /* Descriptors helpers */
 struct stmmac_desc_ops {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b23b920eedb1..2c2181febb39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -146,6 +146,33 @@ struct stmmac_channel {
 	u32 index;
 };
 
+/* FPE link state */
+enum stmmac_fpe_state {
+	FPE_STATE_OFF = 0,
+	FPE_STATE_CAPABLE = 1,
+	FPE_STATE_ENTERING_ON = 2,
+	FPE_STATE_ON = 3,
+};
+
+/* FPE link-partner hand-shaking mPacket type */
+enum stmmac_mpacket_type {
+	MPACKET_VERIFY = 0,
+	MPACKET_RESPONSE = 1,
+};
+
+enum stmmac_fpe_task_state_t {
+	__FPE_REMOVING,
+	__FPE_TASK_SCHED,
+};
+
+struct stmmac_fpe_cfg {
+	bool enable;				/* FPE enable */
+	bool hs_enable;				/* FPE handshake enable */
+	enum stmmac_fpe_state lp_fpe_state;	/* Link Partner FPE state */
+	enum stmmac_fpe_state lo_fpe_state;	/* Local station FPE state */
+	u32 fpe_csr;				/* MAC_FPE_CTRL_STS reg cache */
+};
+
 struct stmmac_tc_entry {
 	bool in_use;
 	bool in_hw;
@@ -339,6 +366,8 @@ struct stmmac_priv {
 	struct workqueue_struct *wq;
 	struct work_struct service_task;
 
+	struct stmmac_fpe_cfg fpe_cfg;
+
 	/* Workqueue for handling FPE hand-shaking */
 	unsigned long fpe_task_state;
 	struct workqueue_struct *fpe_wq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d9fca8d1227c..529fe31f8b04 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -968,7 +968,7 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
 
 static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 {
-	struct stmmac_fpe_cfg *fpe_cfg = priv->plat->fpe_cfg;
+	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
 	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
 	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
 	bool *hs_enable = &fpe_cfg->hs_enable;
@@ -3536,7 +3536,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 	if (priv->dma_cap.fpesel) {
 		stmmac_fpe_start_wq(priv);
 
-		if (priv->plat->fpe_cfg->enable)
+		if (priv->fpe_cfg.enable)
 			stmmac_fpe_handshake(priv, true);
 	}
 
@@ -5982,7 +5982,7 @@ static int stmmac_set_features(struct net_device *netdev,
 
 static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
 {
-	struct stmmac_fpe_cfg *fpe_cfg = priv->plat->fpe_cfg;
+	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
 	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
 	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
 	bool *hs_enable = &fpe_cfg->hs_enable;
@@ -7381,7 +7381,7 @@ static void stmmac_fpe_lp_task(struct work_struct *work)
 {
 	struct stmmac_priv *priv = container_of(work, struct stmmac_priv,
 						fpe_task);
-	struct stmmac_fpe_cfg *fpe_cfg = priv->plat->fpe_cfg;
+	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
 	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
 	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
 	bool *hs_enable = &fpe_cfg->hs_enable;
@@ -7427,17 +7427,17 @@ static void stmmac_fpe_lp_task(struct work_struct *work)
 
 void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
 {
-	if (priv->plat->fpe_cfg->hs_enable != enable) {
+	if (priv->fpe_cfg.hs_enable != enable) {
 		if (enable) {
 			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
-						priv->plat->fpe_cfg,
+						&priv->fpe_cfg,
 						MPACKET_VERIFY);
 		} else {
-			priv->plat->fpe_cfg->lo_fpe_state = FPE_STATE_OFF;
-			priv->plat->fpe_cfg->lp_fpe_state = FPE_STATE_OFF;
+			priv->fpe_cfg.lo_fpe_state = FPE_STATE_OFF;
+			priv->fpe_cfg.lp_fpe_state = FPE_STATE_OFF;
 		}
 
-		priv->plat->fpe_cfg->hs_enable = enable;
+		priv->fpe_cfg.hs_enable = enable;
 	}
 }
 
@@ -7898,7 +7898,7 @@ int stmmac_suspend(struct device *dev)
 	if (priv->dma_cap.fpesel) {
 		/* Disable FPE */
 		stmmac_fpe_configure(priv, priv->ioaddr,
-				     priv->plat->fpe_cfg,
+				     &priv->fpe_cfg,
 				     priv->plat->tx_queues_to_use,
 				     priv->plat->rx_queues_to_use, false);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 996f2bcd07a2..9cc41ed01882 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -282,16 +282,6 @@ static int tc_init(struct stmmac_priv *priv)
 	if (ret)
 		return -ENOMEM;
 
-	if (!priv->plat->fpe_cfg) {
-		priv->plat->fpe_cfg = devm_kzalloc(priv->device,
-						   sizeof(*priv->plat->fpe_cfg),
-						   GFP_KERNEL);
-		if (!priv->plat->fpe_cfg)
-			return -ENOMEM;
-	} else {
-		memset(priv->plat->fpe_cfg, 0, sizeof(*priv->plat->fpe_cfg));
-	}
-
 	/* Fail silently as we can still use remaining features, e.g. CBS */
 	if (!dma_cap->frpsel)
 		return 0;
@@ -1076,7 +1066,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	/* Actual FPE register configuration will be done after FPE handshake
 	 * is success.
 	 */
-	priv->plat->fpe_cfg->enable = fpe;
+	priv->fpe_cfg.enable = fpe;
 
 	ret = stmmac_est_configure(priv, priv, priv->est,
 				   priv->plat->clk_ptp_rate);
@@ -1109,9 +1099,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_unlock(&priv->est_lock);
 	}
 
-	priv->plat->fpe_cfg->enable = false;
+	priv->fpe_cfg.enable = false;
 	stmmac_fpe_configure(priv, priv->ioaddr,
-			     priv->plat->fpe_cfg,
+			     &priv->fpe_cfg,
 			     priv->plat->tx_queues_to_use,
 			     priv->plat->rx_queues_to_use,
 			     false);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 338991c08f00..d79ff252cfdc 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -138,33 +138,6 @@ struct stmmac_txq_cfg {
 	int tbs_en;
 };
 
-/* FPE link state */
-enum stmmac_fpe_state {
-	FPE_STATE_OFF = 0,
-	FPE_STATE_CAPABLE = 1,
-	FPE_STATE_ENTERING_ON = 2,
-	FPE_STATE_ON = 3,
-};
-
-/* FPE link-partner hand-shaking mPacket type */
-enum stmmac_mpacket_type {
-	MPACKET_VERIFY = 0,
-	MPACKET_RESPONSE = 1,
-};
-
-enum stmmac_fpe_task_state_t {
-	__FPE_REMOVING,
-	__FPE_TASK_SCHED,
-};
-
-struct stmmac_fpe_cfg {
-	bool enable;				/* FPE enable */
-	bool hs_enable;				/* FPE handshake enable */
-	enum stmmac_fpe_state lp_fpe_state;	/* Link Partner FPE state */
-	enum stmmac_fpe_state lo_fpe_state;	/* Local station FPE state */
-	u32 fpe_csr;				/* MAC_FPE_CTRL_STS reg cache */
-};
-
 struct stmmac_safety_feature_cfg {
 	u32 tsoee;
 	u32 mrxpee;
@@ -232,7 +205,6 @@ struct plat_stmmacenet_data {
 	struct fwnode_handle *port_node;
 	struct device_node *mdio_node;
 	struct stmmac_dma_cfg *dma_cfg;
-	struct stmmac_fpe_cfg *fpe_cfg;
 	struct stmmac_safety_feature_cfg *safety_feat_cfg;
 	int clk_csr;
 	int has_gmac;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
