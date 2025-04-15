Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2DA89BE2
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 13:19:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0E10C78023;
	Tue, 15 Apr 2025 11:19:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4AA7C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 11:19:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7RY1A002730;
 Tue, 15 Apr 2025 13:18:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=hVtqs8Vv0HUnb0Ez+Qkit5
 ofDEeHme3L4CqxhioE4KQ=; b=qWLvaPMASIBb6v52ZYZUcHFERdRS5LH/je/muW
 XUFNmbk9ZnPCw89gAYB/wwPEr3j2lWBGzO2xuEfK2ssQI39syGPDJtkzjk2jO7B9
 kmgc2S1+6l/dCI74xoApm5TOBXhSbsCnr75MUyDr433ygwPrvjTwzhJ9ezn1Cx/8
 eaD1iEZRsQMHXm5kCAR3xNMAb/F6EBpXlmSbG3vE3muq4mgiD8/ajRuhkW/9DFms
 wngLUDLSyYaWgzGKgF8CvMltgBPqy5Onf8B/Ing49w1me/YyvIhxoRgJrnAJ1lZb
 ZWvtLuRVgDXf675AhQJ/KSJ3dkq/Sjodh2JXfLi1OZNmAtUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45yfh1vvwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Apr 2025 13:18:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0715040049;
 Tue, 15 Apr 2025 13:17:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A08D96F1F27;
 Tue, 15 Apr 2025 13:17:07 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:17:07 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Tue, 15 Apr 2025 13:16:48 +0200
Message-ID: <20250415111654.2103767-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, maz@kernel.org, linux-kernel@vger.kernel.org,
 Christian Bruel <christian.bruel@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/6] Fix interrupt controller node for
	STM32MP2 SoCs
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

Fix GIC compatible and register access for STM32MP2
This serie replaces the original stm32mp25 patch:
 "arm64: dts: st: Adjust interrupt-controller for aarch64"

Changes in v2:
   - Apply fixes to stm32mp21 and stm32mp23 SoCs family

Christian Bruel (6):
  arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp25 SoCs
  arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp21 SoCs
  arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp23 SoCs

 arch/arm64/boot/dts/st/stm32mp211.dtsi | 8 ++++----
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 9 ++++-----
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 9 ++++-----
 3 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
