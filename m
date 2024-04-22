Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BCE8ACC68
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 13:59:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7853CC6DD6B;
	Mon, 22 Apr 2024 11:59:40 +0000 (UTC)
Received: from 11.mo582.mail-out.ovh.net (11.mo582.mail-out.ovh.net
 [188.165.38.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29557C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 09:28:13 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.9.32])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4VNKg04M9nz1QBS
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 09:28:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-rl684 (unknown [10.110.113.68])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 920A11FE65;
 Mon, 22 Apr 2024 09:28:09 +0000 (UTC)
Received: from armadeus.com ([37.59.142.101])
 by ghost-submission-6684bf9d7b-rl684 with ESMTPSA
 id qQDTHKktJmYMfgAAjN946g
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 22 Apr 2024 09:28:09 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004c9d7feca-c54e-499e-ad96-007dd4ebdda3,
 A64A67AECC9DB63596043E25B5FC1CC6B28F39B0)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.148.253.243
Message-ID: <f01d49cf-5955-405c-9c2b-05b0c7bb982c@armadeus.com>
Date: Mon, 22 Apr 2024 11:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20240422-v6-9-topic-imx93-eqos-rmii-v1-0-30151fca43d2@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <20240422-v6-9-topic-imx93-eqos-rmii-v1-0-30151fca43d2@pengutronix.de>
X-Ovh-Tracer-Id: 3291005431560006571
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudekledgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeujeffheehvddtuefhjeevveffkeetfffgtedvjeekleelvdfhjeelfeeludduieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-Mailman-Approved-At: Mon, 22 Apr 2024 11:59:39 +0000
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] arm64: mx93: etherrnet: set TX_CLK in
	RMII mode
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

SGVsbG8sCgpPbiA0LzIyLzI0IDEwOjQ2LCBTdGVmZmVuIFRydW10cmFyIHdyb3RlOgo+IFRoaXMg
c2VyaWVzIGFkZHMgc3VwcG9ydCBmb3Igc2V0dGluZyB0aGUgVFhfQ0xLIGRpcmVjdGlvbiBpbiB0
aGUgZVFPUwo+IGV0aGVybmV0IGNvcmUgb24gdGhlIGkuTVg5MyB3aGVuIFJNSUkgbW9kZSBpcyB1
c2VkLgo+IAo+IEFjY29yZGluZyB0byBBTjE0MTQ5LCB3aGVuIHRoZSBpLk1YOTMgZXRoZXJuZXQg
Y29udHJvbGxlciBpcyB1c2VkIGluCj4gUk1JSSBtb2RlLCB0aGUgVFhfQ0xLICptdXN0KiBiZSBz
ZXQgdG8gb3V0cHV0IG1vZGUuCgpNdXN0ID8gSSBkb24ndCB0aGluayB0aGF0IGlzIHRydWUuIERv
d25zdHJlYW0gTlhQIGtlcm5lbCBoYXMgYW4gb3B0aW9uIAp0byBzZXQgVFhfQ0xLIGFzIGFuIGlu
cHV0OgoKaHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvbGludXgtaW14L2Jsb2IvbGYtNi42Lnkv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9ueHAlMkNkd21hYy1pbXgueWFt
bCNMNjkKCmh0dHBzOi8vZ2l0aHViLmNvbS9ueHAtaW14L2xpbnV4LWlteC9jb21taXQvZmJjMTdm
NmY3OTE5ZDAzYzI3NWZjNDhiMDQwMGMyMTI0NzViNjBlYwoKUmVnYXJkcywKCj4gCj4gQWRkIGEg
ZGV2aWNldHJlZSBwcm9wZXJ0eSB3aXRoIHRoZSByZWdpc3RlciB0byBzZXQgdGhpcyBiaXQgYW5k
IHBhcnNlIGl0Cj4gaW4gdGhlIGR3bWFjLWlteCBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U3RlZmZlbiBUcnVtdHJhciA8cy50cnVtdHJhckBwZW5ndXRyb25peC5kZT4KPiAtLS0KPiBTdGVm
ZmVuIFRydW10cmFyICgzKToKPiAgICAgICAgZHQtYmluZGluZ3M6IG5ldDogbXg5MzogYWRkIGVu
ZXRfY2xrX3NlbCBiaW5kaW5nCj4gICAgICAgIGFybTY0OiBkdHM6IGlteDkzOiBhZGQgZW5ldF9j
bGtfc2VsCj4gICAgICAgIG5ldDogc3RtaWNybzogaW14OiBzZXQgVFhfQ0xLIGRpcmVjdGlvbiBp
biBSTUlJIG1vZGUKPiAKPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9ueHAsZHdtYWMt
aW14LnlhbWwgICAgIHwgMTAgKysrKysrKysKPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDkzLmR0c2kgICAgICAgICAgIHwgIDEgKwo+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtaW14LmMgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysr
Cj4gICAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKPiAtLS0KPiBiYXNlLWNvbW1p
dDogNGNlY2U3NjQ5NjUwMjBjMjJjZmY3NjY1YjE4YTAxMjAwNjM1OTA5NQo+IGNoYW5nZS1pZDog
MjAyNDA0MjItdjYtOS10b3BpYy1pbXg5My1lcW9zLXJtaWktM2EyY2I0MjFjODFkCj4gCj4gQmVz
dCByZWdhcmRzLAoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1hZGV1cyBTeXN0ZW1zClNv
ZnR3YXJlIGVuZ2luZWVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
