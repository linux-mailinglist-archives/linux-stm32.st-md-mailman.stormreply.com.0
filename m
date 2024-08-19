Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE2A956493
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 09:26:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 705E7C6DD9D;
	Mon, 19 Aug 2024 07:26:13 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DBBEC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 07:26:11 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2021c03c13aso9909445ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724052370; x=1724657170;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e93oae2VnzqVNZVCAViMoa1uvgxDslJYuHwS+x1kihw=;
 b=goEQr/In7Gto8sXMy+aj5LAIUPrjl5GXxA7W1WbEmtlJ5Yv0mlP63wtSHiSmyH/Y9k
 y4kXVVBtVcF1IApf5R5QiSaiCM3v52Cex0yhd1mUEPRTwa4o9FC+lDuRoh4boJwY/Mpv
 AvWleAyYy8CaFDCMQUKmFUIbG5SUl9BWwOvR0sXg9aAJK61eSinIZrKJX5xr+mjLSCKV
 Y44o3DY4OOWe2TnkPy+KgqzgAn8+0McLPjy+ks0G9Ap58Uwx26ZcIRkEwtKPFXmYkkHB
 ICNiUJ1lHP7YnOz9eJiKQJNv0ZNdCoJ6ht49ntdct/uWi6V+FQCJ6u2y1znuyyqMHInh
 PkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724052370; x=1724657170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e93oae2VnzqVNZVCAViMoa1uvgxDslJYuHwS+x1kihw=;
 b=dzamBs3+QNE7A9yPHubo+jnxxh8NsFSId1kA4a68vPQ6uTiOuxTAIERTb7ZDk7Kz+d
 bNFdIqmV8W903IBH0FDDPqrEmRyNFA1YexDNTTKeVGUo712VcB3ppy4Obuby46famJ2w
 RdyNE41N/xRgfqVYFnaqzV5fkEycB7/R/FFrKI/23OsD8YQamMoQ8Lad8FuRahwdK5iK
 UJGUxW09zy1SOSOieirMRPba/4afLXN4Bc5aRMSAk4sRkaXk/8NP9fG7N92ZaPLaQAcl
 Lun04cDjfjNYXNEsWCbAqK/L7vZOPRltLFj29T7IolP9gBfq5buqseYe716khaEP5kZd
 pVmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkEQVP/Wf8PZQKndrwp/zK0nCpj4WrXomvZoBZkU4EaT2XOINwueh4x6GRzDc1/21oDUbPphJ8Daodc0fDapxE6bFn+koqtHZiiKoV/x/x3UhVF8exLsFN
X-Gm-Message-State: AOJu0YxYaNxHGDRS09agrRCjb5Xv9HmCfkQD5DrBH+ly1HyjFuiSpxBt
 2bzAqH1huVwqPfFtim7LdmVTS89PoTFTIA5a0i9222HPyu+pLUmT
X-Google-Smtp-Source: AGHT+IGso1hgFDQM2RtHO9bYMoQKU4sDJZP80zUHXwvevdEA2krPBWan9i05+Zt07fQeZ1SzCfuwBA==
X-Received: by 2002:a17:902:e549:b0:1fd:8b77:998e with SMTP id
 d9443c01a7336-202062baefamr138939585ad.29.1724052369603; 
 Mon, 19 Aug 2024 00:26:09 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-201f02faa5dsm58340855ad.2.2024.08.19.00.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 00:26:09 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Mon, 19 Aug 2024 15:25:15 +0800
Message-Id: <f646d17db237743554d4ba0fc65ce9807cec90d2.1724051326.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724051326.git.0x1207@gmail.com>
References: <cover.1724051326.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 2/7] net: stmmac: drop
	stmmac_fpe_handshake
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

ethtool --set-mm can trigger FPE verification processe by calling
stmmac_fpe_send_mpacket, stmmac_fpe_handshake should be gone.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 +------------------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |  8 -------
 2 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 529fe31f8b04..3072ad33b105 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3533,13 +3533,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 
-	if (priv->dma_cap.fpesel) {
+	if (priv->dma_cap.fpesel)
 		stmmac_fpe_start_wq(priv);
 
-		if (priv->fpe_cfg.enable)
-			stmmac_fpe_handshake(priv, true);
-	}
-
 	return 0;
 }
 
@@ -7425,22 +7421,6 @@ static void stmmac_fpe_lp_task(struct work_struct *work)
 	clear_bit(__FPE_TASK_SCHED, &priv->fpe_task_state);
 }
 
-void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
-{
-	if (priv->fpe_cfg.hs_enable != enable) {
-		if (enable) {
-			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
-						&priv->fpe_cfg,
-						MPACKET_VERIFY);
-		} else {
-			priv->fpe_cfg.lo_fpe_state = FPE_STATE_OFF;
-			priv->fpe_cfg.lp_fpe_state = FPE_STATE_OFF;
-		}
-
-		priv->fpe_cfg.hs_enable = enable;
-	}
-}
-
 static int stmmac_xdp_rx_timestamp(const struct xdp_md *_ctx, u64 *timestamp)
 {
 	const struct stmmac_xdp_buff *ctx = (void *)_ctx;
@@ -7902,7 +7882,6 @@ int stmmac_suspend(struct device *dev)
 				     priv->plat->tx_queues_to_use,
 				     priv->plat->rx_queues_to_use, false);
 
-		stmmac_fpe_handshake(priv, false);
 		stmmac_fpe_stop_wq(priv);
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 9cc41ed01882..b0cc45331ff7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1078,11 +1078,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	netdev_info(priv->dev, "configured EST\n");
 
-	if (fpe) {
-		stmmac_fpe_handshake(priv, true);
-		netdev_info(priv->dev, "start FPE handshake\n");
-	}
-
 	return 0;
 
 disable:
@@ -1107,9 +1102,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			     false);
 	netdev_info(priv->dev, "disabled FPE\n");
 
-	stmmac_fpe_handshake(priv, false);
-	netdev_info(priv->dev, "stop FPE handshake\n");
-
 	return ret;
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
