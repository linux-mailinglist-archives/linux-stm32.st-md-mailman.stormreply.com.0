Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D80ABF8C5
	for <lists+linux-stm32@lfdr.de>; Wed, 21 May 2025 17:06:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E83D9C78F6B;
	Wed, 21 May 2025 15:06:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3872DC78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 15:06:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LDfwNR031547;
 Wed, 21 May 2025 17:06:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=TSmPZSUiriMz96Sywv4sxQ
 EnAqY0Qa0OY4Z7gR1h+jw=; b=Mufg19jELB0oRxHfJfird2T2YhK7gJVi4aLfNc
 4yEaZ8LYgEvcuZctFGz/dUGudj5zyUOaLf+HX32vk8G0Wh84sfnhU5dTJ0LfLIRA
 bh73dNmI16LJNUIniQSjUN73lw0fNoWSpT0Oyc3t96OYKQQ6/HUfnbyYwnNepLSH
 1ErfL7rzfKX2BwbC+kB1VvAU+l5hYNu6B6lJoUB3DE7K3GtxjrewVELE/623PAiT
 RHSTncXTXfy9u+IzSeOcyyAvT/8GhxdHOHsueHaYgsjQRSxZyWsCgNRK2U4fnsdf
 l7Uu4CChn+FPBYrIte6aykDu4LDxAcM/Y6uTLRAsFveizp8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf44txt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 17:06:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 275A640049;
 Wed, 21 May 2025 17:05:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4A76A2AB8E;
 Wed, 21 May 2025 17:04:25 +0200 (CEST)
Received: from localhost (10.252.24.31) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 17:04:25 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 21 May 2025 17:04:18 +0200
Message-ID: <20250521150418.488152-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.24.31]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add
	system-clock-direction-out on stm32mp15xx-dkx
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

The commit 5725bce709db
("ASoC: simple-card-utils: Unify clock direction by clk_direction")
corrupts the audio on STM32MP15 DK sound cards.
The parent clock is not correctly set, because set_sai_ck_rate() is not
executed in stm32_sai_set_sysclk() callback.
This occurs because set_sysclk() is called with the wrong direction,
SND_SOC_CLOCK_IN instead of SND_SOC_CLOCK_OUT.

Add system-clock-direction-out property in SAI2A endpoint node of
STM32MP15XX-DKX device tree, to specify the MCLK clock direction.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index a5511b1f0ce3..c74e36676d1b 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -515,6 +515,7 @@ sai2a_endpoint: endpoint {
 				remote-endpoint = <&cs42l51_tx_endpoint>;
 				dai-format = "i2s";
 				mclk-fs = <256>;
+				system-clock-direction-out;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <32>;
 			};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
