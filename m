Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EAA95040F
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2024 13:48:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75C5EC71289;
	Tue, 13 Aug 2024 11:48:28 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86231C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 11:48:26 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70d316f0060so4084314b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723549705; x=1724154505;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e93oae2VnzqVNZVCAViMoa1uvgxDslJYuHwS+x1kihw=;
 b=Ey/ulacXv8JLqE0vNlbDDKUQFXK2paXrW2iaF90Bo+2nbIM8WyPg4kRK+1Mh83B7as
 gJHABkQT0WlpCf2nHLsDKRNeNzGpaOYNoIqpNJc82lHSGaHaZGPc9scK8oS1xLOtNDtL
 cgH2EwYoyDz8X3jIJokOHHbFJzqWkEQhK5X5c9P7dcuRMsD3jgVn/tV2Pv98Qa4wlRWN
 L9ggmD70fOkH2XKgWhFH+21Cokg+mntwOAejFU5nnl6PbpbBUownCd6eoYmEBcux8vba
 UDUh1i7wtO4LBGmC9pidR2+7NzRHuDBK66tuzP9kdWAKaXDc+zireP/qlWt/84YEcu9P
 RVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723549705; x=1724154505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e93oae2VnzqVNZVCAViMoa1uvgxDslJYuHwS+x1kihw=;
 b=d8DFNUIq9SPHSaQre8jgGFXWSNIS9/qHTdVD24gb8YqVbASEa3q8eKQ5mReDJArE77
 heZQ0SH2IxUdcKXUoQ1DpyMqEEaPekq/GLn3LIGJBOFlvw9QH5uwLfMt6dGm1+/W1/GJ
 +MBlYLoOg5FSOn229NWS7miyZ0jgGxqRToA8alPjbPGsmJYylSufLAYFCf3eDinQFCmI
 Lq/YoqQxQ8G442KLVEs5d6NfcrbMtusLPLavDvJx68sryONAIOC9QEPjKs7IxWw7R/FK
 gauIKUmap966oNg7uie8Cn1mXNg+ROX9HTwyt7WQNsZPFNSDDx1sEN3PZ5sI67z48h41
 N+bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS0PEfGwTeKbCqAWiB7AdYzvQTcxh13fJsTnvIGEIpuT8VhaJHpTDD58wAP8xnkdTucbZgpoY5WNo3xJrnTZ1Su/y5kf6zQqUDwKY6uHQvaEIxfd+ynZ+t
X-Gm-Message-State: AOJu0YxWRmJQaBoK7XshXakRFyaZonf8i4y+huQbp0l6cu1q9frbQOSh
 REc6sS8QifIokePX12n1tGthcEi+QFGBSYSCbLN/arMLUL4Rlfci
X-Google-Smtp-Source: AGHT+IGxt8hPD8mJsm6gJter71iHAjEsFjuWECdz+VoqMfy71FcU+f7SGPt+SjXcXj2P7sGD0bgpJQ==
X-Received: by 2002:a05:6a20:c78f:b0:1c3:b148:690e with SMTP id
 adf61e73a8af0-1c8da1925c8mr4631707637.5.1723549704906; 
 Tue, 13 Aug 2024 04:48:24 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-710e5a562bbsm5548755b3a.111.2024.08.13.04.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 04:48:24 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 13 Aug 2024 19:47:28 +0800
Message-Id: <02703a16d35eaa28ad513d56bc52427e0fcbbddd.1723548320.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723548320.git.0x1207@gmail.com>
References: <cover.1723548320.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/7] net: stmmac: drop
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
