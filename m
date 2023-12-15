Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 693F981516E
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 21:57:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D012C6DD6D;
	Fri, 15 Dec 2023 20:57:00 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6B33C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 20:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702673818;
 bh=llzOJtxbkH31ZdRai4uKosxuCv2h8SX3YoPj7mI7JtY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=4kW0X2uhqogD19NjUBIqkwvrcTnDHeRo2eT4VKcg8nrVYlMVtXeQFz7QLnJS6fNRc
 jG+6SL6EOqe5B7tG+vwIz9WiEA7wm2g31zNmD+ff3WO45KF5qH4W6KTyZBRvC/qq5O
 NGqHr5yZ/jJ0Rphill5GVsz8ve5swsoJW7OuZfDdZBa+eakXmSqzndVYYWaywPO5mj
 O4vRCR4Vf/PID9hCg+euDIPFeoZVPEYOkKTpLBjt7acfgpA80jLC3r4ZBvs9XlTb4z
 AJkLkF6qJuaoWZy3TMFftwDoV/T3QWuOGLGAQsw3EIgZl9wxPJGMIBGUJRtmhjq+93
 Z8ropt8cC3HHQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4261B3781FD5;
 Fri, 15 Dec 2023 20:56:56 +0000 (UTC)
Message-ID: <491f1a89-aabd-4c38-b33a-a298add1bdb3@collabora.com>
Date: Fri, 15 Dec 2023 22:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
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

T24gMTIvMTUvMjMgMjI6NDcsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgo+IE9uIDE1IERlYyAyMDIz
LCBhdCAyMDo0MCwgQ3Jpc3RpYW4gQ2lvY2FsdGVhIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFi
b3JhLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1BQyBmb3VuZCBv
biBTdGFyRml2ZSBKSDcxMDAgU29DIGlzIG1vc3RseQo+PiBzaW1pbGFyIHRvIHRoZSBuZXdlciBK
SDcxMTAsIGJ1dCBpdCByZXF1aXJlcyBvbmx5IHR3byBpbnRlcnJ1cHRzIGFuZCBhCj4+IHNpbmds
ZSByZXNldCBsaW5lLCB3aGljaCBpcyAnYWhiJyBpbnN0ZWFkIG9mIHRoZSBjb21tb25seSB1c2Vk
Cj4+ICdzdG1tYWNldGgnLgo+Pgo+PiBTaW5jZSB0aGUgY29tbW9uIGJpbmRpbmcgJ3NucHMsZHdt
YWMnIGFsbG93cyBzZWxlY3RpbmcgJ2FoYicgb25seSBpbgo+PiBjb25qdW5jdGlvbiB3aXRoICdz
dG1tYWNldGgnLCBleHRlbmQgdGhlIGxvZ2ljIHRvIGFsc28gcGVybWl0IGV4Y2x1c2l2ZQo+PiB1
c2FnZSBvZiB0aGUgJ2FoYicgcmVzZXQgbmFtZS4gIFRoaXMgZW5zdXJlcyB0aGUgZm9sbG93aW5n
IHVzZSBjYXNlcyBhcmUKPj4gc3VwcG9ydGVkOgo+Pgo+PiAgSkg3MTEwOiByZXNldC1uYW1lcyA9
ICJzdG1tYWNldGgiLCAiYWhiIjsKPj4gIEpINzEwMDogcmVzZXQtbmFtZXMgPSAiYWhiIjsKPj4g
IG90aGVyOiAgcmVzZXQtbmFtZXMgPSAic3RtbWFjZXRoIjsKPj4KPj4gQWxzbyBub3RlIHRoZSBu
ZWVkIHRvIHVzZSBhIGRpZmZlcmVudCBkd21hYyBmYWxsYmFjaywgYXMgdjUuMjAgYXBwbGllcwo+
PiB0byBKSDcxMTAgb25seSwgd2hpbGUgSkg3MTAwIHJlbGllcyBvbiB2My43eC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogQ3Jpc3RpYW4gQ2lvY2FsdGVhIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFi
b3JhLmNvbT4KPj4gLS0tCj4+IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFj
LnlhbWwgICB8ICAzICstCj4+IC4uLi9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFj
LnlhbWwgICB8IDc0ICsrKysrKysrKysrKystLS0tLS0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA1NSBp
bnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPj4gaW5kZXggNWMy
NzY5ZGM2ODlhLi5jMTM4MGZmMWMwNTQgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4+IEBAIC05NSw2ICs5
NSw3IEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgICAgLSBzbnBzLGR3bWFjLTUuMjAKPj4gICAgICAg
ICAtIHNucHMsZHd4Z21hYwo+PiAgICAgICAgIC0gc25wcyxkd3hnbWFjLTIuMTAKPj4gKyAgICAg
ICAgLSBzdGFyZml2ZSxqaDcxMDAtZHdtYWMKPj4gICAgICAgICAtIHN0YXJmaXZlLGpoNzExMC1k
d21hYwo+Pgo+PiAgIHJlZzoKPj4gQEAgLTE0Niw3ICsxNDcsNyBAQCBwcm9wZXJ0aWVzOgo+PiAg
IHJlc2V0LW5hbWVzOgo+PiAgICAgbWluSXRlbXM6IDEKPj4gICAgIGl0ZW1zOgo+PiAtICAgICAg
LSBjb25zdDogc3RtbWFjZXRoCj4+ICsgICAgICAtIGVudW06IFtzdG1tYWNldGgsIGFoYl0KPj4g
ICAgICAgLSBjb25zdDogYWhiCj4gCj4gSeKAmW0gbm90IHNvIHdlbGwtdmVyc2VkIGluIHRoZSBZ
QU1MIGJpbmRpbmdzLCBidXQgd291bGQgdGhpcyBub3QgYWxsb3cKPiByZXNldC1uYW1lcyA9ICJh
aGIiLCAiYWhiIj8KClllcywgYXMgSSBhbHJlYWR5IHBvaW50ZWQgb3V0IGluIFsxXSwgSSB3YXNu
J3QgYWJsZSB0byBjb21lIHVwIHdpdGggYQpwcm9wZXIgc29sdXRpb24gdG8gYXZvaWQgdGhhdC4K
ClRoYW5rcywKQ3Jpc3RpYW4KCj4gSmVzcwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
