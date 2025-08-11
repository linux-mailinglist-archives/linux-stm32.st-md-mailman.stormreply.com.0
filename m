Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE29B21ECB
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC0FEC3F931;
	Tue, 12 Aug 2025 07:10:00 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99292C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:47:36 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-af93c3bac8fso641210866b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754927256; x=1755532056;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
 b=d2VwaPa9vSYaMTxAaIO2BTdWniSuyjEQ+iIdCNcyKNatmVl/pH2L4B4vvtxumLYUe1
 FXqpXF19BAQ2icDsKoMp9Cdx4GZlCoM/TyjzYJtFFI+CHYxTFCLxaajELgD/7E2xWavi
 m6UDrPPw8L6Uz6aLGAwBNp4Fc5PP73xMeATIqHo7BDnhrxwuKT43eqoScCtnZrTJRffk
 VVLBFIRehQkdFCijP8V6TsEFJsLGtLEoe8/S1PcAI+875rfUlDeMAz8We0V+n9uhTWyG
 edUIw+r5PazJgLP/ItzJ+JuWfX47lrU4Ppv6eZSNbZJx6+x6NQWjl6WPfvvcrVIUzy/u
 PjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754927256; x=1755532056;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
 b=fphwy5ZrlFxwiIFCFihDe8IhgWifEZwZo/MmtJymAwaGbvLhFWT+kNy/9Le/UVIPM6
 8jBXfoURa5maIMxFdpLm2ZqxJiykskTFGgzxtA/6cO8WNiPmUhvFexYD+tYfsjjcYdmE
 SYn2YkcWSWfHbCupe+/T63w38Qh0pGdKeNoV9Im38WqARoNsCvnk0w/C/QhP7xfFPAB9
 yOKIlqTP4ePXuObw+uLEVz+pwRa7LoJvZjWo+x/5nJe5q4tiJxWmB867E70mPxRCfBVJ
 PMDhEy4DRFL3FtuNapW+Ay+Xe3uuIXYMT3WMF5BO+0m0U9xAJqnu4pjC5IAZYK0V2xKD
 WXZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYKz1Tx0tSNzqEHqLTrFR0dafxtN2OjaiVoBdAU4akU9QcngeEnURHw+Ak3oPpFR75sTra2o20p+6RlQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YznA8U4V0zTSK5hOe5tQ+VfotxB9sNNwlt1rYyb7FL9gGbDOCm4
 WBnHrwHstygK5Sv/CUx+e1JDzF/7cwLdQV/XGrjmWedpXKjxVculoYCI
X-Gm-Gg: ASbGnct2OwX74Rxbkm+ofcu4/bye4I297D4ZtBGXRB/ooGJGezBBJ5WyoW3GYhjKnzU
 /Z4T+Mpc71VfoMS4+7OqcoA3kwXgLsG2bvsdi+iJQxDhxUFvKxaM+kAy+9JJNdscAGNjbKIIY/q
 HfQQ0PWAfsLFvWWX4WcYh0GC6L+N3XQwk0IDPLcljpgl7X7PUyh9qhwGBrbBKJE91Ou6T8SopWr
 DLbouIefbWbndn8L8fzZR7GX7lgQHtKjriPZ4S6/EqFSKScypW82+AsqrqBmwNQI+Y7L7qp3U9f
 EEqdbC/aBzmgEeiR5ra2j/JMjekQDm1M7rI5O86TlhJIbieK93tMgNoZrp20AiAERcnTcKPMjtC
 jQRt/pUGnVzmL0KOefa4TZjkzGWTdAqvRZz4NoA8=
X-Google-Smtp-Source: AGHT+IF0QNexCp3wac3HqRrzYFcQwTmRLRgzyDHjNrtoHTrtc/DjgfXz7LJ4ALK6NtSRdUvSvS+HtQ==
X-Received: by 2002:a17:906:9f91:b0:af9:7823:620b with SMTP id
 a640c23a62f3a-af9c6517c2cmr1234169966b.44.1754927255767; 
 Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076409sm2048822966b.12.2025.08.11.08.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Message-ID: <597d4a777a13c2b67effaf5ba32959710d2f58f8.camel@gmail.com>
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
Date: Mon, 11 Aug 2025 17:47:31 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 047/114] clk: sophgo: cv18xx-ip: convert
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDExOjE4IC0wNDAwLCBCcmlhbiBNYXNuZXkgdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IAo+
IFRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdyYXRlIHRoaXMg
ZHJpdmVyIGZyb20KPiByb3VuZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1c2luZyB0aGUg
Q29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaAo+IG9uIHRoZSBjb3ZlciBsZXR0ZXIgb2YgdGhpcyBz
ZXJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5j
b20+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5A
Z21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxOHh4LWlwLmMg
fCAxMCArKysrKystLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLWN2MTh4
eC1pcC5jIGIvZHJpdmVycy9jbGsvc29waGdvL2Nsay1jdjE4eHgtaXAuYwo+IGluZGV4IGIxODZl
NjRkNDgxM2UyNzAxYjE3NTIwZTU0NGM0NTNmYzEzZDBlNzcuLmMyYjU4ZmFmMDkzOGI3ZDUzN2Rj
M2E4MWFlZjU5YzU0OWI5YzljNzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvc29waGdvL2Ns
ay1jdjE4eHgtaXAuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxOHh4LWlwLmMK
PiBAQCAtNDUsMTAgKzQ1LDEyIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGdhdGVfcmVjYWxjX3Jh
dGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJcmV0dXJuIHBhcmVudF9yYXRlOwo+IMKgfQo+IMKg
Cj4gLXN0YXRpYyBsb25nIGdhdGVfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWdu
ZWQgbG9uZyByYXRlLAo+IC0JCQnCoMKgwqAgdW5zaWduZWQgbG9uZyAqcGFyZW50X3JhdGUpCj4g
K3N0YXRpYyBpbnQgZ2F0ZV9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiArCQkJ
wqDCoMKgwqDCoMKgIHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0ICpyZXEpCj4gwqB7Cj4gLQlyZXR1
cm4gKnBhcmVudF9yYXRlOwo+ICsJcmVxLT5yYXRlID0gcmVxLT5iZXN0X3BhcmVudF9yYXRlOwo+
ICsKPiArCXJldHVybiAwOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW50IGdhdGVfc2V0X3JhdGUo
c3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiBAQCAtNjMsNyArNjUsNyBA
QCBjb25zdCBzdHJ1Y3QgY2xrX29wcyBjdjE4MDBfY2xrX2dhdGVfb3BzID0gewo+IMKgCS5pc19l
bmFibGVkID0gZ2F0ZV9pc19lbmFibGVkLAo+IMKgCj4gwqAJLnJlY2FsY19yYXRlID0gZ2F0ZV9y
ZWNhbGNfcmF0ZSwKPiAtCS5yb3VuZF9yYXRlID0gZ2F0ZV9yb3VuZF9yYXRlLAo+ICsJLmRldGVy
bWluZV9yYXRlID0gZ2F0ZV9kZXRlcm1pbmVfcmF0ZSwKPiDCoAkuc2V0X3JhdGUgPSBnYXRlX3Nl
dF9yYXRlLAo+IMKgfTsKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
