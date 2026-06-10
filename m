Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wzlvBYfKKWqOdQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44466CCE0
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=GpSBGtON;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FE7BC8F28C;
	Wed, 10 Jun 2026 20:35:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3142C8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 20:35:16 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490bb83a3f6so59040385e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781123716; x=1781728516;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
 b=GpSBGtONCYX2e/oZ1XQzHz1WYWX++B72XPzLp4wJ4dJD/cUEP2gCjNZUXXyJrQxZ7i
 RKxrJu4kmME/MaPt5rTnWSHseQJyEQngAbkFwGN9pkT2qqlHopyaiXNl0G4Naa5QNIQi
 pfN4QmLwjgfp3OvPADotUL3pWhM3zUBn8S7f9b9WdPfbp5Q7oLirKqelrfq8DjS0D+cd
 FNy1KM27DnfyDW8UdglM+7auoPZ7x70FY0Xmf5CXJWLHaxYRrJEUuq6g9fjjxKJtFFdP
 cp8zeI9PS5aHzdzIEUPtk8/M64/d3/XlLQEA+O/c+cwUupe9DDc7QzL/XvCKpqzcuzWE
 2BFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781123716; x=1781728516;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
 b=ikZ/bf9ZtSs3qjeraDVCcYwAGrOuCZopn/R3sKxyCoE1WavmVl8WsK3FrxjKtKUz+r
 e8da4cjg8RVSic8tXOq/kTfv7ZaaEydcxK0OPUkWF71Ya4IIUXjynR72qi2aAqnnZsSH
 hZfqfOWw7jw8MZRjc0fLEMH9ufImTz+Xb1NTEjBHp648xt95A0tkys0h37nadgXNOpPl
 WGVzRu2Cz0CJfq/8V8HOhgHpJyOxNpGiAcFmiOiDsYuX5pDfKcFcsJlg/8OhU7vU0cNQ
 sIA9AgYHmlawJIqHsS0mis9iN+iP+Lyqdy0PV9kpAF9//88yVtS0f7WrjUl0Dxjxq7xs
 Rd2w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+SrX+OiY79We0xNXTeJ2tJyn8J8R5F75w46J0XHpZKxcuy9NqqKi284MVkh5vjHLBVxcM+1nd/4g6TOA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yygr1U62X8j/5eVcVvqIi0IDr9CZ3MNM6WCK5uOmHUcww3r0oui
 7/+YMH8hiW4cHNYIVdlmM0ZgU3AE8YY2PcLz+RC1Jc9jKj1i92xRi74fXhOtg71pgwQ=
X-Gm-Gg: Acq92OFUiM8i6FQ8168sn9uYyaBAIGgRmlssi9Cr2fbkVCtrKq5CM4cPEzVw50vctdL
 eZoKulPSV3ZHgxgak7PCsk905+8RX8x5FMbu+hIWT/xTr2kMBhnHSs/L+BcsXRDh4vzO4rSfXQ5
 P0srHOiUDKsN8gpdAaBCzgNfKJtR9/3qrO1SU1Px3RBSeQeIoF0PclFrxQEopY12cV7cizH54hF
 EdSqF4LB0cjIEPSiqKkGMktzNE9JU1OkwMy/zGbCJXpvVKlxP1hA/ffITndwpZrpJwF6b1+HqlW
 xOaVRMON4Acdgr65Sh3BdKKn6pxJ7ZVmgo2dKHbIGbPI6qUXaHIwdPpLaMrroaaiyQEH/fu04dc
 E6kxzZ9Tk/vz+aKusNqRjiBH+tQMDEe6QAtfXJ0ExvOzLKy1EHrBWZ9Lckq2U0KdXReWa/aHhtU
 WVmH8jfgsR7dPvrNwlJdMnTsQqTAm9YIKVPk2dVIT3Lw==
X-Received: by 2002:a05:600c:620b:b0:490:b9c3:6c48 with SMTP id
 5b1f17b1804b1-490d7234fffmr107606225e9.29.1781123716245; 
 Wed, 10 Jun 2026 13:35:16 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:35:15 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:10 +0200
MIME-Version: 1.0
Message-Id: <20260610-wip-stmark2-dac-v5-5-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
X-Mailer: b4 0.15.2
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Greg Ungerer <gerg@uclinux.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 05/10] m68k: mcf5441x: add CCR MISCCR2
	bitfields
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE44466CCE0

From: Angelo Dureghello <adureghello@baylibre.com>

Add CCR MISCCR2 register bitfields.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- add "iwyu" include for BIT and GENMASK
- fix MCF_CCM_MISCCR2_PLL_MODE bitfield
---
 arch/m68k/include/asm/m5441xsim.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index 9ce2cbb05316..ea01c7753b7b 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -8,6 +8,8 @@
 #ifndef m5441xsim_h
 #define m5441xsim_h
 
+#include <linux/bits.h>
+
 #define CPU_NAME		"COLDFIRE(m5441x)"
 #define CPU_INSTR_PER_JIFFY	2
 #define MCF_BUSCLK		(MCF_CLK / 2)
@@ -145,6 +147,21 @@
 #define MCF_CCM_SBFCR		0xec090022
 #define MCF_CCM_FNACR		0xec090024
 
+/* Bit definitions and macros for MCF_CCM_MISCCR2 */
+#define MCF_CCM_MISCCR2_ULPI		BIT(0)
+#define MCF_CCM_MISCCR2_FB_HALF		BIT(1)
+#define MCF_CCM_MISCCR2_ADC3_EN		BIT(2)
+#define MCF_CCM_MISCCR2_ADC7_EN		BIT(3)
+#define MCF_CCM_MISCCR2_ADC_EN		BIT(4)
+#define MCF_CCM_MISCCR2_DAC0_SEL	BIT(5)
+#define MCF_CCM_MISCCR2_DAC1_SEL	BIT(6)
+#define MCF_CCM_MISCCR2_DCC_BYP		BIT(7)
+#define MCF_CCM_MISCCR2_PLL_MODE	GENMASK(10, 8)
+#define MCF_CCM_MISCCR2_SWT_SCR		BIT(12)
+#define MCF_CCM_MISCCR2_RGPIO_HALF	BIT(13)
+#define MCF_CCM_MISCCR2_DDR2_CLK	BIT(14)
+#define MCF_CCM_MISCCR2_EXTCLK_BYP	BIT(15)
+
 /*
  *  UART module.
  */

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
