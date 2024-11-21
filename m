Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C020E9D4A5F
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2024 11:02:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68FDDC7A82A;
	Thu, 21 Nov 2024 10:02:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 222FFC78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2024 10:02:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL42NIT028349;
 Thu, 21 Nov 2024 11:02:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tMHARmkV5I92PboMXt6Pp6b96tFSvjo8btyHafNWUhQ=; b=Jg62VrgcSnv4qCny
 oQebn5uJV1AxeI36qhwi5I6pL937pOlrroCBrUdkVaFo5w4HbaeD53p76/IUApwf
 qM6Dr0CsmJ4wyjefnDlakjfTE/rStJZ4UYBXr8h4EbzbRpqU9YEkTkKHUbA3iV0a
 wqOnQzXDQCQ1xD4KYWkTo4MmkKTCWtTtfhK0HX+OyKZIVZbOYQ7xl7hPuQDFvvd5
 6fl5r6lyn002AmIX/6mLf3c6pvdiXCJFtZKCaXAmtZee+bdbeIXpMUmWZfgzPb+j
 y2VfK3yMbl1Way/ApSItKtVtJoi4YYSUqOcWd2T3ll3nm0JHvsOQwvAkb8qLByIx
 n2W2mw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqf5t69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 11:02:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 41F8F40044;
 Thu, 21 Nov 2024 11:00:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 112F225E1E1;
 Thu, 21 Nov 2024 10:59:54 +0100 (CET)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 10:59:53 +0100
Message-ID: <752c2573-97bc-4b5a-87d1-ca52b854a48d@foss.st.com>
Date: Thu, 21 Nov 2024 10:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Fritz Koenig <frkoenig@chromium.org>, Sebastian
 Fricke <sebastian.fricke@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
 <20241120110105.244413-2-hugues.fruchet@foss.st.com>
 <19cf9e45e00ccf68f35339d8d694e026ffa48037.camel@collabora.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <19cf9e45e00ccf68f35339d8d694e026ffa48037.camel@collabora.com>
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Subject: Re: [Linux-stm32] [PATCH v2 1/3] media: uapi: add WebP uAPI
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

SGkgTmljb2xhcywKCnRoYW5rcyBmb3IgcmV2aWV3LAoKT24gMTEvMjAvMjQgMTU6MjEsIE5pY29s
YXMgRHVmcmVzbmUgd3JvdGU6Cj4gSGkgSHVnaGUsCj4gCj4gdGhhbmtzIGZvciB0aGUgdXBkYXRl
Lgo+IAo+IExlIG1lcmNyZWRpIDIwIG5vdmVtYnJlIDIwMjQgw6AgMTI6MDEgKzAxMDAsIEh1Z3Vl
cyBGcnVjaGV0IGEgw6ljcml0wqA6Cj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgV2ViUCBwaWN0dXJl
IGRlY29kaW5nIGtlcm5lbCB1QVBJLgo+Pgo+PiBUaGlzIGRlc2lnbiBpcyBiYXNlZCBvbiBjdXJy
ZW50bHkgYXZhaWxhYmxlIFZQOCBBUEkgaW1wbGVtZW50YXRpb24gYW5kCj4+IGFpbXMgdG8gc3Vw
cG9ydCB0aGUgZGV2ZWxvcG1lbnQgb2YgV2ViUCBzdGF0ZWxlc3MgdmlkZW8gY29kZWNzCj4+IG9u
IExpbnV4Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIdWd1ZXMgRnJ1Y2hldCA8aHVndWVzLmZydWNo
ZXRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgIERvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9t
ZWRpYS92NGwvYmlibGlvLnJzdCAgfCAgOSArKysrKysrKysKPj4gICAuLi4vdXNlcnNwYWNlLWFw
aS9tZWRpYS92NGwvcGl4Zm10LWNvbXByZXNzZWQucnN0IHwgMTUgKysrKysrKysrKysrKysrCj4+
ICAgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jICAgICAgICAgICAgICB8ICAx
ICsKPj4gICBpbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggICAgICAgICAgICAgICAgICAg
IHwgIDEgKwo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9iaWJsaW8ucnN0
IGIvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9iaWJsaW8ucnN0Cj4+IGlu
ZGV4IDM1Njc0ZWVhZTIwZC4uZGYzZTk2M2ZjNTRmIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0
aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2JpYmxpby5yc3QKPj4gKysrIGIvRG9jdW1lbnRh
dGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9iaWJsaW8ucnN0Cj4+IEBAIC00NDcsMyArNDQ3
LDEyIEBAIEFWMQo+PiAgIDp0aXRsZTogICAgIEFWMSBCaXRzdHJlYW0gJiBEZWNvZGluZyBQcm9j
ZXNzIFNwZWNpZmljYXRpb24KPj4gICAKPj4gICA6YXV0aG9yOiAgICBQZXRlciBkZSBSaXZheiwg
QXJnb24gRGVzaWduIEx0ZCwgSmFjayBIYXVnaHRvbiwgQXJnb24gRGVzaWduIEx0ZAo+PiArCj4+
ICsuLiBfd2VicDoKPj4gKwo+PiArV0VCUAo+PiArPT09PQo+PiArCj4+ICs6dGl0bGU6ICAgICBX
RUJQIHBpY3R1cmUgQml0c3RyZWFtICYgRGVjb2RpbmcgUHJvY2VzcyBTcGVjaWZpY2F0aW9uCj4+
ICsKPj4gKzphdXRob3I6ICAgIEdvb2dsZSAoaHR0cHM6Ly9kZXZlbG9wZXJzLmdvb2dsZS5jb20v
c3BlZWQvd2VicCkKPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9t
ZWRpYS92NGwvcGl4Zm10LWNvbXByZXNzZWQucnN0IGIvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2Ut
YXBpL21lZGlhL3Y0bC9waXhmbXQtY29tcHJlc3NlZC5yc3QKPj4gaW5kZXggODA2ZWQ3M2FjNDc0
Li5lNjY0ZTcwYjA2MTkgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFw
aS9tZWRpYS92NGwvcGl4Zm10LWNvbXByZXNzZWQucnN0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
dXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LWNvbXByZXNzZWQucnN0Cj4+IEBAIC0xNjks
NiArMTY5LDIxIEBAIENvbXByZXNzZWQgRm9ybWF0cwo+PiAgIAl0aGlzIHBpeGVsIGZvcm1hdC4g
VGhlIG91dHB1dCBidWZmZXIgbXVzdCBjb250YWluIHRoZSBhcHByb3ByaWF0ZSBudW1iZXIKPj4g
ICAJb2YgbWFjcm9ibG9ja3MgdG8gZGVjb2RlIGEgZnVsbCBjb3JyZXNwb25kaW5nIGZyYW1lIHRv
IHRoZSBtYXRjaGluZwo+PiAgIAljYXB0dXJlIGJ1ZmZlci4KPj4gKyAgICAqIC4uIF9WNEwyLVBJ
WC1GTVQtV0VCUC1GUkFNRToKPj4gKwo+PiArICAgICAgLSBgYFY0TDJfUElYX0ZNVF9XRUJQX0ZS
QU1FYGAKPj4gKyAgICAgIC0gJ1dFQlAnCj4+ICsgICAgICAtIFdFQlAgVlA4IHBhcnNlZCBmcmFt
ZSwgZXhjbHVkaW5nIFdFQlAgUklGRiBoZWFkZXIsIGtlZXBpbmcgb25seSB0aGUgVlA4Cj4+ICsJ
YmlzdHJlYW0gaW5jbHVkaW5nIHRoZSBmcmFtZSBoZWFkZXIsIGFzIGV4dHJhY3RlZCBmcm9tIHRo
ZSBjb250YWluZXIuCj4+ICsJVGhpcyBmb3JtYXQgaXMgYWRhcHRlZCBmb3Igc3RhdGVsZXNzIHZp
ZGVvIGRlY29kZXJzIHRoYXQgaW1wbGVtZW50IGEKPj4gKwlXRUJQIHBpcGVsaW5lIHdpdGggdGhl
IDpyZWY6YHN0YXRlbGVzc19kZWNvZGVyYC4KPj4gKwlNZXRhZGF0YSBhc3NvY2lhdGVkIHdpdGgg
dGhlIGZyYW1lIHRvIGRlY29kZSBpcyByZXF1aXJlZCB0byBiZSBwYXNzZWQKPj4gKwl0aHJvdWdo
IHRoZSBgYFY0TDJfQ0lEX1NUQVRFTEVTU19WUDhfRlJBTUVgYCBjb250cm9sLgo+PiArCVNlZSB0
aGUgOnJlZjpgYXNzb2NpYXRlZCBDb2RlYyBDb250cm9sIElEcyA8djRsMi1jb2RlYy1zdGF0ZWxl
c3MtdnA4PmAuCj4+ICsJRXhhY3RseSBvbmUgb3V0cHV0IGFuZCBvbmUgY2FwdHVyZSBidWZmZXIg
bXVzdCBiZSBwcm92aWRlZCBmb3IgdXNlIHdpdGgKPj4gKwl0aGlzIHBpeGVsIGZvcm1hdC4gVGhl
IG91dHB1dCBidWZmZXIgbXVzdCBjb250YWluIHRoZSBhcHByb3ByaWF0ZSBudW1iZXIKPj4gKwlv
ZiBtYWNyb2Jsb2NrcyB0byBkZWNvZGUgYSBmdWxsIGNvcnJlc3BvbmRpbmcgZnJhbWUgdG8gdGhl
IG1hdGNoaW5nCj4+ICsJY2FwdHVyZSBidWZmZXIuCj4gCj4gSSB3b25kZXIgaWYgd2Ugc2hvdWxk
IGRvY3VtZW50IHRoZSBjb25zdHJhaW50cywgSSB0aGluawo+IFY0TDJfVlA4X0ZSQU1FX0ZMQUdf
S0VZX0ZSQU1FIG11c3QgYmUgc2V0LCB3aGljaCBpbXBseSB0aGF0IGxhc3QvZ29sZGVuL2FsdAo+
IHRpbWVzdGFtcCBhcmUgaWdub3JlZC4KCkkgd2lsbCBhZGQgc29tZXRoaW5nIGFib3V0IHRoYXQu
Cgo+IAo+IFdpdGggdGhhdCBjbGFyaWZpZWQ6Cj4gCj4gUmV2aWV3ZWQtYnk6IE5pY29sYXMgRHVm
cmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4KPiAKPj4KPj4gICAKPj4gICAg
ICAgKiAuLiBfVjRMMi1QSVgtRk1ULVZQOToKPj4gICAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0
bDItaW9jdGwuYwo+PiBpbmRleCAwMzA0ZGFhODQ3MWQuLmUyZmYwM2QwZDc3MyAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jCj4+ICsrKyBiL2RyaXZl
cnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYwo+PiBAQCAtMTUwMSw2ICsxNTAxLDcgQEAg
c3RhdGljIHZvaWQgdjRsX2ZpbGxfZm10ZGVzYyhzdHJ1Y3QgdjRsMl9mbXRkZXNjICpmbXQpCj4+
ICAgCQljYXNlIFY0TDJfUElYX0ZNVF9WQzFfQU5ORVhfTDoJZGVzY3IgPSAiVkMtMSAoU01QVEUg
NDEyTSBBbm5leCBMKSI7IGJyZWFrOwo+PiAgIAkJY2FzZSBWNEwyX1BJWF9GTVRfVlA4OgkJZGVz
Y3IgPSAiVlA4IjsgYnJlYWs7Cj4+ICAgCQljYXNlIFY0TDJfUElYX0ZNVF9WUDhfRlJBTUU6ICAg
IGRlc2NyID0gIlZQOCBGcmFtZSI7IGJyZWFrOwo+PiArCQljYXNlIFY0TDJfUElYX0ZNVF9XRUJQ
X0ZSQU1FOiAgICBkZXNjciA9ICJXRUJQIFZQOCBGcmFtZSI7IGJyZWFrOwo+PiAgIAkJY2FzZSBW
NEwyX1BJWF9GTVRfVlA5OgkJZGVzY3IgPSAiVlA5IjsgYnJlYWs7Cj4+ICAgCQljYXNlIFY0TDJf
UElYX0ZNVF9WUDlfRlJBTUU6ICAgIGRlc2NyID0gIlZQOSBGcmFtZSI7IGJyZWFrOwo+PiAgIAkJ
Y2FzZSBWNEwyX1BJWF9GTVRfSEVWQzoJCWRlc2NyID0gIkhFVkMiOyBicmVhazsgLyogYWthIEgu
MjY1ICovCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggYi9p
bmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgKPj4gaW5kZXggZTdjNGRjZTM5MDA3Li4wOWZm
ZjI2OWU4NTIgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaAo+
PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgKPj4gQEAgLTc1Nyw2ICs3NTcs
NyBAQCBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0IHsKPj4gICAjZGVmaW5lIFY0TDJfUElYX0ZNVF9W
QzFfQU5ORVhfTCB2NGwyX2ZvdXJjYygnVicsICdDJywgJzEnLCAnTCcpIC8qIFNNUFRFIDQyMU0g
QW5uZXggTCBjb21wbGlhbnQgc3RyZWFtICovCj4+ICAgI2RlZmluZSBWNEwyX1BJWF9GTVRfVlA4
ICAgICAgdjRsMl9mb3VyY2MoJ1YnLCAnUCcsICc4JywgJzAnKSAvKiBWUDggKi8KPj4gICAjZGVm
aW5lIFY0TDJfUElYX0ZNVF9WUDhfRlJBTUUgdjRsMl9mb3VyY2MoJ1YnLCAnUCcsICc4JywgJ0Yn
KSAvKiBWUDggcGFyc2VkIGZyYW1lICovCj4+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9XRUJQX0ZS
QU1FIHY0bDJfZm91cmNjKCdXJywgJ0InLCAnUCcsICdGJykgLyogV0VCUCBWUDggcGFyc2VkIGZy
YW1lICovCj4+ICAgI2RlZmluZSBWNEwyX1BJWF9GTVRfVlA5ICAgICAgdjRsMl9mb3VyY2MoJ1Yn
LCAnUCcsICc5JywgJzAnKSAvKiBWUDkgKi8KPj4gICAjZGVmaW5lIFY0TDJfUElYX0ZNVF9WUDlf
RlJBTUUgdjRsMl9mb3VyY2MoJ1YnLCAnUCcsICc5JywgJ0YnKSAvKiBWUDkgcGFyc2VkIGZyYW1l
ICovCj4+ICAgI2RlZmluZSBWNEwyX1BJWF9GTVRfSEVWQyAgICAgdjRsMl9mb3VyY2MoJ0gnLCAn
RScsICdWJywgJ0MnKSAvKiBIRVZDIGFrYSBILjI2NSAqLwo+IAoKQlIsCkh1Z3Vlcy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
