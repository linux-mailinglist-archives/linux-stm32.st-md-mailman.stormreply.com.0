Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54114B1DA
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2020 10:42:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59D77C36B0B;
	Tue, 28 Jan 2020 09:42:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A65C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:42:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S9WY2Y031223; Tue, 28 Jan 2020 10:42:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+sBJ5wscdYLYeiF4DeuorI/LsDqHFHp2G8EwB/5qkCw=;
 b=OZPFB8fOFpQ0iagujnOK0ewnRVGKCKaqL3mAGlE+IZkMVt9HEPM5Qxy915L+cPzmFnyp
 GEcHANaXEDp/7t7OZFXVZOy6Q8B7Y3lRBAS0BQvl9mKHp8/kV0y8vPfWpGvywrG1sUrL
 3iyRS2U229GhPZu/iCI3dnEBVJD+bOvnFt5JgKquriv4wYXUaWDh2mrj2dppixVkHpOi
 eFbilKrzu0HM8ipZbckUeQ8ROnlKn7p8ojYtmvkqn34B+jd4I9OArJ4xNhWIv5uIGnZ9
 WU4C994/o3vN2RGIWv/BBs3SKyyxSzNVdcAI2BNOgG+6NX+q0uPT1Wxj8611hRtBE9cA pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdekd0me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:42:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16B5110003E;
 Tue, 28 Jan 2020 10:42:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B10521D3C0;
 Tue, 28 Jan 2020 10:42:08 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jan 2020 10:42:07
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Tue, 28 Jan 2020 10:41:55 +0100
Message-ID: <20200128094158.20361-2-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128094158.20361-1-amelie.delaunay@st.com>
References: <20200128094158.20361-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] dmaengine: stm32-dmamux: add
	suspend/resume power management support
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

From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Add suspend/resume power management relying on PM Runtime engine.

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/dma/stm32-dmamux.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index 3c89bd39e096..08d2395c8943 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -41,6 +41,9 @@ struct stm32_dmamux_data {
 	u32 dmamux_requests; /* Number of DMA requests routed toward DMAs */
 	spinlock_t lock; /* Protects register access */
 	unsigned long *dma_inuse; /* Used DMA channel */
+	u32 ccr[STM32_DMAMUX_MAX_DMA_REQUESTS]; /* Used to backup CCR register
+						 * in suspend
+						 */
 	u32 dma_reqs[]; /* Number of DMA Request per DMA masters.
 			 *  [0] holds number of DMA Masters.
 			 *  To be kept at very end end of this structure
@@ -318,7 +321,54 @@ static int stm32_dmamux_runtime_resume(struct device *dev)
 }
 #endif
 
+#ifdef CONFIG_PM_SLEEP
+static int stm32_dmamux_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct stm32_dmamux_data *stm32_dmamux = platform_get_drvdata(pdev);
+	int i, ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < stm32_dmamux->dma_requests; i++)
+		stm32_dmamux->ccr[i] = stm32_dmamux_read(stm32_dmamux->iomem,
+							 STM32_DMAMUX_CCR(i));
+
+	pm_runtime_put_sync(dev);
+
+	pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int stm32_dmamux_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct stm32_dmamux_data *stm32_dmamux = platform_get_drvdata(pdev);
+	int i, ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < stm32_dmamux->dma_requests; i++)
+		stm32_dmamux_write(stm32_dmamux->iomem, STM32_DMAMUX_CCR(i),
+				   stm32_dmamux->ccr[i]);
+
+	pm_runtime_put_sync(dev);
+
+	return 0;
+}
+#endif
+
 static const struct dev_pm_ops stm32_dmamux_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(stm32_dmamux_suspend, stm32_dmamux_resume)
 	SET_RUNTIME_PM_OPS(stm32_dmamux_runtime_suspend,
 			   stm32_dmamux_runtime_resume, NULL)
 };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
