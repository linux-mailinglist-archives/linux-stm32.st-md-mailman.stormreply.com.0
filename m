Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F365957EFA9
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Jul 2022 16:29:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD48AC5A4FD;
	Sat, 23 Jul 2022 14:29:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41E7FC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Jul 2022 14:29:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so6744210wmb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Jul 2022 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjiJgm+ePUWk4K7ivlZ0MC/qqioPkcS003xuwMGC70A=;
 b=ixXDJxh8BydzdrlUp+5pUGg9ENcZKGe2KUprYBMZl2POERKwenf+RWBmrRBU+7gIcN
 WLWnVORyug8+zftCXTTwjU3z1OijT1bJouuZZdo5g7Fb0hODAOPGAGpTxMaDBaWsxVJ9
 16SW4wUw0BASYukDBptpq07R+d/cHE1fTmUQAvANxHcpukXeTR70lz6lszlDXXtO9Iin
 woCuS7iso2EZKipkiL+zFeYXghQKpbDUGN7/bazdWzTs/f3xUL2eVmfC+MhZQf3B2bC5
 XEU6Ofz4Rublo81gGXPxVRKSeWRMrdPO29YVc7RKI3JucyaKK3NWdj7RwR6J03iX3+ZV
 EKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjiJgm+ePUWk4K7ivlZ0MC/qqioPkcS003xuwMGC70A=;
 b=IlH932vvyVpKUL1pT/QcK+o+qXOOEwuPKQPcJRQ8xCXARguB2hSUS5uchDF0V6SYvW
 PiMx6xbTbzGGMlwAffoC/7AJBWrJc2uX5EFVRWM8D+kEtyF3p39d++RkR3J7L7+WE18/
 hqu/K/tcXuAb5WDeQ2GRCCY0fcCJKrFj2ChCQy1jtc3a6L+Jnqthu3+AcASI5r/aFA+p
 jqjmkTpE4PorA6LdD3hx+15rie5IVTl/oxa/Z4IOamSaopvWxVU8CaEsDQ39/tpHep6C
 52IXceyCfpXNwMHk8BVksnmf9BCufKXg53fdW3WH5JqYm1DHFPjRjL9HV8f0NC7cQKBN
 XSsg==
X-Gm-Message-State: AJIora/CuaNJHzFZ21Gi8ePpHhdEbo0v/8wL7Y3qYt+FH7IgHXzsfNNd
 q3RSX+2pQ05wX3mGkHnFEMM=
X-Google-Smtp-Source: AGRyM1vVaFgb3GqjCNsvMbzlaBRd98PPg1L/7OqXzOm1rUViGRihb4msdECZSlhE1Jheg38qChktQg==
X-Received: by 2002:a05:600c:4f49:b0:3a3:2717:27fc with SMTP id
 m9-20020a05600c4f4900b003a3271727fcmr15822873wmq.36.1658586590737; 
 Sat, 23 Jul 2022 07:29:50 -0700 (PDT)
Received: from localhost.localdomain
 (host-87-7-207-127.retail.telecomitalia.it. [87.7.207.127])
 by smtp.googlemail.com with ESMTPSA id
 q6-20020a1cf306000000b0039c5ab7167dsm11689717wmq.48.2022.07.23.07.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 07:29:50 -0700 (PDT)
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
Date: Sat, 23 Jul 2022 16:29:30 +0200
Message-Id: <20220723142933.16030-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723142933.16030-1-ansuelsmth@gmail.com>
References: <20220723142933.16030-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v5 2/5] net: ethernet: stmicro:
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
