Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08A8A3804
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 23:43:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D04CC6C859;
	Fri, 12 Apr 2024 21:43:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1EBBCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 21:43:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73CB91BF204;
 Fri, 12 Apr 2024 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712958183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMFYGKt8Bu7x5uUg4ZkcdxFN8tZOkh1RWzacUVnLx1k=;
 b=DUsOkhGfs+S2lL7ghtnZAlYaMa/6YzxDPAfXVDsfCduvFfqDAn1+oFwiLOwhRa+G0iYJ4R
 FBqhmwxd0i05VS21hI6J2WpEuWVxQbIjR8/p1nM2pUZJXmlaiTvZV1FpHt+TJFcOlgZ85d
 p+e+CPOWYZoisQg0bgLRMjPVwJMKp2DCmOBAcZnyOKU8nJD21FwHCKIR8H/UA1wE02SBMu
 pyRpXCEhR9h22YYQLOnXy4UWMoKl4SR3P970yt2wpWhaw4649CAhRRFPdjOhlL2fZeK7mL
 ylZGNopM3wEuBSQN9J2L+B0PA3csLYO/8sf+MrZ/6qMaHtGRBv8ZM3/OWZo4vA==
Date: Fri, 12 Apr 2024 23:43:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240412214300a31799c2@mail.local>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
 <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
 <202404102043571b7450b5@mail.local>
 <130d47d8-3294-44be-9a8c-8474d342cb12@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <130d47d8-3294-44be-9a8c-8474d342cb12@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: rtc: lpc32xx-rtc:
	convert to dtschema
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

T24gMTEvMDQvMjAyNCAwODoxNzo1NSswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+
IE9uIDEwLzA0LzIwMjQgMjI6NDMsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOgo+ID4gT24gMTAv
MDQvMjAyNCAxNzo1NTozNCswMjAwLCBKYXZpZXIgQ2FycmFzY28gd3JvdGU6Cj4gPj4gQ29udmVy
dCBleGlzdGluZyBiaW5kaW5nIHRvIGR0c2NoZW1hIHRvIHN1cHBvcnQgdmFsaWRhdGlvbi4KPiA+
Pgo+ID4+IEFkZCB0aGUgdW5kb2N1bWVudGVkICdjbG9ja3MnIHByb3BlcnR5Lgo+ID4+Cj4gPj4g
U2lnbmVkLW9mZi1ieTogSmF2aWVyIENhcnJhc2NvIDxqYXZpZXIuY2FycmFzY28uY3J1ekBnbWFp
bC5jb20+Cj4gPj4gLS0tCj4gPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9scGMzMnh4
LXJ0Yy50eHQgICAgICAgIHwgMTUgLS0tLS0tLS0KPiA+PiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvcnRjL254cCxscGMzMnh4LXJ0Yy55YW1sICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysr
Cj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0p
Cj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3J0Yy9scGMzMnh4LXJ0Yy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cnRjL2xwYzMyeHgtcnRjLnR4dAo+ID4+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+ID4+IGlu
ZGV4IGE4N2ExZTliYzA2MC4uMDAwMDAwMDAwMDAwCj4gPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9scGMzMnh4LXJ0Yy50eHQKPiA+PiArKysgL2Rldi9udWxs
Cj4gPj4gQEAgLTEsMTUgKzAsMCBAQAo+ID4+IC0qIE5YUCBMUEMzMnh4IFNvQyBSZWFsIFRpbWUg
Q2xvY2sgY29udHJvbGxlcgo+ID4+IC0KPiA+PiAtUmVxdWlyZWQgcHJvcGVydGllczoKPiA+PiAt
LSBjb21wYXRpYmxlOiBtdXN0IGJlICJueHAsbHBjMzIyMC1ydGMiCj4gPj4gLS0gcmVnOiBwaHlz
aWNhbCBiYXNlIGFkZHJlc3Mgb2YgdGhlIGNvbnRyb2xsZXIgYW5kIGxlbmd0aCBvZiBtZW1vcnkg
bWFwcGVkCj4gPj4gLSAgcmVnaW9uLgo+ID4+IC0tIGludGVycnVwdHM6IFRoZSBSVEMgaW50ZXJy
dXB0Cj4gPj4gLQo+ID4+IC1FeGFtcGxlOgo+ID4+IC0KPiA+PiAtCXJ0Y0A0MDAyNDAwMCB7Cj4g
Pj4gLQkJY29tcGF0aWJsZSA9ICJueHAsbHBjMzIyMC1ydGMiOwo+ID4+IC0JCXJlZyA9IDwweDQw
MDI0MDAwIDB4MTAwMD47Cj4gPj4gLQkJaW50ZXJydXB0cyA9IDw1MiAwPjsKPiA+PiAtCX07Cj4g
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvbnhw
LGxwYzMyeHgtcnRjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRj
L254cCxscGMzMnh4LXJ0Yy55YW1sCj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjYyZGRlZWY5NjFlOQo+ID4+IC0tLSAvZGV2L251bGwKPiA+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL254cCxscGMzMnh4LXJ0Yy55
YW1sCj4gPj4gQEAgLTAsMCArMSw0MSBAQAo+ID4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+PiArJVlBTUwgMS4yCj4gPj4gKy0t
LQo+ID4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3J0Yy9ueHAsbHBjMzJ4
eC1ydGMueWFtbCMKPiA+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCj4gPj4gKwo+ID4+ICt0aXRsZTogTlhQIExQQzMyeHggU29DIFJlYWwg
VGltZSBDbG9jawo+ID4+ICsKPiA+PiArbWFpbnRhaW5lcnM6Cj4gPj4gKyAgLSBKYXZpZXIgQ2Fy
cmFzY28gPGphdmllci5jYXJyYXNjby5jcnV6QGdtYWlsLmNvbT4KPiA+PiArCj4gPj4gK2FsbE9m
Ogo+ID4+ICsgIC0gJHJlZjogcnRjLnlhbWwjCj4gPj4gKwo+ID4+ICtwcm9wZXJ0aWVzOgo+ID4+
ICsgIGNvbXBhdGlibGU6Cj4gPj4gKyAgICBjb25zdDogbnhwLGxwYzMyMjAtcnRjCj4gPj4gKwo+
ID4+ICsgIHJlZzoKPiA+PiArICAgIG1heEl0ZW1zOiAxCj4gPj4gKwo+ID4+ICsgIGludGVycnVw
dHM6Cj4gPj4gKyAgICBtYXhJdGVtczogMQo+ID4+ICsKPiA+PiArICBjbG9ja3M6Cj4gPj4gKyAg
ICBtYXhJdGVtczogMQo+ID4gCj4gPiBBcyBJIGV4cGxhaW5lZCB0aGUgY2xvY2sgZG9lc24ndCBy
ZWFsbHkgZXhpc3QsIHRoZXJlIGlzIG5vIGNvbnRyb2wgb3Zlcgo+ID4gaXQsIGl0IGlzIGEgZml4
ZWQgMzI3NjggSHogY3J5c3RhbCwgdGhlcmUgaXMgbm8gcG9pbnQgaW4gZGVzY3JpYmluZyBpdAo+
ID4gYXMgdGhpcyBpcyBhbHJlYWR5IHRoZSBpbnB1dCBjbG9jayBvZiB0aGUgU29DLgo+IAo+IFRo
YXQncyBjb21tb24gZm9yIG1hbnkgU29DcyBidXQgaXQgaXMgc3RpbGwgKGF0IGxlYXN0IGZvciB0
aGVtKSBpbnB1dCB0bwo+IHRoZSBSVEMuIE9uIHNvbWUgU29DIGJvYXJkcyAzMiBrSHogaXMgY29u
dHJvbGxhYmxlLgo+IAoKVGhlcmUgaXMgbiB3YXkgdGhpcyBjYW4gYmUgY29udHJvbGxlZCBhdCB0
aGUgYm9hcmQgbGV2ZWwgYXMgdGhlIHNvYwptYW5kYXRlcyBhIGNyeXN0YWwuIFRoZXJlIGlzIGEg
Y29udHJvbCBmb3IgdGhlIG9zY2lsbGF0b3IgYnV0IGl0IGlzIG5vdApmdW5jdGlvbmFsLiBUaGlz
IHdvdWxkIGJlIGJpdCA1IG9mIFJUQ19DVFJMIHdoaWNoIGlzIGRvY3VtZW50ZWQgYXMgc3VjaDoK
CiI1IE5vdCB1c2VkLiBXcml0ZSBpcyBkb27igJl0IGNhcmUsIFJlYWQgcmV0dXJucyByYW5kb20g
dmFsdWUuIgoKRXZlbiBzbywgdGhlIGNsb2NrIHdvdWxkbid0IGJlIGFuIGlucHV0IHRvIHRoZSBS
VEMgYnV0IGl0IGlzIHByb3ZpZGVkIGJ5CnRoZSBSVEMuCgpJIGd1ZXNzIGJlY2F1c2UgaXQgd2Fz
IGVhc2VyIHRvIGQgc28sIHRoZSBjbG9jayBpcyBkZWZpbmVkIGluIHRoZSBjbG9jawpjb250cm9s
bGVyIGRyaXZlcjoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJj
ZS9kcml2ZXJzL2Nsay9ueHAvY2xrLWxwYzMyeHguYyNMMTIyMgoKYnV0LCBmcm9tIGFuIEhXIHBv
aW50IG9mIHZpZXcsIHRoaXMgaXMgbm90IGNvcnJlY3QuCgoKLS0gCkFsZXhhbmRyZSBCZWxsb25p
LCBjby1vd25lciBhbmQgQ09PLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
