Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299A35E184
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 16:32:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAA33C58D58;
	Tue, 13 Apr 2021 14:32:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D826EC57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 14:32:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DENfbF013334; Tue, 13 Apr 2021 16:32:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=pjdn0iPLZsVnMrs5LhG4TkO0pVvE9Vj+yQMAhrHcFD4=;
 b=D8o3fopuhzzacBsQEBYvQTpOZjtYCfs7A40Lsqg9qTYRetxwbeP/tRK0uiwTIZAGiq2o
 mQG1SsVSv8VtLnkzeKPgCENWi3Og7b7XYsROd9NE9KMszI2bnrT9p9XnvUJgphP85hIv
 3Yi0QnniZOhG8ctweBUAdvSP0xb3u4ObVFxEhT4ltCMrFIWtARaQewhdMyR2gJDRB9/6
 jYXzjZ/qUzzRbHycYtQg/mRm2bTl8nkRaldDmv++l2UxpukU3wGWDhVaqj92EWba2M/9
 TQq1o9qmJjRtFBbeGUm1CXXgChJI7nBaV8/5oN3BlVuXnUF2o/nWR4Jj/g8K+cSG/s92 ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vu4e5b92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:32:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32EE5100038;
 Tue, 13 Apr 2021 16:32:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 23D87246F3E;
 Tue, 13 Apr 2021 16:32:17 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 16:32:16
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 13 Apr 2021 16:31:41 +0200
Message-ID: <20210413143141.12919-3-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413143141.12919-1-amelie.delaunay@foss.st.com>
References: <20210413143141.12919-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_08:2021-04-13,
 2021-04-13 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] phy: stm32: manage optional vbus
	regulator on phy_power_on/off
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

This patch adds support for optional vbus regulator.
It is managed on phy_power_on/off calls and may be needed for host mode.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
No changes in v2.
---
 drivers/phy/st/phy-stm32-usbphyc.c | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index c184f4e34584..3e491dfb2525 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -57,6 +57,7 @@ struct pll_params {
 struct stm32_usbphyc_phy {
 	struct phy *phy;
 	struct stm32_usbphyc *usbphyc;
+	struct regulator *vbus;
 	u32 index;
 	bool active;
 };
@@ -291,9 +292,31 @@ static int stm32_usbphyc_phy_exit(struct phy *phy)
 	return stm32_usbphyc_pll_disable(usbphyc);
 }
 
+static int stm32_usbphyc_phy_power_on(struct phy *phy)
+{
+	struct stm32_usbphyc_phy *usbphyc_phy = phy_get_drvdata(phy);
+
+	if (usbphyc_phy->vbus)
+		return regulator_enable(usbphyc_phy->vbus);
+
+	return 0;
+}
+
+static int stm32_usbphyc_phy_power_off(struct phy *phy)
+{
+	struct stm32_usbphyc_phy *usbphyc_phy = phy_get_drvdata(phy);
+
+	if (usbphyc_phy->vbus)
+		return regulator_disable(usbphyc_phy->vbus);
+
+	return 0;
+}
+
 static const struct phy_ops stm32_usbphyc_phy_ops = {
 	.init = stm32_usbphyc_phy_init,
 	.exit = stm32_usbphyc_phy_exit,
+	.power_on = stm32_usbphyc_phy_power_on,
+	.power_off = stm32_usbphyc_phy_power_off,
 	.owner = THIS_MODULE,
 };
 
@@ -519,6 +542,14 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 		usbphyc->phys[port]->index = index;
 		usbphyc->phys[port]->active = false;
 
+		usbphyc->phys[port]->vbus = devm_regulator_get_optional(&phy->dev, "vbus");
+		if (IS_ERR(usbphyc->phys[port]->vbus)) {
+			ret = PTR_ERR(usbphyc->phys[port]->vbus);
+			if (ret == -EPROBE_DEFER)
+				goto put_child;
+			usbphyc->phys[port]->vbus = NULL;
+		}
+
 		port++;
 	}
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
