Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0371844E
	for <lists+linux-stm32@lfdr.de>; Wed, 31 May 2023 16:10:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E318C69069;
	Wed, 31 May 2023 14:10:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87B98C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 14:10:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34VCImYD001501; Wed, 31 May 2023 16:09:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=prF5Y1wurMLlqq34fQzZcB6OviCE9Oi8RI5OEOhQF2o=;
 b=H1CJ09HTw3sEPZlbQbJfuPTeyEJdZMM01HYE/XZTapsG+juAwIxOYfrU0N5D+y+9gWzI
 Zv/qiDGWzU7VKm73MYgncgMjLb2pPuJUUN1r6p8J+FE8CKBV/XQRc8cq8zrAAl0n2SfR
 0hAgBEKw1BTbjtKCCfQWnMkrNhMu/I/boRb1NoKOTQ5957LNe8MRUh79WVuhWq40UKsL
 yhDn4u4BncEbCjIff8EEyNHJdl7pxyAx+Xkx52o+K2F+ASr9BukeH1qNIgKWJk1ywGne
 ZiLUWAMum4OlAI1MHsdNB0b8LaGaAULO2r4NHopgGPByd9mK3ISFMsTkSqqbiFphNPY0 mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qweqe9170-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 16:09:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C14A10002A;
 Wed, 31 May 2023 16:09:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED2A524B8AE;
 Wed, 31 May 2023 16:09:48 +0200 (CEST)
Received: from localhost (10.252.16.99) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 31 May
 2023 16:09:48 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 31 May 2023 16:09:09 +0200
Message-ID: <20230531140912.819373-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.16.99]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_08,2023-05-31_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Alexandre Torgue <alexandre.torgue@st.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] ASoC: stm32: fix dtbs_check warnings
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

Fix dtbs_check warnings in STM32MP15 DK boards Devices Trees for
STM32 I2S and Cirrus CS42L51 codec.

- Add OF graph port property in I2S and CS42L51 DT bindings.
  Fixes warnings:
  audio-controller@4000b000: Unevaluated properties are not allowed 
  ('port' was unexpected)
  cs42l51@4a: Unevaluated properties are not allowed
  ('port' was unexpected)
- Correct OF graph DAI audio format property for STM32MP15x Dkx I2S node

Olivier Moysan (3):
  ASoC: dt-bindings: stm32: document audio of graph port for i2s
  ASoC: dt-bindings: document audio of graph port for cs42l51
  ARM: dts: stm32: fix i2s endpoint format property for stm32mp15xx-dkx

 Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml   | 4 ++++
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                      | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
