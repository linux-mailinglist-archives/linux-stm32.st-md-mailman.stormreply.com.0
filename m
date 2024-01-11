Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A894082AC32
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 11:41:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B160C6DD66;
	Thu, 11 Jan 2024 10:41:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E388EC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 10:41:32 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40B9ZIiu022003; Thu, 11 Jan 2024 11:41:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=GB2uavH
 tlYFLA9tfF8IDFux7FmHskdszHf23K8m0raM=; b=8c+xGJRTGO+n51zxzdRCt0c
 i1xgw63sgxwtBedtnaZ+YZ9L2aFs2S0A8uz4DR1YNdq7v0i/bnP5aS1eTBb3WPMs
 rhU2CMvE0tAkmZVljvDJTUFxT6B/xeUDkiNIsVrISfT3xRHLgEnd/eQUJaSDJ9HW
 wzAd+djfORNycZjMznVuTy2ViOuViPDC3u4nmH618CfFohWE8rw+lMYlpdM4iAdq
 ltjOE55DyffbkRBVmSDS/KEftHBpztPr8o6g/Gij6IMk4yRztHb+B1JqPGiH1PAA
 k2wcXv2518GJY2yrSQXdXaRokEfZIw0yGtnVSQ6UDNU0EVsWKReobEkBEyXZNNw=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vfha4tvny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jan 2024 11:41:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE58110002A;
 Thu, 11 Jan 2024 11:41:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC5CB2309DD;
 Thu, 11 Jan 2024 11:41:03 +0100 (CET)
Received: from localhost (10.252.29.122) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Jan
 2024 11:41:02 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 11 Jan 2024 11:40:43 +0100
Message-ID: <20240111104049.38695-1-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.29.122]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/6] Introduce STM32 LVDS driver
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

This serie introduces a new DRM bridge driver for STM32MP257 platforms
based on Arm Cortex-35. It also adds an instance in the device-tree and
handle the inclusion of the driver within the DRM framework. First patch
adds a new panel compatible in the panel-lvds driver, which is used by
default on the STM32MP257.

Changes in v2:
	- Dropped [1/8] because already merged
	- Dropped [4/8] since not mandatory for this serie
	- [1/6]: Switch compatible and clock-cells related areas
	- [1/6]: Remove faulty #include in the example.
	- [1/6]: Add missing entry in MAINTAINERS
	- [2/6]: Removed CamelCase macros
	- [2/6]: Removed hard to read debug log
	- [3/6]: Fixed my address
	- [3/6]: Fixed smatch warning
	- [5/6]: Move changes to stm32mp255.dtsi

Raphael Gallais-Pou (6):
  dt-bindings: display: add dt-bindings for STM32 LVDS device
  drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver
  drm/stm: ltdc: add lvds pixel clock
  arm64: dts: st: add ltdc support on stm32mp251
  arm64: dts: st: add lvds support on stm32mp255
  arm64: dts: st: add display support on stm32mp257f-ev

 .../bindings/display/st,stm32-lvds.yaml       |  117 ++
 MAINTAINERS                                   |    1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |   12 +
 arch/arm64/boot/dts/st/stm32mp255.dtsi        |   17 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |   79 ++
 drivers/gpu/drm/stm/Kconfig                   |   11 +
 drivers/gpu/drm/stm/Makefile                  |    2 +
 drivers/gpu/drm/stm/ltdc.c                    |   19 +
 drivers/gpu/drm/stm/ltdc.h                    |    1 +
 drivers/gpu/drm/stm/lvds.c                    | 1225 +++++++++++++++++
 10 files changed, 1484 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
 create mode 100644 drivers/gpu/drm/stm/lvds.c

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
