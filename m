Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A851A48C
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 17:53:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50480C628AB;
	Wed,  4 May 2022 15:53:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDC50C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 15:53:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244EaEtA026474;
 Wed, 4 May 2022 17:53:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=pXUx8kWfnqdiCoNzlXrT4VSy1bUDFwsBeS/sZv4Bm+E=;
 b=gNsO7KDlclnEG1JxjL/chJTpYRQiNJdxtb6V3Dl+vB6Ncyzvrw5dljiB/0ZKGfGnVqLu
 NZv9H4vP81Dvwokcj61ow21uAq5Znt2ZG1ySdEW7oFrmj6cCK3w+Y0Xfq5tJUe8qagrb
 z1wYS/rMcrDsf9WzxMm5Hbv6NuBuYUcb5Pivrx1Fy4GaDNPsbJFX1CNyVEDBo07YunjW
 s8NTU3px4tWf16J1msyg13cw2v5w5rZdsi39AFA+2F+AQhmGc7KAY07lIlPp6B/aFBnc
 SIC+1RyxqgsdY8wVbRj5+YEjjJd84w3uJbauzSACV9xRfjSyr8HEqveASoj9XZkQI1Y/ tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt88xpj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 17:53:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E1B510002A;
 Wed,  4 May 2022 17:53:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77F5322A6E3;
 Wed,  4 May 2022 17:53:39 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 4 May 2022 17:53:38
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 4 May 2022 17:53:21 +0200
Message-ID: <20220504155322.121431-3-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504155322.121431-1-amelie.delaunay@foss.st.com>
References: <20220504155322.121431-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_02,2022-02-23_01
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/3] dmaengine: stm32-mdma: fix chan
	initialization in stm32_mdma_irq_handler()
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

The parameter to pass back to the handler function when irq has been
requested is a struct stm32_mdma_device pointer, not a struct
stm32_mdma_chan pointer.
Even if chan is reinit later in the function, remove this wrong
initialization.

Fixes: a4ffb13c8946 ("dmaengine: Add STM32 MDMA driver")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-mdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 57f0eb8a18fc..a5cbfbbb93d1 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1318,7 +1318,7 @@ static void stm32_mdma_xfer_end(struct stm32_mdma_chan *chan)
 static irqreturn_t stm32_mdma_irq_handler(int irq, void *devid)
 {
 	struct stm32_mdma_device *dmadev = devid;
-	struct stm32_mdma_chan *chan = devid;
+	struct stm32_mdma_chan *chan;
 	u32 reg, id, ccr, ien, status;
 
 	/* Find out which channel generates the interrupt */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
