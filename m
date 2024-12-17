Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A82769F546F
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 18:41:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B075C78027;
	Tue, 17 Dec 2024 17:41:51 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02343C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 17:41:49 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHCtt5Q001007;
 Tue, 17 Dec 2024 18:41:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JbpwNe7H/nYAZqga9/+6DPVfcnSEXkS2J7ZN0f7NL8A=; b=ClbHpWdOqUo6m+lk
 beI5nB4wu4lBpS0+JNaWk5ySIEiwvuK3OOKFaYHOOhXveCsUVP54Ly3AcikaA4PA
 iyPJ57ULtbVrudeRoHhEhtt/9g+kbJ29yEn/VNYX+3ZdEWtP6N+NFY8kPUZ1E+dR
 rGodh+U6MaIpMY4CVGTD+CvFLIxHD2lkKul+WgwZUnQ/ZwhyCkyTw4Ckgi8LsoYZ
 Y/KycKYymQxopD8AYCAE519OylQNsKciuhTMjJUQ+CWaNe0g2uc/Ud/UtnnlrKvQ
 uwGjD+kB1/y14SOrFzipmolJRBvdzNijrc1pj1uGw5idUau4xx5y6fImXkfDY3zh
 6QoFFQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5ngavvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 18:41:40 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9E4AE4004D;
 Tue, 17 Dec 2024 18:40:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E79AF2928A8;
 Tue, 17 Dec 2024 18:39:31 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 17 Dec 2024 18:39:24 +0100
MIME-Version: 1.0
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-7-2b432805d17d@foss.st.com>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.252.23.235]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 7/9] media: stm32: csi: remove useless
 fwnode_graph_get_endpoint call
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

The endpoint is already retrieved at the beginning of the function
stm32_csi_parse_dt hence keep the endpoint pointer until the end
instead of getting a new one.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 4affbc00b042..1be12c9dcf55 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -932,38 +932,32 @@ static int stm32_csi_parse_dt(struct stm32_csi_dev *csidev)
 	}
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
-	fwnode_handle_put(ep);
 	if (ret) {
 		dev_err(csidev->dev, "Could not parse v4l2 endpoint\n");
-		return ret;
+		goto out;
 	}
 
 	csidev->num_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
 	if (csidev->num_lanes > STM32_CSI_LANES_MAX) {
 		dev_err(csidev->dev, "Unsupported number of data-lanes: %d\n",
 			csidev->num_lanes);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	memcpy(csidev->lanes, v4l2_ep.bus.mipi_csi2.data_lanes,
 	       sizeof(csidev->lanes));
 
-	ep = fwnode_graph_get_next_endpoint(dev_fwnode(csidev->dev), NULL);
-	if (!ep) {
-		dev_err(csidev->dev, "Failed to get next endpoint\n");
-		return -EINVAL;
-	}
-
 	v4l2_async_subdev_nf_init(&csidev->notifier, &csidev->sd);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csidev->notifier, ep,
 					      struct v4l2_async_connection);
 
-	fwnode_handle_put(ep);
 
 	if (IS_ERR(asd)) {
 		dev_err(csidev->dev, "Failed to add fwnode remote subdev\n");
-		return PTR_ERR(asd);
+		ret = PTR_ERR(asd);
+		goto out;
 	}
 
 	csidev->notifier.ops = &stm32_csi_notifier_ops;
@@ -972,9 +966,11 @@ static int stm32_csi_parse_dt(struct stm32_csi_dev *csidev)
 	if (ret) {
 		dev_err(csidev->dev, "Failed to register notifier\n");
 		v4l2_async_nf_cleanup(&csidev->notifier);
-		return ret;
+		goto out;
 	}
 
+out:
+	fwnode_handle_put(ep);
 	return ret;
 }
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
