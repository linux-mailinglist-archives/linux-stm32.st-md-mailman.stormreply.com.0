Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2555B7BBCAD
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 18:27:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9D4CC6C837;
	Fri,  6 Oct 2023 16:27:09 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A8B9C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 16:27:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34EC0CE255E;
 Fri,  6 Oct 2023 16:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE25C433C8;
 Fri,  6 Oct 2023 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696609626;
 bh=SVGR/dgN3Ia2g/ceGF5AhDwZ0Sefym/pCcWKrkUlFKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CITwWzMH2g2fBjiW+AXqbUZj0vPTcGj7f8bAVh7Oe5DcE97YDA2mheL32aZ+K5jNI
 pKS6nY0cQ8JxKwOKttq6+T8BWP3EdbF5sjzFixfOJfCTM8e1OmLn7nn28iKhjxFqYQ
 n2G9es+KaFUV+lPkfNJx3q3iAvihKyW6Fw0NCdOBEJKaxMImWeFxATrjN1swsvEMaZ
 07UlLpaTtQKPU60RnfeNGam5IGSnqJQfE+yXfuPRlYdA4JjjHtrNir/sa6qSchQhj9
 3qYXuB4ar4+AfHVgKOLQwLoMF81K7ilczQ8k9YrXGMb0mZxjNFAxBan8I31OL15+NH
 Xv4RGfNvG8G2w==
Received: (nullmailer pid 4034213 invoked by uid 1000);
 Fri, 06 Oct 2023 16:27:03 -0000
Date: Fri, 6 Oct 2023 11:27:03 -0500
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Message-ID: <20231006162703.GA4030032-robh@kernel.org>
References: <20231004091552.3531659-1-hugues.fruchet@foss.st.com>
 <20231004091552.3531659-4-hugues.fruchet@foss.st.com>
 <CAHCN7xKrriTPaRMJ-r86cSgFDUUP1At08imLBr_zEP0g3fga_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7xKrriTPaRMJ-r86cSgFDUUP1At08imLBr_zEP0g3fga_g@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/7] dt-bindings: media: Document
 STM32MP25 VENC video encoder
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

T24gV2VkLCBPY3QgMDQsIDIwMjMgYXQgMDY6NDE6MDlQTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3Rl
Ogo+IE9uIFdlZCwgT2N0IDQsIDIwMjMgYXQgNDoxNuKAr0FNIEh1Z3VlcyBGcnVjaGV0Cj4gPGh1
Z3Vlcy5mcnVjaGV0QGZvc3Muc3QuY29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgU1RNMzJNUDI1IFZF
TkMgdmlkZW8gZW5jb2RlciBiaW5kaW5ncy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIdWd1ZXMg
RnJ1Y2hldCA8aHVndWVzLmZydWNoZXRAZm9zcy5zdC5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmlu
ZGluZ3MvbWVkaWEvc3Qsc3RtMzJtcDI1LXZlbmMueWFtbCAgICAgfCA1NiArKysrKysrKysrKysr
KysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0
bTMybXAyNS12ZW5jLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMybXAyNS12ZW5jLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzJtcDI1LXZlbmMueWFtbAo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzY5ZTBhMzRmNjc1
Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvc3Qsc3RtMzJtcDI1LXZlbmMueWFtbAo+ID4gQEAgLTAsMCArMSw1NiBAQAo+
ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkK
PiA+ICsKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL21lZGlhL3N0LHN0bTMybXAyNS12ZW5jLnlhbWwjCj4gCj4gQ2FuIHRoaXMg
ZHQtYmluZGluZyBiZSBtYWRlIG1vcmUgZ2VuZXJpYywgbGlrZSBzb21ldGhpbmcgbGlrZQo+IGhh
bnRyby1oMSBvciBWQzgwMDBOYW5vRT8KPiAKPiBJIHRoaW5rIHRoZXJlIHdpbGwgYmUgbW9yZSBi
b2FyZHMgdGhhdCBtYXkgaW5jb3Jwb3JhdGUgdGhlIEhhbnRyby1IMQo+IG9yIGEgVkM4MDAwIGlu
IHRoZSBmdXR1cmUsIGJlY2F1c2UgSSBkb24ndCB0aGluayB0aGlzIElQIGlzIHVuaXF1ZSB0bwo+
IHRoZSBTVE0zMk1QMjUuCgpVbmxlc3MgdGhlIHVuZGVybHlpbmcgSVAgaXMgd2VsbCBkb2N1bWVu
dGVkIChpLmUuIHB1YmxpYyksIHRoZW4gaXQncyAKa2luZCBvZiBwb2ludGxlc3MuIEV2ZXJ5b25l
IHdpbGwganVzdCBpbnZlbnQgdGhlaXIgb3duIG51bWJlcnMgYW5kIG5hbWVzIApvZiBjbG9ja3Ms
IHJlc2V0cywgZXRjLiB1bmxlc3Mgc29tZW9uZSBjYW4gZW5mb3JjZSBub3QgZG9pbmcgdGhhdC4K
ClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
