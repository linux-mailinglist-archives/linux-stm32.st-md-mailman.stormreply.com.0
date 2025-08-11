Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B12B21ECC
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABFCBC3089F;
	Tue, 12 Aug 2025 07:10:00 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABBB3C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:38:48 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-af93381a1d2so726758966b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754926728; x=1755531528;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qD3PnaCJHe7CAGf98jDIpzJE6HGS8eh/nvSCm5VXAxc=;
 b=HnmamFyGopTg7i1G5iv2JPnWg6XnwFUZZIAhA+LlXbts+NmnmHQdU60XCaiE3V5tPw
 vcTbCSNL8NvTIgKn8h9eKrCLqdOqqBovZ71hNG7Lfs4po4hcDD30okmwBBUnUqiZl8hL
 JJq0f2OCl6qulwXHwM6pqHbJ8y9enWeC9CMZ1R8SVCiou3ZA0OGPX7jCOqFQ0q6JAm5w
 a0W04tcIEbuaQubGAArSzeBjVnTZiiycI3Qt00RzL5c5AMq1LCu7ZNmjhm/xPBrtFgla
 jXASgXVjtiNe59McKFg27UxIGvlxtyzEuK7S5Dg1jnz7lXIAdS8Ww7/OvfJm4qU0nwjV
 mRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754926728; x=1755531528;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qD3PnaCJHe7CAGf98jDIpzJE6HGS8eh/nvSCm5VXAxc=;
 b=Q7WdHmVTknDR6MPc+Bl1h8kd5NsNoXtNcmqrvIv/1sXMJxK4QaJk6m5PbpgJb0+tPz
 1PoiB8Dt+ao6ckVrJgzs3OanwkUmBH8+1lSi32tYycyZCPF43Lmzly59c0eZKuFga7nJ
 XcI4eAZiqbGspifqeYxqjAOoCj8Jpo5nCeQBfCUGmy4U079Gsy6rc5QcHtnI1VBpOaqU
 iYsTpzv4pSdsqYxaXmNaRe1oxskKhP/boEoD6xJybMVaFFVUXlQLH8zBj00Mr79sd+iN
 fPIaa+BgivwprO2ooIF9ZCmgohr/2FTJOml3VO6Dd0kV50exnqOK1Bl86BkGfNvANfxp
 RPCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgqc97FSnQrZkkVd3Cx2TnM4/y5vHxdUQKPUP7I+95VwvFwtdH8MFjGmdKcazZpIfNMnevbZ+YOkWbRw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywqzinxp3ukWLoKVT+qK+pwkyEc01ae1vF4b46tDOTO2S2mIR/E
 /NzeTWbBxcwr2t8CnQTImf4Ig5dw+HSKew+Lp3y9dy0p/l93LKTEwB5i
X-Gm-Gg: ASbGnctLhgGTF1hxUa5qzW/WkPyY/TAauaWJOIM/l5taPpkQyznW2hVsz8PqKhLjX+Y
 zTlBPLT1caAmDHKaoQhfxHjtyynJcSL18zva1P0o6xCL7/7qcF23D1jmqSd2ZDKJZiN4HL9z7VC
 i/PJDtyu4UHDyPdUvfsHquEO4ATPmoZdxHeu8I0qmHM46TfKsp6MDn/VXH+1M+u+n3jA4zP+bTe
 7mdG9cWepEbsQBWIH/z6MBDEN31zaXxFYMASYkR+2zcP6bDiAkax7nNrwb48uvNmkgbHn+0DXBY
 uGazwF+n6jPuARDNM6IQup66bqyrKvlcWwT5O7gdStXwu64WrDZEOGQdGOxXRFQN4XVUSPoUAMC
 O2oqUfhQOi6oHBcrresYDTrFYwXNEGgB18JLwN1g=
X-Google-Smtp-Source: AGHT+IEwAIMMmXMguO85CuFME8BHuByHpdLqU2yJrGASpVc+AuhN3x1kaE4ymuvmmSr6MxnWK7LVvA==
X-Received: by 2002:a17:906:b07:b0:afa:1453:6632 with SMTP id
 a640c23a62f3a-afa14536b03mr150166866b.50.1754926727869; 
 Mon, 11 Aug 2025 08:38:47 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c157sm2047222366b.100.2025.08.11.08.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:38:47 -0700 (PDT)
Message-ID: <09635747dcd29f45a90dd33a74a9902d7bfa9649.camel@gmail.com>
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
Date: Mon, 11 Aug 2025 17:38:43 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 112/114] clk: scmi: remove round_rate() in
 favor of determine_rate()
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
X3JhdGUoKSBjbGsgb3BzLCBzbyBsZXQncyByZW1vdmUgdGhlIHJvdW5kX3JhdGUoKSBjbGsgb3Bz
IHNpbmNlCj4gaXQncyB1bnVzZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxi
bWFzbmV5QHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4
YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL2Nsay1zY21p
LmMgfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAzMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLXNjbWku
YyBiL2RyaXZlcnMvY2xrL2Nsay1zY21pLmMKPiBpbmRleCBkMjQwODQwMzI4M2ZjNzJmMGNmOTAy
ZTY1ZjRjMDhiY2JjN2I0YjBiLi42YzZkZGI5MmU3Y2Y2YTBjZmFjMmM3ZTE5YzBmMTVmNzc3YmI4
YzUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsay1zY21pLmMKPiArKysgYi9kcml2ZXJz
L2Nsay9jbGstc2NtaS5jCj4gQEAgLTU0LDM1ICs1NCw2IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25n
IHNjbWlfY2xrX3JlY2FsY19yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+IMKgCXJldHVybiByYXRl
Owo+IMKgfQo+IMKgCj4gLXN0YXRpYyBsb25nIHNjbWlfY2xrX3JvdW5kX3JhdGUoc3RydWN0IGNs
a19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiAtCQkJCXVuc2lnbmVkIGxvbmcgKnBhcmVu
dF9yYXRlKQo+IC17Cj4gLQl1NjQgZm1pbiwgZm1heCwgZnRtcDsKPiAtCXN0cnVjdCBzY21pX2Ns
ayAqY2xrID0gdG9fc2NtaV9jbGsoaHcpOwo+IC0KPiAtCS8qCj4gLQkgKiBXZSBjYW4ndCBmaWd1
cmUgb3V0IHdoYXQgcmF0ZSBpdCB3aWxsIGJlLCBzbyBqdXN0IHJldHVybiB0aGUKPiAtCSAqIHJh
dGUgYmFjayB0byB0aGUgY2FsbGVyLiBzY21pX2Nsa19yZWNhbGNfcmF0ZSgpIHdpbGwgYmUgY2Fs
bGVkCj4gLQkgKiBhZnRlciB0aGUgcmF0ZSBpcyBzZXQgYW5kIHdlJ2xsIGtub3cgd2hhdCByYXRl
IHRoZSBjbG9jayBpcwo+IC0JICogcnVubmluZyBhdCB0aGVuLgo+IC0JICovCj4gLQlpZiAoY2xr
LT5pbmZvLT5yYXRlX2Rpc2NyZXRlKQo+IC0JCXJldHVybiByYXRlOwo+IC0KPiAtCWZtaW4gPSBj
bGstPmluZm8tPnJhbmdlLm1pbl9yYXRlOwo+IC0JZm1heCA9IGNsay0+aW5mby0+cmFuZ2UubWF4
X3JhdGU7Cj4gLQlpZiAocmF0ZSA8PSBmbWluKQo+IC0JCXJldHVybiBmbWluOwo+IC0JZWxzZSBp
ZiAocmF0ZSA+PSBmbWF4KQo+IC0JCXJldHVybiBmbWF4Owo+IC0KPiAtCWZ0bXAgPSByYXRlIC0g
Zm1pbjsKPiAtCWZ0bXAgKz0gY2xrLT5pbmZvLT5yYW5nZS5zdGVwX3NpemUgLSAxOyAvKiB0byBy
b3VuZCB1cCAqLwo+IC0JZG9fZGl2KGZ0bXAsIGNsay0+aW5mby0+cmFuZ2Uuc3RlcF9zaXplKTsK
PiAtCj4gLQlyZXR1cm4gZnRtcCAqIGNsay0+aW5mby0+cmFuZ2Uuc3RlcF9zaXplICsgZm1pbjsK
PiAtfQo+IC0KPiDCoHN0YXRpYyBpbnQgc2NtaV9jbGtfc2V0X3JhdGUoc3RydWN0IGNsa19odyAq
aHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiDCoAkJCcKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcGFy
ZW50X3JhdGUpCj4gwqB7Cj4gQEAgLTMwMCw3ICsyNzEsNiBAQCBzY21pX2Nsa19vcHNfYWxsb2Mo
c3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGZlYXRzX2tleSkKPiDCoAo+IMKgCS8q
IFJhdGUgb3BzICovCj4gwqAJb3BzLT5yZWNhbGNfcmF0ZSA9IHNjbWlfY2xrX3JlY2FsY19yYXRl
Owo+IC0Jb3BzLT5yb3VuZF9yYXRlID0gc2NtaV9jbGtfcm91bmRfcmF0ZTsKPiDCoAlvcHMtPmRl
dGVybWluZV9yYXRlID0gc2NtaV9jbGtfZGV0ZXJtaW5lX3JhdGU7Cj4gwqAJaWYgKGZlYXRzX2tl
eSAmIEJJVChTQ01JX0NMS19SQVRFX0NUUkxfU1VQUE9SVEVEKSkKPiDCoAkJb3BzLT5zZXRfcmF0
ZSA9IHNjbWlfY2xrX3NldF9yYXRlOwoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
