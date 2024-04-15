Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C56498A63D5
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D540C6B444;
	Tue, 16 Apr 2024 06:35:02 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 214DCC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:34:28 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-78ebcfcd3abso296590985a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209667; x=1713814467;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLiSazBe5qq6aytzV8pgTe0eeceVkA2qBLGwhoGTF24=;
 b=n/I8GwzgrzKIX3bw4DjqcyhGt/oVrSfTc0MIhaTQdcvtzzOlrse8gzPpNm+2eZ7luk
 kfpkkoPeCMcjaispOsdWRZCUj5zYeitVFWXq25uUUkQnlToTnUQXxaQsGwASK/s4m7Z2
 x7qoIXh86X+w9yEGt2bqCbVRWhDZm1gLwmJlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209667; x=1713814467;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZLiSazBe5qq6aytzV8pgTe0eeceVkA2qBLGwhoGTF24=;
 b=HTS03d+VrzRLLIvbQR7nZbqJAxKG0rm+Eh0xwyTWGYOFMsCOgOZtkyHql6dfAkppcH
 A1fnvqCXE+GblrBM/zSM3HKjNHNmiD9qgYS2ll2DRz1Wb21S3cmxPmv3CW82CnkjoVi9
 z0w9Xa94ItyX9ehVFIYKOx9ZJtL830pvXIigmAqs4KWozIR/g7LaW3pD2CizZ89cjamP
 KhuryR7UzP8dLw9R+InOtCIbihtcl0VHozSzhWduwR2cwY9535YaTOd+Nuuufv12szTj
 aWwecKFoyZIxi2GNgV2PZJoB6ernKZoasWCdRa5MoUcWbvk9OyTan0F7+SzYS0OYR44Q
 rlOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr1PheZrOVK/xbybpVSm6VdDIIbmpL/xtuNSX5dcAJGnDZUO5ClGy/ehm5wMhxn4sARJdqtUlslzOqPGYo4qy6/44cjROlZmq3Lx1+aYunRQiHtGH0dZ+I
X-Gm-Message-State: AOJu0Yx8HMiVWzJuJr3NNqCiwYqyr7ZW8WYsmuT2CbcG2IusKaWVTjIW
 JEturPuvsPXRAQStiFqkpSoHel0XgVYFY914e2o3rwo55FlVzNjPFXR4tg3svg==
X-Google-Smtp-Source: AGHT+IGvWYgXqLe5y5GC/0+2akeF6DX70yb8YGk/07FW2C+kK/AaKQ5m7NmDH3z9fR+ddjVPeAolxA==
X-Received: by 2002:a05:620a:8211:b0:78d:549a:c098 with SMTP id
 ow17-20020a05620a821100b0078d549ac098mr12303538qkn.19.1713209666868; 
 Mon, 15 Apr 2024 12:34:26 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:34:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:17 +0000
Message-Id: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADqBHWYC/x2MQQqAIBAAvyJ7bkE3K+gr0UF0rb1oKEQg/T3pO
 MwwDSoX4QqralD4lio5dTCDAn+6dDBK6AykyWprJozyoM/eC1KII0ciN8cFen8V7vJ/bfv7fpq
 I9bZbAAAA
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
X-Mailer: b4 0.12.4
X-Mailman-Approved-At: Tue, 16 Apr 2024 06:35:01 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 00/35] media: Fix coccinelle warning/errors
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

After this set is applied, these are the only warnings left:
drivers/media/pci/ivtv/ivtv-fileops.c:223:4-10: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:230:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:236:4-10: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:245:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:251:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:257:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:272:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 627
drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 689
drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 627
drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 689
drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 627
drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 689
drivers/media/pci/ivtv/ivtv-fileops.c:692:4-10: preceding lock on line 689
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809
drivers/media/dvb-frontends/stv090x.c:799:1-7: preceding lock on line 768
drivers/media/usb/go7007/go7007-i2c.c:125:1-7: preceding lock on line 61
drivers/media/rc/imon.c:1167:1-7: preceding lock on line 1153
drivers/media/pci/cx18/cx18-scb.h:261:22-29: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:85:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:154:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:171:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:180:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:189:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:201:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:220:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:230:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:764:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1008:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1014:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1041:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1088:39-51: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1093:5-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1144:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1239:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1267:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1272:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:669:6-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:1049:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:1055:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/xilinx/xilinx-dma.h:100:19-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/staging/media/atomisp/pci/atomisp_tpg.h:30:18-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

CI tested:
https://gitlab.freedesktop.org/linux-media/media-staging/-/commit/055b5211c68e721c3a7090be5373cf44859da1a7/pipelines?ref=ribalda%2Ftest-cocci

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (35):
      media: pci: mgb4: Refactor struct resources
      media: stb0899: Remove unreacheable code
      media: uvcvideo: Refactor iterators
      media: uvcvideo: Use max() macro
      media: go7007: Use min and max macros
      media: stm32-dcmipp: Remove redundant printk
      media: staging: sun6i-isp: Remove redundant printk
      media: dvb-frontends: tda18271c2dd: Remove casting during div
      media: v4l: async: refactor v4l2_async_create_ancillary_links
      staging: media: tegra-video: Use swap macro
      media: s2255: Use refcount_t instead of atomic_t for num_channels
      media: platform: mtk-mdp3: Use refcount_t for job_count
      media: common: saa7146: Use min macro
      media: dvb-frontends: drx39xyj: Use min macro
      media: netup_unidvb: Use min macro
      media: au0828: Use min macro
      media: flexcop-usb: Use min macro
      media: gspca: cpia1: Use min macro
      media: stk1160: Use min macro
      media: tegra-vde: Refactor timeout handling
      media: venus: Use div64_u64
      media: i2c: st-mipid02: Use the correct div function
      media: dvb-frontends: tda10048: Use the right div
      media: tc358746: Use the correct div_ function
      media: venus: Use the correct div_ function
      media: venus: Refator return path
      media: dib0700: Refator return path
      media: usb: cx231xx: Refator return path
      media: i2c: rdacm20: Refator return path
      media: i2c: et8ek8: Refator return path
      media: cx231xx: Refator return path
      media: si4713: Refator return path
      media: ttpci: Refator return path
      media: hdpvr: Refator return path
      media: venus: Refator return path

 drivers/media/common/saa7146/saa7146_hlp.c         |  8 +++----
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |  9 +++-----
 drivers/media/dvb-frontends/stb0899_drv.c          |  5 -----
 drivers/media/dvb-frontends/tda10048.c             |  3 +--
 drivers/media/dvb-frontends/tda18271c2dd.c         |  4 ++--
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |  4 +++-
 drivers/media/i2c/rdacm20.c                        |  5 ++++-
 drivers/media/i2c/st-mipid02.c                     |  2 +-
 drivers/media/i2c/tc358746.c                       |  3 +--
 drivers/media/pci/mgb4/mgb4_core.c                 |  4 ++--
 drivers/media/pci/mgb4/mgb4_regs.c                 |  2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c  |  2 +-
 drivers/media/pci/ttpci/budget-core.c              |  5 ++++-
 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   | 10 ++++-----
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |  6 ++---
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |  2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  6 ++---
 drivers/media/platform/nvidia/tegra-vde/h264.c     |  6 ++---
 drivers/media/platform/qcom/venus/vdec.c           | 15 +++++++------
 drivers/media/platform/qcom/venus/venc.c           | 19 +++++++++-------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  5 +----
 drivers/media/radio/si4713/radio-usb-si4713.c      |  8 +++++--
 drivers/media/usb/au0828/au0828-video.c            |  5 +----
 drivers/media/usb/b2c2/flexcop-usb.c               |  5 +----
 drivers/media/usb/cx231xx/cx231xx-i2c.c            | 16 +++++++++----
 drivers/media/usb/cx231xx/cx231xx-video.c          | 10 +++++++--
 drivers/media/usb/dvb-usb/dib0700_core.c           |  4 +++-
 drivers/media/usb/go7007/go7007-fw.c               |  4 ++--
 drivers/media/usb/gspca/cpia1.c                    |  6 ++---
 drivers/media/usb/hdpvr/hdpvr-control.c            |  4 +++-
 drivers/media/usb/s2255/s2255drv.c                 | 20 ++++++++---------
 drivers/media/usb/stk1160/stk1160-video.c          | 10 ++-------
 drivers/media/usb/uvc/uvc_ctrl.c                   | 26 ++++++++++++----------
 drivers/media/v4l2-core/v4l2-async.c               |  8 +++----
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c  |  1 -
 drivers/staging/media/tegra-video/tegra20.c        |  9 ++------
 36 files changed, 132 insertions(+), 129 deletions(-)
---
base-commit: 71b3ed53b08d87212fbbe51bdc3bf44eb8c462f8
change-id: 20240415-fix-cocci-2df3ef22a6f7

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
