Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1EB8278F7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 21:16:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90D32C6DD73;
	Mon,  8 Jan 2024 20:16:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA9C2C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 20:16:22 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-557ad92cabbso1550679a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 12:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704744982; x=1705349782;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=470HE3R0eHCn9Vp1B3I9DAfMXHgYPXc2oiMu7MIw+p8=;
 b=RDxN/COe9aCeGGZduTjbzwr2/HaDhMmgc4YJ1w4Knk54+4vA0QYck2AyDwlkCtXGwj
 tS3sY2SiVhTf9GlVXnvcdQ+HEZsD4D2BwlErjLfv650h+f5jM9o7O62Wf3fTpyJVenca
 Dm4PgKHVZqyAcD/Hu7u9iNciN73/fqBxHdy7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704744982; x=1705349782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=470HE3R0eHCn9Vp1B3I9DAfMXHgYPXc2oiMu7MIw+p8=;
 b=PZac6KAPQzNlS4qINVnIT4mrkG8/MB8GQi75BmKXDiyoFpK32Zhtgl7B3ZSv+9FwrM
 E0EuINENhZVoBr9Iiem5IbWXiEeJjnENS2zcNl8BQJHhGPprhlEZ5+5Fjz3oxucO6A4t
 n86jqww69vJHs9kIEbRVNkCPkK/QEagp3B6YTJbaxfq+cYq8HtTVf3Qvzj3/OA8uyq0+
 N1V1vrLvtoJrUUC2DBRjMn9EtNnzJ0thO1AceS3VI6FheVouHeDf9vrFzFtJNuOGp9SB
 7r2hY5E4V2Vk6nq4tIdJVLk2y1TV5kkfC4rWu1T8yh8KtX+6QJJotWPA7sXiLATWqp5/
 zI3Q==
X-Gm-Message-State: AOJu0YwXOgKbmnuSkusNiDArpL+/Sptl9T4xI+5Uw6J4029KAIZ6j+mN
 w9CJs9YgfQ95UONvojrv4olbl9wzqT8Swg==
X-Google-Smtp-Source: AGHT+IF2ZasPZ/p6zpGvkUuRiRHfFlzGs6nWLvVv8dVV9W/VrEMy2+3FKeFaVhCTnVVhkhLLqSbRDQ==
X-Received: by 2002:a50:8acb:0:b0:557:8ab7:40 with SMTP id
 k11-20020a508acb000000b005578ab70040mr1035120edk.168.1704744981995; 
 Mon, 08 Jan 2024 12:16:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-2-38-81.retail.telecomitalia.it. [87.2.38.81])
 by smtp.gmail.com with ESMTPSA id
 by26-20020a0564021b1a00b00555fd008741sm173699edb.95.2024.01.08.12.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 12:16:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  8 Jan 2024 21:15:45 +0100
Message-ID: <20240108201618.2798649-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 David Airlie <airlied@gmail.com>, Lee Jones <lee@kernel.org>,
 Sean Nyekjaer <sean@geanix.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andre Przywara <andre.przywara@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, Peter Rosin <peda@axentia.se>
Subject: [Linux-stm32] [PATCH v5 0/8] Add display support for
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

Changes in v5:
- Add Acked-by tag of Krzysztof Kozlowski
- Add Reviewed-by tag of Linus Walleij
- Replace NT35510_ROTATE_180_SETTING with NT35510_ROTATE_0_SETTING
- Add Reviewed-by tag of Linus Walleij
- Tested-by tag of Linus Walleij
- Replace GPIOD_ASIS with GPIOD_OUT_HIGH in the call to devm_gpiod_get_optional().

Changes in v4:
- Put the "enum" list in alphabetical order

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
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 424 +++++++++++++++---
 include/dt-bindings/mfd/stm32f7-rcc.h         |   1 +
 7 files changed, 485 insertions(+), 62 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
