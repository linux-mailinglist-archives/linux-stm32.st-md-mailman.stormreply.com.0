Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E298C68D1
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2024 16:34:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4903C6B47A;
	Wed, 15 May 2024 14:34:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E3C9C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2024 14:34:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FDCINI002240;
 Wed, 15 May 2024 16:34:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Cc9dLBPQalwD3yYbV6gRE0t8fxv3VP5tkr2ZWiaxNkM=; b=xY
 7FT9IPeanKuVSVs53p/7BqUBuE88tXLELA9q5ovw5wMwSKPLhILYBojWtQhyTFxU
 J71H6koXSd5qPQAR+8K/5nzuAkzzI+tWU28ZWkQeoz1Ln5geAmp89oPRBTrrFfYG
 7SFiymlAw+UH2hFqaXce8c4VMb7O4B2fZGprOrwPmpU9fxSIhb1oH65DWpKt3zgL
 YO0Ut0jzMyczhgHF6UlG4VEg0NDD1qFdEyhnBYB/9YxPL49ssqo7j24x5RRSoHsN
 h6Lmf4KjNp3Z3hCryCq85kZFtII5xs86YcDSl+gyrhoIkzXffD+8rVFMr2qEpFry
 cf4qJeHb8tCSr01FKHlw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4sxvhgbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 May 2024 16:34:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E54AF4002D;
 Wed, 15 May 2024 16:34:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA80921F14D;
 Wed, 15 May 2024 16:33:23 +0200 (CEST)
Received: from [10.48.87.205] (10.48.87.205) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 16:33:23 +0200
Message-ID: <0c97408c-422d-46b3-8017-da9ebb0767e1@foss.st.com>
Date: Wed, 15 May 2024 16:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>
References: <20240513095605.218042-1-patrick.delaunay@foss.st.com>
 <20240513115601.v3.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
 <615dfdcb-cbda-426f-895e-810f03a8ce60@denx.de>
 <20240513-stabilize-proofread-81f0f9ee38b9@spud>
 <d73d4435-75d6-4cea-b38e-07c7ceae3980@foss.st.com>
 <20240514-entryway-idealize-fcd5ed0e1de7@spud>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240514-entryway-idealize-fcd5ed0e1de7@spud>
X-Originating-IP: [10.48.87.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_07,2024-05-15_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: regulator: st,
 stm32mp1-pwr-reg: add compatible for STM32MP13
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

SGksCgpPbiA1LzE0LzI0IDIyOjA4LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gTW9uLCBNYXkg
MTMsIDIwMjQgYXQgMDg6MDI6MjFQTSArMDIwMCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4g
SGksCj4+Cj4+IE9uIDUvMTMvMjQgMTc6MTYsIENvbm9yIERvb2xleSB3cm90ZToKPj4+IE9uIE1v
biwgTWF5IDEzLCAyMDI0IGF0IDA0OjM0OjIwUE0gKzAyMDAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+
Pj4+IE9uIDUvMTMvMjQgMTE6NTYgQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+Pj4+IEFk
ZCBuZXcgY29tcGF0aWJsZSAic3Qsc3RtMzJtcDEzLXB3ci1yZWciIGZvciBTVE0zMk1QMTMgU29D
IGZhbWlseS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0
cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+Cj4+Pj4+IENoYW5nZXMg
aW4gdjM6Cj4+Pj4+IC0gUmVwbGFjZSBvbmVPZi9jb25zdCBieSBlbnVtOyBzb2x2ZSB0aGUgVjIg
aXNzdWVzIGZvciBkdF9iaW5kaW5nX2NoZWNrCj4+Pj4+Cj4+Pj4+IENoYW5nZXMgaW4gdjI6Cj4+
Pj4+IC0gdXBkYXRlIGZvciBSb2IgcmV2aWV3LCBvbmx5IGFkZCBjb21wYXRpYmxlIGZvciBTVE0z
Mk1QMTMgZmFtaWx5Cj4+Pj4+Cj4+Pj4+ICAgICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1
bGF0b3Ivc3Qsc3RtMzJtcDEtcHdyLXJlZy55YW1sICAgIHwgNCArKystCj4+Pj4+ICAgICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL3N0
LHN0bTMybXAxLXB3ci1yZWcueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yZWd1bGF0b3Ivc3Qsc3RtMzJtcDEtcHdyLXJlZy55YW1sCj4+Pj4+IGluZGV4IGM5NTg2ZDI3
N2Y0MS4uYzc2NmYwYTE1YTMxIDEwMDY0NAo+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL3N0LHN0bTMybXAxLXB3ci1yZWcueWFtbAo+Pj4+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL3N0LHN0bTMy
bXAxLXB3ci1yZWcueWFtbAo+Pj4+PiBAQCAtMTEsNyArMTEsOSBAQCBtYWludGFpbmVyczoKPj4+
Pj4gICAgIHByb3BlcnRpZXM6Cj4+Pj4+ICAgICAgIGNvbXBhdGlibGU6Cj4+Pj4+IC0gICAgY29u
c3Q6IHN0LHN0bTMybXAxLHB3ci1yZWcKPj4+Pj4gKyAgICBlbnVtOgo+Pj4+PiArICAgICAgLSBz
dCxzdG0zMm1wMSxwd3ItcmVnCj4+Pj4+ICsgICAgICAtIHN0LHN0bTMybXAxMy1wd3ItcmVnCj4+
Pj4gU2hvdWxkIHRoZSBzdCxzdG0zMm1wMSxwd3ItcmVnIGJlIHRyZWF0ZWQgYXMgZmFsbGJhY2sg
Y29tcGF0aWJsZSBmb3IKPj4+PiBzdCxzdG0zMm1wMTMtcHdyLXJlZyBvciBub3QgPwo+Pj4+Cj4+
Pj4gSW4gb3RoZXIgd29yZHMsIHNob3VsZCB0aGUgRFQgY29udGFpbjoKPj4+PiBjb21wYXRpYmxl
ID0gInN0LHN0bTMybXAxMy1wd3ItcmVnIiwgInN0LHN0bTMybXAxLHB3ci1yZWciOwo+Pj4+IG9y
Cj4+Pj4gY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTMtcHdyLXJlZyI7Cj4+Pj4gPyBXaGljaCBv
bmUgaXMgcHJlZmVyYWJsZSA/Cj4+Pj4KPj4+PiBJIHRoaW5rIHRoZSBmb3JtZXIgb25lLCBzaW5j
ZSB0aGUgTVAxMyBQV1IgYmxvY2sgY291bGQgYWxzbyBiZSBvcGVyYXRlZCBieQo+Pj4+IG9sZGVy
IE1QMSg1KSBQV1IgYmxvY2sgZHJpdmVyKHMpIHdpdGhvdXQgYW55IGFkdmVyc2UgZWZmZWN0cywg
ZXhjZXB0IHRoZSBTRAo+Pj4+IElPIGRvbWFpbiBjb25maWd1cmF0aW9uIHdvbid0IGJlIGF2YWls
YWJsZSwgcmlnaHQgPwo+Pj4gQXllLCB0aGUgZmFsbGJhY2sgc291bmRzIGxpa2Ugd2hhdCBzaG91
bGQgYmUgYmVpbmcgdXNlZCBoZXJlLCBlc3BlY2lhbGx5Cj4+PiBpZiBhbm90aGVyIHVzZXIgb2Yg
dGhlIERUIG1pZ2h0IG5vdCBuZWVkIHRvIGltcGxlbWVudCB0aGUgZXh0cmEgZG9tYWluLgo+Pgo+
PiBZZXMgaXQgaXMgdGhlIHRoZSBvbmx5IGRpZmZlcmVuY2UgYnV0IEkgdGhpbmsgdGhhdCB0eXBl
IG9mIGZhbGxiYWNrIGlzIG5vCj4+IG1vcmUgcmVjb21tZW5kZWQgZm9yIGRpZmZlcmVudCBkZXZp
Y2UgYW5kCj4+Cj4+IHRoZSBQV1IgZGV2aWNlIG9uIFNUTTMyTVAxMyBhbmQgb24gU1RNMzJNUDE1
IGFyZSBkaWZmZXJlbnQuCj4+Cj4+Cj4+IFRoZSBvdGhlciB1c2VyIG9mIHRoZSBub24tc2VjdXJl
IGRldmljZSB0cmVlIGRvbid0IHVzZSB0aGUgeWV0IHRoZSBQV1IKPj4gZHJpdmVyIGZvciBTVE0z
Mk1QMTMsCj4+Cj4+IHNvIGZvciBtZSB0aGUgZmFsbGJhY2sgaXMgbm90IG5lZWRlZCBmb3Igbm9u
IHNlY3VyZSB3b3JsZCAoTGludXgvVS1Cb290KS4KPj4KPj4KPj4gU28gSSBwcmVmZXIgdG8gaW50
cm9kdWNlIGEgbmV3IGNvbXBhdGlibGUgaW4gTGludXgga2VybmVsIGJlZm9yZSB0aGUKPj4gU1RN
MzJNUDEzIFBXUiBub2RlIGlzIHJlYWxseSB1c2VkwqAgdG8gYXZvaWQgQUJJIGJyZWFrIGluIGZ1
dHVyLgo+IEhvdyBpcyBpdCBnb2luZyB0byBicmVhayBhbiBBQkk/IElmIHRoZSBtcDEzIGltcGxl
bWVudHMgYSBmdW5jdGlvbmFsCj4gc3Vic2V0IG9mIHdoYXQgdGhlIG1wMSBkb2VzLCB0aGVuIHRo
YXQncyB3aGF0IGZhbGxiYWNrIGNvbXBhdGlibGVzCj4gYXJlIGludGVuZGVkIGZvci4gTWFyZWsn
cyBtYWlsIHN1Z2dlc3RzIHRoYXQgdGhpcyBpcyB0aGUgY2FzZSwgYW5kCj4gdGhlcmVmb3JlIGEg
ZmFsbGJhY2sgc2hvdWxkIGJlIHVzZWQuCj4KPiBJZiBjb2RlIHdyaXR0ZW4gZm9yIHRoZSBtcDEg
d291bGQgbm90IHdvcmsgb24gdGhlIG1wMTMsIHRoZW4gYSBmYWxsYmFjawo+IHNob3VsZCBub3Qg
YmUgdXNlZC4KPgo+IE5laXRoZXIgSSBub3IgTWFyZWsgYXJlIHNheWluZyB0aGF0IGEgbmV3IGNv
bXBhdGlibGUgc2hvdWxkIG5vdCBiZQo+IGNyZWF0ZWQsIGluIGNhc2UgeW91IG1pc3VuZGVyc3Rv
b2QgdGhhdC4gVGhpcyBvbmx5IGFmZmVjdHMgdGhlIGJpbmRpbmcKPiBwYXRjaCwgYW5kIHlvdXIg
ZHJpdmVyIGV0YyBhcmUgZnJlZSB0byB1c2UgdGhlIG1wMTMgY29tcGF0aWJsZS4KPgo+IFRoYW5r
cywKPiBDb25vci4KCgpUaGUgSVAgUFdSIGNoYW5nZSB3aXRoIFNUTTMyTVAxMyBhbmQgaXQgaXMg
bm90IGp1c3QgYSBzdWJzZXQKCmJ1dCBmb3IgdGhlIHJhbmdlIHVzZWQgYnkgdGhlIGNvbXBhdGli
bGUgPDB4NTAwMDEwMDAgMHgxMD4KCkkgYWdyZWVkIHRoYXQgZmVhdHVyZSBhcmUganVzdCBhZGRl
ZC4KCgpPdGhlciBmZWF0dXJlIGFyZSBhbHNvIHJlbW92ZWQgYnV0IGZvciBuZXh0IHJlZ2lzdGVy
cyAodGhlIGFzc29jaWF0ZWQKCnJlZ2lzdGVycyBvciBiaXRzIGJlY29tZXMgcmVzZXJ2ZWQsIGZv
ciBQV1JfTUNVQ1IgZm9yIGV4YW1wbGUpLgoKClNvIEkgY2FuIGNoYW5nZSBpbiBiaW5kaW5nIHRv
IHN1cHBvcnQgdGhlIERUOgoKCmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEscHdyLXJlZyI7Cgpv
ciBmb3IgU1RNMzJNUDEzOgoKY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTMtcHdyLXJlZyIsICJz
dCxzdG0zMm1wMSxwd3ItcmVnIjsKCndpdGgKCiDCoCBjb21wYXRpYmxlOgogwqDCoMKgIG9uZU9m
OgogwqDCoMKgwqDCoMKgwqAgLSBpdGVtczoKIMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6
IHN0LHN0bTMybXAxLHB3ci1yZWcKIMKgwqDCoMKgwqDCoMKgIC0gaXRlbXM6CiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBzdCxzdG0zMm1wMTMtcHdyLXJlZwogwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBjb25zdDogc3Qsc3RtMzJtcDEscHdyLXJlZwoKCkJ1dCBmb3IgbWUgdGhpcyBmYWxs
YmFjayBpbiBkZXZpY2UgdHJlZSBpcyBhIGxpdHRsZSBjb25mdXNpbmcgZm9yIFBXUi4KCgpQYXRy
aWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
