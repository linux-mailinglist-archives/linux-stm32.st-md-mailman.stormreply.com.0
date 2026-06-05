Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QvocO8hsImohXAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 08:29:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE464580D
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 08:29:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=I8U5k6vI;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A54EFC8F273;
	Fri,  5 Jun 2026 06:29:28 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFA7EC8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 06:29:27 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45efa80e0afso1209149f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jun 2026 23:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780640967; x=1781245767;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
 b=I8U5k6vIYXUXaEiG2MOhFzLvfvUBM0E2kQxH0SWxbkYfd/o7EA49M7HiNT2BUSTCjQ
 k4aickAKEWie0uVgFwIXsQHwymLwdKDQCnn1GsDxXztwkZx4tKgx+QjWFq9KkijpOlnZ
 78Z8j3dIC2Nvwc13P5rHF4acpAPJzYCU5tYr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780640967; x=1781245767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
 b=fD8DNrvwEvpx13EdKXjKCJqCiSFSMRVUCE8L95JaJkClflxwi0bOKIEhn3veMvOpXE
 r3vbm2LcQp2UstiivlKrcHcMoV0bKEGYKM6l49gFXT2FJekNv9c7JYQa1KTT1aV8k42N
 Q72p/uJXb3iUTgn4GUo/WA/44bLxEX2kOd2SgHrD1dLhbhv/bgqARdxgmsDqYjfIkJTD
 e9vTnL5IRdcsPTuAlfl2V2lxIzOLcZcfIOkaVpbnd+19eJZApN1HwkFGbiqHaVfg3/0n
 o8Hv/uq3em2xHDtsbLPtnDaI0noJviZgZNWZItvhGDGQwNO6jA3vu3Bp3HKWX3WYqYOS
 wtYQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9U5wNwsZ034UW2Jhmi2+HPBqi1p/i6lIpQ45nnuUklHXQeuRLimdZTkUflgvh0+jwFJVmNYXZfvlLz/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxNgcKXud/36OdkEoREQBeoxc5zkGY6+LeA0Yf+7LD9rrpZm3hS
 a10ybGhw7TFkfkJm8aOUphylP7GGDNx0k5NaOROk9Zvz4adp1qi/WkC0V+weJySB1vE=
X-Gm-Gg: Acq92OGmMTturgq5XX9N8BtxdqqfoZnqRdbxgrdtB7GsYkkrHw5lIyCzipxtMro3XZ8
 BPMzpjVtF3OvRstMx2pWkOv41oF7uYAmL7BRTtZvRFZDE6q78gGqp3r3EuNPXiyseO3AJilZwjy
 TYQLZkU7BhLCWzDql5OXVu3rWwcpVHlyEhQBmNLCqbjTdVEUe/7FA3uWk/bQyJ4rJ2Aql8eMRH5
 doORACCCp60DO81seQawy7Bxl5DxKXuKgTRYxla0OcM1EQ18aP6wWQvuz32+v9cv1HdchTz2Ay3
 gYl3HC0VLRiLhs0HfdQKASxU16xC+NZB1UumfJdHnVcvtK1j7LEj8BOsYR4ahl/dB9rrQG//nm2
 a+Ve+M7FoxcF6CaRE5kTBXG/K4qAz66tt7ecop+NlIMZ61JKLocuHGK3qraqhNKL1NJ3S6XH5dz
 ELxRJ2Y3XL5kwBWvrhVORMoPKxtVQVsl3h66AarP3+Azq3YOrzKkRp4npts3bk8CbSmsaM6eqAH
 msrm4EymXCvfXzW5eXJ2FTTVYGPHxXWjF2kT21rfTXUIAlXkJdCw0OPKkTnhuzmPLVD1vIF717Y
 Erqri3yf/lb+BrjZ3sX1F0PyJnPoKhGI0Xu6y8m/sXvlEQ==
X-Received: by 2002:a05:600c:818c:b0:490:b0e1:2161 with SMTP id
 5b1f17b1804b1-490c25b39fdmr31776185e9.2.1780640967237; 
 Thu, 04 Jun 2026 23:29:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 23:29:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri,  5 Jun 2026 08:27:39 +0200
Message-ID: <20260605062900.368376-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 11/14] arm64: dts: st: add usart1 pins for
	stm32mp25
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:devicetree@vger.kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,amarulasolutions.com,vger.kernel.org,engicam.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:mid,amarulasolutions.com:from_mime,amarulasolutions.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5FE464580D

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 46c5197dcd63..a72c458b2c6e 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
