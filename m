Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /T/bETHQJmrhkwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 161596571BC
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=jgCHAq58;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88E19C5F1E9;
	Mon,  8 Jun 2026 14:22:40 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D166FC5F1F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 14:22:37 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-bf1cdcfd6deso523996866b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2026 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780928557; x=1781533357;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
 b=jgCHAq58nPxSxbMtrTlf5HdPFKJ0yAenbjXHSKTLH8aNHb8zmjHTQPz2iO+3ZDCfIU
 lq/w0EBDejEhLX0UiVTC2BL7yGv8Tv0gKJI2L97wtDpQNEtlsWP2Qm5WAdG+T1NSdiFB
 KKsOnAvSlKIhDxxfoulWgmfs3nuEpGPn/9i8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780928557; x=1781533357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
 b=GCskbamhkK62j8q09uL+spiFnnzVIBeS0+fmR7JbDtekH/+3wU/qf+T50bpwsshclu
 ef8l0rrQLQoP/s0YxsmVcgGnSDAS45BuHSZqWoXK7IJubhW++nxHFeeqnAf78PxrYy9S
 dNoiM7jbFUVKriM+hJhKwC0qLBnknv2fWNYnTwkN4E9IfXJr26dqoDOPvpn9f0XRtDA1
 Gx1pwobvsPthO0uST4oY/qJTis59fqrxiDuM+dlloH2OEW3uG+W4Wew1IHlCUnNH5x0X
 bonnPqVjGDalGBckzvkP33Jeey7DfDD/l4k2DTdgaBtmjMVc/QoUhLBLPyqA737ih9Dc
 Vj5Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8CZMF5O7STBxusuquYv6m9H1yezLKiNZ270dJgJ1ft+yAy7b3R3O7XE9R9YImWFrQiNUJhJQ6GyM/qNQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwuAzokk0A5Ysu5eHN/ObwdS1XU6MU36UaJ82m29618gGiUrcLY
 /mA2Tz3JcJfYf3k7WQZuYsHMZRTCalFSWXHLdJICXf/lwFtOYbbvnDdNnJzFToZcFDY=
X-Gm-Gg: Acq92OH8q9jCWN1IOJccK1TWo6BeRHCnNs+CQqFJ1vUiK3sjIJno0AUh551JkeHs8zD
 IQe4C5WhJvYZxiZAr9Rl4ohI7DGf8fAUE205YwbriD40E976yvNBGglyXoKfGa4Zhkw63PCbXsX
 VkfcNEh9FKw5xBbHevEw4RB2m64GR0Hp5FGQ+eDiBD9g/nXoWVRUO75l4tppl2KQ6RylBDHEVlW
 E9WL9V0rWdGXeWWqNyl1lIKeVh7fKng48rjEav/RYHoYqvGAwXsLZeeSqSyGTRA2IJEgOC1fmpN
 i7z6hMA0s5zpvNzp9sFQZewxn5fdlHSNtrUVV618DmgPPZeKEwTpVAM4rhZN0YbdVfGBW5jP0gU
 IvRqJsku7RPIuagm/LeZ/dGk5v/DuLjF11u2MnHq3tl1hBYpsES1y7y6rAKIbB0JqVIjWzJVoPl
 r9/9HB8EomUQeBbz2qRKpufZGRC/nyPCmyUGkYutM7hM4NslDMvV3at8jsswhZvf5tOsLCUX9uR
 ngb4CexXr2JnFaW58R5y4F9l89a8PQsQ5C42s/IuQb18Odqn961/JVgo4KyfXq4QdL9Hg==
X-Received: by 2002:a17:907:8693:b0:bed:5a4f:9fd9 with SMTP id
 a640c23a62f3a-bf370e6325cmr667273666b.6.1780928557174; 
 Mon, 08 Jun 2026 07:22:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 07:22:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  8 Jun 2026 16:20:23 +0200
Message-ID: <20260608142221.952245-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 06/16] arm64: dts: st: add i2c1 pins for
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,amarulasolutions.com:email,amarulasolutions.com:mid,amarulasolutions.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 161596571BC

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
