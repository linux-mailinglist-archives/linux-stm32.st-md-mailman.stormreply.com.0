Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id butGFT6vUmpDSQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jul 2026 23:01:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73C742DDE
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jul 2026 23:01:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=nabladev.com header.s=dkim header.b=caKqo02X;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nabladev.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B00DC9AE52;
	Sat, 11 Jul 2026 21:01:49 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C9D9C7A835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jul 2026 21:01:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B0EDA11955F; Sat, 11 Jul 2026 23:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1783803706; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Rj799asYESt2ZmvriKsA91s4jrkLenTh+VOfuk6Qwy8=;
 b=caKqo02Xhwa5z3geI79f/1mpYhZ8RaxILEV+m24lrur9xhFIWkYGbtXT4N2ZDOi2WEihi1
 /eT3e4HNKMxb8p5u19XO0y0YQ/JCH8axaTWfEB+b8PWbIXHY7FgcNNg9qsjT880iVGupwj
 b7riLwpThRoOXlpF2ZaXBU+ZjKV8obL/lqBtQsyiD8DNlZLdbu5u7z6ej3EDqBZ8v0wQGE
 bkL9PvjjFUow6Gs9DNVVVMCTm44vKenFMxgC8GId2NH2UsYrUaT1woqq4Rf06cH6MLXhii
 gRqZGMOQfLjA3rlRIuOhhlfpB/3kE6cHXjC9mBdkXl5vu/+SrrS+q0a6AgZ0Zw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Date: Sat, 11 Jul 2026 22:59:29 +0200
Message-ID: <20260711210131.236025-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@nabladev.com>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: [Linux-stm32] [PATCH 00/10] arm64: dts: st: Add support for DH
	electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout
	Board and DHSBC
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
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marex@nabladev.com,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nabladev.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA73C742DDE
X-Spam: Yes

This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
STM32MP23xx SoC.

The SoM contains the following peripherals:
- STPMIC (power delivery)
- 4GiB LPDDR4 memory
- eMMC and SDIO WiFi module

The Breakout Board carrier board contains the following peripherals:
- USB-C peripheral port, power supply plug

The DHSBC carrier board contains the following peripherals:
- Two RGMII Ethernet ports
- MicroSD slot
- LVDS connector
- MIPI CSI2 connector
- USB-A Host port, USB-C power supply plug
- USB-C / DP port
- Expansion connector

Marek Vasut (10):
  dt-bindings: arm: stm32: Document STM32MP23xx/STM32MP25xx DHCOS SoM
    and Breakout Board and DHSBC
  dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
  arm64: dts: st: Fix SDMMC1 indent on stm32mp231
  arm64: dts: st: Fix SDMMC1 indent on stm32mp251
  arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp231
  arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp251
  arm64: dts: st: Add OMM node on stm32mp231
  arm64: dts: st: Add pinmux nodes for DH electronics
    STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
  arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx
    DHCOS SoM and Breakout Board and DHSBC
  MAINTAINERS: Add DH electronics DHCOS SoM entry and fix email address

 .../devicetree/bindings/arm/stm32/stm32.yaml  |  18 +
 .../bindings/gpio/gpio-pca95xx.yaml           |   3 +
 MAINTAINERS                                   |   3 +-
 arch/arm64/boot/dts/st/Makefile               |  10 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  86 ++-
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |   7 +
 .../boot/dts/st/stm32mp23xx-dhcos-bb.dts      |  15 +
 .../boot/dts/st/stm32mp23xx-dhcos-som.dtsi    |  51 ++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 564 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  32 +-
 ...mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso | 111 ++++
 .../boot/dts/st/stm32mp255c-dhcos-dhsbc.dts   | 189 ++++++
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |   7 +
 .../boot/dts/st/stm32mp25xx-dhcos-bb.dts      |  15 +
 .../boot/dts/st/stm32mp25xx-dhcos-som.dtsi    |  51 ++
 .../boot/dts/st/stm32mp2xxx-dhcos-som.dtsi    | 442 ++++++++++++++
 16 files changed, 1601 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi

---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com

-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
