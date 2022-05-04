Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E16251A532
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 18:17:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D68D0C6047D;
	Wed,  4 May 2022 16:17:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAB22C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 16:17:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244EYIqN015912;
 Wed, 4 May 2022 18:17:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=sBpm4BsKn7kHWShYVnazfKsSoeqIvIDBc5BHKKJkurM=;
 b=fDJXWKIVgQuAOM6DGjLpQja5wIndzgbp9ocAcJj/IFfRk88Az3FBa8V0Li/1QZlgDlIG
 pYgFhC7SX2rxvOd84hV6O2RTe9yLCiHTCy76GKhxxGTBRqKUvvGxPlYE2x5K0PsPaxKU
 27JlBfTIkXBnDGmlR+U/PI40UnFr2B5rGW/GbKX/U86tiknr9mHA3wLd7oG/PBv7Evin
 Lt263lXOd20W7/pU2V4haeF0n767H/Vq0PFvFG02fGKYHtNWvMoVbTR0qjHrFQCENM30
 XoP3HIqablvDBXfppWNnw2gK8KWcFwQpx5RGiflkYzihwPsplZeXnqI9WBTdzn1tgNGv vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frvf0n78x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 18:17:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2B15100034;
 Wed,  4 May 2022 18:17:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC49D22D18A;
 Wed,  4 May 2022 18:17:25 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 4 May 2022 18:17:24
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 4 May 2022 18:17:24 +0200
Message-ID: <20220504161724.123180-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_02,2022-02-23_01
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: avoid reset of
	dmamux if used by coprocessor
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

One of the two DMA controllers managed by the DMAMUX can be used by the
coprocessor. It is defined in the device tree with dma-masters.
When the two DMA controllers are used by the main CPU,
dma-masters = <&dma1, &dma2>; is specified in the device tree.
When one of the controllers is used by coprocessor (so not managed by
Linux), dma-masters = <&dma1>; is specified in the device tree.
In this case, Linux driver must not reset the DMAMUX, because it could have
been configured by the coprocessor to use the second DMA controller.
count is the number of DMA controllers defined in dma-masters property.
Reset only if resets property is found and valid in device tree, and if
the two DMA controllers are under Linux control.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-dmamux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index d5d55732adba..eee0c5aa5fb5 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -267,7 +267,7 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 		ret = PTR_ERR(rst);
 		if (ret == -EPROBE_DEFER)
 			goto err_clk;
-	} else {
+	} else if (count > 1) { /* Don't reset if there is only one dma-master */
 		reset_control_assert(rst);
 		udelay(2);
 		reset_control_deassert(rst);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
