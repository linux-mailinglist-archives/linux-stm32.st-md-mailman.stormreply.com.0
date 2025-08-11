Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43080B21ECA
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2403C3F92F;
	Tue, 12 Aug 2025 07:10:00 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D51ACC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:46:02 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6180b9e4e74so4216447a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754927162; x=1755531962;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
 b=OAoHpMqKsBCCOZefMlSEE2L3BChsigUtDwWqGg4oTC2IgLw4nyxPq3HH54tpbkYPIi
 PA8AV/Ju8AZNEeKl+kkGfIBbg5w1UmASdXfqWxvJb/6wOdzNfBHCHAZ1EPEs+GHpC7oh
 IT4F3qQbBBwFBgLkemPtna4rSCqYOqXPeMRXv2ygSLgUeApHDTK1jZteGpFtP8bpIvmr
 bLzLAZ70FJOs7wuZovc5EGnguXGEkmxBNem7bEK3LVqli6maIyhkhdCeGvb1qrWgjzme
 PHd/H+TbIvJ8YGpaJM7cK97VzY8HWPuCa82FI/lRGNdXzrJwoJlnIUwlctMBvYFAx3CG
 27WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754927162; x=1755531962;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
 b=ob7yBt4f7Z8B43WqveIcjUu/SauLoxsv1PfFK5IXbeuyxzfdh7scydA1hf6CDZA3tm
 7WdiJho64Q5gk3l5LtCy290GbzDlGblUFckHiAd1Emf9uZubJDitKoB3MOo56QYcpCWp
 2TF0+K2P14gXbtC2/BigvqXw9QZJxr0mX/EdcEj6kpWUAqgHhVrXdqFw6A33jVXxdX8l
 08EOTvKyU1qmyhASlQmzFMfHbdwbOO7dOT4IL4F+aceaOiLfPsa7HQ1EjwTGURE+w/T9
 XR8fE8qNfUZz4i6K5ovrNKE1QPSWv2x3AtK4eX1R0oKl6+JOspo3a1PtTMUp6rSH0Ug6
 b2Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgs/nh4pMR3j+NaKsQjX7M2W2Q2cQ9vnYof1M+7RE0gBYE+ZnUHUCscTm/il1CIXijCbE0YibqHhAYwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzMAs0G+FrkAYHhB9+mSA6BLHllPACGbQhyZFU9+Qc2Lb4pXwTb
 pR2hANA4XobIA5zNQtbEZ/VItPtAbFcgO5Z4TwTp777mTEalMZ5868JG
X-Gm-Gg: ASbGncuFnHsP6ciz3R47ROk+g+wZ0hhbVPtN/VbsKiQ3Yf8J/cS1UFcsEAXqrQzvSDE
 1qFhY//AzMrnjJMJLvj+t7dtWWnZ6oAYqLrGZQWoHdp8QzRKJTdTrIsfULhObtP2+Thx80R7FKd
 lp8f+Jo/zvdzDLP8F8DQwNWd4fihtIrBFzWWqH8WGTPoVH06novclm4qNU2KsgIaFRzNmE23Nr1
 IDq9zvCqKjgNkhR505OplumgRBKBkVuKBsE9zXg6+gywx/ChW7Ljp4+VD9Vmqbn8xDPA5p9Nyve
 CTi6DSo/iEGPeHhuJ5yRl3rvyLVWxKxfhxXVpIU1mW6PIDA5oEI7kfRTiCzB33nrGk/DgU1mKr2
 XEavf4XQlwX6ebLYKU7BMTYcTXETTrun3ueHBUeo=
X-Google-Smtp-Source: AGHT+IGKOhTznscGhTdRt3W/yuNZg42+gjVjgTXKMoiUalIdY18fOpSzUHq5EIPnFUdAaOuOrYQZJA==
X-Received: by 2002:a05:6402:2106:b0:615:5353:5e2c with SMTP id
 4fb4d7f45d1cf-617e2e5311dmr11886624a12.19.1754927161809; 
 Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f25739sm18957452a12.21.2025.08.11.08.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Message-ID: <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
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
Date: Mon, 11 Aug 2025 17:45:57 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 048/114] clk: sophgo: sg2042-clkgen:
 convert from round_rate() to determine_rate()
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDExOjE4IC0wNDAwLCBCcmlhbiBNYXNuZXkgdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IAo+
IFRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdyYXRlIHRoaXMg
ZHJpdmVyIGZyb20KPiByb3VuZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1c2luZyB0aGUg
Q29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaAo+IG9uIHRoZSBjb3ZlciBsZXR0ZXIgb2YgdGhpcyBz
ZXJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5j
b20+Cj4gLS0tCj4gwqBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNnMjA0Mi1jbGtnZW4uYyB8IDE3
ICsrKysrKysrKy0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNn
MjA0Mi1jbGtnZW4uYyBiL2RyaXZlcnMvY2xrL3NvcGhnby9jbGstc2cyMDQyLWNsa2dlbi5jCj4g
aW5kZXggOWU2MTI4OGQzNGYzNzU3MzE1NzAyYzM1NWYyNjY5NTc3YjI5Njc2Zi4uMWQzYjE2NTZi
Y2YyZTY2NTVlMDI5OWU2OGFiMzlmMzIxODk3NDRkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Ns
ay9zb3BoZ28vY2xrLXNnMjA0Mi1jbGtnZW4uYwo+ICsrKyBiL2RyaXZlcnMvY2xrL3NvcGhnby9j
bGstc2cyMDQyLWNsa2dlbi5jCj4gQEAgLTE3Niw5ICsxNzYsOCBAQCBzdGF0aWMgdW5zaWduZWQg
bG9uZyBzZzIwNDJfY2xrX2RpdmlkZXJfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4g
wqAJcmV0dXJuIHJldF9yYXRlOwo+IMKgfQo+IMKgCj4gLXN0YXRpYyBsb25nIHNnMjA0Ml9jbGtf
ZGl2aWRlcl9yb3VuZF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+IC0JCQkJCcKgIHVuc2lnbmVk
IGxvbmcgcmF0ZSwKPiAtCQkJCQnCoCB1bnNpZ25lZCBsb25nICpwcmF0ZSkKPiArc3RhdGljIGlu
dCBzZzIwNDJfY2xrX2RpdmlkZXJfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4g
KwkJCQkJwqDCoMKgwqAgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkKPiDCoHsKPiDCoAlz
dHJ1Y3Qgc2cyMDQyX2RpdmlkZXJfY2xvY2sgKmRpdmlkZXIgPSB0b19zZzIwNDJfY2xrX2Rpdmlk
ZXIoaHcpOwo+IMKgCXVuc2lnbmVkIGxvbmcgcmV0X3JhdGU7Cj4gQEAgLTE5MiwxNSArMTkxLDE3
IEBAIHN0YXRpYyBsb25nIHNnMjA0Ml9jbGtfZGl2aWRlcl9yb3VuZF9yYXRlKHN0cnVjdCBjbGtf
aHcgKmh3LAo+IMKgCQkJYmVzdGRpdiA9IHJlYWRsKGRpdmlkZXItPnJlZykgPj4gZGl2aWRlci0+
c2hpZnQ7Cj4gwqAJCQliZXN0ZGl2ICY9IGNsa19kaXZfbWFzayhkaXZpZGVyLT53aWR0aCk7Cj4g
wqAJCX0KPiAtCQlyZXRfcmF0ZSA9IERJVl9ST1VORF9VUF9VTEwoKHU2NCkqcHJhdGUsIGJlc3Rk
aXYpOwo+ICsJCXJldF9yYXRlID0gRElWX1JPVU5EX1VQX1VMTCgodTY0KSomcmVxLT5iZXN0X3Bh
cmVudF9yYXRlLCBiZXN0ZGl2KTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5eCk1heSAiKiYiIGJlIHJlZHVuZGFuZD8KCgo+IMKgCX0gZWxzZSB7Cj4g
LQkJcmV0X3JhdGUgPSBkaXZpZGVyX3JvdW5kX3JhdGUoaHcsIHJhdGUsIHByYXRlLCBOVUxMLAo+
ICsJCXJldF9yYXRlID0gZGl2aWRlcl9yb3VuZF9yYXRlKGh3LCByZXEtPnJhdGUsICZyZXEtPmJl
c3RfcGFyZW50X3JhdGUsIE5VTEwsCj4gwqAJCQkJCcKgwqDCoMKgwqAgZGl2aWRlci0+d2lkdGgs
IGRpdmlkZXItPmRpdl9mbGFncyk7Cj4gwqAJfQo+IMKgCj4gwqAJcHJfZGVidWcoIi0tPiAlczog
ZGl2aWRlcl9yb3VuZF9yYXRlOiB2YWwgPSAlbGRcbiIsCj4gwqAJCSBjbGtfaHdfZ2V0X25hbWUo
aHcpLCByZXRfcmF0ZSk7Cj4gLQlyZXR1cm4gcmV0X3JhdGU7Cj4gKwlyZXEtPnJhdGUgPSByZXRf
cmF0ZTsKPiArCj4gKwlyZXR1cm4gMDsKPiDCoH0KPiDCoAo+IMKgc3RhdGljIGludCBzZzIwNDJf
Y2xrX2RpdmlkZXJfc2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gQEAgLTI1OCwxMyArMjU5
LDEzIEBAIHN0YXRpYyBpbnQgc2cyMDQyX2Nsa19kaXZpZGVyX3NldF9yYXRlKHN0cnVjdCBjbGtf
aHcgKmh3LAo+IMKgCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgc2cyMDQyX2Nsa19k
aXZpZGVyX29wcyA9IHsKPiDCoAkucmVjYWxjX3JhdGUgPSBzZzIwNDJfY2xrX2RpdmlkZXJfcmVj
YWxjX3JhdGUsCj4gLQkucm91bmRfcmF0ZSA9IHNnMjA0Ml9jbGtfZGl2aWRlcl9yb3VuZF9yYXRl
LAo+ICsJLmRldGVybWluZV9yYXRlID0gc2cyMDQyX2Nsa19kaXZpZGVyX2RldGVybWluZV9yYXRl
LAo+IMKgCS5zZXRfcmF0ZSA9IHNnMjA0Ml9jbGtfZGl2aWRlcl9zZXRfcmF0ZSwKPiDCoH07Cj4g
wqAKPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBzZzIwNDJfY2xrX2RpdmlkZXJfcm9f
b3BzID0gewo+IMKgCS5yZWNhbGNfcmF0ZSA9IHNnMjA0Ml9jbGtfZGl2aWRlcl9yZWNhbGNfcmF0
ZSwKPiAtCS5yb3VuZF9yYXRlID0gc2cyMDQyX2Nsa19kaXZpZGVyX3JvdW5kX3JhdGUsCj4gKwku
ZGV0ZXJtaW5lX3JhdGUgPSBzZzIwNDJfY2xrX2RpdmlkZXJfZGV0ZXJtaW5lX3JhdGUsCj4gwqB9
OwoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
