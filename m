Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 732CC2F61A4
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 14:16:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10C87C56630;
	Thu, 14 Jan 2021 13:16:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A143C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 13:15:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10ED3EfT010817; Thu, 14 Jan 2021 14:15:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=0yITV9Unr5TMpD6GGlqjTAmm7hXiyAS/6iZIuILS1XQ=;
 b=JYSq6HcjjNUbgU7HaHf+bQRCCZG8RoW4Nran6cG3dPNJfGHFJ2vk8c+pVpE2KqIVFlWi
 3qtkkI1ohB36eKvUWTX7Bq/LylWhdZZMLuoDjSB2cNRO/z6rYtH3H8Px38Tnh/mv2e1j
 ij2SJqgMhcnhBtfF+iDNzBc5RS9WS20Hw862Ny/24XIZvs9a4w95e6c7FSNMraTmHoCA
 jNbkn669aEBvaUQJYa9qxvYL2v62mKTgH+OZooTwFYZzU+xrJDEMf8gkpfpkdtE5HRvv
 I1DSvCZ9uQO0W8GnCt3fmZ0c5CuKkwWltsNSvbECFMeTL7eCzb1gBH9RqrCP5/dY0+2s 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35yp3y2kkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 14:15:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77E07100038;
 Thu, 14 Jan 2021 14:15:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C5B4246DB4;
 Thu, 14 Jan 2021 14:15:49 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan 2021 14:15:48
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Jan 2021 14:15:22 +0100
Message-ID: <20210114131524.3298-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210114131524.3298-1-amelie.delaunay@foss.st.com>
References: <20210114131524.3298-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_04:2021-01-14,
 2021-01-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/3] ARM: dts: stm32: add usbphyc vdda1v1
	and vdda1v8 supplies on stm32mp151
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

vdda1v1 and vdda1v8 supplies are required by USB PLL. Add them in usbphyc
node.

Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 3c75abacb374..07cb927ba06d 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1486,6 +1486,8 @@
 			reg = <0x5a006000 0x1000>;
 			clocks = <&rcc USBPHY_K>;
 			resets = <&rcc USBPHY_R>;
+			vdda1v1-supply = <&reg11>;
+			vdda1v8-supply = <&reg18>;
 			status = "disabled";
 
 			usbphyc_port0: usb-phy@0 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
