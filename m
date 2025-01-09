Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D67A07CE6
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 17:08:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D425FC78011;
	Thu,  9 Jan 2025 16:08:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A202BC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 16:08:08 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43618283dedso11556025e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jan 2025 08:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736438888; x=1737043688;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dDoiMsFnbn5JUQtcG1rs+LkrtkLOU3JtO7LMBBVfgVo=;
 b=QDKmjDYjlxiDtPIx7nf2e3nah5aDIvZfw6i/Cr49oUaKORW3eQqA6bzHpcygs1P4lf
 eGQkR1SNOkY02zuXde+NBMqy/I3ZTP8BAX65nT/Utox+Rt4JiyKvSrFoMCFBGwHjQA5/
 Es343Y7WwkdCamnfQCQDmKjtEUPy3WAzmFJPHn72xSkj1j787TaoxHDBWkSLhPu0RyeW
 XUosQ4/dbbpVioBbUvFPQfDgs9wzQLabKK8jpvZr8VLgKmHFGZkzZ4FWbLgSGTpTtKEn
 BLsNQ319Mh4rJLD9csOfiZHR5nkpiGCdF1X6SkT5o1rN2GNxYnV8niwd3ZFirNGZRABw
 3E2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736438888; x=1737043688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dDoiMsFnbn5JUQtcG1rs+LkrtkLOU3JtO7LMBBVfgVo=;
 b=BIQk2+iGGYzzXSkBgW8GuPQLqY6PneKupuEz8uvRUSFt3Y2KNA7AASB3Zi0D6lWK11
 xx7+K95YotRkda9NL31edaiPK5RHUkd0N/0WJt99VksnhWkTBU1OTQlnXz2pgzhXK5CL
 X7ca5k1Iti5eyiVvWW0TJSXlIwJleZc522xkkpYPcxyMmhIY9VCoDb9WQJgKI1nHbTww
 EGo2CaNaNjLFXHjE4A9EQa9Ehv5PaT2pF1mxAFe68cxRmocRak6O0TKND2Q74Pq1odLi
 s91PLbYqQxUGyeNayQp6NUUlNTHOtI+YuEr/5JdxjjQGD/Wpkr9ev3wNGAvJ0zuGgl+v
 dshw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW319Wx8xAYsX88EZzR6HnlA/v8vEtlt8L0rBTtKxxoy8mBrVuLAUNqE3eEXnOpOhGtTJlh9PxUFGl9Vw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyEN8nsEgYlHksxu/CXBLzVNrYKSU+mljYyWXdp3nwrBt9MbuxJ
 84oiR3SSeavvhN1PpAJVVK2+NDLGiGzZLTzsMg9j34M8MNQrQ0Ub
X-Gm-Gg: ASbGncvKz6bIxm9RTLYCErjPS8ykm0yY6lgBLsFFOSrVgol6O4jfFrDOcLBSeSBsZCn
 rpVgyG5RyZ/sPPsXTf5huwR6IHiNmiCkh+81Y181x6aC74owA7mG8rNUqBnKnKJvK9/z/O/w4SR
 wNQ+jYKGYOBBKYAVGCznJ27KuM+A9AwAfqCrsinjI2Lfo8WCoOJd+ki2CIJQv0/m8KIXgPIeBFl
 0hl9/e8foFqXjJ0S9ssT8V7foWTGwFitxLeahtQs0mqrWLK4wAzzAMZ
X-Google-Smtp-Source: AGHT+IEsGCIC45RR7BVCyQeCR8u7TPJ5P1zGMYvvoU4MqQxYu495kCeS24QxHR3OQGZbTFPwVjqHIg==
X-Received: by 2002:a05:600c:3103:b0:434:a746:9c82 with SMTP id
 5b1f17b1804b1-436e26ae9b1mr68525405e9.5.1736438887686; 
 Thu, 09 Jan 2025 08:08:07 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e62333sm24728155e9.36.2025.01.09.08.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 08:08:07 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "'David S . Miller'" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu,  9 Jan 2025 16:58:42 +0100
Message-ID: <20250109155842.60798-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] net: stmmac: sti: Switch from
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

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
  - Split serie in single patches
  - Remove irrelevant 'Link:' from commit log
  - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-5-c7d4c4856336@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index eabc4da9e1a9..de9b6dfef15b 100644
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
