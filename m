Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DE28B3A93
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 17:06:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDCDFC7128C;
	Fri, 26 Apr 2024 15:06:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 812AFC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 15:06:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43QDJ35s019021;
 Fri, 26 Apr 2024 17:06:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=E0FfjvT
 J8EE6qRQgLPxGMJaY0peaJk9VEhJQyyJY68Q=; b=xr8vjMSkI1DmVxH77Q7w0MY
 W8weouV37KhjwgCNXfmHg98/70P50O9PlLeVbWdJe5+j4y1zb3yKDfkXC7/IDG7U
 szkqb+ArzbTzCrDjA9GqSUV7EqOgC1+Uxxwwtnmb4fcU9XgaVMVGUmqof1N1zGsU
 Yy7f+PKF9lxDLZhKJIKBPRwWTwdc97r0taMeTyAR1tBlCQEjOiIw4LluyFJftyh7
 ORpzGthicfK0tupWftzkdUWEkvxoaIrC88EmCMaYkv4msd3Uu/ChLGPSx9QFL1cL
 SHuyVRP34/wyKHgr0uMd+0SFJxl12e/x24dsjdJPCO4sYp2yWfE3UYctY4udEGA=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4cnu1xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 17:06:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6B7E340045;
 Fri, 26 Apr 2024 17:06:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09554227EFC;
 Fri, 26 Apr 2024 17:05:35 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 17:05:34 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Fri, 26 Apr 2024 17:05:23 +0200
Message-ID: <20240426150526.3094607-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: enable camera on
	stm32mp135f-dk
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

This serie enable the camera on the stm32mp135f-dk board.
It adds pinctrl configuration for dcmipp parallel input and add
gc2145/st-mipid02/dcmipp nodes within stm32mp135f-dk.dts

Alain Volmat (2):
  ARM: dts: stm32: add DCMIPP pinctrl on STM32MP13x SoC family
  ARM: dts: stm32: enable camera support on stm32mp135f-dk board

 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 33 ++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts     | 87 +++++++++++++++++++++
 2 files changed, 120 insertions(+)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
