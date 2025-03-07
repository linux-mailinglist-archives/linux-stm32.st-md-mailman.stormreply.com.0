Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6155CA55CFA
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 02:17:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29C17C78F85;
	Fri,  7 Mar 2025 01:17:07 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C5B5C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 01:17:06 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7c3d591e50aso143239085a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Mar 2025 17:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741310225; x=1741915025;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
 b=LAt7df1LSw5egSuyt8uoLoj/BFuWli8UdzdZIMwdlDAsKaM83szkij8DGg0QtSSrZj
 FbfAQGfvtmNeMqJpGDG6XwjljRPRA60ROqSBlAcY4QntJLQTCHTSHafjPck8MBmvP6id
 4ixGYwAnlUJ9tjkk9+uMqgfAys2jn9AUgi0KftLsdFOwCLrbOofZ3BA+mjMaOQYialMa
 94xHGMZBqeSKoSAxXp6lypOlyLplV2MMrJ1Ov6PP7jJ11frTGB7Jq/76bNsgxGmMJOu3
 s7ZAn3ElZChikJ7Q0ci6FcKyBKaMN+p4bf+mNO0tsfteWGT7p2/ZGWSJ8ZqS0y3HuA/v
 Q87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741310225; x=1741915025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
 b=JiXnOjVv3BCr8wcm5ZK0fyMAU+csZgjnmlV7oDWXCfSJqmQd4gtRR1wEmbFDD1hZNm
 Sgdjhq0TtFgCkmidASxQZqMWGKmuZnEfto1iHALsPSoWNP43S0eac3EovMdZa/bzk5QT
 tHWHWjI8SsIe06lqpxCzmRolEBi3AQVoo1KRSoYmHM9whFN3uQ8udk5G69P2cOzSm+ss
 +c3a9jfds+LUHbrgjwDDbXbM9G5CxI9dYSVXzWB4i46mvohl12ReL9+WE6l6LdsxQhUt
 XuL0QwjDyIJqTgWQWE2cpVJygxnPbU0pdxXxBuGqZhgbNgRSSUtTqKV+Dc6ckAH6CRR1
 tiVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW496CYNdmxpnTfI0rWwPrIFIJUmAlLBWk3sXngTFdHqJ+Ku4B1ClkAjmqgjooRrAn+V5fbGipTipHC2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxxwhGB2fV3tLyfo+GLG7887l99YFbwAeSrZey6VZjwwsM0dbNP
 LeztpHjc4s45dVLMMmNwL5joFCGqW87usiLGYN1nvZuAyCYPFebx
X-Gm-Gg: ASbGnct26kX4XC6yGBk/0YFY+vAZcZmnrTEDiGG1JfyV7zr6tfeoPcckYdMma2V3iP7
 /UqL7YjCnbU3UthrwVeu6oOrMG7fXaaSnb9zpcFQZlT3iUNZOKAuO/WYYXL4BfbWm5jq+J3Qtp8
 gOJ12YRXEzFXfxPZzPbsRtvQ42ST+DJO8N0A7oXIvvp3RCmYNC8Gt8dV7uG5eFLroSBUk8MGiBo
 si0yKvlsqmUgMfJhVe5drC9vCJE5EqU7kYZh0bCRoefKTmh/nKX/fhsndJJ5hhQTM7cNRgQYITG
 mQDuI5iP1ooCGNDVn7rW
X-Google-Smtp-Source: AGHT+IGYsH3sSP+qAZYndPm/6yCLkWYSNzyIRwRqHTgXvkWd663LqIaipq1S+8GRypyA2mF4w7TN/g==
X-Received: by 2002:a05:620a:8b14:b0:7c3:9d0a:6959 with SMTP id
 af79cd13be357-7c4e61137e4mr162902885a.27.1741310225187; 
 Thu, 06 Mar 2025 17:17:05 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c3e7c0a266sm142441085a.30.2025.03.06.17.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 17:17:04 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri,  7 Mar 2025 09:16:15 +0800
Message-ID: <20250307011623.440792-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307011623.440792-1-inochiama@gmail.com>
References: <20250307011623.440792-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 2/4] net: stmmac: platform: Group
	GMAC4 compatible check
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

Use of_device_compatible_match to group existing compatible
check of GMAC4 device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d0e61aa1a495..4a3fe44b780d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -405,6 +405,16 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+/* Compatible string array for all gmac4 devices */
+static const char * const stmmac_gmac4_compats[] = {
+	"snps,dwmac-4.00",
+	"snps,dwmac-4.10a",
+	"snps,dwmac-4.20a",
+	"snps,dwmac-5.10a",
+	"snps,dwmac-5.20",
+	NULL
+};
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -538,11 +548,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 	}
 
-	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
