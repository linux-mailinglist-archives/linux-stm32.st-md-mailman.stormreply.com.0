Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D1B9582DA
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 11:39:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 261EAC6DD6B;
	Tue, 20 Aug 2024 09:39:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7371C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 09:39:34 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2d3d7a1e45fso3042982a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724146773; x=1724751573;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDtdR8L72ecyhWl64ylKYwjwtNgYUGDBUuM8QKvBiWw=;
 b=f5aTcI8T5u2tiU+cW2QouhqY2vLve8JbGCjNh5vutUBGRXsmGlRy9DEwbihtTZ6hJ5
 OSnxmzD7Octk1OydDgs9irkGhLhRU0AhLSGYlhm+MTOICwj2gH8z17lQsSeEV5fMx1Pq
 aFzhhTkfs2RHOUwsrDUKpi5bxmjyxFj4lOpWPOHq06/XCud/uRjqMiFxQjgZZnd6NYeZ
 SCt6oOBADCkyKfVii7PfynAbEoBC+Bgy6UXZQg08PYyW56iqgUuFJ1+NvOUumRSU+/Pa
 C7k6k3V9108CtjSY1APQz2NA29EIb22lh74MjOEvZJnt3L9Uj0UxCiV0CmDw/MeLwLa6
 PFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724146773; x=1724751573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDtdR8L72ecyhWl64ylKYwjwtNgYUGDBUuM8QKvBiWw=;
 b=I7TDEd/meKamTSdpVxDePv+hIbUNHqvotJlQwUtWcizAaJij6iZb6u7dgu+EV+XytS
 62hKw+WiHX2zLMvXWOWWkLHCMOs3jjlhD9crjKxwy/0p1f7M8THOGzZzsjTKJ+ONNILT
 Rjr8hPMhk9OdfUr4OpgEvP0sdjUClrdK+XLbN3u6+IxWIG8SHHwcsL2uxlBTAO5Se+Rx
 LM7cOhik/jMv7PpMAGtVmRMPdRd1js+QDMguBnp2RbQvL5MlMReBxiVbCM35LnvhB2p1
 zEKpOCDhl1NK8Doigsmu+6F30b/CiSu5yAIH7IAN+ew0hTUkHnQvA/hCufmC1hYIdA3K
 kiwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXceYmcFHanNFxzCJ65DQyrTeWZhmPm7Q9jO9Qa+JcC6rVEcWL4rIKS3iPtOJSR1/ZMMOOZ5fkCuXM51Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXLRdFT+YZV+7GU/xzpoebIluogRwTBobw6lsCyjv0ibB4v9y1
 nABNR8PFF76PeqAZgktc77W/PREcIsTyT+rUNNI0SVI4CqE8SOmtTXKMZQ==
X-Google-Smtp-Source: AGHT+IFM4ALEVhEA9jwy8QPIVnmjGZziok5D7VHZfUwJtcYii+q/qpP+UCWZHHS37xt6cRdHvesDRQ==
X-Received: by 2002:a17:90a:c918:b0:2c9:7cc8:8e33 with SMTP id
 98e67ed59e1d1-2d3dffc0fe9mr13661819a91.13.1724146773301; 
 Tue, 20 Aug 2024 02:39:33 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d45246061dsm3230608a91.8.2024.08.20.02.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:39:32 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 20 Aug 2024 17:38:35 +0800
Message-Id: <3d7f0ad310e02b7c604df6da1408e141ad4c2e2e.1724145786.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724145786.git.0x1207@gmail.com>
References: <cover.1724145786.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 7/7] net: stmmac: silence FPE
	kernel logs
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

ethtool --show-mm can get real-time state of FPE.
Those kernel logs should keep quiet.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c      | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 1e87dbc9a406..c9905caf97ff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -620,22 +620,22 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 
 	if (value & TRSP) {
 		status |= FPE_EVENT_TRSP;
-		netdev_info(dev, "FPE: Respond mPacket is transmitted\n");
+		netdev_dbg(dev, "FPE: Respond mPacket is transmitted\n");
 	}
 
 	if (value & TVER) {
 		status |= FPE_EVENT_TVER;
-		netdev_info(dev, "FPE: Verify mPacket is transmitted\n");
+		netdev_dbg(dev, "FPE: Verify mPacket is transmitted\n");
 	}
 
 	if (value & RRSP) {
 		status |= FPE_EVENT_RRSP;
-		netdev_info(dev, "FPE: Respond mPacket is received\n");
+		netdev_dbg(dev, "FPE: Respond mPacket is received\n");
 	}
 
 	if (value & RVER) {
 		status |= FPE_EVENT_RVER;
-		netdev_info(dev, "FPE: Verify mPacket is received\n");
+		netdev_dbg(dev, "FPE: Verify mPacket is received\n");
 	}
 
 	return status;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6d7aca411af7..e2e1f1d6ff39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3378,7 +3378,7 @@ static int stmmac_fpe_start_wq(struct stmmac_priv *priv)
 
 		return -ENOMEM;
 	}
-	netdev_info(priv->dev, "FPE workqueue start");
+	netdev_dbg(priv->dev, "FPE workqueue start");
 
 	return 0;
 }
@@ -4058,7 +4058,7 @@ static void stmmac_fpe_stop_wq(struct stmmac_priv *priv)
 		priv->fpe_wq = NULL;
 	}
 
-	netdev_info(priv->dev, "FPE workqueue stop");
+	netdev_dbg(priv->dev, "FPE workqueue stop");
 }
 
 /**
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
