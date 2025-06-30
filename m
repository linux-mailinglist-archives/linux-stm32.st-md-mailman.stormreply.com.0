Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1C8AED6C7
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 10:13:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 096C4C32E8F;
	Mon, 30 Jun 2025 08:13:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47DD1C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 08:13:14 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2329240f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mandelbit.com; s=google; t=1751271193; x=1751875993;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vlnZvB/WCXPqtyuE7Jw0BGhm5yZL6emwd3gHblqa4CA=;
 b=n3G8h4TjdYdB3xbGbo167U+NgxqJJ0CoWkEYAiRqs5NpsU94rKPVWxO1bVz7qDJJ5E
 QgToANR0+SUMOtzCG1gA+5QG93OG6H+460x/GaIU3hf2zUUF60ZSxoLnowB8J56v6GiG
 Efupy5uL1tMWjEHqhW0ghAalM+0e8CofFclwLFk534/aYGooN8RdsKNn3YoOfN3XlI5f
 ZjH1WLIit5WpCfIZRhAA6biPY3JmqGBlSb9Q0JNTBsNwoReO6G01rYK50SjkIUu5uTAH
 7/YV4NwIHTcChvZPSn/s2eyvaTiEkIxCQktvJdq004Z/fhLxXl8YPFcPtzTsLe28Iq8D
 9H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751271193; x=1751875993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vlnZvB/WCXPqtyuE7Jw0BGhm5yZL6emwd3gHblqa4CA=;
 b=tr2KbUrACAFUuY07p9Og8W4cccylYo9u7aWCo50Lq6CYP14kQJmiVKsN2I3Zw32+7o
 E68yBEMj/jt0SpgeteUPxw7A8XExkg3ONNX/MW5pfMyPj+4c63b9A5ydFw+LCIC+gBvl
 eTbIyVB5KjOkSblR3/SuR4XOdy8Ggf2iPGIMVMXAvuliZ7RUpqvbBeuhqXXB6P/HLowT
 AnNsOkdc3P3GWmiQ7r6j6bE45nT+WdBrETFsDSGHbtEOe5nl6BghIQdaeANSLZwbywVo
 302OqjyiTu4uA0tPf4OGYWIaxieU6i8W05znGJSy4+3+7YAwsaT+Dit7Kz6Xn78Rtztp
 GetA==
X-Gm-Message-State: AOJu0Yz1Dp2ACT9/Q9cFffAzAlknos/2pZtCP2vrdM0NCQpO+gBue0MH
 jd+aiAgkTISbNpofLVtBDCcaxCi8F6MPQLy+b3AC158FmkXvlksVPxBIBUjIIkDNh1Y=
X-Gm-Gg: ASbGncvXYf/RZgmbbyBjX6UUOXodZjf72lnuucoVWPGVNyrSmrg0698rg5B4Mj2SgBk
 Hisx01VLO/ghp+tN0LcQfbEAyuGyxIXwHA9qo0G0OR5RuIJaETtZrDN37HkZkOHK8JtQIo5VKWm
 KZiaWj+lQbztrIQZvb6R57zRdWY6RWmlUc/d7qB+ep8nW6cpxpYahY8I66Gx22J/6AmowrC/gOj
 hoQSLeUVkUHQd0H7cH8ggLkKe/QcrawmN8Xm8s54njYPIux8XcmzoLH6WwlZta8KOhRTzdnetxN
 Tz+mdPX5x/KiTjpfFjwyK8kaCkfoAmXqnI4wKIa6dMDt+UHbotRzUKEArlU5qyuOKbIGTycTWBL
 AxEx1DaKUyi0=
X-Google-Smtp-Source: AGHT+IG31LxT0ptg6EHo/bGKOyukJazY4oC/IxLI6mz15TAMA4SfoRER0gF+bNZj4oNhXngxmykf0g==
X-Received: by 2002:adf:ca92:0:b0:3a4:f722:f98d with SMTP id
 ffacd0b85a97d-3a9008557admr7908660f8f.51.1751271193346; 
 Mon, 30 Jun 2025 01:13:13 -0700 (PDT)
Received: from inifinity.homelan.mandelbit.com
 ([2001:67c:2fbc:1:f5fc:eb97:a20:8b31])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7386sm9612674f8f.20.2025.06.30.01.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 01:13:12 -0700 (PDT)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-spi@vger.kernel.org
Date: Mon, 30 Jun 2025 10:12:53 +0200
Message-ID: <20250630081253.17294-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <1f49b8f3-44c9-43f3-a3bf-b931fb0726f4@foss.st.com>
References: 
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Antonio Quartulli <antonio@mandelbit.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] spi: stm32: fix pointer-to-pointer
	variables usage
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

In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
and rx_mdma_desc are passed as pointer-to-pointer arguments.

The goal is to pass back to the caller the value returned
by dmaengine_prep_slave_sg(), when it is not NULL.

However, these variables are wrongly handled as simple pointers
during later assignments and checks.

Fix this behaviour by introducing two pointer variables
which can then be treated accordingly.

Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
Addresses-Coverity-ID: 1644715 ("Null pointer dereferences (REVERSE_INULL)")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>

---
Changes from v1:
* introduce *_mdma_desc and *_dma_desc for better readability
* fix another instance of rx_dma_desc bogus assignment in case of
  failure of sg_alloc_table()
* commit title/message reworded accordingly to the previous point
---
 drivers/spi/spi-stm32.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3d20f09f1ae7..4b7f074fdba9 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1474,6 +1474,8 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 						  struct dma_async_tx_descriptor **rx_dma_desc,
 						  struct dma_async_tx_descriptor **rx_mdma_desc)
 {
+	struct dma_async_tx_descriptor *_mdma_desc = *rx_mdma_desc;
+	struct dma_async_tx_descriptor *_dma_desc = *rx_dma_desc;
 	struct dma_slave_config rx_mdma_conf = {0};
 	u32 sram_period, nents = 0, spi_s_len;
 	struct sg_table dma_sgt, mdma_sgt;
@@ -1524,18 +1526,18 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 		}
 	}
 
-	*rx_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, dma_sgt.sgl,
-					       dma_sgt.nents, rx_dma_conf->direction,
-					       DMA_PREP_INTERRUPT);
+	_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, dma_sgt.sgl,
+					    dma_sgt.nents, rx_dma_conf->direction,
+					    DMA_PREP_INTERRUPT);
 	sg_free_table(&dma_sgt);
 
-	if (!rx_dma_desc)
+	if (!_dma_desc)
 		return -EINVAL;
 
 	/* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
 	ret = sg_alloc_table(&mdma_sgt, nents, GFP_ATOMIC);
 	if (ret) {
-		rx_dma_desc = NULL;
+		_dma_desc = NULL;
 		return ret;
 	}
 
@@ -1558,13 +1560,13 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 		}
 	}
 
-	*rx_mdma_desc = dmaengine_prep_slave_sg(spi->mdma_rx, mdma_sgt.sgl,
-						mdma_sgt.nents, rx_mdma_conf.direction,
-						DMA_PREP_INTERRUPT);
+	_mdma_desc = dmaengine_prep_slave_sg(spi->mdma_rx, mdma_sgt.sgl,
+					     mdma_sgt.nents, rx_mdma_conf.direction,
+					     DMA_PREP_INTERRUPT);
 	sg_free_table(&mdma_sgt);
 
-	if (!rx_mdma_desc) {
-		rx_dma_desc = NULL;
+	if (!_mdma_desc) {
+		_dma_desc = NULL;
 		return -EINVAL;
 	}
 
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
