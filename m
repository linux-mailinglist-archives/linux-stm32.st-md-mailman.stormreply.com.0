Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D049585A8
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 13:22:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02FB0C6DD6B;
	Tue, 20 Aug 2024 11:22:01 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3146FC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 11:22:00 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1fee6435a34so33877435ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724152919; x=1724757719;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uH60Yd1GI3CU3D/wod3TAuxBQI34Kzg4R4dXcyLgk6M=;
 b=XwOCht9g7oL6KEs2Ve4JP2J4C8wxFYd4JJWsBk4JGZRqZplMH/X7093ZHj5qn+pzup
 OS6AkDaXhT5Ht7HrLH8Ytj1M20cNh2yOpb5UC42I7zxPsYr7ADTkGaHQdmXzZho8iKOW
 EMzyMZpz6etjXec0YHEOiMRmFF/AqJmvqzZBhq/Yc1GkkDzaSZ71x7drtnltfE9j5UJW
 9rDV1ywq3hVGLzsyv4T50kmX1nFzNabLxGUrH0M9BxOixmA0O3hROC68neHvKvrS+Jid
 bwsyEktemYn6tM8p6E4L9WkI8z6Fxiw7aiaXsDQAe2SDXbW2YYciuvefonw+L29+Cj7B
 oyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724152919; x=1724757719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uH60Yd1GI3CU3D/wod3TAuxBQI34Kzg4R4dXcyLgk6M=;
 b=IlPvmAmQ2XP6vcftU4xwfgOu4L5E9Evrcjz5bN6P4FjOi+CBPTRRJ/4d1SGN1pb1Zn
 63HnmO0hFfnUNOS4OL9ilSQxHjk0fWJsR+1qDs8dSyBiQYePMIEwWHw6QJ7CmjSlriuF
 9MPQPAXvMv3CYv3MenFSGf86XMHNrpSImU732eIdLk6BZSb8xxH+p6jYRge7AmsgG2ts
 kiVELU7pXI1CIMnBfB+TlA4zFI9+H8xKA6/30MWThR9Fu//q0t9H46q4vCqHlKez4tkM
 aHvch3zh2Y0sF18m0UoK1PQ/LJpl3kEGoYxxL+hcSnZn4chUZWVrtZU5p95ZX6rgl6aE
 BjEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt9NfAPQlHMGRptLbp3Dt6xpvYmnj/0hJ3hjW+XTyozyf0s9PHDkdJVaKNonZ8WlH9+3Q6RJm1J259w4GniGuuWPbtv8xm+xh+azyAaO6CqIV/E6a7jHTk
X-Gm-Message-State: AOJu0YzO08s2fQT8tcj7Mp0rSkWfvpuX8d8H0huAfdMUeYdwwnY1Updh
 JAnDqlwwz6T5MCM3vWERqmqVBZfQhIkOxH8pdT+b2hLE6R7Opu1I
X-Google-Smtp-Source: AGHT+IG4H2W2UWmxm3iIQNPissd+E2bV0K2IjKg1ybnv6wOED4VkqMdaFdnlLdQ2a9a2rhVaCne0HQ==
X-Received: by 2002:a17:902:e5c8:b0:202:35e0:deaf with SMTP id
 d9443c01a7336-20235e0e226mr80591885ad.39.1724152918682; 
 Tue, 20 Aug 2024 04:21:58 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-201f03756f6sm76465355ad.172.2024.08.20.04.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 04:21:58 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 20 Aug 2024 19:20:41 +0800
Message-Id: <07ea91555fe6bcf86f287549ebb23fcfbe5cc115.1724152528.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724152528.git.0x1207@gmail.com>
References: <cover.1724152528.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 7/7] net: stmmac: silence FPE
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
index dcf2b5ea7b4f..a5d01162fcc5 100644
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
