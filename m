Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC3816D3F
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 13:02:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B135CC6DD70;
	Mon, 18 Dec 2023 12:02:13 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AACFAC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 12:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702900929;
 bh=3MhTuYEHVtxN6jKjyXhSlPpArK287YLadDQAYGZC2IM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WAjo/lhLjeb8QX9nhEkYkVMVLqUSZk0KhaW86DWjRscg1t1rqpDL6UgDyuXZBEib8
 Ci7E8H3tLkD70CRdGg0eSS1VnFEM0Nj/gvKAzDywOemmEZoeiH+Tjfp8tp/B27PTh3
 UUNdANTQxyo5PM3OQE9Aq9rE0oTMgaPislp6Kj24xvkuIv5TcCvWduUOpzJyAS0acS
 kY97/jAxbHDL/4N6YJ26aqmMKIzev+lxd494O0Ww4QohGj4VicDrZuqYGz/QCWR9jN
 4NyZbdlHkWHXxfj0Dq4SDadU+ddRs6Jtjw4A784SmPRLR65yeLVPQkrNx2Dw8wGxYh
 DqNxp7CNl0DPQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97C7037814A4;
 Mon, 18 Dec 2023 12:02:07 +0000 (UTC)
Message-ID: <fa4b9c1d-6033-4b35-b03c-e03419edb5dc@collabora.com>
Date: Mon, 18 Dec 2023 14:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
 <65fd52f1-6861-42b0-9148-266766d054b1@sifive.com>
 <6c62e3b2-acde-4580-9b67-56683289e45e@collabora.com>
 <20231217-spray-livestock-a59d630b751e@spud>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20231217-spray-livestock-a59d630b751e@spud>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Michael Turquette <mturquette@baylibre.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, kernel@collabora.com,
 linux-clk@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, LKML <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 2/9] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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

T24gMTIvMTcvMjMgMjM6MDksIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBGcmksIERlYyAxNSwg
MjAyMyBhdCAxMTowMzoyNFBNICswMjAwLCBDcmlzdGlhbiBDaW9jYWx0ZWEgd3JvdGU6Cj4+IE9u
IDEyLzE1LzIzIDIyOjU5LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPj4+IE9uIDIwMjMtMTItMTUg
Mjo0NyBQTSwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4+Pj4gT24gMTUgRGVjIDIwMjMsIGF0IDIw
OjQwLCBDcmlzdGlhbiBDaW9jYWx0ZWEgPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29t
PiB3cm90ZToKPj4+Pj4KPj4+Pj4gVGhlIFN5bm9wc3lzIERlc2lnbldhcmUgTUFDIGZvdW5kIG9u
IFN0YXJGaXZlIEpINzEwMCBTb0MgaXMgbW9zdGx5Cj4+Pj4+IHNpbWlsYXIgdG8gdGhlIG5ld2Vy
IEpINzExMCwgYnV0IGl0IHJlcXVpcmVzIG9ubHkgdHdvIGludGVycnVwdHMgYW5kIGEKPj4+Pj4g
c2luZ2xlIHJlc2V0IGxpbmUsIHdoaWNoIGlzICdhaGInIGluc3RlYWQgb2YgdGhlIGNvbW1vbmx5
IHVzZWQKPj4+Pj4gJ3N0bW1hY2V0aCcuCj4+Pj4+Cj4+Pj4+IFNpbmNlIHRoZSBjb21tb24gYmlu
ZGluZyAnc25wcyxkd21hYycgYWxsb3dzIHNlbGVjdGluZyAnYWhiJyBvbmx5IGluCj4+Pj4+IGNv
bmp1bmN0aW9uIHdpdGggJ3N0bW1hY2V0aCcsIGV4dGVuZCB0aGUgbG9naWMgdG8gYWxzbyBwZXJt
aXQgZXhjbHVzaXZlCj4+Pj4+IHVzYWdlIG9mIHRoZSAnYWhiJyByZXNldCBuYW1lLiAgVGhpcyBl
bnN1cmVzIHRoZSBmb2xsb3dpbmcgdXNlIGNhc2VzIGFyZQo+Pj4+PiBzdXBwb3J0ZWQ6Cj4+Pj4+
Cj4+Pj4+ICBKSDcxMTA6IHJlc2V0LW5hbWVzID0gInN0bW1hY2V0aCIsICJhaGIiOwo+Pj4+PiAg
Skg3MTAwOiByZXNldC1uYW1lcyA9ICJhaGIiOwo+Pj4+PiAgb3RoZXI6ICByZXNldC1uYW1lcyA9
ICJzdG1tYWNldGgiOwo+Pj4+Pgo+Pj4+PiBBbHNvIG5vdGUgdGhlIG5lZWQgdG8gdXNlIGEgZGlm
ZmVyZW50IGR3bWFjIGZhbGxiYWNrLCBhcyB2NS4yMCBhcHBsaWVzCj4+Pj4+IHRvIEpINzExMCBv
bmx5LCB3aGlsZSBKSDcxMDAgcmVsaWVzIG9uIHYzLjd4Lgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBDcmlzdGlhbiBDaW9jYWx0ZWEgPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29t
Pgo+Pj4+PiAtLS0KPj4+Pj4gLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMu
eWFtbCAgIHwgIDMgKy0KPj4+Pj4gLi4uL2JpbmRpbmdzL25ldC9zdGFyZml2ZSxqaDcxMTAtZHdt
YWMueWFtbCAgIHwgNzQgKysrKysrKysrKysrKy0tLS0tLQo+Pj4+PiAyIGZpbGVzIGNoYW5nZWQs
IDU1IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+
Pj4+PiBpbmRleCA1YzI3NjlkYzY4OWEuLmMxMzgwZmYxYzA1NCAxMDA2NDQKPj4+Pj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPj4+
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFj
LnlhbWwKPj4+Pj4gQEAgLTk1LDYgKzk1LDcgQEAgcHJvcGVydGllczoKPj4+Pj4gICAgICAgICAt
IHNucHMsZHdtYWMtNS4yMAo+Pj4+PiAgICAgICAgIC0gc25wcyxkd3hnbWFjCj4+Pj4+ICAgICAg
ICAgLSBzbnBzLGR3eGdtYWMtMi4xMAo+Pj4+PiArICAgICAgICAtIHN0YXJmaXZlLGpoNzEwMC1k
d21hYwo+Pj4+PiAgICAgICAgIC0gc3RhcmZpdmUsamg3MTEwLWR3bWFjCj4+Pj4+Cj4+Pj4+ICAg
cmVnOgo+Pj4+PiBAQCAtMTQ2LDcgKzE0Nyw3IEBAIHByb3BlcnRpZXM6Cj4+Pj4+ICAgcmVzZXQt
bmFtZXM6Cj4+Pj4+ICAgICBtaW5JdGVtczogMQo+Pj4+PiAgICAgaXRlbXM6Cj4+Pj4+IC0gICAg
ICAtIGNvbnN0OiBzdG1tYWNldGgKPj4+Pj4gKyAgICAgIC0gZW51bTogW3N0bW1hY2V0aCwgYWhi
XQo+Pj4+PiAgICAgICAtIGNvbnN0OiBhaGIKPj4+Pgo+Pj4+IEnigJltIG5vdCBzbyB3ZWxsLXZl
cnNlZCBpbiB0aGUgWUFNTCBiaW5kaW5ncywgYnV0IHdvdWxkIHRoaXMgbm90IGFsbG93Cj4+Pj4g
cmVzZXQtbmFtZXMgPSAiYWhiIiwgImFoYiI/Cj4+Pgo+Pj4gWWVzLCBpdCB3b3VsZC4gWW91IG5l
ZWQgc29tZXRoaW5nIGxpa2U6Cj4+Pgo+Pj4gcmVzZXQtbmFtZXM6Cj4+PiAgIG9uZU9mOgo+Pj4g
ICAgIC0gZW51bTogW3N0bW1hY2V0aCwgYWhiXQo+Pj4gICAgIC0gaXRlbXM6Cj4+PiAgICAgICAg
IC0gY29uc3Q6IHN0bW1hY2V0aAo+Pj4gICAgICAgICAtIGNvbnN0OiBhaGIKPj4KPj4gT2ggeWVz
LCBJIGFsd2F5cyBmb3JnZXQgYWJvdXQgdGhlICJvbmVPZiIgdGhpbmcuIFRoYW5rcyEKPiAKPiBX
b24ndCB0aGlzIGFsc28gcmVsYXggdGhlIG5hbWluZyBmb3IgYWxsIGRldmljZXMgdGhhdCBhbGxv
dyBhIHNpbmdsZQo+IHJlc2V0LCBidXQgZXhwZWN0IHRoZSBzdG1tYWNldGggb25lPyBJJ20gbm90
IHN1cmUgdGhhdCB0aGF0IGFjdHVhbGx5Cj4gbWF0dGVycywgSSB0aGluayB0aGUgY29uc3VtZXIg
YmluZGluZ3MgaGF2ZSBjb25zdHJhaW50cyB0aGVtc2VsdmVzLgoKQmVmb3JlIGNvbW1pdCA4NDNm
NjAzNzYyYTUgKCJkdC1iaW5kaW5nczogbmV0OiBzbnBzLGR3bWFjOiBBZGQgJ2FoYicKcmVzZXQv
cmVzZXQtbmFtZSIpLCB0aGUgJ3N0bW1hY2V0aCcgd2FzIHRoZSBvbmx5IHBvc3NpYmxlIG9wdGlv
biwgaGVuY2UKdGhlcmUgd2FzIG5vIG5lZWQgZm9yIGFueSBjb25zdHJhaW50cyBvbiB0aGUgY29u
c3VtZXIgYmluZGluZ3MuICBCdXQKYWZ0ZXJ3YXJkcyBpdCB3YXMgYWxsb3dlZCB0byB1c2UgYm90
aCByZXNldHMsIGhlbmNlIEkgdGhpbmsgdGhlIGJpbmRpbmdzCnNob3VsZCBoYXZlIGJlZW4gdXBk
YXRlZCBhdCB0aGF0IHRpbWUgYnkgYWRkaW5nICdtYXhJdGVtczogMScgdG8gcHJldmVudAp1c2lu
ZyB0aGUgMm5kIHJlc2V0LgoKSSBjb3VsZCBmaXggdGhpcyBpbiBhIHNlcGFyYXRlIHNlcmllcywg
aWYgaXQncyBub3Qgc29tZXRoaW5nIG1hbmRhdG9yeQp0byBiZSBoYW5kbGVkIGhlcmUuCgpUaGFu
a3MgZm9yIHJldmlld2luZywKQ3Jpc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
