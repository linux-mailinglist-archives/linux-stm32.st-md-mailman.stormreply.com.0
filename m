Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 598C990EF98
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 16:01:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1489FC6B460;
	Wed, 19 Jun 2024 14:01:34 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 719F6C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 14:01:27 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52cc10b5978so2986038e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 07:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718805687; x=1719410487;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w+GCJmC76KcAMT5GOCDp0RSTcDnH5vcKBmbAZTLYEys=;
 b=cMDuZjsw2roAg89ZNKMLT6J2AFwfLpr2Ntj/+mlOUbAQhLfOdBmt/51lL0t70kyGpi
 DqJ9ikTLPzMlFeGPbcHnOvk6rrYdkJryXZJyxQ9SpIkwbauiyWad/xcoSh956Fi9ifiH
 ZWPsjV6EQqOPzf9U/GTHrQt6wt6mwYbjiZGrMfZ+FMB7jw15FWi25zMdc2+LSZnHbw4U
 UQLhYo85SacIUcwCm40hhXsakgXDjWneRmqAqRZ5NmBQXd1hMRyspNi6UD6MjkOo/Gtn
 qR0DkPkxDl8MF+rbk475FAD7yCW2m1s+Y+ukdTDhv6zhHisDl46LJ2DUntLskcpcl5rc
 o1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718805687; x=1719410487;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w+GCJmC76KcAMT5GOCDp0RSTcDnH5vcKBmbAZTLYEys=;
 b=lyO++fzYNQ94871YVXLAY6HpitxUbUiJrLbwt3GPtl19ZzuJyCg1PF8u6hHCFsIG4O
 ZME0daGuxudEUPPga6HQl/KBiZf3m9WHMJCpvWM/qpMsl64cDcsWQCtOvWKdwf8GO7JF
 bNwLr7VSWs8oVDKJtAMpa1+4ONwE6IOCDVwTbVdfRJvNZ9o1IOSAhWgjYay5mtcw2i66
 zHc0FupS672HTsJvyvBLFdDvr7NT5nlV3RDMnmPaJ7AxOHG7mcAz2zcvKzjMD0qDxbTU
 ncdZ0494YmbDniOBJLh+ZyLF27ftju1nWP012NN05KfNkvV5kk8ezTEKVo7VatQBrX1Y
 IyHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5hAZ8r1phpPuk+XfRa7eeh5FvH7NMQ9tl5R6ILEmhdw1YHwIbJNAAAJ4byr19bARIEw2Nr63H/kk332VYEPpLVkb5BBQLKftAEc+JxkGHd8Y3Tj80pZOe
X-Gm-Message-State: AOJu0YwfvE97iNiIx7jNHAJkTeANIYzheE79GnpxktkYP5KdS79E5kCP
 BIxQbiSOS7kwMSbUl9AxK8thj9rEXfnOyFgThWZpoSwBuIcmwFEpoXoGaozH/ho=
X-Google-Smtp-Source: AGHT+IHCqUJRZbuRk9MUMjYdIg9kfXdYDaI8MQjkROBkyKkQf0VyBxkiqb1nGKWXRxYCgsWEC4AjxA==
X-Received: by 2002:a05:6512:2309:b0:52c:9906:fa33 with SMTP id
 2adb3069b0e04-52ccaa885ddmr2490422e87.43.1718805686415; 
 Wed, 19 Jun 2024 07:01:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286fe92c6sm268520905e9.18.2024.06.19.07.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:01:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 19 Jun 2024 16:01:19 +0200
Message-ID: <20240619140119.26777-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: unexport
	stmmac_pltfr_init/exit()
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

These functions are only used within the compilation unit they're defined
in so there's no reason to export them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 10 ++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h |  5 -----
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 54797edc9b38..ad868e8d195d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -764,8 +764,8 @@ EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);
  * Description: Call the platform's init callback (if any) and propagate
  * the return value.
  */
-int stmmac_pltfr_init(struct platform_device *pdev,
-		      struct plat_stmmacenet_data *plat)
+static int stmmac_pltfr_init(struct platform_device *pdev,
+			     struct plat_stmmacenet_data *plat)
 {
 	int ret = 0;
 
@@ -774,7 +774,6 @@ int stmmac_pltfr_init(struct platform_device *pdev,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(stmmac_pltfr_init);
 
 /**
  * stmmac_pltfr_exit
@@ -782,13 +781,12 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_init);
  * @plat: driver data platform structure
  * Description: Call the platform's exit callback (if any).
  */
-void stmmac_pltfr_exit(struct platform_device *pdev,
-		       struct plat_stmmacenet_data *plat)
+static void stmmac_pltfr_exit(struct platform_device *pdev,
+			      struct plat_stmmacenet_data *plat)
 {
 	if (plat->exit)
 		plat->exit(pdev, plat->bsp_priv);
 }
-EXPORT_SYMBOL_GPL(stmmac_pltfr_exit);
 
 /**
  * stmmac_pltfr_probe
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index bb6fc7e59aed..72dc1a32e46d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -17,11 +17,6 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res);
 
-int stmmac_pltfr_init(struct platform_device *pdev,
-		      struct plat_stmmacenet_data *plat);
-void stmmac_pltfr_exit(struct platform_device *pdev,
-		       struct plat_stmmacenet_data *plat);
-
 int stmmac_pltfr_probe(struct platform_device *pdev,
 		       struct plat_stmmacenet_data *plat,
 		       struct stmmac_resources *res);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
