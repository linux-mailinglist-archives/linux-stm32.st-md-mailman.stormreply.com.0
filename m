Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 573719BBDC5
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 20:08:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 050FAC6DD9A;
	Mon,  4 Nov 2024 19:08:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 479E1C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2024 19:08:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 319895C5432;
 Mon,  4 Nov 2024 19:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C6DC4CECE;
 Mon,  4 Nov 2024 19:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730747323;
 bh=/6rcbMtM42HcnHtS60PzjqVFy7pKZof26/BWcubLefQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ZeeDAWOIFGxAbASpg1wkeN5leoCtZslN+XiOFlneYPTVx1GWTOaBjf+Y0jagph0iQ
 zQuiTrnzQ9dhxhV4pZANcAPElQz/Qi4tBrVCfdkucKcubur2s+qSfm+KC1ecX/7eL9
 Q181IrhJ8Jl3RMFan00mJ1Cbd3ib0eisD3/ObWn6y9yZ7clBTP7a7aPZ3+Njy3d7hJ
 e0MrlXdNhhpjWBqCRebmIbm32WT4tl+JG9ArS4M9tYDmwZfutLUtxWCc+teOc5MKZN
 cUGEGHcjODbVCHWUrTil6y0RMZHSwxynilpnfjUUZCAu36NK5JyEpwJqy+/veYTa2f
 0NLw5MExvoWFw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon,  4 Nov 2024 13:08:35 -0600
Message-ID: <20241104190836.278117-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] irqchip/stm32mp-exti: Use
	of_property_present() for non-boolean properties
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/irqchip/irq-stm32mp-exti.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index 33e0cfdea654..cb83d6cc6113 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -696,8 +696,7 @@ static int stm32mp_exti_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (of_property_read_bool(np, "interrupts-extended"))
-		host_data->dt_has_irqs_desc = true;
+	host_data->dt_has_irqs_desc = of_property_present(np, "interrupts-extended");
 
 	return 0;
 }
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
