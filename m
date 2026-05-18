Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB6nCPQiC2oxDwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:32:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE9656EDB8
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:32:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90B0AC5F1CF;
	Mon, 18 May 2026 14:32:19 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D622BC5F1C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 14:32:18 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-44509921fbcso1394473f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1779114738; x=1779719538;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+2fG1k6iz5J9vZ3VHDwkeyqO1iLOvyLGZ3RtktWg+M=;
 b=qBfAyg4zYQOkZtPhBKErJJSLCm9WHU4Up6jNCJNlQlOqdR+/9dLLjKbEdOdac8Wnug
 3phu66/sR6ExAA/07DTYhqvX+odA78uUbr/6JFr2i/MPDKJViF08ohzArqlFCLlKsIbg
 hwSYtkdvRQ2KkgnVwXrPVtZ2LhXOK4Si8XUds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779114738; x=1779719538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M+2fG1k6iz5J9vZ3VHDwkeyqO1iLOvyLGZ3RtktWg+M=;
 b=cBsucubSkWvlMuNpen5BdU9GXgW5/DKfyi6sn9CoaP9+SAya9nU/Sybfyy7OO28tIA
 q+WKXd8g0KfYoh6YOPjbA1z77LJ/Elq+m/4DLuvG1knhGJpblQRwDIpV2vcjSWUZ4QcM
 TWW+mm4R7bh/4x0Hb0ZWhc7UgN1qFsG1fRFilRsaet81u035sVFgo9mw6v0ApLDqQcss
 mVg1QnAvXB0aDv35HpIz8hUTat/9aausGb5fZ0FFmFlDJtSW5zwEZQhKQtA9R1ixW4P5
 y5/xxNWrnTb1gMGriH8SUvsE7ussDZQyGc0iS5lGzduvvGu/KlW5kALy2eZU2eaZ63U0
 oOWw==
X-Forwarded-Encrypted: i=1;
 AFNElJ//G5Hx1+NJ+tXLRExdrA661lvKIp5TQKb7IpkSeIoysHVdpyKJ4ege7ip9t2KrUAxfxZSme7j5pP7e0w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy7T4OR4z2JUPYZfx/hXYbLFPdHLvViulmdaHxueqGLMhbB2nGX
 ZfjiM9vLfF56Ve9hF05VNzEeWKD2uj11R95dqHy9ArwE/EmoRd4uXftiSefrYRaRzik=
X-Gm-Gg: Acq92OFAjUn6hhqssktRES0NphjB/VHvw359gnFGZG1oUpEqoZ8iCnFPoCR8me5G24i
 uPwhFcvEEKY+t6bfAxIHEf3PEYBEohRykEQuewUKoOFs8NtIlZUyjLFUEaEcTWTjVMboynvBG7l
 WQFfoNU+DmPoFoIfFumxLnljhQz2ruTKH72eYO0I5eeMPsdB38Ywy5gadSpr9T3o5+B+PYhCNKC
 bTSqrlvsAmvo1u+N/5VMocTnUvOOVKlcERZxSHYGQc0RkIDpPLMY3YKzID6HMBkt/7qdHwZYfhj
 B9SHM04EVxpfz+zfqSgXIZB/Jr3+v7+2jrZCIuRTyMTfpXwG0vg1Edr04U6RNqWLS9dzwl1Qs9V
 /BItY8+D+n3BRnQgxvzVTCCYAMCskRM2R9HoMTVkrLf/vxrFWvv83h0AAP+6n95tNJ6EtscNbDn
 aiPINY1NNt4rZaniVVizUzkB2fWSjP89E0XkxWwuzp+qkOyC9LUPSsQpdYS2tdczGQ05+6+UGbq
 hoI/i6Y+b6pfjReqSthvXtgLUvPOBh2MT5yN6IUXroIoBCn
X-Received: by 2002:a05:6000:2902:b0:43e:a81d:c475 with SMTP id
 ffacd0b85a97d-45e5c58fbf9mr24055470f8f.6.1779114738301; 
 Mon, 18 May 2026 07:32:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 07:32:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:31:25 +0200
Message-ID: <20260518143150.3138712-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/15] arm64: dts: st: add spi1 pins for
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,engicam.com,gmail.com,amarulasolutions.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:mid,amarulasolutions.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: CCE9656EDB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the spi1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 62f898a55d45..46c5197dcd63 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -702,6 +702,30 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	spi1_pins_a: spi1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, AF3)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, AF3)>; /* SPI1_MOSI */
+			drive-push-pull;
+			bias-disable;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 12, AF3)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi1_sleep_pins_a: spi1-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, ANALOG)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, ANALOG)>, /* SPI1_MOSI */
+				 <STM32_PINMUX('F', 12, ANALOG)>; /* SPI1_MISO */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
