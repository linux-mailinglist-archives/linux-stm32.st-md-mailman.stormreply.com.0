Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D6C82C20D
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jan 2024 15:49:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D6FAC6DD78;
	Fri, 12 Jan 2024 14:49:09 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37B76C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 14:49:08 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so787750466b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 06:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705070947; x=1705675747;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lhyOt+Bt0LSOKZrhQ3fGQqwCGnFrbZHK2Y4XkjmkxSE=;
 b=jMPINVWaOUUoQZNv2DjHUp1ksYoo8ESZthn43DMH1A7xsoaiNdLdiT8af9/rgY2BzK
 cbDF4ZHDjO3VHxQhbBVCyXvnkrtHjU9wyJPhpj5/pMqx3RZtWTEHq0BiIrC/79m8IZq3
 yTpdfTJ3ARa8YeO9nCglH1q+eEvnXebZyqV+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705070947; x=1705675747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lhyOt+Bt0LSOKZrhQ3fGQqwCGnFrbZHK2Y4XkjmkxSE=;
 b=Sg4upWV/EwFyeMzNulSWCmcZwE8FWTa3KqMxa59VQCx6hNNBLtFf0MWknEsRp0ZW25
 O3qX/pbp83774LalOBu+kBS4HwZIHFgyRnxAsejAbUdYcrdQXeVEvZ/N6eOe6jqXVWDj
 NCVmg6Bf5BMQNpe6Z5yzTgcnIlI/4DZiEhraLxNUg5aD1cFwIFAA/chOIfbdtguQ9Sgm
 9m1pvbQK2kYKs3MRhzCWxyycK1bociomRueCXG459A1lhXBcJreEwVtfTwvhfnKXoxoK
 5OdaI8rTCh8nmi4o1UGI9BBADZSfLYax5AW4Je01nh3zS9rNo8IQS6Wl+jzbIsf+7h5E
 JyPA==
X-Gm-Message-State: AOJu0Yw+QTuCeHaXrJ8nSC7NuhtM+D4lH8BP5AsbqzVNmu5jupd3Q/jw
 RQJkSeE2beJiy5AdXShnOtZi9Ct7bywnVA==
X-Google-Smtp-Source: AGHT+IEcoMP8G3JKyPd+n/LEP4GOB4o84UQJ6vZGIcbLjNhI1SJbr0135Gjp9TJdkgu13OEPA8g9jg==
X-Received: by 2002:a17:906:7145:b0:a29:8b1d:7c84 with SMTP id
 z5-20020a170906714500b00a298b1d7c84mr381653ejj.53.1705070947628; 
 Fri, 12 Jan 2024 06:49:07 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 ([95.236.91.90]) by smtp.gmail.com with ESMTPSA id
 y11-20020a170906524b00b00a233515c39esm1869372ejm.67.2024.01.12.06.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:49:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 12 Jan 2024 15:48:20 +0100
Message-ID: <20240112144902.40044-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Baruch Siach <baruch@tkos.co.il>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Nyekjaer <sean@geanix.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Peter Rosin <peda@axentia.se>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 0/5] Add display support for
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
  ARM: dts: add stm32f769-disco-mb1225-revb03-mb1166-reva09

 arch/arm/boot/dts/st/Makefile                 |  1 +
 ...f769-disco-mb1225-revb03-mb1166-reva09.dts | 18 +++++
 arch/arm/boot/dts/st/stm32f769-disco.dts      | 78 ++++++++++++++++++-
 arch/arm/boot/dts/st/stm32f769.dtsi           | 21 +++++
 include/dt-bindings/mfd/stm32f7-rcc.h         |  1 +
 5 files changed, 115 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
