Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zgqlLcFsImoYXAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 08:29:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF66457FD
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 08:29:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=HCnHOxuy;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EB2CC8F275;
	Fri,  5 Jun 2026 06:29:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ACB8C8F275
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 06:29:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490aaeabdb4so9074365e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jun 2026 23:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780640960; x=1781245760;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
 b=HCnHOxuyWB3FvKDuLvlyIspl1jM9SHl+LERYeEU2jQUnN5piBZYHxq+SW2KbcPcIKV
 FHlovUgRAJL76U1UFMpXido128Sh6Orw209wA6NbGhMml5OGPCvFSE7pSxQ/7/j3KZNB
 JW+/vghAoOGOJLCqUXUcKH5A5TT+5OJ1wfP4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780640960; x=1781245760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
 b=Cwl7CS6iLfi9kV/EHPoHi8plkckZSlMWLvJMnUXLZD/Fc+iN9lcBfjDnww8ArjAwGk
 EY+9SCIJeQbNKsw0FGcL4Jg44PHLqiMNJ43y2Y6+SNeh3sedohuB57sCgf8VLoCrKBcT
 JSz0WCTSzt0rAvFPXqHPA0PN1p0cOCq5kCx6OP3sjG2TjvtXekQpyiQveai8VYgCNYjh
 yiNxQQwrzCrcwMHHHyzc4zEsq81OzYGTQnKfNCKoR2LAp9DyGt6jnScj8aZm1/beW76M
 LPw94/b2cND0064NqXBeYEiQW0yov+cYIUadUuAEPMloJbvInZYs0f1/OqkQJCRK/Run
 utQg==
X-Forwarded-Encrypted: i=1;
 AFNElJ//06VEcfiL0mYAhSLmRT8NFxDMbw8oy/Z7VRt1xh+Z5N+jivZ0TXOjNqRNuDMlAN8pz/2Ja+ybGNNCeA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2Dw6+orYHBtJNFDOyePQ8pjJaO0e7SwhVNnEgwtfGOAWugryV
 TK1dwyqOf/qlgNwh5+7G1oed9+WywfB9bs5RhDQf5hD6pmjuFrRRq5OUFW7Muje/C+k=
X-Gm-Gg: Acq92OG/PCDg/EdYzgBBX8nY+ypj0WbK+wl+gZ5zgMPzByo/9GHKr7wz3AaQMPeHKfC
 25i3nGuF2aIaehnnXxzFoXbEjFGXq5E/+2VEIqtUZqz/KJJJ9Ej1ZE/KfhIKnSpS4cFxplPSjG2
 YGUgdgo4rDuGsT7TJZzTR4d4ktYKhJ148ZIQ0+bWIhrh4D5hjbc7KIskzJIBOcJ10ahEIt9RO51
 QNG6yv24Pe0k8N5Ig1povy5NZlaLbvCEMGfhMxT5gJvpdbLDJFay3/1sQh9wVoBmBmEGmsKNEaG
 /mmnJ+YdJVDlsrjuWnysfF7Bo8esl1dWHz5i8wlF+2FD1BRRwvLGgmcaiHFHwAdweuuSWbNnerp
 E41M/sS1E6RzHuLsqN9yXd1is2YZkc2jHP5r8jW4964ytcmrylpuGTEkTd3M9DPlMrrSwOSrXiO
 exEicCNh1iPMQaDzwncewP0DQqhnl0CGeBzTPCf3Il/Qa0q92VoTdnEX87gQfcsN5cxWJbWcdMW
 8kdYGotw8Y/2PqZzzInkM7heazqQaoIYiFT+13i/d0XyGIUSMGiFVPT2rxKvnXxMcR3CDnFaqgR
 ntNESJf+Qdee03/3+qspb7LCSDJCEsr7P6igcVctt7heVA==
X-Received: by 2002:a05:600c:83c5:b0:48a:7a10:4f17 with SMTP id
 5b1f17b1804b1-490c258f424mr30412265e9.6.1780640960028; 
 Thu, 04 Jun 2026 23:29:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 23:29:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri,  5 Jun 2026 08:27:35 +0200
Message-ID: <20260605062900.368376-8-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v3 07/14] arm64: dts: st: add pwm2/pwm4 pins
	for stm32mp25
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
X-Rspamd-Queue-Id: 9ECF66457FD

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4be01a6574c7..eab8ebe71660 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -433,6 +433,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, AF7)>; /* TIM2_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, ANALOG)>; /* TIM2_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
@@ -450,6 +467,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* TIM4_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>; /* TIM4_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
