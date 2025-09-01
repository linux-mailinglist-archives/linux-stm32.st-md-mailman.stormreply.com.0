Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F4B3DDDB
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Sep 2025 11:19:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E063EC3F94F;
	Mon,  1 Sep 2025 09:19:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0FADC3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Sep 2025 09:19:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819DFH8011686;
 Mon, 1 Sep 2025 11:19:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 x/3NINU/K2c7qUKU5f+2zWn2uCGFvhWDC/0NFKmcgbI=; b=EaMPdb3lCCkKG2UB
 jSzdf6y2qBntKiC4SSKRveSHleQDcxgb3YN8y4K5M6OYGHtYDGtGLWnhr4QgyamM
 Et5Gmr1LcT+bGml3+g9ygx0pLWC/dVuWU5fR1hUfvG+ieWTqtjFDS7M4SE/CTLLC
 jpAYHTZeVqtX2FjPlF4v9p6RIQxBAy+T0C7MGqx7y08RYxrcRJzcZz2NZfF0URPM
 KyKTDVeLc2hKpW4FlZozHN/fbYazLrTvKciLlUcUE2PMHtwevQGni2xJlozmtO6e
 dSzA++PldFFbcvVdFLnT9NCxtWv0eQJTaxkrx+kKOppUYdy/v8HTeKMiZGHBZN+l
 TASunw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upqk6ju4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Sep 2025 11:19:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1CC4140050;
 Mon,  1 Sep 2025 11:17:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B142976B316;
 Mon,  1 Sep 2025 11:16:38 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 1 Sep
 2025 11:16:38 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 1 Sep 2025 11:16:29 +0200
MIME-Version: 1.0
Message-ID: <20250901-relative_flex_pps-v4-3-b874971dfe85@foss.st.com>
References: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
In-Reply-To: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, John Stultz <jstultz@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 3/3] ARM: dts: stm32: add missing
 PTP reference clocks on stm32mp13x SoCs
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

ETH1/2 miss their PTP reference clock in the SoC device tree. Add them
as the fallback is not correctly handled for PPS generation and it seems
there's no reason to not add them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 ++
 arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index ace9495b9b062e9f96437681cc526fed7f9eac5e..b88953485e597dc89c48ea2e3ffd382d1de5de92 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1602,11 +1602,13 @@ ethernet1: ethernet@5800a000 {
 					      "mac-clk-tx",
 					      "mac-clk-rx",
 					      "ethstp",
+					      "ptp_ref",
 					      "eth-ck";
 				clocks = <&rcc ETH1MAC>,
 					 <&rcc ETH1TX>,
 					 <&rcc ETH1RX>,
 					 <&rcc ETH1STP>,
+					 <&rcc ETH1PTP_K>,
 					 <&rcc ETH1CK_K>;
 				st,syscon = <&syscfg 0x4 0xff0000>;
 				snps,mixed-burst;
diff --git a/arch/arm/boot/dts/st/stm32mp133.dtsi b/arch/arm/boot/dts/st/stm32mp133.dtsi
index 49583137b5972572d1feaa699c0c3a822a1b6f6d..053fc669120513c7d2812a0aabe8186fe1f4fe58 100644
--- a/arch/arm/boot/dts/st/stm32mp133.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp133.dtsi
@@ -81,11 +81,13 @@ ethernet2: ethernet@5800e000 {
 			      "mac-clk-tx",
 			      "mac-clk-rx",
 			      "ethstp",
+			      "ptp_ref",
 			      "eth-ck";
 		clocks = <&rcc ETH2MAC>,
 			 <&rcc ETH2TX>,
 			 <&rcc ETH2RX>,
 			 <&rcc ETH2STP>,
+			 <&rcc ETH2PTP_K>,
 			 <&rcc ETH2CK_K>;
 		st,syscon = <&syscfg 0x4 0xff000000>;
 		snps,mixed-burst;

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
