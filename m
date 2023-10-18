Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9D67CDEEE
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 16:15:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87811C6C831;
	Wed, 18 Oct 2023 14:15:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37209C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 14:15:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 17FD161291;
 Wed, 18 Oct 2023 14:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9F3C433B6;
 Wed, 18 Oct 2023 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697638505;
 bh=ssmOwkPnzzduxaun5gF9VDAm1xtrFSzXhPPWwH5Jg/0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KpNdKK5xHMUrn+i0+zSQW1wOidzqAk8KfcO+DJRcZlhKs8sj/mpELCGwuv2QMgt0X
 C+qpXa7pnuiTa77nLeg8A/3YKtEcehNCzRcOsc154d+TT7MiB6HwHu7VJyXhwnvm+t
 5+5te7uxwEUfM7ZcNr2z7tAKWr0Jx9XvdHoAkq5TtX49Z8Ofr5UdAx/kCLSrWxBYAP
 hk/CDiq5oQpfc7r3N75u0M5d/wDn3XNnTZaMrcoC+/yE5JybJs+iCFM/c/q64cxOSG
 1X50MKHQ5vLucd0cUTuF2+3gQE3A790T0cXSNRKa71cgBBX8hdyO7E8wq+pRs9shJ9
 ga+lVzlblSLtQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 18 Oct 2023 10:14:48 -0400
Message-Id: <20231018141455.1335353-6-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141455.1335353-1-sashal@kernel.org>
References: <20231018141455.1335353-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.198
Cc: Sasha Levin <sashal@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 06/11] irqchip/stm32-exti: add
	missing DT IRQ flag translation
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

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

[ Upstream commit 8554cba1d6dbd3c74e0549e28ddbaccbb1d6b30a ]

The STM32F4/7 EXTI driver was missing the xlate callback, so IRQ trigger
flags specified in the device tree were being ignored. This was
preventing the RTC alarm interrupt from working, because it must be set
to trigger on the rising edge to function correctly.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20231003162003.1649967-1-ben.wolsieffer@hefring.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/irqchip/irq-stm32-exti.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 8662d7b7b2625..cec9080cccad0 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -403,6 +403,7 @@ static const struct irq_domain_ops irq_exti_domain_ops = {
 	.map	= irq_map_generic_chip,
 	.alloc  = stm32_exti_alloc,
 	.free	= stm32_exti_free,
+	.xlate	= irq_domain_xlate_twocell,
 };
 
 static void stm32_irq_ack(struct irq_data *d)
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
