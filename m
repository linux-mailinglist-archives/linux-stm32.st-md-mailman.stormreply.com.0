Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C25C5ACB5
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 01:38:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81A7DC628D4;
	Fri, 14 Nov 2025 00:38:45 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69BC0C1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 00:38:44 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-bc274b8ab7dso1065665a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 16:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763080723; x=1763685523;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
 b=lDHeDx7FnC+IWtKQoFd5q92knEMocp2b/OPddpjEVuvBsphsvHuCvWN/UPocvjzl/z
 /XRpjbf+PxNaIdkyyTPbiylj56m53D11daTMaHCHxKaFLRS5aR68sE2A/M+FNIbTd3Y9
 R+w6//LKsjWAYyZIJDY5vCFTvPOfEEJ7wkwpAVFGiGgXcmHtDe7Yss0Nxv/TJ5bwDL+x
 rUdq+pSKNeLO2DiW/QJSE/YmUXjE3r96qMH5qrVAq0qjK1hkG+ncfOi449AvUi8R2lnE
 yqC2+1dlPF7XYSPXpOh4fJxQmUjD2uFoi0FFvFeVLIiXCwja5Ae/BjqvlcjYZwiX9v4h
 sJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763080723; x=1763685523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
 b=Af2P82ZAN3iZIiixS4KrRxG9n8GYpkCmSDOkm5AmF/sWr7XGVpuF93cKAIlXOBy/D4
 oHFVr2teOwGMW/z9Ti2K9j+Yj/rvaoNlfsmFTZrRC69cvwCbjivnSCmFTd/3COnZn2Yd
 dbmKxvsjqfwKIw0BzTyM4XoCOYSWXC0efYLLhsWmnURq+cdJUM4mFbN/vQffVnVtSFdA
 sLkVJVSKQrUirux5fhT2VbBapNNoSfwaXjEb12tQKPCsV82fSAR0gue3r8AA1kQHf7ch
 INUZ2O6uFXBq7eLqtjoiCxpInkNw1X7YO55TYrFfFxfeQdVaJGy74Oc1wp1WJp/PSikE
 eVbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX0aTtWK+5O36SyPo0vpUP7tvXHNSHm75O/EehNGV5DKCVdspwHscXwFTOtwb7BQftifi7PAKXAw1OLA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQupFG6ku1KKSYSWDQuvto9MoMs/Fx6JrOQKBLlocT8Uhfc8NP
 E/xxa6ORmczI5LrLh5kTaoGNnB39CkQ07HZHterUMeHVL++gpBqVnS2d
X-Gm-Gg: ASbGnct5i8r5EWs2dLEhoJw4+oA/gTuP3bhaulAyxfLuP8G+04e12qZ11zk1sorrUIg
 LdWQRCdA36/61JDtKnzEA2kk7CGLmxflAAxVXvUp5MtybcUrI6mjxduNnuwF0JUo9Nz1DUjJbIs
 2RK5Riz9w5Nua6NnVjq8BoZPNItx2H9V4d+Wtvhzd33LfPKyWeRnLe3OIIpYd/k4BixGllk7UW8
 MvEh7KkLWv0iZB1uaGLB2NFfGydRReEUBZVJmc2b5+2JvwsT9X0te97dzg5hov1FQVU1evKyB+T
 KdAqVQIYVWvrt5hri0grkM8N4uBYhOU9AJQESIVPfSxvBUafDu1ylf0semX2ueSI/j+wOEIdD6M
 CbpZPj8ifnCFoJs2hdED2gCD4/IEDxoJFVnHd1CvysoO0GQeN170YbLucFmLGm58Ra3+xZo7352
 0=
X-Google-Smtp-Source: AGHT+IHI/lUdW0Aaq91gtsiZA71Q/CcEnh/FJg4f8D3Tkw7Zsxdk4iz040Cwd2DXuBeB7xK+wipiHw==
X-Received: by 2002:a05:693c:8019:b0:2a4:61d1:f433 with SMTP id
 5a478bee46e88-2a4abaa29cbmr464993eec.16.1763080722822; 
 Thu, 13 Nov 2025 16:38:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a49da0662dsm4527148eec.2.2025.11.13.16.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 16:38:42 -0800 (PST)
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
Date: Fri, 14 Nov 2025 08:38:05 +0800
Message-ID: <20251114003805.494387-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114003805.494387-1-inochiama@gmail.com>
References: <20251114003805.494387-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 3/3] net: stmmac: dwmac-sophgo: Add phy
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
