Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 007DB90F6C7
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 21:15:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A32D0C71288;
	Wed, 19 Jun 2024 19:15:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BDB4C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 19:15:10 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5B74C80E9A;
 Wed, 19 Jun 2024 21:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718824509;
 bh=2sBQZJl5GOkXP3lCyMuq4jH0kmltgWo/xNkz+SDOjYI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cd0+vLiXuXd7IoP6GMpUo+GrIyTzbVea4Xu335PLbu6D/Yc6LFvWzly2fNYHc2m7H
 Yjm4LrPiwU9KJS83HZrpsHUmgj3lqqh2NXA5snyQ1JjTP5n25zXtJ5EocpLmiVIThs
 eq5FKj01f6LceN/HxDjcERepanO7x6UHBgxsAx3R3Klda7ISxU3p1/IOqY/Qmf3Kv7
 I+9sMR+27WkqjXBz/iogHaDdF7kJscPA2KOoa/tQE+LPe9N3gLDuccEFce9BMB739+
 0IolR48QcLxw5NVvYI4vq70puRptIKievYIdjcqTARywnZFdy5chlQjqSf7okigfay
 CTMqyLUAZYn5A==
Message-ID: <b760c6ba-36aa-4486-891a-c40a8cac7c1b@denx.de>
Date: Wed, 19 Jun 2024 20:56:40 +0200
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
 <c74f393d-7d0a-4a34-8e72-553ccf273a41@denx.de>
 <01e435a5-3a69-49a5-9d5e-ab9af0a2af7b@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <01e435a5-3a69-49a5-9d5e-ab9af0a2af7b@foss.st.com>
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

T24gNi8xOS8yNCA1OjQwIFBNLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgo+IAo+IE9uIDYv
MTkvMjQgMTU6MTQsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA2LzE5LzI0IDk6NDEgQU0sIENo
cmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+Pj4+Pj4+Pj4gK3N0YXRpYyBp
bnQgc3RtMzJtcDJfY29uZmlndXJlX3N5c2NmZyhzdHJ1Y3QgCj4+Pj4+Pj4+PiBwbGF0X3N0bW1h
Y2VuZXRfZGF0YSAqcGxhdF9kYXQpCj4+Pj4+Pj4+PiArewo+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1
Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjID0gcGxhdF9kYXQtPmJzcF9wcml2Owo+Pj4+Pj4+Pj4gK8Kg
wqDCoCB1MzIgcmVnID0gZHdtYWMtPm1vZGVfcmVnOwo+Pj4+Pj4+Pj4gK8KgwqDCoCBpbnQgdmFs
ID0gMDsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICvCoMKgwqAgc3dpdGNoIChwbGF0X2RhdC0+bWFj
X2ludGVyZmFjZSkgewo+Pj4+Pj4+Pj4gK8KgwqDCoCBjYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9N
SUk6Cj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGR3
bWFjLT5lbmFibGVfZXRoX2NrIGRvZXMgbm90IGFwcGx5IHRvIE1JSSBtb2RlID8gV2h5ID8KPj4+
Pj4+Pgo+Pj4+Pj4+IEl0IGlzIGxpa2UgTVAxIGFuZCBNUDEzLCBub3RoaW5nIHRvIHNldCBpbiBz
eXNjZmcgcmVnaXN0ZXIgZm9yIAo+Pj4+Pj4+IGNhc2UgTUlJIG1vZGUgd28gY3J5c3RhbC4KPj4+
Pj4+Cj4+Pj4+PiBIYXZlIGEgbG9vayBhdCBTVE0zMk1QMTV4eCBSTTA0MzYgRmlndXJlIDgzLiBQ
ZXJpcGhlcmFsIGNsb2NrIAo+Pj4+Pj4gZGlzdHJpYnV0aW9uIGZvciBFdGhlcm5ldC4KPj4+Pj4+
Cj4+Pj4+PiBJZiBSQ0MgKHRvcC1sZWZ0IGNvcm5lciBvZiB0aGUgZmlndXJlKSBnZW5lcmF0ZXMg
MjUgTUh6IE1JSSBjbG9jayAKPj4+Pj4+ICh5ZWxsb3cgbGluZSkgb24gZXRoX2Nsa19mYiAodG9w
LXJpZ2h0IGNvcm5lciksIGNhbiBJIHNldCAKPj4+Pj4+IEVUSF9SRUZfQ0xLX1NFTCB0byBwb3Np
dGlvbiAnMScgYW5kIEVUSF9TRUxbMl0gdG8gJzAnIGFuZCBmZWVkIEVUSCAKPj4+Pj4+IChyaWdo
dCBzaWRlKSBjbGtfcnhfaSBpbnB1dCB3aXRoIDI1IE1IeiBjbG9jayB0aGF0IHdheSA/Cj4+Pj4+
Pgo+Pj4+Pj4gSSBzZWVtcyBsaWtlIHRoaXMgc2hvdWxkIGJlIHBvc3NpYmxlLCBhdCBsZWFzdCB0
aGVvcmV0aWNhbGx5LiBDYW4gCj4+Pj4+PiB5b3UgY2hlY2sgd2l0aCB0aGUgaGFyZHdhcmUvc2ls
aWNvbiBwZW9wbGUgPwo+Pj4+PiBObyBpdCBpcyBub3QgcG9zc2libGUgKGl0IHdpbGwgd29yayBp
ZiBzcGVlZCAoYW5kIGZyZXF1ZW5jeSkgaXMgCj4+Pj4+IGZpeGVkIDI1TWh6PTEwME1icHMsIGJ1
dCBmb3Igc3BlZWQgMTBNYnBzICgyLDVNSHopIGl0IHdpbGwgbm90IHdvcmsuCj4+Pj4KPj4+PiBD
b3VsZCB0aGUgcGxsNF9wX2NrIG9yIHBsbDNfcV9jayBnZW5lcmF0ZSBlaXRoZXIgMjUgTUh6IG9y
IDIuNSBNSHogCj4+Pj4gYXMgbmVlZGVkIGluIHRoYXQgY2FzZSA/IFRoZW4gaXQgd291bGQgd29y
aywgcmlnaHQgPwo+Pj4KPj4+IFllcyB5b3UgY2FuIHNldCBmcmVxdWVuY3kgeW91IHdhbnQgZm9y
IHBsbDQgb3IgcGxsMywgaWYgeW91IHNldCAyNU1IeiAKPj4+IGFuZCBhdXRvLW5lZ290aWF0aW9u
IG9mIHNwZWVkIGlzIDEwME1icHMgaXQgc2hvdWxkIHdvcmsgKHBhZCBFVEhfQ0sgCj4+PiBvZiAy
NU1IeiBjbG9jayB0aGUgUEhZIGFuZCBldGhfY2xrX2ZiIHNldCB0byAyNU1IeiBmb3IgY2xrX1JY
KQo+Pj4KPj4+IGJ1dCBpZiBhdXRvbmVnIG9mIHNwZWVkIGlzIDEwTWJwcywgdGhlbiAyLjVNSHog
aXMgbmVlZGVkIGZvciBjbGtfUlggCj4+PiAoeW91IHdpbGwgcHJvdmlkZSAyNU1oeikKPj4KPj4g
V2hhdCBpZjoKPj4KPj4gLSBBbmVnIGlzIDEwIE1icHMKPj4gLSBQTEw0X1BfQ0svUExMM19RX0NL
ID0gMi41IE1Iego+PiAtIEVUSF9SRUZfQ0xLX1NFTCA9IDEKPj4gLSBFVEhfU0VMWzJdID0gMAo+
Pgo+PiA/Cj4+Cj4+IFRoZW4sIGNsa19yeF9pIGlzIDIuNSBNSHosIHJpZ2h0ID8KPiBZZXMgdGhh
dCByaWdodAo+Pgo+PiBEb2VzIHRoaXMgY29uZmlndXJhdGlvbiB3b3JrID8KPiBGb3IgbWUgbm8s
IGJlY2F1c2UgUEhZIEV0aGVybmV0IE9zY2lsbGF0b3IvY3Jpc3RhbCBuZWVkIGluIFBBRCAyNU1o
eiBvciAKPiA1ME1oeiwgSSB0aGluayBpdCBpcyBkb2VzIG5vdCB3b3JrIGlmIG9zY2lsbGF0b3Ig
ZnJlcXVlbmN5IHByb3ZpZGVkIGlzIAo+IDIuNU1IeiAoVG8gbXkga25vd2xlZGdlIHRoZXJlIGlz
IG5vIEV0aGVybmV0IFBIWSB3aGljaCBoYXZlIG9zY2lsbGF0b3IgCj4gd29ya2luZyB0byAyLjVN
SHopCgpXb3VsZCBpdCB3b3JrIGlmIHRoZSBQSFkgaGFkIGEgZGVkaWNhdGVkIFh0YWwgLCB3aGls
ZSB0aGUgY2xvY2tpbmcgb2YgCnRoZSBNQUMgd2FzIGRvbmUgdXNpbmcgUkNDID8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
