Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3345214B1DD
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2020 10:42:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1015C36B14;
	Tue, 28 Jan 2020 09:42:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E311C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:42:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S9g9Eo007603; Tue, 28 Jan 2020 10:42:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=meXrSPvvSNZwM5HWiSKL727KyNlCOtYyZ+UfmgFHvs0=;
 b=TzTK4D9ABmvIvWE5xh+svbw84ZDLMsf/RxoEK2U5EJVzxHoOe8WfLeXcnMizLgsdvoxx
 VYZ5MowTqIWcpOQTRHF0dr3yM2CZXUcsU9SrJwsqV5rydTS3R+scTBzXsYYpA6Wj5S95
 SRJf8ssKZArx/dw2NKJFVb9eEEgVGIXDxIhhC19bkjiinXoPoZeSmfkHDmgEEovx2NId
 5PAErDjGWAlLRO7cTksCTNNA9V4kKtp0MsyLcb9lj7uTrMZ48JS8jHP/dnDqRgyAdvYN
 Fbufn/DFQ8wOmWA4Q+F1x6qQFWQc1RlRaFV4sr3qksIPXHu0MSTgn19x3yBlKWJiNts5 yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrc1353nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:42:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B038E100039;
 Tue, 28 Jan 2020 10:42:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A20F321D3C0;
 Tue, 28 Jan 2020 10:42:08 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jan 2020 10:42:08
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Tue, 28 Jan 2020 10:41:56 +0100
Message-ID: <20200128094158.20361-3-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128094158.20361-1-amelie.delaunay@st.com>
References: <20200128094158.20361-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/4] dmaengine: stm32-dmamux: fix clock
	handling in probe sequence
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

From: Etienne Carriere <etienne.carriere@st.com>

This change ensures the DMAMUX device is reset only once it is clocked
and that clock is released in a safe state when probe operation fails.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/dma/stm32-dmamux.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index 08d2395c8943..a862d3339fb7 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -259,6 +259,12 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(stm32_dmamux->clk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "clk_prep_enable error: %d\n", ret);
+		return ret;
+	}
+
 	stm32_dmamux->rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (!IS_ERR(stm32_dmamux->rst)) {
 		reset_control_assert(stm32_dmamux->rst);
@@ -274,14 +280,6 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
-	if (!IS_ERR(stm32_dmamux->clk)) {
-		ret = clk_prepare_enable(stm32_dmamux->clk);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "clk_prep_enable error: %d\n", ret);
-			return ret;
-		}
-	}
-
 	pm_runtime_get_noresume(&pdev->dev);
 
 	/* Reset the dmamux */
@@ -290,8 +288,12 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 
-	return of_dma_router_register(node, stm32_dmamux_route_allocate,
+	ret = of_dma_router_register(node, stm32_dmamux_route_allocate,
 				     &stm32_dmamux->dmarouter);
+	if (ret)
+		clk_disable_unprepare(stm32_dmamux->clk);
+
+	return ret;
 }
 
 #ifdef CONFIG_PM
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
