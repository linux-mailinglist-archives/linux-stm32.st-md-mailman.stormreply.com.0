Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89134A2FB
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 09:10:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55F4FC57B79;
	Fri, 26 Mar 2021 08:10:07 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 019A5C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 12:04:39 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5kHG44ZTzPlls;
 Thu, 25 Mar 2021 20:02:02 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 20:03:59 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <pierre-yves.mordret@foss.st.com>, <alain.volmat@foss.st.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <p.zabel@pengutronix.de>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>
Date: Thu, 25 Mar 2021 20:04:32 +0800
Message-ID: <1616673872-4382-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 26 Mar 2021 08:10:05 +0000
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] i2c: stm32f7: Remove useless error message
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

Fix the following coccicheck report:

drivers/i2c/busses/i2c-stm32f7.c:2032:3-10 : platform_get_irq :
line 2032 is redundant because platform_get_irq() already prints an error

Remove dev_err() messages after platform_get_irq() failures.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 162a3b0..9fbcbd1 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2035,12 +2035,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	phy_addr = (dma_addr_t)res->start;
 
 	irq_event = platform_get_irq(pdev, 0);
-	if (irq_event <= 0) {
-		if (irq_event != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to get IRQ event: %d\n",
-				irq_event);
+	if (irq_event <= 0)
 		return irq_event ? : -ENOENT;
-	}
 
 	irq_error = platform_get_irq(pdev, 1);
 	if (irq_error <= 0)
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
