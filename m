Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E16A51F58C
	for <lists+linux-stm32@lfdr.de>; Mon,  9 May 2022 09:46:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EA6FC6049F;
	Mon,  9 May 2022 07:46:55 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC6FFC628A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 22:57:13 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id kj8so6420043qvb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 May 2022 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGM4e8dlW2rnY5tjhs9oiiib3imBRnPsRxxY6qM+kZ4=;
 b=Cv7nqR/tLqVTBsytmAQLGkwrOSuyqjm9iJALV8wRpxzyMxwLGuvaxVOBblpzJdiQkr
 lCI6oDGbUiipN5u9wBh/WD5G3ZEVmbbk/NuaoAczXPucBVI/Q3/81679OvLoGosOn0Ms
 6w+j96cFj08P6QyRK264+FYtPJZ+6b9HgAhOw5AJTysJudS+l1FZGCdcLUfxMCnCtVn0
 OqDLaqgEFe189lgdb34G6dDmobZ0BtWgqv/HopPqRApa/OBc+bA2nM3l2JZfLkIqbPF5
 tFQY+kx3Ji5mBO7mKOd1zNS+/3LeTKjkUSSA8r0bZA07+d0pM2JeJdOTA7gdXboJsey9
 cAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGM4e8dlW2rnY5tjhs9oiiib3imBRnPsRxxY6qM+kZ4=;
 b=KbL8Xsh1j0dtYiod2DQI9kvGi7UuXKrGviqb8VIWs1azCcCUS+jG5XA/bM75KqT/1P
 1NDP6uUzSZ8DNOEKH/jw5KbXjdW6I+gIllzpGzfP9p1+LT4YWIxDO7pM+mVDKhh3kaB9
 1WF5c9tQpQN/P01xEElHOp6gAvyyQ7TW/qja73txoQy8pWu4jaCoEKKHkzxwKqgsnpEB
 1v2Wh8Q2ohMdgOKw/KAjw0Y7OUQkD2jeTmrfZf3fn3bryEatXUieZFzqbREtbv7JzJqw
 VSacmYq0bmcI6ATo5d3GwUjHATbaVxvZieHGGhLcpvADTyEkYDd9ax4Hrb3PnfLYJIda
 9e9A==
X-Gm-Message-State: AOAM530r25huonOVazl7lUGdpdvA4jbkXITLN4ZO+xQ2i1J6YGJI/iD7
 XK3k7MR6ysOAUu+E0F8QK1g=
X-Google-Smtp-Source: ABdhPJyA6WWf4fVWUYojRIP+BmLp52WJkFjnyvtqNqoebTb6GRjKlflgRAV3EUUYrS3J1hQsfNXsxA==
X-Received: by 2002:a05:6214:b94:b0:456:38b2:2d76 with SMTP id
 fe20-20020a0562140b9400b0045638b22d76mr4403222qvb.70.1651877833036; 
 Fri, 06 May 2022 15:57:13 -0700 (PDT)
Received: from grrm.lan
 (bras-base-mtrlpq4809w-grc-17-70-53-205-21.dsl.bell.ca. [70.53.205.21])
 by smtp.gmail.com with ESMTPSA id
 q188-20020a37a7c5000000b0069fc13ce208sm3187880qke.57.2022.05.06.15.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:57:12 -0700 (PDT)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
 olivier.moysan@foss.st.com
Date: Fri,  6 May 2022 18:56:17 -0400
Message-Id: <20220506225617.1774604-3-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
References: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 May 2022 07:46:53 +0000
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] iio: adc: stm32: Fix check for spurious
	IRQs on STM32F4
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
version, but not the F4.

Instead of comparing both registers bitwise, we check the bit in the status and control
for each interrupt we are interested in.

Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
---
 drivers/iio/adc/stm32-adc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index a68ecbda6480..5b0f138333ee 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1422,9 +1422,10 @@ static irqreturn_t stm32_adc_threaded_isr(int irq, void *data)
 		return IRQ_HANDLED;
 	}
 
-	if (!(status & mask))
+	if(!((status & regs->isr_eoc.mask) && (mask & regs->ier_eoc.mask)) ||
+           ((status & regs->isr_ovr.mask) && (mask & regs->ier_ovr.mask)))
 		dev_err_ratelimited(&indio_dev->dev,
-				    "Unexpected IRQ: IER=0x%08x, ISR=0x%08x\n",
+				    "Unexpected IRQ: CR1/IER=0x%08x, SR/ISR=0x%08x\n",
 				    mask, status);
 
 	return IRQ_NONE;
@@ -1438,7 +1439,9 @@ static irqreturn_t stm32_adc_isr(int irq, void *data)
 	u32 status = stm32_adc_readl(adc, regs->isr_eoc.reg);
 	u32 mask = stm32_adc_readl(adc, regs->ier_eoc.reg);
 
-	if (!(status & mask))
+	/* Check that we have the interrupt we care about are enabled and active */
+        if(!((status & regs->isr_eoc.mask) && (mask & regs->ier_eoc.mask)) ||
+           ((status & regs->isr_ovr.mask) && (mask & regs->ier_ovr.mask)))
 		return IRQ_WAKE_THREAD;
 
 	if (status & regs->isr_ovr.mask) {
-- 
2.36.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
