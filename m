Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C872F61A8
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 14:16:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C329C57193;
	Thu, 14 Jan 2021 13:16:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C006C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 13:16:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10ED67jR016311; Thu, 14 Jan 2021 14:15:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=c+Aah01poqisBSnVrKowoWFXX7asidtG2KzrPV6ZGbc=;
 b=TuLen2fodnQAieMYqFaAQCxp4gI1iLy1lF3bVHy/XCMjn2T6MKL1+OnkCbKyuIH8qcke
 Pj8dAd9eNyhvpqA0VZiFda2BBk94dEsl1ZGLvBI9vNXb4rG8LEi3lJNXeTfAseTWNtrt
 FVaTDE5jiVVe8lpidxbCU2//T1JkZgn0fWFZ96xPa+p8HJB8/g0w6wAfROs0x9jjfkY3
 Bwkic4Or4DXTTxKlylO+RJN0RTyNJP6jmYE+sJYrXivVPAmP4tsAcZ47OBKiF/z7qqnw
 hBX0aphFMKMPIRA+iS/2UBZfJLS488NRWUhZjsNtEJxFvdq+zuJPF1lSiOntbzQTqvUl Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 362379dm2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 14:15:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D63010002A;
 Thu, 14 Jan 2021 14:15:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 202E3246DB4;
 Thu, 14 Jan 2021 14:15:51 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan 2021 14:15:50
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Jan 2021 14:15:24 +0100
Message-ID: <20210114131524.3298-4-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210114131524.3298-1-amelie.delaunay@foss.st.com>
References: <20210114131524.3298-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_04:2021-01-14,
 2021-01-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 3/3] ARM: dts: stm32: add #clock-cells
	property to usbphyc node on stm32mp151
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

usbphyc is a 48Mhz clock provider: the clock can be used as clock source
for USB OTG. Add #clock-cells property to usbphyc node to reflect this
capability.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 07cb927ba06d..51acb2b04720 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1482,6 +1482,7 @@
 		usbphyc: usbphyc@5a006000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
+			#clock-cells = <0>;
 			compatible = "st,stm32mp1-usbphyc";
 			reg = <0x5a006000 0x1000>;
 			clocks = <&rcc USBPHY_K>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
