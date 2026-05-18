Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ5eDvYiC2oxDwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:32:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B8C56EDCB
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:32:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BC06C5F1CF;
	Mon, 18 May 2026 14:32:21 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2DDAC5F1C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 14:32:20 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-bd85ebb368fso152400066b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1779114740; x=1779719540;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCHIPZwacuOf0o7fSIdc7VQhv0GmhSFgjV6dD0HjIec=;
 b=YA9NL51YhCAwzJnnwCLTis8qIA3nMaanjpAfLxPirGUSsCMIrQiGEyspUzQPkoiITY
 HsT0ESTBQdMq95uKHw8pKUlhq8/lpGHeK26pIbawCER+RPTNzLt3vJwa3SOO1BBpmwtW
 MXNg9u4qMMxtsAscuYL1gN+cKKHvpm1JOcYJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779114740; x=1779719540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RCHIPZwacuOf0o7fSIdc7VQhv0GmhSFgjV6dD0HjIec=;
 b=FwXKizHpblluSsSK4HCVf5bmD/AN5F/we84xCexQA9HyGq3YkhemnjlkFPwETbn5Qk
 jl1ND6N5KBk2YE4fx/wiA+cDb80GfjeBezm/Wm5F5IJ9yj2cC+ei4vNmcNEJSpnA93ev
 Ftnk/nSzDFRojiNv9o21+5VNVh/k+V8XH1QMhNROC5bunnHb6MyX18LlgEGl47L1HIhe
 7hcuzOez0orBCNlZywFvBe1NYm73drAjH09j5o9Zh9YxvOZHAeWLzAGFqE3wQz/FxZMy
 7hYCSjmSxyrHBMPLkcu4V1CSKt+1rcGk5HHyZRQDZTRv3rG2q+j3dTEywkJlsVWb1UdQ
 6vGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dszKS2vCxkoXIzhZP69X5cLh8NLS0drGkPFWRTzVb46M2Q4jEkSa6220NNhEt7n7E9wchFMMspH69MA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwKrwCM51Znf+F+oV2VUwayA6wcaNW1580qFK2zxftmfu9ckmFQ
 vqL216jhIDCu0kah0Kga6wVps5/tB57Y6IoHJH73dbERY+ur7vbsX7R+KqiRZt7xrWM=
X-Gm-Gg: Acq92OFwjbl/85Tvw46LTKObN/kq/FHRrFwjfJ7tZf6sV62+T/wh3PugOWvFaxEzmIE
 6/CSv+a4aUM8I4RYtaCb16DONAtIhJdgye3HAI/h+kgrD3Kby2HfLpxHa72eCEgo5GwlVsJTkXw
 dqfcc0vssMfd8VXtO3GsnpNWXLEcbzzBeLN4zKRCPy3E2EB7N/q+/TELLNdcwJ3p0C+l2de1mtD
 ZvHEGIRd/Rn0YWakyc/EPIQlxM2FZkhUIusfZB5FOLVCiIwrjIsEw3lLOYiOrzzye+ifNxdD4ae
 OVypmv6Vt3Ufyu3ath7PWtnmZTTad3JPUn450Q7Po6JCPZ6RlC0ekHh8tJCrzUE+UBwp9P/wl3j
 LjVxT4ChOWLnBR1WCVckFztfIS+AuYZcs1ALaPzNoWhLAXUMJ843eWZiEIW6CZ/we5pqhJn6UAq
 7onKbNj9cftQmT1EJfu3wWw8HPZv83HKlG9an7prXq9X9Td0uz2H0Qjcjiig1pRvvBUrxXPCD2T
 +sqOGyjNDPPUuWtBL84DPOHzk7iMPwcipGAAduw0oS5BkaGbU/+0FYPvfY=
X-Received: by 2002:a17:907:272b:b0:bd4:4593:33bb with SMTP id
 a640c23a62f3a-bd517ad5b94mr840117066b.43.1779114740148; 
 Mon, 18 May 2026 07:32:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 07:32:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:31:26 +0200
Message-ID: <20260518143150.3138712-12-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH 11/15] arm64: dts: st: add usart1 pins for
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,amarulasolutions.com:mid,amarulasolutions.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: D4B8C56EDCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

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
