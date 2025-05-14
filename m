Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEECAB6E63
	for <lists+linux-stm32@lfdr.de>; Wed, 14 May 2025 16:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 842ABC7A844;
	Wed, 14 May 2025 14:48:42 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58CDAC7A842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 14:48:41 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EESnpw010572;
 Wed, 14 May 2025 16:48:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 99SNtvnMFqK7qNsbPspBqDAiBIpPQhzr7yAu4VDBnp8=; b=2pd54ElrRpWUSQGZ
 tcTe4LggCDgWs6jOzcMN0Joj+Aai7iIAKlHfIQkiCnHC9z1TDpKSixbEiMkWORfz
 nwwyFyp6pJAR9rYc9uIg1iRfTLCW6OZ52g1l34O/E/9VWfS/ZiCBEAUDHXLfUP9e
 nXG8rAk0MP6+iOSaMQalb+5wvrPCvBhA2X8f+bhXwO93JZSD/M67hALk8Fpy4F5D
 LjioRgH2H59EtxXgjsi/BwLkwdHbS5hi0HhBakbNEhFKHxOL1C1ymh5QGuXqW+g3
 wwW9CQX1aHWnQYJTlq9Q5qiCpAApL4Djk9tNutG+GsoS02G/b2r3x3oN9MkRkWY8
 RaJGbg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdw4bak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 May 2025 16:48:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 35A1C4005A;
 Wed, 14 May 2025 16:46:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2228FB10BA9;
 Wed, 14 May 2025 16:45:38 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 16:45:37 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
 <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
 <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <p.zabel@pengutronix.de>, <thippeswamy.havalige@amd.com>,
 <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
 <cassel@kernel.org>, <johan+linaro@kernel.org>
Date: Wed, 14 May 2025 16:44:28 +0200
Message-ID: <20250514144428.3340709-10-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514144428.3340709-1-christian.bruel@foss.st.com>
References: <20250514144428.3340709-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v10 9/9] arm64: dts: st: Enable PCIe on the
	stm32mp257f-ev1 board
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

Add PCIe RC and EP support on stm32mp257f-ev1 board.
Default to RC mode.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 9d1a1155e36c..85f99a1ca154 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -257,6 +257,27 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&pcie_ep {
+	pinctrl-names = "default", "init";
+	pinctrl-0 = <&pcie_pins_a>;
+	pinctrl-1 = <&pcie_init_pins_a>;
+	reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
+	status = "disabled";
+};
+
+&pcie_rc {
+	pinctrl-names = "default", "init", "sleep";
+	pinctrl-0 = <&pcie_pins_a>;
+	pinctrl-1 = <&pcie_init_pins_a>;
+	pinctrl-2 = <&pcie_sleep_pins_a>;
+	status = "okay";
+
+	pcie@0,0 {
+		 reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
+		 wake-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	};
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
