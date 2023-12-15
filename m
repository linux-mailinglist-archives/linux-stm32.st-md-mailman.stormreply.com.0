Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BFB81517B
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 22:00:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6445BC6DD6D;
	Fri, 15 Dec 2023 21:00:04 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3D71C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 21:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702674002;
 bh=XmjdsnypmM0sVMOODNg7bU4x4gIm/6EultPACYo535g=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=STVO7dLPIsVi6rpyepTxq9ZaRTHmDDoUxqtPx0GKDDsoI6kKYuT5kVY9Ej1rdZ31z
 7skxZyTGnWDhXRx3ivcTrWcTn9pS4jn15bf5IuuHF7TKOhf7CjaCQAsFLUqgG+OQw3
 TmbB7SYbpCKErLSC8pj0EX7CX9QLnILzsRBE/ohiUJbIFE1IMg/cjGBGPtPajrXG4f
 sNECYsMCQOlfv1P7YiowMjwE7S+4WEgZ3Ta/BBENvi3lzY5/pUGpbmzJcRRt17LLTu
 pvJjE5GpakAoU7lTRzhh1ydC3vC2/ToA4s4IC0aoo60dOSNzUN2jT4plhHgrw2rMwr
 McF7U6Ymc8nDQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6EFBA3781FD5;
 Fri, 15 Dec 2023 21:00:00 +0000 (UTC)
Message-ID: <a9a3a7c5-7ee9-4b28-9abb-f1194054dfef@collabora.com>
Date: Fri, 15 Dec 2023 23:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
 <491f1a89-aabd-4c38-b33a-a298add1bdb3@collabora.com>
In-Reply-To: <491f1a89-aabd-4c38-b33a-a298add1bdb3@collabora.com>
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
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
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

T24gMTIvMTUvMjMgMjI6NTYsIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPiBPbiAxMi8xNS8y
MyAyMjo0NywgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4+IE9uIDE1IERlYyAyMDIzLCBhdCAyMDo0
MCwgQ3Jpc3RpYW4gQ2lvY2FsdGVhIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4g
d3JvdGU6Cj4+Pgo+Pj4gVGhlIFN5bm9wc3lzIERlc2lnbldhcmUgTUFDIGZvdW5kIG9uIFN0YXJG
aXZlIEpINzEwMCBTb0MgaXMgbW9zdGx5Cj4+PiBzaW1pbGFyIHRvIHRoZSBuZXdlciBKSDcxMTAs
IGJ1dCBpdCByZXF1aXJlcyBvbmx5IHR3byBpbnRlcnJ1cHRzIGFuZCBhCj4+PiBzaW5nbGUgcmVz
ZXQgbGluZSwgd2hpY2ggaXMgJ2FoYicgaW5zdGVhZCBvZiB0aGUgY29tbW9ubHkgdXNlZAo+Pj4g
J3N0bW1hY2V0aCcuCj4+Pgo+Pj4gU2luY2UgdGhlIGNvbW1vbiBiaW5kaW5nICdzbnBzLGR3bWFj
JyBhbGxvd3Mgc2VsZWN0aW5nICdhaGInIG9ubHkgaW4KPj4+IGNvbmp1bmN0aW9uIHdpdGggJ3N0
bW1hY2V0aCcsIGV4dGVuZCB0aGUgbG9naWMgdG8gYWxzbyBwZXJtaXQgZXhjbHVzaXZlCj4+PiB1
c2FnZSBvZiB0aGUgJ2FoYicgcmVzZXQgbmFtZS4gIFRoaXMgZW5zdXJlcyB0aGUgZm9sbG93aW5n
IHVzZSBjYXNlcyBhcmUKPj4+IHN1cHBvcnRlZDoKPj4+Cj4+PiAgSkg3MTEwOiByZXNldC1uYW1l
cyA9ICJzdG1tYWNldGgiLCAiYWhiIjsKPj4+ICBKSDcxMDA6IHJlc2V0LW5hbWVzID0gImFoYiI7
Cj4+PiAgb3RoZXI6ICByZXNldC1uYW1lcyA9ICJzdG1tYWNldGgiOwo+Pj4KPj4+IEFsc28gbm90
ZSB0aGUgbmVlZCB0byB1c2UgYSBkaWZmZXJlbnQgZHdtYWMgZmFsbGJhY2ssIGFzIHY1LjIwIGFw
cGxpZXMKPj4+IHRvIEpINzExMCBvbmx5LCB3aGlsZSBKSDcxMDAgcmVsaWVzIG9uIHYzLjd4Lgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENyaXN0aWFuIENpb2NhbHRlYSA8Y3Jpc3RpYW4uY2lvY2Fs
dGVhQGNvbGxhYm9yYS5jb20+Cj4+PiAtLS0KPj4+IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9zbnBzLGR3bWFjLnlhbWwgICB8ICAzICstCj4+PiAuLi4vYmluZGluZ3MvbmV0L3N0YXJmaXZl
LGpoNzExMC1kd21hYy55YW1sICAgfCA3NCArKysrKysrKysrKysrLS0tLS0tCj4+PiAyIGZpbGVz
IGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55
YW1sCj4+PiBpbmRleCA1YzI3NjlkYzY4OWEuLmMxMzgwZmYxYzA1NCAxMDA2NDQKPj4+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMu
eWFtbAo+Pj4gQEAgLTk1LDYgKzk1LDcgQEAgcHJvcGVydGllczoKPj4+ICAgICAgICAgLSBzbnBz
LGR3bWFjLTUuMjAKPj4+ICAgICAgICAgLSBzbnBzLGR3eGdtYWMKPj4+ICAgICAgICAgLSBzbnBz
LGR3eGdtYWMtMi4xMAo+Pj4gKyAgICAgICAgLSBzdGFyZml2ZSxqaDcxMDAtZHdtYWMKPj4+ICAg
ICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtZHdtYWMKPj4+Cj4+PiAgIHJlZzoKPj4+IEBAIC0xNDYs
NyArMTQ3LDcgQEAgcHJvcGVydGllczoKPj4+ICAgcmVzZXQtbmFtZXM6Cj4+PiAgICAgbWluSXRl
bXM6IDEKPj4+ICAgICBpdGVtczoKPj4+IC0gICAgICAtIGNvbnN0OiBzdG1tYWNldGgKPj4+ICsg
ICAgICAtIGVudW06IFtzdG1tYWNldGgsIGFoYl0KPj4+ICAgICAgIC0gY29uc3Q6IGFoYgo+Pgo+
PiBJ4oCZbSBub3Qgc28gd2VsbC12ZXJzZWQgaW4gdGhlIFlBTUwgYmluZGluZ3MsIGJ1dCB3b3Vs
ZCB0aGlzIG5vdCBhbGxvdwo+PiByZXNldC1uYW1lcyA9ICJhaGIiLCAiYWhiIj8KPiAKPiBZZXMs
IGFzIEkgYWxyZWFkeSBwb2ludGVkIG91dCBpbiBbMV0sIEkgd2Fzbid0IGFibGUgdG8gY29tZSB1
cCB3aXRoIGEKPiBwcm9wZXIgc29sdXRpb24gdG8gYXZvaWQgdGhhdC4KClNvcnJ5LCBJJ3ZlIHNl
bnQgdGhlIHByZXZpb3VzIGVtYWlsIHRvbyBlYXJseS4uCgpbMV06IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvNTY0NTAzZGQtYjc3OS00ZTlmLTg1MWQtZjM0ZDllYTVmYTY1QGNvbGxhYm9y
YS5jb20vCgo+IFRoYW5rcywKPiBDcmlzdGlhbgo+IAo+PiBKZXNzCj4+Cj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
