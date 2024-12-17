Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C979F546A
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 18:41:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 349B9C78021;
	Tue, 17 Dec 2024 17:41:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96ACFC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 17:41:42 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDBuIS020750;
 Tue, 17 Dec 2024 18:41:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mvpHg9TQ6IL1UuT8hLct/OvilUvBkO53Z6F+HaXouII=; b=tUww6sAl9XgZvtGq
 bscHCDBlria19rY6TKDagQ9nViKj/T9vzH4aCBn4KtYt1/YY3gJsd9bv3/+F/c2O
 O+AWqi/YaEAoCKcEsEeU3PEo/nOZRx6Q66iO3vbSIAmzBdPvH7LClKh/QGZLGWNx
 hKEovd9F9p6VOv+YisgECvrUt8Eg1ylGtZd/NQT6E9kbOMEJyaBfRs3SgP8Uj7DB
 4qhP8gUi1hHTtazwtjdm2Upf/utRgJskMSPklrUetbG2xU+iuiZykIzTVVAkmWIE
 33PHPlBBBZqghHzc3B4m35TWZXo8EwXpL/8rz8NDd7j3cRU4XAinK5ZgohGwJEBv
 1fdwiA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5dgtxwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 18:41:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 219F840050;
 Tue, 17 Dec 2024 18:40:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38FCD2945DD;
 Tue, 17 Dec 2024 18:39:34 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 17 Dec 2024 18:39:26 +0100
MIME-Version: 1.0
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-9-2b432805d17d@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 9/9] media: stm32: dcmipp: add has_csi2 &
 needs_mclk in match data
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

Introduce two variable has_csi and has_mclk within the
match data of the driver in order to know, depending on
the compatible if CSI-2 interface is available and if
the mclk clk should be retrieved.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 23 ++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 5a04018a6a9d..1b7bae3266c8 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -89,6 +89,8 @@ struct dcmipp_pipeline_config {
 	const struct dcmipp_ent_link *links;
 	size_t num_links;
 	u32 hw_revision;
+	bool has_csi2;
+	bool needs_mclk;
 };
 
 /* --------------------------------------------------------------------------
@@ -164,7 +166,9 @@ static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
 	.num_ents	= ARRAY_SIZE(stm32mp25_ent_config),
 	.links		= stm32mp25_ent_links,
 	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
-	.hw_revision    = DCMIPP_STM32MP25_VERR
+	.hw_revision    = DCMIPP_STM32MP25_VERR,
+	.has_csi2	= true,
+	.needs_mclk	= true
 };
 
 #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
@@ -296,7 +300,7 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				     struct v4l2_async_connection *asd)
 {
 	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
-	int ret;
+	int ret = -EINVAL;
 	int src_pad, i;
 	struct dcmipp_ent_device *sink;
 	struct v4l2_fwnode_endpoint vep = { 0 };
@@ -304,15 +308,9 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 	enum v4l2_mbus_type supported_types[] = {
 		V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656, V4L2_MBUS_CSI2_DPHY
 	};
-	int supported_types_nb = ARRAY_SIZE(supported_types);
 
 	dev_dbg(dcmipp->dev, "Subdev \"%s\" bound\n", subdev->name);
 
-	/* Only MP25 supports CSI input */
-	if (!of_device_is_compatible(dcmipp->dev->of_node,
-				     "st,stm32mp25-dcmipp"))
-		supported_types_nb--;
-
 	/*
 	 * Link this sub-device to DCMIPP, it could be
 	 * a parallel camera sensor or a CSI-2 to parallel bridge
@@ -330,7 +328,12 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	/* Check for supported MBUS type */
-	for (i = 0; i < supported_types_nb; i++) {
+	for (i = 0; i < ARRAY_SIZE(supported_types); i++) {
+		/* Only MP25 supports CSI input */
+		if (supported_types[i] == V4L2_MBUS_CSI2_DPHY &&
+		    !dcmipp->pipe_cfg->has_csi2)
+			continue;
+
 		vep.bus_type = supported_types[i];
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 		if (!ret)
@@ -529,7 +532,7 @@ static int dcmipp_probe(struct platform_device *pdev)
 				     "Unable to get kclk\n");
 	dcmipp->kclk = kclk;
 
-	if (!of_device_is_compatible(pdev->dev.of_node, "st,stm32mp13-dcmipp")) {
+	if (dcmipp->pipe_cfg->needs_mclk) {
 		mclk = devm_clk_get(&pdev->dev, "mclk");
 		if (IS_ERR(mclk))
 			return dev_err_probe(&pdev->dev, PTR_ERR(mclk),

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
