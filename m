Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B36770F0F
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 11:32:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05CD6C6B46F;
	Sat,  5 Aug 2023 09:32:09 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B220DC6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 09:32:07 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-99c10ba30afso849191866b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Aug 2023 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691227927; x=1691832727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aF25RsasGUB1aNRKgB20J0I6Xsy/3huYOi47Fd6Xv1k=;
 b=b8vVOFsiKhLLr1bFXxu3b0b4fzG5ByTOZMyc8LOUxhXh7tXwd4xB40vB1C+1TnXEXf
 ulEByMBlb4W9BASrYgRDnUEFi4o1+akeDnLB4kg2yR3DRwOV3YFsxsKMV3P6Kl9HtsiY
 N4bU6ex122m5UfarEv6oO4HOkC78ZanmY7n5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691227927; x=1691832727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aF25RsasGUB1aNRKgB20J0I6Xsy/3huYOi47Fd6Xv1k=;
 b=PrRvFGe+7xuDKPYRLTGDn8rIyY4T4uwrxyhRhrs7NgGk3lglbQ/Q7THAL8Lwn65Z0X
 bOQQIM1XKnTVcO3KYyA5K7dNlMMT04FNj/VpviP02P0zTK4zTTN92cOvGhzz/tX3Jht5
 pY7EH4pH+//YNJvnQPvJo/X+BnWQ9UQXXbOpSX9ccQkOxKYlHPkqKoJ/6InMQGN8aHdS
 MxVEA4nAgAQqJ7vv6VjSzScc+tmGkn1rRmleYCA/ESlaZ6oT0Xx79OXA2DgpnucV3p/l
 L95rDidBJVtPeJiR/nee5LvaxoacmZ4tJxTiva7qbfa+VOq5KOpF4XXllnXnnMKUwTGl
 3zfw==
X-Gm-Message-State: AOJu0YxyzuYnI/5ADI9SjhVP7IVOE8h8E3cQaAMnBvOa/Bf+ewj9PeGz
 kQJbXir6N+ZYnnqH8Om78cLNqg==
X-Google-Smtp-Source: AGHT+IGtXjH9AHI/YJtPiVY+kUPyUT2gJnGXQxKu46u8YS85WU5PjON9DsKxMaGHjRoi/CRF1KyyjA==
X-Received: by 2002:a17:907:760a:b0:99b:4bab:2841 with SMTP id
 jx10-20020a170907760a00b0099b4bab2841mr2313337ejc.26.1691227927131; 
 Sat, 05 Aug 2023 02:32:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-12-96.retail.telecomitalia.it. [82.52.12.96])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a170906430f00b0099b76c3041csm2491083ejm.7.2023.08.05.02.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Aug 2023 02:32:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  5 Aug 2023 11:31:59 +0200
Message-Id: <20230805093203.3988194-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v7 0/3] Add display support on the
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

Dario Binacchi (3):
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: support display on stm32f746-disco board

 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 35 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts  | 43 +++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi       | 10 ++++++
 3 files changed, 88 insertions(+)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
