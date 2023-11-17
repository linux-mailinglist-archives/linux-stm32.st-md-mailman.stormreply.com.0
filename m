Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF957EFB97
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 23:49:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42117C6C85E;
	Fri, 17 Nov 2023 22:49:05 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DC56C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 22:49:04 +0000 (UTC)
Received: from [100.116.17.117] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D91826607392;
 Fri, 17 Nov 2023 22:49:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700261343;
 bh=0tjjKjAurRBn5zKIbePAVaEbSE3D2bVElukfuHa4ky0=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=FZQKVqdj8c4YnfPf8Ln2LNSP1PEuIphRLQYbKAGWR6YfGVw1MtjOEX/wct3rVvHY1
 SA4Ihjwc2X8BRBh/O69W4lpnlnnzwloaKupoS7dPFrBaZXvrihuVyXVJHa29VGKyOC
 OuBVPmsy2ClqfU2zxcRpNQsjtbromviSrfF8aA/PF3gLcODKw3n1B/mbG1D01xADGx
 h1hsLodXzXwkQYI9QaRonqclZzteXFm8ErvbEhg3rWNd6hCIvBvYfVwPLW4YvsGVKh
 EaE+iRLu3x1gDXDtlQhJVfQvGew/L5al27uQ8WUyDkB6zBm++op7EKXhK/2KQpXDoh
 53YJXXX+alJVw==
Message-ID: <daa8c056-0279-4c2d-9a22-2375fd63f0a1@collabora.com>
Date: Sat, 18 Nov 2023 00:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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
 <e2f4ba34-24db-4669-bac4-ac64ea7761cf@collabora.com>
In-Reply-To: <e2f4ba34-24db-4669-bac4-ac64ea7761cf@collabora.com>
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

T24gMTEvMTcvMjMgMTM6MTksIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPiBPbiAxMS8xNy8y
MyAxMToxMiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+PiBIaSBDcmlzdGlhbiwKPj4KPj4g
T24gRnJpLCBOb3YgMTcsIDIwMjMgYXQgOTo1OeKAr0FNIENyaXN0aWFuIENpb2NhbHRlYQo+PiA8
Y3Jpc3RpYW4uY2lvY2FsdGVhQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Pj4gT24gMTEvMTcvMjMg
MTA6NDksIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPj4+PiBPbiAxMS8xNy8yMyAxMDozNywg
R2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+Pj4+PiBPbiBUaHUsIE5vdiAxNiwgMjAyMyBhdCA2
OjU14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+IE9u
IFRodSwgTm92IDE2LCAyMDIzIGF0IDAzOjE1OjQ2UE0gKzAyMDAsIENyaXN0aWFuIENpb2NhbHRl
YSB3cm90ZToKPj4+Pj4+PiBPbiAxMC8zMC8yMyAwMDo1MywgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdy
b3RlOgo+Pj4+Pj4+PiBPbiAxMC8yOS8yMyAyMDo0NiwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+Pj4+
Pj4+PiBPbiBTdW4sIE9jdCAyOSwgMjAyMyBhdCAwNjoyNzoxMkFNICswMjAwLCBDcmlzdGlhbiBD
aW9jYWx0ZWEgd3JvdGU6Cj4+Pj4+Pj4+Pj4gVGhlIEJlYWdsZVYgU3RhcmxpZ2h0IFNCQyB1c2Vz
IGEgTWljcm9jaGlwIEtTWjkwMzFSTlhDQSBQSFkgc3VwcG9ydGluZwo+Pj4+Pj4+Pj4+IFJHTUlJ
LUlELgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gVE9ETzogVmVyaWZ5IGlmIG1hbnVhbCBhZGp1c3Rt
ZW50IG9mIHRoZSBSWCBpbnRlcm5hbCBkZWxheSBpcyBuZWVkZWQuIElmCj4+Pj4+Pj4+Pj4geWVz
LCBhZGQgdGhlIG1kaW8gJiBwaHkgc3ViLW5vZGVzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFBsZWFz
ZSBjb3VsZCB5b3UgdHJ5IHRvIGdldCB0aGlzIHRlc3RlZC4gSXQgbWlnaHQgc2hlZCBzb21lIGxp
Z2h0IG9uCj4+Pj4+Pj4+PiB3aGF0IGlzIGdvaW5nIG9uIGhlcmUsIHNpbmNlIGl0IGlzIGEgZGlm
ZmVyZW50IFBIWS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQWN0dWFsbHksIHRoaXMgaXMgdGhlIG1haW4g
cmVhc29uIEkgYWRkZWQgdGhlIHBhdGNoLiBJIGRvbid0IGhhdmUgYWNjZXNzCj4+Pj4+Pj4+IHRv
IHRoaXMgYm9hcmQsIHNvIGl0IHdvdWxkIGJlIGdyZWF0IGlmIHdlIGNvdWxkIGdldCBzb21lIGhl
bHAgd2l0aCB0ZXN0aW5nLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQEVtaWwsIEBDb25vcjogQW55IGlkZWEg
d2hvIG1pZ2h0IGhlbHAgdXMgd2l0aCBhIHF1aWNrIHRlc3Qgb24gdGhlCj4+Pj4+Pj4gQmVhZ2xl
ViBTdGFybGlnaHQgYm9hcmQ/Cj4+Pj4+Pgo+Pj4+Pj4gSSBkb24ndCBoYXZlIG9uZSAmIEkgYW0g
bm90IHN1cmUgaWYgRW1pbCBkb2VzLiBHZWVydCAoQ0NlZCkgc2hvdWxkIGhhdmUKPj4+Pj4KPj4+
Pj4gSSBiZWxpZXZlIEVzbWlsIGhhcy4KPj4+Pj4KPj4+Pj4+IG9uZSB0aG91Z2guIElzIHRoZXJl
IGEgc3BlY2lmaWMgdGVzdCB5b3UgbmVlZCB0byBoYXZlIGRvbmU/Cj4+Pj4+Cj4+Pj4+IEkgZ2F2
ZSBpdCBhIHRyeSwgb24gdG9wIG9mIGxhdGVzdCByZW5lc2FzLWRyaXZlcnNbMV0uCj4+Pgo+Pj4g
Wy4uLl0KPj4+Cj4+Pj4+Cj4+Pj4+IExvb2tzIGxpa2UgaXQgbmVlZHMgbW9yZSBub24tY29oZXJl
bnQgc3VwcG9ydCBiZWZvcmUgd2UgY2FuIHRlc3QKPj4+Pj4gRXRoZXJuZXQuCj4+Pj4KPj4+PiBI
aSBHZWVydCwKPj4+Pgo+Pj4+IFRoYW5rcyBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHRlc3QgdGhp
cyEKPj4+Pgo+Pj4+IENvdWxkIHlvdSBwbGVhc2UgY2hlY2sgaWYgdGhlIGZvbGxvd2luZyBhcmUg
ZW5hYmxlZCBpbiB5b3VyIGtlcm5lbCBjb25maWc6Cj4+Pj4KPj4+PiAgIENPTkZJR19ETUFfR0xP
QkFMX1BPT0wKPj4+PiAgIENPTkZJR19SSVNDVl9ETUFfTk9OQ09IRVJFTlQKPj4+PiAgIENPTkZJ
R19SSVNDVl9OT05TVEFOREFSRF9DQUNIRV9PUFMKPj4+PiAgIENPTkZJR19TSUZJVkVfQ0NBQ0hF
Cj4+Cj4+IENPTkZJR19ETUFfR0xPQkFMX1BPT0wgYW5kIENPTkZJR19SSVNDVl9OT05TVEFOREFS
RF9DQUNIRV9PUFMgd2VyZQo+PiBpbmRlZWQgbm8gbG9uZ2VyIGVuYWJsZWQsIGFzIHRoZXkgY2Fu
bm90IGJlIGVuYWJsZWQgbWFudWFsbHkuCj4+Cj4+IEFmdGVyIGNoZXJyeS1waWNraW5nIGNvbW1p
dCBlMTRhZDlmZjY3ZmQ1MWRjICgicmlzY3Y6IGVycmF0YTogQWRkCj4+IFN0YXJGaXZlIEpINzEw
MCBlcnJhdGEiKSBpbiBlc21pbC92aXNpb25maXZlIHRoZXNlIG9wdGlvbnMgYmVjb21lCj4+IGVu
YWJsZWQuIE5vdyBpdCBnZXRzIGEgYml0IGZ1cnRoZXIsIGJ1dCBzdGlsbCBsb3RzIG9mIENDQUNI
RSBEYXRhRmFpbAo+PiBlcnJvcnMuCj4gCj4gUmlnaHQsIHRoZXJlIGlzIGFuIG9wZW4gcXVlc3Rp
b24gWzJdIGluIFBBVENIIHYyIDA4LzEyIGlmIHRoaXMgcGF0Y2gKPiBzaG91bGQgaGF2ZSBiZWVu
IHBhcnQgb2YgRW1pbCdzIGNjYWNoZSBzZXJpZXMgb3IgSSB3aWxsIHNlbmQgaXQgaW4gdjMKPiBv
ZiBteSBzZXJpZXMuCj4gCj4gWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzRmNjYx
ODE4LTE1ODUtNDFkOC1hMzA1LTk2ZmQzNTliYzhiOEBjb2xsYWJvcmEuY29tLwo+IAo+Pj4gQWxz
byBwbGVhc2Ugbm90ZSB0aGUgc2VyaWVzIHJlcXVpcmVzIHRoZSBTaUZpdmUgQ29tcG9zYWJsZSBD
YWNoZQo+Pj4gY29udHJvbGxlciBwYXRjaGVzIHByb3ZpZGVkIGJ5IEVtaWwgWzFdLgo+Pj4KPj4+
IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMDMxMTQxNDQ0LjUzNDI2LTEt
ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbS8KPj4KPj4gVGhhdCBzZXJpZXMgZG9l
cyBub3QgY29udGFpbiBhbnkgS2NvbmZpZyBjaGFuZ2VzLCBzbyB0aGVyZSBtdXN0IGJlCj4+IG90
aGVyIG1pc3NpbmcgZGVwZW5kZW5jaWVzPwo+IAo+IFRoZXJlIHNob3VsZG4ndCBiZSBhbnkgYWRk
aXRpb25hbCBLY29uZmlnIGNoYW5nZXMgb3IgZGVwZW5kZW5jaWVzIGFzIAo+IHRob3NlIHBhdGNo
ZXMganVzdCBleHRlbmQgYW4gYWxyZWFkeSBleGlzdGluZyBkcml2ZXIuIFRoZXJlIHdlcmUgc29t
ZSAKPiBjaGFuZ2VzIGluIHYyLCBidXQgdGhleSBhcmUgc3RpbGwgY29tcGF0aWJsZSB3aXRoIHRo
aXMgc2VyaWVzIChJJ3ZlIAo+IHJldGVzdGVkIHRoYXQgdG8gbWFrZSBzdXJlKS4KPiAKPiBNeSB0
cmVlIGlzIGJhc2VkIG9uIG5leHQtMjAyMzEwMjQsIHNvIEknbSBnb2luZyB0byByZWJhc2UgaXQg
b250bwo+IG5leHQtMjAyMzExMTcsIHRvIGV4Y2x1ZGUgdGhlIHBvc3NpYmlsaXR5IG9mIGEgcmVn
cmVzc2lvbiBzb21ld2hlcmUuCj4gCj4gSSB3aWxsIGFsc28gdGVzdCB3aXRoIHJlbmVzYXMtZHJp
dmVycy4KCkkgdmVyaWZpZWQgd2l0aCBib3RoIHRyZWVzIGFuZCBkaWRuJ3Qgbm90aWNlIGFueSBp
c3N1ZXMgd2l0aCBteSAKVmlzaW9uRml2ZSBib2FyZCwgc28gSSBkb24ndCByZWFsbHkgdW5kZXJz
dGFuZCB3aHkgQmVhZ2xlViBTdGFybGlnaHQgCnNob3dzIGEgZGlmZmVyZW50IGJlaGF2aW9yLgoK
Rm9yIHJlZmVyZW5jZSwgcGxlYXNlIHNlZSBbM10gd2hpY2ggY29udGFpbnMgYWxsIHJlcXVpcmVk
IHBhdGNoZXMgCmFwcGxpZWQgb24gdG9wIG9mIG5leHQtMjAyMzExMTcuIFRoZSB0b3AtbW9zdCBv
bmUgOWQzNmRlYzdlNmRhICgicmlzY3Y6IApkdHM6IHN0YXJmaXZlOiBBZGQgSkg3MTAwIE1NQyBu
b2RlcyIpIGlzIG9wdGlvbmFsLCBJIGFkZGVkIGl0IHRvIGV4dGVuZCAKYSBiaXQgdGhlIHRlc3Qg
c3VpdGUgKFNELWNhcmQgY2FyZCBhY2Nlc3MgYWxzbyB3b3JrcyBmaW5lKS4KClszXTogaHR0cHM6
Ly9naXRsYWIuY29sbGFib3JhLmNvbS9jcmlzdGljYy9saW51eC1uZXh0Ly0vdHJlZS92aXNpb25m
aXZlLWV0aAoKRm9yIGNvbmZpZ3VyaW5nIHRoZSBrZXJuZWwsIEkgdXNlZDoKCiAgJCBtYWtlIFsu
Li5dIGRlZmNvbmZpZwogICQgc2NyaXB0cy9jb25maWcgLS1lbmFibGUgQ09ORklHX05PTlBPUlRB
QkxFIC0tZW5hYmxlIEVSUkFUQV9TVEFSRklWRV9KSDcxMDAKCkkgYWxzbyBub3RpY2VkIGEgd2Fy
bmluZyBtZXNzYWdlIHJpZ2h0IGJlZm9yZSBidWlsZGluZyBzdGFydHMsIGJ1dCBpdCAKZG9lc24n
dCBzZWVtIHRvIGJlIGhhcm1mdWw6CgpXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVz
IGRldGVjdGVkIGZvciBETUFfR0xPQkFMX1BPT0wKICBEZXBlbmRzIG9uIFtuXTogIUFSQ0hfSEFT
X0RNQV9TRVRfVU5DQUNIRUQgWz1uXSAmJiAhRE1BX0RJUkVDVF9SRU1BUCBbPXldCiAgU2VsZWN0
ZWQgYnkgW3ldOgogIC0gRVJSQVRBX1NUQVJGSVZFX0pINzEwMCBbPXldICYmIEFSQ0hfU1RBUkZJ
VkUgWz15XSAmJiBOT05QT1JUQUJMRSBbPXldCgpUaGFua3MsCkNyaXN0aWFuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
