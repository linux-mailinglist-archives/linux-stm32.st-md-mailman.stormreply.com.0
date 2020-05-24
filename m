Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D01DFD60
	for <lists+linux-stm32@lfdr.de>; Sun, 24 May 2020 08:02:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 102CEC36B24;
	Sun, 24 May 2020 06:02:44 +0000 (UTC)
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57DB2C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 06:02:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [222.205.77.158])
 by mail-app4 (Coremail) with SMTP id cS_KCgC3nwrwDcpee6wbAg--.17220S4;
 Sun, 24 May 2020 14:02:27 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Date: Sun, 24 May 2020 14:02:23 +0800
Message-Id: <20200524060224.16189-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgC3nwrwDcpee6wbAg--.17220S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw47Zr18AF13Cr1fXrWDArb_yoW8uFW7pr
 W8tFWFvr4jqaySy3yDJr4kXFZa934fKr97trW8Gwn3Zw45XFyDt3WrJrWj9F18XF95Ar4D
 Kr17A3yxCF1UuFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
 vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxE
 wVAFwVW8AwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
 4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUndb1UUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgEJBlZdtORShQAbsb
Cc: linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: Fix runtime PM
	imbalance on error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

In stm32_dmamux_route_allocate(),  pm_runtime_get_sync() increments
the runtime PM usage counter even when it returns an error code.
Thus a pairing decrement is needed on the error handling path to
keep the counter balanced.

In stm32_dmamux_probe(), when platform_get_resource() returns an
error code, a pairing runtime PM usage counter decrement is needed
to keep the counter balanced. For error paths after this call,
things are the same.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/dma/stm32-dmamux.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index 12f7637e13a1..e68e7078ff94 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -139,6 +139,7 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	spin_lock_irqsave(&dmamux->lock, flags);
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
 		spin_unlock_irqrestore(&dmamux->lock, flags);
 		goto error;
 	}
@@ -246,8 +247,10 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	iomem = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(iomem))
+	if (IS_ERR(iomem)) {
+		pm_runtime_put_noidle(&pdev->dev);
 		return PTR_ERR(iomem);
+	}
 
 	spin_lock_init(&stm32_dmamux->lock);
 
@@ -256,12 +259,14 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 		ret = PTR_ERR(stm32_dmamux->clk);
 		if (ret != -EPROBE_DEFER)
 			dev_err(&pdev->dev, "Missing clock controller\n");
+		pm_runtime_put_noidle(&pdev->dev);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(stm32_dmamux->clk);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "clk_prep_enable error: %d\n", ret);
+		pm_runtime_put_noidle(&pdev->dev);
 		return ret;
 	}
 
@@ -300,6 +305,7 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 	return 0;
 
 err_clk:
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(stm32_dmamux->clk);
 
 	return ret;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
