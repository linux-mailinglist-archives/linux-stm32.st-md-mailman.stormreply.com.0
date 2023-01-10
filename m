Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A78A663C91
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jan 2023 10:17:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F989C65E59;
	Tue, 10 Jan 2023 09:17:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79220C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 09:17:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30A74sUW030151; Tue, 10 Jan 2023 10:17:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=RBTTPdr7XMYkFxdupnjJacZTskuCtQaU/XM4tkVrI6s=;
 b=7quJX8teoZ7LxxA/Kw4+EMBVSpeb+bbyFyLsnaShehqbp4qksEM1MTzH9LJ/i+lDSJpT
 3rqs4MGG/FsutRo8v4FF9/E0AxdjDkyau2uS8BI9RJ8/5p5F9NaciXHfCGf2Qooj1bOp
 wUm1moCQN4tT4lxa1ErAbLyus69akPMUWBMsIa9K+FYd/g/FDhtEaav3MR1MlgMyrebZ
 h3oUFRQ+ciJEkc1qR7XQcB23HZARE0ODCq+bPVxLW8F1QMQlGBcGr5N8mJbk2aKIKb/c
 hs5OcKFltoyetz8Q5g1pkl0T3iYRFSE1CTbaQEPXjq3fllggBAc8zgo+cWciOWecvx88 WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mxy1qqhvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 10:17:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D85910002A;
 Tue, 10 Jan 2023 10:17:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85F9F20A8CB;
 Tue, 10 Jan 2023 10:17:21 +0100 (CET)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 10 Jan
 2023 10:17:21 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 10 Jan 2023 10:17:09 +0100
Message-ID: <20230110091713.444395-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/3] ARM: dts: stm32: add timers support on
	stm32mp13
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

Add STM32 TIM and LPTIM support to STM32MP13 SoCs family.
Add also support of timers available on DK board RPI expansion connector.
These timers are configured in the DK board device tree, but let in
disabled state by default.

Changes in v2:
- rebase serie

Olivier Moysan (3):
  ARM: dts: stm32: add timers support on stm32mp131
  ARM: dts: stm32: add timer pins muxing for stm32mp135f-dk
  ARM: dts: stm32: add timers support on stm32mp135f-dk

 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi |  60 +++
 arch/arm/boot/dts/stm32mp131.dtsi        | 557 +++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp135f-dk.dts     |  58 +++
 3 files changed, 675 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
