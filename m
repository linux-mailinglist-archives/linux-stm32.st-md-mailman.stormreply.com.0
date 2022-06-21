Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0F85535F8
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 17:24:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DB91C5EC6C;
	Tue, 21 Jun 2022 15:24:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B5E0C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 15:24:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LDOnmN024429;
 Tue, 21 Jun 2022 17:24:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=z23/ct457ABHLQlvL8cij+lhb6Mrl6uZfABnK9FVHkg=;
 b=QUSEcn2nSqrhGS21GkFzYxqaDv286NWi6kfDKvbfl80MWdfwCUSOoy1nV/3SmA/mlKJP
 1NVUvHXvDMpcmmthSOXE78VVBA7D9ALur86cJoWw3cT/hNttBi+Xa34SRes3uBUtgtBC
 kZFWgyZLM7j0quHI1NBwfba6FPC9GOSySX6J7tOQPqAWeRn/YrVi4J2Y/rl/xLAy5kD4
 8jaYjKXsy2A4r34qB7LZvkUC14XgzSmbfBaBLQViAIZDVIFljtTKHfFP2TgpdUlrrwUh
 EQyx5rKW7XIOn77tcKr29puLcsbJbRpaftFOCvQgAz6IHUNIdTQz4uNpOZh+5kGXl5WT Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3guaqhagxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 17:24:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F2DD10002A;
 Tue, 21 Jun 2022 17:24:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02C9B22ECD3;
 Tue, 21 Jun 2022 17:24:36 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 17:24:35 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
Date: Tue, 21 Jun 2022 17:23:47 +0200
Message-ID: <20220621152350.145745-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621152350.145745-1-fabrice.gasnier@foss.st.com>
References: <20220621152350.145745-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/4] usb: host: ohci-platform: add TPL
	support
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

The Target Peripheral List (TPL) is used to identify targeted devices
during Embedded Host compliance testing. The user can add "tpl-support"
in the device tree to enable it.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- update commit message to clarify TPL and EH meaning
- add collected ack
---
 drivers/usb/host/ohci-platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 47dfbfe9e5190..0adae62651276 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -28,6 +28,7 @@
 #include <linux/usb/ohci_pdriver.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/of.h>
 
 #include "ohci.h"
 
@@ -210,6 +211,8 @@ static int ohci_platform_probe(struct platform_device *dev)
 	hcd->rsrc_start = res_mem->start;
 	hcd->rsrc_len = resource_size(res_mem);
 
+	hcd->tpl_support = of_usb_host_tpl_support(dev->dev.of_node);
+
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err)
 		goto err_power;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
