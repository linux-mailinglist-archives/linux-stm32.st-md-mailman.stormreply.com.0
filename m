Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22102784F0B
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 05:02:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2D0FC6B44B;
	Wed, 23 Aug 2023 03:02:35 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33D6CC6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 03:02:33 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qYe6H-006o9O-CL; Wed, 23 Aug 2023 11:00:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 23 Aug 2023 11:00:06 +0800
Date: Wed, 23 Aug 2023 11:00:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZOV2Nn4o8Ldy9P1i@gondor.apana.org.au>
References: <20230714174421.4054194-1-robh@kernel.org>
 <CAL_JsqL_CvroupJEFwrjt8WOq=4WBxvE3sOTMnY8hEuBAMG=1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqL_CvroupJEFwrjt8WOq=4WBxvE3sOTMnY8hEuBAMG=1g@mail.gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-aspeed@lists.ozlabs.org,
 Gaurav Jain <gaurav.jain@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 William Qiu <william.qiu@starfivetech.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Jia Jie Ho <jiajie.ho@starfivetech.com>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Joel Stanley <joel@jms.id.au>,
 linux-sunxi@lists.linux.dev, Declan Murphy <declan.murphy@intel.com>,
 devicetree@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Gilad Ben-Yossef <gilad@benyossef.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Neal Liu <neal_liu@aspeedtech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Harsha <harsha.harsha@amd.com>,
 "David S. Miller" <davem@davemloft.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] crypto: Explicitly include correct DT
	includes
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

T24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMDU6NDA6NTdQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTI6NDTigK9QTSBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGUgRFQgb2ZfZGV2aWNlLmggYW5kIG9mX3Bs
YXRmb3JtLmggZGF0ZSBiYWNrIHRvIHRoZSBzZXBhcmF0ZQo+ID4gb2ZfcGxhdGZvcm1fYnVzX3R5
cGUgYmVmb3JlIGl0IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiA+
IEFzIHBhcnQgb2YgdGhhdCBtZXJnZSBwcmVwcGluZyBBcm0gRFQgc3VwcG9ydCAxMyB5ZWFycyBh
Z28sIHRoZXkKPiA+ICJ0ZW1wb3JhcmlseSIgaW5jbHVkZSBlYWNoIG90aGVyLiBUaGV5IGFsc28g
aW5jbHVkZSBwbGF0Zm9ybV9kZXZpY2UuaAo+ID4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVy
ZSdzIGEgcHJldHR5IG11Y2ggcmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gPiBmaWxlcyB1
c2VkIHRocm91Z2hvdXQgdGhlIHRyZWUuIEluIG9yZGVyIHRvIGRldGFuZ2xlIHRoZXNlIGhlYWRl
cnMgYW5kCj4gPiByZXBsYWNlIHRoZSBpbXBsaWNpdCBpbmNsdWRlcyB3aXRoIHN0cnVjdCBkZWNs
YXJhdGlvbnMsIHVzZXJzIG5lZWQgdG8KPiA+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVj
dCBpbmNsdWRlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9jcnlwdG8vYWxsd2lubmVyL3N1bjRpLXNzL3N1
bjRpLXNzLWNvcmUuYyAgIHwgMSAtCj4gPiAgZHJpdmVycy9jcnlwdG8vYWxsd2lubmVyL3N1bjhp
LWNlL3N1bjhpLWNlLWNvcmUuYyAgIHwgMSAtCj4gPiAgZHJpdmVycy9jcnlwdG8vYWxsd2lubmVy
L3N1bjhpLXNzL3N1bjhpLXNzLWNvcmUuYyAgIHwgMSAtCj4gPiAgZHJpdmVycy9jcnlwdG8vYW1s
b2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMgICAgICAgICAgIHwgMSAtCj4gPiAgZHJpdmVycy9jcnlw
dG8vYXNwZWVkL2FzcGVlZC1hY3J5LmMgICAgICAgICAgICAgICAgIHwgMyAtLS0KPiA+ICBkcml2
ZXJzL2NyeXB0by9hdG1lbC1hZXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0t
LQo+ID4gIGRyaXZlcnMvY3J5cHRvL2F0bWVsLWVjYy5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KPiA+ICBkcml2ZXJzL2NyeXB0by9hdG1lbC1zaGEuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCA2ICsrLS0tLQo+ID4gIGRyaXZlcnMvY3J5cHRvL2F0bWVsLXRkZXMuYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tCj4gPiAgZHJpdmVycy9jcnlwdG8vYmNtL2Np
cGhlci5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiA+ICBkcml2ZXJzL2NyeXB0
by9jYWFtL2N0cmwuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiA+ICBkcml2ZXJz
L2NyeXB0by9jYWFtL2pyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiA+ICBk
cml2ZXJzL2NyeXB0by9jYWFtL3FpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsK
PiA+ICBkcml2ZXJzL2NyeXB0by9jY3JlZS9jY19kcml2ZXIuYyAgICAgICAgICAgICAgICAgICAg
fCAxIC0KPiA+ICBkcml2ZXJzL2NyeXB0by9leHlub3Mtcm5nLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAyICstCj4gPiAgZHJpdmVycy9jcnlwdG8vZ2VtaW5pL3NsMzUxNi1jZS1jb3JlLmMg
ICAgICAgICAgICAgIHwgMSAtCj4gPiAgZHJpdmVycy9jcnlwdG8vaW1nLWhhc2guYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCj4gPiAgZHJpdmVycy9jcnlwdG8vaW50ZWwva2Vl
bWJheS9rZWVtYmF5LW9jcy1oY3UtY29yZS5jIHwgMyArKy0KPiA+ICBkcml2ZXJzL2NyeXB0by9u
Ml9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiAgZHJpdmVycy9j
cnlwdG8vb21hcC1hZXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gPiAgZHJp
dmVycy9jcnlwdG8vb21hcC1kZXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiAtLQo+
ID4gIGRyaXZlcnMvY3J5cHRvL29tYXAtc2hhbS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDEgLQo+ID4gIGRyaXZlcnMvY3J5cHRvL3JvY2tjaGlwL3JrMzI4OF9jcnlwdG8uYyAgICAgICAg
ICAgICB8IDEgLQo+ID4gIGRyaXZlcnMvY3J5cHRvL3M1cC1zc3MuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDEgLQo+ID4gIGRyaXZlcnMvY3J5cHRvL3NhMnVsLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDMgKystCj4gPiAgZHJpdmVycy9jcnlwdG8vc2FoYXJhLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gPiAgZHJpdmVycy9jcnlwdG8vc3RhcmZp
dmUvamg3MTEwLWNyeXAuYyAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIGRyaXZlcnMvY3J5cHRv
L3N0YXJmaXZlL2poNzExMC1oYXNoLmMgICAgICAgICAgICAgICB8IDEgLQo+ID4gIGRyaXZlcnMv
Y3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYyAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ICBk
cml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1oYXNoLmMgICAgICAgICAgICAgICAgICAgfCAyICst
Cj4gPiAgZHJpdmVycy9jcnlwdG8vdGFsaXRvcy5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNCArKy0tCj4gPiAgZHJpdmVycy9jcnlwdG8veGlsaW54L3p5bnFtcC1hZXMtZ2NtLmMgICAg
ICAgICAgICAgIHwgMiArLQo+ID4gIGRyaXZlcnMvY3J5cHRvL3hpbGlueC96eW5xbXAtc2hhLmMg
ICAgICAgICAgICAgICAgICB8IDEgLQo+ID4gIDMzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlv
bnMoKyksIDQ1IGRlbGV0aW9ucygtKQo+IAo+IFBpbmchCgpTb3JyeSwgSSBtaXNmaWxlZCB0aGlz
IG9uZS4gIEknbGwgZ2V0IG9udG8gaXQgbm93LgoKVGhhbmtzLAotLSAKRW1haWw6IEhlcmJlcnQg
WHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KSG9tZSBQYWdlOiBodHRwOi8vZ29uZG9y
LmFwYW5hLm9yZy5hdS9+aGVyYmVydC8KUEdQIEtleTogaHR0cDovL2dvbmRvci5hcGFuYS5vcmcu
YXUvfmhlcmJlcnQvcHVia2V5LnR4dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
