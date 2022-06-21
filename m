Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 031875535FA
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 17:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C223DC5F1EE;
	Tue, 21 Jun 2022 15:24:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87A1AC5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 15:24:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LCNK2r006621;
 Tue, 21 Jun 2022 17:24:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Y8yGwGuxXDAU0ksP6EFGL3UGPBuTR8ZUSlyw8NNdFDM=;
 b=iqUTgU67XPhZdW9v918PlV4ouqj3lTFOrmN59xl12pm5xTib9yXpYDD90YAwSy7JcaK/
 MqgMj02u+Dh8YitIk+JwOp7sDH9VUMRbDhwA7TziiQEkSeu3JhpwVVCnPA7oVqA/T2OW
 /V0YVD/utHV+zN6FwgnL3V1Cxp9VWcLPF04zenPUqTnH3/cuzZoojqlx7y9rMswPbldf
 ZaPMFnagMzLwg5k1v6229i2ynvIKeLtgewZHW7msU0yun4K63JW/Q7gWrqqhOIoEsvWF
 tdUtHonk4KwpGeLd7jq69zoqenSqU+SOh6ZYufkobuwYeYLvxqyReMtTvQ3kpqEMtN/t uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gua1n2rb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 17:24:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBCAB10002A;
 Tue, 21 Jun 2022 17:24:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C662922ECD3;
 Tue, 21 Jun 2022 17:24:38 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 17:24:37 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
Date: Tue, 21 Jun 2022 17:23:50 +0200
Message-ID: <20220621152350.145745-5-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621152350.145745-1-fabrice.gasnier@foss.st.com>
References: <20220621152350.145745-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/4] usb: dwc2: host: add TPL support
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

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- added dt-bindings precursor patch
- update commit message to clarify TPL and EH meaning
---
 drivers/usb/dwc2/hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index f63a27d11fac8..4567f3c24d225 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -52,6 +52,7 @@
 
 #include <linux/usb/hcd.h>
 #include <linux/usb/ch11.h>
+#include <linux/usb/of.h>
 
 #include "core.h"
 #include "hcd.h"
@@ -5339,6 +5340,8 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg)
 	/* Don't support SG list at this point */
 	hcd->self.sg_tablesize = 0;
 
+	hcd->tpl_support = of_usb_host_tpl_support(hsotg->dev->of_node);
+
 	if (!IS_ERR_OR_NULL(hsotg->uphy))
 		otg_set_host(hsotg->uphy->otg, &hcd->self);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
