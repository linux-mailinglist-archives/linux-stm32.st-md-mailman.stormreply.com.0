Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPZeDPmmGWruyAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 16:47:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C8603E3B
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 16:47:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B876C8F296;
	Fri, 29 May 2026 14:47:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C68F2C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 14:47:19 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso7923190f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780066039; x=1780670839;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQULYkqXtjivJne37GxmOPps34TMKbzDHgmdioeMwjo=;
 b=C4tZi+21a3ErKFxR0YVAZgMpyBAUw28V2ADy5meM3Mn/YGdNdQa0Cw6AJwXeZ/GESC
 Q9h/w4+65KPFbbtei1Dx2ydPeIj0/iaJ9Ux0bQy+KRuDttCtX6QxUQhhE/5188zjBX3U
 8U39TDes/nQLRy+yK8+Y5WMw1D0/NgzclNCDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780066039; x=1780670839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JQULYkqXtjivJne37GxmOPps34TMKbzDHgmdioeMwjo=;
 b=qAWIqsOPbuaBzmidOtInLfnCxDQARpP89R5Vax36prohmucsy4bMz4a6LAC9VT8jRu
 7gL3hikyz/x6cm0kVJyfk8NJp7H9NcGlUFUqZ2/IKqcH+n5U2EUyZcWukSBPzwlU+rfM
 QN0zHPvKhVtAx+ZNuekMBkHJPNsYzbP9eSLaroX3IyffMiG7SkoJgRetPlQ8mZgvAJLu
 4PuT54zKiVE1Q9iCEQCfZlqW+xR5ABpNNJM8cVzfDH4FRZTEgYl5+RtChfIw7hUUjOVi
 vbz5A42sX+BUqR5V4h1GXyRiRKl/eLpSEU+PqFKNcNtKpEKD4zG4AlbHeYZPSrA+b2T3
 eNJA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xh5klDY6hlIOE91+IhCBTbz+v8quO9ZUqAEpOAfFRsn5myIKNQ4NsJkDRQBAPOKDaGhp8IsN79sS0nw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzgAFDJ3u3COHGVlQPuddERVy/RQzjv9zLmDW8SBxCiGC9SnPR5
 n1ERvi+0In/rdcc4EwIQlN+FLJmsziGi6csQ6WMBlR2owlCfuCtT0eAhMNQ+i/xb7hw=
X-Gm-Gg: Acq92OHdoCdFM/sAuiHudLqzr+Vj5bL8Qq8gOiOzbMPcgFDP3mDbSuxa9/6glnMBXMI
 pqXVYMN5PHE1sOXo8t3vrxoWRk9ZRM+n99NY4bOjmbIm5NDkcWjviwDTMEAv1G7pRgBu0BroHnn
 a+IbS5tXVF5qEBWJdFGJpQ9XDnvVYLhfIUAFbE2AM8Cm7nqhiL8G8hzg/Snh4xgllq0CbAWVwaM
 Ka5AonPXnvkn45hd4QNAbuY36pSP8kb4OOzLN7KZvSWgaAbaEqghdXh1V1nJbEsSrQmjHiXzOPj
 muyB2uM0JBxzQ8bXKAF9IlX4dBp5BDVnLf68t5zMsdDRZybsQUE0FWEG00+1fLIlzZqYdSf2VNu
 1YCAPcRTpKAn/fKtaHwKf7zaCGAqozCGun2+EseAURw/G9ieoP0lawdOxTOJR2oV4KpK4geugBl
 kHEBTn4140ZaAY5KKtA59uuxrjGRHzYbzE8Bai6jED1n7SAkJ7ze79L9ztaSPeYH3fRiF479jJ1
 k93KRoLuy9coLT1Wxi4sK+qP+LBJsKI9n+Ypm54tTFBluQ7rt7xXvzSK84=
X-Received: by 2002:a05:600c:458e:b0:490:5466:8576 with SMTP id
 5b1f17b1804b1-4909c072597mr59852445e9.1.1780066039269; 
 Fri, 29 May 2026 07:47:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 07:47:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 May 2026 16:46:16 +0200
Message-ID: <20260529144707.3931919-3-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v2 02/15] arm64: dts: st: add SDMMC2 support
	on stm32mp25
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amarulasolutions.com,vger.kernel.org,engicam.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:devicetree@vger.kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[2.223.199.96:email,2.223.238.112:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.874];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,482c0000:email]
X-Rspamd-Queue-Id: D52C8603E3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..5e46024d2215 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1667,6 +1667,21 @@ sdmmc1: mmc@48220000 {
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
