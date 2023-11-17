Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6F7EF188
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 12:19:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95ACCC6C83F;
	Fri, 17 Nov 2023 11:19:36 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0200C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 11:19:34 +0000 (UTC)
Received: from [100.116.17.117] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ADD726601711;
 Fri, 17 Nov 2023 11:19:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700219974;
 bh=h2jcyuHxfZJvtCW/6nbh9J0OGrBeJS/78VqRCazEDN4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l4V9cavg+Usm4d4l1NP4QhqbJ0vO/LogHGKqbNYkR30f9w5CnxCWk9EkZ3RodIQJx
 rfPgRlQ4EfYvyFKbv1IqRhOioL9pysvwb+gH0AhXdcHfAbUhk3Yyb45+kKSQa2esqd
 VeEvo8D+lFAt0NWppFw2pZjrIWTAxcGZmVLqC54pDoxv5TDXo+cQGUKh+b7BBe7ap+
 PcJJMrdDnMS1iRwscQ1hUepm36wPoSues76Hmsa3/al6nYLYwHZHPtJt3zDjtDPIDP
 +Dm5zhbGtZzVSVVlTC4HTUaTikOS2qlPw1mBHny4wUHM8ijJraYVQtGVZB3zgesPdo
 E5MgVGbufksNw==
Message-ID: <e2f4ba34-24db-4669-bac4-ac64ea7761cf@collabora.com>
Date: Fri, 17 Nov 2023 13:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
 <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
 <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
 <20231116-stellar-anguished-7cf06eb5634a@squawk>
 <CAMuHMdXdeW9SRN8hq-0722CiLvXDFVwpJxjFTGgdc2mhT=ppYw@mail.gmail.com>
 <b4a3a139-4831-447e-94ed-d590986aed8c@collabora.com>
 <84fd076b-6db4-4251-aff8-36befc28e574@collabora.com>
 <CAMuHMdVXAx+b6=70PdgJrpbegBkDpb3w1UF0_u1Odi=JoYL2-w@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAMuHMdVXAx+b6=70PdgJrpbegBkDpb3w1UF0_u1Odi=JoYL2-w@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
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

T24gMTEvMTcvMjMgMTE6MTIsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBIaSBDcmlzdGlh
biwKPiAKPiBPbiBGcmksIE5vdiAxNywgMjAyMyBhdCA5OjU54oCvQU0gQ3Jpc3RpYW4gQ2lvY2Fs
dGVhCj4gPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPj4gT24gMTEv
MTcvMjMgMTA6NDksIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPj4+IE9uIDExLzE3LzIzIDEw
OjM3LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4+Pj4gT24gVGh1LCBOb3YgMTYsIDIwMjMg
YXQgNjo1NeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+
IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDAzOjE1OjQ2UE0gKzAyMDAsIENyaXN0aWFuIENpb2Nh
bHRlYSB3cm90ZToKPj4+Pj4+IE9uIDEwLzMwLzIzIDAwOjUzLCBDcmlzdGlhbiBDaW9jYWx0ZWEg
d3JvdGU6Cj4+Pj4+Pj4gT24gMTAvMjkvMjMgMjA6NDYsIEFuZHJldyBMdW5uIHdyb3RlOgo+Pj4+
Pj4+PiBPbiBTdW4sIE9jdCAyOSwgMjAyMyBhdCAwNjoyNzoxMkFNICswMjAwLCBDcmlzdGlhbiBD
aW9jYWx0ZWEgd3JvdGU6Cj4+Pj4+Pj4+PiBUaGUgQmVhZ2xlViBTdGFybGlnaHQgU0JDIHVzZXMg
YSBNaWNyb2NoaXAgS1NaOTAzMVJOWENBIFBIWSBzdXBwb3J0aW5nCj4+Pj4+Pj4+PiBSR01JSS1J
RC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBUT0RPOiBWZXJpZnkgaWYgbWFudWFsIGFkanVzdG1lbnQg
b2YgdGhlIFJYIGludGVybmFsIGRlbGF5IGlzIG5lZWRlZC4gSWYKPj4+Pj4+Pj4+IHllcywgYWRk
IHRoZSBtZGlvICYgcGh5IHN1Yi1ub2Rlcy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gUGxlYXNlIGNvdWxk
IHlvdSB0cnkgdG8gZ2V0IHRoaXMgdGVzdGVkLiBJdCBtaWdodCBzaGVkIHNvbWUgbGlnaHQgb24K
Pj4+Pj4+Pj4gd2hhdCBpcyBnb2luZyBvbiBoZXJlLCBzaW5jZSBpdCBpcyBhIGRpZmZlcmVudCBQ
SFkuCj4+Pj4+Pj4KPj4+Pj4+PiBBY3R1YWxseSwgdGhpcyBpcyB0aGUgbWFpbiByZWFzb24gSSBh
ZGRlZCB0aGUgcGF0Y2guIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MKPj4+Pj4+PiB0byB0aGlzIGJvYXJk
LCBzbyBpdCB3b3VsZCBiZSBncmVhdCBpZiB3ZSBjb3VsZCBnZXQgc29tZSBoZWxwIHdpdGggdGVz
dGluZy4KPj4+Pj4+Cj4+Pj4+PiBARW1pbCwgQENvbm9yOiBBbnkgaWRlYSB3aG8gbWlnaHQgaGVs
cCB1cyB3aXRoIGEgcXVpY2sgdGVzdCBvbiB0aGUKPj4+Pj4+IEJlYWdsZVYgU3RhcmxpZ2h0IGJv
YXJkPwo+Pj4+Pgo+Pj4+PiBJIGRvbid0IGhhdmUgb25lICYgSSBhbSBub3Qgc3VyZSBpZiBFbWls
IGRvZXMuIEdlZXJ0IChDQ2VkKSBzaG91bGQgaGF2ZQo+Pj4+Cj4+Pj4gSSBiZWxpZXZlIEVzbWls
IGhhcy4KPj4+Pgo+Pj4+PiBvbmUgdGhvdWdoLiBJcyB0aGVyZSBhIHNwZWNpZmljIHRlc3QgeW91
IG5lZWQgdG8gaGF2ZSBkb25lPwo+Pj4+Cj4+Pj4gSSBnYXZlIGl0IGEgdHJ5LCBvbiB0b3Agb2Yg
bGF0ZXN0IHJlbmVzYXMtZHJpdmVyc1sxXS4KPj4KPj4gWy4uLl0KPj4KPj4+Pgo+Pj4+IExvb2tz
IGxpa2UgaXQgbmVlZHMgbW9yZSBub24tY29oZXJlbnQgc3VwcG9ydCBiZWZvcmUgd2UgY2FuIHRl
c3QKPj4+PiBFdGhlcm5ldC4KPj4+Cj4+PiBIaSBHZWVydCwKPj4+Cj4+PiBUaGFua3MgZm9yIHRh
a2luZyB0aGUgdGltZSB0byB0ZXN0IHRoaXMhCj4+Pgo+Pj4gQ291bGQgeW91IHBsZWFzZSBjaGVj
ayBpZiB0aGUgZm9sbG93aW5nIGFyZSBlbmFibGVkIGluIHlvdXIga2VybmVsIGNvbmZpZzoKPj4+
Cj4+PiAgIENPTkZJR19ETUFfR0xPQkFMX1BPT0wKPj4+ICAgQ09ORklHX1JJU0NWX0RNQV9OT05D
T0hFUkVOVAo+Pj4gICBDT05GSUdfUklTQ1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTCj4+PiAgIENP
TkZJR19TSUZJVkVfQ0NBQ0hFCj4gCj4gQ09ORklHX0RNQV9HTE9CQUxfUE9PTCBhbmQgQ09ORklH
X1JJU0NWX05PTlNUQU5EQVJEX0NBQ0hFX09QUyB3ZXJlCj4gaW5kZWVkIG5vIGxvbmdlciBlbmFi
bGVkLCBhcyB0aGV5IGNhbm5vdCBiZSBlbmFibGVkIG1hbnVhbGx5Lgo+IAo+IEFmdGVyIGNoZXJy
eS1waWNraW5nIGNvbW1pdCBlMTRhZDlmZjY3ZmQ1MWRjICgicmlzY3Y6IGVycmF0YTogQWRkCj4g
U3RhckZpdmUgSkg3MTAwIGVycmF0YSIpIGluIGVzbWlsL3Zpc2lvbmZpdmUgdGhlc2Ugb3B0aW9u
cyBiZWNvbWUKPiBlbmFibGVkLiBOb3cgaXQgZ2V0cyBhIGJpdCBmdXJ0aGVyLCBidXQgc3RpbGwg
bG90cyBvZiBDQ0FDSEUgRGF0YUZhaWwKPiBlcnJvcnMuCgpSaWdodCwgdGhlcmUgaXMgYW4gb3Bl
biBxdWVzdGlvbiBbMl0gaW4gUEFUQ0ggdjIgMDgvMTIgaWYgdGhpcyBwYXRjaApzaG91bGQgaGF2
ZSBiZWVuIHBhcnQgb2YgRW1pbCdzIGNjYWNoZSBzZXJpZXMgb3IgSSB3aWxsIHNlbmQgaXQgaW4g
djMKb2YgbXkgc2VyaWVzLgoKWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzRmNjYx
ODE4LTE1ODUtNDFkOC1hMzA1LTk2ZmQzNTliYzhiOEBjb2xsYWJvcmEuY29tLwoKPj4gQWxzbyBw
bGVhc2Ugbm90ZSB0aGUgc2VyaWVzIHJlcXVpcmVzIHRoZSBTaUZpdmUgQ29tcG9zYWJsZSBDYWNo
ZQo+PiBjb250cm9sbGVyIHBhdGNoZXMgcHJvdmlkZWQgYnkgRW1pbCBbMV0uCj4+Cj4+IFsxXTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMDMxMTQxNDQ0LjUzNDI2LTEtZW1pbC5y
ZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbS8KPiAKPiBUaGF0IHNlcmllcyBkb2VzIG5vdCBj
b250YWluIGFueSBLY29uZmlnIGNoYW5nZXMsIHNvIHRoZXJlIG11c3QgYmUKPiBvdGhlciBtaXNz
aW5nIGRlcGVuZGVuY2llcz8KClRoZXJlIHNob3VsZG4ndCBiZSBhbnkgYWRkaXRpb25hbCBLY29u
ZmlnIGNoYW5nZXMgb3IgZGVwZW5kZW5jaWVzIGFzIAp0aG9zZSBwYXRjaGVzIGp1c3QgZXh0ZW5k
IGFuIGFscmVhZHkgZXhpc3RpbmcgZHJpdmVyLiBUaGVyZSB3ZXJlIHNvbWUgCmNoYW5nZXMgaW4g
djIsIGJ1dCB0aGV5IGFyZSBzdGlsbCBjb21wYXRpYmxlIHdpdGggdGhpcyBzZXJpZXMgKEkndmUg
CnJldGVzdGVkIHRoYXQgdG8gbWFrZSBzdXJlKS4KCk15IHRyZWUgaXMgYmFzZWQgb24gbmV4dC0y
MDIzMTAyNCwgc28gSSdtIGdvaW5nIHRvIHJlYmFzZSBpdCBvbnRvCm5leHQtMjAyMzExMTcsIHRv
IGV4Y2x1ZGUgdGhlIHBvc3NpYmlsaXR5IG9mIGEgcmVncmVzc2lvbiBzb21ld2hlcmUuCgpJIHdp
bGwgYWxzbyB0ZXN0IHdpdGggcmVuZXNhcy1kcml2ZXJzLgoKVGhhbmtzLApDcmlzdGlhbgogCj4g
UGVyaGFwcyBJIHNob3VsZCBqdXN0IGRlZmVyIHRvIEVtaWwgOy0pCj4gCj4gR3J7b2V0amUsZWV0
aW5nfXMsCj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
