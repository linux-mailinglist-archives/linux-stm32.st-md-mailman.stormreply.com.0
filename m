Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 364CA5532E9
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 15:05:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E85B7C5F1D5;
	Tue, 21 Jun 2022 13:05:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BD96C5E2C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 13:05:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LCFCs4032492;
 Tue, 21 Jun 2022 15:05:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=kGFdEOd4Hn+bp4L8O4UHs/GgLmuaX/4g+RGps8zypXM=;
 b=0Tf5P62jv13J/ItGHFfVm9NGBAcYfEZ67Mlz8icx/CwLABbG6IlNp26/tiRRNNz9s0tT
 lAY0X0P62tNOZyWp1rOieE1zwSe53I4EvY+TpA9Xw1Kcg/skj+z1oQDZ/IPzX9mf7yD0
 dLvEKaEC+R5TIYGNdX4xa6MW2VEtyUIyDy4Be2LXUqbtGe63+tjhP/6+kR/iicQLk4K1
 2px2luFv6F0soSyv3DVCvgpxRhb8W11lJ+bWEw2QzfiEtxfm6YuSzPEPH+YlZbo4mA2k
 zqtiQN/EdZAx7+tdHAIkkSpPRJPRac8qqQu78HvvvJTTIl6CIZpmVLJqIbI1QaBWPbCh nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gu9vcj2n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 15:05:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8503E100034;
 Tue, 21 Jun 2022 15:05:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 805682248AA;
 Tue, 21 Jun 2022 15:05:33 +0200 (CEST)
Received: from localhost (10.75.127.119) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 15:05:33 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>,
 <stern@rowland.harvard.edu>
Date: Tue, 21 Jun 2022 15:05:06 +0200
Message-ID: <20220621130506.85424-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621130506.85424-1-fabrice.gasnier@foss.st.com>
References: <20220621130506.85424-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_06,2022-06-21_01,2022-02-23_01
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] usb: dwc2: host: add TPL support
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

The TPL support is used to identify targeted devices during EH compliance
test. The user can add "tpl-support" in the device tree to enable it.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
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
