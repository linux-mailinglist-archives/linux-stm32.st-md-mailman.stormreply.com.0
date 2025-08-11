Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8521AB21ECD
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ED78C32EB5;
	Tue, 12 Aug 2025 07:10:00 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 878F7C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:36:09 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so7989916a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754926569; x=1755531369;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o2PLgwzqCzU4aYsyzpQU8Pmm9EwNqnw9dQ2/FdBe/4E=;
 b=Q5Mi7w5omh7X9a5g3tfTDDzXHezEbjdLsN5f8m61bpYacX/Z8crWMkyZh7nW3fPU8A
 sNbA++Fjubvec2MPe3Vp8+ymQrcvfEciG0SqHQVac5BddHbEPXzP/zQf1bpNd/buQUuv
 OMQFIqnfQDY5hm2PEsRoQW22BvuFqYc5gbVIAtqzFf76aukIJ3RndHmjuYkmHZ5RktzN
 vCirLGmf+XQkzcIMZFsYI+tgZKDTU8QHeFeHULJW9kd23UOIntz4SdC7nOmhiogFB/7m
 Tnp4+MYPXOGGzwb/rNuoGMwkQeGFCG/o15lUb8L0OebReIOsE7xKDAajJWEQH95fgvsw
 lsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754926569; x=1755531369;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o2PLgwzqCzU4aYsyzpQU8Pmm9EwNqnw9dQ2/FdBe/4E=;
 b=GR+bEddy8HW/xYTOz7DBFyTMSbEZbLQOhbJtx9BJyZZN1QHVbmvsowSnEi2VzvVZia
 ExpjQMFC9gVcnfi4NTKE2iZ6mXO7aeWYNL174UUSH3qsy0dAQclSUXlylRgOpVrW5y7q
 ov4+0WfQuOMlwx4IBybN2PsK0TPSvhJ/rkjMGyMeMWguShdRJpQWxo4EIUpyEgwXmHPn
 0+sFxBXTgCQIRxSmBU7AAzpFnWSMhgO2JmLO2CaDeZjiDWzh28LQkHyyERHgryRQWnpx
 uQ9IYfNKO0Z/hCDbls5KSrHkBXuo/DaDQpAQYIDh6YBcc+HdNuCOkj3NfsxCuZYfmi+A
 M7bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY6FQa1NwHqqolvPERiMPCGFG5Z/+qP0T5oRcRMMzGGBOxU0igaBYSqBoM6/XieWFOc0liQjWL2jnmWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQVnVwErQPmpGvHc96KtsTyUvNs6m3iQnNYEGSjAxN5Z4VF6gs
 njvT6K63rlPJ9PVqIaH/e8C0wB1j0GjLT6p8+UoahFo0VRZMgeG00TB0
X-Gm-Gg: ASbGnctGIi3icTHb3NeUZw26lBgY/2vDDtqCW9b9qO7jDa4A8hvd5b7WaGyrUTMHxJY
 Y5Nogqr/1BEhgNBfrNoDkqotTMDAZxvVDaEuOzTs/OuuP+OrZGiwht5nzuthW7DcQUGdtJO0+/1
 ivwgYgGnwal4QUad0X1rNOXBrbtfOGoQZ7ed4OgFeVzAiTN5cpsrxwh28GwihMHWMBOHysthESd
 dVV7TkUcjOCSRCTe/1RIivrfdKWWUOz62r7eM2KM8u1vA0TBbyZg+f3PVwrO8LHxFn64sIW8iFH
 nbYDwColtGn6NCZGS1B9xsN2RsNSlpVu1KtsO1lxV6lsSllWQtWi5hanBnT4rsdMwTw2XNKFfzr
 WHPWxp87xQ+DHAWhBPq4wQCQaYYyeFyVH92eD8Wc=
X-Google-Smtp-Source: AGHT+IEWXGSRjdy4RAu+IcFqNFLSigtkUTeWRQg71jQOmauDsjSiWhFOxk2+KAgssZQX1ci7YH+4nA==
X-Received: by 2002:a17:907:7fa4:b0:ae3:c767:da11 with SMTP id
 a640c23a62f3a-af9c65de7eemr1091487766b.50.1754926568473; 
 Mon, 11 Aug 2025 08:36:08 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615c57f9fd0sm17432655a12.11.2025.08.11.08.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:36:08 -0700 (PDT)
Message-ID: <f6d130cac25b794e0fad1a8f0267d38acf8ee465.camel@gmail.com>
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
Date: Mon, 11 Aug 2025 17:36:04 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 113/114] clk: sophgo: sg2042-pll: remove
 round_rate() in favor of determine_rate()
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
PiBkZXRlcm1pbmVfcmF0ZSgpIGNsayBvcHMsIHNvIGxldCdzIHJlbW92ZSB0aGUgcm91bmRfcmF0
ZSgpIGNsayBvcHMgc2luY2UKPiBpdCdzIHVudXNlZC4KPiAKPiBUaGUgaW1wbGVtZW50YXRpb24g
b2Ygc2cyMDQyX2Nsa19wbGxfZGV0ZXJtaW5lX3JhdGUoKSBjYWxscwo+IHNnMjA0Ml9jbGtfcGxs
X3JvdW5kX3JhdGUoKSwgc28gdGhpcyBmb2xkcyB0aGUgdHdvIGludG8gYSBzaW5nbGUKPiBmdW5j
dGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNv
bT4KPiAtLS0KPiDCoGRyaXZlcnMvY2xrL3NvcGhnby9jbGstc2cyMDQyLXBsbC5jIHwgMjQgKysr
KysrKystLS0tLS0tLS0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc29waGdvL2Ns
ay1zZzIwNDItcGxsLmMgYi9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNnMjA0Mi1wbGwuYwo+IGlu
ZGV4IGU1ZmIwYmI3YWM0Zjk3NjE2ZjNiNDcyZmNhYjQ1ZTU3MjllYjY1M2UuLmIyY2JkNTBhYzcz
Yzc1MzhiMWFjYmNhNTE3ZjQyNTljYmE4ODVmY2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsv
c29waGdvL2Nsay1zZzIwNDItcGxsLmMKPiArKysgYi9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNn
MjA0Mi1wbGwuYwo+IEBAIC0zNDYsMzcgKzM0NiwzMCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBz
ZzIwNDJfY2xrX3BsbF9yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiDCoAlyZXR1cm4g
cmF0ZTsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgbG9uZyBzZzIwNDJfY2xrX3BsbF9yb3VuZF9yYXRl
KHN0cnVjdCBjbGtfaHcgKmh3LAo+IC0JCQkJwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHJlcV9y
YXRlLAo+IC0JCQkJwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nICpwcmF0ZSkKPiArc3RhdGljIGlu
dCBzZzIwNDJfY2xrX3BsbF9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiArCQkJ
CQkgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkKPiDCoHsKPiDCoAlzdHJ1Y3Qgc2cyMDQy
X3BsbF9jdHJsIHBjdHJsX3RhYmxlOwo+IMKgCXVuc2lnbmVkIGludCB2YWx1ZTsKPiDCoAlsb25n
IHByb3Blcl9yYXRlOwo+IMKgCWludCByZXQ7Cj4gwqAKPiAtCXJldCA9IHNnMjA0Ml9nZXRfcGxs
X2N0bF9zZXR0aW5nKCZwY3RybF90YWJsZSwgcmVxX3JhdGUsICpwcmF0ZSk7Cj4gKwlyZXQgPSBz
ZzIwNDJfZ2V0X3BsbF9jdGxfc2V0dGluZygmcGN0cmxfdGFibGUsCj4gKwkJCQkJIG1pbihyZXEt
PnJhdGUsIHJlcS0+bWF4X3JhdGUpLAo+ICsJCQkJCSByZXEtPmJlc3RfcGFyZW50X3JhdGUpOwo+
IMKgCWlmIChyZXQpIHsKPiDCoAkJcHJvcGVyX3JhdGUgPSAwOwo+IMKgCQlnb3RvIG91dDsKPiDC
oAl9Cj4gwqAKPiDCoAl2YWx1ZSA9IHNnMjA0Ml9wbGxfY3RybF9lbmNvZGUoJnBjdHJsX3RhYmxl
KTsKPiAtCXByb3Blcl9yYXRlID0gKGxvbmcpc2cyMDQyX3BsbF9yZWNhbGNfcmF0ZSh2YWx1ZSwg
KnByYXRlKTsKPiArCXByb3Blcl9yYXRlID0gKGxvbmcpc2cyMDQyX3BsbF9yZWNhbGNfcmF0ZSh2
YWx1ZSwgcmVxLT5iZXN0X3BhcmVudF9yYXRlKTsKPiDCoAo+IMKgb3V0Ogo+IMKgCXByX2RlYnVn
KCItLT4gJXM6IHBsbF9yb3VuZF9yYXRlOiB2YWwgPSAlbGRcbiIsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgXl5eXl5eXl5eXl5eXl4KTm93IHRoYXQgcm91bmRfcmF0ZSBoYXMgZ29uZSwgc2hv
dWxkIHRoZSBhYm92ZSBiZWNvbWUgInBsbF9kZXRlcm1pbmVfcmF0ZSI/Cgo+IMKgCQkgY2xrX2h3
X2dldF9uYW1lKGh3KSwgcHJvcGVyX3JhdGUpOwo+IC0JcmV0dXJuIHByb3Blcl9yYXRlOwo+IC19
Cj4gKwlyZXEtPnJhdGUgPSBwcm9wZXJfcmF0ZTsKPiDCoAo+IC1zdGF0aWMgaW50IHNnMjA0Ml9j
bGtfcGxsX2RldGVybWluZV9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+IC0JCQkJCSBzdHJ1Y3Qg
Y2xrX3JhdGVfcmVxdWVzdCAqcmVxKQo+IC17Cj4gLQlyZXEtPnJhdGUgPSBzZzIwNDJfY2xrX3Bs
bF9yb3VuZF9yYXRlKGh3LCBtaW4ocmVxLT5yYXRlLCByZXEtPm1heF9yYXRlKSwKPiAtCQkJCQnC
oMKgwqDCoMKgICZyZXEtPmJlc3RfcGFyZW50X3JhdGUpOwo+IC0JcHJfZGVidWcoIi0tPiAlczog
cGxsX2RldGVybWluZV9yYXRlOiB2YWwgPSAlbGRcbiIsCj4gLQkJIGNsa19od19nZXRfbmFtZSho
dyksIHJlcS0+cmF0ZSk7Cj4gwqAJcmV0dXJuIDA7Cj4gwqB9Cj4gwqAKPiBAQCAtNDE3LDE0ICs0
MTAsMTMgQEAgc3RhdGljIGludCBzZzIwNDJfY2xrX3BsbF9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywKPiDCoAo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIHNnMjA0Ml9jbGtfcGxs
X29wcyA9IHsKPiDCoAkucmVjYWxjX3JhdGUgPSBzZzIwNDJfY2xrX3BsbF9yZWNhbGNfcmF0ZSwK
PiAtCS5yb3VuZF9yYXRlID0gc2cyMDQyX2Nsa19wbGxfcm91bmRfcmF0ZSwKPiDCoAkuZGV0ZXJt
aW5lX3JhdGUgPSBzZzIwNDJfY2xrX3BsbF9kZXRlcm1pbmVfcmF0ZSwKPiDCoAkuc2V0X3JhdGUg
PSBzZzIwNDJfY2xrX3BsbF9zZXRfcmF0ZSwKPiDCoH07Cj4gwqAKPiDCoHN0YXRpYyBjb25zdCBz
dHJ1Y3QgY2xrX29wcyBzZzIwNDJfY2xrX3BsbF9yb19vcHMgPSB7Cj4gwqAJLnJlY2FsY19yYXRl
ID0gc2cyMDQyX2Nsa19wbGxfcmVjYWxjX3JhdGUsCj4gLQkucm91bmRfcmF0ZSA9IHNnMjA0Ml9j
bGtfcGxsX3JvdW5kX3JhdGUsCj4gKwkuZGV0ZXJtaW5lX3JhdGUgPSBzZzIwNDJfY2xrX3BsbF9k
ZXRlcm1pbmVfcmF0ZSwKPiDCoH07CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
