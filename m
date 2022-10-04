Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE015F48B7
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Oct 2022 19:40:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0B7CC63327;
	Tue,  4 Oct 2022 17:40:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B530C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 17:40:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294GTKiJ011068;
 Tue, 4 Oct 2022 19:40:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=giapiNY7TCRzpUo88U0f93okWpLLKpJ1FSwj1WrxUAs=;
 b=JJcGzU9SS/qMFd/uT0HTdhAuUsnp96CrnRib9NWFhe+aduh3mBv9yEpVbBzzrapNQnqX
 XOOgxAh3Ix269nuKYuqlOQOAwKkBA1NcwofP85BXMne6i5lIFK72tKQa9KLDN0h/JFe/
 8vypCt43d/csgUIuSlRUn85VcpSkbWaCV1CSnpMbzJXAXr6BzomEolF+SFOQJGYBh0Dk
 aEO44vBxUcm3KKS594xbiBgmYDz8zy82YpLXFUwUmh/MEYZ47YdDSVQvDubdZvuCo8ma
 /gZ4gJspqe9TxeZDNRJschL9fN3OLOuvVZ+Ct69L/+z1z8qt0IWEEtAC6nFBGOF8khBN Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jxcw21qh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 19:40:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7433610002A;
 Tue,  4 Oct 2022 19:40:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5BA825225C;
 Tue,  4 Oct 2022 19:40:24 +0200 (CEST)
Received: from localhost (10.75.127.117) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 4 Oct
 2022 19:40:24 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Date: Tue, 4 Oct 2022 19:40:18 +0200
Message-ID: <20221004174018.3319712-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_08,2022-09-29_03,2022-06-22_01
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] remoteproc: virtio: Fix warning on bindings
	by removing the of_match_table
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

The checkpatch tool complains that "virtio,rproc" is not documented.
But it is not possible to probe the device "rproc-virtio" by declaring
it in the device tree. So documenting it in the bindings does not make
sense.
This commit solves the checkpatch warning by suppressing the useless
of_match_table.

Fix-suggested-by: Rob Herring <robh@kernel.org>
Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index a29e3b8ff69c..26a7d8c498bc 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -593,17 +593,11 @@ static int rproc_virtio_remove(struct platform_device *pdev)
 }
 
 /* Platform driver */
-static const struct of_device_id rproc_virtio_match[] = {
-	{ .compatible = "virtio,rproc" },
-	{},
-};
-
 static struct platform_driver rproc_virtio_driver = {
 	.probe		= rproc_virtio_probe,
 	.remove		= rproc_virtio_remove,
 	.driver		= {
 		.name	= "rproc-virtio",
-		.of_match_table	= rproc_virtio_match,
 	},
 };
 builtin_platform_driver(rproc_virtio_driver);
-- 
2.24.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
