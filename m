Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7BAAC3FAC
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 14:54:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C45CC36B2A;
	Mon, 26 May 2025 12:54:08 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2341EC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 00:30:27 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-86135af1045so163671739f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 May 2025 17:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748219426; x=1748824226;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
 b=XLb6Gi7hMcgUOOPrQ8xsToZhymm4v4EXSePI92mrypwYBIcujXZC9p6EEGCT0YkLSf
 m8rIc5MDsyOPUG2Q3O7Toqhgcq6mzUJB++jUtWO8bQDMxRyqgUfuVlTgAv9Bg4UMFlbY
 1GDGynAihuLYKL5UGX2aYEXtUq+HorM0+VLq/n9wGTw7vqUe/9AhHP/4LSkq94+56/e3
 N4J83V7aB0c2iiMm9b8tlBbnYTFjXLP0JjeWlllwnrYysf/KrlBcFLHJ1bQXv1G30y1R
 xa8XtnQjrADIXXAY1hwZqYCx2lEN6sQihcP/0anZrI0vPxqp1MEhO81VMGQwhNAAdf8a
 uIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748219426; x=1748824226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
 b=Yam5NGi3FoeE8U62nJewP5GTmkWtaB4TCsZFXsBt6nDXEo4o+U6XDVg+d/zxVVBBGi
 NLE3hs/4T44eZcOfnSn1QFQsfLgxOi+NlPOjefZyAf60MQIhYaLZ683Iwy9qWc4G3wdV
 yLAVpmyagnpvvSVOJHM9Y3zwEeL70oW9dP2qKAA8TuwY7sC3u1wcBzzV+hcepVrQXqPk
 P+mXcz2ECe/R2pS0IjG8+WJ7y4Enses+llkY1/GwiUp8+uD/PWGg0jxhKvZABMSa4V4l
 vSvwtQGSCyap84IrjWsWj32QludNkPjAlfjEyFUafytqeQwSCTUyV/Aml6lgbePAXlh9
 Ls1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8ZHaIxyPwzSyEm4vC1vGASSAr7+eTgjcJbZaE67O/mBIRLSnKOZIyZrDTUjk8JCTs9kayCNS43rI6+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwGoqCbnEp8xWZm17fWoKeOWz2kGRH6u7H3WxoVLV751FzPWEhK
 utstXikY3CCnxJmKNpqku7Yv/aP6TYWaCf0/NbTrPPvSxY680Sv1LzKp
X-Gm-Gg: ASbGncseotEJdcfW4FsdIx+zo/Ls3MyDDO3LP6e1upbXFJwyUGn0dZITmZK3BPCmPJK
 PwKgNYxTP8TuvJNLWDQKqJasX0wN932fdGCAsnFLR47ZcYEhzSmVgr2c00+O/F1eebybMaQ2iXZ
 vdBoOw63ZM4MeqZhntzPQGWybacR1wQq8w6Jjzw4gcJfYk2cf7AvwtfX+VeRcnCvGuJyqA3l8KU
 42sTavppSEwh39mVqKuN14nCJ4s5fJ4GGUfMQlToGrURSwJP4rlCN5BWwnkSE+JzYLqomBW5rb4
 3jnatopZ70VJOZ8YZXbyxf+XG1aDg79y+/zPXrLoty148WcQXWDuC605uvfYQItfeDZG34kvzf5
 3Y8XUnLss+dGoLly2iM3VPlI6XorBAQ==
X-Google-Smtp-Source: AGHT+IEUiP1VLM7hATU3uX+Sltx9XV9gv6KswEzefF313KmIFDOZCAlrrtUCSCIruHAM39yxFL/YfA==
X-Received: by 2002:a05:6e02:1988:b0:3dc:8c77:4d28 with SMTP id
 e9e14a558f8ab-3dc9b6aa09bmr58114665ab.1.1748219425742; 
 Sun, 25 May 2025 17:30:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net.
 [97.118.146.220]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3dc85ef07dcsm25532785ab.36.2025.05.25.17.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 May 2025 17:30:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Date: Sun, 25 May 2025 18:29:21 -0600
Message-Id: <20250526002924.2567843-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 May 2025 12:54:05 +0000
Cc: Furong Xu <0x1207@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-sunxi@lists.linux.dev, Russell King <linux@armlinux.org.uk>
Subject: [Linux-stm32] [RFC PATCH 1/2] net: stmmac: allow drivers to
	explicitly select PHY device
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

Some devices like the Allwinner H616 need the ability to select a phy
in cases where multiple PHY's may be present in a device tree due to
needing the ability to support multiple SoC variants with runtime
PHY selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 59d07d0d3369..949c4a8a1456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1210,17 +1210,25 @@ static int stmmac_init_phy(struct net_device *dev)
 	 */
 	if (!phy_fwnode || IS_ERR(phy_fwnode)) {
 		int addr = priv->plat->phy_addr;
-		struct phy_device *phydev;
+		struct phy_device *phydev = NULL;
 
-		if (addr < 0) {
-			netdev_err(priv->dev, "no phy found\n");
-			return -ENODEV;
+		if (priv->plat->phy_node) {
+			phy_fwnode = of_fwnode_handle(priv->plat->phy_node);
+			phydev = fwnode_phy_find_device(phy_fwnode);
+			fwnode_handle_put(phy_fwnode);
 		}
 
-		phydev = mdiobus_get_phy(priv->mii, addr);
 		if (!phydev) {
-			netdev_err(priv->dev, "no phy at addr %d\n", addr);
-			return -ENODEV;
+			if (addr < 0) {
+				netdev_err(priv->dev, "no phy found\n");
+				return -ENODEV;
+			}
+
+			phydev = mdiobus_get_phy(priv->mii, addr);
+			if (!phydev) {
+				netdev_err(priv->dev, "no phy at addr %d\n", addr);
+				return -ENODEV;
+			}
 		}
 
 		ret = phylink_connect_phy(priv->phylink, phydev);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
