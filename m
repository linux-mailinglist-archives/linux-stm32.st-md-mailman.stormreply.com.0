Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C491D5B3D8F
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Sep 2022 19:01:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84EB7C64114;
	Fri,  9 Sep 2022 17:01:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A71EC64112
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 17:01:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289FX4mB031613;
 Fri, 9 Sep 2022 19:00:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=I8iLxoJxgLWgVMiLGsUDh1d+t3CJSTgq9exY9ZcW1Ko=;
 b=g0G2pUsFISSeME7AjZvEKIytT07JaZZZD4qxwj5FZWBX710l9EiYgWD413XkVkwIVsHI
 QGYp085xohxUC4WNDW0HVM1BmDzy0vOl0K6bt1hWsJqscEtxQzrMucS2HFkGRBXLCaak
 gf0T1Jsz8qxjqfP4Oe4b9PNhYe8aRM55PNk87UJclaGhhpEi4lgR02UuGqoXoqNI39EQ
 rVGpV9dexlitfSKemb6shov6KRxUinrBpXJGxOoQgYL2ic7GFc5QkwJ6eDFYkPU+dX5f
 w1SgWdLWpHKODjoy5oCojpwE0e47oUjYgCBcL+Gpj1K7POIYWtfN4xdgpyHPXVVoAtE3 Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergbjcu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 19:00:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE6A9100034;
 Fri,  9 Sep 2022 19:00:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B900B24551C;
 Fri,  9 Sep 2022 19:00:52 +0200 (CEST)
Received: from localhost (10.75.127.120) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Fri, 9 Sep 2022
 19:00:52 +0200
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 9 Sep 2022 18:59:58 +0200
Message-ID: <20220909165959.5899-5-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909165959.5899-1-hugues.fruchet@foss.st.com>
References: <20220909165959.5899-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: add dcmipp support to
	stm32mp135
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

Add dcmipp support to STM32MP135.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 arch/arm/boot/dts/stm32mp135.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp135.dtsi b/arch/arm/boot/dts/stm32mp135.dtsi
index abf2acd37b4e..fcf0592c01fd 100644
--- a/arch/arm/boot/dts/stm32mp135.dtsi
+++ b/arch/arm/boot/dts/stm32mp135.dtsi
@@ -8,5 +8,14 @@
 
 / {
 	soc {
+		dcmipp: dcmipp@5a000000 {
+			compatible = "st,stm32mp13-dcmipp";
+			reg = <0x5a000000 0x400>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc DCMIPP_R>;
+			clocks = <&rcc DCMIPP_K>;
+			clock-names = "kclk";
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
