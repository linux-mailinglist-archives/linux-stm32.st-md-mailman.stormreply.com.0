Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ABKOAtBBGokGQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 11:14:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0C45306B6
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 11:14:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 892D9C8F290;
	Wed, 13 May 2026 09:14:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39331C8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 09:14:48 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so69235735e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663688; x=1779268488;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
 b=TUsr/VfMp2jiAQMq1u8o/0fCHVO0v3jOQ9TG/ztN9pYnOAFo9TxvgmqKIji5zD4gpo
 hFQdQvyz3uwrvKgw9zmYYB6wn+DxJVV6KwQcwkug2mb3ts272TSdZNg/XW57W8RpKIDF
 1SZ4y4j597zYieiLQ7nNrkbuvj5XPU+Mf+r/27Ix1kElmUTgp+LapCo1mKsSYruJ+L6W
 6oq3lzSFAcJk6d6altSdjech6TohYQv5/4zrAsz8iRpsNc2OI0BBrgDBe3GLkuJs/ySS
 xWi3VFTpu5XQ+GNvCiOSF3I8P0VPw7SbuMMX2Diect5erJ8W/DEqYGtWa89EQGq3XsZG
 fdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778663688; x=1779268488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
 b=IQQVyOo3ksHQuPlPnR8tTULcnF9/BaAfViQTbBeUGgXC8y0wBc1e7ZriX6rnnjmssT
 nLMlyoBs6jvGsBA8lcbXuT8zuqF2DE8nD+QFYzyKqcYYtv5xctgXN7kqgUjv75HcDcTF
 pVpREp6/mzBj3kf60i3hB369vk+eEFHUXlPOuQNw1T4/17jRceUyXn9oylVBNkDI6uIN
 NA6acLZxHFPw+LoPvOj3Wg6gObFKPHQcORGTGn+23FE/WRRgyBPIdX9BEMYrtIZPitor
 hYlUetlS/e31EaItfqocquMDsQ4X5OP2NWom2XLLJRaAsuAa0w4+R1iyxDn96jFsXZXK
 CLRw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jLkpvpniv4ikRdfE3Tpdenx34AQK6baWLq4HGxv8zQd7sLaxvV+PR2lq7DdGOF3ktuwhD/FIExiTJSQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxmtLnjfGzDPTFyIJHhwNOfkm3x+NF6uCul9b2qHaG8fZo5pvAp
 th7OZHNmoSfclVA54rbeLQvKxxN9CrHvQnmKDV3fFpTzdhIiCO7RPtYRfrbiA9FijWc=
X-Gm-Gg: Acq92OGibaGCEgyhjd0bKWvHN71pwkn2rYHsXPqkf8D3srZmTVXQYOUyauOoOX8B/QG
 69D9E6BKiZJVEzQX/tqIkk63H+VCY865FQw56dyVunspENpZ6S3m0epoVMdaV8e39F2uFAgcbZ5
 JETUdcNA0RbTcuuXzQ9RBrGIT6XyMUvG8hdWIoEE9286fXuDjploA8AeeHrjUQPDs06wpXczKVD
 Ww3Dg2WVx05jhO39Fl2TGQb27DDnHFw05bPYvoqh/WbyVWa8oSumRmzu75Gk8x3LqwyXTusnNHS
 2UuhMG0bsAYZQWq4hTgUzAS6h+1MdCkoQb61JurhL4rsQWcfzLZUBNL+vGN6IHWco0XMkvjoslG
 FY7b6/v8flc3PG38YZ0vhHpEZ5puHnBFuBYPmom5rSQySCA9WG4gvZyR2pO09lu6Mv1oFLq6Czk
 w/s7CzUDLVaXlrdmgdE55naGoX0Jx//BI=
X-Received: by 2002:a05:600c:190f:b0:487:1fb4:7e1 with SMTP id
 5b1f17b1804b1-48fc9a4480emr35035905e9.22.1778663687681; 
 Wed, 13 May 2026 02:14:47 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 02:14:47 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:31 +0200
MIME-Version: 1.0
Message-Id: <20260513-wip-stmark2-dac-v2-7-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v2 07/11] m68k: mcf5441x: add CCR MISCCR2
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
X-Rspamd-Queue-Id: CF0C45306B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.925];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

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
