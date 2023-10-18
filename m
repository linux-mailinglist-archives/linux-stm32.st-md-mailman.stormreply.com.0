Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AD07CDF03
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 16:15:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0EF9C6C831;
	Wed, 18 Oct 2023 14:15:59 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B622FC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 14:15:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 11319CE258F;
 Wed, 18 Oct 2023 14:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A0DC43142;
 Wed, 18 Oct 2023 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697638556;
 bh=fzqVTdzzHqVHHNS01FZwgiprtR5zd9hgbp3BjdCfIVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XTBf5v89LAIHIALCKYHK0RGXDcht9U0RNRAMpMey/e2ddGH1t5Glt8adhyeK43L2B
 LQviZF12GjlNXBcYHCnGqV8kWWmRCKbCruk3bMBCktsWgy19zA9eWMNLk4B/h0yHm6
 a3tG5cBkVsMlpU1LkXllyK5KpS6jwWXm2oPyfXplZbXyp4ZiyGJV9aaLZElwXqguZe
 1w8FwT9bR04nsb0h8lv9zCKmDhRdckF7uDZzZYlQoJ3To+Bnjx+IFBu90KgUb+PJQP
 oDznToGSej8CfoVuwRp1w63QAhEgauujVHeykKYmtjvlMq2XnhXM04Z762DDXwpgmw
 C7lg9xwSLvRvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 18 Oct 2023 10:15:42 -0400
Message-Id: <20231018141548.1335665-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141548.1335665-1-sashal@kernel.org>
References: <20231018141548.1335665-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.296
Cc: Sasha Levin <sashal@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.19 3/7] irqchip/stm32-exti: add
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
index f605470855f19..ed7346fb687bf 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -365,6 +365,7 @@ static const struct irq_domain_ops irq_exti_domain_ops = {
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
