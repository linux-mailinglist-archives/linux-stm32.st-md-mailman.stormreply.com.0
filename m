Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 456257FA798
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 18:09:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06856C6B469;
	Mon, 27 Nov 2023 17:09:44 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8200BC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 17:09:42 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3ARDqXKF029391; Mon, 27 Nov 2023 18:09:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=scaZiRN
 a51OlJfNVswXDrj5I08uYQmb4qOjuwQApPR8=; b=u16ZdZOpX4aVKwEtlsk700+
 Y0bfUzgc5SFiUuRqjkCtD2JWAP0vDCN8rFRTFWn6P0icBhQo9cvO5XJkMCwoQiIa
 rWDR9x39zzWeysM4aBNxoeQmR5PS21ef+GULgAQmJFR6MXvmaiWuf31n/9vWusuv
 Dvs3hJ2NAyIVABk3Izbi87rBhwZiFYOTl1eQ9Xv5/JUsEuC2bgf4WQs2Q9iMZFqZ
 TXSNIp90VXaKrOutgvD+Pu8svNDof1CQx8e+8fSISsirKJLvhnKfIcDNzypjIgm+
 jIApj+gznSr4gMoptKc6JvAZ1POB9NBSSbWa8zAElwfRiHTyv+qCu5/WsaETHdA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ukvrp5v8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Nov 2023 18:09:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6154510002A;
 Mon, 27 Nov 2023 18:08:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5600824B880;
 Mon, 27 Nov 2023 18:08:41 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 27 Nov
 2023 18:08:41 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 27 Nov 2023 18:08:14 +0100
Message-ID: <20231127170828.1426117-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_15,2023-11-27_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Scally <dan.scally@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v9 0/5] Add support for DCMIPP camera
	interface of STMicroelectronics STM32 SoC series
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

This patchset introduces support for Digital Camera Memory Interface
Pixel Processor (DCMIPP) of STMicroelectronics STM32 SoC series.

This initial support implements a single capture pipe
allowing RGB565, YUV, Y, RAW8 and JPEG capture with
frame skipping, prescaling and cropping.

DCMIPP is exposed through 3 subdevices:
- dcmipp_dump_parallel: parallel interface handling
- dcmipp_dump_postproc: frame skipping, prescaling and cropping control
- dcmipp_dump_capture: video device capture node

v9:
  - serie rebased on top of master branch of tree sailus/media_tree.git
    in order to use init_state instead of init_cfg ops
  - addition of link_validate in subdevs & video capture device
    (bytecap)
  - use local variable rtsc within probe for reset_controller

v8:
  - serie rebased on top of master branch of tree sailus/media_tree.git
    in order to use v4l2_subdev_state_* functions

v7:
  - correct byteproc set_fmt handling and compose/crop/fmt handling
  - replace few v4l2_subdev_get_try_* into v4l2_subdev_get_pad_*
  - correct ordering within dcmipp_remove

v6:
  - correct copyright year in all files
  - correct Kconfig (removal of OF addition of select
    VIDEO_V4L2_SUBDEV_API/MEDIA_CONTROLLER
  - add missing mutex_destroy in error handling
  - rely on fwnode_graph_get_endpoint_by_id instead of fwnode_graph_get_next_endpoint
  - rely on device_get_match_data instead of of_device_get_match_data
  - use local variable for pads_flag initialization

v5:
  - removal of dcmipp_frame_size & dcmipp_frame_stride and use
    v4l2_fill_pixfmt
  - correct typos & avoid check of available buffer at start_streaming
    time since this is done by vb2 framework
  - avoid set of pad format in dcmipp_par_ent_init and
    dcmipp_byteproc_ent_init since done via init_cfg
  - reorder bound functions
  - use v4l2_subdev_get_fmt in parallel and byteproc subdevs
  - correct struct dcmipp_ent_device comments
  - removal of dcmipp_hdw_pixel_alignment in bytecap subdev since not
    applicable in this byte mode pipeline

v4:
  - rework of mutex / spinlock handling
  - addition of dma mask setting
  - removal of __maybe_unused, use pm_ptr and new declaration macros
  - driver now only generate a single stm32-dcmipp.ko module instead of
    several as before
  - removal of the component framework usage
  - various small fixes (function names, lowercase values, indentation,
    print formats)
  - register name removal in register access function, only dev_dbg with
    address & values are kept
  - removal of VB2_READ and CAP_READWRITE
  - usage of subdev active state mechanism and removal of locally stored
    format/compose/crop
  - addition of port { } within the stm32mp135.dtsi

v3:
  - Have same To & Cc in all patches emails of the serie so that everybody
    has coherent view of the serie
  - bindings: correct wording, clock-names & label removal
  - driver: replace of_graph call with fwnode_graph
  - driver: use defined bus-type when calling v4l2_fwnode_endpoint_parse
  - driver: remove clock name
  - dtsi: remove clock-names property

v2:
  - removal of pclk-max-frequency from yaml example dts
  - codying-style fixes
  - correction in enum functions (format, mbus, frame_size ...) handling
  - drop of v4l2_pipeline_pm_ calls, and specific open/close handler of
    vdev
  - video dev s_stream handling updated to call s_stream of remote subdev
    instead of loop until sensor subdev
  - code update following media_pipeline & v4l2_async_ api changes since v1
  - removal of IP reset call upon error
  - removal of link_validate handlers
  - addition of V4L2_CAP_IO_MC device_caps
  - removal of the frame skip control for the time being, will be added
    back in another commit once control method will be agreed
  - change byteproc entity type to MEDIA_ENT_F_PROC_VIDEO_SCALER
  - various fixes from Dan & Sakari remarks

Alain Volmat (2):
  dt-bindings: media: add bindings for stm32 dcmipp
  media: MAINTAINERS: add entry for STM32 DCMIPP driver

Hugues Fruchet (3):
  media: stm32-dcmipp: STM32 DCMIPP camera interface driver
  ARM: dts: stm32: add dcmipp support to stm32mp135
  ARM: multi_v7_defconfig: enable STM32 DCMIPP media support

 .../bindings/media/st,stm32-dcmipp.yaml       |  89 ++
 MAINTAINERS                                   |   5 +-
 arch/arm/boot/dts/st/stm32mp135.dtsi          |  11 +
 arch/arm/configs/multi_v7_defconfig           |   1 +
 drivers/media/platform/st/stm32/Kconfig       |  16 +
 drivers/media/platform/st/stm32/Makefile      |   1 +
 .../platform/st/stm32/stm32-dcmipp/Makefile   |   4 +
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    | 956 ++++++++++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   | 565 +++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-common.c     | 111 ++
 .../st/stm32/stm32-dcmipp/dcmipp-common.h     | 216 ++++
 .../st/stm32/stm32-dcmipp/dcmipp-core.c       | 604 +++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c   | 440 ++++++++
 13 files changed, 3018 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
