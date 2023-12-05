Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D4805052
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 11:36:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C44F0C6C841;
	Tue,  5 Dec 2023 10:36:27 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F33EAC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 10:36:26 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-50bfd8d5c77so1856242e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 02:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701772586; x=1702377386;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/W7bRr2FIytmHTP+ve4vRfpj/k8/yIBrLP2P8LnNEk=;
 b=M17upfYM9rXGTz0Gv1e0ekuwLM3k4ernR2mI7uxOhczqQ3t4DQhlbyeettV697k9S7
 ygNx6gfLRXe0npEjkTTI6pGl9jac4tgQsn41yhqF5ZASeaJRENzv0VELsi2zj0ggAjwa
 c5DFSjmLeVzkO7XHnMbKoLkKWzj2uGVZnYhmmcX5ca1PKCzv1crEyPKQDpn1EPIfp9GZ
 fdEs7woq+f21/012IySj2VK3gfRhcrfiPCKYsE4LT7LbYJj+C7M/l7hptNxkI+/pHpLu
 rmmu8bD4Z6vvveVpm2RVGvuM4WeOYY8OvX1Vkue2yxvscbUnd9VGutj2l1mJu6YZ50v2
 nBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701772586; x=1702377386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/W7bRr2FIytmHTP+ve4vRfpj/k8/yIBrLP2P8LnNEk=;
 b=iZJwAljuwhdkXYzg8wiB5DvOQA73wfRSR3LH6SUjBexU3bbzDnBVx2z2b+bjy/m1F2
 0C/9ZG76zCnk5xYC2riWahMO0oEbVvZSvb6fv5Atu6v6TSQCqfHNaP0NQBLF4Uo2PJQ2
 N8G3Auzr4/Gwsy+vo41y5sapIcaWzEVZLgMm5D85FPSJs20hXoaLrLClq669XNKQBXh5
 MuxDEk/UH5oLYPsJrpBPXViJkB2fNZCCBLbJVPlVdrY5vvidyxGChujQv2fQKj1MJ06b
 iXb4vP+9k1wz5xwflCIfELIblR+bgBAqDOEyJwi2bT1r6tkB153AKHkxNMvcnZE363nJ
 0AYw==
X-Gm-Message-State: AOJu0YzAOoNV7/XVIyECskTOQaZmTm5dJQWgVV3dUDtuh4ds+QqrpIRk
 /l32ZzuR0dMKKttR2hswEyc=
X-Google-Smtp-Source: AGHT+IES81scnB9OAc2hliG1AqfHqUzn12268APbl0b9mr/HfSY9+lceF3Al8CkH/xAT+wtxcOc+8g==
X-Received: by 2002:a19:3848:0:b0:50c:4e7:87b8 with SMTP id
 d8-20020a193848000000b0050c04e787b8mr175943lfj.23.1701772586273; 
 Tue, 05 Dec 2023 02:36:26 -0800 (PST)
Received: from localhost ([178.176.56.174]) by smtp.gmail.com with ESMTPSA id
 v8-20020ac25928000000b0050bf7a9c4adsm567335lfi.225.2023.12.05.02.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 02:36:25 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue,  5 Dec 2023 13:35:34 +0300
Message-ID: <20231205103559.9605-14-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 13/16] net: stmmac: intel: Register
	generic MDIO device
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

The DW XPCS driver has been updated to being bindable with the respective
MDIO device registered during the MDIO bus probe procedure. As an example
of using that feature let's convert the Intel mGBE low-level driver to
registering the MDIO-device board info. Thus the registered DW XPCS device
will be a subject of the fine-tunings performed during the MDIO-device
probe procedures.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 60283543ffc8..7642c11abc59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -4,6 +4,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/pci.h>
+#include <linux/phy.h>
 #include <linux/dmi.h>
 #include "dwmac-intel.h"
 #include "dwmac4.h"
@@ -585,6 +586,28 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	/* Intel mgbe SGMII interface uses pcs-xcps */
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
+		struct mdio_board_info *xpcs_info;
+
+		xpcs_info = devm_kzalloc(&pdev->dev,
+					 sizeof(*xpcs_info) + MII_BUS_ID_SIZE,
+					 GFP_KERNEL);
+		if (!xpcs_info) {
+			ret = -ENOMEM;
+			goto err_alloc_info;
+		}
+
+		xpcs_info->bus_id = (void *)xpcs_info + sizeof(*xpcs_info);
+		snprintf((char *)xpcs_info->bus_id, MII_BUS_ID_SIZE,
+			 "stmmac-%x", plat->bus_id);
+
+		snprintf(xpcs_info->modalias, MDIO_NAME_SIZE, "dwxpcs");
+
+		xpcs_info->mdio_addr = INTEL_MGBE_XPCS_ADDR;
+
+		ret = mdiobus_register_board_info(xpcs_info, 1);
+		if (ret)
+			goto err_alloc_info;
+
 		plat->mdio_bus_data->has_xpcs = true;
 		plat->mdio_bus_data->xpcs_an_inband = true;
 	}
@@ -600,7 +623,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 		fwnode_handle_put(fixed_node);
 	}
 
-	/* Ensure mdio bus scan skips intel serdes and pcs-xpcs */
+	/* Ensure mdio bus PHY-scan skips intel serdes and pcs-xpcs */
 	plat->mdio_bus_data->phy_mask = 1 << INTEL_MGBE_ADHOC_ADDR;
 	plat->mdio_bus_data->phy_mask |= 1 << INTEL_MGBE_XPCS_ADDR;
 
@@ -618,6 +641,12 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->msi_tx_base_vec = 1;
 
 	return 0;
+
+err_alloc_info:
+	clk_disable_unprepare(clk);
+	clk_unregister_fixed_rate(clk);
+
+	return ret;
 }
 
 static int ehl_common_data(struct pci_dev *pdev,
-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
