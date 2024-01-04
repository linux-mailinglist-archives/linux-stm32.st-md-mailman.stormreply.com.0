Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD18823C9F
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 08:24:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AF45C6B476;
	Thu,  4 Jan 2024 07:24:15 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 139C9C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 07:24:13 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-555e07761acso266732a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jan 2024 23:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704353053; x=1704957853;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PUgVC7JEO7GhUBsHaMMn2sIj/0Ni7LYX/30T12HJpq8=;
 b=XBt71O1l63nKtqLfJQ7FSnKxqEuNPUTzw4oxnF6eVQXtkrxN3lMdZ9LdYFBsw4UXFH
 JQUJsXYiBhXL0b9AmmbCGZFt1nZC8Zm+2aWk2eZGmcXWGMfx5mtxYLulaJCrvho9ZvRb
 LLwKx4B9f+OHW+8o/S7ycpY8LCnCh056ERW5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704353053; x=1704957853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PUgVC7JEO7GhUBsHaMMn2sIj/0Ni7LYX/30T12HJpq8=;
 b=SrCJ5wQBmGPw9PM5u83wOALgc2OnOi0A8qt5kb4GaymBMFAeHx4wjF49ZBVt8+m7FF
 1pmHO77EstEIDWj46ui95rA/W8HTVSmGlDA/P2JlaEqckp83sx+HLawANxS4g3VYWuMN
 P+7HKQFeLkCGJ0lsOavIdkNYE5Hmc1vp3D1CmzvNYpU3eqQX3rmPpsoYpBqciC++4stQ
 giXpSVFDGkavY3GbH90iODIfbzR6qRrQmoWsnGaiehXtvQB3Q3UZ9BopO7APGeirM6F8
 dSZ2JCZ4/I5MIpnnke6PEZb12vPpgGpnjEnVIu9E6i86z1/ta6E4uHvOcvDZN/bl27I4
 rSIg==
X-Gm-Message-State: AOJu0Yx0bKWDG0RboLgG5mRJ48ZidAY7HXOK79JwC9tomGGhSH+fU1vs
 jIuw6Nx4YeC36jYZKA4Bj072Lm6NJGBdzQ==
X-Google-Smtp-Source: AGHT+IGmDyP/2rCvEVge4MJPNpo2+Gj+UXFPX8MUKMMpso0SylDp5k3+gnunyyZSiIr2eHvZUnp0ZQ==
X-Received: by 2002:a50:8e49:0:b0:553:ad79:b7d7 with SMTP id
 9-20020a508e49000000b00553ad79b7d7mr54053edx.93.1704353052879; 
 Wed, 03 Jan 2024 23:24:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056402000300b00553772c2968sm18530735edu.82.2024.01.03.23.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 23:24:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  4 Jan 2024 08:23:36 +0100
Message-ID: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 David Airlie <airlied@gmail.com>, Lee Jones <lee@kernel.org>,
 Sean Nyekjaer <sean@geanix.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com
Subject: [Linux-stm32] [PATCH v3 0/8] Add display support for
	stm32f769-disco board
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

The series adds display support for the stm32f769-disco board. It has been
tested on hardware revisions MB1225-B03 and MB1166-A09. This required
modifications to the nt35510 driver. As I do not have the Hydis HVA40WV1
display, it would be better if someone tested the driver in that
configuration.

Changes in v3:
- Use "enum" to have less code changed

Changes in v2:
- Add Acked-by tag of Conor Dooley
- Add a dash in front of each "items:"
- Change the status of panel_backlight node to "disabled"
- Delete backlight property from panel0 node.
- Re-write the patch [7/8] "drm/panel: nt35510: refactor panel initialization"
  in the same style as the original driver in order to maintain the same
  structure.
- Re-write the patch [8/8] "drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK"
  in the same style as the original driver.

Dario Binacchi (8):
  dt-bindings: mfd: stm32f7: Add binding definition for DSI
  ARM: dts: stm32: add DSI support on stm32f769
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
  ARM: dts: stm32: add display support on stm32f769-disco
  dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
  ARM: dts: add stm32f769-disco-mb1225-revb03-mb1166-reva09
  drm/panel: nt35510: move hardwired parameters to configuration
  drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK

 .../display/panel/novatek,nt35510.yaml        |   4 +-
 arch/arm/boot/dts/st/Makefile                 |   1 +
 ...f769-disco-mb1225-revb03-mb1166-reva09.dts |  18 +
 arch/arm/boot/dts/st/stm32f769-disco.dts      |  78 +++-
 arch/arm/boot/dts/st/stm32f769.dtsi           |  21 +
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 422 +++++++++++++++---
 include/dt-bindings/mfd/stm32f7-rcc.h         |   1 +
 7 files changed, 484 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
