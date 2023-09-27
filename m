Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DF17B0423
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Sep 2023 14:29:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF982C6B473;
	Wed, 27 Sep 2023 12:29:36 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE311C6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 12:29:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4063e3ce085so28403545e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 05:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695817775; x=1696422575;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djhGgzEttuBwypRoTD2e7qd8nkSbwt4HcuoP4naClbc=;
 b=TUxkqE6tGwse2JIgoYp8neVVnDpqMkmtTNAyXdWkgijsPxoPUtqXWkd3g1Yt0Y4dBr
 bWI3TQJO/jefu6nAyC02jXuEp/8E5L6W9tGxDnM0YbpjJBGuYz26d496M32K078YkeHD
 qF78CHQnL8c1DpvqWtF3M4DpEJRNzjc3q17f/uQ2kHzFfkDN9D3WJj00ts7jIdhDv7wQ
 GKhdm45veg18+305aSmG37CiEav7PHQspJujypAwuzVFuqWjKqztltzvRGdvU1WvrMAU
 t2gzwmS7R49dGVkU1VVzm9XIWFepP4i6rf2XJZVn9XontI9pbWBYzxQ5PUg+elcgbYDB
 dLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695817775; x=1696422575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djhGgzEttuBwypRoTD2e7qd8nkSbwt4HcuoP4naClbc=;
 b=YvKao5CuQHxrRwRUkTL2Ok2MWICWDQhX+nFuEbBRT8njl7Ah9C/Xb/l/CYvrkZdgBv
 AUM1gu1JIMBxykZbIjOilP6o2GeYYfGvfgufftVtScTt7+7EUubLoU3C9wNg9ZzpuqQz
 gulpsb/eIMNTLhhLMYfUIMrup1lO1hG3FScpw1uut44UFMa9YB946tRYeNTebxWjjqGy
 wG59Aq7y3dFTEBvInj7FZSJY3SfrYKUZden8MU5Q6R8yZYPgUO81YcdvglFjZwOrQico
 yUsRyCxGgsAl9MiJturLetuAg91tbQ3fBw7u8+MQynKw/3EcCq4FFePChBBZatNwkF3g
 7crA==
X-Gm-Message-State: AOJu0YwmshNIfTDMzxVmXUr+l8vsf97hFmx/xRTmFkvBTGMYzzGHW7Ti
 v2EUykokhRb4/gcwRgn3e24=
X-Google-Smtp-Source: AGHT+IHcQL3pFBI02XxvUXVb6GR+GG2cph2JWQp8B1W1KKSu38pGMBYcBmAR8ek1iOZ6aemezFAIAA==
X-Received: by 2002:a05:6000:1188:b0:31a:d4e4:4f63 with SMTP id
 g8-20020a056000118800b0031ad4e44f63mr1488621wrx.18.1695817775087; 
 Wed, 27 Sep 2023 05:29:35 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 8-20020a05600c230800b004042dbb8925sm4521218wmo.38.2023.09.27.05.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 05:29:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Simon Horman <horms@kernel.org>, Andrew Halaney <ahalaney@redhat.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 27 Sep 2023 14:29:28 +0200
Message-Id: <20230927122928.22033-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927122928.22033-1-ansuelsmth@gmail.com>
References: <20230927122928.22033-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH 2/2] net: stmmac: add support for DMA
	Arbitration Scheme
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

Add support for DMA Arbitration Scheme tune up to program the DMA to put
priority on Rx instead of applying Round-Robin logic.

This special DMA bus mode was defined in the header from a long time but
was never actually implemented. This option is used on the original
setup on the ipq806x-gmac driver based on DWMAC1000.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c   | 3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 include/linux/stmmac.h                                | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index daf79cdbd3ec..14eb7e8d61ea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -104,6 +104,9 @@ static void dwmac1000_dma_init(void __iomem *ioaddr,
 	if (dma_cfg->aal)
 		value |= DMA_BUS_MODE_AAL;
 
+	if (dma_cfg->arbit)
+		value |= DMA_BUS_MODE_DA;
+
 	writel(value, ioaddr + DMA_BUS_MODE);
 
 	/* Mask interrupts by writing to CSR7 */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 843bd8804bfa..f5791b03b320 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -576,6 +576,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	dma_cfg->pblx8 = !of_property_read_bool(np, "snps,no-pbl-x8");
 
 	dma_cfg->aal = of_property_read_bool(np, "snps,aal");
+	dma_cfg->arbit = of_property_read_bool(np, "snps,arbit");
 	dma_cfg->fixed_burst = of_property_read_bool(np, "snps,fixed-burst");
 	dma_cfg->mixed_burst = of_property_read_bool(np, "snps,mixed-burst");
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index c0079a7574ae..04a61f1eba90 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -97,6 +97,7 @@ struct stmmac_dma_cfg {
 	int fixed_burst;
 	int mixed_burst;
 	bool aal;
+	bool arbit;
 	bool eame;
 	bool multi_msi_en;
 	bool dche;
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
