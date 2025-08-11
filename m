Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D595B21ECF
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BDD2C3F93B;
	Tue, 12 Aug 2025 07:10:01 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37774C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:59:27 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6153a19dddfso6865466a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754927966; x=1755532766;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TvyCEuzC+XGQIfI6+Ojs1caIw/9527DVynHbE5eSZOc=;
 b=KRg6twk4YNoZm8ghp7dFjEaMkQjm6qqI+xgIeWOtOS8vFzQrjh/sVMssV3CdsoT4Ce
 jniumYUsIbvrhbrPnMpBaPeiA7b4Krgz1nFUgax86/L4jkwuVv3Z0kLAakfKmctwrHZw
 MvgE0sSQRX6hA/Nueu0bE1M5hek+qMOOejenyrtXTHucPn0aKxeNmdx6E9yf62gOdO9S
 X0Lqk46EDxr2u4BE5Y8YTifXz9eUhCel4CKAvlHakvjQ1sgOIPmDB5XAuROxt2uhjEOO
 4cOv8FS2l5da8KBrz24r39bX0uF4bXakslYLwwJxE3xKeQvHPonTrABQh9R4/WpFYXEy
 PKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754927966; x=1755532766;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TvyCEuzC+XGQIfI6+Ojs1caIw/9527DVynHbE5eSZOc=;
 b=WGpvM7IYLkYCYNIplBruu99FfaERDivaB5GMj8xqkAb8xQh5nobZoVWiTw9wAp5blj
 LkHH/g4h1nEA9HLoJ7DfrJHZoLn0FoAtGgNtbq641yoLLxSk91N+xmnhkIIVZTRF0/9P
 LU7arwX5H+8ScD4XuOvVZYeK3Tj3u73/Eo2gZh3z4Q49V9KRb/lSeh1UePkUdBQTYjXe
 FhaQH+2K7I+c88LETEoeX/gqUEvxYVACxZda695YtpZ8cUhQGD4THbuTesy98SldilvZ
 Dfz3aOKjRZhiYubWgt9Hn4q1hLt0FOZq/LkOHpAk1tvw+cubZxjjzOoJOCe50JuzKnj5
 wdVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0zOZSpVQEda9REqMPcXoaKOKvRTDfu6kel2gDFS2CQDAB9NBo8MPuGbUheBBvC18gliGGQ9uUBaee6Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzZ5sICtP9JkHBOm3Y07JqwvpEYWFZY4eOs4b88oi6n7aAFbnKV
 49wc3EuMpPrJDr76x11O6aV43QM+iVYiCnTYyBq4TuPbJ7T0cI+RWhsb
X-Gm-Gg: ASbGncvpuoVRSZBzt/u5cTjJxZVcE8aCzroMtGDNRI/lkU4HpW2PhaWiGlERJ4MXTus
 sD5+JnWcv7vaaN9w03+LFAktkTazmz/n83XWHoga4tLN3r4HhwmCcFj3HxVenI5sAULFPUzPxZm
 qQ6mHpbJFqc7GmMw5o8FiHfabVrMV3xo5ZZKgeaRtm5XuVKUpJ1I41qgzgWQQDfEFV8KmoCf1oC
 Rsla3OGPXrIbLgxUiPbS5ZYiIBn/NNM0XVeWMZ/ibea//GnavKB247bpv4wPPm9OQnfFD2RCyW6
 cxaMiPCSEfKjq4+2ymgNjDOzGq3rrpeEPRNwLUc/p24AuXet2HOraxuA8n4wx7cSetqrK3oReIz
 LPizI9l9YqA/+5BirinQoHeKAZ2q1oq892brnl2I=
X-Google-Smtp-Source: AGHT+IHR6aQlSF/8bXSoH4TD6ap2xoMQpmbGXXfb1yr3omEUKfVx4ptOTSMnNibgVm0ppSBcD6Zkmg==
X-Received: by 2002:a05:6402:42c5:b0:618:4044:67a7 with SMTP id
 4fb4d7f45d1cf-61840446cc7mr1952899a12.5.1754927966277; 
 Mon, 11 Aug 2025 08:59:26 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618200a0159sm2966360a12.6.2025.08.11.08.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:59:25 -0700 (PDT)
Message-ID: <522ae36bf788df6d957bfee671857d6b2e1e8863.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil	 <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya	 <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Vladimir
 Zapolskiy	 <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan	 <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai	
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue	 <alexandre.torgue@foss.st.com>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam	
 <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa
 <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,  Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>,  Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
 <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>,  Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Qin Jian	 <qinjian@cqplus1.com>, Viresh Kumar
 <vireshk@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Alex Helms	 <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,  Liviu Dudau
 <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Nobuhiro
 Iwamatsu	 <nobuhiro1.iwamatsu@toshiba.co.jp>
Date: Mon, 11 Aug 2025 17:59:22 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Aug 2025 07:09:59 +0000
Cc: imx@lists.linux.dev, soc@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 arm-scmi@vger.kernel.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-actions@lists.infradead.org,
 asahi@lists.linux.dev, sophgo@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 001/114] clk: at91: peripheral: fix return
	value
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDExOjE3IC0wNDAwLCBCcmlhbiBNYXNuZXkgdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IAo+
IGRldGVybWluZV9yYXRlKCkgaXMgZXhwZWN0ZWQgdG8gcmV0dXJuIGFuIGVycm9yIGNvZGUsIG9y
IDAgb24gc3VjY2Vzcy4KPiBjbGtfc2FtOXg1X3BlcmlwaGVyYWxfZGV0ZXJtaW5lX3JhdGUoKSBo
YXMgYSBicmFuY2ggdGhhdCByZXR1cm5zIHRoZQo+IHBhcmVudCByYXRlIG9uIGEgY2VydGFpbiBj
YXNlLiBUaGlzIGlzIHRoZSBiZWhhdmlvciBvZiByb3VuZF9yYXRlKCksCj4gc28gbGV0J3MgZ28g
YWhlYWQgYW5kIGZpeCB0aGlzIGJ5IHNldHRpbmcgcmVxLT5yYXRlLgo+IAo+IEZpeGVzOiBiNGMx
MTVjNzYxODRmICgiY2xrOiBhdDkxOiBjbGstcGVyaXBoZXJhbDogYWRkIHN1cHBvcnQgZm9yIGNo
YW5nZWFibGUgcGFyZW50IHJhdGUiKQo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8Ym1h
c25leUByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFu
ZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL2Nsay9hdDkxL2Nsay1w
ZXJpcGhlcmFsLmMgfCA3ICsrKysrLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2F0OTEvY2xr
LXBlcmlwaGVyYWwuYyBiL2RyaXZlcnMvY2xrL2F0OTEvY2xrLXBlcmlwaGVyYWwuYwo+IGluZGV4
IGMxNzNhNDRjODAwYWE4Y2M2OTcwYzI2Njk5NWY0YTYwYjBhMzg1NTQuLjYyOWYwNTBhODU1YWFl
YmZkMWEwM2ZmODdjMmIwMTZjZDIyODRhNWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvYXQ5
MS9jbGstcGVyaXBoZXJhbC5jCj4gKysrIGIvZHJpdmVycy9jbGsvYXQ5MS9jbGstcGVyaXBoZXJh
bC5jCj4gQEAgLTI3OSw4ICsyNzksMTEgQEAgc3RhdGljIGludCBjbGtfc2FtOXg1X3BlcmlwaGVy
YWxfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJbG9uZyBiZXN0X2RpZmYg
PSBMT05HX01JTjsKPiDCoAl1MzIgc2hpZnQ7Cj4gwqAKPiAtCWlmIChwZXJpcGgtPmlkIDwgUEVS
SVBIRVJBTF9JRF9NSU4gfHwgIXBlcmlwaC0+cmFuZ2UubWF4KQo+IC0JCXJldHVybiBwYXJlbnRf
cmF0ZTsKPiArCWlmIChwZXJpcGgtPmlkIDwgUEVSSVBIRVJBTF9JRF9NSU4gfHwgIXBlcmlwaC0+
cmFuZ2UubWF4KSB7Cj4gKwkJcmVxLT5yYXRlID0gcGFyZW50X3JhdGU7Cj4gKwo+ICsJCXJldHVy
biAwOwo+ICsJfQo+IMKgCj4gwqAJLyogRmlzdCBzdGVwOiBjaGVjayB0aGUgYXZhaWxhYmxlIGRp
dmlkZXJzLiAqLwo+IMKgCWZvciAoc2hpZnQgPSAwOyBzaGlmdCA8PSBQRVJJUEhFUkFMX01BWF9T
SElGVDsgc2hpZnQrKykgewoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
