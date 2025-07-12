Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB46B02AD0
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Jul 2025 14:35:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B962C36B3D;
	Sat, 12 Jul 2025 12:35:48 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B2D7C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Jul 2025 12:35:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA10CA54B59;
 Sat, 12 Jul 2025 12:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB56C4CEEF;
 Sat, 12 Jul 2025 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752323744;
 bh=lXFoGeveBkgpPfzpXT/Ao/zuuvCsduR2W62DWuGCibk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=HkcU4nEmSaxfhj0q87QWOddf180UgwMkXuU/IH0d8XZQNbecFYpReNPy5z5vlMlXO
 S8adonG+rrJhDcf9Ouo8igpbrKJlRVDoaMAx2Yy6h0PcpQXIsXJ1iY62zYXO28Q3Om
 8qmnCNPXNp878uWScf8TTPeJwsyuWWhWlQ5M9GIxquvF/DUXwrPbtD795THy1Nmpi+
 OHsEsgBnMIci0YYE80HCWVjFPhrjh20ax0U2WtpVn1f9qIah9ejcIFjP+3aMpUBT9E
 6becPzLvmKfK1wxKF1Sr1UJJYDS4Ln/ig2CsEOiaTy+V9CzpOWG8B4fuBFG36ILrX7
 DaWAgtKXG4lvA==
Message-ID: <b6897cec-eb02-451c-8b81-013a8166e2be@kernel.org>
Date: Sat, 12 Jul 2025 07:35:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250707154409.15527-1-matthew.gerlach@altera.com>
 <b752c340-bbb5-479f-bc2c-a9e8541509c3@kernel.org>
 <c048d76e-8187-440f-9f28-b6594810d5dd@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <c048d76e-8187-440f-9f28-b6594810d5dd@altera.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: altr,
 socfpga-stmmac.yaml: add minItems to iommus
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

T24gNy85LzI1IDE3OjIzLCBNYXR0aGV3IEdlcmxhY2ggd3JvdGU6Cj4gCj4gCj4gT24gNy84LzI1
IDExOjU0IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBPbiAwNy8wNy8yMDI1IDE3
OjQ0LCBNYXR0aGV3IEdlcmxhY2ggd3JvdGU6Cj4+ID4gQWRkIG1pc3NpbmcgJ21pbkl0ZW1zOiAx
JyB0byBpb21tdXMgcHJvcGVydHkgb2YgdGhlIEFsdGVyYSBTT0NGUEdBIFNvQwo+PiA+IGltcGxl
bWVudGF0aW9uIG9mIHRoZSBTeW5vcHN5cyBEV01BQy4KPj4KPj4gV2h5PyBFeHBsYWluIHdoeSB5
b3UgYXJlIGRvaW5nIHRoaW5nLCBub3Qgd2hhdCB5b3UgYXJlIGRvaW5nLiBXaGF0IGlzCj4+IG9i
dmlvdXMgd2hpY2ggbWFrZXMgZW50aXJlIHR3by1saW5lIGNvbW1pdCBtc2cgcmVkdW5kYW50IGFu
ZCB1c2VsZXNzLgo+IFRoaXMgY29udmVyc2lvbiB0byB5YW1sIHdhcyBhIG1lcmdlIG9mIHR3byBz
ZXBhcmF0ZSBjb252ZXJzaW9ucyBmcm9tIAo+IERpbmcgTmd1eWVuIGFuZCBteXNlbGYgcGx1cyBz
b21lIHJlc29sdmVkIGlzc3VlcyBoaWdobGlnaHRlZCBieSBSb2IgCj4gSGVycmluZywgYnV0IEkg
bWlzc2VkIHRoZSBtaW5JdGVtczoKPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjUwNjI2MjM0ODE2LkdCMTM5ODQyOC1yb2JoQGtlcm5lbC5vcmcvCj4gCj4+Cj4+IE9yaWdpbmFs
IGJpbmRpbmcgaGFkIG5vIGlvbW11cyBhbmQgcmVmZXJlbmNlZCBjb21taXQgZG9lcyBub3QgZXhw
bGFpbgo+PiB3aHkgdGhleSBhcHBlYXJlZCBkdXJpbmcgY29udmVyc2lvbiBpbiB0aGUgZmlyc3Qg
cGxhY2UuCj4gVGhlIHRleHQgdmVyc2lvbiBvZiB0aGUgYmluZGluZyB3YXMgY3JlYXRlZCBiZWZv
cmUgdGhlIGRldmljZSB0cmVlcyBmb3IgCj4gdGhlIEFnaWxleCBmYW1pbHksIHdoaWNoIGRvIHN1
cHBvcnQgaW9tbXVzLCB3ZXJlIGFjY2VwdGVkIGludG8gdGhlIGtlcm5lbC4KPj4KPj4gPiA+IEZp
eGVzOiA2ZDM1OWNmNDY0ZjQgKCJkdC1iaW5kaW5nczogbmV0OiBDb252ZXJ0IHNvY2ZwZ2EtZHdt
YWMgCj4+IGJpbmRpbmdzIHRvIHlhbWwiKQo+PiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgR2Vy
bGFjaCA8bWF0dGhldy5nZXJsYWNoQGFsdGVyYS5jb20+Cj4+ID4gLS0tCj4+ID7CoCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FsdHIsc29jZnBnYS1zdG1tYWMueWFtbCB8
IDEgKwo+PiA+wqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+ID4gPiBkaWZmIC0t
Z2l0IAo+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYWx0cixzb2Nm
cGdhLXN0bW1hYy55YW1sIAo+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvYWx0cixzb2NmcGdhLXN0bW1hYy55YW1sCj4+ID4gaW5kZXggYzVkOGRmZTViODAxLi5lYzM0
ZGFmZjJhYTAgMTAwNjQ0Cj4+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9hbHRyLHNvY2ZwZ2Etc3RtbWFjLnlhbWwKPj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FsdHIsc29jZnBnYS1zdG1tYWMueWFtbAo+PiA+IEBA
IC01OSw2ICs1OSw3IEBAIHByb3BlcnRpZXM6Cj4+ID7CoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBw
dHBfcmVmCj4+ID4gPsKgwqDCoCBpb21tdXM6Cj4+ID4gK8KgwqDCoCBtaW5JdGVtczogMQo+PiA+
wqDCoMKgwqDCoCBtYXhJdGVtczogMgo+Pgo+PiBXaHkgdGhpcyBoYXMgdG8gYmUgZmxleGlibGUg
b24gZ2l2ZW4gU29DPyBUaGlzIGlzIHdlaXJkLiBTYW1lIGhhcmR3YXJlCj4+IGRpZmZlcnMgc29t
ZWhvdz8KPiBEaW5oIGNhbiB5b3UgY29tbWVudCBvbiB0aGlzIGJpbmRpbmcgZnJvbSAKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MjQxOTE1NDkuNDc0Njg2LTEtZGluZ3V5ZW5A
a2VybmVsLm9yZy8/Cj4gCgpUaGlzIG1pZ2h0IGhhdmUgYmVlbiBhIGNvcHkvcGFzdGUgZXJyb3Iu
CgpESW5oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
