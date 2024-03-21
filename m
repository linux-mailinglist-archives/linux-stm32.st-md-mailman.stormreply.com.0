Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3216885CF0
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Mar 2024 17:05:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67F00C6DD68;
	Thu, 21 Mar 2024 16:05:56 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A7BCC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 13:54:19 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-56bc5a12a75so1121231a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711029259; x=1711634059;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RISJ51b+qHtZnF1GQnWK2y8jYm5bTJzD2sPnVFGaQwU=;
 b=VD/d7b4jCTdf8vxkEBmzSfyP9oLhMFzzaqRnlKpY2YGsZTPR5Lk6arX2aiT/vbVe60
 o3LEq7IyaubLVdc/9lXUJ2RfI9nyZukvQmDUw7fL6pG41SHHajZdZYHdE1tRUwmllBDV
 uSgIPrTI95PbClSSNVN4sb2GWR4Wkh998/AlgVKU3Hu0HcvK9MdzX0h/0WSV0Hem7Cqe
 XtJGwcHYCA7LtlAFFlxP+RZOMvl0Rk7BeOtra0i9sQa1KbTD/QAkLQIZmApPGfj2YqY/
 Tfl8PkgGedqyAaQHAQ8quAd+m2mDiZjfxi577+Yq+qXER1wwte3sl/NGNAC046a+3zE/
 MZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711029259; x=1711634059;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RISJ51b+qHtZnF1GQnWK2y8jYm5bTJzD2sPnVFGaQwU=;
 b=ZKAwffAo6Y58GAp7mpP9m8IKi/IhxJ1Z/m3GzprkjsWRtC/qUzSb2tPLl0h/k+LzWK
 3BgVz6fkCjnKlJly7eK7W6Z47orYxu+bLHdH2I5qU/Jn25OWDCN+sV0LBBUYZOIM3ONN
 FGzAR3XvnZZk0DafouTHYRL37rFuVvrvLYQ5/hz/33N4CezlG2rgcvnQ3KbKvCgVTppO
 7q4bPtgAQ4ZE3cKmyHtPStsdV83wPQbANVGiTIEMmIu8ncIlAy5pFIPS4NZDj/FcI4+2
 7Cu6Zmd+bxenkywyWalGz2WAGwKbdCubasgpzTp6AGfr3gZl54daEynbHh9NidgUvjvF
 TPhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0MGpGr8XkxTVVyAURyDEEIxS8hXfvyJuFC2yljCjGf+rsrd0Eugik+V/37cIEoQTQkQk3nE2TpbKsZw2yhbQBDtMrwSgZb2hdns4WiYSm6erJrm92+U1K
X-Gm-Message-State: AOJu0YxJwXO9N4REL7G+Z9QsspYAqRU5S8/L9W/OHl21W/IL4dYOT4Dd
 c3KqvBv4Fex8SJ7S06l5VEnMDg3JqfXDsOKF6wyZ4BNLdIEmgSCa
X-Google-Smtp-Source: AGHT+IGadgowPlBXY8+3yucdMCmheOCbVFSzXp6SgBTcViNNF5D6JaD0RNL1gKemJKrXc0/SJj8hbA==
X-Received: by 2002:a50:c011:0:b0:567:3ed0:47ec with SMTP id
 r17-20020a50c011000000b005673ed047ecmr1405423edb.23.1711029258435; 
 Thu, 21 Mar 2024 06:54:18 -0700 (PDT)
Received: from [127.0.1.1] ([62.96.37.222]) by smtp.gmail.com with ESMTPSA id
 cb4-20020a0564020b6400b005663b0d7243sm8130749edb.83.2024.03.21.06.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 06:54:17 -0700 (PDT)
From: Mikhail Malyshev <mike.malyshev@gmail.com>
Date: Thu, 21 Mar 2024 13:54:15 +0000
MIME-Version: 1.0
Message-Id: <20240321-stmmac-fix-v1-1-3aef470494c6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAY8/GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyND3eKS3NzEZN20zArdNFMDsxRTIwsLoxQjJaCGgqJUoDDYsOjY2lo
 A6gFopFwAAAA=
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711029257; l=1598;
 i=mike.malyshev@gmail.com; s=20240321; h=from:subject:message-id;
 bh=yBIC1I5/CGJewUczVdGzE+xSoggq/bg+8ZYTCA2HupY=;
 b=NSMFpt+cRP1D2Zcz2GidQr5P61iTF4xy8bTCVVY7Ik9xa6MmzN2Jv5ofNejppMhHLNJEiTVvy
 uCDtXvBXHWvAkOkLQu70oxopzpwhZnTouzFZWRD8RpCfjH7H+sDM69Z
X-Developer-Key: i=mike.malyshev@gmail.com; a=ed25519;
 pk=dEab2IpWMPzEiv9/nKbxaOgLTBJJfCpKN4FJcNIQk5k=
X-Mailman-Approved-At: Thu, 21 Mar 2024 16:05:55 +0000
Cc: netdev@vger.kernel.org, Mikhail Malyshev <mike.malyshev@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Do not enable/disable runtime PM
 for PCI devices
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

Common function stmmac_dvr_probe is called for both PCI and non-PCI
device. For PCI devices pm_runtime_enable/disable are called by framework
and should not be called by the driver.

For PCI devices plat->pdev != NULL. Use this fact to detect PCI devices

Signed-off-by: Mikhail Malyshev <mike.malyshev@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24cd80490d19..db45d8dbc1eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7743,7 +7743,9 @@ int stmmac_dvr_probe(struct device *device,
 
 	pm_runtime_get_noresume(device);
 	pm_runtime_set_active(device);
-	if (!pm_runtime_enabled(device))
+
+	/* For PCI devices PM is disabled/enabled by the framework */
+	if (!priv->plat->pdev)
 		pm_runtime_enable(device);
 
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
@@ -7846,7 +7848,10 @@ void stmmac_dvr_remove(struct device *dev)
 	mutex_destroy(&priv->lock);
 	bitmap_free(priv->af_xdp_zc_qps);
 
-	pm_runtime_disable(dev);
+	/* For PCI devices PM is disabled/enabled by the framework */
+	if (!priv->plat->pdev)
+		pm_runtime_disable(dev);
+
 	pm_runtime_put_noidle(dev);
 }
 EXPORT_SYMBOL_GPL(stmmac_dvr_remove);

---
base-commit: 23956900041d968f9ad0f30db6dede4daccd7aa9
change-id: 20240321-stmmac-fix-f506d52882d2

Best regards,
-- 
Mikhail Malyshev <mike.malyshev@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
