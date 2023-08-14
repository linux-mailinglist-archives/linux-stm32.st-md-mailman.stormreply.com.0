Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A121177B9F4
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 15:28:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D5FEC6B472;
	Mon, 14 Aug 2023 13:28:50 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D948C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 13:28:49 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-99c1f6f3884so592649666b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692019728; x=1692624528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UwTK4kQuV5VxtjBSsgaGk0balJ0EXu0ogmgIW94gvrs=;
 b=Gr+qyuiLUYHVDstJKxuX9OmR+46d+I9eLx7/jZRTje+YIqMXDAXUywQUzxqi+5oxFi
 we3gIUjU9v/By0hcv2xh13nzuQ1h3z9KRCo0yxfMM6SkQlHCkUVAuzxKlDW5a0Rw5ftH
 whLYUfuT46a28iUkKMhbbVZY/iZG7cWrAQveE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692019728; x=1692624528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UwTK4kQuV5VxtjBSsgaGk0balJ0EXu0ogmgIW94gvrs=;
 b=EL9cQfmJuh1whnUz7Jt5Fg06W/KpOiV+5c4wNs2EJ+BQSLruIN3gC5AAXynzIwy5oe
 1TyqWrk05oTys10goNVwJqxBDnWM7lEodqrmik/DLwCvAAHgoy8t+p5HGwgHUHIWiy3y
 oio9fgR8+sVu2MOfGBvBsRW85/q3Z9gnkUcZHR3C8oTxAdW97OA0HCvOmmCQ3TmA+dV7
 ZKfqDu94C51SVjdTHS/EYpLzRlw0VGhjk2o5aAICDA8v6W3ECT2xfxVhj3TGk/ZqRSLg
 Llq3u/u1Cp6KSdXNdVKoQovPEmrgVfnTrz25k6v5Wxq5J7wKj8aMiHh3IcFGkotShCIL
 aIpQ==
X-Gm-Message-State: AOJu0YzMKpkl/g7hUsUheWtBZTW4tUJPi4cds2tEVTT//OlafKvAesj0
 Qnp1GrDHa0r6NSCCRnQafSgnLQ==
X-Google-Smtp-Source: AGHT+IGls+RQsK667fY/9NGJP8lytIadwNC1YoCHU8DSXGFvYdF3uY8ozRFXsf8peTtmChtHNxVDnA==
X-Received: by 2002:a17:906:30d7:b0:99c:4ea0:ed18 with SMTP id
 b23-20020a17090630d700b0099c4ea0ed18mr7677926ejb.8.1692019728414; 
 Mon, 14 Aug 2023 06:28:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-204.pool80180.interbusiness.it. [80.180.23.204])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a170906248300b0099d02ca4327sm5662066ejb.54.2023.08.14.06.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 06:28:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 14 Aug 2023 15:28:40 +0200
Message-Id: <20230814132844.113312-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 0/4] Add display support on the
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

The series adds support for the display on the stm32f746-disco board.

Changes in v8:
- Add the patch [3/4] "ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f746-disco" to
  th series.
- Add the 'power-supply' property to panel-rgb node.
- Move backlight and panel-rgb nodes after the vcc-3v3 node.

Changes in v7:
- Add 'Reviewed-by' tags I forgot in v6.
  https://lore.kernel.org/linux-arm-kernel/20230629083726.84910-1-dario.binacchi@amarulasolutions.com/T/

Changes in v6:
- Remove dma nodes from stm32f746-disco.dts, they are not used by LTDC,
  so there is no need to enable them.

Changes in v5:
I am confident that framebuffer sizing is a real requirement for STM32 boards,
but I need some time to understand if and how to introduce this functionality.
Therefore, I drop the following patches to allow the series to be fully merged:
 - [4/6] dt-bindings: display: stm32-ltdc: add optional st,fb-bpp property
 - [5/6] ARM: dts: stm32: set framebuffer bit depth on stm32f746-disco
 - [6/6] drm/stm: set framebuffer bit depth through DTS property

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

Dario Binacchi (4):
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f746-disco
  ARM: dts: stm32: support display on stm32f746-disco board

 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 35 ++++++++++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts  | 50 +++++++++++++++++++++--
 arch/arm/boot/dts/st/stm32f746.dtsi       | 10 +++++
 3 files changed, 92 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
