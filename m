Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 307738B5C54
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:04:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7C64C71296;
	Mon, 29 Apr 2024 15:04:51 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26650C71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:04:44 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-790e7c02430so152213685a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714403083; x=1715007883;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mG5AqivTRcivcnSHDdO76tX9TMu39Xvc1NfVY8/xyZ8=;
 b=ZTznNmkyg+9M9B7xABg60Nnkaw9kjYp1N4SET7eWg4bgGO21hOmgBmuqSl7ORv9+t7
 dTTVlO8ak2o4oDDEXNeyTCDzhoXGZ57htkpigy1QyGNHD41VCpcFEpL9CksdynkXYqIq
 dCccfRfPzbEoAPpxTZfCHfjUO5LaITVnTb3aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714403083; x=1715007883;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mG5AqivTRcivcnSHDdO76tX9TMu39Xvc1NfVY8/xyZ8=;
 b=MJKWHdSUAkha4PfmpMWnsH3o5376q2tGOTOkr5vnDfqvgJHoGBEFhGu4FN7/sJ0PaL
 xQgqQjxeWi9AhACCsyzuGUTwGNZI8Br36WOalSvyHdyliJQHLDoKUwRRF1PCRDg3NjI2
 WJuAlFboO570ca1KL96V7W6UlEVRlcSwfThv9G3LkPvBWORlgXPfHp2pnVO+9h3lyo34
 uJTdYClLA6rTrt5mSH5Uzht6WJpAojsi0FD6JIfe1WlxQWaWOtUM6ZX708fPDlZweltX
 BLod+lzVbHQ791vDs6HyGbRjAOHCzSRbw86G+9BgNprT3NEKMyGKSZgk19G2no23WXoF
 aqnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHJLdlx2ypRVzlPTTD6l6tj8XX0dKFgiqTaQ8qjrBev56df+39w5BgMGwT94T6P4ZCNrxVHz6mq2OGCKNP5WFxMJxENjp+epLN5yZeXivaYvJ1K6Le637q
X-Gm-Message-State: AOJu0Yw/SX5UHBakn5nxBS4vAPRMtGTvXo73BjWPh8esdzT5YdiV8PwC
 8O/NNv/5XXmnTDnZiSEjq+zEyl7HKWr1kMQCMLmitNLTGMqXd96zqnvbrG0A6A==
X-Google-Smtp-Source: AGHT+IEiGBSMmtyat5afJr1mFq2UfHpFZccmo0g1E6Wkj56VmdEGwMv1z2p/lagIWDK9rmsXB4w0qQ==
X-Received: by 2002:a05:620a:450b:b0:790:fcce:abf7 with SMTP id
 t11-20020a05620a450b00b00790fcceabf7mr2131315qkp.72.1714403082925; 
 Mon, 29 Apr 2024 08:04:42 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:04:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:39 +0000
Message-Id: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAe3L2YC/22MQQ7CIBBFr9LMWgwMWMSV9zAuWgrtLFoMKNE0v
 bu0q8a4fDP/vRmSi+QSXKoZosuUKEwF5KECOzRT7xh1hQE5Kq7EiXl6MxusJYadl84jNrXXUPa
 P6Mpza93uhQdKzxA/WzqL9fqvkgXjTGnd+BalxnN7tUMMI73GY4g9rKGMe9nsZSwyCmFcbVByY
 3/kZVm+BzUuWOIAAAA=
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-mediatek@lists.infradead.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 00/26] media: Fix coccinelle warning/errors
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
Changes in v3: Thanks Bryan, Dan, Markus, Sakary and Hans
- Improve commit messages.
- Use div64_u64 when possible
- Link to v2: https://lore.kernel.org/r/20240419-fix-cocci-v2-0-2119e692309c@chromium.org

Changes in v2:
- Remove all the min() retval, and send a patch for cocci:  https://lore.kernel.org/lkml/20240415-minimax-v1-1-5feb20d66a79@chromium.org/T/#u
- platform_get_irq() cannot return 0, fix that (Thanks Dan).
- Fix stb0800 patch. chip_id can be 0 (Thanks Dan).
- Use runtime (IS_ENABLED), code looks nicer. (Thanks Dan).
- Do not replace do_div for venus (Thanks Dan).
- Do not replace do_div for tda10048 (Thanks Dan).
- Link to v1: https://lore.kernel.org/r/20240415-fix-cocci-v1-0-477afb23728b@chromium.org

---
Ricardo Ribalda (26):
      media: pci: mgb4: Refactor struct resources
      media: stb0899: Simplify check
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
      media: au0828: Use umin macro
      media: flexcop-usb: Use min macro
      media: gspca: cpia1: Use min macro
      media: stk1160: Use min macro
      media: tegra-vde: Refactor timeout handling
      media: i2c: st-mipid02: Use the correct div function
      media: tc358746: Use the correct div_ function
      media: venus: vdec: Make the range of us_per_frame explicit
      media: venus: venc: Make the range of us_per_frame explicit
      media: dvb-frontends: tda10048: Fix integer overflow
      media: dvb-frontends: tda10048: Make the range of z explicit.

 drivers/media/common/saa7146/saa7146_hlp.c         |  8 +++----
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |  9 +++-----
 drivers/media/dvb-frontends/stb0899_drv.c          |  2 +-
 drivers/media/dvb-frontends/tda10048.c             | 13 +++++++----
 drivers/media/dvb-frontends/tda18271c2dd.c         |  4 ++--
 drivers/media/i2c/st-mipid02.c                     |  2 +-
 drivers/media/i2c/tc358746.c                       |  3 +--
 drivers/media/pci/mgb4/mgb4_core.c                 |  4 ++--
 drivers/media/pci/mgb4/mgb4_regs.c                 |  2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c  |  2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   | 10 ++++-----
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |  6 ++---
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |  2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  6 ++---
 drivers/media/platform/nvidia/tegra-vde/h264.c     |  6 ++---
 drivers/media/platform/qcom/venus/vdec.c           |  7 ++----
 drivers/media/platform/qcom/venus/venc.c           |  7 ++----
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  7 ++----
 drivers/media/usb/au0828/au0828-video.c            |  5 +----
 drivers/media/usb/b2c2/flexcop-usb.c               |  5 +----
 drivers/media/usb/go7007/go7007-fw.c               |  4 ++--
 drivers/media/usb/gspca/cpia1.c                    |  6 ++---
 drivers/media/usb/s2255/s2255drv.c                 | 20 ++++++++---------
 drivers/media/usb/stk1160/stk1160-video.c          | 10 ++-------
 drivers/media/usb/uvc/uvc_ctrl.c                   | 26 ++++++++++++----------
 drivers/media/v4l2-core/v4l2-async.c               |  7 +++---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c  |  3 +--
 drivers/staging/media/tegra-video/tegra20.c        |  9 ++------
 28 files changed, 84 insertions(+), 111 deletions(-)
---
base-commit: cefc10d0d9164eb2f62e789b69dc658dc851eb58
change-id: 20240415-fix-cocci-2df3ef22a6f7

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
