Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ey12MYLKKWqFdQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F366CCCD
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=S2uWgogW;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 765E5C8F282;
	Wed, 10 Jun 2026 20:35:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02EF3C8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 20:35:13 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490cdae130cso25763295e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781123712; x=1781728512;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
 b=S2uWgogW083Dg3EhtuDjZ19xxKb6rlu87wc+YEKqKyKYeHmUOovYdgtWrJMM9Hf9gW
 I7/B+znYMJhIC1rJtrjH4+RxrRQW6tJ0sikDh464RjFipPPur00rZ9iT4IL9WdWaXogp
 6Dzm6NYTTY8ZKH97653iRI4AZAEh3wFhOsFX/ZQqCGlsV07rTwfmCiLNaa4Y+q0dPij5
 /e8d48SzTif0+jZV6IxIlqisZ9bgxlrAh1I2xtD4lW+XBkKNKT4gqnmZ2j/Ohrth8T9s
 b1XHVKnnSfrN7ZWAgsgPKoZty4+omgCVNn5ScKRuCAJA0I/z6lzMEoUJHWFb1V0nOnDO
 SY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781123712; x=1781728512;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
 b=d87DfkhZKLoi2GyRd2sx6edfbXLPIn4xA3Ln78zwurp4tmHl6WXkmFupxj38CqGct0
 5p8ZqWjWyDFbF72qDa8NFg8PUuAQCwqjFHfKOeqBSMQCFWOcJFn6H5pJcq8P2tbjp+4i
 BZWEaxw3zwyU8H3KhZJNrHMWfqUGTc9QQwYMs174fWsYUeFzNkRdbLChlDGv/EKeK3Uc
 d+K089f57G35BXqgx7/g80pmT+qUC103aMOdpQFdKYP7rHCIsjfAAOpmh6s+MS4ekLB9
 H07dwUalu/s/laZyxQUowlCybgp2h0mxS1pmd9iJd+lIHiTc5OFbCpCzjgn0a1pa3CDC
 /8yw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+CwEDsuqVMKe5/DFzlDZSvSa8ZYKFG5JtFK74KtJcHr+QalmsgTD1rdmzcmp7utAgXpYpWJ+DK3GHEgg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz8p/rqKJzf9gBQT/8FpmkvPCoQm+2LuXunvqaI+Za4cQi25N1n
 JoD5izAcGMqSh20nGKUfiEjeFfR+OCV6hzdCdQCf7eSZ81j+vd23H57cRxVNccnBvFQ=
X-Gm-Gg: Acq92OEYXgDk1L1LXOuIPyq29RvRABY4rS2wAn8FclcapJno8h62Su9i6GEc9ne3O+g
 5z5k5SKNBNb+QyiWZpCoukn8aozrlCObIve+PfjxDAXW9A2537eD/sdk4imtDHUISzCPIu8IBg9
 v1D+/2m3LRjmbPlEEW98C+HZMJ9t+Wrplv7U02wx5OW8fvED2KLFB4WtU+9u6+BCAfuKRP2eum8
 nSODhQUp5NmqpAQ3HPa1YUws2bKMq9FJcjNQ581jYOrvAIPWbmhKDsL6gGkgcDeTcRXJ1evb+f4
 BFUMdM9S0a4iYzfF6rKKLs+fasom4N+QzY7uYm4LxngzBUouXT9vaAFj482lxctlisqjoYPzHe3
 bhmH+LMbk7gPkW2plYLlG8MSwqz+6D1hXXYocrah7Qs7/Xx031hqVo1MY3gqz0AtKZ07EfwLcRb
 4abJMP430TXKBlXjRE0/o05CVbmi52HOc4QcBq2Xcuyw==
X-Received: by 2002:a05:600c:628c:b0:48f:e26a:1744 with SMTP id
 5b1f17b1804b1-490c25a87f5mr431093845e9.9.1781123712367; 
 Wed, 10 Jun 2026 13:35:12 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:35:11 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:07 +0200
MIME-Version: 1.0
Message-Id: <20260610-wip-stmark2-dac-v5-2-b76b83366d5c@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v5 02/10] m68k: mcf5441x: add clock for DAC
	channel 1
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
X-Rspamd-Queue-Id: AD3F366CCCD

From: Angelo Dureghello <adureghello@baylibre.com>

Add missing clock for mcf5441x DAC channel 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 613b0275d9d8..5b5e09ecf487 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -44,6 +44,7 @@ DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
 DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
 DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
+DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -106,6 +107,7 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
 	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
@@ -176,6 +178,7 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_35, /* pit.3 */
 	&__clk_0_37, /* adc */
 	&__clk_0_38, /* dac.0 */
+	&__clk_0_39, /* dac.1 */
 	&__clk_0_44, /* usb otg */
 	&__clk_0_45, /* usb host */
 	&__clk_0_47, /* ssi.0 */

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
