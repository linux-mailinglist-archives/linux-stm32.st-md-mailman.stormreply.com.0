Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD157EEDF6
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 09:59:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82DDCC6C83F;
	Fri, 17 Nov 2023 08:59:04 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24D1CC6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 08:59:03 +0000 (UTC)
Received: from [100.116.17.117] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DBE37660738B;
 Fri, 17 Nov 2023 08:59:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700211542;
 bh=mSTx9zqrnn7lEW3vy1lR7oqBFFa9rnmtFZ28Q6NNZVo=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=DbdkWOd67zaj48dorFbegWDEOnLilRSxAU8IMF9PEe0F3jKz8ilpktpVWopTE3fH+
 5Z87CfSU9O3WNHKZW1ItpEkyMx4Ya7uIPxvq4JzuvwCpqqGR2xICYIKyKf1Qlo3UZs
 eHpvZ9Hw4p980MVZBsRw355Ten8C4Y948Fco6COVodqFW/wI7R2leK+kCER69RAtCM
 2GyK6AJNfeOSlYC8tSxMrpviinpmOomwJMxHYYu53j+MA82eIJmlfjhSJ7XaobvyzB
 K8rub3V9G4grfYMtnn1FYWe0TSHBEwawSS9QEYcFMtfaGhp/D5BsdXknVUeoEMLAgD
 ExQE65vA9LPbQ==
Message-ID: <84fd076b-6db4-4251-aff8-36befc28e574@collabora.com>
Date: Fri, 17 Nov 2023 10:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
 <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
 <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
 <20231116-stellar-anguished-7cf06eb5634a@squawk>
 <CAMuHMdXdeW9SRN8hq-0722CiLvXDFVwpJxjFTGgdc2mhT=ppYw@mail.gmail.com>
 <b4a3a139-4831-447e-94ed-d590986aed8c@collabora.com>
In-Reply-To: <b4a3a139-4831-447e-94ed-d590986aed8c@collabora.com>
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
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
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

T24gMTEvMTcvMjMgMTA6NDksIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPiBPbiAxMS8xNy8y
MyAxMDozNywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+PiBPbiBUaHUsIE5vdiAxNiwgMjAy
MyBhdCA2OjU14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4+
IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDAzOjE1OjQ2UE0gKzAyMDAsIENyaXN0aWFuIENpb2Nh
bHRlYSB3cm90ZToKPj4+PiBPbiAxMC8zMC8yMyAwMDo1MywgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdy
b3RlOgo+Pj4+PiBPbiAxMC8yOS8yMyAyMDo0NiwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+Pj4+PiBP
biBTdW4sIE9jdCAyOSwgMjAyMyBhdCAwNjoyNzoxMkFNICswMjAwLCBDcmlzdGlhbiBDaW9jYWx0
ZWEgd3JvdGU6Cj4+Pj4+Pj4gVGhlIEJlYWdsZVYgU3RhcmxpZ2h0IFNCQyB1c2VzIGEgTWljcm9j
aGlwIEtTWjkwMzFSTlhDQSBQSFkgc3VwcG9ydGluZwo+Pj4+Pj4+IFJHTUlJLUlELgo+Pj4+Pj4+
Cj4+Pj4+Pj4gVE9ETzogVmVyaWZ5IGlmIG1hbnVhbCBhZGp1c3RtZW50IG9mIHRoZSBSWCBpbnRl
cm5hbCBkZWxheSBpcyBuZWVkZWQuIElmCj4+Pj4+Pj4geWVzLCBhZGQgdGhlIG1kaW8gJiBwaHkg
c3ViLW5vZGVzLgo+Pj4+Pj4KPj4+Pj4+IFBsZWFzZSBjb3VsZCB5b3UgdHJ5IHRvIGdldCB0aGlz
IHRlc3RlZC4gSXQgbWlnaHQgc2hlZCBzb21lIGxpZ2h0IG9uCj4+Pj4+PiB3aGF0IGlzIGdvaW5n
IG9uIGhlcmUsIHNpbmNlIGl0IGlzIGEgZGlmZmVyZW50IFBIWS4KPj4+Pj4KPj4+Pj4gQWN0dWFs
bHksIHRoaXMgaXMgdGhlIG1haW4gcmVhc29uIEkgYWRkZWQgdGhlIHBhdGNoLiBJIGRvbid0IGhh
dmUgYWNjZXNzCj4+Pj4+IHRvIHRoaXMgYm9hcmQsIHNvIGl0IHdvdWxkIGJlIGdyZWF0IGlmIHdl
IGNvdWxkIGdldCBzb21lIGhlbHAgd2l0aCB0ZXN0aW5nLgo+Pj4+Cj4+Pj4gQEVtaWwsIEBDb25v
cjogQW55IGlkZWEgd2hvIG1pZ2h0IGhlbHAgdXMgd2l0aCBhIHF1aWNrIHRlc3Qgb24gdGhlCj4+
Pj4gQmVhZ2xlViBTdGFybGlnaHQgYm9hcmQ/Cj4+Pgo+Pj4gSSBkb24ndCBoYXZlIG9uZSAmIEkg
YW0gbm90IHN1cmUgaWYgRW1pbCBkb2VzLiBHZWVydCAoQ0NlZCkgc2hvdWxkIGhhdmUKPj4KPj4g
SSBiZWxpZXZlIEVzbWlsIGhhcy4KPj4KPj4+IG9uZSB0aG91Z2guIElzIHRoZXJlIGEgc3BlY2lm
aWMgdGVzdCB5b3UgbmVlZCB0byBoYXZlIGRvbmU/Cj4+Cj4+IEkgZ2F2ZSBpdCBhIHRyeSwgb24g
dG9wIG9mIGxhdGVzdCByZW5lc2FzLWRyaXZlcnNbMV0uCgpbLi4uXQoKPj4KPj4gTG9va3MgbGlr
ZSBpdCBuZWVkcyBtb3JlIG5vbi1jb2hlcmVudCBzdXBwb3J0IGJlZm9yZSB3ZSBjYW4gdGVzdAo+
PiBFdGhlcm5ldC4KPiAKPiBIaSBHZWVydCwKPiAKPiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byB0ZXN0IHRoaXMhCj4gCj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayBpZiB0aGUgZm9sbG93
aW5nIGFyZSBlbmFibGVkIGluIHlvdXIga2VybmVsIGNvbmZpZzoKPiAKPiAgIENPTkZJR19ETUFf
R0xPQkFMX1BPT0wKPiAgIENPTkZJR19SSVNDVl9ETUFfTk9OQ09IRVJFTlQKPiAgIENPTkZJR19S
SVNDVl9OT05TVEFOREFSRF9DQUNIRV9PUFMKPiAgIENPTkZJR19TSUZJVkVfQ0NBQ0hFCgpBbHNv
IHBsZWFzZSBub3RlIHRoZSBzZXJpZXMgcmVxdWlyZXMgdGhlIFNpRml2ZSBDb21wb3NhYmxlIENh
Y2hlIApjb250cm9sbGVyIHBhdGNoZXMgcHJvdmlkZWQgYnkgRW1pbCBbMV0uCgpbMV06IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTAzMTE0MTQ0NC41MzQyNi0xLWVtaWwucmVubmVy
LmJlcnRoaW5nQGNhbm9uaWNhbC5jb20vCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
