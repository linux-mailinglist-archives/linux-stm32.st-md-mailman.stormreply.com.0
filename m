Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDmDGPWmGWruyAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 16:47:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB2F603E2B
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 16:47:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DBE3C8F296;
	Fri, 29 May 2026 14:47:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07C15C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 14:47:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso7923156f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780066035; x=1780670835;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uXAnr2ji1K1FMxfIa+2dWup2lSJTGHNXhn3K7ZsSAnw=;
 b=bhs3B8FiZ/fDDkjJWcEABlNea9PyoZQLpnaXK3+LW2Czwy0XQS7Mhw+BKClmhunsWI
 7MkmP2+Wqilh/bn8H2WKJhOcKz1D1Aa9wgvZHx5YBDylprFivpPHaDsGE1fZga0L++tE
 lTovG/mtU+ojNPdKf8RSJF0h1oxCLvFCs7Lyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780066035; x=1780670835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXAnr2ji1K1FMxfIa+2dWup2lSJTGHNXhn3K7ZsSAnw=;
 b=NW90zsOU8kfS0bp6P9SFyDDVQpMengsF8lxWrVUSBslPPhczZaH7xY7IGMI4bLHBti
 mr50HCqS427QikV3SQvwJCCgqpzWHhM8iRKtkp2y143faAASu2O5MLjo+WWlPkETj6xz
 7vfMzR6jzapRMiRZiUfqr9l7dOfjMpZo3Ece97Xbh54m+DLLRWh95VhsjPnIHY1fvbtk
 IYLv4Gz16e6oL5PMZKmZY7W1r1p0CzvVA7CwtBYazOELhStnmB/1O2RbbLslw2Cnq2N0
 JFQ26SeANRNEIIxtNo6n1F77gOAGBZgIimydUbqdOP15fNZYkO8UVX8eSjxyjujksRpc
 Kikw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9IbbFGchzHBXhJxJcWXzd1QYqpXkn83Ulc4nj+/yq1q8vIzXjAyS1CO99o791GjILttJOQ7wJb3EXn6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwTPCdH+FvEUO+1un8SklmNnUON+APxH3frsiU269e2rj89Qmsm
 WNBFWS/9uFLSmAV47JtNBMBwfO3MZLGwS2UdbKOtBR2+kCgV9qkHKJfhuw9us1EGmNk=
X-Gm-Gg: Acq92OGTg4UxzDNvwpNOgq20hD9IJ1/BiTf6+OfGqgxA75EwN4HCrAkL5iuUL88sT6C
 POPyNR/FiqJwRZRSOBpTUuKOUvCDKRUxNC63FM9PmZCS5+ZQbOvIWK98c/0HxEAo4xNmyUbOGH4
 aA+Ai3QUeMDQjRp6K0zXu1cjG9/GvMltbmQLcfWMx4IuosEoXA3LPrTxs9S/DoB+IAxv4xgwZ4P
 bQgN26jjVlHWXf48hBMaa5ASIMh/1xrypBHcdtjoHN4lzHBu2QFSlNWfVU9ct3ZZbJ3ZLBy0JdE
 aT8XCBroz6SpvOhD4HwYWL+fkmhnp4GpW+StNNRC9LrAG4e6hYDho3V9O5KY+73qLSCjuifOhkZ
 07KgClbyOeM511/GTcaE6On+AYOX/Rq+eNbjAUtSSDIt6COVagjzPRgF+pShHig4qYGympLkSaT
 pF8fHE9jqBI5g0WMe9bTK3XfjddZi+oyLJPwg6UILhAEuyjCRzbCP5/9Rby1H7n6xbbDz53xMJZ
 v+nX+NeDGOMetyav+zqcXTR3N/JaPrC0XmWqEjkbeGtzu1I99R7y9llj4k=
X-Received: by 2002:a05:600d:848a:b0:490:60cb:55f0 with SMTP id
 5b1f17b1804b1-4909c0aa2c7mr40837195e9.21.1780066035193; 
 Fri, 29 May 2026 07:47:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 07:47:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 May 2026 16:46:14 +0200
Message-ID: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 francesco.utel@engicam.com, domenico.acri@engicam.com,
 Eric Biggers <ebiggers@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 michael@amarulasolutions.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Sven Peter <sven@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com
Subject: [Linux-stm32] [PATCH v2 00/15] arm64: support Engicam
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
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:dario.binacchi@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:ebiggers@kernel.org,m:geert@linux-m68k.org,m:michael@amarulasolutions.com,m:konrad.dybcio@oss.qualcomm.com,m:conor+dt@kernel.org,m:arnd@arndb.de,m:himanshu.bhavani@siliconsignals.io,m:sven@kernel.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:luca.weiss@fairphone.com,m:krzk+dt@kernel.org,m:linux-amarula@amarulasolutions.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,amarulasolutions.com,st-md-mailman.stormreply.com,kernel.org,engicam.com,linux-m68k.org,arndb.de,siliconsignals.io,amd.com,lists.infradead.org,gmail.com,fairphone.com];
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
	NEURAL_HAM(-0.00)[-0.938];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: EFB2F603E2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Notes:
Following Arnd's guidance [1], patch 14/15 "arm64: defconfig: cleanup the
defconfig" is kept in this series purely for review purposes. Since a better
version of this change has already been merged via Krzysztof's cleanups,
this patch will be skipped once the review is complete.

[1] https://lore.kernel.org/all/3e23b0c6-6968-4c87-8d34-f44b8af1df82@app.fastmail.com/

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

Dario Binacchi (15):
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
  arm64: defconfig: cleanup the defconfig
  arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  15 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  64 ++++
 arch/arm64/configs/defconfig                  | 293 ++++++----------
 8 files changed, 861 insertions(+), 182 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
branch: stm32mp257d-microgea
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
