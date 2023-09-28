Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002A7B540F
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3771C6B473;
	Mon,  2 Oct 2023 13:37:13 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C3C3C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 13:57:31 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-65d0b0e7798so6766576d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1695909449; x=1696514249;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oSN40jT34NDKom0qJtUzhXag8Ev4KHRW8ZHHC4ki3H0=;
 b=2r4CVfqtoMB5CkfwZKHeN9N8jbIG+41tD9iXA9G83lYUFbAGUkxuwZZDMWPPJN2UXi
 zO7fsz6+nMhA8rJDOOS11nusf2CyOkZ/H8DYCs8gllN4sBuW1/63CdFmDxiTOIN/hdbQ
 lF3mz1aSdVG5Vt7qwFlz3eFXo5IM+9jzTM2HOe41dZbxuvuJLEFLYzIVqm0onWQFjTNP
 djCmuY+ANoKZZpLuMiQZFCj+lo+YXqGNjKLc1ja/aFyKXibgcK6ZOSCEQx10HGHlWmvp
 5oFMHyFFkXCoz0vwy7T0HVAD46S5F/prha67JkIrTPGzxSeix+WkPIsm5Nr82+MvWxtg
 t1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695909449; x=1696514249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oSN40jT34NDKom0qJtUzhXag8Ev4KHRW8ZHHC4ki3H0=;
 b=vzUzdyGD1Om3He2T3BSWuGrW30u4EWfArmAbhCU4MszFcfjsCfzBEuypFzH93t6xOx
 XzuDV4hqOD26v/0UbcVjqUWvk5TBCKltIXeIIeRIAgFSad5h4Ib2xclc+Y3kuJ2IuJW9
 iH71Clu+8aRNrvMcnic2LV8S4EqUcZ9g5u5JjjLlGli/UcD+2kHMS4wMLTHzN3Yt6wPS
 0wkyhCSWxZPahABIRpFSqCW6HGw34+XlO2c3X4ekFXU23XW6GvRMD/2m4umfjIqPBryS
 TySbHQdM4wBiCmlCJ3BFGQjDPsuR5mIjbtT+pRGjYBhwhxZTIAfatnM+NdbXHrlsRL9S
 UPcA==
X-Gm-Message-State: AOJu0Yy+rXwnotXdm3Cg35eR/+wXOfAQT+3O2+fWzz7Y+KO9xL3gVDZe
 yz8DXtYzQ6aPksp8tby0myajDk9I3DzvG85Z9uiSyQ==
X-Google-Smtp-Source: AGHT+IGWdn26NNdifnVExovijL5Usr/Yz4eGRPPDpetnJW0N8ZJ8ASVWk2eVgwnW8IZq0ltvmEXprg==
X-Received: by 2002:a0c:cb12:0:b0:64f:4a4a:edc9 with SMTP id
 o18-20020a0ccb12000000b0064f4a4aedc9mr1141508qvk.64.1695909449665; 
 Thu, 28 Sep 2023 06:57:29 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a0c9e8a000000b006562b70805bsm3843529qvd.84.2023.09.28.06.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 06:57:29 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 28 Sep 2023 09:56:44 -0400
Message-ID: <20230928135644.1489691-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Oct 2023 13:37:12 +0000
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH v2] mmc: mmci: use peripheral flow control for
	STM32
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

From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>

The STM32 SDMMC peripheral (at least for the STM32F429, STM32F469 and
STM32F746, which are all the currently supported devices using periphid
0x00880180) requires DMA to be performed in peripheral flow controller
mode. From the STM32F74/5 reference manual, section 35.3.2:

"SDMMC host allows only to use the DMA in peripheral flow controller
mode. DMA stream used to serve SDMMC must be configured in peripheral
flow controller mode"

This patch adds a variant option to control peripheral flow control and
enables it for the STM32 variant.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2: use bool instead of u8:1

 drivers/mmc/host/mmci.c | 3 ++-
 drivers/mmc/host/mmci.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 769b34afa835..90e32f18abbc 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -249,6 +249,7 @@ static struct variant_data variant_stm32 = {
 	.f_max			= 48000000,
 	.pwrreg_clkgate		= true,
 	.pwrreg_nopower		= true,
+	.dma_flow_controller	= true,
 	.init			= mmci_variant_init,
 };
 
@@ -1012,7 +1013,7 @@ static int _mmci_dmae_prep_data(struct mmci_host *host, struct mmc_data *data,
 		.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES,
 		.src_maxburst = variant->fifohalfsize >> 2, /* # of words */
 		.dst_maxburst = variant->fifohalfsize >> 2, /* # of words */
-		.device_fc = false,
+		.device_fc = variant->dma_flow_controller,
 	};
 	struct dma_chan *chan;
 	struct dma_device *device;
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index 253197f132fc..34d9897c289b 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -332,6 +332,7 @@ enum mmci_busy_state {
  * @opendrain: bitmask identifying the OPENDRAIN bit inside MMCIPOWER register
  * @dma_lli: true if variant has dma link list feature.
  * @stm32_idmabsize_mask: stm32 sdmmc idma buffer size.
+ * @dma_flow_controller: use peripheral as flow controller for DMA.
  */
 struct variant_data {
 	unsigned int		clkreg;
@@ -378,6 +379,7 @@ struct variant_data {
 	u8			dma_lli:1;
 	u32			stm32_idmabsize_mask;
 	u32			stm32_idmabsize_align;
+	bool			dma_flow_controller;
 	void (*init)(struct mmci_host *host);
 };
 
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
