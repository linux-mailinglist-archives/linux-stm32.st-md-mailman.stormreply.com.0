Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A1E90FCE0
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 08:41:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99BAEC6A613;
	Thu, 20 Jun 2024 06:41:08 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A471EC5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 06:41:00 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2c31144881eso492821a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718865659; x=1719470459;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dj4QZeFx+AVC51p11hlg4kzbDA2elF0sWu+Rp1qJlwA=;
 b=bxHJgG7HJVwiaItbahbMvp403h+9Fu22UYUaIQ9LS3HGDjaxZlHVWgI+ZtDxWf4I+Z
 sE+QDidI0NxbFimw8P51XZOH6ByOhF0oncC9drZPvjmS7MOfNkJSgl1sFsDsiC4GItvN
 Txt28AYUfhw4W2dNvoDBCebdoMsetzjMj879UJokxUkCHpEmFlDwf1l6sYuViJIi+3MQ
 wVLI0DSZ1yhkQ3SNctpkHzZBT53EO6nSd6swcwJRuwAFUVlPyiZfQlxNwX1HeGSLwv5e
 BImJBoK4PGchmkavMVZeHCkmowqugGK2AIph5y6EQIoZkjbK+zIwttqt9gNu7xQcxRra
 cnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718865659; x=1719470459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dj4QZeFx+AVC51p11hlg4kzbDA2elF0sWu+Rp1qJlwA=;
 b=U9Vi2kEZrQuUq3WtvCjhBkR6xDq7+2fPiUSXtAr38Zd1Ve3gey303veb7KN2a1cNa8
 F/M3lnwTpFOe3KT7XQ/Wnd/6KonwTF2T+6lvc4UljRmkYyHWQREN5zi09L/I3lumNxk9
 pWzKUEYhIi/1TTX5hAJi37Cay2K5RMdtkzpjXHqExmvor036bmI7tHXm0fdB9rnZwZTZ
 C8GMqumxjCL5WPKGQfKGV+Gxa/Hg8pCIqziw7PkeMOCYf21KLl6M7DVwzqPAt2kk1he/
 nhBOAlrHOnc8v5UvzdflscWHB2LGO82VfOa59sNxheJ5wyvUiMYRdg1butKZaC0LASPl
 V4Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8wbtrJm5XOVVQWod5v5caxUFVkuUUzbZ9oyyFuCblPT0F5EMN/P/iLoO8qtnOXaBG5QJgp9SmemZGEGTqZ66fEMM3HwgFtdceVp2ShCDYoyxB7cjFJjX4
X-Gm-Message-State: AOJu0YwtWnOx6Bb/zi9qEGLSifrXLf8hyYt41emmdL7WhXYfQsv9lzCf
 6v2WtKxiHg1SkIUwHII/b6qkAPX1shs4jLrfXZj2/iiuPaTlA1Lt
X-Google-Smtp-Source: AGHT+IFNC7FgO9HSN1gJ1UcHOVjndxJnOiiessKD+THr8O0UlSmH6s/UeMfmg86hakwBC98pUI/Xuw==
X-Received: by 2002:a17:90a:ea92:b0:2c4:b300:1b4c with SMTP id
 98e67ed59e1d1-2c7b5cc49f5mr4163646a91.24.1718865659045; 
 Wed, 19 Jun 2024 23:40:59 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c7e50f7c90sm862442a91.9.2024.06.19.23.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 23:40:58 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Thu, 20 Jun 2024 14:40:04 +0800
Message-Id: <20240620064004.573280-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: init more plat
	members from DT
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

A new option to init some useful members of plat_stmmacenet_data from DT.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 54797edc9b38..b86cfb2570ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -497,6 +497,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 
 	of_property_read_u32(np, "rx-fifo-depth", &plat->rx_fifo_size);
 
+	of_property_read_u32(np, "host-dma-width", &plat->host_dma_width);
+
 	plat->force_sf_dma_mode =
 		of_property_read_bool(np, "snps,force_sf_dma_mode");
 
@@ -561,6 +563,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 		if (of_property_read_bool(np, "snps,tso"))
 			plat->flags |= STMMAC_FLAG_TSO_EN;
+		if (of_property_read_bool(np, "snps,no-sph"))
+			plat->flags |= STMMAC_FLAG_SPH_DISABLE;
 	}
 
 	if (of_device_is_compatible(np, "snps,dwmac-3.610") ||
@@ -573,8 +577,11 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	if (of_device_is_compatible(np, "snps,dwxgmac")) {
 		plat->has_xgmac = 1;
 		plat->pmt = 1;
+		of_property_read_u32(np, "max-frame-size", &plat->maxmtu);
 		if (of_property_read_bool(np, "snps,tso"))
 			plat->flags |= STMMAC_FLAG_TSO_EN;
+		if (of_property_read_bool(np, "snps,no-sph"))
+			plat->flags |= STMMAC_FLAG_SPH_DISABLE;
 	}
 
 	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
