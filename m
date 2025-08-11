Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB2B21ED0
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 781D2C3F931;
	Tue, 12 Aug 2025 07:10:05 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6DDBC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 16:00:51 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-af9611d8ff7so808086066b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754928051; x=1755532851;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
 b=kE9MCE/FirKbLeBx7fQDy5RwUe5nruKolEOECGDqujf4oMytp8uMrYNMQjqZIOdiYV
 nFUInOPO1fNf7ulv6DvTiYvvk7Jb9SvwSBJGfZadvur3quAPhb4NcwOGDxXvxyBwAFfv
 hR4FgesYkpkre5Cvp9xvogGiIWi2l3hKZ+HDJZGXweKl44ROubu1TwD4iUbjXmVyuHuL
 TRtguM+Vtw/uPqhzfY+qy+O+/UG6H4JisE4VbaGKo/hJScGdOyMtjvt1YB43TfYfZ7sZ
 2EdoiSInjFTB2ZrLdeyNNB/b7XhFpv0HwZmgOBkU+DvMmaCj7HgT6Xbuo7L76LnigLSu
 oBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754928051; x=1755532851;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
 b=Dhsuf8G0zz9CluHQj+PtUZkAHSBdAzUljeURQL66pxy6xBzwP23zJGMeEpdKTpZQ39
 eoaNf4DEkB+WNCVecef9SFn8HPg5qte43JPnPkZO87K0BQP00lqSGANeBJMADoAaMxTU
 UNkUq9QWzizRsmjSeQz2bkJHYkSq1TieROptWjdvY8WlqN5Ym33EUIN09OeXNt4w5Tb7
 kiwx2dJ7u5BD4piDO/W+JkxJMEkPx/hwclcgrK4IeBqalbYZZx51yOx7B5FhQE0+lrUj
 rAZd5GrY6RTRAOvPZOMmK/tjoXLHEf0wq4r51tfzUu/SEfXdXB2zKYqp5A20SShVPdpk
 nxVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg5RRkl6FDHxpstig5gT3RDq2PlNnECveB1+Ngm2CfKG35USoT37AVkxCsaAV0x59z+hXodaR3zpQRMQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxLFEXqJ2t353WuRmMCP/2LY8+pAGO6vhkRqHvZp6kG0cS3af76
 WKHK3iI1NfvJ20XpczJCoc4BxqkXIb5yXdlBaXBP57c8LEVnT+9hLE5u
X-Gm-Gg: ASbGncsas857iNxaeNadqqstqEM+DWaOZeDZhAWXYRHA6zyFV2afSJh8MoIBO9xHNgK
 bruqKR4J5+gl0Rh/JeJW52OhrHrJhiKsc+du+KZ1Yz3PepgUYmD3hxPC8yYBswL50jigiCQfjrf
 3r1s79Us4MO4WQNHtjmAyTLZZRBx9L2w42+t4ctENMYfeXCkmnfBCoF33Uz8pBIrsOaaPEgpX7l
 s+7fjl1j7FpXrMoGwEGiz37xd6kRmtugpq0172PfpPkXS+CYOzRSPE+dSi4Rg6t5MlFiSJGNcdT
 e9f4wmEkY5kWdAQsFNn1uvosRffB9pJRmSljbpzKumQVP3buvA7rtY+Rh0WUnDZfTzf7HeCGSJG
 zETfhskSwK2sQ0EFqsx/NQ34T3YeBjNWy+Tc7WLcUsFbh0EgW/g==
X-Google-Smtp-Source: AGHT+IGh6yl4CupkZ+bbkqrg8mnCZBWOoNaEnJApexkC1cSCi5mW8bJYL756B85cuxjEowuHPJgNRQ==
X-Received: by 2002:a17:907:9486:b0:af2:31a9:c981 with SMTP id
 a640c23a62f3a-afa1d7233bdmr11410366b.23.1754928050948; 
 Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a07643asm2049410666b.15.2025.08.11.09.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Message-ID: <c7f1fb05a6b7703ab18770bb5b58af0c58154f1f.camel@gmail.com>
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
Date: Mon, 11 Aug 2025 18:00:47 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 002/114] clk: at91: peripheral: convert
 from round_rate() to determine_rate()
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
IFRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdyYXRlIHRoaXMg
ZHJpdmVyIGZyb20KPiByb3VuZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1c2luZyB0aGUg
Q29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaAo+IG9uIHRoZSBjb3ZlciBsZXR0ZXIgb2YgdGhpcyBz
ZXJpZXMuCj4gCj4gVGhpcyBkcml2ZXIgYWxyZWFkeSBoYXMgYSBjbGtfc2FtOXg1X3BlcmlwaGVy
YWxfZGV0ZXJtaW5lX3JhdGUoKQo+IGltcGxlbWVudGF0aW9uLCBob3dldmVyIGl0IGNhbiBjaGFu
Z2UgdGhlIHBhcmVudCByYXRlLiBUaGUgZXhpc3RpbmcKPiByb3VuZCByYXRlIGRvZXMgbm90IGhh
dmUgdGhpcyBmdW5jdGlvbmFsaXR5LiBJIGNvdWxkIGFkZCBhIGNoZWNrCj4gZm9yIENMS19TRVRf
UkFURV9QQVJFTlQsIGFuZCBjb21iaW5lIHRoZSB0d28gZnVuY3Rpb25zLCBob3dldmVyIHRoZXJl
Cj4gYXJlIHNvbWUgb3RoZXIgbWlub3IgZGlmZmVyZW5jZXMgaW4gdGhlIHR3byBpbXBsZW1lbnRh
dGlvbnMuIEkgZG9uJ3QKPiBoYXZlIGFjY2VzcyB0byB0aGlzIHBhcnRpY3VsYXIgaGFyZHdhcmUu
IEkgYmVsaWV2ZSB0aGF0IHRoZXkgY291bGQKPiBiZSBjb21iaW5lZCwgaG93ZXZlciBpdCB3b3Vs
ZCBuZWVkIHRvIGJlIHRlc3RlZCBvbiByZWFsIGhhcmR3YXJlLgo+IFNvLCBsZXQncyBwbGF5IGl0
IHNhZmUgYW5kIGNvbnZlcnQgdGhlIGV4aXN0aW5nIHJvdW5kIHJhdGUKPiBpbXBsZW1lbnRhdGlv
biB0byBlbnN1cmUgdGhhdCB0aGUgZHJpdmVyIGtlZXBzIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkK
PiBhcyBiZWZvcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJl
ZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3Zl
cmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL2F0OTEvY2xrLXBlcmlwaGVy
YWwuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9hdDkxL2Nsay1wZXJpcGhlcmFsLmMgYi9kcml2ZXJzL2Nsay9h
dDkxL2Nsay1wZXJpcGhlcmFsLmMKPiBpbmRleCA2MjlmMDUwYTg1NWFhZWJmZDFhMDNmZjg3YzJi
MDE2Y2QyMjg0YTVhLi5lNzAwZjQwZmQ4N2Y5MzI3MzY1ZjI1MDM2NmY3ZjdiZGUwMWY1OTg3IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2F0OTEvY2xrLXBlcmlwaGVyYWwuYwo+ICsrKyBiL2Ry
aXZlcnMvY2xrL2F0OTEvY2xrLXBlcmlwaGVyYWwuYwo+IEBAIC0zMzUsNTAgKzMzNSw1NyBAQCBz
dGF0aWMgaW50IGNsa19zYW05eDVfcGVyaXBoZXJhbF9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xr
X2h3ICpodywKPiDCoAlyZXR1cm4gMDsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgbG9uZyBjbGtfc2Ft
OXg1X3BlcmlwaGVyYWxfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiAtCQkJCQnCoMKg
wqDCoCB1bnNpZ25lZCBsb25nIHJhdGUsCj4gLQkJCQkJwqDCoMKgwqAgdW5zaWduZWQgbG9uZyAq
cGFyZW50X3JhdGUpCj4gK3N0YXRpYyBpbnQgY2xrX3NhbTl4NV9wZXJpcGhlcmFsX25vX3BhcmVu
dF9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiArCQkJCQkJCcKgIHN0cnVjdCBj
bGtfcmF0ZV9yZXF1ZXN0ICpyZXEpCj4gwqB7Cj4gwqAJaW50IHNoaWZ0ID0gMDsKPiDCoAl1bnNp
Z25lZCBsb25nIGJlc3RfcmF0ZTsKPiDCoAl1bnNpZ25lZCBsb25nIGJlc3RfZGlmZjsKPiAtCXVu
c2lnbmVkIGxvbmcgY3VyX3JhdGUgPSAqcGFyZW50X3JhdGU7Cj4gKwl1bnNpZ25lZCBsb25nIGN1
cl9yYXRlID0gcmVxLT5iZXN0X3BhcmVudF9yYXRlOwo+IMKgCXVuc2lnbmVkIGxvbmcgY3VyX2Rp
ZmY7Cj4gwqAJc3RydWN0IGNsa19zYW05eDVfcGVyaXBoZXJhbCAqcGVyaXBoID0gdG9fY2xrX3Nh
bTl4NV9wZXJpcGhlcmFsKGh3KTsKPiDCoAo+IC0JaWYgKHBlcmlwaC0+aWQgPCBQRVJJUEhFUkFM
X0lEX01JTiB8fCAhcGVyaXBoLT5yYW5nZS5tYXgpCj4gLQkJcmV0dXJuICpwYXJlbnRfcmF0ZTsK
PiArCWlmIChwZXJpcGgtPmlkIDwgUEVSSVBIRVJBTF9JRF9NSU4gfHwgIXBlcmlwaC0+cmFuZ2Uu
bWF4KSB7Cj4gKwkJcmVxLT5yYXRlID0gcmVxLT5iZXN0X3BhcmVudF9yYXRlOwo+ICsKPiArCQly
ZXR1cm4gMDsKPiArCX0KPiDCoAo+IMKgCWlmIChwZXJpcGgtPnJhbmdlLm1heCkgewo+IMKgCQlm
b3IgKDsgc2hpZnQgPD0gUEVSSVBIRVJBTF9NQVhfU0hJRlQ7IHNoaWZ0KyspIHsKPiAtCQkJY3Vy
X3JhdGUgPSAqcGFyZW50X3JhdGUgPj4gc2hpZnQ7Cj4gKwkJCWN1cl9yYXRlID0gcmVxLT5iZXN0
X3BhcmVudF9yYXRlID4+IHNoaWZ0Owo+IMKgCQkJaWYgKGN1cl9yYXRlIDw9IHBlcmlwaC0+cmFu
Z2UubWF4KQo+IMKgCQkJCWJyZWFrOwo+IMKgCQl9Cj4gwqAJfQo+IMKgCj4gLQlpZiAocmF0ZSA+
PSBjdXJfcmF0ZSkKPiAtCQlyZXR1cm4gY3VyX3JhdGU7Cj4gKwlpZiAocmVxLT5yYXRlID49IGN1
cl9yYXRlKSB7Cj4gKwkJcmVxLT5yYXRlID0gY3VyX3JhdGU7Cj4gKwo+ICsJCXJldHVybiAwOwo+
ICsJfQo+IMKgCj4gLQliZXN0X2RpZmYgPSBjdXJfcmF0ZSAtIHJhdGU7Cj4gKwliZXN0X2RpZmYg
PSBjdXJfcmF0ZSAtIHJlcS0+cmF0ZTsKPiDCoAliZXN0X3JhdGUgPSBjdXJfcmF0ZTsKPiDCoAlm
b3IgKDsgc2hpZnQgPD0gUEVSSVBIRVJBTF9NQVhfU0hJRlQ7IHNoaWZ0KyspIHsKPiAtCQljdXJf
cmF0ZSA9ICpwYXJlbnRfcmF0ZSA+PiBzaGlmdDsKPiAtCQlpZiAoY3VyX3JhdGUgPCByYXRlKQo+
IC0JCQljdXJfZGlmZiA9IHJhdGUgLSBjdXJfcmF0ZTsKPiArCQljdXJfcmF0ZSA9IHJlcS0+YmVz
dF9wYXJlbnRfcmF0ZSA+PiBzaGlmdDsKPiArCQlpZiAoY3VyX3JhdGUgPCByZXEtPnJhdGUpCj4g
KwkJCWN1cl9kaWZmID0gcmVxLT5yYXRlIC0gY3VyX3JhdGU7Cj4gwqAJCWVsc2UKPiAtCQkJY3Vy
X2RpZmYgPSBjdXJfcmF0ZSAtIHJhdGU7Cj4gKwkJCWN1cl9kaWZmID0gY3VyX3JhdGUgLSByZXEt
PnJhdGU7Cj4gwqAKPiDCoAkJaWYgKGN1cl9kaWZmIDwgYmVzdF9kaWZmKSB7Cj4gwqAJCQliZXN0
X2RpZmYgPSBjdXJfZGlmZjsKPiDCoAkJCWJlc3RfcmF0ZSA9IGN1cl9yYXRlOwo+IMKgCQl9Cj4g
wqAKPiAtCQlpZiAoIWJlc3RfZGlmZiB8fCBjdXJfcmF0ZSA8IHJhdGUpCj4gKwkJaWYgKCFiZXN0
X2RpZmYgfHwgY3VyX3JhdGUgPCByZXEtPnJhdGUpCj4gwqAJCQlicmVhazsKPiDCoAl9Cj4gwqAK
PiAtCXJldHVybiBiZXN0X3JhdGU7Cj4gKwlyZXEtPnJhdGUgPSBiZXN0X3JhdGU7Cj4gKwo+ICsJ
cmV0dXJuIDA7Cj4gwqB9Cj4gwqAKPiDCoHN0YXRpYyBpbnQgY2xrX3NhbTl4NV9wZXJpcGhlcmFs
X3NldF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+IEBAIC00MzAsNyArNDM3LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBjbGtfb3BzIHNhbTl4NV9wZXJpcGhlcmFsX29wcyA9IHsKPiDCoAkuZGlz
YWJsZSA9IGNsa19zYW05eDVfcGVyaXBoZXJhbF9kaXNhYmxlLAo+IMKgCS5pc19lbmFibGVkID0g
Y2xrX3NhbTl4NV9wZXJpcGhlcmFsX2lzX2VuYWJsZWQsCj4gwqAJLnJlY2FsY19yYXRlID0gY2xr
X3NhbTl4NV9wZXJpcGhlcmFsX3JlY2FsY19yYXRlLAo+IC0JLnJvdW5kX3JhdGUgPSBjbGtfc2Ft
OXg1X3BlcmlwaGVyYWxfcm91bmRfcmF0ZSwKPiArCS5kZXRlcm1pbmVfcmF0ZSA9IGNsa19zYW05
eDVfcGVyaXBoZXJhbF9ub19wYXJlbnRfZGV0ZXJtaW5lX3JhdGUsCj4gwqAJLnNldF9yYXRlID0g
Y2xrX3NhbTl4NV9wZXJpcGhlcmFsX3NldF9yYXRlLAo+IMKgCS5zYXZlX2NvbnRleHQgPSBjbGtf
c2FtOXg1X3BlcmlwaGVyYWxfc2F2ZV9jb250ZXh0LAo+IMKgCS5yZXN0b3JlX2NvbnRleHQgPSBj
bGtfc2FtOXg1X3BlcmlwaGVyYWxfcmVzdG9yZV9jb250ZXh0LAoKLS0gCkFsZXhhbmRlciBTdmVy
ZGxpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
