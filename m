Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC5735C73
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 18:55:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77796C6B442;
	Mon, 19 Jun 2023 16:55:36 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 312ACC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 16:55:35 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-763a2e39b88so63191785a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687193734; x=1689785734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7c41/bHT5/tFLz1vS2dSA0XEpnWz70oHsIq3qIfRkDg=;
 b=S9h89TIICRrr9urRyxkGPxg0pQMos+Ew4eyrnlhGAsTdrj9u8CsXILBMHfxlU7CPRA
 MlvBX16u/Pe5p+tRlks2G3BeNtr8MSkOlCdEduf+udO69nQpBqWdvZm7vfzyiJKtXCKm
 +m/FKU5TZTwkArCuraEa9SXh2BfvfGOdigDtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193734; x=1689785734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7c41/bHT5/tFLz1vS2dSA0XEpnWz70oHsIq3qIfRkDg=;
 b=LGPFowESKipJ7kOZqnKafoLrYu3p63ojd7R9CW1TCxjKbwuS2hla6651NJs6hXbJfy
 X+J+grDEm62dy9PL60P+UCwJadLuuuo9psfyKi+5UUi/47HJ+tSKB71AJXslS9stvymY
 iau382qh39UYY3nzwUG1Xp7iLFdUyngHvekzGmAoI5Fl9dUzvnMFe/hYXoJJ/ETmDC9E
 opraMOUmAP0ybOuzb+O/ca6FlL3bfiW3nSO7WzucCmui27Vl9A4gX7PpkAtt2MPPxbST
 BeHQe4zkv0TJ+ed2d4ZO8/WiFEel5dS3MuNMNU94Gtj0J3Scx5cRoIRifbOHeE5XqZLP
 W2aw==
X-Gm-Message-State: AC+VfDz4iSVcBJyA1nRISAugyoo6oS7ay8INheUosK9QfHnBEGCjE96r
 RZwhMkuatX1Z3RWvBr9OlglnxQ==
X-Google-Smtp-Source: ACHHUZ4sTAr3fMXBOvSLg9lwFYSVkTHAYf5eM0y/vpSON2lPB1hmZtTUmjdP6o3pvxtzCVlRsK/uFA==
X-Received: by 2002:a05:620a:8e04:b0:762:55f7:7105 with SMTP id
 re4-20020a05620a8e0400b0076255f77105mr4382806qkn.28.1687193734044; 
 Mon, 19 Jun 2023 09:55:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05620a15f700b0075d49ce31c3sm109103qkm.91.2023.06.19.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:55:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 19 Jun 2023 18:55:19 +0200
Message-Id: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/6] Add display support on the
	stm32f746-disco board
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

The series adds support for the display on the stm32f746-disco board,
along with a generic patch that adds the "bpp" parameter to the stm-drm
module. The intention is to allow users to size, within certain limits,
the memory footprint required by the framebuffer.

Changes in v4:
- Use DTS property instead of module parameter to set the framebuffer bit depth.

Changes in v3:
- rename ltdc-pins-a-0 to ltdc-0.
- drop [4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next):
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
- drop [5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc

Dario Binacchi (6):
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: support display on stm32f746-disco board
  dt-bindings: display: stm32-ltdc: add optional st,fb-bpp property
  ARM: dts: stm32: set framebuffer bit depth on stm32f746-disco
  drm/stm: set framebuffer bit depth through DTS property

 .../bindings/display/st,stm32-ltdc.yaml       |  6 +++
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi        | 35 +++++++++++++
 arch/arm/boot/dts/stm32f746-disco.dts         | 52 +++++++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi              | 10 ++++
 drivers/gpu/drm/stm/drv.c                     |  6 ++-
 5 files changed, 108 insertions(+), 1 deletion(-)

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
