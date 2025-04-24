Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE1DA9A9B3
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 12:14:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ABA0C78F68;
	Thu, 24 Apr 2025 10:14:05 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AAF7C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1745489643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fYgEY5bFxGonZp37xNaaHsfSCY/iBrfzUTg+ah8x0OU=;
 b=k34iNYmO2u/khsEJoWsLhO8cofWYl/u/QpqaDGdggEoJRr390q1f/uBot6xeqwcorlu9Rx
 a8EQn7P2a8Exp3LftKt5tslqFgRYc+b14E6XaYC6btSEViYF3OqbJEwDMnuWSMvjuIBlZJ
 G9UJn2cdbSDp7cHLYcYTJk/01lUCfOI=
Message-ID: <fff5e22cd0cc75f1007bbe43889f97554efa6316.camel@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Basavaraj Natikar	
 <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Andreas =?ISO-8859-1?Q?F=E4rber?=	
 <afaerber@suse.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Steen Hegelund
 <Steen.Hegelund@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, 	UNGLinuxDriver@microchip.com, Ludovic
 Desroches <ludovic.desroches@microchip.com>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>
Date: Thu, 24 Apr 2025 12:13:59 +0200
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-6-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-6-504f91120b99@linaro.org>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
MIME-Version: 1.0
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/12] pinctrl: ingenic: use new GPIO line
 value setter callbacks
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

SGkgQmFydG9zeiwKCkxlIGpldWRpIDI0IGF2cmlsIDIwMjUgw6AgMTA6MzUgKzAyMDAsIEJhcnRv
c3ogR29sYXN6ZXdza2kgYSDDqWNyaXTCoDoKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
YXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gCj4gc3RydWN0IGdwaW9fY2hpcCBub3cg
aGFzIGNhbGxiYWNrcyBmb3Igc2V0dGluZyBsaW5lIHZhbHVlcyB0aGF0Cj4gcmV0dXJuCj4gYW4g
aW50ZWdlciwgYWxsb3dpbmcgdG8gaW5kaWNhdGUgZmFpbHVyZXMuIENvbnZlcnQgdGhlIGRyaXZl
ciB0bwo+IHVzaW5nCj4gdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3
c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+CgpBY2tlZC1ieTogUGF1bCBDZXJj
dWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+CgpDaGVlcnMsCi1QYXVsCgo+IC0tLQo+IMKgZHJp
dmVycy9waW5jdHJsL3BpbmN0cmwtaW5nZW5pYy5jIHwgOCArKysrKy0tLQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtaW5nZW5pYy5jCj4gYi9kcml2ZXJzL3BpbmN0cmwvcGlu
Y3RybC1pbmdlbmljLmMKPiBpbmRleCBhOWU0OGVhYzE1ZjYuLjNjNjYwNDcxZWM2OSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1pbmdlbmljLmMKPiArKysgYi9kcml2ZXJz
L3BpbmN0cmwvcGluY3RybC1pbmdlbmljLmMKPiBAQCAtMzgwMCwxMiArMzgwMCwxNCBAQCBzdGF0
aWMgdm9pZCBpbmdlbmljX2dwaW9faXJxX2hhbmRsZXIoc3RydWN0Cj4gaXJxX2Rlc2MgKmRlc2Mp
Cj4gwqAJY2hhaW5lZF9pcnFfZXhpdChpcnFfY2hpcCwgZGVzYyk7Cj4gwqB9Cj4gwqAKPiAtc3Rh
dGljIHZvaWQgaW5nZW5pY19ncGlvX3NldChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywKPiAtCQl1bnNp
Z25lZCBpbnQgb2Zmc2V0LCBpbnQgdmFsdWUpCj4gK3N0YXRpYyBpbnQgaW5nZW5pY19ncGlvX3Nl
dChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50Cj4gb2Zmc2V0LAo+ICsJCQnCoMKg
wqAgaW50IHZhbHVlKQo+IMKgewo+IMKgCXN0cnVjdCBpbmdlbmljX2dwaW9fY2hpcCAqanpnYyA9
IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsKPiDCoAo+IMKgCWluZ2VuaWNfZ3Bpb19zZXRfdmFsdWUo
anpnYywgb2Zmc2V0LCB2YWx1ZSk7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gwqB9Cj4gwqAKPiDCoHN0
YXRpYyBpbnQgaW5nZW5pY19ncGlvX2dldChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQg
aW50Cj4gb2Zmc2V0KQo+IEBAIC00NDQ5LDcgKzQ0NTEsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBp
bmdlbmljX2dwaW9fcHJvYmUoc3RydWN0Cj4gaW5nZW5pY19waW5jdHJsICpqenBjLAo+IMKgCWp6
Z2MtPmdjLmZ3bm9kZSA9IGZ3bm9kZTsKPiDCoAlqemdjLT5nYy5vd25lciA9IFRISVNfTU9EVUxF
Owo+IMKgCj4gLQlqemdjLT5nYy5zZXQgPSBpbmdlbmljX2dwaW9fc2V0Owo+ICsJanpnYy0+Z2Mu
c2V0X3J2ID0gaW5nZW5pY19ncGlvX3NldDsKPiDCoAlqemdjLT5nYy5nZXQgPSBpbmdlbmljX2dw
aW9fZ2V0Owo+IMKgCWp6Z2MtPmdjLmRpcmVjdGlvbl9pbnB1dCA9IHBpbmN0cmxfZ3Bpb19kaXJl
Y3Rpb25faW5wdXQ7Cj4gwqAJanpnYy0+Z2MuZGlyZWN0aW9uX291dHB1dCA9IGluZ2VuaWNfZ3Bp
b19kaXJlY3Rpb25fb3V0cHV0OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
