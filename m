Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF6F151B38
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 14:26:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19D9FC36B0F;
	Tue,  4 Feb 2020 13:26:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C03FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 13:26:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 014DN70m018475; Tue, 4 Feb 2020 14:26:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=svNIL8S5ikLq6fC5dYVL1FJyfGZacEgFr1/P7H/Zw64=;
 b=wESYPm8NZ7MqQhZxSsf1kewzyR9WtukfZ9+7H77bjnhQUGqHmBIW735MRm6eLYOvU9g2
 1joyWI2Z0sxhLzw0ZsmG/jcw/tDRSW2Ca3xn20jVFLAmyOzsQcocIh7vvGwAb+8lAyF1
 GG5ygIRZoaWOvBG52snMnyzOYV6EIXgIRWPAjRnIP7E6+poWekKDMh/R3/8Ilj3ZwWPO
 4XJkRh3Y/XJYHbHrHLe080cLWjvTImZhCw7FRoy4LSRbckMbvAXAtRLG8j700FJez2sR
 7tmslg+wDuka/NI83N/OhvDYVbiGnuD8aSy/sNZXHNG+RolSIAxpNVWtA+zvAp2RpNE3 Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xvyp61uyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 14:26:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D14F2100039;
 Tue,  4 Feb 2020 14:26:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6A832BC7BA;
 Tue,  4 Feb 2020 14:26:14 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 4 Feb 2020 14:26:14
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Tue, 4 Feb 2020 14:26:05 +0100
Message-ID: <20200204132606.20222-3-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204132606.20222-1-amelie.delaunay@st.com>
References: <20200204132606.20222-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_04:2020-02-04,
 2020-02-04 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: add USB OTG pinctrl to
	stm32mp15
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

Add pinctrl definition for USB High-Speed OTG ID pin and USB Full-Speed OTG
DP and DM lines that can be used on stm32mp15.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 0237d4ddaa92..345dc18d2224 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1040,6 +1040,19 @@
 			bias-disable;
 		};
 	};
+
+	usbotg_hs_pins_a: usbotg-hs-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
+		};
+	};
+
+	usbotg_fs_dp_dm_pins_a: usbotg-fs-dp-dm-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 11, ANALOG)>, /* OTG_FS_DM */
+				 <STM32_PINMUX('A', 12, ANALOG)>; /* OTG_FS_DP */
+		};
+	};
 };
 
 &pinctrl_z {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
