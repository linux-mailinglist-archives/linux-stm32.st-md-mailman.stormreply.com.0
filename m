Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1elaCFvkVWpXuwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2026 09:25:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9647B751CF7
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2026 09:25:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b="PkT/pm+n";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22538CA8E4A;
	Tue, 14 Jul 2026 07:25:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7BFCC1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2026 07:25:12 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so4526385e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2026 00:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1784013912; x=1784618712;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=peGrgF9PpfvVPhNKWNItMli4F0UFAyd4BhokmZXNYpk=;
 b=PkT/pm+n26hV1loCnf3Ryv5dZjVm3bFly4o/bzgZKYPZwtvGD+eXojvA/ndjgi202h
 bU8GmROQ6cmP5HTdQc3idIh5DieqfYYBJBmeLC+PwJ/ZS0g7/8GsZMnbwOilIYxAwM81
 gofpeiXpFnw7M1i6wZdT5vRyWhlviH5+jZUUkzCSSIPz+nACESuv4NL9MaE/HPAy7rbE
 Ay4HAZJ1xmEyCgf5DFo6ZfQdzN36gcu78JplpvUIfQ8bdX9RjGEn4wHRH9ie2pueE6/b
 0otFWvq5mGeUBs9Y58+imVqQmHazTSj2O0LDCLSehG7i8zuwOg4zQyG7KboB1oNBB2/e
 LUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784013912; x=1784618712;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=peGrgF9PpfvVPhNKWNItMli4F0UFAyd4BhokmZXNYpk=;
 b=X6KlYWnJnc8KQNYSDoaIsumvsWp7yG++zLrFHWb2cYu0SdUV4Xrz0BniplvBWh07wr
 lnl43aCZceMCUZsZ1eglBhRtspg5l0c/H4pFvrVd1Ib9HUxwzn7wB3tqxhozeBo5k57e
 BITcTb1CzTwUs8aP4dVhTqsyEHNYTRZzllj6czXaqh6sggDTSV8tQIA0If/SNc3JCz/T
 5MzOytsVx+eu5OHKTn+tZgslIBzOwx/jF4b7XYaVdQtup4Yq1tFaq6q4bEf9IiZOSjAV
 SH4FB2FnmGBYu8EuQoR9KFfPZkWcu2aR0Y07usb9H9JBPnjMF072yiTrjAdTa3EWpox4
 X8qg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoRZkked/GUoyvDJw7xSoBrZdm6w5kx6WhdEkrOgLTfQZd0Kaxs7LodJy5nE8aVgOS8Qfm2S8S7Vs0WrA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz5HQTj15ofMdBLk6cZAbe/H/6jA8xBHPC066SZJCHP/sI7rkwD
 Tjb/zT5f16K5Iaxf4As/T2/37va9FIFLkcMeT4h9gM2mtYz8QnzgWRbfNVYqBa+wWHg=
X-Gm-Gg: AfdE7cmQ3P9tKeHN1hv0uYgWpVSxUWqwaji+VoqRHcr1ddk+cT1nTNxOSvWjPiygP7p
 UDhB4/tDRlfrs67M4imIijVr2wANS7crkcGCwsw3MfCPKymwjYa+nVhEMiPMjwYfiGrNWw0JrhP
 efkrGc7kknHBFajrW9GKtSt2XLnl8cam7c8qIhaFDqtl6bSEJOevPZeduz6be+nMyI/WLVJj7LH
 XzDCZsa6mOjmFxJp0tTGb49L747yv5aftomHCncnaAV4iSVSOEkmFzkBwz7SCcyBcALWUioopAR
 U2TBfMd+huOs4h57GVHppGs9hg4tPAmX1fdkb4cKFCd6ZuGr3DGbAEiB7N0IGB+wCZKQzRoa1KQ
 s01XeO4xAXhI6NINjwJaavlyAqMhmKGzfF7WgafQcI5vrmEDF9+Q2xq8xCjRrugw/UVw5IRI7Zi
 PCkNfwUSW2TA+UB7GS9dq3X/FmolIlpb8bAJLL70kEOD5siPnatCpDBJ3YBM+3u7WMoC5/x3ZiM
 N8O
X-Received: by 2002:a05:600c:8108:b0:495:39a9:f8bb with SMTP id
 5b1f17b1804b1-49539a9f8cbmr778035e9.27.1784013912057; 
 Tue, 14 Jul 2026 00:25:12 -0700 (PDT)
Received: from localhost
 (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:b44a:8042:1173:aa03])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-493f3a60404sm297426135e9.1.2026.07.14.00.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 00:25:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 14 Jul 2026 09:24:01 +0200
Message-ID: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7258;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=R2k78ifV57I7bqElN2rqk35dKurD9aNrsEluPiAhhMs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQbXm7nXijEy1eKUYHbl4wNScCj2qk8mUj+/
 y7zzDJKfG2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkGwAKCRCPgPtYfRL+
 TjNvB/9C7+ymz4UqICZy8QPsc/Ow/qn0VBiFWbW1tSEKOBwwkQZo1Hy7AQ+gRBuqZ6lBXIdivbl
 J6Moa1BauQELgVWaBtRg0uf+8VuSizBtFiZs9QSAnyGq1As8Ig3H0TlZMAEH7loRfQoggE2XZy9
 Z6FBACymjA3pjCM6m6bFnTEdA7tf/NkWWZgyekUvsu73ijI6WRdlCw8zOm3IsrB5CrRvIp5ys9E
 168mnbodlTxBlZAxkLyLZkx1mBnl7QBeAFNihaznSJgydZjTVWUJ8Mg0DbCJcUjhwIRfsM0cj+S
 HdpAl3yxTBLjbpBAO/O99zNroQbc5aZ9lfnoj9rKKt4u/QJg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 linux-acpi@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Bamvor Jian Zhang <bamv2005@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 Adrian Ng <adrianhoyin.ng@altera.com>, Sven Peter <sven@kernel.org>,
 linux-omap@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>,
 Andy Shevchenko <andy@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matt Redfearn <matt.redfearn@blaize.com>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, Michael Walle <mwalle@kernel.org>,
 Lixu Zhang <lixu.zhang@intel.com>, linux-aspeed@lists.ozlabs.org,
 Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>,
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>, Michael Buesch <m@bues.ch>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 linux-gpio@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Imre Kaloz <kaloz@openwrt.org>,
 Neil Jones <neil.jones@blaize.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 William Breathitt Gray <wbg@kernel.org>, imx@lists.linux.dev,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Frank Li <Frank.Li@nxp.com>, linux-tegra@vger.kernel.org,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Fabio Estevam <festevam@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Kevin Hilman <khilman@kernel.org>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Robert Richter <rric@kernel.org>,
 Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
 Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Avi Fishman <avifishman70@gmail.com>, asahi@lists.linux.dev,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Patrick Venture <venture@google.com>, Neal Gompa <neal@gompa.dev>,
 Hans de Goede <hansg@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-riscv@lists.infradead.org, James Cowgill <james.cowgill@blaize.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Srinivas Neeli <srinivas.neeli@amd.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Janne Grunau <j@jannau.net>,
 openbmc@lists.ozlabs.org, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Manivannan Sadhasivam <mani@kernel.org>, virtualization@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yang Shen <shenyang39@huawei.com>, Romain Perier <romain.perier@gmail.com>,
 Keerthy <j-keerthy@ti.com>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Mika Westerberg <westeri@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Paul Walmsley <pjw@kernel.org>
Subject: [Linux-stm32] [PATCH v1 00/20] gpio: Improvements around device-id
	arrays
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:nikolaos.pasaloukos@blaize.com,m:tmaimon77@gmail.com,m:geert+renesas@glider.be,m:conor.dooley@microchip.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:linux-acpi@vger.kernel.org,m:ludovic.desroches@microchip.com,m:bamv2005@gmail.com,m:andrew@codeconstruct.com.au,m:Eugeniy.Paltsev@synopsys.com,m:s.hauer@pengutronix.de,m:linux-unisoc@lists.infradead.org,m:adrianhoyin.ng@altera.com,m:sven@kernel.org,m:linux-omap@vger.kernel.org,m:hoan@os.amperecomputing.com,m:andy@kernel.org,m:sbranden@broadcom.com,m:daire.mcnamara@microchip.com,m:linux-kernel@vger.kernel.org,m:samuel.holland@sifive.com,m:kernel@pengutronix.de,m:matt.redfearn@blaize.com,m:info@metux.net,m:mwalle@kernel.org,m:lixu.zhang@intel.com,m:linux-aspeed@lists.ozlabs.org,m:daniel@thingy.jp,m:albeu@free.fr,m:kabel@kernel.org,m:thierry.reding@kernel.org,m:m@bues.ch,m:zhang.lyra@gmail.com,m:magnus.damm@gmail.com,m:jonathanh@nvidia.com,m:linux-rockchi
 p@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:kaloz@openwrt.org,m:neil.jones@blaize.com,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:mathieu.dubois-briand@bootlin.com,m:wbg@kernel.org,m:imx@lists.linux.dev,m:andre.draszik@linaro.org,m:Frank.Li@nxp.com,m:linux-tegra@vger.kernel.org,m:shubhrajyoti.datta@amd.com,m:festevam@gmail.com,m:opendmb@gmail.com,m:benjaminfair@google.com,m:khilman@kernel.org,m:zhuyinbo@loongson.cn,m:yuenn@google.com,m:bcm-kernel-feedback-list@broadcom.com,m:joel@jms.id.au,m:orsonzhai@gmail.com,m:grygorii.strashko@ti.com,m:rric@kernel.org,m:alan.borzeszkowski@linux.intel.com,m:rjui@broadcom.com,m:vz@mleia.com,m:baolin.wang@linux.alibaba.com,m:avifishman70@gmail.com,m:asahi@lists.linux.dev,m:sakari.ailus@linux.intel.com,m:venture@google.com,m:neal@gompa.dev,m:hansg@kernel.org,m:tali.perry1@gmail.com,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:linux-riscv@lists.infradead.org,m:jame
 s.cowgill@blaize.com,m:robert.jarzmik@free.fr,m:srinivas.neeli@amd.com,m:florian.fainelli@broadcom.com,m:j@jannau.net,m:openbmc@lists.ozlabs.org,m:piotr.wojtaszczyk@timesys.com,m:mani@kernel.org,m:virtualization@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:ssantosh@kernel.org,m:matthias.bgg@gmail.com,m:andriy.shevchenko@linux.intel.com,m:angelogioacchino.delregno@collabora.com,m:shenyang39@huawei.com,m:romain.perier@gmail.com,m:j-keerthy@ti.com,m:israel.a.cepeda.lopez@intel.com,m:westeri@kernel.org,m:vireshk@kernel.org,m:pjw@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[blaize.com,gmail.com,glider.be,microchip.com,st-md-mailman.stormreply.com,sntech.de,vger.kernel.org,codeconstruct.com.au,synopsys.com,pengutronix.de,lists.infradead.org,altera.com,kernel.org,os.amperecomputing.com,broadcom.com,sifive.com,metux.net,intel.com,lists.ozlabs.org,thingy.jp,free.fr,bues.ch,nvidia.com,amd.com,openwrt.org,bootlin.com,lists.linux.dev,linaro.org,nxp.com,google.com,loongson.cn,jms.id.au,ti.com,linux.intel.com,mleia.com,linux.alibaba.com,gompa.dev,mail.toshiba,jannau.net,timesys.com,collabora.com,huawei.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[98];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9647B751CF7

SGVsbG8sCgp0aGUgb3JpZ2luYWwgbW90aXZhdGlvbiBmb3IgdGhpcyBzZXJpZXMgYXJlIHRoZSBw
YXRjaGVzIHRoYXQgY29udmVydCB0aGUKYXJyYXlzIHRvIHVzZSBuYW1lZCBpbml0aWFsaXplcnMs
IHNlZQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc4MDA0ODkyNS5naXQudS5r
bGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8KZm9yIHRoZSBpZGVhIGJlaGluZCBpdC4gVGhlbiB0
aGUgcXVlc3QgZ3JldywgZHVlIHRvIHRoaW5raW5nIHRvIGNvbnZlcnQKYWxsIGRldmljZSBpZCBh
cnJheXMgaW4gYSBzaW5nbGUgc2VyaWVzIHRvIG5vdCBib3RoZXIgZWFjaCBzdWJzeXN0ZW0KcmVw
ZWF0ZWRseVsxXSwgdGhlbiBJIHNwb3R0ZWQgYSBmZXcgbWlzc2luZyBNT0RVTEVfREVWSUNFX1RB
QkxFIGFubm90YXRpb25zCmFuZCBkZWNpZGVkIHRvIGZpeCB0aGVzZS4gVGhlbiBJIG5vdGljZWQg
dGhhdCBzb21lIGRyaXZlcl9kYXRhIGVudHJpZXMKdG8gYmUgdW51c2VkIGFuZCB0aGVuIGRyb3Bw
ZWQgdGhlbSBpbnN0ZWFkIG9mIGNvbnZlcnRpbmcgdG8gbmFtZWQKaW5pdGlhbGl6ZXJzLiBBbmQg
YXMgbXkgc2NyaXB0cyB0aGF0IGRvIG1vc3Qgb2YgdGhlc2UgY2hhbmdlcyBhbHNvIGNhcmVkCmFi
b3V0IHRyYWlsaW5nIGNvbW1hcyBhbmQgaG93IHRoZSBsaXN0IHRlcm1pbmF0b3JzIGxvb2ssIHRo
aXMgaXMgYWxzbwphZGRyZXNzZWQgaW4gdGhpcyBzZXJpZXMuIEFuZCBzbyB0aGlzIGdyZXcgdG8g
MjAgcGF0Y2hlcyAuLi4KClRoaXMgaXMgYmFzZWQgb24geWVzdGVyZGF5J3MgbmV4dCBhbmQgb2J2
aW91c2x5IG1lcmdlIHdpbmRvdyBtYXRlcmlhbC4KCkJlc3QgcmVnYXJkcwpVd2UKClsxXSBPZiBj
b3Vyc2UgdGhpcyBvbmx5IHdvcmtzIGlmIG5vIG5ldyBlbnRyaWVzIGFyZSBhZGRlZCB0aGF0CiAg
ICBpbml0aWFsaXplIC5kcml2ZXJfZGF0YSBieSBhIHBvc2l0aW9uYWwgaW5pdGlhbGl6ZXIgdW50
aWwgSSBjb21lCiAgICBhcm91bmQgdG8gYWRkIHRoZSB1bmlvbiB0byB0aGUgcmVzcGVjaXZlIGRl
dmljZSBpZCBzdHJ1Y3QuCgpVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSAoMjAp
OgogIGdwaW86IERyb3AgdW51c2VkIGFzc2lnbm1lbnQgb2YgYWNwaV9kZXZpY2VfaWQgZHJpdmVy
IGRhdGEKICBncGlvOiBtYXg3MzAxOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIHNwaV9kZXZp
Y2VfaWQgZHJpdmVyIGRhdGEKICBncGlvOiBtbWlvOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9m
IHBsYXRmb3JtX2RldmljZV9pZCBkcml2ZXIgZGF0YQogIGdwaW86IGxqY2E6IERyb3AgdW51c2Vk
IGFzc2lnbm1lbnQgb2YgYXV4aWxpYXJ5X2RldmljZV9pZCBkcml2ZXIgZGF0YQogIGdwaW86IEFk
ZCBtaXNzaW5nIEFDUEkgbW9kdWxlIGFubm90YXRpb25zCiAgZ3Bpbzogc29kYXZpbGxlOiBBZGQg
bWlzc2luZyBwY2kgbW9kdWxlIGFubm90YXRpb25zCiAgZ3BpbzogQWRkIG1pc3NpbmcgT0YgbW9k
dWxlIGFubm90YXRpb25zCiAgZ3BpbzogcHhhOiBBZGQgbWlzc2luZyBwbGF0Zm9ybSBtb2R1bGUg
YW5ub3RhdGlvbnMKICBncGlvOiBBZGQgbWlzc2luZyBkbWkgbW9kdWxlIGFubm90YXRpb25zCiAg
Z3BpbzogcGwwNjE6IFVzZSBlbXB0eSBpbml0aWFsaXplciBmb3IgYW1iYV9pZCB0ZXJtaW5hdG9y
CiAgZ3BpbzogVXNlIG5hbWVkIGluaXRpYWxpemVycyBmb3IgYWNwaV9kZXZpY2VfaWQgYXJyYXkK
ICBncGlvOiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBzcGlfZGV2aWNlX2lkIGFycmF5CiAg
Z3BpbzogdmlydGlvOiBVc2UgYSBuYW1lZCBpbml0aWFsaXplciBmb3IgdmlydGlvX2RldmljZV9p
ZCBhcnJheQogIGdwaW86IHBjZjg1N3g6IFVzZSBuYW1lZCBpbml0aWFsaXplcnMgZm9yIG9mX2Rl
dmljZV9pZCBhcnJheQogIGdwaW86IFVuaWZ5IHN0eWxlIG9mIGFjcGlfZGV2aWNlX2lkIGFycmF5
cwogIGdwaW86IFVuaWZ5IHN0eWxlIG9mIG9mX2RldmljZV9pZCBhcnJheXMKICBncGlvOiBtYXg3
NzYyMDogVW5pZnkgc3R5bGUgb2YgcGxhdGZvcm1fZGV2aWNlX2lkIGFycmF5cwogIGdwaW86IFVu
aWZ5IHN0eWxlIG9mIHNwaV9kZXZpY2VfaWQgYXJyYXlzCiAgZ3BpbzogVW5pZnkgc3R5bGUgb2Yg
cGNpX2RldmljZV9pZCBhcnJheXMKICBncGlvOiBVbmlmeSBzdHlsZSBvZiB2YXJpb3VzICpfZGV2
aWNlX2lkIGFycmF5cwoKIGRyaXZlcnMvZ3Bpby9ncGlvLTc0eDE2NC5jICAgICAgICAgIHwgIDQg
KystLQogZHJpdmVycy9ncGlvL2dwaW8tYWRucC5jICAgICAgICAgICAgfCAgNCArKy0tCiBkcml2
ZXJzL2dwaW8vZ3Bpby1hZ2dyZWdhdG9yLmMgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bp
by1hbHRlcmEtYTEwc3IuYyAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1hbHRlcmEuYyAg
ICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWFtZDgxMTEuYyAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLWFtZHB0LmMgICAgICAgICAgIHwgIDggKysrKy0tLS0K
IGRyaXZlcnMvZ3Bpby9ncGlvLWFzcGVlZC1zZ3Bpby5jICAgIHwgMTAgKysrKystLS0tLQogZHJp
dmVycy9ncGlvL2dwaW8tYXNwZWVkLmMgICAgICAgICAgfCAxMCArKysrKy0tLS0tCiBkcml2ZXJz
L2dwaW8vZ3Bpby1hdGg3OS5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1i
Y20ta29uYS5jICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3Bpby9ncGlvLWJsenAxNjAwLmMgICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLWJyY21zdGIuYyAgICAgICAgIHwgIDIgKy0K
IGRyaXZlcnMvZ3Bpby9ncGlvLWJ0OHh4LmMgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bp
by9ncGlvLWNhZGVuY2UuYyAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tY3Jl
Zy1zbnBzLmMgICAgICAgfCAgNSArKystLQogZHJpdmVycy9ncGlvL2dwaW8tZGF2aW5jaS5jICAg
ICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWR3YXBiLmMgICAgICAgICAgIHwg
MTQgKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWVtLmMgICAgICAgICAgICAgIHwg
IDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tZXA5M3h4LmMgICAgICAgICAgfCAgMSArCiBkcml2
ZXJzL2dwaW8vZ3Bpby1mdGdwaW8wMTAuYyAgICAgICB8ICAzICsrLQogZHJpdmVycy9ncGlvL2dw
aW8tZ3Jhbml0ZXJhcGlkcy5jICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1ncmdwaW8u
YyAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1ndy1wbGQuYyAgICAgICAgICB8
ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWhpc2kuYyAgICAgICAgICAgIHwgIDYgKysrLS0t
CiBkcml2ZXJzL2dwaW8vZ3Bpby1obHdkLmMgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMv
Z3Bpby9ncGlvLWlteC1zY3UuYyAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncGlvL2dwaW8taXhw
NHh4LmMgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1samNhLmMgICAgICAg
ICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWxvb25nc29uLTY0Yml0LmMgIHwgIDQg
KystLQogZHJpdmVycy9ncGlvL2dwaW8tbHAzOTQzLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ncGlvL2dwaW8tbHBjMzJ4eC5jICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bp
by1tYWNzbWMuYyAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1heDMxOTF4
LmMgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1tYXg3MzAxLmMg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1tYXg3MzYwLmMgICAgICAgICB8ICA4
ICsrKystLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1tYXg3NzYyMC5jICAgICAgICB8ICA0ICsrLS0K
IGRyaXZlcnMvZ3Bpby9ncGlvLW1heDc3NzU5LmMgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bp
by9ncGlvLW1iODZzN3guYyAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1sLWlv
aC5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1seGJmMy5jICAgICAgICAg
IHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tbW0tbGFudGlxLmMgICAgICAgfCAgMiArLQog
ZHJpdmVycy9ncGlvL2dwaW8tbW1pby5jICAgICAgICAgICAgfCAgMyArLS0KIGRyaXZlcnMvZ3Bp
by9ncGlvLW1vY2t1cC5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tbW94
dGV0LmMgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1tcGM1MjAwLmMgICAg
ICAgICB8ICA1ICsrKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4LmMgICAgICAgICB8IDI1
ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1wZnMuYyAgICAg
ICAgICAgIHwgIDEgKwogZHJpdmVycy9ncGlvL2dwaW8tbXBzc2UuYyAgICAgICAgICAgfCAgMyAr
LS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1zYzMxMy5jICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9n
cGlvL2dwaW8tbXQ3NjIxLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tbXZl
YnUuYyAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwaW8vZ3Bpby1teGMuYyAgICAgICAgICAg
ICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1teHMuYyAgICAgICAgICAgICB8ICA0ICsrLS0K
IGRyaXZlcnMvZ3Bpby9ncGlvLW5vbWFkaWsuYyAgICAgICAgIHwgIDcgKysrKy0tLQogZHJpdmVy
cy9ncGlvL2dwaW8tbm92YWxha2UtZXZlbnRzLmMgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bp
by1ucGNtLXNncGlvLmMgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9ncGlvL2dwaW8tb2N0ZW9u
LmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tb21hcC5jICAgICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tcGFsbWFzLmMgICAgICAgICAgfCAxMCArKysrKy0t
LS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1wY2E5NTN4LmMgICAgICAgICB8ICAzICsrLQogZHJpdmVy
cy9ncGlvL2dwaW8tcGNhOTU3MC5jICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8t
cGNmODU3eC5jICAgICAgICAgfCAyNiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogZHJpdmVy
cy9ncGlvL2dwaW8tcGNpLWlkaW8tMTYuYyAgICAgfCAgMyArKy0KIGRyaXZlcnMvZ3Bpby9ncGlv
LXBjaWUtaWRpby0yNC5jICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXBpc29z
ci5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tcGwwNjEuYyAgICAgICAg
ICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tcG1pYy1laWMtc3ByZC5jICAgfCAgMiArLQog
ZHJpdmVycy9ncGlvL2dwaW8tcHhhLmMgICAgICAgICAgICAgfCAyMCArKysrKysrKysrKy0tLS0t
LS0tLQogZHJpdmVycy9ncGlvL2dwaW8tcWl4aXMtZnBnYS5jICAgICAgfCAgMyArLS0KIGRyaXZl
cnMvZ3Bpby9ncGlvLXJkYS5jICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlv
LXJlYWx0ZWstb3R0by5jICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLXJvY2tjaGlwLmMg
ICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tc2FtYTVkMi1waW9idS5jICAgfCAg
MiArLQogZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ncGlvL2dwaW8tc2wyOGNwbGQuYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8t
c29kYXZpbGxlLmMgICAgICAgfCAgMyArKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLXNwZWFyLXNwaWNz
LmMgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwaW8vZ3Bpby1zcHJkLmMgICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1zdG1wZS5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L2dwaW8vZ3Bpby1zdHAteHdheS5jICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby10
ZWdyYS5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby10ZWdyYTE4Ni5jICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby10aHVuZGVyeC5jICAgICAgICB8ICAzICst
LQogZHJpdmVycy9ncGlvL2dwaW8tdHBzNjUyMTguYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9n
cGlvL2dwaW8tdHM0ODAwLmMgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby10
d2w0MDMwLmMgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXVzYmlvLmMgICAg
ICAgICAgIHwgMTMgKysrKysrKy0tLS0tLQogZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYyAgICAg
ICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby12aXJ0aW8uYyAgICAgICAgICB8ICA0
ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXZpc2NvbnRpLmMgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvZ3Bpby9ncGlvLXdhdmVzaGFyZS1kc2kuYyAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlv
LXhnZW5lLXNiLmMgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby14Z2VuZS5j
ICAgICAgICAgICB8IDEwICsrKysrKy0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXhncy1pcHJvYy5j
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLXhpbGlueC5jICAgICAgICAgIHwgIDIg
Ky0KIGRyaXZlcnMvZ3Bpby9ncGlvLXhscC5jICAgICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2
ZXJzL2dwaW8vZ3Bpby14cmExNDAzLmMgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9ncGlv
L2dwaW8temV2aW8uYyAgICAgICAgICAgfCAgNSArKystLQogZHJpdmVycy9ncGlvL2dwaW8tenlu
cW1wLW1vZGVwaW4uYyAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW9saWItYWNwaS1xdWlya3Mu
YyAgfCAgMyArKy0KIDEwMSBmaWxlcyBjaGFuZ2VkLCAyMzEgaW5zZXJ0aW9ucygrKSwgMjExIGRl
bGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiA0OTM2MjM5NGRhZDdkZjY2YzI3NGM4NjdhMjcxMzk0
YzEwY2EyYmI4Ci0tIAoyLjU1LjAuMTEuZzE1MzY2NmE3ZDliYgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
