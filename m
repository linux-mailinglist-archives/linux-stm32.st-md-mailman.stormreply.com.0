Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2599D90EFC0
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 16:09:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B36B5C78002;
	Wed, 19 Jun 2024 14:09:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 689F2C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 14:09:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4629887E06;
 Wed, 19 Jun 2024 16:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718806170;
 bh=eQ6vqBt94joW7Ooa01IlSDqeWrqMQA+Hz1uPRPlEmGM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CfPSkKHkACfQ6hgJUgqu2RlNphNugjv79GL2XiDs1EYtKeTKiXb5IJoanlpGWfxDd
 NUauXk09BAtK+1vaUGjLUjvPLjXUxLk/issObN2e4envrlkJ+udHNGs44QO/v4SafL
 057n5R5ghAWEYIsxU3i4db/Sa8EzB7G3Fo3VcaDg8VuDSSHbU4J+6lqQA6neKzv0KX
 97Op4k+d4+C4a8jNuNRaqOjMxKk6veVOvj2QH3+4lrpkj3aika7+89RxnGxDBr3yl/
 +L923G6m86MDL47ag24C06g/1wVz1tJAdSbmwl/pwt9Fc+alnnl4FmOuyQGd29oTq1
 P1FQgYhcJ1qmA==
Message-ID: <c74f393d-7d0a-4a34-8e72-553ccf273a41@denx.de>
Date: Wed, 19 Jun 2024 15:14:03 +0200
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
 <3dee3c8a-12f0-42bd-acdf-8008da795467@denx.de>
 <aee3f6d2-6a44-4de6-9348-f83c4107188f@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <aee3f6d2-6a44-4de6-9348-f83c4107188f@foss.st.com>
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

T24gNi8xOS8yNCA5OjQxIEFNLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgoKSGksCgo+Pj4+
Pj4+ICtzdGF0aWMgaW50IHN0bTMybXAyX2NvbmZpZ3VyZV9zeXNjZmcoc3RydWN0IHBsYXRfc3Rt
bWFjZW5ldF9kYXRhIAo+Pj4+Pj4+ICpwbGF0X2RhdCkKPj4+Pj4+PiArewo+Pj4+Pj4+ICvCoMKg
wqAgc3RydWN0IHN0bTMyX2R3bWFjICpkd21hYyA9IHBsYXRfZGF0LT5ic3BfcHJpdjsKPj4+Pj4+
PiArwqDCoMKgIHUzMiByZWcgPSBkd21hYy0+bW9kZV9yZWc7Cj4+Pj4+Pj4gK8KgwqDCoCBpbnQg
dmFsID0gMDsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoCBzd2l0Y2ggKHBsYXRfZGF0LT5tYWNf
aW50ZXJmYWNlKSB7Cj4+Pj4+Pj4gK8KgwqDCoCBjYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9NSUk6
Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4KPj4+Pj4+IGR3bWFjLT5lbmFi
bGVfZXRoX2NrIGRvZXMgbm90IGFwcGx5IHRvIE1JSSBtb2RlID8gV2h5ID8KPj4+Pj4KPj4+Pj4g
SXQgaXMgbGlrZSBNUDEgYW5kIE1QMTMsIG5vdGhpbmcgdG8gc2V0IGluIHN5c2NmZyByZWdpc3Rl
ciBmb3IgY2FzZSAKPj4+Pj4gTUlJIG1vZGUgd28gY3J5c3RhbC4KPj4+Pgo+Pj4+IEhhdmUgYSBs
b29rIGF0IFNUTTMyTVAxNXh4IFJNMDQzNiBGaWd1cmUgODMuIFBlcmlwaGVyYWwgY2xvY2sgCj4+
Pj4gZGlzdHJpYnV0aW9uIGZvciBFdGhlcm5ldC4KPj4+Pgo+Pj4+IElmIFJDQyAodG9wLWxlZnQg
Y29ybmVyIG9mIHRoZSBmaWd1cmUpIGdlbmVyYXRlcyAyNSBNSHogTUlJIGNsb2NrIAo+Pj4+ICh5
ZWxsb3cgbGluZSkgb24gZXRoX2Nsa19mYiAodG9wLXJpZ2h0IGNvcm5lciksIGNhbiBJIHNldCAK
Pj4+PiBFVEhfUkVGX0NMS19TRUwgdG8gcG9zaXRpb24gJzEnIGFuZCBFVEhfU0VMWzJdIHRvICcw
JyBhbmQgZmVlZCBFVEggCj4+Pj4gKHJpZ2h0IHNpZGUpIGNsa19yeF9pIGlucHV0IHdpdGggMjUg
TUh6IGNsb2NrIHRoYXQgd2F5ID8KPj4+Pgo+Pj4+IEkgc2VlbXMgbGlrZSB0aGlzIHNob3VsZCBi
ZSBwb3NzaWJsZSwgYXQgbGVhc3QgdGhlb3JldGljYWxseS4gQ2FuIAo+Pj4+IHlvdSBjaGVjayB3
aXRoIHRoZSBoYXJkd2FyZS9zaWxpY29uIHBlb3BsZSA/Cj4+PiBObyBpdCBpcyBub3QgcG9zc2li
bGUgKGl0IHdpbGwgd29yayBpZiBzcGVlZCAoYW5kIGZyZXF1ZW5jeSkgaXMgZml4ZWQgCj4+PiAy
NU1oej0xMDBNYnBzLCBidXQgZm9yIHNwZWVkIDEwTWJwcyAoMiw1TUh6KSBpdCB3aWxsIG5vdCB3
b3JrLgo+Pgo+PiBDb3VsZCB0aGUgcGxsNF9wX2NrIG9yIHBsbDNfcV9jayBnZW5lcmF0ZSBlaXRo
ZXIgMjUgTUh6IG9yIDIuNSBNSHogYXMgCj4+IG5lZWRlZCBpbiB0aGF0IGNhc2UgPyBUaGVuIGl0
IHdvdWxkIHdvcmssIHJpZ2h0ID8KPiAKPiBZZXMgeW91IGNhbiBzZXQgZnJlcXVlbmN5IHlvdSB3
YW50IGZvciBwbGw0IG9yIHBsbDMsIGlmIHlvdSBzZXQgMjVNSHogCj4gYW5kIGF1dG8tbmVnb3Rp
YXRpb24gb2Ygc3BlZWQgaXMgMTAwTWJwcyBpdCBzaG91bGQgd29yayAocGFkIEVUSF9DSyBvZiAK
PiAyNU1IeiBjbG9jayB0aGUgUEhZIGFuZCBldGhfY2xrX2ZiIHNldCB0byAyNU1IeiBmb3IgY2xr
X1JYKQo+IAo+IGJ1dCBpZiBhdXRvbmVnIG9mIHNwZWVkIGlzIDEwTWJwcywgdGhlbiAyLjVNSHog
aXMgbmVlZGVkIGZvciBjbGtfUlggKHlvdSAKPiB3aWxsIHByb3ZpZGUgMjVNaHopCgpXaGF0IGlm
OgoKLSBBbmVnIGlzIDEwIE1icHMKLSBQTEw0X1BfQ0svUExMM19RX0NLID0gMi41IE1IegotIEVU
SF9SRUZfQ0xLX1NFTCA9IDEKLSBFVEhfU0VMWzJdID0gMAoKPwoKVGhlbiwgY2xrX3J4X2kgaXMg
Mi41IE1IeiwgcmlnaHQgPwoKRG9lcyB0aGlzIGNvbmZpZ3VyYXRpb24gd29yayA/Cgo+IC4gRm9y
IFJNSUkgY2FzZSwgZnJlcXVlbmN5IGZyb20gcGxsIChldGhfY2xrX2ZiKSBpcyAKPiBhdXRvbWF0
aWNhbGx5IGFkanVzdCBpbiBmdW5jdGlvbiBvZiBzcGVlZCB2YWx1ZSwgdGhhbmtzIHRvIGRpdmlz
ZXIgLzIsIAo+IC8yMCB3aXRoIG1hY19zcGVlZF9vLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
