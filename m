Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89700B22BD9
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 17:39:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD78DC3F931;
	Tue, 12 Aug 2025 15:39:16 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DBB3C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 15:39:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0EF64A56EC0;
 Tue, 12 Aug 2025 15:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284FDC4CEF0;
 Tue, 12 Aug 2025 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755013153;
 bh=iGUpF1C71k7qo9/61ohvQv5Z7z5laJQcZjUsXmHz/vc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LiZpRdpDhra8HQLi6oTJvzINkJJSuv23n4QKhmL0GdIDFfOjMCDM1OqYhcWHHq3TI
 L28O5b3iPN5wVc9EXSMe1wiMP/NajukL3ql7pF4a85lv1fNAUZsV+TlMAAvN2rrzmr
 wRMnMSseO6nd8/EPTJY79HOmJ9zeY5vY0LS0u24hUa3icUGD8uDqDLMHMPTvWLEQv1
 l7Tw7lcXGU5Rs7ZD4eklupowdOLUecuU8uOFa6RlUoRtZfGlD+/8Ge0Ca3RaSQaoYZ
 h2ClWJH1Q8I12fZ++utjNSDaO59Bx51zYgkj3Rxo8YY8S6cPtFbxYBa0hRIu+GN5Me
 k5jWalHFpopnQ==
Date: Tue, 12 Aug 2025 21:08:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: bmasney@redhat.com
Message-ID: <tcl4eqicuqcptnbo4mcvjhacxkh2gh344k2bdrwfjbqflxspy7@x24np6pxjacf>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-79-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-79-b3bf97b038dc@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Machon <daniel.machon@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, sophgo@lists.linux.dev,
 Alex Helms <alexander.helms.jy@renesas.com>, Sven Peter <sven@kernel.org>,
 Qin Jian <qinjian@cqplus1.com>, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Inochi Amaoto <inochiama@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Palmer <daniel@thingy.jp>, soc@lists.linux.dev,
 Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Fabio Estevam <festevam@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Ray Jui <rjui@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 spacemit@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, asahi@lists.linux.dev,
 Sudeep Holla <sudeep.holla@arm.com>, Romain Perier <romain.perier@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Shan-Chun Hung <schung@nuvoton.com>,
 linux-riscv@lists.infradead.org, Janne Grunau <j@jannau.net>,
 Chen Wang <unicorn_wang@outlook.com>, arm-scmi@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Takao Orito <orito.takao@socionext.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yixun Lan <dlan@gentoo.org>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 079/114] clk: bm1880: convert from
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgMTE6MTk6MTFBTSBHTVQsIEJyaWFuIE1hc25leSB2aWEg
QjQgUmVsYXkgd3JvdGU6Cj4gRnJvbTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+
Cj4gCj4gVGhlIHJvdW5kX3JhdGUoKSBjbGsgb3BzIGlzIGRlcHJlY2F0ZWQsIHNvIG1pZ3JhdGUg
dGhpcyBkcml2ZXIgZnJvbQo+IHJvdW5kX3JhdGUoKSB0byBkZXRlcm1pbmVfcmF0ZSgpIHVzaW5n
IHRoZSBDb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoCj4gb24gdGhlIGNvdmVyIGxldHRlciBvZiB0
aGlzIHNlcmllcy4KPiAKCk9uY2UgdGhpcyBwYXRjaCBnZXRzIG1lcmdlZCwgdGhlICdDb2NjaW5l
bGxlIHNlbWFudGljIHBhdGNoIG9uIHRoZSBjb3ZlciBsZXR0ZXIKb2YgdGhpcyBzZXJpZXMnIGJl
Y29tZXMgaXJyZWxldmFudC4gSSdkIHN1Z2dlc3QgdG8gZWl0aGVyIGluY2x1ZGUgdGhlIHNjcmlw
dApoZXJlIG9yIGRvIG5vdCBtZW50aW9uIGl0IGF0IGFsbC4KCi0gTWFuaQoKPiBTaWduZWQtb2Zm
LWJ5OiBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9j
bGsvY2xrLWJtMTg4MC5jIHwgMjEgKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9jbGstYm0xODgwLmMgYi9kcml2ZXJzL2Nsay9jbGstYm0xODgwLmMKPiBpbmRl
eCAwMDJmNzM2MGIxYzZjNmUzMDU4NjA2YTA4MDgxMTViNDhmZDMxNDdhLi5kYWMxOTBiYzZlMTlh
NmRkNGJlNDEzZWE1MmQ0MWY3NDkzNGExYWE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2Ns
ay1ibTE4ODAuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay1ibTE4ODAuYwo+IEBAIC02MDgsOCAr
NjA4LDggQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgYm0xODgwX2Nsa19kaXZfcmVjYWxjX3JhdGUo
c3RydWN0IGNsa19odyAqaHcsCj4gIAlyZXR1cm4gcmF0ZTsKPiAgfQo+ICAKPiAtc3RhdGljIGxv
bmcgYm0xODgwX2Nsa19kaXZfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQg
bG9uZyByYXRlLAo+IC0JCQkJICAgICAgdW5zaWduZWQgbG9uZyAqcHJhdGUpCj4gK3N0YXRpYyBp
bnQgYm0xODgwX2Nsa19kaXZfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gKwkJ
CQkJIHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0ICpyZXEpCj4gIHsKPiAgCXN0cnVjdCBibTE4ODBf
ZGl2X2h3X2Nsb2NrICpkaXZfaHcgPSB0b19ibTE4ODBfZGl2X2Nsayhodyk7Cj4gIAlzdHJ1Y3Qg
Ym0xODgwX2Rpdl9jbG9jayAqZGl2ID0gJmRpdl9ody0+ZGl2Owo+IEBAIC02MjEsMTMgKzYyMSwx
OCBAQCBzdGF0aWMgbG9uZyBibTE4ODBfY2xrX2Rpdl9yb3VuZF9yYXRlKHN0cnVjdCBjbGtfaHcg
Kmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4gIAkJdmFsID0gcmVhZGwocmVnX2FkZHIpID4+IGRp
di0+c2hpZnQ7Cj4gIAkJdmFsICY9IGNsa19kaXZfbWFzayhkaXYtPndpZHRoKTsKPiAgCj4gLQkJ
cmV0dXJuIGRpdmlkZXJfcm9fcm91bmRfcmF0ZShodywgcmF0ZSwgcHJhdGUsIGRpdi0+dGFibGUs
Cj4gLQkJCQkJICAgICBkaXYtPndpZHRoLCBkaXYtPmZsYWdzLAo+IC0JCQkJCSAgICAgdmFsKTsK
PiArCQlyZXEtPnJhdGUgPSBkaXZpZGVyX3JvX3JvdW5kX3JhdGUoaHcsIHJlcS0+cmF0ZSwKPiAr
CQkJCQkJICAmcmVxLT5iZXN0X3BhcmVudF9yYXRlLAo+ICsJCQkJCQkgIGRpdi0+dGFibGUsCj4g
KwkJCQkJCSAgZGl2LT53aWR0aCwgZGl2LT5mbGFncywgdmFsKTsKPiArCj4gKwkJcmV0dXJuIDA7
Cj4gIAl9Cj4gIAo+IC0JcmV0dXJuIGRpdmlkZXJfcm91bmRfcmF0ZShodywgcmF0ZSwgcHJhdGUs
IGRpdi0+dGFibGUsCj4gLQkJCQkgIGRpdi0+d2lkdGgsIGRpdi0+ZmxhZ3MpOwo+ICsJcmVxLT5y
YXRlID0gZGl2aWRlcl9yb3VuZF9yYXRlKGh3LCByZXEtPnJhdGUsICZyZXEtPmJlc3RfcGFyZW50
X3JhdGUsCj4gKwkJCQkgICAgICAgZGl2LT50YWJsZSwgZGl2LT53aWR0aCwgZGl2LT5mbGFncyk7
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgYm0xODgwX2Nsa19kaXZf
c2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiBAQCAtNjY1
LDcgKzY3MCw3IEBAIHN0YXRpYyBpbnQgYm0xODgwX2Nsa19kaXZfc2V0X3JhdGUoc3RydWN0IGNs
a19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
Y2xrX29wcyBibTE4ODBfY2xrX2Rpdl9vcHMgPSB7Cj4gIAkucmVjYWxjX3JhdGUgPSBibTE4ODBf
Y2xrX2Rpdl9yZWNhbGNfcmF0ZSwKPiAtCS5yb3VuZF9yYXRlID0gYm0xODgwX2Nsa19kaXZfcm91
bmRfcmF0ZSwKPiArCS5kZXRlcm1pbmVfcmF0ZSA9IGJtMTg4MF9jbGtfZGl2X2RldGVybWluZV9y
YXRlLAo+ICAJLnNldF9yYXRlID0gYm0xODgwX2Nsa19kaXZfc2V0X3JhdGUsCj4gIH07Cj4gIAo+
IAo+IC0tIAo+IDIuNTAuMQo+IAo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDg
rprgrqTgrr7grprgrr/grrXgrq7gr40KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
