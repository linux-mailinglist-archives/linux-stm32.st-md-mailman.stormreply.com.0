Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD328D3743
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 15:14:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42BD2C62EFE;
	Wed, 29 May 2024 13:14:29 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57D63C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 13:14:23 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TBGXDt027029;
 Wed, 29 May 2024 15:14:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=PIIcNcmlMr49S8y8EsAlKj
 uoQdNzfUVhtTNhE4eVCM4=; b=J6iWH5xC+fFF6IhEQpp3Zv+RR1UT4Uqdv57pXh
 wzFQT+F6yQAre5fmOQtnwBID71E4z7lkxeKnv78RQ5sxgwRDCXZKdtQufQYeRtNd
 99iRt6rvXgkRUwAT87V3ok7rF8P1NqsZGSpcG2Si8MHeX1bbXHDZ56BbC8ZVzmUY
 uv0BwrY5Z3nRFToBE6o8O4kpk2ehZiTTPNtFj9hEsGs+6BdrU8yWx9SCClk0nBGo
 q2sGZxjWmxUY6A6Prf6nIvhId7R02QqiSp5rqHTNtrNlFYNZ55vAoZcJyvY0F6B2
 oZ53gwqTBtxiIqf+73RbtbjzLcVZjBap0UgL9t7pu1sJUVxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ybtxhewrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 15:14:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 952BA4002D;
 Wed, 29 May 2024 15:14:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8354B216606;
 Wed, 29 May 2024 15:13:12 +0200 (CEST)
Received: from localhost (10.48.87.209) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 29 May
 2024 15:13:12 +0200
From: <gabriel.fernandez@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Dan Carpenter <dan.carpenter@linaro.or6g>
Date: Wed, 29 May 2024 15:13:07 +0200
Message-ID: <20240529131310.260954-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.209]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_10,2024-05-28_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [RESEND PATCH v2 0/3] Use STM32 access controller for
	STM32MP25 clocks
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Use an STM32 access controller to filter the registration of clocks.
Don't register a clock if this clock is secured or declared as shared (this
clock is generally managed by the security world).

This series depends on the stm32_firewall framework (merged since
next-20240419) notably for the include file 'linux/bus/stm32_firewall_device.h'.

Changes in v2:
  - rebased on next-20240514
  - YAML patch was apllied on next
  - use appropriate include
  - manage the case if 'access-contoller' property is not present in the DT
  - rename DT patch (RCC support part was merged)

Gabriel Fernandez (3):
  clk: stm32mp2: use of STM32 access controller
  clk: stm32mp25: add security clocks
  arm64: dts: st: enable STM32 access controller for RCC

 arch/arm64/boot/dts/st/stm32mp251.dtsi |   1 +
 drivers/clk/stm32/clk-stm32-core.c     |   2 +-
 drivers/clk/stm32/clk-stm32-core.h     |   2 +-
 drivers/clk/stm32/clk-stm32mp13.c      |   2 +-
 drivers/clk/stm32/clk-stm32mp25.c      | 516 +++++++++++++++----------
 5 files changed, 325 insertions(+), 198 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
