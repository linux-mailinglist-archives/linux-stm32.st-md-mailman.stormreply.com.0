Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C15A1B16
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 23:32:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 783E6C640FC;
	Thu, 25 Aug 2022 21:32:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A4E0C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 21:32:49 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z16so7348911wrh.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 14:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EqzBE2zZDGLUoXZ6/uzFpkdW0uwLXRH/ZxpTVcEz4RY=;
 b=qRHXiAAEFxUcduAYJZefohZKXO+X74fsUPVcUnRRNf+vtvMwz8JzmfaFa/1seliOel
 N5+yl3sLaJJlffdQq01u8PTRL9UQxM/PoiC7ftzfbX51Aq8ANtKnXVyaXgD923wBKQqx
 rBg83MrdCs3pKmg8CGmdCWsr4aZh99glKYt7zXjnFcbfRHvzafycELQgPgmSYOf7BN47
 3MaiDabh9OZ1Utit2EFvQvYo7b9K4nHYjvp9OZyLoiy4FQG3LnBO8IAQNX5J9l2cb7T5
 rtgQnl9eXZzPWaaixqRuGQhKVWXU5V00NS72L6T+gCoNDqeMumddMdJCTb3+B406bi49
 Wkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EqzBE2zZDGLUoXZ6/uzFpkdW0uwLXRH/ZxpTVcEz4RY=;
 b=SlNXvojdD2nc49vAE0iXo4cchL6H0SQ4lyffbJrgq7PQr/gzkDtprluSyafE4M2Iwc
 WElFE64Pd7HpwDzfbiB74OpQqWzyAC99POMXSSauNl09sYFBLgMnR5pOSRxBysLwF44d
 FNEDF7PwWUbikIChW2oJFfvUqH7QsH1n2pwJoEUXK0tsAIp7Wj9EAf5jB1doLpqpIwHI
 G2TyG1K0B+j1DR7m1D5DPDARmp9EvygqIcVCWee2x+V2IyxuwDA3NeBEa3rOPu7srB+K
 jMl3ZmpxL4AM2x8Q+dVEtIwo3G7fFs9PL8788ochPiw8KNA5ei62LN+qUMCPygjuY9cM
 fomg==
X-Gm-Message-State: ACgBeo0V8aNvdSn7+OUjnSCDHXfZ0no+puV299iMyik/vgQrRNFDOvO5
 npQ8plUcp0LpMQrXkgRKYdE=
X-Google-Smtp-Source: AA6agR4t8yoF99sRe2L0fBzRS1+im+UO4VTke2Bd+B09oSf0uCYPQMeZRw3swuBH9PBDTRwnH39EJA==
X-Received: by 2002:a05:6000:701:b0:225:3f77:9793 with SMTP id
 bs1-20020a056000070100b002253f779793mr3124854wrb.202.1661463169088; 
 Thu, 25 Aug 2022 14:32:49 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c3b8300b003a319b67f64sm14167595wms.0.2022.08.25.14.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 14:32:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Aug 2022 23:32:46 +0200
Message-ID: <4207673.ejJDZkT8p0@kista>
In-Reply-To: <20220818135522.3143514-2-arnd@kernel.org>
References: <20220818135522.3143514-1-arnd@kernel.org>
 <20220818135522.3143514-2-arnd@kernel.org>
MIME-Version: 1.0
Cc: Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Peter Chen <peter.chen@nxp.com>,
 Tony Lindgren <tony@atomide.com>, Magnus Damm <magnus.damm@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Stefan Wahren <stefan.wahren@i2se.com>, linux-samsung-soc@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 Bin Liu <b-liu@ti.com>, Qin Jian <qinjian@cqplus1.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Felipe Balbi <balbi@ti.com>,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, Shannon Nelson <snelson@pensando.io>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 01/11] ARM: defconfig: reorder defconfig
	files
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

RG5lIMSNZXRydGVrLCAxOC4gYXZndXN0IDIwMjIgb2IgMTU6NTU6MjIgQ0VTVCBqZSBBcm5kIEJl
cmdtYW5uIG5hcGlzYWwoYSk6Cj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
PiAKPiBUaGUgZGVidWctaW5mbyBhbmQgY2FuIHN1YnlzdGVtIG9wdGlvbnMgaGF2ZSBtb3ZlZCBh
cm91bmQgaW4gdGhlCj4gJ3NhdmVkZWZjb25maWcnIG91dHB1dCwgc28gZml4IHRoZXNlIHVwIHRv
IHJlZHVjZSB0aGUgY2x1dHRlcgo+IGZyb20gdGhlIHNhdmVkZWZjb25maWcgY29tbWFuZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBh
cmNoL2FybS9jb25maWdzL2F0OTFfZHRfZGVmY29uZmlnICAgfCAgMiArLQo+ICBhcmNoL2FybS9j
b25maWdzL2RvdmVfZGVmY29uZmlnICAgICAgfCAgMiArLQo+ICBhcmNoL2FybS9jb25maWdzL2V4
eW5vc19kZWZjb25maWcgICAgfCAgMiArLQo+ICBhcmNoL2FybS9jb25maWdzL2lteF92Nl92N19k
ZWZjb25maWcgfCAgMiArLQo+ICBhcmNoL2FybS9jb25maWdzL2tleXN0b25lX2RlZmNvbmZpZyAg
fCAgNiArKystLS0KPiAgYXJjaC9hcm0vY29uZmlncy9scGMxOHh4X2RlZmNvbmZpZyAgIHwgIDIg
Ky0KPiAgYXJjaC9hcm0vY29uZmlncy9tbXAyX2RlZmNvbmZpZyAgICAgIHwgIDIgKy0KPiAgYXJj
aC9hcm0vY29uZmlncy9tcHMyX2RlZmNvbmZpZyAgICAgIHwgIDIgKy0KPiAgYXJjaC9hcm0vY29u
Zmlncy9tdWx0aV92NV9kZWZjb25maWcgIHwgIDIgKy0KPiAgYXJjaC9hcm0vY29uZmlncy9tdWx0
aV92N19kZWZjb25maWcgIHwgMTIgKysrKysrLS0tLS0tCj4gIGFyY2gvYXJtL2NvbmZpZ3MvbXZl
YnVfdjVfZGVmY29uZmlnICB8ICAyICstCj4gIGFyY2gvYXJtL2NvbmZpZ3MvbXhzX2RlZmNvbmZp
ZyAgICAgICB8ICA0ICsrLS0KPiAgYXJjaC9hcm0vY29uZmlncy9vbWFwMV9kZWZjb25maWcgICAg
IHwgIDIgKy0KPiAgYXJjaC9hcm0vY29uZmlncy9vbWFwMnBsdXNfZGVmY29uZmlnIHwgIDQgKyst
LQo+ICBhcmNoL2FybS9jb25maWdzL29yaW9uNXhfZGVmY29uZmlnICAgfCAgMiArLQo+ICBhcmNo
L2FybS9jb25maWdzL3B4YTE2OF9kZWZjb25maWcgICAgfCAgMiArLQo+ICBhcmNoL2FybS9jb25m
aWdzL3B4YTkxMF9kZWZjb25maWcgICAgfCAgMiArLQo+ICBhcmNoL2FybS9jb25maWdzL3B4YV9k
ZWZjb25maWcgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybS9jb25maWdzL3MzYzY0MDBfZGVmY29u
ZmlnICAgfCAgMiArLQo+ICBhcmNoL2FybS9jb25maWdzL3M1cHYyMTBfZGVmY29uZmlnICAgfCAg
MiArLQo+ICBhcmNoL2FybS9jb25maWdzL3NhbWE1X2RlZmNvbmZpZyAgICAgfCAgNiArKystLS0K
PiAgYXJjaC9hcm0vY29uZmlncy9zYW1hN19kZWZjb25maWcgICAgIHwgIDQgKystLQo+ICBhcmNo
L2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZyAgfCAgMiArLQo+ICBhcmNoL2FybS9jb25m
aWdzL3NvY2ZwZ2FfZGVmY29uZmlnICAgfCAgNiArKystLS0KPiAgYXJjaC9hcm0vY29uZmlncy9z
cDcwMjFfZGVmY29uZmlnICAgIHwgIDIgKy0KPiAgYXJjaC9hcm0vY29uZmlncy9zcGVhcjEzeHhf
ZGVmY29uZmlnIHwgIDIgKy0KPiAgYXJjaC9hcm0vY29uZmlncy9zcGVhcjN4eF9kZWZjb25maWcg
IHwgIDIgKy0KPiAgYXJjaC9hcm0vY29uZmlncy9zcGVhcjZ4eF9kZWZjb25maWcgIHwgIDIgKy0K
PiAgYXJjaC9hcm0vY29uZmlncy9zdG0zMl9kZWZjb25maWcgICAgIHwgIDIgKy0KPiAgYXJjaC9h
cm0vY29uZmlncy9zdW54aV9kZWZjb25maWcgICAgIHwgIDIgKy0KCkZvciBzdW54aToKQWNrZWQt
Ynk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+CgpCZXN0IHJlZ2Fy
ZHMsCkplcm5lagoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
