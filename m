Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /pJ5N4TKKWqJdQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B855C66CCD6
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b="hAePc/BT";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 836DCC5F1CF;
	Wed, 10 Jun 2026 20:35:16 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED1D8C5F1CF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 20:35:13 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so32307995e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781123713; x=1781728513;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
 b=hAePc/BTuLdfI4gtZK0Gr9g+JtyN4UpSHjt4bOHUomSfa59gk7BkjqTrfWfE0iBH/S
 sXC0vi+OxGp5drrQaXoy2VCN4h47cFz+k/awOHnLWAog8K73lD+S1K+9UQTUZzcKZB2P
 AtnbvqpV/dTpAPQ9IAr6ChMLAvSKvKEw5+kRY63aa1WMQ22Lq4ZEPii1tOrUPe1jt/K/
 IPlIc/siGo27EN5QuXOI2NcDHJH+tZg1Z1u6lNkNraACp5TApzLrxFM8G04ZyzNf2vg0
 7d2CGXH+rghb9gUlP9D58ysgb7JrEfUwh0/0+wl3nd+30HH8m5E0kwAl/YvPS6dAxyCk
 yYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781123713; x=1781728513;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
 b=Fb/1nq/uhrXEmS/FCI8PMqnKzOYLtsXWC8kQtbHqPGgj25KqD0l8nihJprDQdGLs6b
 vVuOoD3iK+lbgwTIeV8ymJG6/JxE2p3UVcQs/Na8+zTsGcSNd6x8eP8/nb8LssZeoBKF
 3Y3xOV2vK7vUOAvcdr0YfdBwq14W0ChvVdnU3o0EKegA3y2nzPeR/oIUh/9B6WLK8VbJ
 7aMK2wE5U7qf4lWdhbc40byIz/p3XWpe5sYFv8Lwrb2rNvyy1W2b4SwfAiK69pU6ai0K
 dS6LEiJVHO/PfmGihFWgyixbPw/oUtMBJhw5XBq/USmelFxxfCjcwsFRCLYfO1sb1sit
 gIuQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+EcZR35/lq9gyfZ/Vz3/NWiHJAtbz3zA/cljU/bFesjhEAk1Ois2RrJTywoUmr4V+lMMYbwAxBX//bHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOojTNcB00Tk/DHbICZfqrM9Y1+pk2sgXEbQTvT8fXxrUW0Zby
 H7zkGD5v5MsKY/OJ1KHBmR+vKZFznTGk64B7ByELuVcZb0Zjbmie4TLfX27Z3ZJjCM0=
X-Gm-Gg: Acq92OFfLqyIyh4lF9rmGmDmrihX/U7TNahQ7A8F/0juR5vcY7PeJXpdq0u1THhFkO3
 1mYUpX3B2/Vw6GosgaJrDxEX0HyTrgM4AHkA916CBR84ozQUOrOGXd0Ua6ag7PbEZU377Z/+cXl
 k4eY0U25ewUUjNYw3hxqd2i59bg5PnyTXeK891XR2Q1g8iuu/y31++39hraf20FBg/m7lUcgZMy
 66x9fLaXo/DU2Y9DDKqvZ9nIhedmyvV4EsZvTj1tveqXK+jlVmkbIYBU/eehuswfdIdQL+WVvn5
 O1k6GdHQgUCBElUzvY68SZhz3nmO8mVVZyQlnR8SmGNSLlzFFqzqrP1VIc4SYMW0aO+TW8331th
 DdtDr0ZR4Jl7ElW3ItJED2O6J+leOo43g4xKfd6lIYsxmW9bg2kBFvHP2h8cWnA4LOgR/je/JTx
 dAgYbHQ3xTQtjzPT6LxxXaQpFAOwBF1z6/3Lmjbnr9LA==
X-Received: by 2002:a05:600c:529b:b0:48e:6db3:ff2e with SMTP id
 5b1f17b1804b1-490c4e0219emr371553115e9.15.1781123713488; 
 Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:08 +0200
MIME-Version: 1.0
Message-Id: <20260610-wip-stmark2-dac-v5-3-b76b83366d5c@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v5 03/10] m68k: add DAC modules base addresses
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
X-Rspamd-Queue-Id: B855C66CCD6

From: Angelo Dureghello <adureghello@baylibre.com>

Add DAC controller 0 and 1 base addresses.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..f5acc962bb95 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -191,6 +191,11 @@
 #define MCFEPORT_EPPAR		0xfc090000
 #define MCFEPORT_EPIER		0xfc090003
 #define MCFEPORT_EPFR		0xfc090006
+/*
+ * DAC Modules.
+ */
+#define MCFDAC_BASE0		0xfc098000
+#define MCFDAC_BASE1		0xfc09c000
 /*
  *  RTC Module.
  */

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
