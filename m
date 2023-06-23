Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B473B469
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:04:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F462C6B455;
	Fri, 23 Jun 2023 10:04:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ECD6C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:04:28 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-311167ba376so476651f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514668; x=1690106668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yItovFwloe3duebYnq7A6B4V/jKgQ44zzRGa/G+pPW8=;
 b=l0DUJdzlIHLN9/12vsEkAUNYNor4yQLqqSoGRxNk3EPmXOD2uFpAHbY4VklRmVQl3W
 +ENIrmsfRrIo4VfPjgmUQ/qlVWQ/ASV+aqcDfTJW9cv55BQDIxyjuiuCIZ4ey++WfOVZ
 e1P2A4jCjaM+XdtvCqaOpk3t2uaYGGziW1b1bYWPSrzQ7RFEhHoKViWdajx1ztsw+2oN
 bnk9AbhndEj+pJmoqRdzjQ34R9lSf+WGThG2I/dM3n8sMm339S386riM8UpqOyAs/hIl
 HePSRoIZgG9WM5dzaaaI+QNv3jNFWhnplP86qSx4p1RkU6q37ZAgOElyDOcrJT12BHma
 qu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514668; x=1690106668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yItovFwloe3duebYnq7A6B4V/jKgQ44zzRGa/G+pPW8=;
 b=DPztpx+6qjenHhvIKyJlL/E0+ZE9NgXl/QDYuBOj107O7wlHNWjQM7Xf2z/xPGuahk
 5nlMEzlZ7Zb1MbBYo07GJt815dfctVcoErAIqAeQo7dcTOEYxpBM31smB43ffMLjpU6v
 q2YVrQgWKmu66yTJ2eM3G2QgtE0MVHwfwK/sZqs4OZKJypfk8oeY+Z/MzQgQETEoiOrE
 iBKDtqhE7vz/WrOlBzSwLwIsq7vmNSAoMW/bWggYGarqHpjEhZM5v8r3YpQByyqLfWsY
 5YyZ6ZJDJ7VI8w+2B7ByXiftS5bBH1k31qgkudQoXZQHZvMVVEF+TdaZPJwf0mYVsMfK
 RNEA==
X-Gm-Message-State: AC+VfDyI8F23dG5GKGhs4TbDhs4l1RBbDnQpLuaoO04njL7j0RhwbyHS
 Hp5Y4793GHajJ+ZqRWYJCD9sZQ==
X-Google-Smtp-Source: ACHHUZ6FLrSK9VU9Oq4F41PZ3cJGKL7Y2Pamvyhspuem2ue7YRvUpv2Kv8yhkqC7Oo450xcBGrhcpA==
X-Received: by 2002:a5d:5346:0:b0:30f:cb74:35f9 with SMTP id
 t6-20020a5d5346000000b0030fcb7435f9mr17053297wrv.66.1687514667863; 
 Fri, 23 Jun 2023 03:04:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b0030fae360f14sm9079360wrv.68.2023.06.23.03.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:04:27 -0700 (PDT)
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
Date: Fri, 23 Jun 2023 12:04:12 +0200
Message-Id: <20230623100417.93592-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
References: <20230623100417.93592-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 06/11] net: stmmac: dwmac-generic:
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
