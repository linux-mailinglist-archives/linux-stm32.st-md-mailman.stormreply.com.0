Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 818BD9563BA
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 08:25:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39704C6DD9D;
	Mon, 19 Aug 2024 06:25:55 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF1DEC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 06:25:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38F04CE09B5;
 Mon, 19 Aug 2024 06:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C416CC32782;
 Mon, 19 Aug 2024 06:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724048744;
 bh=F7G3lRtoD78NW9jgt9aEBt8Q2gtPODxY3cSswVIb2jA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uWUVPa/cIERAOpCuOrR3y7yg8dQPk4yYm10ri0DXrpugWAuhwURvH1OzemS4+VKkn
 hV8m10VxXrVT+fFjYn4Uz2wKPFLQHtW0W0LX51KHlI4odmmOA/r4eQkMPMcbNNfDx0
 JoZa0jGbdy5RpaF9bT5TufEt9dyi1+VrGuOTZhc5x7jkBR3I+0VDOlJT9dkWc2g+mX
 3ufv0QhkIlx/ePoEph55PSt0/uW/86fdZ7awOC5oU/8p+ZQzzYd2C1nLkPpc9lK3m4
 X+EmW3sh8SaRpTROtoG9sbm/sekssBO4UHuYiYBtl/dfhImNQKmQ//o9R1l/Sj8ZS1
 vqt4x89SDdDzA==
Message-ID: <9d9704ed-6ef8-4920-9874-29e0a815e2ba@kernel.org>
Date: Mon, 19 Aug 2024 08:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: JieGan <quic_jiegan@quicinc.com>, Rob Herring <robh@kernel.org>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <20240818142834.GA27754-robh@kernel.org>
 <ZsKkm/Pz0GYtH2Gl@jiegan-gv.ap.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZsKkm/Pz0GYtH2Gl@jiegan-gv.ap.qualcomm.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Song Chai <quic_songchai@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/5] dt-bindings: arm: Add Coresight
 TMC Control Unit hardware
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

T24gMTkvMDgvMjAyNCAwMzo0OSwgSmllR2FuIHdyb3RlOgo+IE9uIFN1biwgQXVnIDE4LCAyMDI0
IGF0IDA4OjI4OjM0QU0gLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBPbiBNb24sIEF1ZyAx
MiwgMjAyNCBhdCAxMDo0MTozOUFNICswODAwLCBKaWUgR2FuIHdyb3RlOgo+Pj4gQWRkIGJpbmRp
bmcgZmlsZSB0byBzcGVjaWZ5IGhvdyB0byBkZWZpbmUgYSBDb3Jlc2lnaHQgVE1DCj4+PiBDb250
cm9sIFVuaXQgZGV2aWNlIGluIGRldmljZSB0cmVlLgo+Pj4KPj4+IEl0IGlzIHJlc3BvbnNpYmxl
IGZvciBjb250cm9sbGluZyB0aGUgZGF0YSBmaWx0ZXIgZnVuY3Rpb24KPj4+IGJhc2VkIG9uIHRo
ZSBzb3VyY2UgZGV2aWNlJ3MgVHJhY2UgSUQgZm9yIFRNQyBFVFIgZGV2aWNlLgo+Pj4gVGhlIHRy
YWNlIGRhdGEgd2l0aCB0aGF0IFRyYWNlIGlkIGNhbiBnZXQgaW50byBFVFIncyBidWZmZXIKPj4+
IHdoaWxlIG90aGVyIHRyYWNlIGRhdGEgZ2V0cyBpZ25vcmVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IEppZSBHYW4gPHF1aWNfamllZ2FuQHF1aWNpbmMuY29tPgo+Pj4gLS0tCj4+PiAgLi4uL2Jp
bmRpbmdzL2FybS9xY29tLGNvcmVzaWdodC1jdGN1LnlhbWwgICAgIHwgNzkgKysrKysrKysrKysr
KysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspCj4+PiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbSxj
b3Jlc2lnaHQtY3RjdS55YW1sCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbSxjb3Jlc2lnaHQtY3RjdS55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLGNvcmVzaWdodC1jdGN1LnlhbWwKPj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjdhOTU4MDAwNzk0
Mgo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9xY29tLGNvcmVzaWdodC1jdGN1LnlhbWwKPj4+IEBAIC0wLDAgKzEsNzkgQEAK
Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkKPj4+ICslWUFNTCAxLjIKPj4+ICstLS0KPj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL2FybS9xY29tLGNvcmVzaWdodC1jdGN1LnlhbWwjCj4+PiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+PiArCj4+PiAr
dGl0bGU6IENvcmVTaWdodCBUTUMgQ29udHJvbCBVbml0Cj4+PiArCj4+PiArbWFpbnRhaW5lcnM6
Cj4+PiArICAtIFl1YW5mYW5nIFpoYW5nIDxxdWljX3l1YW5mYW5nQHF1aWNpbmMuY29tPgo+Pj4g
KyAgLSBNYW8gSmlubG9uZyA8cXVpY19qaW5sbWFvQHF1aWNpbmMuY29tPgo+Pj4gKyAgLSBKaWUg
R2FuIDxxdWljX2ppZWdhbkBxdWljaW5jLmNvbT4KPj4+ICsKPj4+ICtkZXNjcmlwdGlvbjoKPj4+
ICsgIFRoZSBDb3Jlc2lnaHQgVE1DIENvbnRyb2wgdW5pdCBjb250cm9scyB2YXJpb3VzIENvcmVz
aWdodCBiZWhhdmlvcnMuCj4+PiArICBJdCB3b3JrcyBhcyBhIGhlbHBlciBkZXZpY2Ugd2hlbiBj
b25uZWN0ZWQgdG8gVE1DIEVUUiBkZXZpY2UuCj4+PiArICBJdCBpcyByZXNwb25zaWJsZSBmb3Ig
Y29udHJvbGxpbmcgdGhlIGRhdGEgZmlsdGVyIGZ1bmN0aW9uIGJhc2VkIG9uCj4+PiArICB0aGUg
c291cmNlIGRldmljZSdzIFRyYWNlIElEIGZvciBUTUMgRVRSIGRldmljZS4gVGhlIHRyYWNlIGRh
dGEgd2l0aAo+Pj4gKyAgdGhhdCBUcmFjZSBpZCBjYW4gZ2V0IGludG8gRVRSJ3MgYnVmZmVyIHdo
aWxlIG90aGVyIHRyYWNlIGRhdGEgZ2V0cwo+Pj4gKyAgaWdub3JlZC4KPj4KPj4gTm93aGVyZSBp
cyBUTUMgZGVmaW5lZC4KPiBUaGUgQ29yZXNpZ2h0IFRNQyBjb250cm9sIHVuaXQoQ1RDVSkgY29u
bmVjdGVkIHRvIENvcmVzaWdodCBUTUMgZGV2aWNlIHZpYSByZXBsaWNhdG9yIGFuZAo+IHdvcmtz
IGFzIGEgaGVscGVyIGRldmljZSB0byBUTUMgZGV2aWNlLgoKRGlkIHlvdSB1bmRlcnN0YW5kIHRo
ZSBmZWVkYmFjayBvciBqdXN0IHJlc3BvbmRpbmcgd2l0aCB3aGF0ZXZlciB0byBnZXQKcmlkIG9m
IHJldmlld2Vycz8KCj4gCj4gVGhlIGluLXBvcnRzIGxpc3RlZCBiZWxvdyBpbGx1c3RyYXRlIHRo
ZWlyIGNvbm5lY3Rpb24gdG8gVE1DIGRldmljZXMuCj4gCj4+Cj4+PiArCj4+PiArcHJvcGVydGll
czoKPj4+ICsgIGNvbXBhdGlibGU6Cj4+PiArICAgIGVudW06Cj4+PiArICAgICAgLSBxY29tLHNh
ODc3NXAtY3RjdQo+Pj4gKwo+Pj4gKyAgcmVnOgo+Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4gKwo+
Pj4gKyAgY2xvY2tzOgo+Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4gKwo+Pj4gKyAgY2xvY2stbmFt
ZXM6Cj4+PiArICAgIGl0ZW1zOgo+Pj4gKyAgICAgIC0gY29uc3Q6IGFwYgo+Pj4gKwo+Pj4gKyAg
aW4tcG9ydHM6Cj4+Cj4+IFVzZSAncG9ydHMnIHVubGVzcyB5b3UgaGF2ZSBib3RoIGluIGFuZCBv
dXQgcG9ydHMuCj4gVGhlIOKAmGluLXBvcnRz4oCZIGFuZCDigJhvdXQtcG9ydHPigJkgcHJvcGVy
dGllcyB3aWxsIGJlIHBhcnNlZCBieSDigJhvZl9jb3Jlc2lnaHRfZ2V0X3BvcnRfcGFyZW504oCZ
Cj4gYW5kIHRoZWlyIHJlbGF0aW9uc2hpcHMgdG8gb3RoZXIgZGV2aWNlcyB3aWxsIGJlIHN0b3Jl
ZCBpbiB0aGUgY29yZXNpZ2h0X3BsYXRmb3JtX2RhdGEgc3RydWN0dXJlLgo+IAo+IGZvciBleGFt
cGxlOgo+IHN0cnVjdCBjb3Jlc2lnaHRfcGxhdGZvcm1fZGF0YSB7Cj4gCWludCBucl9pbmNvbm5z
Owo+IAlpbnQgbnJfb3V0Y29ubnM7Cj4gCXN0cnVjdCBjb3Jlc2lnaHRfY29ubmVjdGlvbiAqKm91
dF9jb25uczsKPiAJc3RydWN0IGNvcmVzaWdodF9jb25uZWN0aW9uICoqaW5fY29ubnM7Cj4gfTsK
PiAKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMS1yYzQvc291cmNlL2Ry
aXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtcGxhdGZvcm0uYyNMMTQ3CgphbmQ/
IElmIHlvdSByZXNwb25kIHdpdGggc29tZSB1bnJlbGF0ZWQgYXJndW1lbnQsIHdlIHdpbGwgcmVz
cG9uZCB3aXRoCnRoZSBzYW1lOiBVc2UgJ3BvcnRzJyB1bmxlc3MgeW91IGhhdmUgYm90aCBpbiBh
bmQgb3V0IHBvcnRzLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
