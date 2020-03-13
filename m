Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D7F1849B5
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2020 15:43:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA2A8C36B0E;
	Fri, 13 Mar 2020 14:43:09 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AF0CC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 14:43:08 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u12so5092294pgb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SpWWV8Vzt0B/4ORSdBbXWuLXrkvKyLnGYjPx6j+va9s=;
 b=m5LgmXEhwH7qCMpy8AMDQtFnKbFzLNd1lr8HbI+GFBXXqqW/U4D2/KYjmL2jzG7Gkx
 M1tgXjecGU60owDjsMItfb2FLXxIV0w58gQtMcgOUtkpmit0RQOA2R/IHV1yKcKQwhv1
 2Kl2JDS6eL/Ykw2oMVcgdxPBxDCejryFlWxySlM/eK/yjHzoq+/DYHygSkqCHV6DsSVu
 3rulJur/sf4uP23ZLtnbmejV+P0cZ3W+hz3WbGfpA0Kghk2bOPYnnPymXChNVon3NHU5
 9A0JPNXyrG7c6ND4Y7seYi+1uljFG0f6rCPiJhStPjqtVX842n1R0PL6Vq0R7ww9jBwA
 awzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SpWWV8Vzt0B/4ORSdBbXWuLXrkvKyLnGYjPx6j+va9s=;
 b=r3yb+hSAcQPplqROJ1DPsnGcoHvZt4LX8XGPDRyzNt9RK+M0QZjoyDAdjHNq2KFNBU
 d/joM34lBvdQp98pDpOq/sZUwoRMb6UHUS0Rlxq8aMPlpG6XWPE69jo2vQ3J1eGKWqol
 E3D6zHdBGUwD3uHcFocbiVK53XP/adsfkJdKp1lV4D4uvPuVj6QMglLqHF3PQ22J4Qhs
 uWvMorhXc/A5ThDBveCFvDydHgfIq/HVnoglKXVYQJih+/diJbi+owzYa2KCW136njIy
 UHMS+zv1yZxK53TQsBafAXQ4oLC2tilcMQzNJF62lJm6ZeKgiTR+g2e0sxnvWch8ik2v
 Z1dw==
X-Gm-Message-State: ANhLgQ3yyeQWCTJ5lBF5AV0/w32coJ93SdbT3zq8c6bIkVS9hEiEgmG0
 sxfgeApiZSfvLFrowFLHkfk=
X-Google-Smtp-Source: ADFU+vvCSWa2zU2rVO+1qqNp6WqSxenT9MGNGT5GMXvMz5XxJH9Q1BP281Kw1otg0AVl+FTOOIzmzw==
X-Received: by 2002:a63:6907:: with SMTP id e7mr13366263pgc.445.1584110586743; 
 Fri, 13 Mar 2020 07:43:06 -0700 (PDT)
Received: from localhost ([216.24.188.11])
 by smtp.gmail.com with ESMTPSA id f8sm1000121pfq.178.2020.03.13.07.43.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 13 Mar 2020 07:43:06 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org
Date: Fri, 13 Mar 2020 22:42:57 +0800
Message-Id: <20200313144257.9351-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: platform: convert to
	devm_platform_ioremap_resource
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

Use devm_platform_ioremap_resource() to simplify code, which
contains platform_get_resource and devm_ioremap_resource.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d10ac54bf385..bbc0a2ce24c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -645,8 +645,6 @@ EXPORT_SYMBOL_GPL(stmmac_remove_config_dt);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
-	struct resource *res;
-
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -674,8 +672,7 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 	if (stmmac_res->lpi_irq == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	stmmac_res->addr = devm_ioremap_resource(&pdev->dev, res);
+	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
 	return PTR_ERR_OR_ZERO(stmmac_res->addr);
 }
-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
