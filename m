Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKsKJN8iC2oxDwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:31:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE5E56ED5D
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:31:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEE8DC597BF;
	Mon, 18 May 2026 14:31:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C016EC58D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 14:31:57 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4585a116a4aso1923295f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1779114717; x=1779719517;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g4gGcghC8/VjxZsUokcHk3DMALbk4ZgwiZSR2n7JFnI=;
 b=bnmhX3dXupUAtBfH7Gsldzt2CEYLoQb9331nNE4CAHI0EDi1YIYI0JZ4BtKidu5V0y
 NLQBW5vEpiQ+DcY0Rgn8M4k4wduS6ESusWibqzXsoMiIwtj6BdxTX+rBIV3Ya1v3xoAh
 0F9n4RiUyLorMDMGMW3qVemN6xAa+fEfNWVZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779114717; x=1779719517;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g4gGcghC8/VjxZsUokcHk3DMALbk4ZgwiZSR2n7JFnI=;
 b=dwj9Ai6KzSzOvAYXteEwlNL1vGlMGJEG+M/BES4FqOWAPWcFWmuSjgms8LicxZQV3X
 d7MNpgkJJCHrStZRkRocNegaJyzFQbc2NiQRAMk8PXEkcAPEg0vaS3aysaTjTxg48x2E
 zsG9JP0MhGg3BkW9fA3evQXF7HGTUEtzsbZXAyf6aP65ZDBIE+zN4EAXwZ1HJumy4TcJ
 MnheigDTE8MYBIS9N29d6e6Hhtkhd25i+Ys2t2NiW8Uunmqipx2HckkLzY5Xl3qrrIyj
 WfMPdVGOc67mh6jqORZwfOwsHFot5VDRNgOvciewBmoGuhW/IqZ/ube9vp/rqjPvS54R
 7kSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dnInm7b1O//4SJqJq5pYP1L1Ih4Ooby1F3/2Og28BKpaFMGB0QwLJQMv52HOTNBNgroZZMEABrIvMIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw7vCunYsWZgqF8Q77PWXwZE+bvLFYjlTiFotIw615GuA/6Ik5H
 uQNdHWTRq8JYh1cnGzv12/7xiNnDBzehAfx1RLrmhm7njnp1s2LFkg2shwBWpQ6HsbU=
X-Gm-Gg: Acq92OG+9lhmLEATutboKoeEn1Cb2bTLcOhteFixfOwp/tNVDW8uunQn1giWXwp/SHE
 9c1HsibzspaLWrMzQhVNTYBzjGH37u4JFG7QjIj9ft3UEluGjW6bOW67f3N2b3nHg9RB2uD21UK
 RJq8371LS9Ix0OPjQlnIZE4p9sZg8uU22EzIx/HF+HVHyxJt9w73jg7wA8QPoGYDtvt4KwbW9vU
 WE4KNQIy6yX2+Ws7NLk6i7R9CMXTWYAl1erQdbYKE0xH9X0lOudvvLTnN6DGZtgkp0I88FkF4yu
 JXaGS6eVwpSJS7Fatn69ydGS7GnKqwf5SV/tjp/+TN7U5+8v0DEC3IV4yYwlkED2iOJKj8EDQMp
 FyfVvVJFQ5Y8ZRnwejAzl/V64VOoaaDYY1Sv2y3C63ND0Ng/DeFbpKb0eZuk0bWd5HD7mHmGkzX
 xWiiGoLMK2CGCQwfxOtPo+SEwNbP/qdaPzyqdR+d18Gucwdf4OV/qALIg1/eF7cbzFnQS5rx7Ps
 wCGI5bISwkebhz9BCvqbPxLrAUArQxt9gX+5RGVlf+wo9qp
X-Received: by 2002:a05:6000:2383:b0:449:9aee:4575 with SMTP id
 ffacd0b85a97d-45e5c5ccbf6mr24920170f8f.30.1779114717015; 
 Mon, 18 May 2026 07:31:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 07:31:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:31:15 +0200
Message-ID: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 francesco.utel@engicam.com, domenico.acri@engicam.com,
 Eric Biggers <ebiggers@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Sven Peter <sven@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com
Subject: [Linux-stm32] [PATCH 00/15] arm64: support Engicam
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
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,fairphone.com,st-md-mailman.stormreply.com,kernel.org,amarulasolutions.com,engicam.com,linux-m68k.org,vger.kernel.org,arndb.de,siliconsignals.io,amd.com,lists.infradead.org,gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:dario.binacchi@amarulasolutions.com,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:ebiggers@kernel.org,m:geert@linux-m68k.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:arnd@arndb.de,m:himanshu.bhavani@siliconsignals.io,m:sven@kernel.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-amarula@amarulasolutions.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 2AE5E56ED5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly and performs a
small cleanup to keep it consistent with the newly added configurations.


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
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  15 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 321 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  64 ++++
 arch/arm64/configs/defconfig                  | 293 ++++++----------
 8 files changed, 862 insertions(+), 182 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
branch: stm32mp257d-microgea
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
