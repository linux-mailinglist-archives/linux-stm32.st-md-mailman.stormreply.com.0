Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3C27293C
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jul 2019 09:49:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AB18C424C9;
	Wed, 24 Jul 2019 07:49:06 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F25DC0690F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 22:28:25 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k20so85279458ios.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 15:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pU9a7WDmDblNhHtORn5q1an88I7KvX3awfI/tpZswsc=;
 b=vTUBTfU3WRSbpoLXj3LQRCNpjzD333/dk4AToQ4R+yDDRRvC4KUPHKNSgN9l7LMX57
 3mt+PJntp8PCG3uGt29gQ4J9yoGL+R6fRpRO0WzvNPgtHeaSGxBavFHBsDkXX+ZTwNXq
 +G8KudPajVfM5q3ZSUAASyzViApUZN+Hs4u5iHJY06VgI0tsyEfbpSOxuyEutjEvw64G
 yVYw4ZwX9RCTYumtERA/by6KsC2fwayQBmcUcshaSSKFyIkpMm4YKmb/ldsZnrz02WKK
 2wGhkLNKm+xZEDgKN7x7aFgBXX6V3z4iJ4jmcr7+2ZWX/ACVuwkwcT7oWGoSWHqViAKH
 fTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pU9a7WDmDblNhHtORn5q1an88I7KvX3awfI/tpZswsc=;
 b=JXH1h4XLSaM8t3PsrRVYX/CfMC+77pjo+WYG4HQZvYALgq4lWWizecdLKMMvZINATq
 jL9NBKPXiGwtUxLgzmN3TxSVCXwc432VRnW3Z13ort9LZ7IkYPtochHc2JibG54OXHnd
 niteAQEpEfRdKeEZKy6BpIq9exbancv1pu/jo0/46qOzEt2si2X7krxGQmZh1wjywKee
 Z3TsryBTlf5up53jjBAmLNzTODmdL5nGuRr4b3Z+VxgfPBExTBwMI3tNM4zESTj0fbao
 l5XSACJ6YOcl5AMUcO+s2fztpCBWsZu5dRYRRgm1V9Rhl9C+fzAvA4YuW0Lvk2LY0iPR
 hYBg==
X-Gm-Message-State: APjAAAXJXFYHcI8XFLxnuc7vlzYo90tHjP910onQSK6RMH5Eg/RoZ3QV
 owGSOJPCz9gIvsab/Tb9hwc=
X-Google-Smtp-Source: APXvYqw3itXpwcxCPWEGgT4oxNdiQSL++cL7fM7qnjdamhn1oCj7qCS8wG0y7AsQnIb8WWfLJWqK/Q==
X-Received: by 2002:a6b:dc17:: with SMTP id s23mr67568306ioc.56.1563920903840; 
 Tue, 23 Jul 2019 15:28:23 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id f17sm41593017ioc.2.2019.07.23.15.28.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 15:28:23 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Date: Tue, 23 Jul 2019 17:28:09 -0500
Message-Id: <20190723222809.9752-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 24 Jul 2019 07:49:03 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, secalert@redhat.com,
 netdev@vger.kernel.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, emamd001@umn.edu,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, smccaman@umn.edu,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [Linux-stm32] [PATCH] stmmac_dt_phy: null check the allocation
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

devm_kzalloc may fail and return NULL. So the null check is needed.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 73fc2524372e..392f8d9539c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -342,10 +342,13 @@ static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
 		mdio = true;
 	}
 
-	if (mdio)
+	if (mdio) {
 		plat->mdio_bus_data =
 			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
 				     GFP_KERNEL);
+		if (!plat->mdio_bus_data)
+			return -ENOMEM;
+	}
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
