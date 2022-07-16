Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C15770CE
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Jul 2022 20:48:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D967AC64104;
	Sat, 16 Jul 2022 18:47:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54D50C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 18:47:57 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r14so11172098wrg.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 11:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcH9xqJ0k/4jByViDRihM1a2jjuLTRujm9Mqh/y4WfU=;
 b=qbVbSB2V7fahimrZ1Z8x+RhdfTcaVEKX5BHhKsTvlNKRUOEHV4OCPssP+OlTpg+Sea
 CoVGyybzYZAh0tct0k7DokF4BZ1kSE0O00QD6BYRZKEW8r20URe3htj/9nsucq9YEZBG
 VIsnf4QqrPFdoUhthRPrVs/kUOqNtQEpUTPamB6PWy0rswI4gkt0DHEmStjBoY5ZZCzd
 5CqgVa3dU/o+mBgns7OIzIYwTgRZCAuYEwJjzYEBVWUVg3EcWGF+2sspbKZ5CHZXvE/D
 64R7n1g9siKfEXImj1MF14CwmJ37bk5Ic0OXztZNU580BPBC/XSXu49UL8Tnu8SkOSnr
 Rklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcH9xqJ0k/4jByViDRihM1a2jjuLTRujm9Mqh/y4WfU=;
 b=FLqa3HKgVUDeO0QmCjYv6VGtoR4csZYmazN9fqOcklNZf9R28fx4RYmBTQPP3fELc1
 rGz0GTyFqv6lZTL6gaRK3qLYlk9zu3xBQ4ADlgJqZ1plKzzxRcwMaydJ3y5rYY7pc3r5
 j5jp4elUtouu9R7VNP9q130fTt9fkDi+2fidlqfs51ZiiM742VV4FJyDnpUFBGmF5x0W
 t05fK0QzqMsC5T4ul36Cns6B9U+cl0YA5H+hJhtD8GiHz4204crAQLTDFpl8CF2XVrq/
 eP43labR0dbK9aIc5pKoyzegrpGK5zuwmfbMIVExFNh+pT2sxb3MUUWLrWjsDKDrgYZd
 iWPg==
X-Gm-Message-State: AJIora/NA5MS8RrEidAKN2seasDy0AbjjUGoF02pXssTN86rx+iKuFeZ
 2eX+Xd6dm8GyaYWZ9YWXfSwUmgXjOi0=
X-Google-Smtp-Source: AGRyM1tIw848TqIGMUpVV7CE6ipw6t3CMPmAb9mlv9DdQVSmKhlbaBnhY6KRtegb3K/BH3ykAUB50g==
X-Received: by 2002:adf:f345:0:b0:21d:6927:ec8f with SMTP id
 e5-20020adff345000000b0021d6927ec8fmr17286090wrp.490.1657997276776; 
 Sat, 16 Jul 2022 11:47:56 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 u18-20020a05600c19d200b003973c54bd69sm13649961wmq.1.2022.07.16.11.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 11:47:56 -0700 (PDT)
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
Date: Sat, 16 Jul 2022 20:45:30 +0200
Message-Id: <20220716184533.2962-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220716184533.2962-1-ansuelsmth@gmail.com>
References: <20220716184533.2962-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v2 2/5] net: ethernet: stmicro:
	stmmac: first disable all queues in release
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

Disable all queues before tx_disable in stmmac_release to prevent a
corner case where packet may be still queued at the same time tx_disable
is called resulting in kernel panic if some packet still has to be
processed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5578abb14949..1854dcdd6095 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3758,6 +3758,11 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
+	stmmac_disable_all_queues(priv);
+
+	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
+		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
+
 	netif_tx_disable(dev);
 
 	if (device_may_wakeup(priv->device))
@@ -3766,11 +3771,6 @@ static int stmmac_release(struct net_device *dev)
 	phylink_stop(priv->phylink);
 	phylink_disconnect_phy(priv->phylink);
 
-	stmmac_disable_all_queues(priv);
-
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
-
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
