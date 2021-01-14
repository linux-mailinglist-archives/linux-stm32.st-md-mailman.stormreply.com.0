Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB92F60D2
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 13:13:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86982C57197;
	Thu, 14 Jan 2021 12:13:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 480C2C424C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 12:13:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10ECCrCw004475; Thu, 14 Jan 2021 13:13:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=NTpsfT6iksXu3OeTq0fWgBp3yo+NoitLUQurl4MlQio=;
 b=bUSoSEnW0GZ1k2+zWVhpce7TiMyYKO3r0JqxetI1HpXa2+0FYbunitEMUK9ZBKJur3kV
 rHEhZTtensiBQlcPjnCDoAOy9MokJrvgNpxE42KH39oKeNfT/5KW/FGnIdwZAbsTlWHv
 rXpTP6o/kvZpgdX/wlqYZq+kHtDmCFjTScwrxl62CbIQ6ycMIrlRGlkB76ecNiUiI5uM
 RiRpr6sKrDMB/lAO34YC7eV3IFcWvgbOM1Jw/d+3RpXcK26NUcjb6D0Yci1FjUZZ2Saf
 PosdKiBiOG1iLhSQpLxm3LLaTXq4Y9tPhiN7MAnLHIULT8YKr4TCRUndMw6g04Tp6Ptl UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35yp3y29k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 13:13:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 85AAA10002A;
 Thu, 14 Jan 2021 13:13:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A38F23BD5D;
 Thu, 14 Jan 2021 13:13:13 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan 2021 13:13:13
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Jan 2021 13:13:07 +0100
Message-ID: <20210114121308.31326-4-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210114121308.31326-1-amelie.delaunay@foss.st.com>
References: <20210114121308.31326-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_04:2021-01-14,
 2021-01-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/4] ARM: dts: stm32: remove usbphyc ports
	vdda1v1-vdda1v8 on stm32mp15xx-dkx
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

vdda1v1 and vdda1v8 supplies are required by USB PLL, not by the PHYs.
Remove them from usbphyc child phy nodes now that they are managed in
usbphyc parent node at SoC level.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 89c0e1ddc387..59f18846cf5d 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -694,14 +694,10 @@
 
 &usbphyc_port0 {
 	phy-supply = <&vdd_usb>;
-	vdda1v1-supply = <&reg11>;
-	vdda1v8-supply = <&reg18>;
 };
 
 &usbphyc_port1 {
 	phy-supply = <&vdd_usb>;
-	vdda1v1-supply = <&reg11>;
-	vdda1v8-supply = <&reg18>;
 };
 
 &vrefbuf {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
