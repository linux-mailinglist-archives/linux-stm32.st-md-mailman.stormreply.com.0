Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zLcVISzQJmrfkwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9E6571B3
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=rljIQaLy;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58313C5F1E9;
	Mon,  8 Jun 2026 14:22:35 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34763C5F1D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 14:22:34 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-bec43ee8ff0so628378166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2026 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780928554; x=1781533354;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yc3m6zr0epBkIc8UOZHvvBVuU4YMP+mrPgxq2NBKnzg=;
 b=rljIQaLyc1WT1VA36LvehIuxKe1FbDi1mtDdxNUTdStTtU3WCFqMBPLKOfNnHpzhDG
 mkxv4ygxESQwRlmo1J0QMwSspvP4r4Lqm6v+kKp3fqSnbjHFVAfn/ZIonJVcPCzCLwSQ
 i5j7rlB0eP+sNXZS9QoGk3WE/b4X/BqKe/nIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780928554; x=1781533354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yc3m6zr0epBkIc8UOZHvvBVuU4YMP+mrPgxq2NBKnzg=;
 b=CM2o5hbI96SnDi9Xbz60PefYsVYEz2GGOCorTRTJu/HFbK19KsqqZfohy/TL+H9QqU
 z8noD9RC9vHozsMlYR+QjlhOusiyEOZPcemui4ZTFX4cltqolAaFx1D+eA2aBW2NATnM
 dd3E/tFgeRPOcHkvkb16dC7mPCJGRRDrO3ZQSb16cu3JxhB45cuAS7PE443459Iljyk8
 qh5xYo2P6nlfnorpdKVsTmCLHBW041mreyU2ZuADR3VHORZG29I3pgvUEhZ0RxLXPAef
 V9wqoQyiD9BbwlPD66F/6w4sgWsU/SRU2LrKn5c+1VV0zmxFhU2ds1mp8B6R4C7FhYt1
 yceg==
X-Forwarded-Encrypted: i=1;
 AFNElJ88GHvtQLS59jpCIZk65Qs8Kc6LWWb9g0L7/2HF/wxZYi2EBo38bdjIVcaDTjs42wIr1YuR3PV8S9kNLQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy8oNdAa6kNrZShL5RTjyEe6IrunXDXkgQg77u73FuBeb0y4UKs
 mRf00y/5cVO2AxOEG23da0Sj3yNF3PvforWJVuHc5sYEQQgHAU0xNCcVkIo8EUGmcGCnBS1PTOq
 5QDvG
X-Gm-Gg: Acq92OHyDEZUxqGTAIu2W7e3fqoeitS6WIgBkLStr9fRVCm1Wk2XQrvxLBXePgxEIw7
 MA0jMez442W1zKO4o0QiBwmUcC/bZjR2C4XPV/CZb+PWRBXRfu5H64X7TNM3rgLy7v7wT6PvVck
 NjHqTaRlgAvhftUCppbygVfqRYgo2qTaFvy7fyBe5XKuds4yd2FmfNLNOljqCLEW7+0w9igXlz+
 8tlgSzPSSXWObrwcFf/zTCUw6ytctakvS9u9paRof0pWlUm+8wgUORSLLZ9OmqJ/Oq3BaFdwCB0
 /XcoD779KpRrdxh79afz+4pQO0ozvaIglsd+XDBTXkpJlYaf/7C0lvYNKT8/OfnSdj8y+v+bTGy
 Gq5qfHfsfsRn1/JsuAKHbwGmIuhflCmgiekNLlyXQGX8cOP87RHwZg5jSZb+Q2aZhf68NlzKUTK
 lWcMDFbcuo21kLOl1OegizNfp2+fLmg8vF5KRPz3VLRNIA5VKePoVrGP/puBI+N5ogB8iIvMR6C
 75ikTuUvdTJpp3akMDgUCzXPohyEMeFpobQodlaexxKDLqNDToWrO698Yk=
X-Received: by 2002:a17:907:1c83:b0:bf0:e345:68b with SMTP id
 a640c23a62f3a-bf3a8f1269emr641900566b.18.1780928553442; 
 Mon, 08 Jun 2026 07:22:33 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 07:22:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  8 Jun 2026 16:20:21 +0200
Message-ID: <20260608142221.952245-5-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v5 04/16] arm64: dts: st: add SDMMC2 support
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:email,amarulasolutions.com:mid,amarulasolutions.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDC9E6571B3

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index b3416c928c08..cd85527ec450 100644
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
