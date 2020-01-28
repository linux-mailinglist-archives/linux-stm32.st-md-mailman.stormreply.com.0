Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF8E14B1DB
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2020 10:42:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AE8DC36B0E;
	Tue, 28 Jan 2020 09:42:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5001AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:42:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S9XRtS026096; Tue, 28 Jan 2020 10:42:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=IyA5aTp3/+pbmYuqWZPjub3ixeGxRIPZ8Nm8rzvgpb8=;
 b=b/fgh1LlFXyxNZt/aSiCsjSeGpZ36W1tqi2x7a9AraqiNcRNsDlXahk+WdJum3DFBW8E
 b1DII+LWKUk6aEAYby5KujlnOpI/1+IIEg+iF8hXgC7XXyP8OGiLJSgNkYu+QFnUjsot
 oT25orxBvaL31iv4xcXRiBZymHACFjnPFquvzvS9U7Ggeitjp2ZFJxy+k+HFCD5wcyGU
 6Ob1HxXuUzBQdTgRBFtk+A109PW7oUdidplJ2tgKij7rnQmH/6FLT4iEXRyrHhac8bdR
 UUuGseDvph6jWmYRYAhimj3BO0xAaS4H8kNnbwhxZJsXJM5OEQfLR4MuunBuSGhcQ7gX Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpaw9xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:42:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 726A6100040;
 Tue, 28 Jan 2020 10:42:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67D3221D3C0;
 Tue, 28 Jan 2020 10:42:09 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jan 2020 10:42:09
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Tue, 28 Jan 2020 10:41:57 +0100
Message-ID: <20200128094158.20361-4-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128094158.20361-1-amelie.delaunay@st.com>
References: <20200128094158.20361-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/4] dmaengine: stm32-dmamux: use reset
	controller only at probe time
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

Remove reset controller reference from device instance since it is
used only at probe time.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/dma/stm32-dmamux.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index a862d3339fb7..1dfecbac64cf 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -35,7 +35,6 @@ struct stm32_dmamux {
 struct stm32_dmamux_data {
 	struct dma_router dmarouter;
 	struct clk *clk;
-	struct reset_control *rst;
 	void __iomem *iomem;
 	u32 dma_requests; /* Number of DMA requests connected to DMAMUX */
 	u32 dmamux_requests; /* Number of DMA requests routed toward DMAs */
@@ -182,6 +181,7 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 	struct stm32_dmamux_data *stm32_dmamux;
 	struct resource *res;
 	void __iomem *iomem;
+	struct reset_control *rst;
 	int i, count, ret;
 	u32 dma_req;
 
@@ -265,11 +265,11 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	stm32_dmamux->rst = devm_reset_control_get(&pdev->dev, NULL);
-	if (!IS_ERR(stm32_dmamux->rst)) {
-		reset_control_assert(stm32_dmamux->rst);
+	rst = devm_reset_control_get(&pdev->dev, NULL);
+	if (!IS_ERR(rst)) {
+		reset_control_assert(rst);
 		udelay(2);
-		reset_control_deassert(stm32_dmamux->rst);
+		reset_control_deassert(rst);
 	}
 
 	stm32_dmamux->iomem = iomem;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
