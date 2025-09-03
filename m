Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72AB41AAE
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 11:54:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4254EC3F95F;
	Wed,  3 Sep 2025 09:54:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6C4DC3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 09:54:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839hvmm022675;
 Wed, 3 Sep 2025 11:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=VtDIXnB6jguTha2nuJ2+4g
 YyBFOqAKGNF3LBQOKc0iI=; b=0aB6pQrODfKgQg6egCwF3PoX/a/6K4garsVZB+
 k7P/j+/z4fdmr4SfAEXy5hV0/exkc6+WdQh/LutqxPlsQD5KWbMihgoY7ycxbMuV
 goVfv2JAtnzw9lYMODuRH+PXn8ceSROTkgVqyVj+jKsrg1YXsTvfMJRGCNE5qKeZ
 dFClyT1QRgJ68AZyTysttTlJE+WpXGoC8k5PniDRkfxYn/8eeEQNBKDYkPXyOx4W
 Yt9B3Uw8fcjOpZdq0PgBHoQFS2Nzh8VVTRlPr8sw54WT04UmO2oWkKjczLbeN0iV
 6xplLEswwJnpAxI7uIeEd6d/9ARG7/3dZKK9AO+KqYHiOYRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7g1n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 11:54:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1ECFB40048;
 Wed,  3 Sep 2025 11:53:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 417292BBC04;
 Wed,  3 Sep 2025 11:53:12 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 11:53:12 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 3 Sep 2025 11:53:01 +0200
Message-ID: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP0PuGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwMj3dwCo/jUkozUorzUEl1L85SUlFQDizRLA2MloJaCotS0zAqwcdG
 xtbUA8Lec4F4AAAA=
X-Change-ID: 20250902-mp2_ethernet-97ddde08f903
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/4] arm64: dts: st: add ethernet1 controller
 support on stm32mp23/25 boards
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

All of the current stm32mp2x boards embed an ethernet1 SNPS GMAC5.x
controller.

Add the support for it on stm32mp235f-dk, stm32mp257f-dk and
stm32mp257f-ev1 boards and default enable it.

On the stm32mp257f-ev1 board, we choose to keep the ethernet1
controller as a standalone ethernet controller instead of using
the TSN capable switch.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Gatien Chevallier (4):
      arm64: dts: st: add eth1 pins for stm32mp2x platforms
      arm64: dts: st: enable ethernet1 controller on stm32mp257f-dk
      arm64: dts: st: enable ethernet1 controller on stm32mp257f-ev1
      arm64: dts: st: enable ethernet1 controller on stm32mp235f-dk

 arch/arm64/boot/dts/st/stm32mp235f-dk.dts     |  24 +++++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 126 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     |  24 +++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  25 +++++
 4 files changed, 199 insertions(+)
---
base-commit: 4952fb7f53d4c9f007147ffb250c04ed40c959f7
change-id: 20250902-mp2_ethernet-97ddde08f903

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
