Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE06CB22931
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 15:51:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95F4FC3F940;
	Tue, 12 Aug 2025 13:51:23 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24794C3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 13:51:22 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCM5mY016353;
 Tue, 12 Aug 2025 15:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ACBF/XewF9ltNTPIvrsgsmJlHAjTuMQ64yXm9zsSnVo=; b=ofvFiU8T9zR0gGeK
 gZZI1WUFkDmCK8+9N/xNXLZDpREqfGtp2+0Odc6YIA06BpTYdBAIqWXfjx7L07kY
 F1YbwZ29ktQaJthCdu+q6jxFF5vBpUQpldWG+qtB+8fbOSPMupH/Z1InIUYIb592
 mquBOGQe49brJvI7dR8V4HfWtsce4FPJUIpY7/J0evOV7IrPdqkokEPQrvELKhtD
 FMBlHYbRP+QMy5NdOx0pzLeeSZRZIKD7yBb2F0YUX0bWd37HYhoNQ5qEPHY+Dygg
 h3h0f7j37Xy+bztM580DjaMZEFpx6XVmjtb6Xlab168oFnK+7U91q1vrQddOcCoA
 mSWx4g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48eh9n8c2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Aug 2025 15:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E6CE7400AE;
 Tue, 12 Aug 2025 15:49:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2486678C45C;
 Tue, 12 Aug 2025 15:49:08 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 15:49:07 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 12 Aug 2025 15:49:10 +0200
MIME-Version: 1.0
Message-ID: <20250812-drm-misc-next-v2-13-132fd84463d7@foss.st.com>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
In-Reply-To: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 13/13] arm64: dts: st: add loopback clocks
	on LTDC node
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

ck_ker_ltdc has the CLK_SET_RATE_PARENT flag.  While having this flag is
semantically correct, it for now leads to an improper setting of the
clock rate.  The ck_ker_ltdc parent clock is the flexgen 27, which does
not support changing rates yet.  To overcome this issue, a fixed clock
can be used for the kernel clock.

Add the clocks needed for the LTDC to work.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 6 ++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index d833b2b7904bef1cf1db8f1da210a1abd8a87d09..55f63cb7b881a91498042a71fcd39ac5191ad47d 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -52,6 +52,12 @@ clk_rcbsec: clk-rcbsec {
 			compatible = "fixed-clock";
 			clock-frequency = <64000000>;
 		};
+
+		clk_flexgen_27_fixed: clk-54000000 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <54000000>;
+		};
 	};
 
 	firmware {
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index a3b5ae25d28c83ade12c2ff69b82c9cccfd29b00..07c200470b2cedde771ae987f2267d6097ea78f0 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -5,6 +5,11 @@
  */
 #include "stm32mp253.dtsi"
 
+&ltdc {
+	clocks = <&clk_flexgen_27_fixed>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
+	clock-names = "lcd", "bus", "ref", "lvds";
+};
+
 &rifsc {
 	lvds: lvds@48060000 {
 		compatible = "st,stm32mp255-lvds", "st,stm32mp25-lvds";

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
