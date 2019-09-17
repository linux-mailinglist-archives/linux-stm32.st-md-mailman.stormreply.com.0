Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B270EB4CE5
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Sep 2019 13:29:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76334C35E01;
	Tue, 17 Sep 2019 11:29:32 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1787FC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 10:02:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q17so2419882wrx.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=JugQhyARoBEh6axn1GkenUD1F8NS4zAnUz5g+2UjW9Y=;
 b=q/Lr9BOq/L69g4WCoKZCQ9TczATMdKu2UawnxeFAE+hhNHZC76GVOZJCaSxtRLRMi4
 hkww4gqPUO130c9uk0yzzLEpRWXquoI4YYvL1Z8XV4HfAgn45Zjk2Yb+ogUj2fbaj4js
 BtYrJMb6vHZyh/cZTduvyN8X2er9+XHOVcfOg+z/VJMtfts6WzKUdX5FPAvNW3OATEFU
 Yt5ad+VCWxlEuhQRRKjESvaqIOFBGf1TI1VfoMA9PBmo9Q6INw9uFPjKAv98Gclwv0IB
 Q6G3JXvEiT8BaNzZBYDDifwAndqQ4Fz7SMDkuA+DbQ2glFx7Aag70O2VNnVHdkA1ib+6
 RmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JugQhyARoBEh6axn1GkenUD1F8NS4zAnUz5g+2UjW9Y=;
 b=V58Cer7RKY20WjuEo3EhU+fUxt9yek0PI3cmQXLMBIogH4YN2Os/P5VugmVd27L28M
 7ZHpiDA3tw2OJuR+nyr4enHCzR6xOBvAFI5HnfdYZchbdQqiCkMcg7CRlLgLCA3cPn/c
 UBpMcvklAJVp/aHGYw2h3oFbLFbNqIEWHzSRuhVAahxfitUhm2a3n9OJQTenPP7V4ofm
 LNLGXhdyPKJ7YBMsddF4tdw+yiyoqfGXj9xvLxulaY03DWpAn6JMh95Y1xb2zmE/hSDI
 1vmB4oMEmrHWkvkYZ3/vUnkC4Pqgxuu8WCD6IZqkJ796RQqNxH9MB652Q1dhIFCJUVsR
 hBnA==
X-Gm-Message-State: APjAAAVbLjLEPBYmL/4PBNRLeCEQx3NlesM4k8JUdn0qi+gUn8Gk0FmX
 k7tmzosudw2qNdaaNZbD6Lmotw==
X-Google-Smtp-Source: APXvYqzvMSwZS6tqlEUY4Ih4eSot5R1sNRe66bMyvpYWdYsCrq4qlgih6+Z/KU8adcjHmpU7LoqqgQ==
X-Received: by 2002:a5d:6951:: with SMTP id r17mr2232769wrw.208.1568714567756; 
 Tue, 17 Sep 2019 03:02:47 -0700 (PDT)
Received: from loys-ubuntu-BY1835A49200471.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x129sm1606696wmg.8.2019.09.17.03.02.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Sep 2019 03:02:46 -0700 (PDT)
From: Loys Ollivier <lollivier@baylibre.com>
To: Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 17 Sep 2019 12:02:36 +0200
Message-Id: <1568714556-25024-1-git-send-email-lollivier@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 17 Sep 2019 11:29:31 +0000
Cc: netdev@vger.kernel.org, Loys Ollivier <lollivier@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Fix ASSERT_RTNL() warning on
	suspend/resume
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

rtnl_lock needs to be taken before calling phylink_start/stop to lock the
network stack.
Fix ASSERT_RTNL() warnings by protecting such calls with lock/unlock.

Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fd54c7c87485..485f33f57b43 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4451,7 +4451,9 @@ int stmmac_suspend(struct device *dev)
 	if (!ndev || !netif_running(ndev))
 		return 0;
 
+	rtnl_lock();
 	phylink_stop(priv->phylink);
+	rtnl_unlock();
 
 	mutex_lock(&priv->lock);
 
@@ -4560,7 +4562,9 @@ int stmmac_resume(struct device *dev)
 
 	mutex_unlock(&priv->lock);
 
+	rtnl_lock();
 	phylink_start(priv->phylink);
+	rtnl_unlock();
 
 	return 0;
 }
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
