Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A87B77BA
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 08:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56D94C6B476;
	Wed,  4 Oct 2023 06:21:36 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FDAEC6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 16:20:35 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-77574c2cffdso88033385a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Oct 2023 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696350034; x=1696954834;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=74pfqmyEpWzC0JVzEWtyP+utP1T9AK68aLigFiWOG7k=;
 b=MGeEctRXhw50PW9s2nlriQ1JLtIMXP9Zjxma313C5ZfAY0kMR70TAfdvUP/ciqM+NU
 deoT6jYTy4ZeP3IjwtwKfiBF62o9mMGWSpFW3NQRI7A21T26iuFMxSNAIkFicApupfWn
 lDR57JI8dpRNhYyQ9eaPhq99pkdptVYcwsICw3XkMgekCk78JBl4a8gDVK/NVJcBbhOB
 5bGfUfl2NS9hHMh/SRXOoaXLi8O1nGAEepaMBtVN32EZuWzhlFKSvr99iJXZIexlhtXC
 dJNVM2mF0FPmIVpPSLVm1nGDLgK/DXPedMD7f3a4lknzOKE/AXqgJXIRVNWLo3bcv1Rp
 he5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696350034; x=1696954834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74pfqmyEpWzC0JVzEWtyP+utP1T9AK68aLigFiWOG7k=;
 b=GZsV72kr9tgOaddWHLTUkpg2mOcD5BgsV5aq2TlX5KhUu/uHajfqMsVj89lEmbUVC+
 3EI55f4jzrVI17+DrAMzFftYTmHbdToXukJXAE8TGL6hKI37lbmxZJETxE0sH4Qn5Sk4
 obAkqX/PHiin+Pt5G7J19QFxzqo7j8J09JvTJZ2nK5IONf82hHWzY3raNK5gwm048Zc4
 /iAtJgxdB9WNveyHx+eYJ12+ghF3U32LgL+E//pyRKIIngb5wEcbZLL6LSUTwEVMhxYY
 sHTMYakSkyQDffGmvrmG1bUMGK5o2q2pqUsAnjMRSJHreBXCDQW55NXYscmaWg4hvWRY
 kY9A==
X-Gm-Message-State: AOJu0YzddEL9tkGfcDvbSDVFkECqyAFFpZ9R+BUWrqR+9ZFMVXw1br40
 sk+s6W2ark8Vq/lQAnlmS46ROM9HYrCADQCjRU+UzA==
X-Google-Smtp-Source: AGHT+IHtRRYP0xi4EcqzYyTvcNrVFeQgKflRTd3luTug/5jCAn+dkgbCAWC4JjZKn8Y1qVNAZQ1H4w==
X-Received: by 2002:a05:620a:4553:b0:76e:f73d:65ae with SMTP id
 u19-20020a05620a455300b0076ef73d65aemr3535399qkp.6.1696350034567; 
 Tue, 03 Oct 2023 09:20:34 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05620a110800b007756c8ce8f5sm574520qkk.59.2023.10.03.09.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 09:20:33 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue,  3 Oct 2023 12:20:03 -0400
Message-ID: <20231003162003.1649967-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Oct 2023 06:21:35 +0000
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH] irqchip/stm32-exti: add missing DT IRQ flag
	translation
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

The STM32F4/7 EXTI driver was missing the xlate callback, so IRQ trigger
flags specified in the device tree were being ignored. This was
preventing the RTC alarm interrupt from working, because it must be set
to trigger on the rising edge to function correctly.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/irqchip/irq-stm32-exti.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index b5fa76ce5046..cb4b195bc849 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -459,6 +459,7 @@ static const struct irq_domain_ops irq_exti_domain_ops = {
 	.map	= irq_map_generic_chip,
 	.alloc  = stm32_exti_alloc,
 	.free	= stm32_exti_free,
+	.xlate	= irq_domain_xlate_twocell,
 };
 
 static void stm32_irq_ack(struct irq_data *d)
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
