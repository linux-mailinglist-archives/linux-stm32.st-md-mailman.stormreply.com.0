Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4swNHrRsImoLXAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 08:29:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B856457D6
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 08:29:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=pt1ytC3V;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3148C8F272;
	Fri,  5 Jun 2026 06:29:07 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 544A3C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 06:29:06 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4601949975dso205362f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jun 2026 23:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780640946; x=1781245746;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4lejUpnv31Ki2j4Ud4YtaN/+X332KUHa0P0BjhrqFno=;
 b=pt1ytC3V+kd9MeQNSpprpzSa1jIymYzx0crfEdi5TuWhIbKrakibq6p6ibS5gxtMBp
 vxvsDty+lT1IgeK+CPxLeySdX3cRqzmkzoauhVaA2sX98K1BLTK3+8km+QlT9r8AuNRV
 qOpz4Nr4bcqCxRNx7m4WIVYJbpZJb6Ccwg33k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780640946; x=1781245746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lejUpnv31Ki2j4Ud4YtaN/+X332KUHa0P0BjhrqFno=;
 b=fmNQ6MMqbUnRdpS4nnNuQKaPhu1NtyPzqBVxzWYtyU5QrTUX93TQCsWt+Jm/x8sBrP
 JGcU15g12sGFIKrwNtx3EiYKoEYlLSNfAbOdHP4Ejhl8SwlfyNSEJZ/SP/1caeOXsprQ
 vDZg9N7azrrmxUiCU5em+DZKPM8cNayTGo/Ef+F753ciY6ketRf9LquVbofsTwihIDm2
 vMCZVnddJ01PDq4EG7x1Smw4IPRHxijfIQCX/LLFVNarwQqeqt56zER3mXjQtNpOlW7y
 fCP3NAmyTsQdgQQLGMmjoAV5irAqhPwUno8Zu28Qbr7e40fg5l/hGuQ4RUX8y0Kbt4Li
 oPiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8KCqqvIjJtBwKuGuOTg8FSRKzBaPRXGuQRaR8vs55Dok0XwqyrsorqaCzOTBDsrYm/C9uUj7meQONlgA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwHwtRMczkK1Yx+mZzVy4iyx8hpHEZEHG7iyFfkgorldajSbano
 HRSWay9PjxjZKvZuFEcxIFdeKzecg+u/L/JFYzVTXUabjfcCBWHqzagLrzc2r/Uk1cY=
X-Gm-Gg: Acq92OH/OOkR/NrLoCnEVdWdjK1NUGWk2cUQvYJGiOF8k2o/YG8wQvu4HLjhU31iTWB
 e4J/t+5YJTOOw+rl7ZoTDoLZ99rIx53H+h2SvedHT9v24A6dgBg5cL+FAvocHjjVuVWgn3cTrTI
 JxNB1+sZiX+kQtlr7AkeX+uMF1c4kIZJ3WnElm/JtfB0OHZC91FFT0TH9zPCpXqrw4e7rNIu9eB
 jX73Kaywktdd1yNy4vPzurW8ifmnFsD1MO3KX7F5SNFuQJ1WXqdIAJyELKw8w6z9+U1JPI8/30/
 /OK8g+aqwKiGKUyYdsLCQn6DESEvnCyKCPuxR5ncR8IGDBFTAmVfyYZtEGAFKB3YfCP6m8KXFLQ
 sABWWdiYatJ0EQtUDfG+0uNkzVrHK11XpGGtgS+sJqGDGZPVKGVpflqPOv/4mIfKWm8FvYZpPtl
 xWLMvqcOY9s6nYT6k8oURRRcz/LIBA2sMl8S/gu/Hu3FI7GuSlppUZEMC7f5qqcMmBscHl0gmDm
 un3fBSDPZMJUVSDYCzPJq5zF7bzSp8ZZCG89U8MscKLqLfs2iYr8Q6qXHb60ctcMbk+IalpE1ik
 hJ61V1VkbWwhSkcfNYs0URIfs2AfEVUZSlE=
X-Received: by 2002:a05:6000:298e:10b0:45e:93ac:769e with SMTP id
 ffacd0b85a97d-460302dc502mr2224770f8f.6.1780640945279; 
 Thu, 04 Jun 2026 23:29:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 23:29:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri,  5 Jun 2026 08:27:28 +0200
Message-ID: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Eric Biggers <ebiggers@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, michael@amarulasolutions.com,
 Huang Shijie <shijie@os.amperecomputing.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Sven Peter <sven@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com
Subject: [Linux-stm32] [PATCH v3 00/14] arm64: support Engicam
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:dario.binacchi@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:florian.fainelli@broadcom.com,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:ebiggers@kernel.org,m:geert@linux-m68k.org,m:michael@amarulasolutions.com,m:shijie@os.amperecomputing.com,m:conor+dt@kernel.org,m:himanshu.bhavani@siliconsignals.io,m:sven@kernel.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:luca.weiss@fairphone.com,m:krzk+dt@kernel.org,m:linux-amarula@amarulasolutions.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
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
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,amarulasolutions.com,st-md-mailman.stormreply.com,kernel.org,broadcom.com,engicam.com,linux-m68k.org,os.amperecomputing.com,siliconsignals.io,amd.com,lists.infradead.org,gmail.com,fairphone.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,amarulasolutions.com:from_mime,amarulasolutions.com:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16B856457D6

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

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
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  64 ++++
 arch/arm64/configs/defconfig                  |   4 +
 8 files changed, 755 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
branch: stm32mp257d-microgea-v3
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
