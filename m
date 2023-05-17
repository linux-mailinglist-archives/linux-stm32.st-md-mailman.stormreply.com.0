Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B117069AF
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 15:23:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39B1AC6A615;
	Wed, 17 May 2023 13:23:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF626C6A60A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 13:23:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HAE4FX019286; Wed, 17 May 2023 15:22:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=BZr8fDGfdp37BckovBTdF+2bEwCeqebT3IP9pKPZ1WM=;
 b=l64+D3Cr1PWnikE0y1Z2JLhDp/I6hhaAcFbCjdqRQfZ2rZYjpp2UYIWqOQAtoQIwyppE
 ZJshEe/hw8ENmf2R8NmfrzWc2oGoPiv/l5KazZDAgRra5oNKIGchSlVlyjN46SDftuC0
 266C+byeTplLlc0JT2GMEX+mQ/CHHLI0NJMM7+JfnxSmRnU5UJKTnhKVEx9vujmn32qU
 CyMa2eUZDMGkQrpbilZthHilLL3mI/AaCtAhmMoyxYPofB3Ee+VLklQrAYIO594BBlcl
 qPvbg3Ulce01ZweVMzWrs7EfplUbsXg3xCIA80/tPFAwy0hr8Xnlch7EXPS9TUlif9M6 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qmtefjqbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 15:22:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16750100034;
 Wed, 17 May 2023 15:22:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DE0E2309C4;
 Wed, 17 May 2023 15:22:47 +0200 (CEST)
Received: from localhost (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 17 May
 2023 15:22:46 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Marek Vasut <marex@denx.de>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
Date: Wed, 17 May 2023 15:22:11 +0200
Message-ID: <20230517132214.254757-1-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] STM32 warning cleanup
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

This serie aims to reduce the number of device-tree warnings of
following boards :

  - STM32F429-DISCO
  - STM32MP15*

Those warnings were appearing either during build or when checking
dt-bindings and concern mostly LTDC and DSI IPs and were due to the
following cases:

  - panel-dsi@0 nodes that needed
  - unnecessary #address-cells and #size-cells properties
  - residual 'reg' field on single endpoints

Raphael Gallais-Pou (3):
  ARM: dts: stm32: fix warnings on stm32f469-disco board
  dt-bindings: display: st,stm32-dsi: Remove unnecessary fields
  ARM: dts: stm32: fix several DT warnings on stm32mp15

 .../devicetree/bindings/display/st,stm32-dsi.yaml      |  2 --
 arch/arm/boot/dts/stm32f469-disco.dts                  |  4 ++--
 arch/arm/boot/dts/stm32mp151.dtsi                      |  5 -----
 arch/arm/boot/dts/stm32mp157.dtsi                      |  7 -------
 .../dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts    |  6 ++++--
 .../boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  6 ++++--
 .../stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts  |  3 +--
 arch/arm/boot/dts/stm32mp157c-dk2.dts                  |  8 ++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts                  | 10 +++++++---
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts              |  3 +--
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi     |  6 +-----
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                 |  3 +--
 12 files changed, 29 insertions(+), 34 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
