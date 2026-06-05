Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z5P/G/e+ImpRdAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 14:20:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F28EF6480AC
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 14:20:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=gtBDN6YN;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A60B4C87ED6;
	Fri,  5 Jun 2026 12:20:06 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4247CC87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 12:20:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4601949975dso306185f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jun 2026 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780662004; x=1781266804;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j3xkv0HBViwXM4G89v0xA3hOcnT05xWI/0dQ5Wz6JfU=;
 b=gtBDN6YNWgpNIimC5JSjy0wVGBU4KQ78WzNOjyyZUaWp874j4yJlOIh+3bCCzjLYTw
 xJ14J2anYOoJAiGZcUwZL3ak5rhCcwURouUQG8B/PVP3nCidIseUMauoIOb6QnZCY3j7
 Ph7Do2uDrn953Yd61Ek8AT0EFsqzL5xRIXw9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780662004; x=1781266804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3xkv0HBViwXM4G89v0xA3hOcnT05xWI/0dQ5Wz6JfU=;
 b=N8ii2poMiTnkwh6tgk89khuWHie6IvHWPdPEZw986n5oaDXe1UDcnHu9oZfpm6uTqn
 fs5mrazH5NLeY898VElT7RKlW2ecJZGLtHwWsQRBRg/+TAwSZAXDOX5Zmw0gca0ZE+oK
 pGPl/GS0nXFmyz9XHEa3cTJCOtQCsyJNnPc14HBPoMKTFjeyzj7xYs6ZdzTmN9NSQUQ8
 oFJM5JQ+vi+7pBz1qhHfsBtnnKREQoL1dBpWMsCyRTIPtbkKw9dpD5k7bpJnFqMwBYjH
 f4adICy6Tj03WRZ+Vrjc/qPxf+msE40VsNaJeuTSfW31QDrdhbEEWCwFGNh86LCPIJ/R
 c+cA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9NuPDD/XYkTGwV2rzSxWc6Xb+YcWCk0Fm/4etJQMqsu+95VXGqa1zMrIhjGwtiQFTj4xJgJjQr2Av1Pw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwC9kMEMc4G0JZ7vm9r5AHjpYKQe/wtdSs0cU3xWxdnQGiXx8Jh
 UIdWU0rGTVz2pG4oa2ZezJ9C9XDiJbvlo2ngpMdvC1vztrsqYcVaUNuionynoxgyndY=
X-Gm-Gg: Acq92OEyEzNyvTiB/6b/s8O2o0WrnFjc+tDTtr8wBCQso3YnZvGsngt3n9gKxg/d0GP
 XBfr1BC1pY+N5UYJMo/VU6uzKuCA/lBWFAjs9lNyzN/h6Lf4/QNMfbm4wUUYCbJyDr0D58Px7HU
 /lLnnqXYder4HcHhwpqE2XVL+fzxg2DsqGQARIjzd8FUSkJyZ/ECF4YX3JH+aFhZ73J/txjFbrT
 99bPLPK77bSeuah0q2vVKPMEM0sDi2IjzaExNUSEfspII2TowfwPlaG07jtmqdBsNhWvnwd0KOY
 N+6R9UA9KBiALhs72cnHXITwccVZCzIpNKmvu0RHz1lIhy+18IMggEobEANo8++TNxx3m5q9s30
 r2PpKyLy5E7gFIrqPAcZvXCrSBSl/l5qDl0ZXjNbKK00L69EykEf5HY0Rj84YtitCl2tyPSEljC
 9C1spidI8iwJ3yN24QZUtzSTysHiXzE0sdSZ0ZT9Jx/QVvs42PQOt+z6bB/FUDItR34Juibgt6z
 u3ZluUxGjR/W+ukap1pZ0lxiMSm0KX8N13TmqjmjoXdzedLK6TO+2jDG7uWgmgNHn8iCnrQxgg+
 eY6a7CzDx86YyXxoozovA1dXm2SxpeBWW7Q=
X-Received: by 2002:a05:6000:41d5:b0:460:3210:b6e9 with SMTP id
 ffacd0b85a97d-4603210b750mr4636959f8f.41.1780662004574; 
 Fri, 05 Jun 2026 05:20:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:20:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri,  5 Jun 2026 14:18:11 +0200
Message-ID: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 francesco.utel@engicam.com, domenico.acri@engicam.com,
 Eric Biggers <ebiggers@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 michael@amarulasolutions.com, Huang Shijie <shijie@os.amperecomputing.com>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Sven Peter <sven@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com
Subject: [Linux-stm32] [PATCH v4 00/14] arm64: support Engicam
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:dario.binacchi@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:ebiggers@kernel.org,m:geert@linux-m68k.org,m:michael@amarulasolutions.com,m:shijie@os.amperecomputing.com,m:conor+dt@kernel.org,m:arnd@arndb.de,m:himanshu.bhavani@siliconsignals.io,m:sven@kernel.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:luca.weiss@fairphone.com,m:krzk+dt@kernel.org,m:linux-amarula@amarulasolutions.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,amarulasolutions.com,st-md-mailman.stormreply.com,kernel.org,engicam.com,linux-m68k.org,os.amperecomputing.com,arndb.de,siliconsignals.io,amd.com,lists.infradead.org,gmail.com,fairphone.com];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F28EF6480AC

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

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

Dario Binacchi (14):
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
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
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  16 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  63 ++++
 arch/arm64/configs/defconfig                  |   4 +
 8 files changed, 754 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: ddd664bbff63e09e7a7f9acae9c43605d4cf185f
branch: stm32mp257d-microgea
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
