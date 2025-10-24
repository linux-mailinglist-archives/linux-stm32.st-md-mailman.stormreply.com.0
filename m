Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4337FC040E0
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 03:55:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B090C5F1C0;
	Fri, 24 Oct 2025 01:55:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85B14C5EC7E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 01:55:48 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-27eceb38eb1so17039025ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 18:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761270947; x=1761875747;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
 b=FHYTyHrx8cwxGq/7OzQmo38mBn3Qov/W3gEcvdwOp6zd59XqYhPLtfl7nqYhBINa7z
 R5dJWHLAsxxxlJQtnu1VVhamiZyZJbkfngz8BAg908+PTPahC7eHZ0oqxSHxICn/vVp6
 /nkfR1oPd9gGQMv5PnN9+X6biJ/Tg7Bp9olYogOWqEhq0WTjieGcXUlkqTrWRC1Cvnit
 xECGyOUcmU8oBSFCGKZpSqtsqpR43dszhb1QjnY0LMjvE2AWASw8cmbrD1gk153li0lg
 nw0dZZWD8O7ABTlXcSIVHITzJnpNYbj1Vq3RbX5nszrblPAOLNA4plM359KFdhjaH0xC
 Ru9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761270947; x=1761875747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
 b=VxcfqqCVMSXL4JprEXeTRCgDPzS0REskp7FRRUl4sYSYO+zw8hvQBc1IX7rcA/HcwW
 0v+eBG8djs1QBP5TQe93NbYGhjeyg5jSUMcPpg1ssqOlRA4UKh8SyBCPh/+ZZfm8EMZ3
 a8Fgxoj3zri1a1mGs2HWluQxX1T/8wqPo2uYmLRTIosgFZweIu/VkuAXUhIO9d3dJ2gJ
 B4hIHxvrnF5mFhLxrMXeIUK6YjKfLAQR//P9rQ7u9T+8tTxV6HJY1VEJr0XSVXV7Cu5p
 1JM8kJeh2HxBzrYM+t99tjHItGtTVE5IgB8iZRRLKOaw8qrnqbpHo4slK3p833+roNaP
 gs2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyaEDWM5ClGblq41s7w8EOrLX1JY+5YPhdkHNLKpTvy8l8kYsXIEELmlOPZlFPZrGlEk9bnyJ6l0OUGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxiM+UU0vgnj7Qvp3cAulYFHQgVZJdlsua/wkUN7iF8wCXJtUtk
 114G/ytZaEEkak4gkwwmgtl0MEnyn8LWCIIm9UelBCmN/DJYeNw2qgkp
X-Gm-Gg: ASbGncupGDXJbypbmAyHgigOKK1F610+kfi8dA7dGUb55AdOmaWTZeDYqES4llMe5sj
 7iLrsWLAgZEzaX8KzJ5IcG9/K25P7Z1fmfl1FfZXfjqvwTLqQ94S5lMjLpD0NeKZxiPjm9UuUuE
 1xU7LHvhvMzgVQTcYMN2z/Tc3d45zaGvexKV7/uutHdP7Kv0pvW0/f9+bqCHB7UooHNGQWqwlAr
 H5gI/T2EuZ2tZMa3RAeIfs36I6R++46hnPJz76AuUZt6nhbsKSvQJCZ+FEzr4Eio2aQ/Exlup7R
 t9z/T4XiKPdaBBRBtyIayDa6uIPevvTsrsWgIgOU9XtIpBGhRS2unO+HW1kIPWwYCT5BIfEazQb
 uZ/73S/XV17GpepG/BIq2msFxhDwZKkKNUV4PRu9IfkY827fX1wvw8kEjtJyjL4wE4WAe0QdUh5
 pGbcvgHnP0Ng==
X-Google-Smtp-Source: AGHT+IHpW5wlGIbn04l1ii92JJTddNPs25LrGmd/cpssrIhv3LxjZMplAv5M1j+a+0YAZnT5qvs+JQ==
X-Received: by 2002:a17:902:db11:b0:240:48f4:40f7 with SMTP id
 d9443c01a7336-290cba4efc9mr405211955ad.39.1761270947035; 
 Thu, 23 Oct 2025 18:55:47 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946dda793esm38533865ad.5.2025.10.23.18.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 18:55:46 -0700 (PDT)
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
Date: Fri, 24 Oct 2025 09:55:24 +0800
Message-ID: <20251024015524.291013-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024015524.291013-1-inochiama@gmail.com>
References: <20251024015524.291013-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/3] net: stmmac: dwmac-sophgo: Add phy
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
