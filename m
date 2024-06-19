Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6DF90E5D2
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 10:37:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F246C78013;
	Wed, 19 Jun 2024 08:37:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FC95C78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 08:37:20 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J7Ruge002275;
 Wed, 19 Jun 2024 10:37:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=XOCbwETXxIA+0drv6fkuip
 MY97pF222Z5qC+mHznX5k=; b=FDU2sbFS45KDSNH8SvVgN+ls58xYX5umz53A6A
 f7RC9K65Wciv2NUsMZJDOkd5iPmLLOXFGJofGfBUQeulQoXNpiHHa7Bobh+sFdOG
 jpLmgcZ3OQ5x1s2t4DAyCrYz9SIcWodmqp0NCnEygrgfADE9qekV0OthuAuYqSSK
 bKHCmqM0X/zYuGCILK4pPoM6u6Qztg6Ru+tr+rAEcjo429/x4ytTvExvcp0b7mwu
 lnuE0Eeh0yFJhbav8/7lzIbxp1xM693BUZw/vs0sTYsU4ReQ6NDsv5lo7I+ddjEN
 JmvZSvHR8mKfJDqxtcCT5mjxw/UCh3vZQMNKtHbO99GuVvmA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yuj9n23rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 10:37:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D426B4002D;
 Wed, 19 Jun 2024 10:37:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C80620E1D0;
 Wed, 19 Jun 2024 10:36:10 +0200 (CEST)
Received: from localhost (10.48.86.232) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 19 Jun
 2024 10:36:09 +0200
From: Pascal Paillet <p.paillet@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Date: Wed, 19 Jun 2024 10:35:58 +0200
Message-ID: <20240619083602.33007-1-p.paillet@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.232]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
Cc: p.paillet@foss.st.com
Subject: [Linux-stm32] [PATCH 0/4] Add SCMI regulators desciption on
	STM32MP25
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

Add the description for SCMI regulators provided by OP-TEE firmware.
The binding file named st,stm32mp25-regulator.h will be also used in
the OP-TEE firmware.

Pascal Paillet (4):
  dt-bindings: add STM32MP25 regulator bindings
  arm64: dts: st: add scmi regulators on stm32mp25
  arm64: dts: st: describe power supplies for stm32mp257f-ev1 board
  arm64: stm32: enable scmi regulator for stm32

 arch/arm64/Kconfig.platforms                  |  1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 35 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 43 +++++++++++++----
 .../regulator/st,stm32mp25-regulator.h        | 48 +++++++++++++++++++
 4 files changed, 118 insertions(+), 9 deletions(-)
 create mode 100644 include/dt-bindings/regulator/st,stm32mp25-regulator.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
