Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B870482AD6F
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 12:31:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A335C6DD66;
	Thu, 11 Jan 2024 11:31:51 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A7DEC6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 11:31:49 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a27cd5850d6so559264366b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 03:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704972709; x=1705577509;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E3RgnmjR61D7s9CNo+AYUolzQugH4TGJWl8/1Xh6+YQ=;
 b=rTtNwOKAaR3blGL+vLly7QDTQLwfVfkm6l+wOIgRpiXxO3IctcGzgoyX3ieEySq/Nv
 4BNenwa2Ls48NiXt2qfmKoJWI8vxNdZQPagpZfYoF/60h8Uivfn545Oiqs4+yO/Lkthz
 jSeqgjzLLwzt60ePs8wiBm09GMe7MLDJtAZKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704972709; x=1705577509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E3RgnmjR61D7s9CNo+AYUolzQugH4TGJWl8/1Xh6+YQ=;
 b=hTRh+Lya0ZZ4VEMnsf+O8J1xQ3W06zIvfzGZJsshGRiWWe0PEzzlRDNW2++2otwSNS
 1Q3ZcVACGiHa1gEB1JMZ/ru5qM7JrzX5M4ZMMbHJslwmfh7eekCBZi68t50PHHzDHJ0S
 LK5BTVKjZ04MfPIORzHOGZ8eyFGJbBqjb5PiuYILyVDukrVZ/RLLduyjyqtakz63Wdzu
 YHiOgZAyzHJ2yzocHQ2UnRVd0pach6geED7gih/kgCjFbC+o9fJaGgSmqKBdaJjnYtd/
 8yFc9q026WUhed5lm32D7Uy991HRmtVBIyOlgCEQ4jN3+AXOFOCgk9W25A+0rtKtc/E3
 gzLQ==
X-Gm-Message-State: AOJu0Yw4M2nYPKQSX4J8XLSuEJNgKaksSCL72K2z4ZippaNGUvbpA0hA
 vRXPOWKHD9jwCChQBsBVHCJdutMtx/F/yA==
X-Google-Smtp-Source: AGHT+IGZ6q2rR+1ieqVBtWSdEMPS5oa96gFPgtNJnNkI/8J4MxZtb83opPPSS+JHqHoOpJzHU8MufA==
X-Received: by 2002:a17:907:9712:b0:a26:b524:226a with SMTP id
 jg18-20020a170907971200b00a26b524226amr652836ejc.40.1704972708978; 
 Thu, 11 Jan 2024 03:31:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 ([95.236.91.90]) by smtp.gmail.com with ESMTPSA id
 n3-20020a170906688300b00a26aa734349sm461565ejr.39.2024.01.11.03.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 03:31:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 11 Jan 2024 12:31:37 +0100
Message-ID: <20240111113146.16011-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Nyekjaer <sean@geanix.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 0/5] Add display support for
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
