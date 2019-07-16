Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5767F6A2C3
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2019 09:19:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11478C1637B
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2019 07:19:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B9E8C07DA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2019 07:19:46 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4582860017;
 Tue, 16 Jul 2019 07:19:34 +0000 (UTC)
Date: Tue, 16 Jul 2019 09:19:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20190716091933.39db956e@xps13>
In-Reply-To: <20190715230457.3901-1-robh@kernel.org>
References: <20190715230457.3901-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-gpio@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: Ensure child nodes are of
	type 'object'
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

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gTW9uLCAxNSBK
dWwgMjAxOSAxNzowNDo1NyAtMDYwMDoKCj4gUHJvcGVydGllcyB3aGljaCBhcmUgY2hpbGQgbm9k
ZSBkZWZpbml0aW9ucyBuZWVkIHRvIGhhdmUgYW4gZXhwbGljdAo+IHR5cGUuIE90aGVyd2lzZSwg
YSBtYXRjaGluZyAoRFQpIHByb3BlcnR5IGNhbiBzaWxlbnRseSBtYXRjaCB3aGVuIGFuCj4gZXJy
b3IgaXMgZGVzaXJlZC4gRml4IHRoaXMgdXAgdHJlZS13aWRlLiBPbmNlIHRoaXMgaXMgZml4ZWQs
IHRoZQo+IG1ldGEtc2NoZW1hIHdpbGwgZW5mb3JjZSB0aGlzIG9uIGFueSBjaGlsZCBub2RlIGRl
ZmluaXRpb25zLgo+IAo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgo+IENjOiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gQ2M6IERhdmlkIFdvb2Ro
b3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KPiBDYzogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNm
b3JwZWFjZUBnbWFpbC5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5j
b20+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6
IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2
ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgo+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFp
bC5jb20+Cj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgo+
IENjOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnCj4gQ2M6IGxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBDYzogbGludXgtc3BpQHZn
ZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gUGxlYXNlIGFjay4gSSB3aWxsIHRha2UgdGhpcyB2aWEgdGhlIERUIHRyZWUu
Cj4gCj4gUm9iCj4gCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2J1cy9hbGx3aW5uZXIsc3Vu
OGktYTIzLXJzYi55YW1sICAgICAgIHwgMSArCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9hbGx3aW5uZXIsc3VuNGktYTEwLW5hbmQueWFtbCAgICAgIHwgMSArCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwgICAgIHwgMSAr
Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1s
ICAgICAgICAgIHwgMyArKysKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FsbHdpbm5l
cixzdW40aS1hMTAtc3BpLnlhbWwgICAgICAgfCAxICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL2FsbHdpbm5lcixzdW42aS1hMzEtc3BpLnlhbWwgICAgICAgfCAxICsKPiAgNiBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKClsuLi5dCgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFt
bAo+IGluZGV4IDE5OWJhNWFjMmEwNi4uZDI2MWI3MDk2YzY5IDEwMDY0NAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxl
ci55YW1sCj4gQEAgLTQwLDYgKzQwLDcgQEAgcHJvcGVydGllczoKPiAgCj4gIHBhdHRlcm5Qcm9w
ZXJ0aWVzOgo+ICAgICJebmFuZEBbYS1mMC05XSQiOgo+ICsgICAgdHlwZTogb2JqZWN0Cj4gICAg
ICBwcm9wZXJ0aWVzOgo+ICAgICAgICByZWc6Cj4gICAgICAgICAgZGVzY3JpcHRpb246CgpGb3Ig
dGhlIG10ZCAueWFtbDoKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
