Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9451248C87B
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jan 2022 17:34:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09636C60463;
	Wed, 12 Jan 2022 16:34:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A810C60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 16:34:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20CBKUEj019149;
 Wed, 12 Jan 2022 17:34:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=DqtAlVRDu0BZInLnFAxQBxKeCywomHPZOqjBJ4wBQps=;
 b=bckOkcdafCLRvlXsUEZSFeYEAfThADJaTHhx00cNybPDIuel0BhCU/oAInNR8Bpv459C
 11VIzE+wO7ckSNE5Mz24angGtFJEQKMNNuGjv1XSakh1ykuisJdygWyibOKSvsBHnE06
 8DWdnyNAtGgxaPURaTdmN7RBm2Jm+KF2Fm/8BM7HKtF79hnQfx/zwXZJoMmHnhafw8l3
 QDBIdawEpzCnZ9zJp3A1A0HxAI1EgmrEFwZolcVpT7bBZABrq7++d4hFd9yXl5hjc+8D
 Pw5SvsxVj2NQelu2OZk3FNOk48iQPv7lOgs3TQCfbNljxHqjkPiEd8lfzRKudB6dCGyJ tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhtg9u8bu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 17:34:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF86D10002A;
 Wed, 12 Jan 2022 17:34:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7E9524B8BA;
 Wed, 12 Jan 2022 17:34:22 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 17:34:22
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 12 Jan 2022 17:33:55 +0100
Message-ID: <20220112163356.25634-10-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112163356.25634-9-yann.gautier@foss.st.com>
References: <20220112163356.25634-9-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 09/10] ARM: dts: stm32: add SDMMC2 in
	STM32MP13 DT
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

STM32MP13 embeds 2 instances of SDMMC peripheral.
Add the required information in SoC device tree file.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp131.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index 7189cba6b256..a1efb545ca3d 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -135,6 +135,20 @@
 			status = "disabled";
 		};
 
+		sdmmc2: mmc@58007000 {
+			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x20253180>;
+			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&clk_pll4_p>;
+			clock-names = "apb_pclk";
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <130000000>;
+			status = "disabled";
+		};
+
 		iwdg2: watchdog@5a002000 {
 			compatible = "st,stm32mp1-iwdg";
 			reg = <0x5a002000 0x400>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
