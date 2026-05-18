Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEaXJesiC2oxDwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:32:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537C56ED99
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:32:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C8C9C5F1CF;
	Mon, 18 May 2026 14:32:11 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7E96C5F1C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 14:32:10 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6802f9c5debso5721280a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1779114730; x=1779719530;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrnO7x0GW4jDpO7hgVq4BogGg8ikec+SImnjIW54cFk=;
 b=oykXgPf9Nb3XwsWAFvlJh6CQQNvL9LN8zPq/gapruwaM6G3LdkF+0ixd9f7VJPOP6w
 4VbNyD6wtdl7keSTLePnGURx6f2j7/0gqA3JtZHyF53ZOAWj5ZzJBca366dDIWbDfIge
 ToM20NF3ctRR0/GkEitUaVR0IaE3qJbo2L8ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779114730; x=1779719530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PrnO7x0GW4jDpO7hgVq4BogGg8ikec+SImnjIW54cFk=;
 b=smIrI5o1BlHBBX3gd2PhtEb9JfjbIzxz0mgESqU3R5AlIBxn4MWJIe4fqaUxFFdv/2
 nVrx4bf1OZl/GefWokE4s4tHLU0Eb4/5sCNTs1AN/uFm4F1LrZN0Wid3Z9LtCUvfDLA/
 EZ72gD6uRgj+hLXTtBf+PMJWwkAJy1u+9qVh3S6qyq1sxa8thHtW66bgLc+tQR+FjXQr
 VMidji3fccu239yKstW8RmHCKJZAGIUovUtJN77gnhFxTz4Nh1BQKoAvRDT0GO51I9pG
 RiqBNVvzLoZp5YbR/dyiby1TK5Pm3pvKoWAhh4D6wGdbjhpBLre+yXuqAPHYd27lRudt
 RTQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ94VMTa7P6Xx6uuEeqs97lTVNKJmNOn9ti5Wt2IOXV6Iehr9xkCmCdXFltNaHNhcxMgU0UIF6Wgi4vxpg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJpukUjX98sIne2jhWtIGQ0G4LMb/ldy051sxjSCQBaAnY+GDA
 RViOOfQNdWlmAy851hl/MTk1mzQiUrRmkzF/2eaPuxaT5VrPAs3K1OBPj9EkY3Y0OUI=
X-Gm-Gg: Acq92OHGsuoyZFmQ7sIDD/2ddQTe2HtxtWrE/67jT5KRZJMtouQxXIiTmdWD7A8iYfy
 TK0D0dY0zreDFLle6ZV3hQTDbR+sO3TzH5OwmbPQHoBwheZktZp3RZguZ4XveWqlt/ZHGKp8qZg
 8VdTWLLMJcpzEjLlwjpfQS9R3DyU3lSraASjwjl0vAmiX9jIOfnvhex5jgdrHvwuCMT+lxLTE7l
 DeW51ImUj7xsTLG04V6O1AKb40OyQMGZFqKOJO2p7BTMoggr12R3EMUpJ7kbFG0c1B4XO9RRGl+
 ZD+lJ6KJ+hoixVARivaVzpdjrfiRjyAmDi6UgkV4ag2xWej1z/Ic9ocv9u6X5lq6wKeE3UbPD/b
 n8XyqkYDxHQOj/cgQqwEKpy4uRqjl8ZSlh0pGEXEpZ4y6IAtyf2mx9vD5klJyCZgLtPlkgLgrkS
 8szRZKfLHaDay6EL1Bsi4amhTmSodKMDHOGlIOWPPWCRbO2RFl2fr5MqTc5n5GZ0IV866ss976H
 YDPIapKL1LMoFZz0VPY7etqgLWQmvj9QgKplcJDnerUCWQypDoqkZDE51Q=
X-Received: by 2002:a17:907:d18:b0:bc5:1e2d:fc53 with SMTP id
 a640c23a62f3a-bd517961cdbmr792821966b.27.1779114730073; 
 Mon, 18 May 2026 07:32:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 07:32:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:31:21 +0200
Message-ID: <20260518143150.3138712-7-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH 06/15] arm64: dts: st: add can1 pins for
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
X-Rspamd-Queue-Id: 8537C56ED99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 05bd07a0a561..4be01a6574c7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -331,6 +331,28 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF7)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	m_can1_sleep_pins_a: m-can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
