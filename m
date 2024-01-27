Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB0783EDE8
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jan 2024 16:28:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A718C6DD72;
	Sat, 27 Jan 2024 15:28:59 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45C73C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 15:28:57 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-55d314c1cb7so2583261a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 07:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706369337; x=1706974137;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9qOpvovQxTeO30aF5mISOGXWyu7pY+UB92+iH0umaM=;
 b=GannPvS35EB72usSe9+O4aS2xlyFSVCTBj1XHHEpPSIZms8dE/s1yx+gKlazvwRKHI
 PVdGOcrfbd/6t0u3ZQ4nlO7g/mze5VkSmm8EdLYZgRecsMkD42R6EB92HWl+GlQsakFD
 5M63oLB5IAd5FhWaomDGDM3FteNws8KlGHlAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706369337; x=1706974137;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9qOpvovQxTeO30aF5mISOGXWyu7pY+UB92+iH0umaM=;
 b=YZONFS2xCuANFBfg6IqJelvCmd1bxa6AXGqhOSh8WSAku2nC1zwR8iCLIRgLVK9Xps
 UnOjDJ5AvoqJXARfSYTL/AkFH1gaaEre5PeJFq7Y4BKlVSg9GbCf5RFiunqINe561zoz
 U3lKXDbzCmVqCDVHTHq9KXF9Ff0rVrx2Zj4qTVJ9PjsdvalK8c+Gl7NW/iZfJPouH2yG
 RMaLDy/5Ka2RoDPBDqkCY7bPHUHrrnxQusNKjA4S/ussvHU43nMANIe/8T9PqtgLBVkW
 8vslcnABChWV1EXaS6i5aWHZt5h/No560DaUCG/HT7bRi11wqxaMZq78etGeT1AlsqZx
 DDgA==
X-Gm-Message-State: AOJu0YzSN+7nS8LffVcZV5X72SIgvHsvpU8LTtT1IwPzPG4ccEAtJy5d
 oyZIkFiHMg9bfHJd+/Ly01QUTLLU5AZwMoNq0bJSmTGtO/0WvBygLY1joyp1+1Q=
X-Google-Smtp-Source: AGHT+IGmnblWXBThT/arNwzFsq5cI0uqWhD1N8OmGQ1IBaVswSAky7d8phVyRODGghXdbxr92kxmfw==
X-Received: by 2002:aa7:c418:0:b0:55e:b014:da62 with SMTP id
 j24-20020aa7c418000000b0055eb014da62mr1710923edq.16.1706369336400; 
 Sat, 27 Jan 2024 07:28:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-21-103-141.retail.telecomitalia.it. [79.21.103.141])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056402344500b0055974a2a2d4sm1745220edc.39.2024.01.27.07.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 07:28:56 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jan 2024 16:28:44 +0100
Message-ID: <20240127152853.65937-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Nyekjaer <sean@geanix.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v10 0/5] Add display support for
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
modifications to the nt35510 driver that have already been applied.

Changes in v10:
- Drop backlight. From a closer analysis of the schematics
  en.MB1225-F769I-B01_Schematic.pdf and en.mb1166-default-a09-schematic.pdf,
  it is noticed that the GPIO I14 is connected to an unmounted
  resistor (n/a), making the backlight functionality via GPIO unusable.
- Drop backlight references

Changes in v9:
- Drop 'interrupts' property to fix yaml checks
- Rename vcc_3v3 to to vcc-3v3
- Rename panel-dsi@0 to panel@0 to fix yaml warnings
- Change commit message
- Rename stm32f769-disco-mb1225-revb03-mb1166-reva09 to
  stm32f769-disco-mb1166-reva09

Changes in v8:
- Add Acked-by tag of Lee Jones
- Add Reviewed-by tag of Raphael Gallais-Pou
- Add Reviewed-by tag of Raphael Gallais-Pou
- Remove unit name from 'ltdc/port/endpoint@0' to fix the compiling
  warning:
  ../arch/arm/boot/dts/st/stm32f769-disco.dts:189.28-191.5: Warning
  (unit_address_vs_reg): /soc/display-controller@40016800/port/endpoint@0: node
  has a unit name, but no reg or ranges property
- Add Reviewed-by tag of Linus Walleij
- Add Reviewed-by tag of Raphael Gallais-Pou

Changes in v7:
- Replace .dts with .dtb in the Makefile

Changes in v6:
- Drop patches
  - [5/8] dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
  - [7/8] drm/panel: nt35510: move hardwired parameters to configuration
  - [8/8] drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK
  because applied by the maintainer Linus Walleij

Changes in v5:
- Replace GPIOD_ASIS with GPIOD_OUT_HIGH in the call to devm_gpiod_get_optional().

Changes in v2:
- Add Acked-by tag of Conor Dooley
- Change the status of panel_backlight node to "disabled"
- Delete backlight property from panel0 node.
- Re-write the patch [8/8] "drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK"
  in the same style as the original driver.

Dario Binacchi (5):
  dt-bindings: mfd: stm32f7: Add binding definition for DSI
  ARM: dts: stm32: add DSI support on stm32f769
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
  ARM: dts: stm32: add display support on stm32f769-disco
  ARM: dts: add stm32f769-disco-mb1166-reva09

 arch/arm/boot/dts/st/Makefile                 |  1 +
 .../dts/st/stm32f769-disco-mb1166-reva09.dts  | 13 ++++
 arch/arm/boot/dts/st/stm32f769-disco.dts      | 70 +++++++++++++++++--
 arch/arm/boot/dts/st/stm32f769.dtsi           | 20 ++++++
 include/dt-bindings/mfd/stm32f7-rcc.h         |  1 +
 5 files changed, 101 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
