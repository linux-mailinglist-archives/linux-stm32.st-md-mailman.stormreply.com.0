Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE06977F9
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 311C0C6B457;
	Wed, 15 Feb 2023 08:18:50 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93BE7C6A5F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 00:08:06 +0000 (UTC)
Received: from [192.168.1.90] (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 890DE660217D;
 Wed, 15 Feb 2023 00:08:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676419686;
 bh=zoW3noIDVP825JbgOO/Z2/ogb3Eb9ppZTgw5s0u1c6c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UfvWpf+J3tW+akDw4oW44yeBej/Sq4UK3l7YLde3GTyggOvzrm6Ey9KYOBf0Dch/y
 1pFHF63nR3TlRsC3Aj0VOX5DvVHeNBKnuyZqRF0tRlnNIrSbCP+hU1ZCnSmvUg3qvX
 R6vNoD1ZEVdWkz2ZsquvmQtfWOI5VpL2yHXn0oh/AkXfFKK4NVnnZfAbG2SXw1HGbV
 SX5mfN82oCQaQ0Xa5ehpLghlF/WW4YSASlkw5Wb9F6CFzEzN+Vt8y89a3mdJDd4bdo
 QbITCjffcDyanACGG60Jp9Yu089C5uEnzns31zBFW5/BwbFb25oYS0BgapW32IKtJK
 GJD1oSkYLWrcA==
Message-ID: <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
Date: Wed, 15 Feb 2023 02:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
 <Y+e+N/aiqCctIp6e@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y+e+N/aiqCctIp6e@lunn.ch>
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:41 +0000
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 08/12] net: stmmac: Add glue layer for
	StarFive JH7100 SoC
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

T24gMi8xMS8yMyAxODoxMSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+ICsKPj4gKyNkZWZpbmUgSkg3
MTAwX1NZU01BSU5fUkVHSVNURVIyOCAweDcwCj4+ICsvKiBUaGUgdmFsdWUgYmVsb3cgaXMgbm90
IGEgdHlwbywganVzdCByZWFsbHkgYmFkIG5hbWluZyBieSBTdGFyRml2ZSDCr1xfKOODhClfL8Kv
ICovCj4+ICsjZGVmaW5lIEpINzEwMF9TWVNNQUlOX1JFR0lTVEVSNDkgMHhjOAo+IAo+IFNlZW1z
IGxpa2UgdGhlIGNvbW1lbnQgc2hvdWxkIGJlIG9uZSBsaW5lIGVhcmxpZXI/Cj4gCj4gVGhlcmUg
aXMgdmFsdWUgaW4gYmFzaW5nIHRoZSBuYW1lcyBvbiB0aGUgZGF0YXNoZWV0LCBidXQgeW91IGNv
dWxkCj4gYXBwZW5kIHNvbWV0aGluZyBtZWFuaW5nZnVsIG9uIHRoZSBlbmQ6Cj4gCj4gI2RlZmlu
ZSBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5X0RMWUNIQUlOIDB4YzgKPiAKPiA/Pz8KClVuZm9y
dHVuYXRlbHkgdGhlIEpINzEwMCBkYXRhc2hlZXQgSSBoYXZlIGFjY2VzcyB0byBkb2Vzbid0IHBy
b3ZpZGUgYW55IAppbmZvcm1hdGlvbiByZWdhcmRpbmcgdGhlIFNZU0NUUkwtTUFJTlNZUyByZWxh
dGVkIHJlZ2lzdGVycy4gTWF5YmUgRW1pbCAKY291bGQgcHJvdmlkZSBzb21lIGRldGFpbHMgaGVy
ZT8KCj4+ICsJaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInN0YXJmaXZlLGd0eGNsay1k
bHljaGFpbiIsICZndHhjbGtfZGx5Y2hhaW4pKSB7Cj4+ICsJCXJldCA9IHJlZ21hcF93cml0ZShz
eXNtYWluLCBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5LCBndHhjbGtfZGx5Y2hhaW4pOwo+PiAr
CQlpZiAocmV0KQo+PiArCQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJlcnJvciBz
ZWxlY3RpbmcgZ3R4Y2xrIGRlbGF5IGNoYWluXG4iKTsKPj4gKwl9Cj4gCj4gWW91IHNob3VsZCBw
cm9iYWJseSBkb2N1bWVudCB0aGF0IGlmIHN0YXJmaXZlLGd0eGNsay1kbHljaGFpbiBpcyBub3QK
PiBmb3VuZCBpbiB0aGUgRFQgYmxvYiwgdGhlIHZhbHVlIGZvciB0aGUgZGVsYXkgY2hhaW4gaXMg
dW5kZWZpbmVkLiAgSXQKPiB3b3VsZCBhY3R1YWxseSBiZSBiZXR0ZXIgdG8gZGVmaW5lIGl0LCBz
ZXQgaXQgdG8gMCBmb3IgZXhhbXBsZS4gVGhhdAo+IHdheSwgeW91IGtub3cgeW91IGRvbid0IGhh
dmUgYW55IGRlcGVuZGVuY3kgb24gdGhlIGJvb3Rsb2FkZXIgZm9yCj4gZXhhbXBsZS4KClN1cmUs
IEkgd2lsbCBzZXQgaXQgdG8gMC4KCj4gCj4gCUFuZHJldwoKVGhhbmtzIGZvciByZXZpZXdpbmcs
CkNyaXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
