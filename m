Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9A528F86
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 22:40:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E909FC5A4FD;
	Mon, 16 May 2022 20:40:09 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8787C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 20:40:08 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id p4so12952335qtq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 13:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hKBcyX3Ppfu6XQjIjRejfr2DzYtK4WWEcAa5qty3cHg=;
 b=oukrXqAAZdBan6tdF/K2D/kCxUwWgPeZLEnHGfR+Ln2zBB1SI+qLLEfyNCPPXVMh22
 qjUN8mwA7XKNfDNOaSMbYwhl8TJQOibuS9mVrzonAfGAO/iqdUCpyVD7K6RYYt6Ck+09
 5I0enB+WW4r5ELpXeKMMneOKTFZK9+adctc1HrJ/lqyJ0JqYaBrrnZfsP4R8kybDxWNY
 cY+mKVgXNFoEggevYW+sqUyma+gTEVo8vb7W7f/KFatUHvASyI950xDNhsrgxw5WnpKh
 2pNj5+4jAfv5YMPMByRTCn6tNxzFhWmWAonNqG+6rB5jM/Qr5rcj4nZzcbgnRhsSq9x6
 tnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hKBcyX3Ppfu6XQjIjRejfr2DzYtK4WWEcAa5qty3cHg=;
 b=cUaOXBvGI1laZg4bLbpTxS8UHAb/qenbW3qZY2hhLJVGM2wKWfN5coe9vfF1B88h5d
 1+Xetq/HaAH9lv2K8Ee9T8xeI06toC9kv8XwKn1Lw1hn2Kbfo0EtrID+KRYeLlHyiau2
 z3nWAA+ENQ2rIBGdvbTgBWzVm/955tidGTnzpsQiuSP9RGrMnY6Rjfvk8LeMIBjZh2lf
 Y8ibaK5PkA86Ou8QNs3QEJkzXq+WY6jufbP2tKLhKiKUnDSCRQ3QhQKl/QAy2u79Bvnj
 E1CrshqoL5U6URxlZw/nOEvJTMB403IEmV/T7z7uxVD83ggJwdZtwKrfko91WiO7Vrhq
 Dgwg==
X-Gm-Message-State: AOAM530tpFVUVfiTbCcvI8YmDfzrcPiOkoyJkbVzp86YOMtyDA+J9R52
 wrcVzWSVr/HLoPGPjO+oIbE=
X-Google-Smtp-Source: ABdhPJyYvbcv8J+a4WY5fmCWaSGt/mt3uew74uDkCuyrQ24GIBr26QFwVCeQkFKfAyRihFdydtDalw==
X-Received: by 2002:ac8:5f06:0:b0:2f3:cbe5:1e1d with SMTP id
 x6-20020ac85f06000000b002f3cbe51e1dmr16773074qta.389.1652733607848; 
 Mon, 16 May 2022 13:40:07 -0700 (PDT)
Received: from grrm.lan
 (bras-base-mtrlpq4809w-grc-17-70-53-205-21.dsl.bell.ca. [70.53.205.21])
 by smtp.gmail.com with ESMTPSA id
 k67-20020a378846000000b006a00fabde68sm6364016qkd.10.2022.05.16.13.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:40:07 -0700 (PDT)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
 olivier.moysan@foss.st.com
Date: Mon, 16 May 2022 16:39:39 -0400
Message-Id: <20220516203939.3498673-3-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516203939.3498673-1-yannick.brosseau@gmail.com>
References: <20220516203939.3498673-1-yannick.brosseau@gmail.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] iio: adc: stm32: Fix IRQs on STM32F4
	by removing custom spurious IRQs message
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

The check for spurious IRQs introduced in 695e2f5c289bb assumed that the bits
in the control and status registers are aligned. This is true for the H7 and MP1
version, but not the F4. The interrupt was then never handled on the F4.

Instead of increasing the complexity of the comparison and check each bit specifically,
we remove this check completely and rely on the generic handler for spurious IRQs.

Fixes: 695e2f5c289b ("iio: adc: stm32-adc: fix a regression when using dma and irq")
Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
---
 drivers/iio/adc/stm32-adc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index a68ecbda6480..8c5f05f593ab 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1407,7 +1407,6 @@ static irqreturn_t stm32_adc_threaded_isr(int irq, void *data)
 	struct stm32_adc *adc = iio_priv(indio_dev);
 	const struct stm32_adc_regspec *regs = adc->cfg->regs;
 	u32 status = stm32_adc_readl(adc, regs->isr_eoc.reg);
-	u32 mask = stm32_adc_readl(adc, regs->ier_eoc.reg);
 
 	/* Check ovr status right now, as ovr mask should be already disabled */
 	if (status & regs->isr_ovr.mask) {
@@ -1422,11 +1421,6 @@ static irqreturn_t stm32_adc_threaded_isr(int irq, void *data)
 		return IRQ_HANDLED;
 	}
 
-	if (!(status & mask))
-		dev_err_ratelimited(&indio_dev->dev,
-				    "Unexpected IRQ: IER=0x%08x, ISR=0x%08x\n",
-				    mask, status);
-
 	return IRQ_NONE;
 }
 
@@ -1436,10 +1430,6 @@ static irqreturn_t stm32_adc_isr(int irq, void *data)
 	struct stm32_adc *adc = iio_priv(indio_dev);
 	const struct stm32_adc_regspec *regs = adc->cfg->regs;
 	u32 status = stm32_adc_readl(adc, regs->isr_eoc.reg);
-	u32 mask = stm32_adc_readl(adc, regs->ier_eoc.reg);
-
-	if (!(status & mask))
-		return IRQ_WAKE_THREAD;
 
 	if (status & regs->isr_ovr.mask) {
 		/*
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
