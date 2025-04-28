Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF7AA9EB02
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 10:43:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B11E0C78F67;
	Mon, 28 Apr 2025 08:43:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D7E9C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 08:43:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S11AlL010275;
 Mon, 28 Apr 2025 10:42:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=ToFVU9D0kJNOUVuQ9UJi9B
 xt0XxkB1xPx18ssjBYmrE=; b=qMY1A8KCvC06tdGpOMDtLnwr5pI1X1/Q1B1q+w
 0bPw5LMf9CbVxtCBOrtFXJWu9nVRVYndDfGgqh8BtU2r4nSS+gttrGRIrYGVQpuV
 p6gxg3mexbGS0iWdV1RPCmurva3KUy8mR5ydMsmvp6EXxDdM+RJLXnBPKXzc586T
 iEGJ7QBFO4XEe+sUfZOOyWsbzircPMmjcoslXREiurtXdJDEzW1OEqTJtkjb9Unn
 Q2DBujChnsAWADXd9Ip3DmLjBobcpwj4PNG8LnEoBxFhBdOIG6C1tqlUWNJYZfFQ
 vJMghCgvlEtOzX0E1ISRyq1/9zlgxRbriEk+my6rEF3KFKbw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg5njj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 10:42:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1F79640055;
 Mon, 28 Apr 2025 10:41:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9456A3D589;
 Mon, 28 Apr 2025 10:40:44 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:40:44 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 28 Apr 2025 10:40:20 +0200
Message-ID: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPQ+D2gC/x2MMQqAMAwAvyKZLcSiSP2KiNQaNUNraVQE8e8Wh
 xtuuHtAKDEJdMUDiS4W3kMWUxbgNhtWUjxnB426wbpCdUY5Elk/7j4jkcf5EIX1ZFrnUFOjIbc
 x0cL3/+2H9/0AznUuTWcAAAA=
X-Change-ID: 20250410-upstream_omm_ospi_dts-04b97cc02e52
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v9 0/3] arm64: dts: st: Add SPI NOR support
 for stm32mp257f-ev1
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

Add SPI NOR support for stm32mp257f-ev1 board by adding:
  _ Octo memory Manager node in stm32mp251.dtsi
  _ OSPI port1 pinctrl entries in stm32mp25-pinctrl.dtsi
  _ Add SPI NOR support for stm32mp257f-ev1.dts

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Changes in v9:
  - split patchset by susbsystem, current one include only DTS related
    patches.
  - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com

---
Patrice Chotard (3):
      arm64: dts: st: Add OMM node on stm32mp251
      arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
      arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 54 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 32 ++++++++++++++++
 3 files changed, 137 insertions(+)
---
base-commit: 65954899a157832f68536b488194cf698248a26e
change-id: 20250410-upstream_omm_ospi_dts-04b97cc02e52

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
