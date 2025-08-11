Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B29B21EC9
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 921B4C3087A;
	Tue, 12 Aug 2025 07:10:00 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54840C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:38:03 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-af95b919093so664720966b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754926682; x=1755531482;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2HmgB4i0ef6G9gBd9c3iPtpa4z8Vmw9rM+uJkjjYMMg=;
 b=gzfNkvGQJAUON25lyOIY0sxPSu2NnchsaaZNXLSwdmz4GFg9XuvJGvJNKFEj+4Oe63
 uwv7VHGyv02e8QB4fefZezJA1zVl2g2hQ6FutQT3eQhBD7plA2CkHmSOpN0RKx39bfma
 TDnqRdgeeLZlvLqIDzfDH9vgwoKBvhTYIxEOt8jCzybuHXJiXue21Cc24+OEbg7a+dd3
 n4D3qWV68U+C1aEU7H+o7W644IP3bfvpcTEKMlkiPdPeZ8y1NPxMKqp454dOMOv8EKF0
 VljETprnJuBivef78pZPiae34bAjfhs6ddKGY6MB8xotkoZsVhajeeHWbQZms4wbFpdd
 0euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754926683; x=1755531483;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2HmgB4i0ef6G9gBd9c3iPtpa4z8Vmw9rM+uJkjjYMMg=;
 b=DiG6DpCXriNscTD031UtTh8iqGz67woFb6TjwbHIWCrakThx7Q4okxz9UbrKe5vPjm
 qAdLHO08JbMWDqJXKYy01S+nqCqRybe/1x+CtoLRd3fTVT/NUVsyVPwsaSlTKoh6kvvg
 Pa1+ve9JMm9vcFtUaLtMNpML4Uu8AyB3Q3UAF2NGT65nc3Ux4gVhUGrxygqyUb4ip9k1
 qLxLiXfMLMArQxO1N0EUQVlhpNjSP/qbCR1FjMftd/WarD0r8O/Og4IkQ+J37t8Qf4jS
 2mRmFcpo9RoXZkmZQymOIhCvv4ePkXCMzu+x3/t64BXV6+D7XdnWiYdZHDAVGaVksyt1
 0+pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQiHm65rrYNArkgIFqPYgs3KqOuRZuYMa7/Y2j/z2nTzTpc5i85IJFN67sL8++6jyaz5SfcwQGvCAURQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyByJpMd3nLj3X6LPix9uIY7q99wRaJ8R/nbtpHFCzsQz6ZIkKA
 w48aR9INPwK1Z9XjFdSlm4UQPRgkVirukwcTY1M/zSBDcWlSSz8yK6GF
X-Gm-Gg: ASbGncsd7zlY7//7iyVpjTVoeQwU21vEtyn7pW00A0shvvDt+vCZ+SIZ0TywK+Urfga
 GBuSnVtSsYqWw9m12JU8nDJTk0GXZeaKYh/XPMqn0TazjFuG0M3RCXCm2g2SOY8gCEnlc/Tb7+N
 YLwjADQsVvVRrZ1/bIjgjSKhFHB8GN0mW0MoMIL73NBKVQwto5i6ta15Qc8X09tz+nk89xfUqB6
 RGxN0sD8oi2NVsV3Mf20BMLYt6y7pTME4HMhF9t3LHefVHV5LRkNvNFa79dgjwzS3ERV8qE9otR
 f9Ef9+TRkEoDJdKHVU0EslB7wZCMJCVP4A9IxHjXacvyO70R1o9K5057GINmH+2wlx67DUl/Q9t
 6S/MklOHIieYJsYhRVIhbB9cuuHSho8jFug/0IEI=
X-Google-Smtp-Source: AGHT+IHSK7yv3/D8orY0Pvy2Zzp8DcIZ6EslOLXmLH2atPhWs8y14U6F2aebL6rKGw4mDoY3DumHmw==
X-Received: by 2002:a17:907:7ea8:b0:af9:8c1c:b9be with SMTP id
 a640c23a62f3a-af9c645d565mr1274686466b.14.1754926682117; 
 Mon, 11 Aug 2025 08:38:02 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c0afsm2032301266b.117.2025.08.11.08.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:38:01 -0700 (PDT)
Message-ID: <84788b3be1d340f7a085c0d2a5903fd1032dd9eb.camel@gmail.com>
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
Date: Mon, 11 Aug 2025 17:37:58 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-114-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-114-b3bf97b038dc@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 114/114] clk: fixed-factor: drop
	round_rate() clk ops
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

SGkgQnJpYW4hCgpPbiBNb24sIDIwMjUtMDgtMTEgYXQgMTE6MTkgLTA0MDAsIEJyaWFuIE1hc25l
eSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gRnJvbTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhh
dC5jb20+Cj4gCj4gVGhpcyBkcml2ZXIgaW1wbGVtZW50cyBib3RoIHRoZSBkZXRlcm1pbmVfcmF0
ZSgpIGFuZCByb3VuZF9yYXRlKCkgY2xrCj4gb3BzLCBhbmQgdGhlIHJvdW5kX3JhdGUoKSBjbGsg
b3BzIGlzIGRlcHJlY2F0ZWQuIFdoZW4gYm90aCBhcmUgZGVmaW5lZCwKPiBjbGtfY29yZV9kZXRl
cm1pbmVfcm91bmRfbm9sb2NrKCkgZnJvbSB0aGUgY2xrIGNvcmUgd2lsbCBvbmx5IHVzZSB0aGUK
PiBkZXRlcm1pbmVfcmF0ZSgpIGNsayBvcHMuIEFsc28gYWxsIGNsayBkcml2ZXJzIHRoYXQgZGly
ZWN0bHkgY2FsbHMKPiBmaXhlZC1mYWN0b3IncyByb3VuZF9yYXRlKCkgaGF2ZSBiZWVuIG1pZ3Jh
dGVkIG92ZXIgdG8gZGV0ZXJtaW5lX3JhdGUoKS4KPiBTbyBsZXQncyByZW1vdmUgdGhlIHJvdW5k
X3JhdGUoKSBjbGsgb3BzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8Ym1hc25l
eUByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVy
LnN2ZXJkbGluQGdtYWlsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL2Nsay9jbGstZml4ZWQtZmFj
dG9yLmMgfCAxNiAtLS0tLS0tLS0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTYgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1maXhlZC1mYWN0b3IuYyBi
L2RyaXZlcnMvY2xrL2Nsay1maXhlZC1mYWN0b3IuYwo+IGluZGV4IDc5YjlhOGM1N2Q0Yjg0YmU5
OTA5NTVkOGJjMzE1OWI4MThmMzhkNTAuLmRlNjU4YzllNGM1Mzg2YTdhOGQyMjA3NDMyMjU3N2Uw
ZTllZmQyYjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLWZpeGVkLWZhY3Rvci5jCj4g
KysrIGIvZHJpdmVycy9jbGsvY2xrLWZpeGVkLWZhY3Rvci5jCj4gQEAgLTQ3LDIxICs0Nyw2IEBA
IHN0YXRpYyBpbnQgY2xrX2ZhY3Rvcl9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywK
PiDCoAlyZXR1cm4gMDsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgbG9uZyBjbGtfZmFjdG9yX3JvdW5k
X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiAtCQkJCXVuc2ln
bmVkIGxvbmcgKnByYXRlKQo+IC17Cj4gLQlzdHJ1Y3QgY2xrX2ZpeGVkX2ZhY3RvciAqZml4ID0g
dG9fY2xrX2ZpeGVkX2ZhY3Rvcihodyk7Cj4gLQo+IC0JaWYgKGNsa19od19nZXRfZmxhZ3MoaHcp
ICYgQ0xLX1NFVF9SQVRFX1BBUkVOVCkgewo+IC0JCXVuc2lnbmVkIGxvbmcgYmVzdF9wYXJlbnQ7
Cj4gLQo+IC0JCWJlc3RfcGFyZW50ID0gKHJhdGUgLyBmaXgtPm11bHQpICogZml4LT5kaXY7Cj4g
LQkJKnByYXRlID0gY2xrX2h3X3JvdW5kX3JhdGUoY2xrX2h3X2dldF9wYXJlbnQoaHcpLCBiZXN0
X3BhcmVudCk7Cj4gLQl9Cj4gLQo+IC0JcmV0dXJuICgqcHJhdGUgLyBmaXgtPmRpdikgKiBmaXgt
Pm11bHQ7Cj4gLX0KPiAtCj4gwqBzdGF0aWMgaW50IGNsa19mYWN0b3Jfc2V0X3JhdGUoc3RydWN0
IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiDCoAkJCQl1bnNpZ25lZCBsb25nIHBh
cmVudF9yYXRlKQo+IMKgewo+IEBAIC04Nyw3ICs3Miw2IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25n
IGNsa19mYWN0b3JfcmVjYWxjX2FjY3VyYWN5KHN0cnVjdCBjbGtfaHcgKmh3LAo+IMKgCj4gwqBj
b25zdCBzdHJ1Y3QgY2xrX29wcyBjbGtfZml4ZWRfZmFjdG9yX29wcyA9IHsKPiDCoAkuZGV0ZXJt
aW5lX3JhdGUgPSBjbGtfZmFjdG9yX2RldGVybWluZV9yYXRlLAo+IC0JLnJvdW5kX3JhdGUgPSBj
bGtfZmFjdG9yX3JvdW5kX3JhdGUsCj4gwqAJLnNldF9yYXRlID0gY2xrX2ZhY3Rvcl9zZXRfcmF0
ZSwKPiDCoAkucmVjYWxjX3JhdGUgPSBjbGtfZmFjdG9yX3JlY2FsY19yYXRlLAo+IMKgCS5yZWNh
bGNfYWNjdXJhY3kgPSBjbGtfZmFjdG9yX3JlY2FsY19hY2N1cmFjeSwKCi0tIApBbGV4YW5kZXIg
U3ZlcmRsaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
