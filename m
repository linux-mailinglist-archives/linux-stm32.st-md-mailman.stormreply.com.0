Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2552062183D
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Nov 2022 16:28:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBB59C6504B;
	Tue,  8 Nov 2022 15:28:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05E9EC65041
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Nov 2022 15:28:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D8AE184F72;
 Tue,  8 Nov 2022 16:28:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667921334;
 bh=ynxbc+MKCLeWwRbrLNxyC55qaclB4jtg/aYQ5o2Qus0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Vj5vX/8z6GAYG4Gbp9pE6bV2u66FuorO5FcT4mzj/Y+t6tVekBYjMjMlEpnypjGi0
 hQTkJCcz+q6IWhDARns9vzfBSrZCsbrvyzPzyjC1gNKvms3/yaVldzCFhCptVlCWOD
 Fa/1M//h1HT6/pFzgEZRynlSV8EiDnH67mXd0j7NYyO/SYyGvG34wSLHeNzwnlaJPm
 3KssiGAfo3W2XeL4dMV93PMD50h6wEwzIzlDzR2jk33Sbmz4QnRrV1E3GlHzxPJhfy
 qdQCJV/8GbCRjZcheSTR74okbWjEv6dKZPD/2F+yLOf8KGKZVt0fnsOaCSGANPX86f
 cjgcqZmRJa4lA==
Message-ID: <230c26ea-f7c5-2688-16fd-e4a91f421833@denx.de>
Date: Tue, 8 Nov 2022 16:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Erwan LE RAY <erwan.leray@foss.st.com>
References: <20220203171114.10888-1-erwan.leray@foss.st.com>
 <cc7633c5-de5f-0abf-4ac8-64a74633dfcc@pengutronix.de>
 <f5aec360-c33c-0145-6596-541003e305b2@foss.st.com>
 <98823363-710c-6286-8e63-ba8e5dcadeba@foss.st.com>
 <20221108115916.hlmbvyrnmkxymeed@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221108115916.hlmbvyrnmkxymeed@pengutronix.de>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Amelie DELAUNAY <amelie.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/16] STM32 configure UART nodes for DMA
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

T24gMTEvOC8yMiAxMjo1OSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gRnJpLCBGZWIg
MDQsIDIwMjIgYXQgMDQ6NDE6NTVQTSArMDEwMCwgRXJ3YW4gTEUgUkFZIHdyb3RlOgo+PiBPbiAy
LzQvMjIgMjoyMiBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4+IEhpIEFobWFkCj4+Pgo+
Pj4gT24gMi8zLzIyIDE4OjI1LCBBaG1hZCBGYXRvdW0gd3JvdGU6Cj4+Pj4gSGVsbG8gRXJ3YW4s
Cj4+Pj4KPj4+PiBPbiAwMy4wMi4yMiAxODoxMCwgRXJ3YW4gTGUgUmF5IHdyb3RlOgo+Pj4+PiBB
ZGQgRE1BIGNvbmZpZ3VyYXRpb24gdG8gVUFSVCBub2RlcyBpbiBzdG0zMm1wMTV4IChTT0MgbGV2
ZWwpIGFuZAo+Pj4+PiByZW1vdmUgaXQgYXQgYm9hcmQgbGV2ZWwgdG8ga2VlcCBjdXJyZW50IFBJ
TyBiZWhhdmlvciB3aGVuIG5lZWRlZC4KPj4+Pj4gRm9yIHN0bTMyLWVkMSBhbmQgc3RtMzItZGt4
IGJvYXJkcywgVUFSVDQgKGNvbnNvbGUpIGFuZCBVQVJUNwo+Pj4+PiAobm8gSFcgZmxvdyBjb250
cm9sIHBpbiBhdmFpbGFibGUpIGFyZSBrZXB0IGluIFBJTyBtb2RlLCB3aGlsZSBVU0FSVDMKPj4+
Pj4gaXMgbm93IGNvbmZpZ3VyZWQgaW4gRE1BIG1vZGUuCj4+Pj4+IFVBUlQ0IChjb25zb2xlIFVB
UlQpIGhhcyB0byBiZSBrZXB0IGluIGlycSBtb2RlLCBhcyBETUEgc3VwcG9ydCBmb3IKPj4+Pj4g
Y29uc29sZSBoYXMgYmVlbiByZW1vdmVkIGZyb20gdGhlIGRyaXZlciBieSBjb21taXQgZTM1OWI0
NDExYzI4Cj4+Pj4+ICgic2VyaWFsOiBzdG0zMjogZml4IHRocmVhZGVkIGludGVycnVwdCBoYW5k
bGluZyIpLgo+Pj4+Cj4+Pj4gRG8gSSB1bmRlcnN0YW5kIGNvcnJlY3RseSB0aGF0IHlvdXIgZmly
c3QgcGF0Y2ggYnJlYWtzIGNvbnNvbGVzIG9mCj4+Pj4gbW9zdC9hbGwgYm9hcmRzLCBiZWNhdXNl
IHRoZXkgd2lsbCBicmllZmx5IHVzZSBETUEsIHdoaWNoIGlzIHJlZnVzZWQKPj4+PiBieSB0aGUg
c3RtMzItdXNhcnQgZHJpdmVyIGFuZCB0aGVuIHlvdSBhZGQgYSBwYXRjaCBmb3IgZWFjaCBib2Fy
ZAo+Pj4+IHRvIGZpeCB0aGF0IGJyZWFrYWdlPwo+Pj4KPj4+IFdlIGhhdmUgdHdvIHNvbHV0aW9u
cyBhbmQgYm90aCBoYXZlIHByby9kcmF3YmFja3MuIFRoZSBmaXJzdCBvbmUgKEVyd2FuCj4+PiBv
bmVzLCBjYW4gYnJlYWsgdGhlIGJvb3QgaWYgdGhlIHBhdGNoIGlzIHRha2VuICJhbG9uZSIuIFlv
dXIgcHJvcG9zaXRpb24KPj4+IGF2b2lkcyB0aGlzIGJyZWFrYWdlIGJ1dCBkZWxldGVzIGEgbm9u
IGRlZmluZSBwcm9wZXJ0eSAod2hpY2ggaXMgYSBiaXQKPj4+IHdlaXJkKS4gSG93ZXZlciBJIHBy
ZWZlciB0byBrZWVwIGEgZnVuY3Rpb25hbCBiZWhhdmlvciwgYW5kIGtlZXAgQWhtYWQKPj4+IHBy
b3Bvc2l0aW9uLiBBaG1hZCwganVzdCBvbmUgcXVlc3Rpb24sIGR0LWJpbmRpbmdzIGNoZWNrIGRv
ZXNuJ3QKPj4+IGNvbXBsYWluIGFib3V0IGl0ID8KPj4+Cj4+PiBDaGVlcnMKPj4+IEFsZXgKPj4+
Cj4+Pj4KPj4+PiBTdWNoIGludGVybWl0dGVudCBicmVha2FnZSBtYWtlcyBiaXNlY3Rpb24gYSBo
YXNzbGUuIC9kZWxldGUtcHJvcGVydHkvCj4+Pj4gaXMgYSBuby1vcCB3aGVuIHRoZSBwcm9wZXJ0
eSBkb2Vzbid0IGV4aXN0LCBzbyB5b3UgY291bGQgbW92ZSB0aGUgZmlyc3QKPj4+PiBwYXRjaCB0
byB0aGUgdmVyeSBlbmQgdG8gYXZvaWQgaW50ZXJtaXR0ZW50IGJyZWFrYWdlLgo+Pj4+Cj4+Pj4g
SSBhbHNvIHRoaW5rIHRoYXQgdGhlIGRyaXZlcidzIGJlaGF2aW9yIGlzIGEgYml0IGhhcnNoLiBJ
IHRoaW5rIGl0IHdvdWxkCj4+Pj4gYmUgYmV0dGVyIGZvciB0aGUgVUFSVCBkcml2ZXIgdG8gcHJp
bnQgYSB3YXJuaW5nIGFuZCBmYWxsIGJhY2sgdG8KPj4+PiBQSU8gZm9yIGNvbnNvbGUgaW5zdGVh
ZCBvZiBvdXRyaWdodCByZWZ1c2luZyBhbmQgcmVuZGVyaW5nIHRoZSBzeXN0ZW0KPj4+PiBzaWxl
bnQuIFRoYXQncyBub3QgbXV0dWFsbHkgZXhjbHVzaXZlIHdpdGggeW91ciBwYXRjaCBzZXJpZXMg
aGVyZSwKPj4+PiBvZiBjb3Vyc2UuCj4+Pj4KPj4+PiBDaGVlcnMsCj4+Pj4gQWhtYWQKPj4+Pgo+
Pgo+PiBUaGUgZHJpdmVyIGltcGxlbWVudGF0aW9uIHdpbGwgY29uc2lkZXIgdGhlIHJlcXVlc3Qg
dG8gcHJvYmUgdGhlIFVBUlQKPj4gY29uc29sZSBpbiBETUEgbW9kZSBhcyBhbiBlcnJvciAoLUVO
T0RFViksIGFuZCB3aWxsIGZhbGxiYWNrIHRoaXMgVUFSVCBwcm9iZQo+PiBpbiBpcnEgbW9kZS4K
PiAKPj4gV2hhdGV2ZXIgdGhlIHBhdGNoIG9yZGVyaW5nLCB0aGUgYm9vdCB3aWxsIG5ldmVyIGJl
IGJyb2tlbi4gVGhlIGJvYXJkIGR0Cj4+IHBhdGNoZXMgYWltIHRvIGdldCBhICJwcm9wZXIiIGlt
cGxlbWVudGF0aW9uLCBidXQgZnJvbSBmdW5jdGlvbmFsCj4+IHBlcnNwZWN0aXZlIHRoZSBkcml2
ZXIgd2lsbCBtYW5hZ2UgYSByZXF1ZXN0IHRvIHByb2JlIGFuIFVBUlQgY29uc29sZSBpbiBETUEK
Pj4gbW9kZSBhcyBhbiBlcnJvciBhbmQgZmFsbCBpdCBiYWNrIGluIGlycSBtb2RlLgo+IAo+IEkg
ZGlkbid0IGRlYnVnIHRoaXMgZnVydGhlciB5ZXQsIGJ1dCBteSBtYWNoaW5lICh3aXRoIGFuIG91
dC1vZi10cmVlCj4gZHRzKSBmYWlscyB0byBib290IDYuMS1yYzQgd2l0aG91dCByZW1vdmluZyB0
aGUgZG1hIHByb3BlcnRpZXMgZnJvbSB0aGUKPiBjb25zb2xlIFVBUlQuIFRoaXMgaXMgYSBidWcg
aXNuJ3QgaXQ/IFRoZSBzYW1lIGR0cyBjcmVhdGVkIGEgd29ya2luZwo+IHNldHVwIHdpdGggc3Rt
MzJtcDE1Ny5kdHNpIGZyb20gNS4xNSArIGtlcm5lbCA1LjE1Lgo+IAo+IEkgY2FuIGRlYnVnIHRo
aXMgZnVydGhlciwgYnV0IG1heWJlIHlvdSBrbm93IG9mZi1oYW5kIHdoYXQgdGhlIHByb2JsZW0K
PiBpcz8KCitDQyBBbWVsaWUsIGFzIHRoaXMgbWlnaHQgYmUgcmVsYXRlZCB0byB0aGUgRE1BIHNl
cmllcyB0aGF0IGxhbmRlZCByZWNlbnRseToKCiQgZ2l0IGxvZyAtLW9uZWxpbmUgdjUuMTguLnY2
LjAgLS0gZHJpdmVycy9kbWEvc3RtMzIqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
