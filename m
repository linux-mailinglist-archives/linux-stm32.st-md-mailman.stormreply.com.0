Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AFA7A257
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 14:03:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 596CBC78F9F;
	Thu,  3 Apr 2025 12:03:25 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09E36C78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 12:03:24 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BhN16024322;
 Thu, 3 Apr 2025 14:02:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 jE/f+A75h9vw3QQPDkFAG+6fnAHISqE/y2SZB6E3XDY=; b=fmgdhuOAs0hMIasm
 GcH0g4okvOMJV5hcHiviCFHBLF3UzNbCCLdgbbVUTU2w6AjsYinYxl7fibTnnehb
 284oUALSG5ImeCFSsY+C7MlnpeMSRglxP9+bfNSibGMUQi81N6VT0473gdBhmmEx
 uXFTWIQoPh2FOsa7VbIKxJCWfhRhsbauuDZRG9RRM3VhofQshNgAIVa5F4phyW4A
 42oMQZkebtiGUMIIi13+V0Bx/FpNCWa2cDu+8zk5PlPDq6Nox3wocQochWVhnF5Q
 lj6Sci8hkFdQf9XHFmal/OHPeoZbpc6xZ4a5fg+5GrZgsIOPEnFfb3uD2PweTOD6
 QJ7vag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c7ea49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Apr 2025 14:02:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 95B4740083;
 Thu,  3 Apr 2025 14:01:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C1A18E316A;
 Thu,  3 Apr 2025 14:00:12 +0200 (CEST)
Received: from localhost (10.48.87.151) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:00:12 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Thu, 3 Apr 2025 13:59:53 +0200
Message-ID: <20250403115954.1061528-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
References: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.151]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: add vrefint calibration
	on stm32mp13
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

Describe vrefint calibration cell to be retrieved through bsec,
on STM32MP13x SoCs family.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 8512a6e46b33..3cc5623d52ca 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1018,6 +1018,9 @@ part_number_otp: part_number_otp@4 {
 				reg = <0x4 0x2>;
 				bits = <0 12>;
 			};
+			vrefint: vrefin-cal@52 {
+				reg = <0x52 0x2>;
+			};
 			ts_cal1: calib@5c {
 				reg = <0x5c 0x2>;
 			};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
