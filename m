Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C754BE60
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 01:35:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E05BC5A4FD;
	Tue, 14 Jun 2022 23:35:29 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 581EEC0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 23:35:27 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id n28so13739777edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 16:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RwCVoV8orfnRgwChCK+rAQA3GeHEe/lWNU6fYCZRqrw=;
 b=HyiUT/C87YjhHKbLwF0EpWK4PnzBxNE7YV3xYCMN6FXpXh0QlIyDfuJgfsugtwpqlX
 tQDc8/Zn/FB68kwisUD4c0VvIiYwGfK9OOgwXguq7LGkq9hFmDC/Zkth0yxXjj2arsgw
 4Eki4svotj9voOUf7t4ZSB0B9XGnLFeSe9Tr9cUOVkTxJxRyvNuBDOdFeZKXqs+MPusV
 QPF8ZUHjUAfQ7acYBcdGg8axP2nZ7grUER14ruqPHai/wJ2pHsxEs1G0PgizLHEVpeMe
 YswVuykcSw75MCZc2s5J5IKPQN+zg5NCbeIv63s/RQlhh/JJp9TzgVgtDYZ8fkAjzC3g
 0K5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RwCVoV8orfnRgwChCK+rAQA3GeHEe/lWNU6fYCZRqrw=;
 b=xyOmtI9Pj3o2cSvCB6AZKSTj3LU+DIhv/ME+jeDi4S1nIsc+ggckKLQcxKfUDq6tZr
 cqXH7Jh6B4gShZTsIe6gu5PRR5XfTa6dxpIzjD4ZhmcVGnTOigzzE4sR8Kto2b+Y8LPR
 EDnIvYH9m1GyWVZglHkVMj0HvhxXNqKKCnVtM6cKyV4oS3lK5DF9kv0ca0nU25qw6w3u
 PPbJ+4ZHYE5h9x4OLPd3uEQJPZEUl5yf15V+xetdV4MW63EIU7xoQFi5OSU2afrY/3pH
 gtl0+qqbJFCY4tNcRxgWDoECZ/uRDff/3R9PBVp52sifqcsMNBv+tFr7TKMXFoJrjMNx
 Fwzw==
X-Gm-Message-State: AOAM531rwMYTKqTkiHi47mgQ0QVfwT9HqXezgXSIdAFweoqCcDv7fhab
 DAIazqgDW0TXUxxErVPC0gI=
X-Google-Smtp-Source: AGRyM1s7yi8SKYgGonC6z+fB20MLO4Xt5CUZ8FDxi2I5kdemGH1a5Zybz5MQqTbnia8UfoicrJMPTA==
X-Received: by 2002:aa7:ce84:0:b0:42d:ce51:8c6e with SMTP id
 y4-20020aa7ce84000000b0042dce518c6emr9386188edv.10.1655249726709; 
 Tue, 14 Jun 2022 16:35:26 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 l23-20020a17090612d700b006f3ef214daesm5572956ejb.20.2022.06.14.16.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 16:35:25 -0700 (PDT)
From: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jun 2022 00:41:41 +0200
Message-Id: <20220614224141.23576-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH] net: ethernet: stmicro: stmmac:
	permit MTU change with interface up
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

Remove the limitation where the interface needs to be down to change
MTU by releasing and opening the stmmac driver to set the new MTU.
Also call the set_filter function to correctly init the port.
This permits to remove the EBUSY error while the ethernet port is
running permitting a correct MTU change if for example a DSA request
a MTU change for a switch CPU port.

Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d1a7cf4567bc..a968a13b3183 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5448,11 +5448,6 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 
 	txfifosz /= priv->plat->tx_queues_to_use;
 
-	if (netif_running(dev)) {
-		netdev_err(priv->dev, "must be stopped to change its MTU\n");
-		return -EBUSY;
-	}
-
 	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
 		netdev_dbg(priv->dev, "Jumbo frames not supported for XDP\n");
 		return -EINVAL;
@@ -5466,6 +5461,14 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 
 	dev->mtu = mtu;
 
+	if (netif_running(dev)) {
+		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
+		stmmac_release(dev);
+
+		stmmac_open(dev);
+		stmmac_set_filter(priv, priv->hw, dev);
+	}
+
 	netdev_update_features(dev);
 
 	return 0;
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
