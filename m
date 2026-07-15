Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fdLIJx4nV2q6GAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:22:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E575AF07
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:22:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=ZIK+Mzr4;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49BC7C58D7B;
	Wed, 15 Jul 2026 06:22:22 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA339C57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 06:22:20 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c15e03c2763so358318366b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2026 23:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784096540; x=1784701340;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
 b=ZIK+Mzr4nKtLV7pN78Ue/Gt8pfYJXTDXvyl0Rum84WekUrA1nrs+4vAgAjgW9/ps2T
 ZS8p61akSKnbv5GgG9haj5BmaWpbd2IOy/sSsCEP84KRe14VJYf2tfr8eS3VJkAOUQZz
 Aw8kwxl5o3n9rcJyr9UaeoIz3ZPMZX73ojvLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784096540; x=1784701340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
 b=eDU2g1PfEl98rast8BY1nldxcysjK6djk+PrKYuqHj15KrFfUoiIJ8963T/djaKnQP
 wt24ROl5KAwIk6CjMSTpnw7oas1P1VCvboee9HVaGaHAtKV5V5KOzfV1uurbnPEOJF4l
 vf5+6anOGOjiVUNAmEBTI+eZmSBlDlWY2FfNAQ2MEMJnEV4nZXSox5zBmAnlHUf4ollR
 agY9KAUOahnRfAy7R0Q3/Zx9k0Js5O4JZhnt9dlwZz/ayGkwPof2CdQNcMEeurvIP1cB
 ZHASUCJxPzc41b1zK36vKmuR61Rh1QLZgVWjKATHaYO2Npb5o1QXMWuY4vuO2IkokSTI
 jKrA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrGCeEJgWmHpHOp/gWMmTs9hAia4WdzmWaIIXqJNqWFPlkGHKuU/9Yjw7gcgCtFqkw81sB9e+SD5oKABQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXj/kbmdlARHMHw6/TreAwPJuZq2VXFS+5LKDw00WKGxB5Zbss
 fHcPHwbnLr4sphadF7kuq0LmvVOP4D0OTGo64ZtLCbET278fsKoZ0T5eJxB7yYI/b8k=
X-Gm-Gg: AfdE7clpEQ0/IH2/VD+o+FC/VfcdpZGV2LE02AFA65hB2GGjle2uj0Prvv5bz9w6o6A
 w2F4zdpT7q3bfek1rSPgYZdNXuo5FAfgNURs7NeUe1FxdTY5Q8/NQ6DPhVMmtuUbf6VQoAMd0Xa
 6kopmDrGooTKHcne/leoECXwmyq4sycWAgZmQF9+RczUfsb2J4/L2Wqz3CYaSKiZjHfiEArJ3cH
 5nWyOchtzglUjV9oAY7bCBeH5CnaUuqMlqv9OKnULDTtT8/r6O/ddcLutj/94vl49lm8XDXVzw5
 vzNaXZjxjFzuuztLtKCCHRUWIWthauWFOyZdC2cL404XcG8L95Oxk5EG6Evs59mvmvTYgi8RNse
 s11A8HnoApaDyxiABN8vPlfVyPLh+T/bP+QFAUWC7w+90Ek5KR7hPYAHDaojKS9OZTAPvbJkawq
 tquAR2ptPLPc/ryIwQvpD4yl8WR3Txt51xCGYiFUTc5uD4mQ+aildMdWi+VmCVfDM405RDXSarl
 +rlOkpor1J7
X-Received: by 2002:a17:907:3d49:b0:c16:7d95:9f48 with SMTP id
 a640c23a62f3a-c167da4e50fmr40843966b.14.1784096539997; 
 Tue, 14 Jul 2026 23:22:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 23:22:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 08:20:21 +0200
Message-ID: <20260715062201.3599458-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v7 04/16] arm64: dts: st: add SDMMC2
	support on stm32mp25
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,amarulasolutions.com:from_mime,amarulasolutions.com:email,amarulasolutions.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D0E575AF07

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index ae36d703532c..44938c036e30 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1668,6 +1668,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
