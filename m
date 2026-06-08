Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J3cREiTQJmrakwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3E6571A0
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=X0FbSNhK;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B610C5F1D4;
	Mon,  8 Jun 2026 14:22:27 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C49FC58D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 14:22:26 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6914a658115so2908304a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2026 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780928546; x=1781533346;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8d17gntFj9cyOcdFrgQoUlzT+noL9BgQQAWn2N+JpH4=;
 b=X0FbSNhKOzPREO/fVuY8L2t+GnjvNpc8JVlq/tv5/sUdovf7C8mmY5Da386gWhjQEY
 DfMMiZIw0dZLBy5lJGVtSXb3reGKX1VVXg5YFcFB8REvaTAbrtlSDBCqQfYijvFeOdYw
 L8cAInanbPT+nIvByldI38OgV4hvuhQncsli0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780928546; x=1781533346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8d17gntFj9cyOcdFrgQoUlzT+noL9BgQQAWn2N+JpH4=;
 b=F5K+DF8za4BQjH7eAoocdbJSPcVthAOCglXuoSdkDqYQaAC5K6xrq85DIngB8umJIw
 1WqKZXKY+LdzW3YSbogFz4cjDEokqouF2HcSU1n7kZA9zo2NODeoxaDGirrNwi3ErGDt
 7Oer6nkIXpycrTjR+K2rgPW/FEKr7a4jLJ+ZYQ8Hw74Cm6mVFWdhmowapRCA3zVMUFeL
 D0v+aS7Y1ePedpRsv0FQUL49KnM/VcRu/xRo1kOpCdTKyYvc57umt/u+ctEJHvLMAOG9
 9/7lR7sw7HGmhS4x4e/xGc52KPPuUcHtpXj2o4riTY1QwL4IHUfbSzQzJ0GyRT4Lw3ql
 J2yQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/rjRiQ17A4rhSi3D2ajgDRZ4bjxVbUPiFPoPFnGGzs1NCa/TswSeK+acNZEmsiB1AVwDB3irciOnFE9w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzNORs+U0MUvDpKhT5QHPX2Goc3UziO9vWGob2Z+qWSenAZ0s0d
 VvyWFOFR8+Hg1WEFmx4rzkIEoe4ifJr3NvXLe8/ejBEmxSX+MGyRzkTgr45FnqQtWDU=
X-Gm-Gg: Acq92OH3gw/Kxy/2MZwWiPpxYGVJTUeioDLv9TWHLasgICWDzOOBUyhTFOq8vxNgz+b
 sSDJjA7HN6X+iV4NWUDpZvMIIYmzDRBOcetO9Br8FiTJ+Lrs1ntpJpTf+3PeLWEEJqEMim9JI29
 wrVTylEvSflx20naUqZLcAm2XbmWXjk8mHjygpXR6poRGgGBfyefxp7AQuD8bq9h5Ryfe8nadVT
 s2RbfMmuuHltVNhr0lc3IzyQPYMj1XI+DwgcdzSoeLU29CAdGZbBCcRquYnixnHaAU1tTyzJ/J4
 UFtcKyRnMzD7dYhiK3c0wc1RovyKiqPZ+ZjmjgNKAEQHJ4eIzWjV0Xmrej+A8+M8e1egT3qpnVs
 GoZxp34gokpOP2fT/X3DV9TqoW7hLP+LuwvIER/XtkwQAlFU3qbpMJNV+l+hmbvRldcdoie2zL3
 YsMc1MI4xc5hWpAwOe4FTndZTTZjMUiteGKtuh1VS5sU8YhIpqMdsTj8/GUuZt7vMANNS30GROp
 JT4k0yEpXF9o+5LalZg/ExSWyJawwVCKpr9wd9vu2J0UXVQUIM05Lsk1ZE=
X-Received: by 2002:a17:907:8b93:b0:bd5:2859:ed0a with SMTP id
 a640c23a62f3a-bf373306ce1mr774111666b.42.1780928545606; 
 Mon, 08 Jun 2026 07:22:25 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 07:22:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  8 Jun 2026 16:20:17 +0200
Message-ID: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 francesco.utel@engicam.com, Huang Shijie <shijie@os.amperecomputing.com>,
 domenico.acri@engicam.com, Eric Biggers <ebiggers@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, michael@amarulasolutions.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Sven Peter <sven@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com
Subject: [Linux-stm32] [PATCH v5 00/16] arm64: support Engicam
	MicroGEA-STM32MP257-RMM board
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:dario.binacchi@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:francesco.utel@engicam.com,m:shijie@os.amperecomputing.com,m:domenico.acri@engicam.com,m:ebiggers@kernel.org,m:geert@linux-m68k.org,m:michael@amarulasolutions.com,m:konrad.dybcio@oss.qualcomm.com,m:conor+dt@kernel.org,m:himanshu.bhavani@siliconsignals.io,m:sven@kernel.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:luca.weiss@fairphone.com,m:krzk+dt@kernel.org,m:linux-amarula@amarulasolutions.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,amarulasolutions.com,st-md-mailman.stormreply.com,kernel.org,engicam.com,os.amperecomputing.com,linux-m68k.org,siliconsignals.io,amd.com,lists.infradead.org,gmail.com,fairphone.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:mid,amarulasolutions.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7B3E6571A0

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Changes in v5:
- Add patch 2/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
- Add patch 3/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
- Increase slew-rate to <1> of ltdc pins to support the 27 MHz pixel clock
  and prevent timing violations.
- Change SDMMC2_CK pin bias from pull-up to bias-disable to avoid signal
  integrity issues on the clock line
- Fix touchscreen resolution to 480x854
- Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW

Changes in v4:
- Drop inclusion of stm32mp25xf.dtsi from stm32mp257-engicam-microgea.dtsi

Changes in v3:
- Add power-domains property in the SDMMC2 node.
- Drop patch "arm64: defconfig: cleanup the defconfig"

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"
- Add resets property to dts CAN node. Suggested by Sashiko.
- Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
  to avoid overriding the peripheral bus clock reference defined in the base
  SoC device tree. Suggested by Sashiko.
- Reference the existing labeled nodes directly at the root level using
  &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
  redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
- Drop the #clock-cells property from sai1a and remove the reference to sai1a from
  the clocks array in sai1b, relying strictly on the st,sync property to handle
  internal synchronization.

Dario Binacchi (16):
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
  arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
  arm64: dts: st: add SDMMC2 support on stm32mp25
  arm64: dts: st: add CAN1 support on stm32mp25
  arm64: dts: st: add i2c1 pins for stm32mp25
  arm64: dts: st: add ltdc pins for stm32mp25
  arm64: dts: st: add can1 pins for stm32mp25
  arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
  arm64: dts: st: add sai1 pins for stm32mp25
  arm64: dts: st: add sdmmc2 pins for stm32mp25
  arm64: dts: st: add spi1 pins for stm32mp25
  arm64: dts: st: add usart1 pins for stm32mp25
  arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
  arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: defconfig: enable configs for Engicam  MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  17 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  63 ++++
 arch/arm64/configs/defconfig                  |   4 +
 9 files changed, 756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
branch: stm32mp257d-microgea
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
