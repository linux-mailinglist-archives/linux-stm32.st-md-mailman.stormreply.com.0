Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKhoGPumGWruyAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 16:47:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E273F603E43
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 16:47:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9EF0C8F296;
	Fri, 29 May 2026 14:47:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86975C8F296
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 14:47:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso83524385e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780066041; x=1780670841;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVgkSbjyYr0BZnZn3LZO7uFVYNeYnWVTenciTmfydYY=;
 b=gt7ZlABkNzFbMaS2HKv/ghU+yYc3Md16cdvI2gXS1xLzpDF322r+CtGFi1VL+w6QK2
 yBYqb6VW0cw87SSDepisTIVjFhRlsS5111kaKagDiQ5AZm8sKC4Y48Z8lL7xJD1hi2wt
 QQNDFbSiWJJZgjYLHXXhfHfodVd0jYBiAdgFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780066041; x=1780670841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NVgkSbjyYr0BZnZn3LZO7uFVYNeYnWVTenciTmfydYY=;
 b=kB5fPLLvLC0WgWmIt2vc1vUvY67esngVmGPnx8rZzhPrN0gmlvoWTmBzZRkwwKUgmH
 L/qpiyCXLIAr3YTqJf85hR9rW8gWFutdgKBeu9uPIIS0efJit6HCPrHdm7POJmhDR43O
 8Mgz8zqZ+K2g8JmDkQAnErASv4zT39bHvq+3GsYtfDrZAz7KYk9K4zsD6io/K0JqOs0D
 leP3RCbuwQmFqM7nObOca1TjlBUJ5CBgQCGLb5lOs1iIscEVUhYVnJrj7fhAOaWO47OH
 wts0UEFZmBtgjgTLWjHhBjUviFewFbRfUIBdrjUIN7OUH4kQ9XAGj0cAl7vZM4CwXq5b
 TUCQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+qfMIN1ea+xULtPgeMEifKavfaq9yKQL+IF2cD4OPhAplZ8tEpP5itHZ8GC7brJ+yNHXrRwSebl1DniA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx7GiQE/TTysY/UjZdh90dSoItmqTy5815UVe5ANoJewOGsZYjc
 zX2V3WeoEXP78iZEeBtEy4IxsaAsorvJbipdgLgkX7ZnhA8xxSSTrAtUBoYvA5s1neo=
X-Gm-Gg: Acq92OETGLG9IVQCW5mds58BIohU7RC/TYyWYZJmj6AsaW7D6np0NDi0HOxa0f9osRc
 l843OuOs+XWUShftkMXyUua/N+D/8HI90HeFRSrfXZyR37NooDWSo1216xPOhMEsDbtTywhjlsD
 YN6Hgj9Zy1T74qyxSBBE2Dr8lyXiI+owTAuXQDwaYASc1rP4K6tP6CbvAx9WCUj2W+hAhjh/n0d
 vMwXAyND4vYzFVOqL/PbTdOEWpSL8kV2nHuuBqhC77j7Csggiz6Ve1e8CkwnBgMH6JGGMnvuIU9
 D0xLC7ABMi7ggFw9uu+L6rtimK90xUQ34sCL+cbwcxdfn6w+hDwItvBATO05GmLG1uUmwMYKJdP
 0RhzNMhz2QVXZMQS2i1Fyu5yMeUWvzqI1bQlk61BSgl3iQ38R4GH+ygrC7SC0mXJLhxNww9cCf0
 unrgxYWa55l9VL2peeZiH0FvHmGEbByArp32uffWSbbFDKnryr1dpjA2Y3LDDqgCq6eLGTryceW
 cKa3ZhKp5u6BPtQpi4UsQfMqYSNFFUV9P48IvG9d7FwUwl9KTUBZICMKWA=
X-Received: by 2002:a05:600c:4fd1:b0:48f:e230:c3fa with SMTP id
 5b1f17b1804b1-4909c0f9b76mr53522495e9.32.1780066041037; 
 Fri, 29 May 2026 07:47:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 07:47:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 May 2026 16:46:17 +0200
Message-ID: <20260529144707.3931919-4-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v2 03/15] arm64: dts: st: add CAN1 support on
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
	NEURAL_HAM(-0.00)[-0.865];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,482d0000:email]
X-Rspamd-Queue-Id: E273F603E43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
