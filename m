Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A655737AA
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jul 2022 15:40:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F153C640FE;
	Wed, 13 Jul 2022 13:40:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3897AC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 13:40:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DAkwjr027681;
 Wed, 13 Jul 2022 15:40:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=JRyv1cb2Gr7w/X2gySSfzHJgcDNDC1uKvi9JD4ouJro=;
 b=uxo6Dn2D4OrxCBt13hKgXlMQssGX75dS+VpBAutkoEczXuGj/bt63GIA/gj1WjROUAEn
 KPuo60hCkMaqwJXcg9N+q3YidK0/RJp1ACrKT4Z1cwaTPrMAzBhsLNzLLbp3z2fu6Vof
 kyZfE8nfW2DlIMGupt5Oxn0gWBH503RDNQfTqSXRB6RdeHGqLWvcr4QsIoBO0Pcxw23m
 ljbj8BTiExwk08Ex5TEKD8L1QHDPRRX9QBJMOw8i44Qkbe7DtW+r/WICfQWiVNsuxEmm
 1h45HJTihG7GcuGCwInsz/newACWSP9dn8ICqV09XAF3DrIK2tXkU6cBKRA6NI4lYVHb DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h93cwhtbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 15:40:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 757C210002A;
 Wed, 13 Jul 2022 15:40:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9273222C90;
 Wed, 13 Jul 2022 15:40:07 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Jul
 2022 15:40:07 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <vkoul@kernel.org>, <kishon@ti.com>
Date: Wed, 13 Jul 2022 15:39:53 +0200
Message-ID: <20220713133953.595134-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_03,2022-07-13_02,2022-06-22_01
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] phy: stm32: fix error return in
	stm32_usbphyc_phy_init
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

Error code is overridden, in case the PLL doesn't lock. So, the USB
initialization can continue. This leads to a platform freeze.
This can be avoided by returning proper error code to avoid USB probe
freezing the platform. It also displays proper errors in log.

Fixes: 5b1af71280ab ("phy: stm32: rework PLL Lock detection")
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 007a23c78d562..a98c911cc37ae 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -358,7 +358,9 @@ static int stm32_usbphyc_phy_init(struct phy *phy)
 	return 0;
 
 pll_disable:
-	return stm32_usbphyc_pll_disable(usbphyc);
+	stm32_usbphyc_pll_disable(usbphyc);
+
+	return ret;
 }
 
 static int stm32_usbphyc_phy_exit(struct phy *phy)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
