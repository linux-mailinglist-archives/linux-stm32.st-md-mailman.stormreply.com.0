Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4029FDCAC
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 00:33:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0882C7803D;
	Sat, 28 Dec 2024 23:33:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1276C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 23:32:58 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso86694945e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 15:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735428777; x=1736033577;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PxV9VtPwcOjfdreL/ElR6ztmuVaPGRx7ZtA/COvnbHs=;
 b=IS1NAa0WlHZ1gcQa6UAf/wDiBKcEsIUqHy4hAHEglrNl26Re+4Se67czUIzWzkMidZ
 XJcvpknpQywEkNcTdJipKo0Wjh7tIhgpYb5MFqJsuaQgWn73g7ZqsD8TAlQNRrirSPIB
 zzY1/9ZmHbA6AAkknjys/Cq8YscM2IruAcvZLQHtO7hphYwi7qeA7hEm9uaa8lEInGmq
 td8zi4jB9G+loErsvmFVfgK/lSZas6v8+a7kQkrEZr3FI6yMzIkJUGpD0AKV6jP0/EOC
 79W69TGKZDaLwm5/Uc8O6kkJ3pctgSjy3IrX1YtBKg73qkp1jM0BaZZy+oWmsxMhQCZQ
 wm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735428777; x=1736033577;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxV9VtPwcOjfdreL/ElR6ztmuVaPGRx7ZtA/COvnbHs=;
 b=hmGlATlugJ5UQWSap4IjLnGaJULJLVcJYbTnCa4ZFEtFZPYh9Ri6+i0shG1yeaGP/F
 HH9AfgbBtpvafZMbwjnMqealQoT1MS2JDjn5jFKhdO3eoLDkxEZYexfRga6z573JWjmf
 QFwit2VdS/x6jId4Z75ioLfogXxHiwAWyTYrN8MSJ3aDEMlmLBUW+QLBsG+eLwzZyWRq
 XNu12c2uGt+/RzTLnChjaTG2gt08EPfu/EpNflxzRpsyNTyFvzF0nMY0+Mc5byQhwbyl
 DFKa/Ds5FNzpa3aGvt+6XObWAx3wPxuV5+ywMrwbhcf8kFjf2oFmC+ZJzKaixdRiEHGf
 ZWUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCCLnDgb5G7NB44+hzQTkVStn15ihdTIz1vHrmc9HSiloOE0IeK0LYYBbx0GqR98xPJnRG+Hq8HbJZmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWbUN6Y9cNr8YjMWya7mhNKLh4eh+yXljkS5cjcXKHUySpkphJ
 C8tdQhKGcv7U9e9KE6xp0GgvFq9RPq1ebxrcQ3gG25difTGqQolX
X-Gm-Gg: ASbGncvReT+ye8wd/umIpJecSWw4NpBAN6GKkkp7tC2EpNdgEOCkGG/Wb5LKfSzzrMh
 idNdQvVGFwFTl9ffezaIUSh5rXdxNPDHg3xsFIBR8xiJLvKbtr+7a184aAZ/IahKL07HA16HyvM
 8xMIZSuAVdROXRajSoYLNFzNqXsPPPXBqQwfuNtx8ciP2QmybodMzytnjYa9CPBC2hV/rbeiofc
 gZRY1yjbv4hNf6Kuk62iTCNF/8qlNgNZe7n1fUG1Idme5DpidLWU79ERg==
X-Google-Smtp-Source: AGHT+IFXB6mtbitt1Ty/iT+t/Wxyvt+fr2CPLQ6VRcW7h6pu2iRFzuNW50tyST860x+rxbR3cQJGsw==
X-Received: by 2002:a05:600c:3b20:b0:434:fa73:a907 with SMTP id
 5b1f17b1804b1-43668643bccmr256788785e9.13.1735428777279; 
 Sat, 28 Dec 2024 15:32:57 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e528sm26232100f8f.83.2024.12.28.15.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 15:32:56 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:42 +0100
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-3-c7d4c4856336@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=3cZeUXTp51nnkA0ehfcJ3kzlhmQfCuKF9N0XQDOcDK8=; 
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqkunV0YUrJmo2OxF1WCeGsLT1QpLwOpvdep
 XrGjLg1MXGJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tYhUD/9P4jzfqCUfSrApK6lmfba4E7uCY6h7SzplroCGW1ScAmboJ/iYlxhkMHbAYfLQ771Sy5X
 GApAEGp4oyZ3wXnMKt8YIdaZ6hmJTzeBWIsuISUWUx+2NFEqQQ3NuKR9fyjjJOz541V9Sbrbhj5
 dKm2bsvCeg/vFy7uEo6HCGmbFFrdSMUOahladMZaNiFyssMjt5B+Oxo9WuGPd1qecQKGPVIsqS0
 Rnlrb/7nduNaMV6u5peS3QPgq/rW8qodw5k+1u7YDrMbvU3jOpDBbNkZ1S0sNxBnoJ8tnAjwDk/
 eQlg2JFElPRIvOnRWXngSOzLgvZR/nHaFpYZiZnfF32pvu0VFABQoQ1JL159abwroLScvR48/C6
 6i2RMm5ARJf5RdkBoYai3xU93SvI1qxjYucRkE3uj+mMTZ0PUrftZ3JZ23DMZZG8WnPNfh2EOxW
 xWL1/3THYy7Wl7qHQ00LPyMT2NRocPs+0Tp1wzMaRVMj0q6ciGjqJ+QYHMZlHbhSh5sBCuqRwmu
 41acQELy7x7I3k01wrZ1sy4TLYyni32a1fvdO2G/DWSvUSDhFTMkl2dhQUfKpv0VrXcx331yS/z
 p0to76g+3pC4HZPGpFzKof2JGxRm11hvlh2tzpvL3RFL3eaWjrtMGvmM8gXxvtCcmh8Ha9CGnNI
 ovHV8xs1qQgCQKw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/6] mtd: st_spi_fsm: Switch from
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
 drivers/mtd/devices/st_spi_fsm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index dba584fa2a530b8d32eccc4ebc4d04ce01582ca8..f2266145b82167a4f7a063bcc7815115815483a1 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2104,7 +2104,6 @@ static void stfsm_remove(struct platform_device *pdev)
 	WARN_ON(mtd_device_unregister(&fsm->mtd));
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stfsmfsm_suspend(struct device *dev)
 {
 	struct stfsm *fsm = dev_get_drvdata(dev);
@@ -2120,9 +2119,8 @@ static int stfsmfsm_resume(struct device *dev)
 
 	return clk_prepare_enable(fsm->clk);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(stfsm_pm_ops, stfsmfsm_suspend, stfsmfsm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(stfsm_pm_ops, stfsmfsm_suspend, stfsmfsm_resume);
 
 static const struct of_device_id stfsm_match[] = {
 	{ .compatible = "st,spi-fsm", },
@@ -2136,7 +2134,7 @@ static struct platform_driver stfsm_driver = {
 	.driver		= {
 		.name	= "st-spi-fsm",
 		.of_match_table = stfsm_match,
-		.pm     = &stfsm_pm_ops,
+		.pm     = pm_sleep_ptr(&stfsm_pm_ops),
 	},
 };
 module_platform_driver(stfsm_driver);

-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
