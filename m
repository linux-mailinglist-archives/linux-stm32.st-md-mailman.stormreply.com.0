Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9B581FFC2
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Dec 2023 14:52:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93D3FC6B45E;
	Fri, 29 Dec 2023 13:52:20 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2E3CC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Dec 2023 13:52:19 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-554e902064aso4004658a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Dec 2023 05:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703857939; x=1704462739;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MzUGxEaP1+NpXvTfTtwZMhBYJcrSPGpvA0YzGDUtLvw=;
 b=VVoTbK2yJAGCQyB0hmD3ykzyHZJ4RHkoTkvvdYQW8YxJ3YjP508fSsJ9Uwur9NqxdG
 ZRg+93knzy0pYlH6U5PdnuGnxdJwh5EX99XV27QAnp3GdubPDazJQDmrkCp48r2E4lB3
 lw44PsimcpgRvY1uSodf1Z3llPm9QDxHz74K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703857939; x=1704462739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MzUGxEaP1+NpXvTfTtwZMhBYJcrSPGpvA0YzGDUtLvw=;
 b=gCz80yuQXD+DKq2i/80Df9GTV7P7fQOmk94ExhIC2sQSOeV3xrm0/j5nAX5rUDOdWf
 vxBbckbop89fM1dwnEhwy/aXAiIowi5dmLjYrH0R0ut+Na9y3HdUg0rruVHdSF6gr9cZ
 U1brTWoJMFzXfeLuLVc3dYXfd1BYeCFKJyL8cCNM+uFaEPVSxnLtMThrPr6QSzhGR4+F
 niarVNWkRBDq8brBlFGeiKS/77IKN+WvGzMDnGI1eg58piS3VRUxoQ5/XUpRT7iXurAB
 W8lghp7h2sYTVGTd/stHyj5kNuSnqBLQYfYW3fSKAFTpjtXoITrT95J/L4/EB4B7eRef
 2RwQ==
X-Gm-Message-State: AOJu0YwY+wCRVdIT+kb8XwpoKO6X2YR3diEaZPApPnZZ96Dx2QTMHRnm
 fs9+v4UrJYRbYSI0XBVlB6CslPQG3uyPfg==
X-Google-Smtp-Source: AGHT+IGKAnJQHr73ga51Hv9Dt4zjqRc48HnDDCm3n7scTC1Qqv8aUw24GfpouEj3L2DFYiFoIwwAnw==
X-Received: by 2002:a50:cd97:0:b0:554:5192:5bdf with SMTP id
 p23-20020a50cd97000000b0055451925bdfmr6826417edi.43.1703857939105; 
 Fri, 29 Dec 2023 05:52:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-49-57-70.retail.telecomitalia.it. [79.49.57.70])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c710000000b00553b243b1a8sm11019160edq.92.2023.12.29.05.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 05:52:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 Dec 2023 14:51:15 +0100
Message-ID: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org,
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
 linux-amarula@amarulasolutions.com
Subject: [Linux-stm32] [PATCH 0/8] Add display support for stm32f769-disco
	board
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


Dario Binacchi (8):
  dt-bindings: mfd: stm32f7: Add binding definition for DSI
  ARM: dts: stm32: add DSI support on stm32f769
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
  ARM: dts: stm32: add display support on stm32f769-disco
  dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
  ARM: dts: add stm32f769-disco-mb1225-revb03-mb1166-reva09
  drm/panel: nt35510: refactor panel initialization
  drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK

 .../display/panel/novatek,nt35510.yaml        |  20 +-
 arch/arm/boot/dts/st/Makefile                 |   1 +
 ...f769-disco-mb1225-revb03-mb1166-reva09.dts |  13 +
 arch/arm/boot/dts/st/stm32f769-disco.dts      |  78 +-
 arch/arm/boot/dts/st/stm32f769.dtsi           |  21 +
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 872 +++++-------------
 include/dt-bindings/mfd/stm32f7-rcc.h         |   1 +
 7 files changed, 362 insertions(+), 644 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
