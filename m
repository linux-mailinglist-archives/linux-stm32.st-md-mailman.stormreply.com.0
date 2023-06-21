Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4A2738997
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 17:37:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C75AC6B45A;
	Wed, 21 Jun 2023 15:37:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B588FC6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 15:37:08 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2b46773e427so68454971fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 08:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687361828; x=1689953828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yItovFwloe3duebYnq7A6B4V/jKgQ44zzRGa/G+pPW8=;
 b=CSv88/ZWPsCkujCLeQvR5zV6QJ197upQiupFOf7hhQJLU4holZQmyEM8afOeiopPJI
 rxkkXknIdFBsXaGs9e5eQl8cmqwLLSitBBUYN4EkfgWs1N3I08bYlFaMCcxWlpL00o5R
 m+Z0PytTuM0BQ2VA1FUXHz93HaoWpBMXD7Xg1oI0Iex7kwBXSFxukS+BVYvPEM1Z+x/J
 1MMnplXM//mLc8MN0qTVv7Q3KJFsN8GnzobJyIhzjWXEbG/2zt6VldBu8G2I7bJGs2ei
 Te8uSE3lkY289Edv22F486sKBj0Hx/GJT7tkzQsTOMVS4qqtocy0eoZE2IXrcvMDnFyM
 oU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361828; x=1689953828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yItovFwloe3duebYnq7A6B4V/jKgQ44zzRGa/G+pPW8=;
 b=JlmiEu5+lqPyn0Lo3+MDE4PNDhHmNo1CbsTZyzW9NFNKnKd+71dMY0ZkGibhcksvgm
 rInn+/O0wlTy7+tlIXW8rSjzG/nLqom+px3KzyBK5JP0toYx3GbsmWcq0wUIA5SgdLe1
 b8v0AU5z6bZgv7vEp4QCxcBbFf139scxXKcn46cgwL1j2YaGC2uFaWDq8FlDyPereXTu
 hSkrql6xFtizCva+sotWWyESQUZKyQZPH24zyQtVDfoZUIG9/t/DtpofKnh/7VdVf7lb
 kbZnPkRE8g0cWvNZxBV9gjjBalgv78HEL25RKzCZ25Tjj39GI/Mc7wmEIaG7IJWwS4ou
 4Ixg==
X-Gm-Message-State: AC+VfDy7+mJGQXOORtTwghX2kTpWlPca4VFkh3NvA3PuQmSyPq6Hp66N
 Gph+1ECmIc9YNOB8Z6QDa8/8OQ==
X-Google-Smtp-Source: ACHHUZ6zjgqtk9I7hnzpINsxw7Jk5ONzx9X2XtIX2vI7/3ICM1PCWSNZh/mAZPlvVnMabN82Dm8Q4g==
X-Received: by 2002:a05:6512:3b0a:b0:4f8:6fe9:3c9c with SMTP id
 f10-20020a0565123b0a00b004f86fe93c9cmr992970lfv.49.1687361828170; 
 Wed, 21 Jun 2023 08:37:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1c790d000000b003f7ed463954sm5322491wme.25.2023.06.21.08.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:37:07 -0700 (PDT)
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
Date: Wed, 21 Jun 2023 17:36:45 +0200
Message-Id: <20230621153650.440350-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153650.440350-1-brgl@bgdev.pl>
References: <20230621153650.440350-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 06/11] net: stmmac: dwmac-generic:
	use stmmac_pltfr_probe()
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

Shrink the code and remove labels by using the new stmmac_pltfr_probe()
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index dabf05601221..20fc455b3337 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -46,19 +46,12 @@ static int dwmac_generic_probe(struct platform_device *pdev)
 		plat_dat->unicast_filter_entries = 1;
 	}
 
-	/* Custom initialisation (if needed) */
-	ret = stmmac_pltfr_init(pdev, plat_dat);
+	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 	if (ret)
 		goto err_remove_config_dt;
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto err_exit;
-
 	return 0;
 
-err_exit:
-	stmmac_pltfr_exit(pdev, plat_dat);
 err_remove_config_dt:
 	if (pdev->dev.of_node)
 		stmmac_remove_config_dt(pdev, plat_dat);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
