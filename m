Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407242F7C8
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Oct 2021 18:14:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53D31C5C841;
	Fri, 15 Oct 2021 16:14:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BA2BC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 16:14:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FDksMV016875; 
 Fri, 15 Oct 2021 18:14:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=AZCLz9Qu7aCsRJuQKx+MRmvklKYmjkNGSFeQSH6HK7E=;
 b=V7QElrLBUwQPTbuoMIapayW59vQ5g7AC+5zqrySEBWPlux5L1NfY26cMoBiP4hiMCMPK
 kkdDgqe1hI3OtQGxnXy2n3xI+ijoLFVcGzAoLnWeWRpH8PlEoCnHRrsigL7Tv/WoUo7L
 IX1bY/0cXvax1Cx2Jtvs946Mz8oXa6ebK3+hTTcDlpMzn5x0NwiM05Kno94FggOQWp05
 9e39diEaOySNaJxby1fFACLenP8w7ue+zrCozl5Ka8IukLXeSGsVs9kuf5Xj9j2SHNk4
 OS6pqiGv/5m6hBVECKYGyLfii5GqrMO3p7d995nI0fRdq0dtKV5r0a/LrAfserY0Tx/1 tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bqau2ru9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 18:14:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7982100034;
 Fri, 15 Oct 2021 18:14:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A095B231513;
 Fri, 15 Oct 2021 18:14:37 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct 2021 18:14:37
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 15 Oct 2021 18:14:25 +0200
Message-ID: <20211015161427.220784-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015161427.220784-1-amelie.delaunay@foss.st.com>
References: <20211015161427.220784-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_05,2021-10-14_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/3] phy: stm32: restore utmi switch on
	resume
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

UTMI switch value can be lost during suspend/resume, depending on the power
state reached.
This patch adds resume function to usbphyc, to reconfigure utmi switch
after suspend.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 937a14fa7448..083593aea53a 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -598,6 +598,18 @@ static int stm32_usbphyc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused stm32_usbphyc_resume(struct device *dev)
+{
+	struct stm32_usbphyc *usbphyc = dev_get_drvdata(dev);
+
+	if (usbphyc->switch_setup >= 0)
+		stm32_usbphyc_switch_setup(usbphyc, usbphyc->switch_setup);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(stm32_usbphyc_pm_ops, NULL, stm32_usbphyc_resume);
+
 static const struct of_device_id stm32_usbphyc_of_match[] = {
 	{ .compatible = "st,stm32mp1-usbphyc", },
 	{ },
@@ -610,6 +622,7 @@ static struct platform_driver stm32_usbphyc_driver = {
 	.driver = {
 		.of_match_table = stm32_usbphyc_of_match,
 		.name = "stm32-usbphyc",
+		.pm = &stm32_usbphyc_pm_ops,
 	}
 };
 module_platform_driver(stm32_usbphyc_driver);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
