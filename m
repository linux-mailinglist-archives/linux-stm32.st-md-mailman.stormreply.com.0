Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F196137A72A
	for <lists+linux-stm32@lfdr.de>; Tue, 11 May 2021 14:54:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBAD9C59784;
	Tue, 11 May 2021 12:54:56 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAB40C58D7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 May 2021 12:54:54 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ffd9S5X5nzkWjX;
 Tue, 11 May 2021 20:52:12 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 20:54:41 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 "Marc Zyngier" <maz@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32
 <linux-stm32@st-md-mailman.stormreply.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 11 May 2021 20:54:28 +0800
Message-ID: <20210511125428.6108-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210511125428.6108-1-thunder.leizhen@huawei.com>
References: <20210511125428.6108-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [Linux-stm32] [PATCH v2 1/1] irqchip: Remove redundant error
	printing
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

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/irqchip/irq-mvebu-icu.c  | 4 +---
 drivers/irqchip/irq-mvebu-sei.c  | 4 +---
 drivers/irqchip/irq-stm32-exti.c | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index 91adf771f185973..090bc3f4f7d883d 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -359,10 +359,8 @@ static int mvebu_icu_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	icu->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(icu->base)) {
-		dev_err(&pdev->dev, "Failed to map icu base address.\n");
+	if (IS_ERR(icu->base))
 		return PTR_ERR(icu->base);
-	}
 
 	/*
 	 * Legacy bindings: ICU is one node with one MSI parent: force manually
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index 18832ccc8ff8751..3a7b7a7f20ca7a4 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -384,10 +384,8 @@ static int mvebu_sei_probe(struct platform_device *pdev)
 
 	sei->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	sei->base = devm_ioremap_resource(sei->dev, sei->res);
-	if (IS_ERR(sei->base)) {
-		dev_err(sei->dev, "Failed to remap SEI resource\n");
+	if (IS_ERR(sei->base))
 		return PTR_ERR(sei->base);
-	}
 
 	/* Retrieve the SEI capabilities with the interrupt ranges */
 	sei->caps = of_device_get_match_data(&pdev->dev);
diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index b9db90c4aa566f1..4704f2ee5797a1d 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -892,10 +892,8 @@ static int stm32_exti_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	host_data->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(host_data->base)) {
-		dev_err(dev, "Unable to map registers\n");
+	if (IS_ERR(host_data->base))
 		return PTR_ERR(host_data->base);
-	}
 
 	for (i = 0; i < drv_data->bank_nr; i++)
 		stm32_exti_chip_init(host_data, i, np);
-- 
2.26.0.106.g9fadedd


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
