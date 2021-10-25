Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CDC439899
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Oct 2021 16:31:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88506C5C824;
	Mon, 25 Oct 2021 14:31:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D139C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Oct 2021 14:31:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PC00Pe012721; 
 Mon, 25 Oct 2021 16:31:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=heLJ4yGEfIp904h0KY7xGdKsvRSbeHaJmHrvhlHM+aQ=;
 b=Umesn97DGsSZUS9e3DX+7OyT6OCTEM9aUpyy1PMkI6rYdGWvtbW+5ZKwKfFArdF7tBMY
 cBNe7zV4RtYWoUovQY7mUWtZHcZ5ycwUL+60IYqf3QVnit692kNYDwb+MyzCWo46j17Y
 s7kL6qjCNrq+cY0EdI7DLn0Ium5sm4xwst0FC1EAhceoQRQBhdP9yzGx42hgZb4lLaUD
 Mbx3hizUirY+Vbt707qdG9gfe55FG82PrrO/BNjWtwuj8KX3hP86IspgiivOcep0xiej
 JuqmeCcGrBblSqo8swezWRui7X3bU8LZaDdsP9GS2UTLvyoHl6o7rgGRAKOljQOXLl9Y 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bwqpsjjg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 16:31:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1305100034;
 Mon, 25 Oct 2021 16:31:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E58DF233C77;
 Mon, 25 Oct 2021 16:31:20 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 25 Oct 2021 16:31:20
 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <vkoul@kernel.org>, <kishon@ti.com>
Date: Mon, 25 Oct 2021 16:31:05 +0200
Message-ID: <1635172265-26219-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_05,2021-10-25_02,2020-04-07_01
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] phy: stm32: adopt dev_err_probe for regulators
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

Change stm32-usbphyc driver to use dev_err_probe(), to benefit of
devices_deferred debugfs in case of probe deferral.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 7df6a63..115be0e 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -672,17 +672,15 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 
 	usbphyc->vdda1v1 = devm_regulator_get(dev, "vdda1v1");
 	if (IS_ERR(usbphyc->vdda1v1)) {
-		ret = PTR_ERR(usbphyc->vdda1v1);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get vdda1v1 supply: %d\n", ret);
+		ret = dev_err_probe(dev, PTR_ERR(usbphyc->vdda1v1),
+				    "failed to get vdda1v1 supply\n");
 		goto clk_disable;
 	}
 
 	usbphyc->vdda1v8 = devm_regulator_get(dev, "vdda1v8");
 	if (IS_ERR(usbphyc->vdda1v8)) {
-		ret = PTR_ERR(usbphyc->vdda1v8);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get vdda1v8 supply: %d\n", ret);
+		ret = dev_err_probe(dev, PTR_ERR(usbphyc->vdda1v8),
+				    "failed to get vdda1v8 supply\n");
 		goto clk_disable;
 	}
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
