Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D29FDCAE
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 00:33:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFD58C78F67;
	Sat, 28 Dec 2024 23:33:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7D7EC7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 23:33:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so4918816f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 15:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735428779; x=1736033579;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NOT7K8Ya5QmS9KbZEm2dNA6PzTUyykxaRlEoFqze/Wo=;
 b=SX/hvGz91U6CDKRTsvrHerEVRaEoc15AWDjSEEon0TkuHzDMvg6AOLPodxmhBZRS6K
 JtbW6PxH8cYpsMgnDCTUhJyR/TFp9t+5GCA22nQQ01jyMIozR+b7IujdjaTwS67zu0Nu
 i4Ix/59GDq7KcADS85HCnn23XfWrByhJwVgqHqwvCW+6XXO+BYt3ZZVzN4PaxdiPpxLM
 nol6ogxEGT/h8CNsjSSiO87GcLtV6MqgO11WBScuuq33uIbzaDVvKMJo+TFko2yKYo0G
 aalSWxv7OQ5s6BgSKAFK1BxsAZBnmlyUdbWIyOTUmCplsnxik2XTtN3uZHPBwr6Y+5C/
 c0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735428779; x=1736033579;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NOT7K8Ya5QmS9KbZEm2dNA6PzTUyykxaRlEoFqze/Wo=;
 b=w6Gy/oNKA39lQWL18aQzqt/U5IHA+RN8q5DlnepScjQfTzprT+GYqqnxTdbItCSTKB
 qt3AeYj+e4QC49AHFLAWrWbErNV9gAg0nVFymXxZ9w+vOq2dJap/FDmVuxFTCzHCrIfd
 D8Dq0hYQnlKLyh1HT8e54DYsVnCzzvglDNggUkcgJciWkNwU8L0+QfzRsiq28BtloiTZ
 l1Soi72WOLVXwb8hQzDovqIs1Vyyb7KtrGV9cPmMDcE0RMKs5v5eDZbFdM623SMxYOUK
 TNpBWnv0JXU6mYFlan4XjEudApMZ9MO5T0P0P1Rkg93vutGq2z1iDX7Jmo8r8V/RXKbB
 EXOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTRGzTXDa3mnlbba1od265FGcslpuGLCQRoB64IBb+pFEUHdaYAnoqOfDT0VUXB+fJiq2K6swE1lIsow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyBpb58Lz4RnEPW1HqdW/I/If+MHVyZfFgEhEkJVQumJin4FJ+Q
 +Vw8HLz53g3Hzlpc/1CKETUtKUExTpVRBl45GFLm29UUofG0N91l
X-Gm-Gg: ASbGncu0O+BehyVV7dij+Mji34rviI64KzJB/GF2g5KpJXjUFrOHO7dY48qjwlnJSYV
 xfEfS4fVIW4N140JAE/U+/aGPbBmKxZ3ulYR1zdvmo21LoaG3Hz9CjlJ7eA8YiITW75ql7A+YtC
 6Mhu8zyjc3QnVX9P+L2QM3S0QBTeKt2iHZIbo4OUb3XB8OprXD1inx1r0dewh9bnxAGZ/y9JSBK
 9QRC4zf4uHGj5EJRzcVNMfB0JeYAJDcpoENHTSukTgHYBB8hQW0q17twQ==
X-Google-Smtp-Source: AGHT+IEDx7wvGkLVUnT9AMtJHUHuNgRawRAtN+qgnC0Cj3E/aztBEivykLbd/wn9yN327aAFyzdA4Q==
X-Received: by 2002:a05:6000:1542:b0:385:fc70:7f6 with SMTP id
 ffacd0b85a97d-38a221e1f67mr24709765f8f.7.1735428779386; 
 Sat, 28 Dec 2024 15:32:59 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a6ca5sm26538490f8f.86.2024.12.28.15.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 15:32:59 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:44 +0100
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-5-c7d4c4856336@gmail.com>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
In-Reply-To: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=Xy7AdPQ3XNeeLhZR/TYDcrnRFX91WkBoxIfX4qqZmFU=; 
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqkdCM7I2+fjKtHyJmXuIMRiTT3ConPrpraf
 j4VH3GYg+CJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tWOLD/9mLv8T49Aj92DxuFqK+5R3cczwAA+SNhe7B2SwXvfVYYd3E77Y+/6R7e61V78SrnbI8gz
 uaBNqyvNBthY5MeF0I+NbwVeOCkA2B23GaLT+QSAAgc/lpqQ7wFVR3ISSUhZfAT5dU4co5VkvHM
 xnEYsquomiIFCIsoOVZw7fvrHUaCfpBwiyPXjs+jaTzfcq++bCknVVo0bsn9SrV9v6OIEzL4CxJ
 2Gec/Ah9nHgtAISBD8U11Ay92zy0/x8J2tmMEkLxjOFcmqZmJyYB0X1eyMts89qT1Xz+qxVwJ4b
 eGSEySEwcjMA401vbYtcTwgiaRaERA8MMXj2OjAznA2N2n1aswBx2ElmwHm1wBW2FXPfVapYd9u
 cKDauqd2bZioY7er4gOxCHnT7cvL+mGopN2wMggQ7N2mnGfAnVhUwo1BvvKnALB6XZUt4riUWco
 td11vz8xganX4BAkgJUrdabbCavIB95y7cYJOMpKAnQGDHRALdO3K/R9opffcvMi6xvmOl/amaJ
 z/7BF43VuNbdS0NTjhHxD5V9G5FlkeT31KscpPYrGl4XpRe4HaazkrXfMZr0DbWSBESGgi8Rj7V
 +MXQFC/biruMtBy8YzlG9rLxu1xkClx8ECgKGVnRJBpUo0oBdpjoD8/QjoS35kjJWNjGSlKyI9T
 uq80NJHRbLeVYQg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/6] net: stmmac: sti: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Link: https://lore.kernel.org/all/20240716180010.126987-1-rgallaispou@gmail.com
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index eabc4da9e1a985101643908d2efdb0b4acaa9d60..de9b6dfef15b3d0a503a3b55b3e9a42ee68c6141 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -313,7 +313,6 @@ static void sti_dwmac_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dwmac->clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sti_dwmac_suspend(struct device *dev)
 {
 	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(dev);
@@ -333,10 +332,9 @@ static int sti_dwmac_resume(struct device *dev)
 
 	return stmmac_resume(dev);
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
-					   sti_dwmac_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
+						  sti_dwmac_resume);
 
 static const struct sti_dwmac_of_data stih4xx_dwmac_data = {
 	.fix_retime_src = stih4xx_fix_retime_src,
@@ -353,7 +351,7 @@ static struct platform_driver sti_dwmac_driver = {
 	.remove = sti_dwmac_remove,
 	.driver = {
 		.name           = "sti-dwmac",
-		.pm		= &sti_dwmac_pm_ops,
+		.pm		= pm_sleep_ptr(&sti_dwmac_pm_ops),
 		.of_match_table = sti_dwmac_match,
 	},
 };

-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
