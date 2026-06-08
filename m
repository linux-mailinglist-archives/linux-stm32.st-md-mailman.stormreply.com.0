Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XbenKj3QJmrrkwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 812F36571DF
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=mxXjGpID;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0797AC5F1E9;
	Mon,  8 Jun 2026 14:22:53 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 179CBC5F1F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 14:22:51 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-bec449d0af2so492372966b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2026 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780928570; x=1781533370;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
 b=mxXjGpIDhOPF6ol/W9rChzvJAda1FtgqKADSKGj/WMSFRb65gaFH2nLLxHopFnbKLq
 KoY11fy471Mkqfg8k06Oay0/hLcTx+eFXkXZI0kgPFUbidTLlkWpolCVj2YgB65GwSdV
 McmuMP0gI150iYJ7O2FUVtLTqtwoTtfDq8Fsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780928570; x=1781533370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
 b=HO1qaIKLUf5FrKAB7Yh6VAN+7CNsSgpgt4+9YEHWlvqUAAVLvygc1kXwi7py1odp1V
 ZY6bROeEnrmRZUxz4yAs0RIxXcykF2TUb1Pqd6nQX50HJ1I4YlRu+y37GwVrhqv1xCM3
 PB3V/+xVp+gCqi9bcyFi/9OVi6fyvAmLUvR9+h4PtvC0xpTVbrBXN7E/8tPI+xR7PeEp
 TwZKPMakJTa5f9IFEYmih6tNRuVEyS+08YQz57FAbQM+ZSEKq0FZN7uQ4hkWWX5APKyx
 3R0HTSxRJuS8T5exZK5XzGZc4Tx/rCLT2MnOkYil/W83LkR3kLP/Ex7JewtO6HvP8IPP
 hNwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ87HAMoULC2Ph2qUpHJSzXLJa/SNWVZEaU1yvetHoU2PjhbYZetlLFr7P3BCXAzHrqUIY3yk10CsbaatA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzP+GO5v/5wTPAnE9pNnCAbMje2r5QavIOYIudDagGfLh9I+FXl
 OJJUitshsQ3zSqzqdxP4RxG0NdFL4R5GB1j7L6hfxEXj66o9W6JCalwIkxPVdXbgEIo=
X-Gm-Gg: Acq92OGhe3kMsQBehVBQRqZyYLwrD7QyGP2EG8zkdWcTsfDLOdFiWikGzTa2V5+95pd
 CWxNqF/agrGBaGDhqMsveyzbeu2lc/Yi8S9cBYVPUC/J6siaPKPpanQM5mjyBaToZ3KVykHxDvn
 /85t6q/w/UE4nn1oREu2fbuaUdHoyxk9YSYU8eDD8GqWBP2sk8q40Mcj32mTYU1h20HJXLVr7NC
 KPwg2eI9Tq3xIkYRsNdpuC8yr/w3UgzFcR/It/WRKVR1nGeYrmK9AZ6FIiNTmKMrkRIAajwMeO7
 J8gps1uSY9/SQlL9JIZANkYNmsf0j7TYGFc3SOt91BGZ5+T+LqnX9naEKLcmQB8Q1tgxsphcbCh
 4Ykv51/GL0TLkJdlzHv+1OCJuEc20Xe1/i3qlYp/EF0Ff6O7ZLNOCAHgmgtc8x3GORlseC8NnMk
 AssnaLzJPmy4At8xEGkhW2Fy3dWjasPKPkwaVqPnnB9NeYskMbWt9v4OdmbHEFIKHjFwE0YhMU1
 Ct3RIdIUMl3hAUUUw/5cxmbmeNux5zM6zjnls30Ot83+RxJtdEBHRMt1iSYmKihj0R7MA==
X-Received: by 2002:a17:906:6a01:b0:bdb:6077:a168 with SMTP id
 a640c23a62f3a-bf372151453mr726500766b.26.1780928570303; 
 Mon, 08 Jun 2026 07:22:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 07:22:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  8 Jun 2026 16:20:30 +0200
Message-ID: <20260608142221.952245-14-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v5 13/16] arm64: dts: st: add usart1 pins for
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email,amarulasolutions.com:email,amarulasolutions.com:mid,amarulasolutions.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 812F36571DF

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4e570e2e5157..d515e44832d7 100644
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
