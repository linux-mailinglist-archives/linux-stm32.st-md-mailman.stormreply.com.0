Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F33A91AC34
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 18:05:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB2C2C78012;
	Thu, 27 Jun 2024 16:05:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88536C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 16:05:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 04A0A87D1A;
 Thu, 27 Jun 2024 18:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719504307;
 bh=1u9Inh2kN+quodN02T07jrr+3Ha30I2d5OAEnpc8VWQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iIXggi/XS5YolYFm5Z839qtktsKq5+rVa92/S3OlUW8RBG2NRF6EuxfrNvsw3xk4L
 F/D+smq90BqTQlqas+REsoIx+m5VH+6im0LoZGnMVBQCNVnAI2PaybC6cg2nk3XITP
 m6b0gzTORJa7OI15FSTO51zMKsFDiaAnYkWfRd0GyjK5Pk+/jda3xmBdY7ZQlWcfRN
 AUBwBWhv31oH3PIkbz5o/nP7AKPZSHzqfrsi15HkV/Y3iBHoQs0pTMRmABR525Aws4
 +D0y1m3MTfuc0U9tg2FKmb1m88aJxKaUaCQ0FtHs/iY1o5LKSuaJByeVsVPb9eiQFU
 uLKm6RvILsUkg==
Message-ID: <05062715-8ba9-4bfd-bc07-8f5ddc708555@denx.de>
Date: Thu, 27 Jun 2024 17:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240623194954.79988-1-marex@denx.de>
 <0ab8fe8a-2017-432f-80fc-5c2c381d1fd0@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0ab8fe8a-2017-432f-80fc-5c2c381d1fd0@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate rproc mboxes
	and IRQs
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

T24gNi8yNy8yNCAxMjo0OCBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBNYXJlawoK
SGksCgo+IE9uIDYvMjMvMjQgMjE6NDksIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBQdWxsIG1ib3hl
cywgbWJveC1uYW1lcywgaW50ZXJydXB0LXBhcmVudCwgaW50ZXJydXB0cyBwcm9wZXJ0aWVzIG9m
IHRoZQo+PiBtNF9ycHJvYyBpbnRvIHN0bTMybXAxNTEuZHRzaSB0byBkZWR1cGxpY2F0ZSBtdWx0
aXBsZSBjb3BpZXMgb2YgdGhlIHNhbWUKPj4gaW4gbXVsdGlwbGUgYm9hcmQgZmlsZXMuIFdvcnNl
LCB0aG9zZSBjb3BpZXMgd2VyZSBzdGFydGluZyB0byBnZXQgb3V0IG9mCj4+IHN5bmMsIHNvIHRo
aXMgc2hvdWxkIHByZXZlbnQgYW55IHN1Y2ggaXNzdWVzIGluIHRoZSBmdXR1cmUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiAtLS0KPj4gQ2M6IEFs
ZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+IENjOiBDb25v
ciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Cj4+IENjOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+Cj4+IENjOiBNYXhpbWUgQ29xdWVs
aW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+IENjOiBSaWNoYXJkIENvY2hyYW4gPHJp
Y2hhcmRjb2NocmFuQGdtYWlsLmNvbT4KPj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+Cj4+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+PiBDYzoga2VybmVsQGRo
LWVsZWN0cm9uaWNzLmNvbQo+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IC0t
LQo+PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2nCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArKysrCj4+IMKgIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdhLWljb3JlLXN0bTMybXAxLmR0c2nCoMKgwqDCoMKgwqDC
oCB8IDIgLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2EtbWljcm9nZWEt
c3RtMzJtcDEuZHRzacKgwqDCoMKgIHwgMiAtLQo+PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTU3Yy1lZDEuZHRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCA0IC0tLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtZW1zdGFtcC1h
cmdvbi5kdHNpwqDCoMKgwqDCoMKgwqDCoCB8IDQgLS0tLQo+PiDCoCBhcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0
IC0tLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtcGh5Y29yZS1zdG0z
Mm1wMTUtc29tLmR0c2kgfCA0IC0tLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJt
cDE1eHgtZGhjb20tc29tLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0IC0tLS0KPj4g
wqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtZGhjb3Itc29tLmR0c2nCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCA0IC0tLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJtcDE1eHgtZGt4LmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0
IC0tLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtb3NkMzIuZHRzacKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCAtLS0tCj4+IMKgIDExIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCj4+Cj4gLi4uCj4gCj4gSXQg
aXMgYW4gb2xkIHN0b3J5IHdlIGFscmVhZHkgZGlzY3Vzc2VkIGluIHRoZSBwYXN0Ogo+IAo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvODFmNDU3NGQtMzhjMi0yMWYy
LWI5NDctZDEzZTVmYzk5YzYwQGRlbnguZGUvVC8jbWVmM2E0MDUwYWI0ZmYxODE0MTZmZTU2ODFm
MWQ1Y2I5ZmI3NDQ1NzMKPiAKPiBNeSBwb3NpdGlvbiByZW1haW5zIHRoZSBzYW1lLiBUaG9zZSBp
bnRlcnJ1cHRzIGRlcGVuZHMgb24geW91ciAKPiBzeXN0ZW0vZmlybXdhcmUgeW91IHBsYW4gdG8g
dXNlLiBTbyB3ZSBnaXZlIG9uZSBleGFtcGxlIGluIG91ciBTVCBib2FyZCAKPiB3aGljaCByZWxp
ZXMgb24gZmlybXdhcmUgd2UgbG9hZCBpbiBPcGVuU1RMaW51eC4gQnV0IGl0IGlzIGp1c3QgYW4g
Cj4gZXhhbXBsZS4gRm9yIGV4YW1wbGUgZGVwZW5kaW5nIHRoZSBmaXJtd2FyZSB1c2VkLCB0aGUg
ZGV0YWNoIGNvdWxkIGJlIAo+IHVzZWQgb3Igbm90Lgo+IAo+IFNvIEkgd291bGQgcHJlZmVyIHRv
IG5vdCB0YWtlIGl0LgoKVWdoLCBJIGhhZCBpdCBpbiBteSB1cHN0cmVhbWluZyB0cmVlIHNvIEkg
cmVzdWJtaXR0ZWQgaXQsIGxlbW1lIGRyb3AgaXQuCgpUaGFua3MgZm9yIHRoZSByZW1pbmRlciBh
bmQgY29uc3RhbnQgdmlnaWxhbmNlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
