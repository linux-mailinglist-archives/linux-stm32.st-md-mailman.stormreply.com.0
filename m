Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE785A225
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 12:39:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43155C69063;
	Mon, 19 Feb 2024 11:39:36 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7069C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 11:39:35 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41J70b8s022274; Mon, 19 Feb 2024 12:39:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=A2iKM+c
 tRFPHqEUaV0TEOpjjyA+onvGcSY21gTvpe0o=; b=xi9exg7zgmS+kl9oPoXo1uz
 GLLo/6xv9gxvNLvKRi50SEs0uKiUw1xE/HOAdUYXOOyclI/v8Dy6VkXBEFsp15rd
 kPoqfqkVQPvDSxDgYjeYznRM+kYRZjYWMijh/MN+idvkCherP6a4T9IxX9mkmVdx
 UuNYTTkAg4NrY3Ni2yVExkySBL5kGFFYDDdXTSJse7V7NyzFw933oXmZ2ta2/N+O
 oEKDCh3gE/sCY99EGG+a9Fv8mohHYiTvNaJFr0cAHwmav6MTllBMpTbh1ysqGrZD
 MS07/tjJru9EIf5WnfRkAszFOdUQJp8DbeGsg2914wl6iPTEA+Jc/XzsMIqR9Zg=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wb8mnm4du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Feb 2024 12:39:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 71C5F4002D;
 Mon, 19 Feb 2024 12:39:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BCFB25AEE7;
 Mon, 19 Feb 2024 12:38:29 +0100 (CET)
Received: from localhost (10.201.22.242) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 19 Feb
 2024 12:38:28 +0100
From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Mon, 19 Feb 2024 12:37:42 +0100
Message-ID: <20240219113745.92538-1-thomas.bourgoin@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.242]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_08,2024-02-16_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/3] Enable the CRC and CRYP IP on
	STM32MP135F-DK board.
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

Enable the CRC and CRYP internal peripherals on STM32MP135F-DK board.

The first 2 patches adds the node crc1 in file stm32mp131.dtsi and
enables it for the board stm32mp135f-dk.
The last patch of the patchset enables the node cryp for the board
stm32mp135f-dk.

Lionel Debieve (2):
  ARM: dts: stm32: add CRC on stm32mp131
  ARM: dts: stm32: enable CRC on stm32mp135f-dk

Thomas Bourgoin (1):
  ARM: dts: stm32: enable crypto accelerator on stm32mp135f-dk

 arch/arm/boot/dts/st/stm32mp131.dtsi    | 7 +++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 8 ++++++++
 2 files changed, 15 insertions(+)

--
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
