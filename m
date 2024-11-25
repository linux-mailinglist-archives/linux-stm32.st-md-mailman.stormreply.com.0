Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 154CE9D7C2F
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Nov 2024 08:53:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C7D6C78F7F;
	Mon, 25 Nov 2024 07:53:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5A9AC78F7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 07:53:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0pxIm014099;
 Mon, 25 Nov 2024 08:52:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8uBVTRIhltASLptHNO7ciiwgZge8tWTzAnEQix+o5ms=; b=aneOgUSW5PDCg37+
 DG9relJ49AvPvEuOXPn8ES9/OQulIf/AbqSTo4GOLNn3o+370d5JyWNNridoQ3IA
 Eu+PCeRVTkNuzS4+DqGOzvF+70dxS3HibdT75Y7IGfLYKAoRFziUSKwS08bgGZI8
 1fq2Ra9oSfTmZTg7HCxp8L+KsrvhGagmLz1UZvbSpCqOmEaDI0cb5GuNH74arWlP
 +DfFk8coZpGZtXctottRwO9TRJAAiJ/yrNmQW9EFhyXhFJYPMWL0iChZC4rKeDdu
 w6HNpaZp4o8iFUwCJ+j4Mc6Rg8MmQKeGqTSSZR/OoghJxTuytpgk6HcsMzFeKpsA
 KzV+Ig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 433791p7e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2024 08:52:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 305AE4002D;
 Mon, 25 Nov 2024 08:51:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A74C26550D;
 Mon, 25 Nov 2024 08:49:47 +0100 (CET)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 25 Nov
 2024 08:49:46 +0100
Message-ID: <f989e43a-8622-43cb-af6d-fd02b2374ac1@foss.st.com>
Date: Mon, 25 Nov 2024 08:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Ford <aford173@gmail.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
 <CAHCN7xJr-sXPGMr7aPH=-Cg+-YQMYChY0u6UNuH5rH8g6cpXhg@mail.gmail.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <CAHCN7xJr-sXPGMr7aPH=-Cg+-YQMYChY0u6UNuH5rH8g6cpXhg@mail.gmail.com>
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Erling Ljunggren <hljunggr@cisco.com>, linux-media@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v3 0/3] Add WebP support to hantro decoder
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

SGkgQWRhbSwKCk9uIDExLzI0LzI0IDA0OjA5LCBBZGFtIEZvcmQgd3JvdGU6Cj4gT24gVGh1LCBO
b3YgMjEsIDIwMjQgYXQgNzoyMuKAr0FNIEh1Z3VlcyBGcnVjaGV0Cj4gPGh1Z3Vlcy5mcnVjaGV0
QGZvc3Muc3QuY29tPiB3cm90ZToKPj4KPj4gQWRkIFdlYlAgaW1hZ2UgZGVjb2Rpbmcgc3VwcG9y
dCB0byBzdGF0ZWxlc3MgVjRMMiBWUDggZGVjb2Rlci4KPj4KPj4gVGhpcyBoYXZlIGJlZW4gdGVz
dGVkIG9uIFNUTTMyTVAyNTctRVYgYm9hcmQgdXNpbmcgR1N0cmVhbWVyLgo+IAo+IEkgd2FudCB0
byB0ZXN0IHRoaXMgb24gYW4gaS5NWDhNIE1pbmkuICBJcyB0aGVyZSBhIGNlcnRhaW4gZ3N0cmVh
bWVyCj4gdmVyc2lvbiBvciBicmFuY2ggSSBzaG91bGQgdXNlLCBvciBpcyAxLjI0IHN1ZmZpY2ll
bnQ/CgoKVGhlIGNvcnJlc3BvbmRpbmcgR1N0cmVhbWVyIGNvZGUgaGFzIGJlZW4gcHVzaGVkIGhl
cmUgKHY0bDJzbHdlYnBkZWMpOgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVh
bWVyL2dzdHJlYW1lci8tL21lcmdlX3JlcXVlc3RzLzc5MzkKCkJSLApIdWd1ZXMuCgo+IAo+IGFk
YW0KPj4KPj4gU2ltcGxlIGJhc2ljIHRlc3Q6Cj4+ICQ+IHdnZXQgaHR0cHM6Ly93d3cuZ3N0YXRp
Yy5jb20vd2VicC9nYWxsZXJ5LzEud2VicAo+PiAkPiBnc3QtbGF1bmNoLTEuMCBmaWxlc3JjIGxv
Y2F0aW9uPSAxLndlYnAgISB0eXBlZmluZCAhIHY0bDJzbHdlYnBkZWMgISBpbWFnZWZyZWV6ZSBu
dW0tYnVmZmVycz0yMCAhIHdheWxhbmRzaW5rIGZ1bGxzY3JlZW49dHJ1ZQo+Pgo+PiBTbGlkZXNo
b3cgb2YgYSBzZXQgb2YgV2ViUCBwaWN0dXJlcyBhbmQgV2ViTSB2aWRlbyBmaWxlczoKPj4gJD4g
d2dldCBodHRwczovL3d3dy5nc3RhdGljLmNvbS93ZWJwL2dhbGxlcnkvMi53ZWJwCj4+ICQ+IHdn
ZXQgaHR0cHM6Ly93d3cuZ3N0YXRpYy5jb20vd2VicC9nYWxsZXJ5LzMud2VicAo+PiAkPiB3Z2V0
IGh0dHBzOi8vd3d3LmdzdGF0aWMuY29tL3dlYnAvZ2FsbGVyeS80LndlYnAKPj4gJD4gd2dldCBo
dHRwczovL3d3dy5nc3RhdGljLmNvbS93ZWJwL2dhbGxlcnkvNS53ZWJwCj4+ICQ+IHdnZXQgaHR0
cHM6Ly9zYW1wbGVtZWRpYS5saW5hcm8ub3JnL1ZQOC9iaWdfYnVja19idW5ueV80ODBwX1ZQOF9W
T1JCSVNfMjVmcHNfMTkwMEtfc2hvcnQuV2ViTQo+PiAkPiBnc3QtcGxheS0xLjAgKi53ZWJwICou
d2VibSAqLldlYk0gLS13YWl0LW9uLWVvcwo+PiA8aGl0IGtleSAiPiIgdG8gZGlzcGxheSBuZXh0
IGZpbGUgPgo+Pgo+PiBMYXJnZSBXZWJQIGltYWdlID4gMTY3NzcyMTUgKHNpemUgPiAyXjI0KQo+
PiAkPiBnc3QtbGF1bmNoLTEuMCBmYWtlc3JjIG51bS1idWZmZXJzPTEgZm9ybWF0PTQgZG8tdGlt
ZXN0YW1wPXRydWUgZmlsbHR5cGU9MyBzaXpldHlwZT0yIHNpemVtYXg9MjUxNjU4MjQgYmxvY2tz
aXplPTI1MTY1ODI0ICEgdmlkZW8veC1yYXcsIGZvcm1hdD1JNDIwLCB3aWR0aD00MDk2LCBoZWln
aHQ9MzA3MiwgZnJhbWVyYXRlPTEvMSAhIHdlYnBlbmMgcXVhbGl0eT0xMDAgISBmaWxlc2luayBs
b2NhdGlvbj00MDk2eDMwNzJfSFFfcmFuZG9tLndlYnAKPj4gJD4gbHMgLWwgNDA5NngzMDcyX0hR
X3JhbmRvbS53ZWJwCj4+IFsuLi5dIDE2ODc3NDA0IE5vdiAyMCAxMTo0MCA0MDk2eDMwNzJfSFFf
cmFuZG9tLndlYnAKPj4gJD4gZ3N0LWxhdW5jaC0xLjAgZmlsZXNyYyBsb2NhdGlvbj0gNDA5Nngz
MDcyX0hRX3JhbmRvbS53ZWJwIGJsb2Nrc2l6ZT0xNjg3NjYxMCAhIGltYWdlL3dlYnAsIHdpZHRo
PTEsIGhlaWdodD0xLCBmcmFtZXJhdGU9MC8xICEgdjRsMnNsd2VicGRlYyAhIGltYWdlZnJlZXpl
IG51bS1idWZmZXJzPTIwICEgd2F5bGFuZHNpbmsgZnVsbHNjcmVlbj10cnVlCj4+Cj4+IExhcmdl
IFdlYlAgaW1hZ2UgZGVjb2RpbmcgdXNpbmcgcG9zdC1wcm9jZXNzb3IgaXMgdW50ZXN0ZWQgYmVj
YXVzZSBvZiBsYWNrCj4+IG9mIGhhcmR3YXJlIHN1cHBvcnQgb24gdGhpcyBwbGF0Zm9ybSwgbmV2
ZXJ0aGVsZXNzIHN1cHBvcnQgaXMgcHJvdmlkZWQgaW4KPj4gdGhpcyBzZXJpZSBmb3IgZnVydGhl
ciB0ZXN0aW5nIG9uIGFub3RoZXIgcGxhdGZvcm0gaGF2aW5nIHBvc3QtcHJvY2Vzc29yCj4+IHN1
cHBvcnQuCj4+Cj4+ID09PT09PT09PT09Cj4+ID0gaGlzdG9yeSA9Cj4+ID09PT09PT09PT09Cj4+
IHZlcnNpb24gMzoKPj4gICAgIC0gRml4IHJlbWFya3MgZnJvbSBOaWNvbGFzIER1ZnJlc25lOgo+
PiAgICAgIC0gRG9jdW1lbnQgY29uc3RyYWludCBhYm91dCBrZXkgZnJhbWUgb25seSBmb3IgV2Vi
UAo+PiAgICAgIC0gRml4IHJlYmFzZSBpc3N1ZQo+PiAgICAgLSBGaXggdHlwbyBkZXRlY3RlZCBi
eSBEaWVkZXJpayBkZSBIYWFzCj4+Cj4+IHZlcnNpb24gMjoKPj4gICAgIC0gRml4IHJlbWFya3Mg
ZnJvbSBOaWNvbGFzIER1ZnJlc25lOgo+PiAgICAgIC0gVXNlIGJ5dGVzcGVybGluZSBoZWxwZXIg
dG8gY29tcHV0ZSBjaHJvbWEgc2l6ZQo+PiAgICAgIC0gSW50cm9kdWNlIGEgbmV3IGV4cGxpY2l0
IFdFQlAgZnJhbWUgY29tcHJlc3NlZCBmb3JtYXQKPj4gICAgICAgIGluc3RlYWQgb2YgcmVseWlu
ZyBvbiBWUDggKyBXZWJQIGZsYWcKPj4gICAgICAtIDRLIHN1cHBvcnQgaW4gYm90aCBkZWNvZGVy
IGFuZCBwb3N0LXByb2MKPj4KPj4gdmVyc2lvbiAxOgo+PiAgICAtIEluaXRpYWwgc3VibWlzc2lv
bgo+Pgo+PiBIdWd1ZXMgRnJ1Y2hldCAoMyk6Cj4+ICAgIG1lZGlhOiB1YXBpOiBhZGQgV2ViUCB1
QVBJCj4+ICAgIG1lZGlhOiB2ZXJpc2lsaWNvbjogYWRkIFdlYlAgZGVjb2Rpbmcgc3VwcG9ydAo+
PiAgICBtZWRpYTogdmVyaXNpbGljb246IHBvc3Rwcm9jOiA0SyBzdXBwb3J0Cj4+Cj4+ICAgLi4u
L3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2JpYmxpby5yc3QgICAgICAgICAgfCAgOSArKysrKysr
KysKPj4gICAuLi4vbWVkaWEvdjRsL3BpeGZtdC1jb21wcmVzc2VkLnJzdCAgICAgICAgICAgICB8
IDE3ICsrKysrKysrKysrKysrKysrCj4+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2ls
aWNvbi9oYW50cm8uaCAgICAgfCAgMiArKwo+PiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2ls
aWNvbi9oYW50cm9fZzFfcmVncy5oIHwgIDMgKystCj4+ICAgLi4uL3BsYXRmb3JtL3ZlcmlzaWxp
Y29uL2hhbnRyb19nMV92cDhfZGVjLmMgICAgfCAxNCArKysrKysrKysrKysrKwo+PiAgIC4uLi9w
bGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fcG9zdHByb2MuYyAgICAgIHwgIDYgKysrKystCj4+
ICAgLi4uL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb192NGwyLmMgICAgfCAgMiAr
Kwo+PiAgIC4uLi9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9zdG0zMm1wMjVfdnB1X2h3LmMgICAgIHwg
MTcgKysrKysrKysrKysrKysrLS0KPj4gICBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWlv
Y3RsLmMgICAgICAgICAgICB8ICAxICsKPj4gICBpbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYy
LmggICAgICAgICAgICAgICAgICB8ICAxICsKPj4gICAxMCBmaWxlcyBjaGFuZ2VkLCA2OCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiAtLQo+PiAyLjI1LjEKPj4KPj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
