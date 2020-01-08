Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B14F133C40
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2020 08:26:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0421EC36B0B;
	Wed,  8 Jan 2020 07:26:47 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91DE3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 07:26:44 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id az3so749254plb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2020 23:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7VftiggN6dkZ3Wld3EMtRQ7oFxfSHkKpxj6onZ/SbJc=;
 b=Glfycd+SSp+dBJBi3Ypl6EParnW4iGMSf+JYdW6Pd3J68JqoN/r8bol0HWwKdYSZ15
 zc74LTakqvZhLaMNTzaGrk4zGl+4xLp1Qbo+Aca8Yz9MYe0qqOYqb3ZC/1GsUIt/id0e
 uY9yR8PG2CcCbVXnpVfKqQ0kd6CTtdZ485/ggaCNAIGfJDI5yo6Rnr2mdRsfHb9TGi6+
 LbcR9mwVMnpWIiu8rX3oPPdUxIwe3Htdn4XXDrMYQEbZMB+O2cyDOlT4WZBk3eXVaSHY
 RdgxoHjAveUdhnyjGWm78KpGL2OyLi/zIcEyhCrDvy/SgGpdF+kYdM6OI/5jPh7Q5aD3
 YT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7VftiggN6dkZ3Wld3EMtRQ7oFxfSHkKpxj6onZ/SbJc=;
 b=IH/Nm+41FubXYU1NPSO0X/fU1GC1SSwV9v9jvdD3vVPdz1QkE6xlADXk6TmrXwg4wC
 xZ2XTDG5Dk/Micyg4Igpqjw1KAd+BADyZvIBijwE9uP6dBfP8GR9Dqv3cmIJ0h7W0v1i
 FefTxfmd0PQpGyNg9GD5Jy4W7ycoxwSKZD1Qc55+tFsaZWtvES4R+MdbFNifT5nky6Xq
 0xvhdBiUQ4expWHijJrDhayD+tXtbbm2RFrRNtU1tbBUVi3J0NXVzwFV40JqPEXaD9gE
 6q7PQXj9gGLBvr8xCBf0fQN5AseYhspr+yYeNdjh9SsflX3xr54Lc+84baG2wQdrJvXG
 DcAQ==
X-Gm-Message-State: APjAAAWIgrz+0K0nGX738tyKOFHaX2Hg1ELfYw4DrB0PLBXU4mXtiRjG
 mjOOHBzZM6bVjvyNGjOQ8DE=
X-Google-Smtp-Source: APXvYqxbFTnUZ6d8VqD/d4wmwctKRYDWxkXacHotBt/0Gx6M6rHuYA5t3zbUJvR7A0x/TKP1/atRdg==
X-Received: by 2002:a17:90a:c706:: with SMTP id
 o6mr2758419pjt.82.1578468403228; 
 Tue, 07 Jan 2020 23:26:43 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id n4sm2149624pgg.88.2020.01.07.23.26.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jan 2020 23:26:42 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com,
 martin.blumenstingl@googlemail.com, treding@nvidia.com, andrew@lunn.ch,
 weifeng.voon@intel.com, tglx@linutronix.de
Date: Wed,  8 Jan 2020 15:25:50 +0800
Message-Id: <20200108072550.28613-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108072550.28613-1-zhengdejin5@gmail.com>
References: <20200108072550.28613-1-zhengdejin5@gmail.com>
Cc: netdev@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/2] net: stmmac: remove the useless member
	phy_mask
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

The value of phy_mask in struct stmmac_mdio_bus_data will be passed
to phy_mask of struct mii_bus before register mdiobus, the mii_bus
was obtained by mdiobus_alloc() and set mii_bus->phy_mask as zero
by default. the stmmac_mdio_bus_data->phy_mask also set zero when
got stmmac_mdio_bus_data by devm_kzalloc(), so doesn't need to pass
the value and remove the useless member phy_mask in the struct
stmmac_mdio_bus_data.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---

Changes since v1:
    add this new commit.

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 1 -
 include/linux/stmmac.h                            | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index cfe5d8b73142..662b1cde51ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -388,7 +388,6 @@ int stmmac_mdio_register(struct net_device *ndev)
 	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%s-%x",
 		 new_bus->name, priv->plat->bus_id);
 	new_bus->priv = ndev;
-	new_bus->phy_mask = mdio_bus_data->phy_mask;
 	new_bus->parent = priv->device;
 
 	err = of_mdiobus_register(new_bus, mdio_node);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index d4bcd9387136..e9aaa9bfb304 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -79,7 +79,6 @@
 /* Platfrom data for platform device structure's platform_data field */
 
 struct stmmac_mdio_bus_data {
-	unsigned int phy_mask;
 	int *irqs;
 	int probed_phy_irq;
 	bool needs_reset;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
