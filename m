Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F91C22DED
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 02:25:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4858C62D97;
	Fri, 31 Oct 2025 01:25:05 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F817C62D8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 01:25:04 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-295018cbc50so16429775ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 18:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761873903; x=1762478703;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41C7JOVgrQjYgPjIau43ZnUjOEp2Qu+RhNpr65HbzYc=;
 b=AUuXvQJGu8n965pBdPaKFFjKajWaISVHJVuhd+Set176XrLvdKCA4v6lPPkcGw5JY0
 54aSvTYQWiIDjbVfteo9wRS3mc5G6Jr3D35/WufV26wXYOGZIMRWHK9BBmgrPCWpmpb6
 UJVFL0vaEtexupPQD4wIc+MfO90INW6BB+Zj7CG2ec21q8FhLQ5P3re6k+Kg+J/3MmwP
 FB1PeWWfy6YqOur//M0x0brt3PwV8dVBsaWuIr65UFv4vAW1I0r4I6EOvBgljxojjfqO
 AhVARTV9eitrqXAJtMCGHRQNKMXy8Xn4yGKt4xiXFCWeoyHQy27DVGldXsJ69pANHf7N
 KZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761873903; x=1762478703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41C7JOVgrQjYgPjIau43ZnUjOEp2Qu+RhNpr65HbzYc=;
 b=PVIssEgh6oM8Fa/McI6rNzFMQNGgsVQTTxk8W/L8DjbzCr9c4Y/RXC6epWSkps4jUa
 XlLqsAxS9iblA1/Vkingx8/iTDD7p8eRTQyHwD9v1xgocnTL5tuqhrjYp+lCxO1bS3Qg
 dFgfjLWbGrRLFpDJ7WPic9BG4zDqwoZvmCuaTRRy4l1MLk8BMjnVKXyn113cmwLcK/8n
 Q8ZNQY34kuCd2BeXi4pCxt6YxYC2yWbPHLrf5/lIrulztRbcvcvgVadQyiFKvfjJ60Qp
 p7eZr8Spv+CSbgLeuZT0+OV13kQ37s2D3HLb7Me+nodlHg9nHWIRF/Qoqw56rdcD2CiA
 I1QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc/5jhONhk0daOZSbd8SRJevp/ooSjcbQXiBYkBrmZF7HxpWthgJlVbkOmE1h/XFPNJoTBwhhgCKIDuw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysPVvIWpZaorW+zKy4mRE2DJSLIazxFGAzF3+c756qD18EtnUX
 wbraF6JalJyK1sbJgrYJ88EatOfubZ5/niHOGlepdNkFicVIwFCYZfYl
X-Gm-Gg: ASbGncva0EMz9wZYdajesi9VeYiTnsHad6csW5E9PbeItFU79iTNiIb/DuTFnyl3dR9
 oHqEHeQFbQfdh+Xn+KGee0qBi8BYPQFTDwFiS6B5FU7D660ppkYGXwbrJVd9IB1enSrvT1YrZ4l
 lJLfqFz7BNT/CuTJ/NFTGXMtZeKUolEX2VEbj84MJm5ECXHac0bgIOw9wP4fXTAnXOb9mz3k0u3
 0Ody5O4nQ3s8yk3/qMkXhucIlsFZzMHesrSROiEaHOc97kWh7vT/bKj3TXbgFAZUO1mMZhmKtB+
 KE0w9GQxmtG0Di7IDDFx5Gg+DSWVeTV239hzJl8orihAxOUVd9YMvZp0Jn7D3Y4YLu2n4jfcaFz
 WyMT9iFt3WnTlQwkiZiRrWLU7TIWSnAH8a2uZ69ZayZ+LikRSiHXJ3N1v8xnu0SSvbvQvAoDDaQ
 M=
X-Google-Smtp-Source: AGHT+IHwNetbUfw9P+CF7flRnUxbKMyy0u3v4NGRme8B70TIIYaaZvAcpehaNR0ztwmyhfdRon+uhQ==
X-Received: by 2002:a17:902:c94d:b0:295:164d:cebb with SMTP id
 d9443c01a7336-2951a539003mr21231175ad.47.1761873902502; 
 Thu, 30 Oct 2025 18:25:02 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29526871836sm3248465ad.18.2025.10.30.18.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 18:25:02 -0700 (PDT)
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
Date: Fri, 31 Oct 2025 09:24:28 +0800
Message-ID: <20251031012428.488184-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251031012428.488184-1-inochiama@gmail.com>
References: <20251031012428.488184-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 3/3] net: stmmac: dwmac-sophgo: Add phy
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
