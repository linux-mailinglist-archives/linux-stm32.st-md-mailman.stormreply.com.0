Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE/DIegiC2oxDwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:32:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A1A56ED8B
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:32:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 353BBC5EC44;
	Mon, 18 May 2026 14:32:08 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99F1CC5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 14:32:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so1455521f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1779114726; x=1779719526;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x8+XcZgP8957SPKwPpk0bkCHSO0BbZnOhhuPRsGrILw=;
 b=UKENjPKTKBicUr1wYCxYYliYoESfFTsSGbFM+6Zc0TG2zlSMBXXdu1YnS2JM/m7KRT
 Q8+D27B5K7o1ljti7/6EsGCk8G0eIuYxFHwnps2jBbt2VZVCeLE+0bdpzTa3aZQaXXRO
 Tq+SAAlaWnWZw2mWvF90q2sTCNoDqUr4YQW5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779114726; x=1779719526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x8+XcZgP8957SPKwPpk0bkCHSO0BbZnOhhuPRsGrILw=;
 b=QOqsbmb99xcwnMYThsNTWlDKX4Sp9yzMLoFa/21gUCXz75w+avdkZp0sESXjdJhZZE
 c0uTL3XwbhUVfriLs55l7gMQMGDbtcNhgbAz2gNfvRrg5xt47mN3E6dwiKBa1gpSYrpO
 QEs37xpB/CnhbZFCnBY3yA72DAfkJH3Y+GnXdBiUrftGuEH5TTiRXjwUU2fC0FvOcsxN
 JK7GnxsP7RWE1QHFrhamsTw69etNHJLfmhtpy4JhS6v0pgyP1Ro5Q0acGXEPzaH9Zy88
 QkgTSHGJh8uKfzl4A4d79n6VKZN5Jy9sBYXcXVBK38BQtDBZzQLOqe8ZsYAi+Xz7jE4E
 pirQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9/yT63M4LbAp/BhKnhQBBGwORWIo5TiwRV+YrLu4cLnBa6rWoPClbLvEg8KfSrFzkddQAA07VB83i99g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxnZ4MtZeTm2TbyDZJLso2G1Vv3tviU5jIalMOuhS4VKFd7oWpo
 V9wfTy5pLmBpdSQMjzTOXg0HtzkBNn+YQ+DS/tnH6685UdOXV/a1c+7tFB3HR3lX9ME=
X-Gm-Gg: Acq92OEXenGmj0CdZ8+Vj4JOsXdoBVYO+HLDFzsBpCn944VN4H2sJXxo99Q7K/K2HFf
 sLPqtpSOLoSBwQycyh3Ibd3YJ6YDBFVgw+viBXdDQPSbCtEXK59CHJlsHcc8CybkcsQtKBigjwx
 weDRk3DBxMF6sIVhloIrO1vP+5SEVD1aGMwBx94Kfgt1oRJiBtGh6o4NBXXoLTFjWomWM744tBM
 8MRuCs0Uu0/5D7ZQ6wzL7r8Iz5D3Y2XPwU3PN/quFg/+NqLK8DU8DGCJzJwvgJ1FcwIIVxiDDMz
 WQ3op005V1PW5lLH2EILwN8xzaTgFihvaPdcUYrlkQNU6vLUDYJHyx2BZHvmR4OD9Rbc6xzodpJ
 bNJV55CXgHQhI7gkCcUOzHiDeX7bbDjoiqvWLKZ4gDdFkpoIJWkDn+MIGEC0UT111k3pAV4BxlZ
 SJVVDhWEz9llEVA1ydpp8WqcifLlHqjJLWWwpM1UCTTpcd2yxeJcJG3cV6nWUXRmUODH/lap+LA
 yXRlO/oVeYssNfZQCtLrwig4GIJjmsOy9Y4IBwOePXQmPKN
X-Received: by 2002:a05:6000:2087:b0:449:31ca:5e53 with SMTP id
 ffacd0b85a97d-45e5b75624cmr24382596f8f.8.1779114726004; 
 Mon, 18 May 2026 07:32:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 07:32:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:31:19 +0200
Message-ID: <20260518143150.3138712-5-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH 04/15] arm64: dts: st: add i2c1 pins for
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
X-Rspamd-Queue-Id: 75A1A56ED8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

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
