Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO0MAZSW+WmA+AIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 09:04:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ABC4C7736
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 09:04:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 119F5C8F290;
	Tue,  5 May 2026 07:04:49 +0000 (UTC)
Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de
 [46.38.245.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16E97C57B41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 17:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1777915006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htwcYAHQIOqaxElDjDYg+njAl/ofitRP9nvq1PHSWrQ=;
 b=AdIGNAC/f8eX5Nk4/DYRKJ47wDOaG5+Tm6BE7r0ce9U566IdBy2yLs6p8pj3MvelWbnPLz
 7Eok+5yzAdilxJ2cWdXWxP3de5HbS4RP7rcRyCLLUWkjYv8xQ2o6d/rSHkh1zxK0TP8xd/
 4Dj3Hvu8ShfBwj6Cyg9g7ZITiB/Q0Jw=
Received: from [192.168.0.2] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by oreshnik (OpenSMTPD) with ESMTPSA id 2d248f23
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 4 May 2026 17:16:46 +0000 (UTC)
From: Angelo Dureghello <angelo@kernel-space.org>
Date: Mon, 04 May 2026 19:16:46 +0200
MIME-Version: 1.0
Message-Id: <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
In-Reply-To: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
X-Mailer: b4 0.15.2
X-Mailman-Approved-At: Tue, 05 May 2026 07:04:46 +0000
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Greg Ungerer <gerg@uclinux.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/10] m68k: stmark2: add mcf5441x DAC
	platform devices
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
X-Rspamd-Queue-Id: D7ABC4C7736
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[kernel-space.org : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel-space.org:s=s1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[angelo@kernel-space.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelo@kernel-space.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel-space.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.937];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]

From: Angelo Dureghello <adureghello@baylibre.com>

Add mcf5441x DAC platform devices.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/stmark2.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 85502b81175e..30da9bcbfd63 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -94,8 +94,42 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dspi_dac0_resource[] = {
+	[0] = {
+		.start = MCFDAC_BASE0,
+		.end   = MCFDAC_BASE0 + 0xFF,
+		.flags = IORESOURCE_MEM,
+	},
+};
+
+/* DAC controller, id = bus number */
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = ARRAY_SIZE(dspi_dac0_resource),
+	.resource = dspi_dac0_resource,
+};
+
+static struct resource dspi_dac1_resource[] = {
+	[0] = {
+		.start = MCFDAC_BASE1,
+		.end   = MCFDAC_BASE1 + 0xFF,
+		.flags = IORESOURCE_MEM,
+	},
+};
+
+/* DAC controller, id = bus number */
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = ARRAY_SIZE(dspi_dac1_resource),
+	.resource = dspi_dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };
 
 /*

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
