Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01FC3FB15
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 12:17:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 280ADC5F1FF;
	Fri,  7 Nov 2025 11:17:50 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6332EC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 11:17:49 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b996c8db896so552601a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 03:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762514268; x=1763119068;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
 b=hc1kkXXPg4L/+JpYI3y2jTV3+flQzf6eIgpcQCBekZvJ49qToagAb1KqS8Th63KbdY
 PXlkw3Fh9ydyz0l3sWeve244D4a1ANMJRMUzQK6OtqFCoovL4p5oF8LKYNeFE1/f5SGW
 p1btVwQH7vYvFX12aIrcEkfMyMthFNl7PM8c+3rhWNdGqbuSGRpUELwK082KBYft1RyL
 z2SDfKlEviUmLSmSIUNLSdg5wx5/vAkUcCNACqHBe5LQ4OZqeZIRCRfNBCmRdj6aRLDa
 E1aHUf0PYdS0m6zbOlVolkPvI9uKOWy7CzCXTfTH4eRm+N+H/LFkKe6qggrzuG1BsypL
 84Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762514268; x=1763119068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
 b=oM4sgYezXZNG/AMD+UfUeSHmumtSs49NqHAplQ+9yGdN6Fg+nRpCP9puOPCtfkORpd
 eBtVEkYjFdiDbnFy7uKSNsPnb6VcwF9ZY0lLNJBDtZd2Imf2c3PCWg0FsYPsd93HhdKf
 Kd2KEAK6QkwiODp94ebUkAHyDqp6h4hs0WkDawutxicj3ocUj5b4qH2v5Vf86+DnaApe
 NF4sfyVmlElCgkv2tdqWd5r0Gk6sQeDz1ZKwmlcHvLgsWxMDd3prg5Xb2jiLMdVtuASP
 kuSNR4tiDezSG/vJ0StDHnwsXE4HVm0myZD9ynEd5ceN7IeLXZWHuCnxOZSD98tDyMTw
 e3PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/PK6Rc+LkSC2WjALCc3rJgn7y0Njv/vswdA57F6whUewnYdqyEqp529wstcyR3rxp2bJ9dCx7NzbybA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxLtBMCCv+fpIXGWOgIQQj5/pE0NJ4F/Ad0Lb/6EKG3UWz4X9YU
 jatKUstMjMlyr+yIqDTQK23eNYcN0pZDY3cav7inT7MkYwlYOm53MREX
X-Gm-Gg: ASbGncvYYQx0AFNPT9wrQWcIEW02/jBcTAKjBTa09jfUzRjMPL9fTuqZovF2DxqXRK4
 IdK6ypQkbtMjEEDASNet2LVLxRdFOWKiHY/CHZ9xtjOI8T4uY/cwO7ruGWyV+GnQ77SFQX/yKJd
 h69FcTAc3xHqfrc/1LNp5ESH7rJnqMDFGhpSUayHfWPO1Z2pfL5ijhkxVbn9zOiw5Agy0i4p46K
 KoRevDcY+924oRBwA8xNzqDIFTyatD0k1xPUPyQmU3PkoARRXxe1aYXTmn2zSphM4FYk1y90Kpj
 GFT+UCyGqHMLUtk+x5cVcDw9Q9YTHe4vPW1O51TdyPpsgsEQ5y/nJFM3cqamZWUn/V8YQCUjL58
 cNoELnvcvsStO9LKhiFjL34yRoMzbxpznmeJCkT6pbz+O9APSrN38CvLOtE/oe3RvtcPC/5vXkR
 k=
X-Google-Smtp-Source: AGHT+IH5sLTuwaNwygjS88Dd4DuKT5eyLF2e0aAe27R6LJvuFCPtCu+tqMNQVj8foqUaUxe+5POBzg==
X-Received: by 2002:a17:902:f544:b0:295:9e4e:4092 with SMTP id
 d9443c01a7336-297c0485f18mr38236515ad.56.1762514267918; 
 Fri, 07 Nov 2025 03:17:47 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2965096825esm58574245ad.3.2025.11.07.03.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 03:17:47 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Fri,  7 Nov 2025 19:17:15 +0800
Message-ID: <20251107111715.3196746-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107111715.3196746-1-inochiama@gmail.com>
References: <20251107111715.3196746-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 3/3] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

As the SG2042 has an internal rx delay, the delay should be removed
when initializing the mac, otherwise the phy will be misconfigurated.

Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..fcdda2401968 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -7,11 +7,16 @@
 
 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 
 #include "stmmac_platform.h"
 
+struct sophgo_dwmac_data {
+	bool has_internal_rx_delay;
+};
+
 static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 				    struct plat_stmmacenet_data *plat_dat,
 				    struct stmmac_resources *stmmac_res)
@@ -32,6 +37,7 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 static int sophgo_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
+	const struct sophgo_dwmac_data *data;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -50,11 +56,23 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	data = device_get_match_data(&pdev->dev);
+	if (data && data->has_internal_rx_delay) {
+		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
+									  false, true);
+		if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
+			return -EINVAL;
+	}
+
 	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 }
 
+static const struct sophgo_dwmac_data sg2042_dwmac_data = {
+	.has_internal_rx_delay = true,
+};
+
 static const struct of_device_id sophgo_dwmac_match[] = {
-	{ .compatible = "sophgo,sg2042-dwmac" },
+	{ .compatible = "sophgo,sg2042-dwmac", .data = &sg2042_dwmac_data },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
-- 
2.51.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
