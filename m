Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C78294B7
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jan 2024 09:07:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 357BAC6DD73;
	Wed, 10 Jan 2024 08:07:47 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D891C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 08:07:46 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so436587666b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 00:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704874066; x=1705478866;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h3Y6BWXsqLaQ0CLc7SrBzZRmfLfgIq46r2dR5IOpQRs=;
 b=nhjSi/rwt9NPE5rmoTS2pFdYKm7fdFC/mecbQ3/Jh19eLo69eJG1z0xsco+VoKNfKc
 za6UKoBegJEhT+I1W7mymuY7+HjmtibA5kI4krMQMZnLYZCGZAKC8CjGc5kft8h36zeR
 sjGwt1Lb3JbuBbiKodIlRDd5++6VpTTcEKPgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704874066; x=1705478866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h3Y6BWXsqLaQ0CLc7SrBzZRmfLfgIq46r2dR5IOpQRs=;
 b=Vwgx3zUMJAi6ZrVKaS9l9PxjEMNLLhCy87syvKIxVvqo/G1dF4bVQkr0q6khS/UbN6
 8xgGHUeuABYcHU91VneH3AS2PIKKVBHVfeixkG1PrIUTTmTNlGzZolTRKPavspErmPBz
 l3ZxoE6pyufo5QF+WFkWpVXjQzWuQIs0g18p0Xgp+i8mZDKfmRqirtZOBUDQp81ODWdB
 r2v1vd6vO2Gh5MIj5m5ED+sYTjNSuKF67C4OBTLWf6RC/ybjf1lGXR1hMLOPAgQMbl7o
 oUiuVlCpqtmoFQTQ5Qx0pJmPAoygaZgdG1MmedK0WcIMl8KDG2Tx+Hyj2KUeTf11TIiO
 CAyg==
X-Gm-Message-State: AOJu0Yz4GuedXt6QTpf9CkPr0LUbcwabuuEthRgDvA1JfkPH4KjhVJc9
 ULKKT6C4xFBnpCkgItjuumBySK7H9V98Hg==
X-Google-Smtp-Source: AGHT+IGREAZqFdBVcLP2lAenqZju8JruDfO0VK9eFX5Zp4uw1S5396WnHZu3orvse5f79CSasDe7zg==
X-Received: by 2002:a17:906:f287:b0:a28:b7e1:e24b with SMTP id
 gu7-20020a170906f28700b00a28b7e1e24bmr256684ejb.162.1704874065745; 
 Wed, 10 Jan 2024 00:07:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-2-38-81.retail.telecomitalia.it. [87.2.38.81])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a1709061dcc00b00a2af672cdd8sm1833341ejh.161.2024.01.10.00.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 00:07:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 10 Jan 2024 09:05:46 +0100
Message-ID: <20240110080729.3238251-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Nyekjaer <sean@geanix.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Peter Rosin <peda@axentia.se>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/5] Add display support for
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
