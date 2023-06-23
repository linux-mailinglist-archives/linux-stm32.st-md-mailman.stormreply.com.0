Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDFE73B464
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:04:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF839C6907C;
	Fri, 23 Jun 2023 10:04:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2435C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:04:23 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-31114b46d62so512495f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514663; x=1690106663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohR2MIoFexvaG1IRw5Am1pEJrTY7jcRqlxnO/EQTdy8=;
 b=VJVkqpM0z1wIlKhzeq04Rr7yyGW6m3B/0zSZk0ZF4oiorHhFrGx3eAZ1O4ghz35lwf
 2Vzj0yeKHFt8iyIvWIANy0BeEEJLy58mwkOpyJ8EUD5cfbEnin8OZiW5Qrfrhba4IafS
 AhgymSi7xoCo2CAObI5Le7wjzGVwohZoop4TrW0K1NQs6HjtaoIvw8x3N0+kNrhlaH5u
 c/9DBysGIZT8a3wYKYvZtOBcF/ETPZ+WRMljR5pIW7cK9jng1I/pvaqfvfNjG+c+Jlm6
 09/vv4XjZtDB+2OBy6nNaWUZoMVcVTMTyK/bex35Sk8ATc0doQDj7H5pCe/C1yS/tvg/
 WZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514663; x=1690106663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohR2MIoFexvaG1IRw5Am1pEJrTY7jcRqlxnO/EQTdy8=;
 b=QBVhCYwbvPPfgXmd4/7w9mvsS4ScEVCRAdVqOEyGE4z9LB0tMyI7ukPHKyI4UN4CsR
 vVAoipjoNMGpD1tWDunOEvrHdGGn4wfMg/tFJ5lomrVmUGyJoI2D0Kt33Br3ZpF5o0u0
 fB1j0S1Xijzz2k8adwz8AFk16X10doAd4znD75Q+1DXJbMdsja9NrrYb+WObb0h6uZmL
 79d60faIbrB1H571fIbxelHrF4HhPPraMzVAL8g/eXqfHvaKFRTzxJbIjkarWPRprDsb
 5v2CFctRcbKd7AKsPH6Q4Pt1s/9xrNkyPRDdN3BMuVTaMJP6zpCw7u6KeZfWKW+zlymc
 hGxA==
X-Gm-Message-State: AC+VfDxAH+jAiey2/bSVV6spjPz1G+rnNKnpM+Aq7t/R/FsSg8e7xF5H
 izr4d/Gn+t+EmJA0wPPe1mUbdw==
X-Google-Smtp-Source: ACHHUZ4BlcG23HC/pK8EJxlXEJOy4hJWAWELm8KN8y0FLwbTfwQ/yreCzwvqxmKh8BtYzNpWMvINCQ==
X-Received: by 2002:adf:e6d2:0:b0:311:1d4a:33e6 with SMTP id
 y18-20020adfe6d2000000b003111d4a33e6mr18600252wrm.48.1687514663606; 
 Fri, 23 Jun 2023 03:04:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b0030fae360f14sm9079360wrv.68.2023.06.23.03.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:04:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date: Fri, 23 Jun 2023 12:04:08 +0200
Message-Id: <20230623100417.93592-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
References: <20230623100417.93592-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 02/11] net: stmmac: dwmac-generic:
	use stmmac_pltfr_init()
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

Shrink the code in dwmac-generic by using the new stmmac_pltfr_init()
helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index ef1023930fd0..b7fc79864e8c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -47,11 +47,9 @@ static int dwmac_generic_probe(struct platform_device *pdev)
 	}
 
 	/* Custom initialisation (if needed) */
-	if (plat_dat->init) {
-		ret = plat_dat->init(pdev, plat_dat->bsp_priv);
-		if (ret)
-			goto err_remove_config_dt;
-	}
+	ret = stmmac_pltfr_init(pdev, plat_dat);
+	if (ret)
+		goto err_remove_config_dt;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
