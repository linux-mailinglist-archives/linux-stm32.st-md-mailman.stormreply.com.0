Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SqEXJs+LQ2ojbAoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 11:26:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B16E2233
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 11:26:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=MqT7gQvT;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C96C4C8F261;
	Tue, 30 Jun 2026 09:26:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3FACC0A472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 09:26:37 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-472a14c9965so1942044f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1782811597; x=1783416397;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PY4raSb+03Q151+o910Ev5GEEhs0CuyMwWR2MvgczUQ=;
 b=MqT7gQvTKtNhBocPVt5Y+cQhK28Na9zqKkrGkMCcOPC8aFdqOnI7t1M7dTwIlCmqI3
 LUNpO73atKm9hRhjcmIUyaVHzUS6mW3Yegu/ShEaU7ViJd6LKkLGtLLaNlLqembjkXfz
 Oe3RKUxaZlYf3/3g3f89W/Eiotj8RAZBV5qFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782811597; x=1783416397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PY4raSb+03Q151+o910Ev5GEEhs0CuyMwWR2MvgczUQ=;
 b=TG2GtaM0vOFPDAlUw8JJIKwFY/x3N+yu736jYwqqoJOTv5ecv02SgWQMNst8F0oqS/
 hz1epJlD92nSvgOLy/ZgclC0kRXFXIU1ptwSr97tVxlKoWLz9TW9XyT7zxApnla7GzHj
 yjCsGtSkPTBDgv8Tlhi29N/YU6yX65UotZAWkJKtp5WW1zpVAu27tzABIUjgSU93AYCl
 oHg4TLVxZ5xaTEzIUuLKyfMytoyP414oBhtSB0Ti1Ahqrsjaz+YNy8Wa8aZVRRyhetWI
 uvmONjaNBViqcrhS4pOS6zaRsrOGqDPh4nfljHj4YziL4bAjpDhqUAGSEoXi5mfTxMtM
 ra4g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrzqJIYI4SSCXbjYhUOqA3WsmuFizUJXlW4aj0dqj/jayFpWVhdPxJ5i/111vTYq/blcLZaXw51FGbYVA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzNUfF+NbzHdTxeEwaUX6LVOHh87oHhL130NCSOUs/o/+pHTKo3
 qb/7hw21RFOcRHPKCYewtQMVJKcI4/Ad9a4bSL72ZYbHQMcwhz1m1TyHNjB4t4yvKo8=
X-Gm-Gg: AfdE7cmgFEIdAzq1KyxXZaN7OZovmhj5WhA4k1Td21AVaoSxYMeY0sO7/9PJ5aeMf0n
 ssHUqpwJRkkFn5Lm9ImVB9wMVro0q4d7sWs9xkDnKaSH99h8xCRtPVeI12fosPa+UEqmhHcW+Hb
 4y7uqLBc4S2eiW4YMhx4PRyt4ulchdJHeUBTlLHWsz+tkJqbllFdT3b62YTYFs7DZcDYk79oytR
 5MAuQ5p63iHODa3/BmNkTPBMOpnhv6OLPzYaKXNMKwa0vZuGeZWfRDFQO1WbI7txpsQA97BI0R7
 yTioWzrys0yzKngXooj4UWTG7jkvCiD7pKvb0iUEpQQle98N0WRlq5PG0MyAG0uazpMhMIQ5kOb
 BDaMMupER/AT3XzGS4GKte4mliBcC3F4xJmks92m3+qY9hpNJYViz5GR88viyT3QOqbrBp85k5j
 XNDUmWxN02/31wPdYnQ34AvRyMqJHj98lEfUh9sc2jrDqy/4P15LqwG16KFWEE4/2rCm/IqkSO+
 b8cwXd2Ig3fJnhNo6SRk+K1Huyc74Pa4Vr5bcjiSFk4IsPP+vdJvi27EgAEb9ofeuzq0vFuJm22
 GikiYXxK/1lI4w==
X-Received: by 2002:a05:6000:298e:10b0:470:13e1:9904 with SMTP id
 ffacd0b85a97d-47550ac1013mr2447885f8f.14.1782811597042; 
 Tue, 30 Jun 2026 02:26:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 02:26:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 30 Jun 2026 11:24:29 +0200
Message-ID: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 francesco.utel@engicam.com, domenico.acri@engicam.com,
 Eric Biggers <ebiggers@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 michael@amarulasolutions.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Sven Peter <sven@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com
Subject: [Linux-stm32] [PATCH v6 00/16] arm64: support Engicam
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dario.binacchi@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:ebiggers@kernel.org,m:geert@linux-m68k.org,m:michael@amarulasolutions.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:arnd@arndb.de,m:himanshu.bhavani@siliconsignals.io,m:sven@kernel.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mcoquelin.stm32@gmail.com,m:luca.weiss@fairphone.com,m:krzk+dt@kernel.org,m:linux-amarula@amarulasolutions.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[amarulasolutions.com,st-md-mailman.stormreply.com,kernel.org,engicam.com,linux-m68k.org,vger.kernel.org,arndb.de,siliconsignals.io,amd.com,lists.infradead.org,oss.qualcomm.com,gmail.com,fairphone.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:mid,amarulasolutions.com:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 293B16E2233

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Changes in v6:
- Update arch/arm64/configs/defconfig to match the current upstream defconfig
  after merge window changes (no functional changes).

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

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
branch: stm32mp257d-microgea
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
