Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 660E98671DE
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 11:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CE23C6B46B;
	Mon, 26 Feb 2024 10:49:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B7A7C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 10:49:42 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41QALGin020301; Mon, 26 Feb 2024 11:49:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding:to:cc; s=selector1; bh=KSlAKh5khHrm2l
 h9JDEYwfn6mQwNRMWXeZ4rXWYoMPM=; b=obmUA0pgK23lV+iGq6BnCH2IcutvDH
 pOBwx7Akg0ILyMRM1yYdHrvITrC9rJFjCspZ901h0kD9syoUxuV+mXlxOVQdl28G
 xsqfE99qn+2bv20dk12Wj9Nnx+/2n7XIvA4H9MsZuELZQ1Q87WC37Trd6+7IsT+5
 nH5jRX3Xhnga96kb6yZEF9eqOnqm2GimHuGeuyxkqMvdtSfYyZ0DPfWXS1ZebnI/
 jl7jdrOEWnc/udr5VCA484zKV3WF6RlsUMo2kgXv0XxCXCCTGyqGfY/Mfu4nWnQ9
 X4uaQO7eRHFFOmCZFdn2Ax5bML3DoelJ8zd1m/b39ad3EiaLIQKvW11w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wftw4mpfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 11:49:17 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F178540048;
 Mon, 26 Feb 2024 11:49:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8979266D0C;
 Mon, 26 Feb 2024 11:48:08 +0100 (CET)
Received: from localhost (10.252.9.163) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 26 Feb
 2024 11:48:08 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Mon, 26 Feb 2024 11:48:04 +0100
Message-ID: <20240226-lvds-v6-0-15e3463fbe70@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGRs3GUC/22MQQ6CMBBFr0JmbcmILbSuvIdxAXQqTZSaDmk0h
 LtbMC5MXL6f/94MTNETw7GYIVLy7MOYod4V0A/teCXhbWaosJJYoRK3ZFkQakm9QtKNhnx9RHL
 +uWXOl8yD5ynE11ZNcl2/gfoTSFKgMNoqZ1p3MMaeXGAueSr7cIc1kdQ/TWWts/u6MU2HDs2vt
 izLG10KIC3RAAAA
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.252.9.163]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_07,2024-02-26_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/3] Introduce STM32 LVDS driver
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

Changes in v6:
	- [1/3] Added Conor's Reviewed-by
	- [2/3] Fixed kernel test robot warnings
	- Rebased on latest drm-misc-next

Changes in v5:
	- Fixed path in MAINTAINERS
	- Fixed compatible in driver

Changes in v4:
	- Align dt-bindings filename and compatible
	- Remove redundant word in [1/6] subject
	- Fix example on typo
	- Some minor fixes on YAML syntax
	- Explicitly include linux/platform_device.h
	- Drop device-tree related patch after internal discussions
	- Rebase on latest drm-misc-next

Changes in v3:
	- Changed the compatible to show SoC specificity
	- Fixed includes in dt-binding example
	- Added "#clock-cells" description in dt-binding example
	- Some minor fixes on typo

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

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Raphael Gallais-Pou (3):
      dt-bindings: display: add STM32 LVDS device
      drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver
      drm/stm: ltdc: add lvds pixel clock

 .../bindings/display/st,stm32mp25-lvds.yaml        |  119 ++
 MAINTAINERS                                        |    1 +
 drivers/gpu/drm/stm/Kconfig                        |   11 +
 drivers/gpu/drm/stm/Makefile                       |    2 +
 drivers/gpu/drm/stm/ltdc.c                         |   19 +
 drivers/gpu/drm/stm/ltdc.h                         |    1 +
 drivers/gpu/drm/stm/lvds.c                         | 1226 ++++++++++++++++++++
 7 files changed, 1379 insertions(+)
---
base-commit: de8de2c8acb931ce6197a04376a7078ccf50e821
change-id: 20240205-lvds-e084ec50e878

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
