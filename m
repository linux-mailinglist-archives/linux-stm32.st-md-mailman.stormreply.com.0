Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B12B21ED1
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9685CC3F93B;
	Tue, 12 Aug 2025 07:10:05 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9D23C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 16:02:38 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-af95525bac4so814883466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754928158; x=1755532958;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qaouqb4fO7JIvY1JD8PEt300KWG5mGmc4W0R7yQs6hc=;
 b=I4vrJxSfiKfQUlmEbBkHw5R6xyJWlCBJMZtJ6SIIP6/yh127/KwU6Im6W21rDOXz2L
 wFycaMmTgZ6AqFZqeoeePN0npOSAW56Io+z6F4imRoSPl0bUQqkIEtGz57j+l7voWNpo
 TLTY0yCPJPWRc8dwKyYCVGT/x0UCKEg1SbDjpALZ9DBgXb1Vv1J8n3G1oXrCnB86+570
 gi6lmTO5iVcoe1dxMe7Btl5XuZZxERPhNGrN7mLNV0yAY1ZK7QP8TddvFwO2y9bORLuB
 EhvWawTw6cU8XyFjUhZHZWgqtps9xMNRq+Hy7F2IFSStetFlDw19i5CaKJciQ2XScVR9
 hVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754928158; x=1755532958;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qaouqb4fO7JIvY1JD8PEt300KWG5mGmc4W0R7yQs6hc=;
 b=I2oL7OgORguM2XOaelnIvpvhxY7QIhojMu4b48OcKI2Qan1eQEeUnMAyIPvKwDDbYZ
 DqLZSxlDgq4gxdlTUcmXPTRLUGArOuJQ9hzJ4/VwmkbQGFxGkSLa13XjMp57q4rD8OGi
 YGKkWm/JVM+I7AgOklV+89SbsZLfhMVBMXa9sNDzXzYOV0hV+7IpogQZGtjyQFwyPUco
 ggDpAE2c6RW/GQtqcc+8i4omyTjeLrAi8RxNWBQX2du4v7A6oab+yRf+4aPuA4/f/Akt
 pi3YvI26x1+jPwORiXQ0XjIT6uhPbKtEhe6jQ2qaho0prwCtaxaX8Vi+w7Auf9BOLLGv
 +SZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqf1Z8tKKUWrekkHcoeckDC0iUDKUjfpGi9VkzKTJvP6k0jyfYgxTxhgdAEx0Ivtbu/7OUlGd+SoYcOg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1jqUt14NU2IvQls1oDRaY255MxRxnSGUzbyRpDTVfsQG5isYN
 ZX/+WRpgUGWCnw+IDwGZpSERjQ+nzxbHcTKr2Um4q3k3z+eypWVvapI5
X-Gm-Gg: ASbGncsdvRdqD4IP3GG52k3/LdC+2OHeTlbAvCoFPllqZV+YHEJcD/cCtGH+a10dBiL
 /wpEV3HCH5QyxgGZ6cfuqXMR1t2EB1PNvoSCIUfFWJV4jPHYqNqfylxM8lVf8PXF5RHVPAZKCWG
 sE5OHbj+WSndfw8xvnIY5x7Zag4maECcFHr8mOaGqDp1z1nBc8dQbqIRhP05E6z9jLHpQDjLrae
 ibEXAYbj5LSBQyhVQhwd37myXIPY28H1wk8rarvagz0x4gCdI3P6fjHcy+Bwy4yor+bwM+Fpa50
 2y1UMoVp+vXOeBr8rwcHahL8bnRp8gBkS0ueKIEnkz09WW4hGyFzNddZw9ktMRK+DEjbXBdVdtl
 yyZfsD5mi/mTkD7hCCdlGARAASpNmJEpoGW/GYg0=
X-Google-Smtp-Source: AGHT+IFlPGC8RqUZcNmE1sb0v/JytUS2YpnMYnX0fy/68mQiQooD3eH6nJnAu7hadMRuF3cZL/qgqg==
X-Received: by 2002:a17:907:7f1a:b0:ae0:d78a:2366 with SMTP id
 a640c23a62f3a-af9c63b0a5bmr1282562266b.4.1754928157418; 
 Mon, 11 Aug 2025 09:02:37 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e6cecsm2050387666b.70.2025.08.11.09.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:02:36 -0700 (PDT)
Message-ID: <dfca56ede9bdd6295f79403bf01fb9913ba95d6c.camel@gmail.com>
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
Date: Mon, 11 Aug 2025 18:02:33 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 111/114] clk: divider: remove round_rate()
 in favor of determine_rate()
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDExOjE5IC0wNDAwLCBCcmlhbiBNYXNuZXkgdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IAo+
IFRoaXMgZHJpdmVyIGltcGxlbWVudHMgYm90aCB0aGUgZGV0ZXJtaW5lX3JhdGUoKSBhbmQgcm91
bmRfcmF0ZSgpIGNsawo+IG9wcywgYW5kIHRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXBy
ZWNhdGVkLiBXaGVuIGJvdGggYXJlIGRlZmluZWQsCj4gY2xrX2NvcmVfZGV0ZXJtaW5lX3JvdW5k
X25vbG9jaygpIGZyb20gdGhlIGNsayBjb3JlIHdpbGwgb25seSB1c2UgdGhlCj4gZGV0ZXJtaW5l
X3JhdGUoKSBjbGsgb3BzLiBBbHNvIGFsbCBjbGsgZHJpdmVycyB0aGF0IGRpcmVjdGx5IGNhbGxz
Cj4gZGl2aWRlcidzIHJvdW5kX3JhdGUoKSBoYXZlIGJlZW4gbWlncmF0ZWQgb3ZlciB0byBkZXRl
cm1pbmVfcmF0ZSgpLiBTbwo+IGxldCdzIHJlbW92ZSB0aGUgcm91bmRfcmF0ZSgpIGNsayBvcHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+CgpS
ZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwu
Y29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL2Nsay1kaXZpZGVyLmMgfCAyMyAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jIGIvZHJpdmVycy9jbGsvY2xrLWRp
dmlkZXIuYwo+IGluZGV4IGMxZjQyNmI4YTUwNDNjYjVhMWRlMDhlMWRhMzg1OTI4ZWM1NGEyZWQu
LjI2MDFiNjE1NWFmYjczOTFjNmEwZmZiOTFjNThmYTY2Y2RlOTgxOTcgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay1kaXZpZGVy
LmMKPiBAQCAtNDMxLDI3ICs0MzEsNiBAQCBsb25nIGRpdmlkZXJfcm9fcm91bmRfcmF0ZV9wYXJl
bnQoc3RydWN0IGNsa19odyAqaHcsIHN0cnVjdCBjbGtfaHcgKnBhcmVudCwKPiDCoH0KPiDCoEVY
UE9SVF9TWU1CT0xfR1BMKGRpdmlkZXJfcm9fcm91bmRfcmF0ZV9wYXJlbnQpOwo+IMKgCj4gLXN0
YXRpYyBsb25nIGNsa19kaXZpZGVyX3JvdW5kX3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2ln
bmVkIGxvbmcgcmF0ZSwKPiAtCQkJCXVuc2lnbmVkIGxvbmcgKnByYXRlKQo+IC17Cj4gLQlzdHJ1
Y3QgY2xrX2RpdmlkZXIgKmRpdmlkZXIgPSB0b19jbGtfZGl2aWRlcihodyk7Cj4gLQo+IC0JLyog
aWYgcmVhZCBvbmx5LCBqdXN0IHJldHVybiBjdXJyZW50IHZhbHVlICovCj4gLQlpZiAoZGl2aWRl
ci0+ZmxhZ3MgJiBDTEtfRElWSURFUl9SRUFEX09OTFkpIHsKPiAtCQl1MzIgdmFsOwo+IC0KPiAt
CQl2YWwgPSBjbGtfZGl2X3JlYWRsKGRpdmlkZXIpID4+IGRpdmlkZXItPnNoaWZ0Owo+IC0JCXZh
bCAmPSBjbGtfZGl2X21hc2soZGl2aWRlci0+d2lkdGgpOwo+IC0KPiAtCQlyZXR1cm4gZGl2aWRl
cl9yb19yb3VuZF9yYXRlKGh3LCByYXRlLCBwcmF0ZSwgZGl2aWRlci0+dGFibGUsCj4gLQkJCQkJ
wqDCoMKgwqAgZGl2aWRlci0+d2lkdGgsIGRpdmlkZXItPmZsYWdzLAo+IC0JCQkJCcKgwqDCoMKg
IHZhbCk7Cj4gLQl9Cj4gLQo+IC0JcmV0dXJuIGRpdmlkZXJfcm91bmRfcmF0ZShodywgcmF0ZSwg
cHJhdGUsIGRpdmlkZXItPnRhYmxlLAo+IC0JCQkJwqAgZGl2aWRlci0+d2lkdGgsIGRpdmlkZXIt
PmZsYWdzKTsKPiAtfQo+IC0KPiDCoHN0YXRpYyBpbnQgY2xrX2RpdmlkZXJfZGV0ZXJtaW5lX3Jh
dGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJCQkJwqDCoMKgwqDCoCBzdHJ1Y3QgY2xrX3JhdGVf
cmVxdWVzdCAqcmVxKQo+IMKgewo+IEBAIC01MjcsNyArNTA2LDYgQEAgc3RhdGljIGludCBjbGtf
ZGl2aWRlcl9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAo+
IMKgCj4gwqBjb25zdCBzdHJ1Y3QgY2xrX29wcyBjbGtfZGl2aWRlcl9vcHMgPSB7Cj4gwqAJLnJl
Y2FsY19yYXRlID0gY2xrX2RpdmlkZXJfcmVjYWxjX3JhdGUsCj4gLQkucm91bmRfcmF0ZSA9IGNs
a19kaXZpZGVyX3JvdW5kX3JhdGUsCj4gwqAJLmRldGVybWluZV9yYXRlID0gY2xrX2RpdmlkZXJf
ZGV0ZXJtaW5lX3JhdGUsCj4gwqAJLnNldF9yYXRlID0gY2xrX2RpdmlkZXJfc2V0X3JhdGUsCj4g
wqB9Owo+IEBAIC01MzUsNyArNTEzLDYgQEAgRVhQT1JUX1NZTUJPTF9HUEwoY2xrX2RpdmlkZXJf
b3BzKTsKPiDCoAo+IMKgY29uc3Qgc3RydWN0IGNsa19vcHMgY2xrX2RpdmlkZXJfcm9fb3BzID0g
ewo+IMKgCS5yZWNhbGNfcmF0ZSA9IGNsa19kaXZpZGVyX3JlY2FsY19yYXRlLAo+IC0JLnJvdW5k
X3JhdGUgPSBjbGtfZGl2aWRlcl9yb3VuZF9yYXRlLAo+IMKgCS5kZXRlcm1pbmVfcmF0ZSA9IGNs
a19kaXZpZGVyX2RldGVybWluZV9yYXRlLAo+IMKgfTsKPiDCoEVYUE9SVF9TWU1CT0xfR1BMKGNs
a19kaXZpZGVyX3JvX29wcyk7CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
