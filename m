Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0675FC122F0
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 01:39:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBED6C628B0;
	Tue, 28 Oct 2025 00:39:20 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1484C60495
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 00:39:19 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b6cf1a9527fso2752736a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 17:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761611958; x=1762216758;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
 b=Z1z2+OoKZ3Dr+kHwjB8ILBKPuRGJr2+lLMHlIgjL+Z15i+BwAOUnz/Z1BrAnF0/SvI
 +Ah5FTJ8IlG/h/XZ7KSUrQWdZga32cHSC1cdEHm6qoPTpcON0pVDtWSiylGfxg6NYfsC
 AXGzvB9yKNyCld29BbQL3HeSGJgOyfVnxCsdJCuPWDF3W/3b3+u6vRJoLVbaZrSe+sai
 54fuv/LpX/Gw4TuuvNUD4J/OiQFTpMeEI9sfJWeW+2EQWIgmlhDfFojqZT/Wzrigdoxq
 CKyWrX5wsqaWolEOSY8w7i1Y2ynpLkQYcexJQuGEfQRWuyentIk4Rq97yRjm9cCYqjLp
 9cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761611958; x=1762216758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
 b=DnrOzMVClfZqh48lC2MVMRY8zJYhYyQOlslBkSaLNX86V2Wv/T38B5m9aCP/2lgtaC
 MujHjqeIa162Y+CRms4h1q7yYa2vBA9xIO4ZHXHGeh2OroSWfBWBXlilcwAwa37P1+jn
 hJ4zH4SY3uezwuXYyLLk3eLyuXU3T6p3ijIDk5RPwwy5ocf2bgQjrJtBuTU8yrVhDvCv
 7Rl4YGMlZhjG28ve1PvoW8IY5oN93EAykrQ84PnTqAuk63wgLosmzkieBS05CiohQ/qQ
 0FNlHHPqG6/Om/9uaNKMwQ+zq1f/0gLdMEQqk/L6lfNNy7ai/08nDdftKcZ8NL8WURDN
 hQwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCn/Y9LzDCt5eCiTPHe+Ltk6mcjIOxfjg6LxD3gvAsoPuvAls2xZwmBORbnk3xBkOl8tCMOJlCFbKz/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywoz+x4ZywBdiQAojsR9C0R4aZaoMTuzkZfmhjzaAeAPFdm2v78
 KDUem9FUnShAKHSW46jjOQTVuls/GD6QyL18deHW6/YeRA2oAy7iFVWQ
X-Gm-Gg: ASbGncv6nE5YQKyBg6bJn7X2QUVcPgJVi8Fd3U6yY4iGMeNcwAY1LU0++Cr7kdZSiLa
 hKKgvW3KtAfXWW34wfwL8N6ysciKeDnDuMhqvDj3jgMFAmqQ6eOO7CZTRhm+e0/+s3fAwI/Cl4d
 24TKS+q9JbLAANjOzFFF/Q7ySZRz3E3CJg+KtVpnQbngkSdxXWGsNcaSbsTyTJwcD/foT7ik5xF
 cznHQ2yTaTu4dEQ7ipBjQ2XyLc8NzvjY/VFgUdaCz7TDspOUCSKxuxgTPYvXEGYbqkLGi36ex55
 bu5AfoNtIQKaZJ/E7WDcYavv9QQ93g913/pKp4lZx91L8vtEgM5xvdpUxU+ODuhYDv7j5pdjbYr
 OGpI5M1HA/BTtzCYLtm1zY1rpbONZ7MSEGMOIL5I+lDWouizhcu7qhhmvyDGLuZTQ7C6Vlm6cBd
 PhxrWARVqGIw==
X-Google-Smtp-Source: AGHT+IGvU4zqUoctToOTJAwyDs9+4diulCuRP+v5NnW7F2ld07v4djcWl4rSSI6JXslPZV+bpZFdZA==
X-Received: by 2002:a17:902:ea0a:b0:271:fa2d:534c with SMTP id
 d9443c01a7336-294cc74e4dfmr14030645ad.22.1761611956679; 
 Mon, 27 Oct 2025 17:39:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498cf3bbcsm94917065ad.15.2025.10.27.17.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 17:39:16 -0700 (PDT)
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
Date: Tue, 28 Oct 2025 08:38:58 +0800
Message-ID: <20251028003858.267040-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028003858.267040-1-inochiama@gmail.com>
References: <20251028003858.267040-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 3/3] net: stmmac: dwmac-sophgo: Add phy
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
---
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..7f0ca4249a13 100644
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
 
+static struct sophgo_dwmac_data sg2042_dwmac_data = {
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
2.51.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
