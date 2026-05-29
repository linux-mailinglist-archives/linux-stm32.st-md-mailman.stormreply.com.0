Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJb5Kv2mGWruyAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 16:47:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B43A603E50
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 16:47:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A79C8F296;
	Fri, 29 May 2026 14:47:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82D01C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 14:47:23 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so68995425e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780066043; x=1780670843;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
 b=pXhqNwok8nGcMCxM0cdFMuAzbDww3+x5SWQ0hjmLppVbkeYIDuPshHTm1vgsbIXdsg
 4m6DAaS6uNz/yl41rEs0oaVhM16ATlKMUMWAo3CmAKPf3uNvVKKlftfOkOubq+Vph9eS
 y1IHf90HljjeYMWjBPQHKJC8X8stdXp82a4Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780066043; x=1780670843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
 b=IFmTrSoB5/A4VKG7zW8L3ji8q0qozwuHVIs8mjN3kJqMPFn78nhPz5BbHHcCMw7JWX
 ks1Gwq9l6d4KMdULIGJ8WY+wKKOGnhTvDdcTEjz2ALposahK1VxPmOqCTgO+0VtrvBv/
 XZAX19I58tCulrn4nroDAAHvhqfurypPlNj6EorreY2v03qa5OIjU7CJ3tBeA4giAX91
 hCsaCM5OdBWvNuUtSEmpPiZZB9HdwvAnINVstnnsGquuyLk7U/VEhruA2V09ga0yixfa
 R/WQPW+R6N18IB+sz9k0HkTrDcznwRNHPZlvgCq3oUU/dSUc1c8JsOIcBWMtOjAmMnAt
 KN6w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9pYeRfiejILXNcNmnAT/ULxtMNjZxkX4Nc4ydYRH/TOfKSqqVKJDz5y7VkCAbWBhsa/R6nkDJTjP1OQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9Gflc700YK/o8hDbWqxVjQ5WnnTdT3VREsXsqAGdSeQFDIjhQ
 SMkg6WWps6Ddys7aKKSq36VJYijwePlmVOOgNA21iSuCvJXdJ4aQyZoA4tP1oFblaRo=
X-Gm-Gg: Acq92OF+OYcrUJdBv8s6Oma8YqYUR0ugYj9VlHMAB7n2g1gp6y75IekklQhPcy8f0TD
 WbEifOE8gvDOOLMTqNLyhwt5kV6kfhzFGKazXpXQAkylfl0YqDrJ3YZ2dPJSBflrGcuwtfyYDk8
 aoKhQccgnXDOWahI1lXMU7JCRrrjAkKIQ+1YSvqtOK48elXCAmlwtnWJ4ZQmt9qxzIJ9OgwpUTE
 lJ0eBKQo2SczjcfgSksfJAsQEKIecw+gWsTRpYuxCBPFysoJ8L+JHeuo+Tk0eGyXrkpxnG0iMOc
 /8LvvBOABiVH5R6NUFOkv/hJeZ7vdIGCAqwEhQppcevWIvXrnb28HXt7RTAUobasZwDqn9E0SoG
 Xe8x0y+UHwck2xuI+N+NEwNCwcrZhuO5ysgiatzgPiaLJ9M0UZusquFn0K0fVQHbJMZ/gx3kE4L
 Ev3DnXZBnQPgbVeMrKXcG98fsP+h+q2PGMF+bda2Z8XaYGHLTLWVaoRvB6xAGROO6fav+RWu4Za
 Ffp3DfbnU0NUoVXyoxG6An98BrkZGTyylw2sISSh/iZbjzPH7BE5uZNAfDDKZcvMtTVXQ==
X-Received: by 2002:a05:600d:6414:20b0:48f:e245:394e with SMTP id
 5b1f17b1804b1-4909c0c8cc0mr44542145e9.27.1780066042883; 
 Fri, 29 May 2026 07:47:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 07:47:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 May 2026 16:46:18 +0200
Message-ID: <20260529144707.3931919-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 04/15] arm64: dts: st: add i2c1 pins for
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
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-0.856];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 9B43A603E50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
