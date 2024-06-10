Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 593B6901F82
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 12:44:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04C57C78012;
	Mon, 10 Jun 2024 10:44:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37634C7800F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 10:44:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 15B6888452;
 Mon, 10 Jun 2024 12:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718016245;
 bh=UGsRKAQcP9Xl+f3DvdpljlZ5s9R51tFrDXOpqku0T3E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GdCSF+Jvh5LOk4DOCcUWT5R6bfzs4ZRtALDz+GLfhVnuJsTfOhKh/dRS5SX5UWVWa
 y21C6sCLS/WoifQjjVePn4h4f3von3szlNrJuphrcAu9o4R6dG/N+fJH/MlVkrVhfZ
 z81NlvdFoSb77nRWhE0YyNXdAG6lqSQtvw70sK1xpBA2A19c+tTfoEQA0fUQqoJp5k
 eA8JGo93OjToYPWfvpMg3uqpZvvnES3kAObiFhnsVQv7st+kFTpvZ7GcSu/HJv9ZQT
 l5gcucGYEuRjXShdTsbegqf/XnEbaQxYGbblkwfGnmZ1SV8kkBw/7TgAuQ63WLoptc
 XCnN4ZY0Rgrzg==
Message-ID: <c5cb092d-dccd-48a4-b1da-4f057581618e@denx.de>
Date: Mon, 10 Jun 2024 12:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-10-christophe.roullier@foss.st.com>
 <6d60bbc6-5ed3-4bb1-ad72-18a2be140b81@denx.de>
 <036c9f0d-681d-461d-b839-f781fa220e94@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <036c9f0d-681d-461d-b839-f781fa220e94@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 09/12] ARM: dts: stm32: add ethernet1
 and ethernet2 support on stm32mp13
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

T24gNi8xMC8yNCAxMDowNiBBTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBNYXJlawoK
SGksCgo+IE9uIDYvNy8yNCAxNDo0OCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDYvNy8yNCAx
MTo1NyBBTSwgQ2hyaXN0b3BoZSBSb3VsbGllciB3cm90ZToKPj4KPj4gWy4uLl0KPj4KPj4+IEBA
IC0xNTA1LDYgKzE1MTEsMzggQEAgc2RtbWMyOiBtbWNANTgwMDcwMDAgewo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPiBubyBzcGFjZSBoZXJlID8KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGV0aGVybmV0MTogZXRoZXJuZXRANTgwMGEwMDAgewo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0bTMybXAxMy1kd21hYyIs
ICJzbnBzLGR3bWFjLTQuMjBhIjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVnID0gPDB4NTgwMGEwMDAgMHgyMDAwPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVnLW5hbWVzID0gInN0bW1hY2V0aCI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmludGMgR0lDX1NQSSA2MiAKPj4+IElS
UV9UWVBFX0xFVkVMX0hJR0g+LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZleHRpIDY4IDE+Owo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQtbmFtZXMgPSAibWFjaXJxIiwgImV0aF93YWtl
X2lycSI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0g
InN0bW1hY2V0aCIsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIm1hYy1jbGstdHgiLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJtYWMtY2xrLXJ4IiwKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZXRoc3RwIiwKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZXRoLWNrIjsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZyY2MgRVRIMU1B
Qz4sCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnJjYyBF
VEgxVFg+LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZy
Y2MgRVRIMVJYPiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDwmcmNjIEVUSDFTVFA+LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPCZyY2MgRVRIMUNLX0s+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdCxzeXNjb24gPSA8JnN5c2NmZyAweDQgMHhmZjAwMDA+Owo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzbnBzLG1peGVkLWJ1cnN0Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzbnBzLHBibCA9IDwyPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc25wcyxheGktY29uZmlnID0gPCZzdG1tYWNfYXhpX2NvbmZpZ18xPjsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc25wcyx0c287Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGFjY2Vzcy1jb250cm9sbGVycyA9IDwmZXR6cGMgNDg+Owo+Pgo+
PiBLZWVwIHRoZSBsaXN0IHNvcnRlZC4KPiAKPiBUaGUgbGlzdCBpcyBjdXJyZW50bHkgbm90IHNv
cnRlZC4gSSBhZ3JlZSB0aGF0IGl0IGlzIGJldHRlciB0byBoYXZlIGEgCj4gY29tbW9uIHJ1bGUg
dG8gZWFzeSB0aGUgcmVhZCBidXQgaXQgc2hvdWxkIGJlIGFwcGxpZWQgdG8gYWxsIHRoZSBub2Rl
cyAKPiBmb3IgdGhlIHdob2xlIFNUTTMyIGZhbWlseS4gTWF5YmUgdG8gYWRkcmVzcyBieSBhbm90
aGVyIHNlcmllcy4gRm9yIHRoZSAKPiB0aW1lIGJlaW5nIHdlIGNhbiBrZWVwIGl0IGFzIGl0IGlz
LgoKV2h5IGlzIHRoZSBzdCwuLi4gYW5kIHNucHMsLi4uIHN3YXBwZWQgYW55d2F5ID8gVGhhdCBj
YW4gYmUgZml4ZWQgcmlnaHQgCmhlcmUuCgpXaHkgaXMgdGhlIGFjY2Vzcy1jb250cm9sbGVycyBh
dCB0aGUgZW5kID8gVGhhdCBjYW4gYmUgZml4ZWQgaW4gc2VwYXJhdGUgCnNlcmllcywgc2luY2Ug
dGhhdCBzZWVtcyB0byBoYXZlIHByb2xpZmVyYXRlZCBjb25zaWRlcmFibHkuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
