Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E07E5F50A6
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Oct 2022 10:13:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA3DCC6411D;
	Wed,  5 Oct 2022 08:13:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B99C9C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Oct 2022 08:13:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2955IX64022218;
 Wed, 5 Oct 2022 10:13:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=D4Djt2WHWdTupc+oUzs5c1sYBFs2LXWtRbS/jfMJSUA=;
 b=BaRRCZcHQpRHjovT77S1NPeHt7ajs0uc5NL9NpsujuiVcL/7ij4Uwpv2SPhioeY+n4/Q
 KNWExwUxXF9g2HcvuC2tBFcfKWr/NPkWsvz/VnR/SRMD5cBJz7lo/CoR2Jt0mBAK7Y3c
 eBBELNLszSXkHKIwfRwhA2f1SMjYAv0YDOiB6VIDbLMsluEC9H63WJRSSCSfEqrqjutF
 tTLeDf3f5H458VuQXttE1sl0NCTYzABatr0J3hcYeSSZ7LeHg0ZLRCjwcyJW8ACHU8yP
 IQ0nC6q55NGkZuTWCzmZycL10NT6+BluPD5VjQA2tNuEqn1573yqnOqNww69Y2PHfk1q kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jxapc5sdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 10:13:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A66F10002A;
 Wed,  5 Oct 2022 10:13:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D850216830;
 Wed,  5 Oct 2022 10:13:28 +0200 (CEST)
Received: from localhost (10.75.127.117) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 5 Oct
 2022 10:13:26 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Date: Wed, 5 Oct 2022 10:13:17 +0200
Message-ID: <20221005081317.3411684-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] remoteproc: virtio: Fix warning on
	bindings by removing the of_match_table
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

Suggested-by: Rob Herring <robh@kernel.org>
Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Updates vs previous revision:
- replace the "of_platform.h" include by "platform_device.h",
- replace "Fix-suggested-by" by "Suggested-by",
- add Rob's Reviewed-by.
---
 drivers/remoteproc/remoteproc_virtio.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index a29e3b8ff69c..0e95525c1158 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -13,8 +13,8 @@
 #include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
-#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
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
