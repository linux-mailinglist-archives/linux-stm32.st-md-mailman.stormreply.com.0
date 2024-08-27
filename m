Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EBD960CFE
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 16:06:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1947AC7801A;
	Tue, 27 Aug 2024 14:06:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C4E9C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 14:05:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RDTE5e001108;
 Tue, 27 Aug 2024 16:05:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WzSKuQohSXWkGwWoz9YprP+94aYdvrJkgRz9d9MM6WY=; b=bhoA5mL7o+ZQVI89
 cxhl3x7l+4F01LoQe2QyPIGdIE0DDDvYTRf9tpcGEGc6y1sjF9SqMcuokqnkv82h
 CxJS1BCCZdwbmF/R2PnTiw5FpZEkDqF76eDv4yUOJ8bSAGCVEnm7dD+UWkrPy+p7
 HGN+IpHZPBoivxkDFJvR9G56tt4+gXCSytJQ8cBr8Bg32ejN8vQ/kFz9+zSQywnj
 zEbZoMwpxdFFfvZrgJHkSxCzg6TZhPfKt22BhAATGaswRiASmDMZPhCtI9G11cSW
 f9sKQ2r5sEaSobYC7mNvHMMdzYofrN2t0KKQI1GbOiCQacytW9IvkrK7fKHh+JmU
 p7OQQg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419fqs850y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 16:05:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7EF9640049;
 Tue, 27 Aug 2024 16:05:41 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5F6126C45F;
 Tue, 27 Aug 2024 16:05:13 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 27 Aug
 2024 16:05:14 +0200
Received: from localhost (10.48.86.111) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 27 Aug
 2024 16:05:13 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 27 Aug 2024 16:04:50 +0200
Message-ID: <20240827140455.345086-5-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240827140455.345086-1-valentin.caron@foss.st.com>
References: <20240827140455.345086-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_07,2024-08-27_01,2024-05-17_01
Cc: devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/9] ARM: dts: stm32: rtc,
	add LSCO to WLAN/BT module on stm32mp135f-dk
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

On stm32mp135f-dk board, WLAN/BT module LPO_IN pin is wired to
RTC OUT2_RMP pin.

Provide a pinctrl configuration to enable LSCO on OUT2_RMP.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 1af335a39993b..ef33cbf3e601c 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -346,7 +346,14 @@ ltdc_out_rgb: endpoint {
 };
 
 &rtc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rtc_rsvd_pins_a>;
 	status = "okay";
+
+	rtc_lsco_pins_a: rtc-lsco-0 {
+		pins = "out2_rmp";
+		function = "lsco";
+	};
 };
 
 &scmi_regu {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
