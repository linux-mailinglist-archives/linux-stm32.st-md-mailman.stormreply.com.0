Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D727F90D749
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 17:30:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DDDFC78006;
	Tue, 18 Jun 2024 15:30:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04C6CC78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 15:30:20 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 339BF882EF;
 Tue, 18 Jun 2024 17:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718724618;
 bh=nhLaeYCPpeb5WH3lwke9ZKW0zsxGr0EgQUIFEEETETk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sLM3ShltpeRBYmZqreax/4suIoG+bBj7tlHfRhC9IFldcP0z5L4vX0yxSlgX8p53d
 6ABrMbCTTSVR0bUQAPIZ3M/1fDBJtuMGSJJTHOuzpJrmXogyTlqEjwQMegZ1AuhgoR
 IQlWy6ehQiZwO7s31znp3kKHEHpWrfnlAgmU3KlR03ZjCYqdcgNKns51/yu4sQ84/S
 2XecyvmCEAOMrI5Sl2phtaWQVb5Sbsta8ph4T+8pzM2jJ4aZJqi4f/ze19MY2xKQJi
 YEH7IDKlyn5gXHAJI4C+KoEmpFAlYiUpYm+kUfpxH1aG2cvqpnuBcNDRaDQL1HkyYw
 KPaCiQuVCx1Jg==
Message-ID: <3dee3c8a-12f0-42bd-acdf-8008da795467@denx.de>
Date: Tue, 18 Jun 2024 17:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240614130812.72425-1-christophe.roullier@foss.st.com>
 <20240614130812.72425-3-christophe.roullier@foss.st.com>
 <4c2f1bac-4957-4814-bf62-816340bd9ff6@denx.de>
 <09010b02-fb55-4c4b-9d0c-36bd0b370dc8@foss.st.com>
 <39d35f6d-4f82-43af-883b-a574b8a67a1a@denx.de>
 <8c3f1696-d67c-4960-ad3a-90461c896aa5@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <8c3f1696-d67c-4960-ad3a-90461c896aa5@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH 2/2] net: stmmac: dwmac-stm32: stm32: add management of
 stm32mp25 for stm32
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gNi8xOC8yNCAxMTowOSBBTSwgQ2hyaXN0b3BoZSBST1VMTElFUiB3cm90ZToKCkhpLAoKPj4+
Pj4gK3N0YXRpYyBpbnQgc3RtMzJtcDJfY29uZmlndXJlX3N5c2NmZyhzdHJ1Y3QgcGxhdF9zdG1t
YWNlbmV0X2RhdGEgCj4+Pj4+ICpwbGF0X2RhdCkKPj4+Pj4gK3sKPj4+Pj4gK8KgwqDCoCBzdHJ1
Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjID0gcGxhdF9kYXQtPmJzcF9wcml2Owo+Pj4+PiArwqDCoMKg
IHUzMiByZWcgPSBkd21hYy0+bW9kZV9yZWc7Cj4+Pj4+ICvCoMKgwqAgaW50IHZhbCA9IDA7Cj4+
Pj4+ICsKPj4+Pj4gK8KgwqDCoCBzd2l0Y2ggKHBsYXRfZGF0LT5tYWNfaW50ZXJmYWNlKSB7Cj4+
Pj4+ICvCoMKgwqAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVfTUlJOgo+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgYnJlYWs7Cj4+Pj4KPj4+PiBkd21hYy0+ZW5hYmxlX2V0aF9jayBkb2VzIG5vdCBhcHBs
eSB0byBNSUkgbW9kZSA/IFdoeSA/Cj4+Pgo+Pj4gSXQgaXMgbGlrZSBNUDEgYW5kIE1QMTMsIG5v
dGhpbmcgdG8gc2V0IGluIHN5c2NmZyByZWdpc3RlciBmb3IgY2FzZSAKPj4+IE1JSSBtb2RlIHdv
IGNyeXN0YWwuCj4+Cj4+IEhhdmUgYSBsb29rIGF0IFNUTTMyTVAxNXh4IFJNMDQzNiBGaWd1cmUg
ODMuIFBlcmlwaGVyYWwgY2xvY2sgCj4+IGRpc3RyaWJ1dGlvbiBmb3IgRXRoZXJuZXQuCj4+Cj4+
IElmIFJDQyAodG9wLWxlZnQgY29ybmVyIG9mIHRoZSBmaWd1cmUpIGdlbmVyYXRlcyAyNSBNSHog
TUlJIGNsb2NrIAo+PiAoeWVsbG93IGxpbmUpIG9uIGV0aF9jbGtfZmIgKHRvcC1yaWdodCBjb3Ju
ZXIpLCBjYW4gSSBzZXQgCj4+IEVUSF9SRUZfQ0xLX1NFTCB0byBwb3NpdGlvbiAnMScgYW5kIEVU
SF9TRUxbMl0gdG8gJzAnIGFuZCBmZWVkIEVUSCAKPj4gKHJpZ2h0IHNpZGUpIGNsa19yeF9pIGlu
cHV0IHdpdGggMjUgTUh6IGNsb2NrIHRoYXQgd2F5ID8KPj4KPj4gSSBzZWVtcyBsaWtlIHRoaXMg
c2hvdWxkIGJlIHBvc3NpYmxlLCBhdCBsZWFzdCB0aGVvcmV0aWNhbGx5LiBDYW4geW91IAo+PiBj
aGVjayB3aXRoIHRoZSBoYXJkd2FyZS9zaWxpY29uIHBlb3BsZSA/Cj4gTm8gaXQgaXMgbm90IHBv
c3NpYmxlIChpdCB3aWxsIHdvcmsgaWYgc3BlZWQgKGFuZCBmcmVxdWVuY3kpIGlzIGZpeGVkIAo+
IDI1TWh6PTEwME1icHMsIGJ1dCBmb3Igc3BlZWQgMTBNYnBzICgyLDVNSHopIGl0IHdpbGwgbm90
IHdvcmsuCgpDb3VsZCB0aGUgcGxsNF9wX2NrIG9yIHBsbDNfcV9jayBnZW5lcmF0ZSBlaXRoZXIg
MjUgTUh6IG9yIDIuNSBNSHogYXMgCm5lZWRlZCBpbiB0aGF0IGNhc2UgPyBUaGVuIGl0IHdvdWxk
IHdvcmssIHJpZ2h0ID8KCj4gKHlvdSBjYW4gCj4gc2VlIHRoYW4gZGl2aXNlciBhcmUgb25seSBm
b3IgUk1JSSBtb2RlKQoKRG8geW91IHJlZmVyIHRvIC8yIGFuZCAvMjAgZGl2aWRlcnMgdG8gdGhl
IGxlZnQgb2YgbWFjX3NwZWVkX29bMF0gPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
