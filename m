Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20987DA764
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2019 10:28:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D04F1C36B0B;
	Thu, 17 Oct 2019 08:28:23 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33BB6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2019 08:28:23 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 08DF78AE15FCECDED770;
 Thu, 17 Oct 2019 16:28:20 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Thu, 17 Oct 2019 16:28:18 +0800
From: Daode Huang <huangdaode@hisilicon.com>
To: <jason@lakedaemon.net>, <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
 <sebastian.hesselbarth@gmail.com>, <tglx@linutronix.de>, <maz@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>, <nm@ti.com>,
 <t-kristo@ti.com>, <ssantosh@kernel.org>
Date: Thu, 17 Oct 2019 16:25:29 +0800
Message-ID: <1571300729-38822-1-git-send-email-huangdaode@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] irqchip: remove redundant semicolon after
	while
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

check drivers/irqchip with "make coccicheck M=drivers/irqchip/",
it will report unneeded semicolon like below, just remove them.

drivers/irqchip/irq-zevio.c:54:2-3: Unneeded semicolon
drivers/irqchip/irq-gic-v3.c:177:2-3: Unneeded semicolon
drivers/irqchip/irq-gic-v3.c:234:2-3: Unneeded semicolon

Signed-off-by: Daode Huang <huangdaode@hisilicon.com>
---
 drivers/irqchip/irq-gic-v3.c | 4 ++--
 drivers/irqchip/irq-zevio.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 422664a..58518e5 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -174,7 +174,7 @@ static void gic_do_wait_for_rwp(void __iomem *base)
 		}
 		cpu_relax();
 		udelay(1);
-	};
+	}
 }
 
 /* Wait for completion of a distributor change */
@@ -231,7 +231,7 @@ static void gic_enable_redist(bool enable)
 			break;
 		cpu_relax();
 		udelay(1);
-	};
+	}
 	if (!count)
 		pr_err_ratelimited("redistributor failed to %s...\n",
 				   enable ? "wakeup" : "sleep");
diff --git a/drivers/irqchip/irq-zevio.c b/drivers/irqchip/irq-zevio.c
index 5a7efeb..84163f1 100644
--- a/drivers/irqchip/irq-zevio.c
+++ b/drivers/irqchip/irq-zevio.c
@@ -51,7 +51,7 @@ static void __exception_irq_entry zevio_handle_irq(struct pt_regs *regs)
 	while (readl(zevio_irq_io + IO_STATUS)) {
 		irqnr = readl(zevio_irq_io + IO_CURRENT);
 		handle_domain_irq(zevio_irq_domain, irqnr, regs);
-	};
+	}
 }
 
 static void __init zevio_init_irq_base(void __iomem *base)
-- 
2.8.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
