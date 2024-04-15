Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D69468A63F9
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BB23C7801A;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4A59C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:59:36 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1e455b630acso15178715ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713211175; x=1713815975;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=naj/YQ9ncheD39vcOQ7UyQeYC8KWCng+2i7jmecCLPU=;
 b=E2ydk6CsPzSWK/U3L/67gaA9PdQ+n5HihkWqsW1i7Wqt8kMFft6XpuxLLdj7qzr4I5
 5H3QW9jmBQOhVHdviuLCa2Wkc+8KW4FBv8KV8spk42SFnRjlvvvU8pcco4Pk3dhDDLJl
 DlBTm38FI5AnQo20mSAzy0nbZNKP5dJoxDqf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713211175; x=1713815975;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=naj/YQ9ncheD39vcOQ7UyQeYC8KWCng+2i7jmecCLPU=;
 b=MRPaMrcE8z9AyOQoSmR3rLDIQh9arsl9VyYTft7aGrmplgzoLs8/DYe2xBm/R/oFyw
 Lbv6cjmg1B4R/F28MmFBTzUiqvnpewvLe9HQhPjSEsuFNHVeFj+0+G9brWodN+Splbyd
 0Ls6626kW75TUaA+xzpaE+VlGS0/1QV3kU3mwecrOi2kqkHg/jqLsxOSFyPR6hTw7/Mq
 Lx2Z7MfQddyGQzM24oxcsmtUG4L/3OeQxb/1D4p2Tqf2pje9dNVIzBEsEXbNe1Q+och5
 NFfe/ON+TVU88RDbsi1ipxzR3A5yTNHpPvLXuZ5RKf4c4Cz6GOV2kc+/hrq/JN5XobT8
 yVfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULG3bdatC7u1y+Wx0qstccqW/fULlz885L5NbXTtNXeH8ltZYlnUk4XKrSGsVAvBZgeBdP6lzd8UmtasNb3HcoabsgVMrO/sVXSUULVoqxbNNBXX8vwK5J
X-Gm-Message-State: AOJu0YxmdAYmuDI2aQpdWg4DwS2WoFcQR82xGe7icFHoUNouMDQEb+Ck
 FfeJNWdr0MmtOgx7hFE61Gs0ydJ8nNqUm3ruPoFmYi0rblV/oOGevNncyweSOQ2Wk3MKmk0VQ5l
 1SQ==
X-Google-Smtp-Source: AGHT+IHTxRl1cND2b42hAsM6fFF3OJ+k30rTMJINxkqb9IlaLeGhsg0QCHvgMWSzmXATJn7Zs3du7g==
X-Received: by 2002:a17:902:7ec9:b0:1e7:b6a3:7bd9 with SMTP id
 p9-20020a1709027ec900b001e7b6a37bd9mr1009715plb.16.1713211175470; 
 Mon, 15 Apr 2024 12:59:35 -0700 (PDT)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com.
 [209.85.210.180]) by smtp.gmail.com with ESMTPSA id
 w19-20020a170902c79300b001e27462b97fsm8322655pla.293.2024.04.15.12.59.35
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 12:59:35 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6ed32341906so3243703b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:59:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUy0LbvjHgcNfWDdFZnLCAFB4ARcv0yHvYiVgRQQsWDXMCFSHB321qQCszaOuoJpbTXCCTtqrZSTXTAdsrnH4LfwUUr9KQy+IihAbMQjas45+7K9j7H2fhV
X-Received: by 2002:a25:ab2c:0:b0:db9:794b:5733 with SMTP id
 u41-20020a25ab2c000000b00db9794b5733mr10827321ybi.19.1713211153708; Mon, 15
 Apr 2024 12:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415195348.GD22954@pendragon.ideasonboard.com>
In-Reply-To: <20240415195348.GD22954@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 21:58:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCteGngbSS6CCuUxM-PQiBz0W0WfoFr2E2oH2d8qt746_A@mail.gmail.com>
Message-ID: <CANiDSCteGngbSS6CCuUxM-PQiBz0W0WfoFr2E2oH2d8qt746_A@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Tue, 16 Apr 2024 06:35:01 +0000
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Pavel Machek <pavel@ucw.cz>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sergey Kozlov <serjk@netup.ru>,
 Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH 00/35] media: Fix coccinelle warning/errors
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

Hi Laurent

On Mon, 15 Apr 2024 at 21:54, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> I'm afraid I won't have time to review any of this for the time being.
> Unless you would like me to put uvcvideo reviews on hold ;-)
>
> Jokes aside, my first reaction was that this feels like a bit of a waste
> of maintainer's time :-S

This is part of the media-ci effort.

It is definitely not the most fun patches to do or review, but someone
has to do it :)

The whole idea is that we want to get as little warnings as possible
from the static analysers, after this patchset we almost achieve that.

It is only 2 trivial uvc patches, I can ask someone from my team to
review it if you want and trust them ;)

Regards!

>
> On Mon, Apr 15, 2024 at 07:34:17PM +0000, Ricardo Ribalda wrote:
> > After this set is applied, these are the only warnings left:
> > drivers/media/pci/ivtv/ivtv-fileops.c:223:4-10: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:230:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:236:4-10: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:245:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:251:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:257:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:272:3-9: preceding lock on line 267
> > drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 627
> > drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 689
> > drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 627
> > drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 689
> > drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 627
> > drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 689
> > drivers/media/pci/ivtv/ivtv-fileops.c:692:4-10: preceding lock on line 689
> > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
> > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
> > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809
> > drivers/media/dvb-frontends/stv090x.c:799:1-7: preceding lock on line 768
> > drivers/media/usb/go7007/go7007-i2c.c:125:1-7: preceding lock on line 61
> > drivers/media/rc/imon.c:1167:1-7: preceding lock on line 1153
> > drivers/media/pci/cx18/cx18-scb.h:261:22-29: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:85:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:154:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:171:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:180:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:189:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:201:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:220:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_cmds.h:230:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:764:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1008:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1014:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1041:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1088:39-51: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1093:5-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1144:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1239:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1267:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/qcom/venus/hfi_helper.h:1272:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/common/siano/smscoreapi.h:669:6-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/common/siano/smscoreapi.h:1049:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/common/siano/smscoreapi.h:1055:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/media/platform/xilinx/xilinx-dma.h:100:19-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > drivers/staging/media/atomisp/pci/atomisp_tpg.h:30:18-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >
> > CI tested:
> > https://gitlab.freedesktop.org/linux-media/media-staging/-/commit/055b5211c68e721c3a7090be5373cf44859da1a7/pipelines?ref=ribalda%2Ftest-cocci
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Ricardo Ribalda (35):
> >       media: pci: mgb4: Refactor struct resources
> >       media: stb0899: Remove unreacheable code
> >       media: uvcvideo: Refactor iterators
> >       media: uvcvideo: Use max() macro
> >       media: go7007: Use min and max macros
> >       media: stm32-dcmipp: Remove redundant printk
> >       media: staging: sun6i-isp: Remove redundant printk
> >       media: dvb-frontends: tda18271c2dd: Remove casting during div
> >       media: v4l: async: refactor v4l2_async_create_ancillary_links
> >       staging: media: tegra-video: Use swap macro
> >       media: s2255: Use refcount_t instead of atomic_t for num_channels
> >       media: platform: mtk-mdp3: Use refcount_t for job_count
> >       media: common: saa7146: Use min macro
> >       media: dvb-frontends: drx39xyj: Use min macro
> >       media: netup_unidvb: Use min macro
> >       media: au0828: Use min macro
> >       media: flexcop-usb: Use min macro
> >       media: gspca: cpia1: Use min macro
> >       media: stk1160: Use min macro
> >       media: tegra-vde: Refactor timeout handling
> >       media: venus: Use div64_u64
> >       media: i2c: st-mipid02: Use the correct div function
> >       media: dvb-frontends: tda10048: Use the right div
> >       media: tc358746: Use the correct div_ function
> >       media: venus: Use the correct div_ function
> >       media: venus: Refator return path
> >       media: dib0700: Refator return path
> >       media: usb: cx231xx: Refator return path
> >       media: i2c: rdacm20: Refator return path
> >       media: i2c: et8ek8: Refator return path
> >       media: cx231xx: Refator return path
> >       media: si4713: Refator return path
> >       media: ttpci: Refator return path
> >       media: hdpvr: Refator return path
> >       media: venus: Refator return path
> >
> >  drivers/media/common/saa7146/saa7146_hlp.c         |  8 +++----
> >  drivers/media/dvb-frontends/drx39xyj/drxj.c        |  9 +++-----
> >  drivers/media/dvb-frontends/stb0899_drv.c          |  5 -----
> >  drivers/media/dvb-frontends/tda10048.c             |  3 +--
> >  drivers/media/dvb-frontends/tda18271c2dd.c         |  4 ++--
> >  drivers/media/i2c/et8ek8/et8ek8_driver.c           |  4 +++-
> >  drivers/media/i2c/rdacm20.c                        |  5 ++++-
> >  drivers/media/i2c/st-mipid02.c                     |  2 +-
> >  drivers/media/i2c/tc358746.c                       |  3 +--
> >  drivers/media/pci/mgb4/mgb4_core.c                 |  4 ++--
> >  drivers/media/pci/mgb4/mgb4_regs.c                 |  2 +-
> >  drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c  |  2 +-
> >  drivers/media/pci/ttpci/budget-core.c              |  5 ++++-
> >  .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   | 10 ++++-----
> >  .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |  6 ++---
> >  .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |  2 +-
> >  .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  6 ++---
> >  drivers/media/platform/nvidia/tegra-vde/h264.c     |  6 ++---
> >  drivers/media/platform/qcom/venus/vdec.c           | 15 +++++++------
> >  drivers/media/platform/qcom/venus/venc.c           | 19 +++++++++-------
> >  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  5 +----
> >  drivers/media/radio/si4713/radio-usb-si4713.c      |  8 +++++--
> >  drivers/media/usb/au0828/au0828-video.c            |  5 +----
> >  drivers/media/usb/b2c2/flexcop-usb.c               |  5 +----
> >  drivers/media/usb/cx231xx/cx231xx-i2c.c            | 16 +++++++++----
> >  drivers/media/usb/cx231xx/cx231xx-video.c          | 10 +++++++--
> >  drivers/media/usb/dvb-usb/dib0700_core.c           |  4 +++-
> >  drivers/media/usb/go7007/go7007-fw.c               |  4 ++--
> >  drivers/media/usb/gspca/cpia1.c                    |  6 ++---
> >  drivers/media/usb/hdpvr/hdpvr-control.c            |  4 +++-
> >  drivers/media/usb/s2255/s2255drv.c                 | 20 ++++++++---------
> >  drivers/media/usb/stk1160/stk1160-video.c          | 10 ++-------
> >  drivers/media/usb/uvc/uvc_ctrl.c                   | 26 ++++++++++++----------
> >  drivers/media/v4l2-core/v4l2-async.c               |  8 +++----
> >  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c  |  1 -
> >  drivers/staging/media/tegra-video/tegra20.c        |  9 ++------
> >  36 files changed, 132 insertions(+), 129 deletions(-)
> > ---
> > base-commit: 71b3ed53b08d87212fbbe51bdc3bf44eb8c462f8
> > change-id: 20240415-fix-cocci-2df3ef22a6f7
> >
> > Best regards,
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
