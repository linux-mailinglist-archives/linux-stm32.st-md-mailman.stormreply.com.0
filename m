Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B03334F9078
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 10:13:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69300C628C3;
	Fri,  8 Apr 2022 08:13:00 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F8BAC628AE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 08:12:59 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id p25so4212224qkj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Apr 2022 01:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1kYgClPNkXttcnpJuxPc0b6ZRe4IN7sg6hgxvxZY2I=;
 b=kyEjHYb+mQEqY7tdjXMs0+hof/gNfwAwz9dja0FAcYnl7Kn2yZMySrQKi8P9cC9n1c
 CrtjN1tyIdNUF+51+SrlLfuU7ya2y0WJG246oGGjod0iZExbZVBbxz+lGF1Db4h/s2qA
 i6Id7+u85d6f6SJ9fRU8zrC9Iy8Rw9JXIieXMCRdohRYua+ZYihU6UkNdqGlGYDPoQ8u
 5r+d1x+aw1ZgnjTyjkG17EDh5N7rJJ8+Of6ms6W/m0OflU8zKwhmz2dJXJXf4PQjJZIr
 ASahsPzrYQ3mTyOjiwbFaQSNl8+tdhB1PhF7L3BP8uSvcE5CKutKj9nyn8Gv569dZdOJ
 ICEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1kYgClPNkXttcnpJuxPc0b6ZRe4IN7sg6hgxvxZY2I=;
 b=nVBqRotYdw/tUhNA7HXRpRWOsfFLmF6VfBi7DsgUP+WULu6cI9LmIykbKo2wgOt6lC
 WPhDXC3icDGF8T/4yDJrLh/V5A27UcA47JaWmDfj7Xe0xu489Tnd6U2F1tOEpl35mJCL
 eqD5O+FQPezHYvbHmE/vfA3P9sF/UVy8PMXVvYL246hJPLJEcJyeg27gjqWg5KOzT0ht
 olKSbTWh/zX1BfLrKSIt3N4LRW4CfXRVOVxA9vNx1ycbzuRNKJ2aMSwOhSikrI0zK7o1
 UrVdro7rF3HQBGp3R3ZcmS2pJ1tP3wcfuhzmqXuNJ0+PN4Yr1aD03/47SE/hnD2gV8JS
 cZ+A==
X-Gm-Message-State: AOAM532ueNXPg7sLpuH9NFxfQ/Oh97AS8YbxHuI3JIOKC8/PO5oQGBtA
 aIigPDsJCb1c2lgiCPtX2T0=
X-Google-Smtp-Source: ABdhPJxW/8z2WJJs+ZAhz+Xmzvh9kcBG41vVI4/HDjmZkkMAhj9pbXxrlb1zk92Dm7AY+6aJROjPYA==
X-Received: by 2002:a37:787:0:b0:69a:854:caae with SMTP id
 129-20020a370787000000b0069a0854caaemr4189817qkh.20.1649405578000; 
 Fri, 08 Apr 2022 01:12:58 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05622a170b00b002ebc9d47207sm4985436qtk.91.2022.04.08.01.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 01:12:57 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: peppe.cavallaro@st.com
Date: Fri,  8 Apr 2022 08:12:50 +0000
Message-Id: <20220408081250.2494588-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, Minghao Chi <chi.minghao@zte.com.cn>,
 davem@davemloft.net, joabreu@synopsys.com, kuba@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: using pm_runtime_resume_and_get
	instead of pm_runtime_get_sync
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 24 +++++++------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index a5d150c5f3d8..9bc625fccca0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -88,11 +88,9 @@ static int stmmac_xgmac2_mdio_read(struct mii_bus *bus, int phyaddr, int phyreg)
 	u32 tmp, addr, value = MII_XGMAC_BUSY;
 	int ret;
 
-	ret = pm_runtime_get_sync(priv->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->device);
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Wait until any existing MII operation is complete */
 	if (readl_poll_timeout(priv->ioaddr + mii_data, tmp,
@@ -156,11 +154,9 @@ static int stmmac_xgmac2_mdio_write(struct mii_bus *bus, int phyaddr,
 	u32 addr, tmp, value = MII_XGMAC_BUSY;
 	int ret;
 
-	ret = pm_runtime_get_sync(priv->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->device);
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Wait until any existing MII operation is complete */
 	if (readl_poll_timeout(priv->ioaddr + mii_data, tmp,
@@ -229,11 +225,9 @@ static int stmmac_mdio_read(struct mii_bus *bus, int phyaddr, int phyreg)
 	int data = 0;
 	u32 v;
 
-	data = pm_runtime_get_sync(priv->device);
-	if (data < 0) {
-		pm_runtime_put_noidle(priv->device);
+	data = pm_runtime_resume_and_get(priv->device);
+	if (data < 0)
 		return data;
-	}
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
@@ -297,11 +291,9 @@ static int stmmac_mdio_write(struct mii_bus *bus, int phyaddr, int phyreg,
 	u32 value = MII_BUSY;
 	u32 v;
 
-	ret = pm_runtime_get_sync(priv->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->device);
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
