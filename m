Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEE285A226
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 12:39:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50F97C6B45E;
	Mon, 19 Feb 2024 11:39:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82521C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 11:39:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41J86YTn031767; Mon, 19 Feb 2024 12:39:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=wWuk9zKWKWnIIZEgyrM9Had0Pm81rB13rP0pqzFN9Fo=; b=PO
 KXkAnAQ3cWZ+IZUGxA7Pu7B+AwaTLIfW5W8AiuIq7+8F40YVnj6emIjqlaKDySRb
 6fClcSxJZAQ/qN/CjONYN85cMK+2KxO1QRvcNDi+Tq8Hsx+fpczxK4740JKa4GVE
 zLoNuV0galEbNfsnXPZiXN1dGKm+klTRl3r+l+Vkhp57DjTY8w3/DLPdgTYm61xT
 GgFUOHkAsQ4398iv/il6Xksz93SQj6m48r/6lpqQqDIWy4MzqIWNZJcsZLRb5F/e
 WdjgBcuStJpPSP7W6CZASgHeuifMObA1NM4i98/l0lrxe8JjXwmg9H88ec3hKTqR
 f6AenWNpwp8Fs5Aw5mZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wamjh6491-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Feb 2024 12:39:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 14A7040045;
 Mon, 19 Feb 2024 12:39:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61E8525AEE8;
 Mon, 19 Feb 2024 12:38:57 +0100 (CET)
Received: from localhost (10.201.22.242) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 19 Feb
 2024 12:38:57 +0100
From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Mon, 19 Feb 2024 12:37:43 +0100
Message-ID: <20240219113745.92538-2-thomas.bourgoin@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219113745.92538-1-thomas.bourgoin@foss.st.com>
References: <20240219113745.92538-1-thomas.bourgoin@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.242]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_08,2024-02-19_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] ARM: dts: stm32: add CRC on stm32mp131
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

From: Lionel Debieve <lionel.debieve@foss.st.com>

The Cyclic redundancy check calculation unit (CRC) peripheral
offers a CRC-based operation (CRC32/CRC32C) used to verify data
transmission or storage integrity.
This peripheral is integrated in stm32mp131 and can be default
enabled.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b04d24c939c3..3900f32da797 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1315,6 +1315,13 @@ sdmmc2: mmc@58007000 {
 			status = "disabled";
 		};
 
+		crc1: crc@58009000 {
+			compatible = "st,stm32f7-crc";
+			reg = <0x58009000 0x400>;
+			clocks = <&rcc CRC1>;
+			status = "disabled";
+		};
+
 		usbh_ohci: usb@5800c000 {
 			compatible = "generic-ohci";
 			reg = <0x5800c000 0x1000>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
