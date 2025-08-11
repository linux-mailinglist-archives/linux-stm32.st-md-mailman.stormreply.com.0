Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F8B21ECE
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BDA7C3F933;
	Tue, 12 Aug 2025 07:10:01 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F684C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:50:51 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5df8so5685392a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754927451; x=1755532251;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
 b=nTO9JivZ4CCmEdFkHfLQvpsJVClaG2pi3VVOtTzTYR7Yo/fEbfbtp8z1NmP07nUk4r
 k+GK4R0UP01+IyIo29X09aVxHwu5Spr66a0ozwZyCbpoctkhLopY4SgkenH2djDRJi0L
 KbnfVGJbF0qLTOiiICVBMbfRVTqy75mBK+9XO/HcLLHIwHhgYtYhXmfRDD7CjBW+wNqX
 WKhEc0WNjB81yn2VH7slI65rmSTFXmI8TR9A9zHWTeF99/7RbMp4INB7AO8axhHcDIHU
 TFGg9y+wox618EUyAS0OYGLUynkpOg7uJSWmcDV8V1F5KHT0PiN97ViOsgI+umlvb/WA
 N2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754927451; x=1755532251;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
 b=Q60ZG1E8frqvAN7ZgFgHVvgA+bQ/i/0xEplVWROR93gbvCZs8AFSvU9Ri2BxE89I6O
 zLvzxcHX8wwa3jUqRX7ZBqEI6Cq4xjQfmcSXbzugHRFBThbGXGQn0ZtGtPxN2eSZF9GE
 bDIfB/gXVjQQCoFl2o7aMTKruveXFzkTkFhuTmJdUW0PPGSn4ToEdpEvb7/34nXcBCE0
 Wuxg0qzx93aUNQ2R2zYcnnUCcBv00RS7dIFOn64uSgOdrl9hz1IdfxHCmwnLawa8qaaz
 eWC//XkYP+Qh50Dkwj2pHP8PaKF2PQj22g7K67huI0pW1Wgge24eY06zyVh30StIkI/L
 F08w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6/mJnWo8+yJydI9kMo2aw89IeeIhVcr4ncw+TgL5I3q3GV6+8XdtFzdQhZeKgXpOyhrzqUZ1LNMCscg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwSBF3sCIoydW5BnUU42+ZW3YQktXP4E9QrUZyrC0TXXH7Agnbr
 IHfIsViUzzvj+9c0CBLYcBqN48uJZoBepq/vN4VrOIzgyj01he+qVIAK
X-Gm-Gg: ASbGncsjCXDeZ5/y8kJHuvFNDXFfMAVn9R5CqcvqoRCgN7YLyMXAr2bDneWMJo8tkXc
 EavxBQRY0zCN37qUHTqeimvVqO+VQk1o5j5HewrxlzJdJcG/ftKOyk3UOK4F591ptURh3vtiK+u
 NrzfgXYZoqQ+l4pdhyBDvSbQy4iQqwma0mUzUyHeZhL8Z5CMbDEvMywL5xPQ+p5F203JX5pXIsm
 yLDtnjsnazICKdeJJky8t6qDvq47tGDpXoA6AgsHrdR7Y5bCzeKk/iWirS7xtgVI90Rrrw02fDk
 I1+h2dUziHBJmvFNHJCvj8Vx+xrRyrhoc5WvJ+LpdEbbLV9+3rUlxC9uWcpTwD29Q7/y/t+mUPp
 LNmr44ygiNvQ31qo15PsdUOFqvntIg+/gC001jMYUiPcOM4Y9Yw==
X-Google-Smtp-Source: AGHT+IHe8ajBJUyXwu1jxvqnFBotZVZqGKDHQgYwFn+fyltnooA7uDIcyyMAL7hOfbd71etw3G4PSg==
X-Received: by 2002:a05:6402:26c2:b0:618:3a61:b1c with SMTP id
 4fb4d7f45d1cf-6183a610b1fmr2169187a12.31.1754927450586; 
 Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f000c3sm18680418a12.4.2025.08.11.08.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Message-ID: <d3b0ae61d0bb5dc4e115ace27e1672444ae90d83.camel@gmail.com>
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
Date: Mon, 11 Aug 2025 17:50:46 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 014/114] clk: ep93xx: convert from
 round_rate() to determine_rate()
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
b20+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5A
Z21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL2Nsay1lcDkzeHguYyB8IDE4ICsrKysr
KysrKystLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1lcDkzeHguYyBiL2Ry
aXZlcnMvY2xrL2Nsay1lcDkzeHguYwo+IGluZGV4IDRiZDhkNmVjZjZhMmJkZTI2Mjg3ZTRlOTQ5
YjA2MmE1NjYwMTM5ZTYuLmIwODFlZjkyMGUyNTBkZDk5MTM0YWY2ODQ1YzQ0M2VlMTEyNjZkYTgg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLWVwOTN4eC5jCj4gKysrIGIvZHJpdmVycy9j
bGsvY2xrLWVwOTN4eC5jCj4gQEAgLTM4OSwyMyArMzg5LDI1IEBAIHN0YXRpYyB1bnNpZ25lZCBs
b25nIGVwOTN4eF9kaXZfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJcmV0dXJu
IERJVl9ST1VORF9DTE9TRVNUKHBhcmVudF9yYXRlLCBjbGstPmRpdltpbmRleF0pOwo+IMKgfQo+
IMKgCj4gLXN0YXRpYyBsb25nIGVwOTN4eF9kaXZfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpo
dywgdW5zaWduZWQgbG9uZyByYXRlLAo+IC0JCQkJwqDCoCB1bnNpZ25lZCBsb25nICpwYXJlbnRf
cmF0ZSkKPiArc3RhdGljIGludCBlcDkzeHhfZGl2X2RldGVybWluZV9yYXRlKHN0cnVjdCBjbGtf
aHcgKmh3LAo+ICsJCQkJwqDCoMKgwqAgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkKPiDC
oHsKPiDCoAlzdHJ1Y3QgZXA5M3h4X2NsayAqY2xrID0gZXA5M3h4X2Nsa19mcm9tKGh3KTsKPiDC
oAl1bnNpZ25lZCBsb25nIGJlc3QgPSAwLCBub3c7Cj4gwqAJdW5zaWduZWQgaW50IGk7Cj4gwqAK
PiDCoAlmb3IgKGkgPSAwOyBpIDwgY2xrLT5udW1fZGl2OyBpKyspIHsKPiAtCQlpZiAoKHJhdGUg
KiBjbGstPmRpdltpXSkgPT0gKnBhcmVudF9yYXRlKQo+IC0JCQlyZXR1cm4gcmF0ZTsKPiArCQlp
ZiAocmVxLT5yYXRlICogY2xrLT5kaXZbaV0gPT0gcmVxLT5iZXN0X3BhcmVudF9yYXRlKQo+ICsJ
CQlyZXR1cm4gMDsKPiDCoAo+IC0JCW5vdyA9IERJVl9ST1VORF9DTE9TRVNUKCpwYXJlbnRfcmF0
ZSwgY2xrLT5kaXZbaV0pOwo+IC0JCWlmICghYmVzdCB8fCBpc19iZXN0KHJhdGUsIG5vdywgYmVz
dCkpCj4gKwkJbm93ID0gRElWX1JPVU5EX0NMT1NFU1QocmVxLT5iZXN0X3BhcmVudF9yYXRlLCBj
bGstPmRpdltpXSk7Cj4gKwkJaWYgKCFiZXN0IHx8IGlzX2Jlc3QocmVxLT5yYXRlLCBub3csIGJl
c3QpKQo+IMKgCQkJYmVzdCA9IG5vdzsKPiDCoAl9Cj4gwqAKPiAtCXJldHVybiBiZXN0Owo+ICsJ
cmVxLT5yYXRlID0gYmVzdDsKPiArCj4gKwlyZXR1cm4gMDsKPiDCoH0KPiDCoAo+IMKgc3RhdGlj
IGludCBlcDkzeHhfZGl2X3NldF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25n
IHJhdGUsCj4gQEAgLTQzNyw3ICs0MzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMg
ZXA5M3h4X2Rpdl9vcHMgPSB7Cj4gwqAJLmRpc2FibGUgPSBlcDkzeHhfY2xrX2Rpc2FibGUsCj4g
wqAJLmlzX2VuYWJsZWQgPSBlcDkzeHhfY2xrX2lzX2VuYWJsZWQsCj4gwqAJLnJlY2FsY19yYXRl
ID0gZXA5M3h4X2Rpdl9yZWNhbGNfcmF0ZSwKPiAtCS5yb3VuZF9yYXRlID0gZXA5M3h4X2Rpdl9y
b3VuZF9yYXRlLAo+ICsJLmRldGVybWluZV9yYXRlID0gZXA5M3h4X2Rpdl9kZXRlcm1pbmVfcmF0
ZSwKPiDCoAkuc2V0X3JhdGUgPSBlcDkzeHhfZGl2X3NldF9yYXRlLAo+IMKgfTsKCi0tIApBbGV4
YW5kZXIgU3ZlcmRsaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
