Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3CB730438
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 17:53:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F475C6A61A;
	Wed, 14 Jun 2023 15:53:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CC2DC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 15:53:16 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-30fa23e106bso4062687f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686757996; x=1689349996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bhq/y0fc8NtbiDoPoE9MBpAtCqUXLlZMCwX6567Us4w=;
 b=rplArsRTqX0QzO+acxEngNYJNMVt6u5lBMTiEmCMCN9MqpTtL0AOdInFSf3QEQLis6
 K5KkbNP4lva6SBLQxaan7MYME6CwT+/F/2PjeGakSkgz/g6LjoMls6tNrT93DmmuqUYp
 eM7vKCdL9B9IniqP7BNSdJ2M3pJGOhnw1kLHPVw0U3w8EiIf3SjvjswZAapm1gZkRGfB
 T1wShgwmoRF8B3ByF/Asxs2lnS1aXAzaJAm2Vi7W6UzoeBlnrUf5KQH7+EivQN0p4lpA
 6MF436FcsaG8uPOLPAmwDLyVZQlcRj4rpfJ61dbRO1SPl8NmSDSP3QDYR7JRmEdaASX4
 N3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686757996; x=1689349996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bhq/y0fc8NtbiDoPoE9MBpAtCqUXLlZMCwX6567Us4w=;
 b=PLVJUN9kmhUgtl+sJrT5CtspALCfmcA8o1g0+tN3qeVTxHu//X8uxmJPPW4Rf2psAc
 h7LdMQ4xFjvaSzG6HDrIqvqzDqQLbqjspx/AkREwU2mEcPnwhX4DqiYaIUu3HD3QitEI
 n3Dy/isS83yrlGFMEw8jOCo0RQ+EQUWMaI0wJZQ99j8TCLlRjxkXXVjmmFW7m7IdYst4
 SvLUdAR5EZ/3bIKGfZ5l+NesP5bzq0pXVtdA5I0TEd9odaTwtvYOB8N6APgqU12lpnPp
 BB5fbmuL78gQNm6XuV55ZoY0Jm2uIcTch1ISOssDo/S4Kk0uCF2wIkAzE/rBwnlZddan
 EcKg==
X-Gm-Message-State: AC+VfDyQbxvn3Yq+uX5P91LMp/3lxqY7+l2ntSTeCTcekrDRlaimWnKC
 Ds174nJ+0DnPokEfGySDtYs=
X-Google-Smtp-Source: ACHHUZ4bgrLvAW+bLWRMhNWCLyEUy8rjxDhrz/ugqbtaLYWSlkDAiCpdxMZXxKqgVabsYT+IRO3eww==
X-Received: by 2002:adf:f5d2:0:b0:30f:d0e7:ef31 with SMTP id
 k18-20020adff5d2000000b0030fd0e7ef31mr3459559wrp.44.1686757996142; 
 Wed, 14 Jun 2023 08:53:16 -0700 (PDT)
Received: from localhost.localdomain (93-34-93-173.ip49.fastwebnet.it.
 [93.34.93.173]) by smtp.googlemail.com with ESMTPSA id
 m6-20020a5d6246000000b0030e52d4c1bcsm18752199wrv.71.2023.06.14.08.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 08:53:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 14 Jun 2023 11:17:14 +0200
Message-Id: <20230614091714.15912-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, stable@vger.kernel.org
Subject: [Linux-stm32] [net PATCH v2] net: ethernet: stmicro: stmmac: fix
	possible memory leak in __stmmac_open
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

Fix a possible memory leak in __stmmac_open when stmmac_init_phy fails.
It's also needed to free everything allocated by stmmac_setup_dma_desc
and not just the dma_conf struct.

Drop free_dma_desc_resources from __stmmac_open and correctly call
free_dma_desc_resources on each user of __stmmac_open on error.

Reported-by: Jose Abreu <Jose.Abreu@synopsys.com>
Fixes: ba39b344e924 ("net: ethernet: stmicro: stmmac: generate stmmac dma conf before open")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Cc: stable@vger.kernel.org
---

Changes v2:
- Move free_dma_desc_resources to each user of __stmmac_open

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fa07b0d50b46..5c645b6d5660 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3877,7 +3877,6 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_hw_teardown(dev);
 init_error:
-	free_dma_desc_resources(priv, &priv->dma_conf);
 	phylink_disconnect_phy(priv->phylink);
 init_phy_error:
 	pm_runtime_put(priv->device);
@@ -3895,6 +3894,9 @@ static int stmmac_open(struct net_device *dev)
 		return PTR_ERR(dma_conf);
 
 	ret = __stmmac_open(dev, dma_conf);
+	if (ret)
+		free_dma_desc_resources(priv, dma_conf);
+
 	kfree(dma_conf);
 	return ret;
 }
@@ -5637,12 +5639,15 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 		stmmac_release(dev);
 
 		ret = __stmmac_open(dev, dma_conf);
-		kfree(dma_conf);
 		if (ret) {
+			free_dma_desc_resources(priv, dma_conf);
+			kfree(dma_conf);
 			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
 			return ret;
 		}
 
+		kfree(dma_conf);
+
 		stmmac_set_rx_mode(dev);
 	}
 
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
