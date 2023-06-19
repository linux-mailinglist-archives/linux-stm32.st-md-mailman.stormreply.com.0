Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414B734FBA
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 11:24:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1555FC6B457;
	Mon, 19 Jun 2023 09:24:28 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04E42C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:24:27 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4f849a0e371so3941356e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166666; x=1689758666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjzvLDkciXjZFL92+Kc0vSUQwlE6cL6G+2BzLekYlAI=;
 b=XNGhzaLmiL3KFTWhOvSO8p3J4tRL+xF8RjpYFWLGEPTdg3gX53kow5eWe+GjPmXtw0
 sOJSIyFuACVYYRxWiyz0R7WM2rD1gwWMwsa39vDl23Zi5zZ0WBUndG4r92W534zVGbDH
 jv666tDWiF4qCqZ82WKGeOXBufFyzpZBKEzwPfEsy43G2Z8qWHZHMkDcuos8Nh9Ntrwr
 ujCEYuNqFXACZBpFHRRi5hv6NDQRqjQRNN+r/SMze9BWoTgc8xMxPwAlpKYE5CRlCDRh
 m6WjPkZt0YdAwFiPhjEOE9KX9kJIQA8BK/TaDHsrwYuXpROrOffd01l1wT8Cj4wzkFyj
 O1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166666; x=1689758666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DjzvLDkciXjZFL92+Kc0vSUQwlE6cL6G+2BzLekYlAI=;
 b=TLJrUEZinShG9NXcbbLOtdEVQP2s3Pin5SBrKii7mJ2mz6YVvVe5aMS/PrAzjXrZn0
 ZEtAiDccwkqpTtBHVBfSS59TpX/f92/3IMFtrOYLW3ARN/98/Hiqn/HqeIIanKhNSXj2
 eV9c6niINgVFASnT3YmJNGyeDoCjFZnonUQGAbXECrTirC2iXl/D0chmA1v8Ird6u38S
 a8Dr19wJ4P2Ij4/ImPfYGrjUhcQsmdNcUw8rqwmam4idcDsay3+y6mzcQKhx7keFXIXh
 4PSb8NnZGpu5CoCEf2pXcMi0j26PkW8OHZNeYQf5LcWoGYLATHNYgcb+ZjETLa1oN46I
 a1jg==
X-Gm-Message-State: AC+VfDzZnGYLOEnmPycA6poRH4Io0cd7f1eJ3QJ5J8ed3/yC/VhJY4J8
 DTh7CFXPLDqfql5T/svgA7etPw==
X-Google-Smtp-Source: ACHHUZ4anpGLkXxAz3jzfzAJHE59yvmhAwwgk3HqvnBqFL9PAYQbIBsx1uANXwdQxgAGAMhIDJka/Q==
X-Received: by 2002:a19:5f08:0:b0:4f6:3677:553 with SMTP id
 t8-20020a195f08000000b004f636770553mr4429152lfb.38.1687166666442; 
 Mon, 19 Jun 2023 02:24:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:24:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 19 Jun 2023 11:24:00 +0200
Message-Id: <20230619092402.195578-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619092402.195578-1-brgl@bgdev.pl>
References: <20230619092402.195578-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 12/14] net: stmmac: add new switch
	to struct plat_stmmacenet_data
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

On some platforms, the PCS can be integrated in the MAC so the driver
will not see any PCS link activity. Add a switch that allows the platform
drivers to let the core code know.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Jose Abreu <Jose.Abreu@synopsys.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 include/linux/stmmac.h                            | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5c645b6d5660..10e8a5606ba6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5798,7 +5798,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		}
 
 		/* PCS link status */
-		if (priv->hw->pcs) {
+		if (priv->hw->pcs && !priv->plat->has_integrated_pcs) {
 			if (priv->xstats.pcs_link)
 				netif_carrier_on(priv->dev);
 			else
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 225751a8fd8e..06090538fe2d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -293,5 +293,6 @@ struct plat_stmmacenet_data {
 	bool sph_disable;
 	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
+	bool has_integrated_pcs;
 };
 #endif
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
