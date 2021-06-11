Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D23A49CA
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:05:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9684C58D7C;
	Fri, 11 Jun 2021 20:05:49 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6B5DC58D7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:05:48 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ci15so6223731ejc.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAyARCwymts80UfSaJxc+A+RseuakUzeRsZERPmV1Kc=;
 b=ZsK2C8U7Y6zGtixzFqwU2f0qKlJ/48dNKaCasvleVmITH+fpVbVNZlChvOjnSMKb4d
 Et1NAI7OfiOLAo26jPwIXldDyUYYQw244Sex2p89SRqorGrIPeQbtkX9AQKjDUGG4Qts
 5Pe/UAnF6RtLhO/qk6bru7DfrB+PZBRUT55QRargLFZsvVcdVq7mMYVC8TS9E76qw3Ly
 tT0EbnaIP1HjAmM00oVUQeJIippTi7ff9/yytAL5jRoWVhbfYGrWezi4oFimGngc7QFD
 cSUsr/KyAHXfmrI0TDEB8xd7J27jV7cY6386t8dHAL/wEKZ8piCncZfCATGh2YmaGUVz
 EXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TAyARCwymts80UfSaJxc+A+RseuakUzeRsZERPmV1Kc=;
 b=h703Apw5v0ZkOQlRey94kc1sWMK8HeAyw6hYjNdzOy+dyQNuG4LrsFYEb9qxB1MCc9
 Rn0l+Dnel9Yv8+E4bJt9nfI5/TWn2+WffCbXVsxAva1xg9YQazRgRfxrko6zLP0A1z5x
 lUlL1mrGtk92DYJqCg2eETbG9ZApGMVSVQrsRnj9rhxs+ChcwEUWxhunfjgOJPSu9SBd
 AGijRMJCNtuXR93UtMub5PgeArQy5kt+3IpaKQILbM2HKkWOp0E/tnkp+Mq2DHSribK7
 0uEtj3MqZ7ejc6f49OD266pFD4EBPxKVqYENVwdfCKFynGnMFTwzG0DRn6o7QjWxbPrk
 HUuA==
X-Gm-Message-State: AOAM531jm0BT+AeN/StaS/EPrClexQM0a5PDF84YK6yZ/b/P86t+k8Hu
 dl19zMNEnCBXmABloLsuWNQ=
X-Google-Smtp-Source: ABdhPJx0q3keaviy8zOp5QcWBmI9rN2JzJZ65MC3OfzZ0hFWUYMyILNEktPbrqluD5xD5LRSMEh7PA==
X-Received: by 2002:a17:906:b2c1:: with SMTP id
 cf1mr4991692ejb.544.1623441948579; 
 Fri, 11 Jun 2021 13:05:48 -0700 (PDT)
Received: from localhost.localdomain ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id w2sm2392084ejn.118.2021.06.11.13.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:05:48 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org
Date: Fri, 11 Jun 2021 23:05:20 +0300
Message-Id: <20210611200531.2384819-3-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611200531.2384819-1-olteanv@gmail.com>
References: <20210611200531.2384819-1-olteanv@gmail.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v3 net-next 02/13] net: stmmac: reverse
	Christmas tree notation in stmmac_xpcs_setup
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Reorder the variable declarations in descending line length order,
according to the networking coding style.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
v2->v3: none
v1->v2: none

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 3b3033b20b1d..a5d150c5f3d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -399,11 +399,11 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 int stmmac_xpcs_setup(struct mii_bus *bus)
 {
-	int mode, addr;
 	struct net_device *ndev = bus->priv;
-	struct dw_xpcs *xpcs;
-	struct stmmac_priv *priv;
 	struct mdio_device *mdiodev;
+	struct stmmac_priv *priv;
+	struct dw_xpcs *xpcs;
+	int mode, addr;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
