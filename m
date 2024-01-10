Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAACD8297D9
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jan 2024 11:47:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88D68C6A61D;
	Wed, 10 Jan 2024 10:47:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09BC3C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 10:47:20 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40A97aJA025702; Wed, 10 Jan 2024 11:47:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=kGiOxvO
 pWczIlSq7Cssihsblr91Ysp+Vipm6Fn7JKx8=; b=4HG38UcGmjmrYSZJ4ekVSGU
 qGUnaA0LAip8b2emO++6Yy06ScoiIlvaNZhJNcnCy0HtgmFu2OEBA4Mcdx0RYc3m
 Se+Q21j7PGUEpST2cTC6g0NHQLiwuvJ0s6zGFnMo/3MTaLd+wyipgHJBlO0OThGO
 DQBWeJoxDdXeJFeGPE6/36lMZJrbPvzMt3WA8PFUboT9g6DgVdod3ezw/uEbgIvg
 Rj9AaJhqKvTkL7oFp7gxDSezYGn0mM7hj1SNHddTniILc2ATvOhBnauimEvp/Jq5
 NqfPG+S0P4o42hiFcgmDVonPAFHX0dX1WSbZP2vOFah3BvuGKErDL5crEJ4HHfQ=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vfha4p29n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 11:47:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C570A100049;
 Wed, 10 Jan 2024 11:47:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B255226C046;
 Wed, 10 Jan 2024 11:47:00 +0100 (CET)
Received: from localhost (10.201.20.120) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 10 Jan
 2024 11:47:00 +0100
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
Date: Wed, 10 Jan 2024 11:46:37 +0100
Message-ID: <20240110104642.532011-1-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, Adam Ford <aford173@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: [Linux-stm32] [RESEND PATCH v6 0/5] Add support for video hardware
	codec of STMicroelectronics STM32 SoC series
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

This patchset introduces support for VDEC video hardware decoder
and VENC video hardware encoder of STMicroelectronics STM32MP25
SoC series.

This initial support implements H264 decoding, VP8 decoding and
JPEG encoding.

This has been tested on STM32MP257F-EV1 evaluation board.

===========
= history =
===========
version 6:
   - Use a single file for VDEC and VENC variants as suggested by Alex Bee
   - Fix some typos raised by Sebastian Fricke
   - Add Krzysztof Kozlowski Reviewed-by

version 5:
   - Precise that video decoding as been successfully tested up to full HD
   - Add Nicolas Dufresne Reviewed-by

version 4:
   - Fix comments from Nicolas about dropping encoder raw steps

version 3:
   - Fix remarks from Krzysztof Kozlowski:
    - drop "items", we keep simple enum in such case
    - drop second example - it is the same as the first
   - Drop unused node labels as suggested by Conor Dooley
   - Revisit min/max resolutions as suggested by Nicolas Dufresne

version 2:
   - Fix remarks from Krzysztof Kozlowski on v1:
    - single video-codec binding for both VDEC/VENC
    - get rid of "-names"
    - use of generic node name "video-codec"

version 1:
  - Initial submission

Hugues Fruchet (5):
  dt-bindings: media: Document STM32MP25 VDEC & VENC video codecs
  media: hantro: add support for STM32MP25 VDEC
  media: hantro: add support for STM32MP25 VENC
  arm64: dts: st: add video decoder support to stm32mp255
  arm64: dts: st: add video encoder support to stm32mp255

 .../media/st,stm32mp25-video-codec.yaml       |  49 +++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  12 ++
 arch/arm64/boot/dts/st/stm32mp255.dtsi        |  17 ++
 drivers/media/platform/verisilicon/Kconfig    |  14 +-
 drivers/media/platform/verisilicon/Makefile   |   3 +
 .../media/platform/verisilicon/hantro_drv.c   |   4 +
 .../media/platform/verisilicon/hantro_hw.h    |   2 +
 .../platform/verisilicon/stm32mp25_vpu_hw.c   | 186 ++++++++++++++++++
 8 files changed, 284 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml
 create mode 100644 drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
