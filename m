Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EDC83A7E9
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 12:33:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECA68C6DD6C;
	Wed, 24 Jan 2024 11:33:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 882B0C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 11:33:41 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33931b38b65so3187039f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 03:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706096021; x=1706700821;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H+jxNLfboUJgS24Fil1mSyDf7IcRgIBmJ/Q7aVOhf9s=;
 b=jbdEt5ipC7ed00tCSDXJNJCs+p5AevXWTElC0y89at4sM8t0awZb4VHRTR8crMIlDk
 AKc/PtH+aQsP7cizSpXUlQn4FZsIK02pJiCDLD9CfBp04EgvUvZJZU3RMabMoYxjbr3M
 gpefx3NFvdm+a3GukWD4ixtFWOBzncF/juiYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706096021; x=1706700821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H+jxNLfboUJgS24Fil1mSyDf7IcRgIBmJ/Q7aVOhf9s=;
 b=Q/oCgVyhxwCH8zAy63fGMYit41gEg3Rl0ASU2n9kgvuuNBV06mTkMNdqB302rDIVFT
 OGcrnuPyMopXIzcjtWevi3Y2N7dWEx8WIlfW7c5pq7TB591NUkd+YgO48x/EXyVUvR7m
 7Timivtew2nlTxYr62+DVFD0Yv89gVMrOqbaUDdYwvyMt2HVUo1GWS+ZCuDXUGYXlzbD
 ZlH5AipgBktJ8gP9IHvSHgqO+/6OB5GutbL6FF6D9536dzajj7oq4ruFSyX85DZZ/mlT
 WFwX4dw9OL5TyV4wqLmlufZWLhUgq69xAaW2VbiGSi2jfkOptfQIjuX9/0se78nosJ+8
 OOVg==
X-Gm-Message-State: AOJu0YykC9DClPs2+E/R9pxTzmvQ3p+e8DjpfPgUSQUxoxVLq+D5AXKp
 iQDPhvZHUlF9noavSeTDt17IeuL9xTcS3mN9jIsf6BiQyyVgTsUBkr5zLocBo+Q=
X-Google-Smtp-Source: AGHT+IGsi6zH6IUz8z0tq2uHsiTrjL5ql/WTqEp7LHqPlZhTSuwXWHOLP3XXNdN8IqGfAkuOinyaSQ==
X-Received: by 2002:adf:f0d2:0:b0:337:adfb:bed7 with SMTP id
 x18-20020adff0d2000000b00337adfbbed7mr208625wro.117.1706096020928; 
 Wed, 24 Jan 2024 03:33:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. (mob-5-90-60-192.net.vodafone.it.
 [5.90.60.192]) by smtp.gmail.com with ESMTPSA id
 i18-20020adffdd2000000b003393249d5dbsm8447950wrs.4.2024.01.24.03.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 03:33:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 24 Jan 2024 12:33:09 +0100
Message-ID: <20240124113336.658198-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Sean Nyekjaer <sean@geanix.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 0/5] Add display support for
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
 .../dts/st/stm32f769-disco-mb1166-reva09.dts  | 18 +++++
 arch/arm/boot/dts/st/stm32f769-disco.dts      | 78 ++++++++++++++++++-
 arch/arm/boot/dts/st/stm32f769.dtsi           | 20 +++++
 include/dt-bindings/mfd/stm32f7-rcc.h         |  1 +
 5 files changed, 114 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
