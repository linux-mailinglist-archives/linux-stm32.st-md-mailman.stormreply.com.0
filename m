Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B522C112D
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 18:01:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 375BCC56637;
	Mon, 23 Nov 2020 17:01:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0573BC56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 17:01:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ANGwP0X011882; Mon, 23 Nov 2020 18:01:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=GNGhCGFijTlDWmEsKvydCMqBIWrPg4lKIna6GEFbM2E=;
 b=HCjPJZwygltD+bbckZUgarq1qGrXaNsAe7cEydP/4hFmRqlCy6JxeqUEOZq6pundSNAa
 JiVyESZzIkOjyah8+EIDsrsYWlph+br1CGTepBDOsVLl/CmIBFaAaOG8qdFBmsw+eI+W
 O4yDmOrmBSCIiPCmpL+yyZMujz8FVtPWYrpI7iIWUT+BCXgX/N4SwzQpepF5UgkZYBIJ
 nGUkjqp+UFLbh+H1krRqNz7PmZ0s3bjLjG6SGobenjVrnui2aHeCOd0Q8FpeaaNUzeEx
 yYd0FVO0g6OkkjoxnUGDObL1phey0+0aryC2IRGf8/wGZ21PvaMvaVzWTudqKw174h3/ fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fgkmm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 18:01:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CC6B10002A;
 Mon, 23 Nov 2020 18:01:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 708C12BA2D0;
 Mon, 23 Nov 2020 18:01:42 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov 2020 18:01:42
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 23 Nov 2020 18:01:31 +0100
Message-ID: <20201123170132.17859-6-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123170132.17859-1-amelie.delaunay@st.com>
References: <20201123170132.17859-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_14:2020-11-23,
 2020-11-23 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 5/6] phy: stm32: ensure phy are no more active
	when removing the driver
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

To ensure a good balancing of regulators, and allow PLL disabling when the
driver is removed, call stm32_usbphyc_phy_exit on each ports to set phys
inactive and disable PLL.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 33367a325612..8b11d95b2c20 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -470,6 +470,12 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 static int stm32_usbphyc_remove(struct platform_device *pdev)
 {
 	struct stm32_usbphyc *usbphyc = dev_get_drvdata(&pdev->dev);
+	int port;
+
+	/* Ensure PHYs are not active, to allow PLL disabling */
+	for (port = 0; port < usbphyc->nphys; port++)
+		if (usbphyc->phys[port]->active)
+			stm32_usbphyc_phy_exit(usbphyc->phys[port]->phy);
 
 	clk_disable_unprepare(usbphyc->clk);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
