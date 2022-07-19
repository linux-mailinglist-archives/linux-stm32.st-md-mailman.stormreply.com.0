Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70649579004
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jul 2022 03:49:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 238D0C640F2;
	Tue, 19 Jul 2022 01:49:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A67EEC640F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 01:49:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so295143wmq.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 18:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjiJgm+ePUWk4K7ivlZ0MC/qqioPkcS003xuwMGC70A=;
 b=NtpRkIjh4Bv37C970xdAVWthPTrnmEQdyeT0ewXV1A6lqhFkPcNO+5MKYUefXEfip/
 Z4kOZTMSZth5cO6KoeWvSMI/DKggvO/X2cj6ljs8DTle6dZ6eB74+k7ucfBHtFZFQ6Nt
 AKTD3l/8jIrhDeHSscaJxc3kW1uBVNOzRm1eU2Y8+WnGbzbKmMjlip5ajtlVGr3Lr/Ft
 Yt0MGalcSuQP6bx3ZF02e2zToXzh6jfbd31tV0gk8+8skJQTq3hAT1/1sVZZ30mhrHWn
 /BEFoLD7lamYXtuLTkNF+BiDBgFxcGUGeNyLPlsavs8TDhonuuTvYty/kmhqLu6yh0u0
 PB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjiJgm+ePUWk4K7ivlZ0MC/qqioPkcS003xuwMGC70A=;
 b=0UI8G64h/H4b7D+tRD0Zh3Cbd/s4cqPd0UnJ4XbM44tvAnMXW4tNOeuhjk4DJU63OA
 hCnoZ18ORpi5TNXZNhzlAa4Pezmc3WQ4RbvrGXjV/K2bEq7LpB21BMy35R94WOSmeFNS
 84Rt++SRxy7nkXb+uP/AiGmqJg6v7WHSRdWJjSIY4NJIvjQqUMUs75dBSB+wvStZl7fU
 8rYMswkB+8uZswVhhEltzcnaYWIm1Gbp5aQpeaRPSDvx0coQLhj1bgOgun7eUw7veD0F
 TxNt7IotjbZHyaMM7n9j3lB65m8+i9clRyS/QlolZu/2woitM9HJiontVAG4PMGc5gNT
 vAaA==
X-Gm-Message-State: AJIora9nHP7Mvx9+CW3Mwl4bjqvMR4zPaoDCd94wuZzqJrFp5RNSa+Ex
 wHHKypPMkwDghgIlmKfjEzg=
X-Google-Smtp-Source: AGRyM1uFusY3dtICtBSOeVqJQdNbnOtjEtjon/nrmPJkBA+X+LnTpmvBYjkGQrIU6MLFLmVgr5zd+A==
X-Received: by 2002:a7b:cb03:0:b0:39e:e826:ce6d with SMTP id
 u3-20020a7bcb03000000b0039ee826ce6dmr34636738wmj.102.1658195372239; 
 Mon, 18 Jul 2022 18:49:32 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 v10-20020a05600c428a00b003a2fc754313sm16193600wmc.10.2022.07.18.18.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 18:49:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Jul 2022 03:32:16 +0200
Message-Id: <20220719013219.11843-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719013219.11843-1-ansuelsmth@gmail.com>
References: <20220719013219.11843-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v4 2/5] net: ethernet: stmicro:
	stmmac: first disable all queues and disconnect in release
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

Disable all queues and disconnect before tx_disable in stmmac_release to
prevent a corner case where packet may be still queued at the same time
tx_disable is called resulting in kernel panic if some packet still has
to be processed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5578abb14949..96e55dadcfba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3758,8 +3758,6 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
-	netif_tx_disable(dev);
-
 	if (device_may_wakeup(priv->device))
 		phylink_speed_down(priv->phylink, false);
 	/* Stop and disconnect the PHY */
@@ -3771,6 +3769,8 @@ static int stmmac_release(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
 
+	netif_tx_disable(dev);
+
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
