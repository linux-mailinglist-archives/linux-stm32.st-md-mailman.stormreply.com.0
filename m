Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5285828313
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 10:25:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 738C5C6B476;
	Tue,  9 Jan 2024 09:25:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5FB9C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 09:25:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 409343xj004773; Tue, 9 Jan 2024 10:24:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=PffPX8XtKNmALdkQMwhnZW6kAZxJu3D/e4DIkZpdRa8=; b=HE
 oFePXh9x/Is1DayLz5t6fFdexw5taCHMsc66nTDH5QCGhikN2ugKcFwl2BCRLRqp
 EzaFzJifLh5CNOMsQ8ESIO7KzhyUJsr157FTFZvxJoOTSiSm3E9WTOyRumsF8uPm
 FoZV9rpbrV1XwmKjfFmHp+KQy4NOdHdnyoM0/h3QXeSyKC3vJnlZai23pvV8qts4
 14wY0ZxtYMjBDx6+i28GprV8OjWTAV0ESA2ixrr2qY0bhTwyvad2wwi2HIJ2zRYi
 3IDtNYO88G48cz4C8TK184BSXXIvSPwx13OLSPt0SNrAex3VhN2wVSZ4c3LLzQSD
 UqWOqSzR8oMHSJd8EUWg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vey30jx0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 10:24:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3262810002A;
 Tue,  9 Jan 2024 10:24:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 11AB12122E9;
 Tue,  9 Jan 2024 10:24:45 +0100 (CET)
Received: from [10.201.20.120] (10.201.20.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 9 Jan
 2024 10:24:43 +0100
Message-ID: <1c76d85c-6f20-4971-a6df-61e4c534b351@foss.st.com>
Date: Tue, 9 Jan 2024 10:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Bee <knaerzche@gmail.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>
References: <20231221084723.2152034-1-hugues.fruchet@foss.st.com>
 <769a1510-f8d2-4095-9879-42f413141dee@gmail.com>
 <a240d2ac-db0e-481b-8d13-3ae76cfd2fe7@foss.st.com>
 <e5ba1e14-4bbf-43e3-933a-fee6d4b90641@gmail.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <e5ba1e14-4bbf-43e3-933a-fee6d4b90641@gmail.com>
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v5 0/5] Add support for video hardware
 codec of STMicroelectronics STM32 SoC series
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

SGkgQWxleCwKCnY2IHNlbnQgd2l0aCBhbGwgdGhlIHZhcmlhbnRzIGluIGEgc2luZ2xlIGZpbGUu
CgpCZXN0IHJlZ2FyZHMsCkh1Z3Vlcy4KCk9uIDEyLzIxLzIzIDE0OjMxLCBBbGV4IEJlZSB3cm90
ZToKPiBIaSBIdWd1ZXMsCj4gCj4gQW0gMjEuMTIuMjMgdW0gMTQ6MDggc2NocmllYiBIdWd1ZXMg
RlJVQ0hFVDoKPj4gSGkgQWxleCwKPj4KPj4gVGhpcyBpcyBiZWNhdXNlIFZERUMgYW5kIFZFTkMg
YXJlIHR3byBzZXBhcmF0ZWQgSVBzIHdpdGggdGhlaXIgb3duIAo+PiBoYXJkd2FyZSByZXNvdXJj
ZXMgYW5kIG5vIGxpbmtzIGJldHdlZW4gYm90aC4KPj4gT24gZnV0dXJlIFNvQ3MsIFZERUMgY2Fu
IHNoaXAgb24gaXRzIG93biwgc2FtZSBmb3IgVkVOQy4KPj4KPiBJIHRoaW5rIHRoYXQncyB3aGF0
IHRoZSBkcml2ZXIgaXMvd2FzIGRlc2lnbmVkIGZvciA6KQo+IAo+IEkgZG9uJ3TCoCB0aGluayB0
aGVyZSBfaGFzXyB0byBiZSBhIGxpbmsgYmV0d2VlbiB2YXJpYW50cyBpbiB0aGUgc2FtZSBmaWxl
Lgo+IEZvciBSb2NrY2hpcCB3ZSBvbmx5IGhhZCB0aGUgaXNzdWUgdGhhdCB0aGVyZSBfaXNfIGEg
bGluayAoc2hhcmVkCj4gcmVzb3VyY2VzKSBiZXR3ZWVuIGVuY29kZXIgYW5kIGRlY29kZXIgYW5k
IHRoZXkgaGFkIChmb3IgdGhhdCByZWFzb24pIHRvIGJlCj4gZGVmaW5lZCBoYXMgYSBfc2luZ2xl
XyB2YXJpYW50LiBBbmQgdGhlcmUgaXMgbm8gcmVhc29uIHlvdSBjYW4gc2hpcCBkZWNvZGVyCj4g
YW5kIGVuY29kZXIgc2VwZXJhdGVkIHdoZW4geW91IGhhdmUgdHdvIHZhcmlhbnRzICh3aXRoIGRp
ZmZlcmVudAo+IGNvbXBhdGlibGVzKS4KPiBGb3IgUm9ja2NoaXAgYW5kIGlNWCB0aG9zZSBmaWxl
cyBhcmUgZXZlbiBjb250YWluaW5nIHZhcmlhbnRzIGZvciBjb21wbGV0bHkKPiBkaWZmZXJlbnQg
Z2VuZXJhdGlvbnMgLyBkaWZmZXJlbnQgU29Dcy4gSSBoYWQgdG8gY2xlYW51cCB0aGlzIG1lc3Mg
Zm9yCj4gUm9ja2NoaXAgb25jZSAtIGFuZCBpdCB3YXMgbm8gZnVuIDopIEFueXdheXM6IEl0J3Mg
dXAgdG8gdGhlIG1haW50YWluZXJzIEkKPiBndWVzcyAtIEkganVzdCB3YW50ZWQgdG8gYXNrIGlm
IEkgbWlzc3VuZGVyc3RhbmQgc29tZXRoaW5nIGhlcmUuCj4gCj4gR3JlZXRpbmdzLAo+IAo+IEFs
ZXgKPiAKPj4gSG9waW5nIHRoYXQgdGhpcyBjbGFyaWZ5Lgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+
IEh1Z3Vlcy4KPj4KPj4gT24gMTIvMjEvMjMgMTM6NDAsIEFsZXggQmVlIHdyb3RlOgo+Pj4gSGkg
SHVndWVzLCBIaSBOaWNvbGFzLAo+Pj4KPj4+IGlzIHRoZXJlIGFueSBzcGVjaWZpYyByZWFzb24g
SSdtIG5vdCB1bmRlcnN0YW5kaW5nIC8gc2VlaW5nIHdoeSB0aGlzIAo+Pj4gaXMgYWRkZWQgaW4g
dHdvIHNlcGVyYXRlIHZkZWMqIC8gdmVuYyogZmlsZXMgYW5kIG5vdCBhIHNpbmdsZSB2cHUqIAo+
Pj4gZmlsZT8gSXMgaXQgb25seSBmb3IgdGhlIHNlcGVyYXRlIGNsb2NrcyAoLW5hbWVzKSAvIGly
cXMgKC1uYW1lcykgLyAKPj4+IGNhbGxiYWNrcz8gVGhvc2UgYXJlIGRlZmluZWQgcGVyIHZhcmlh
bnQgYW5kIHBlcmZlY3RseSBmaXQgaW4gYSAKPj4+IHNpbmdsZSBmaWxlIGhvbGRpbmcgb25lIHZk
ZWMgYW5kIG9uZSB2ZW5jIHZhcmlhbnQuCj4+Pgo+Pj4gQWxleAo+Pj4KPj4+IEFtIDIxLjEyLjIz
IHVtIDA5OjQ3IHNjaHJpZWIgSHVndWVzIEZydWNoZXQ6Cj4+Pj4gVGhpcyBwYXRjaHNldCBpbnRy
b2R1Y2VzIHN1cHBvcnQgZm9yIFZERUMgdmlkZW8gaGFyZHdhcmUgZGVjb2Rlcgo+Pj4+IGFuZCBW
RU5DIHZpZGVvIGhhcmR3YXJlIGVuY29kZXIgb2YgU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyTVAy
NQo+Pj4+IFNvQyBzZXJpZXMuCj4+Pj4KPj4+PiBUaGlzIGluaXRpYWwgc3VwcG9ydCBpbXBsZW1l
bnRzIEgyNjQgZGVjb2RpbmcsIFZQOCBkZWNvZGluZyBhbmQKPj4+PiBKUEVHIGVuY29kaW5nLgo+
Pj4+Cj4+Pj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgb24gU1RNMzJNUDI1N0YtRVYxIGV2YWx1YXRp
b24gYm9hcmQuCj4+Pj4KPj4+PiA9PT09PT09PT09PQo+Pj4+ID0gaGlzdG9yeSA9Cj4+Pj4gPT09
PT09PT09PT0KPj4+PiB2ZXJzaW9uIDU6Cj4+Pj4gwqDCoMKgIC0gUHJlY2lzZSB0aGF0IHZpZGVv
IGRlY29kaW5nIGFzIGJlZW4gc3VjY2Vzc2Z1bGx5IHRlc3RlZCB1cCB0byAKPj4+PiBmdWxsIEhE
Cj4+Pj4gwqDCoMKgIC0gQWRkIE5pY29sYXMgRHVmcmVzbmUgcmV2aWV3ZWQtYnkKPj4+Pgo+Pj4+
IHZlcnNpb24gNDoKPj4+PiDCoMKgwqAgLSBGaXggY29tbWVudHMgZnJvbSBOaWNvbGFzIGFib3V0
IGRyb3BwaW5nIGVuY29kZXIgcmF3IHN0ZXBzCj4+Pj4KPj4+PiB2ZXJzaW9uIDM6Cj4+Pj4gwqDC
oMKgIC0gRml4IHJlbWFya3MgZnJvbSBLcnp5c3p0b2YgS296bG93c2tpOgo+Pj4+IMKgwqDCoMKg
IC0gZHJvcCAiaXRlbXMiLCB3ZSBrZWVwIHNpbXBsZSBlbnVtIGluIHN1Y2ggY2FzZQo+Pj4+IMKg
wqDCoMKgIC0gZHJvcCBzZWNvbmQgZXhhbXBsZSAtIGl0IGlzIHRoZSBzYW1lIGFzIHRoZSBmaXJz
dAo+Pj4+IMKgwqDCoCAtIERyb3AgdW51c2VkIG5vZGUgbGFiZWxzIGFzIHN1Z2dlc3RlZCBieSBD
b25vciBEb29sZXkKPj4+PiDCoMKgwqAgLSBSZXZpc2l0IG1pbi9tYXggcmVzb2x1dGlvbnMgYXMg
c3VnZ2VzdGVkIGJ5IE5pY29sYXMgRHVmcmVzbmUKPj4+Pgo+Pj4+IHZlcnNpb24gMjoKPj4+PiDC
oMKgwqAgLSBGaXggcmVtYXJrcyBmcm9tIEtyenlzenRvZiBLb3psb3dza2kgb24gdjE6Cj4+Pj4g
wqDCoMKgwqAgLSBzaW5nbGUgdmlkZW8tY29kZWMgYmluZGluZyBmb3IgYm90aCBWREVDL1ZFTkMK
Pj4+PiDCoMKgwqDCoCAtIGdldCByaWQgb2YgIi1uYW1lcyIKPj4+PiDCoMKgwqDCoCAtIHVzZSBv
ZiBnZW5lcmljIG5vZGUgbmFtZSAidmlkZW8tY29kZWMiCj4+Pj4KPj4+PiB2ZXJzaW9uIDE6Cj4+
Pj4gwqDCoCAtIEluaXRpYWwgc3VibWlzc2lvbgo+Pj4+Cj4+Pj4gSHVndWVzIEZydWNoZXQgKDUp
Ogo+Pj4+IMKgwqAgZHQtYmluZGluZ3M6IG1lZGlhOiBEb2N1bWVudCBTVE0zMk1QMjUgVkRFQyAm
IFZFTkMgdmlkZW8gY29kZWNzCj4+Pj4gwqDCoCBtZWRpYTogaGFudHJvOiBhZGQgc3VwcG9ydCBm
b3IgU1RNMzJNUDI1IFZERUMKPj4+PiDCoMKgIG1lZGlhOiBoYW50cm86IGFkZCBzdXBwb3J0IGZv
ciBTVE0zMk1QMjUgVkVOQwo+Pj4+IMKgwqAgYXJtNjQ6IGR0czogc3Q6IGFkZCB2aWRlbyBkZWNv
ZGVyIHN1cHBvcnQgdG8gc3RtMzJtcDI1NQo+Pj4+IMKgwqAgYXJtNjQ6IGR0czogc3Q6IGFkZCB2
aWRlbyBlbmNvZGVyIHN1cHBvcnQgdG8gc3RtMzJtcDI1NQo+Pj4+Cj4+Pj4gwqAgLi4uL21lZGlh
L3N0LHN0bTMybXAyNS12aWRlby1jb2RlYy55YW1swqDCoMKgwqDCoMKgIHzCoCA1MCArKysrKysr
Kwo+Pj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpwqDCoMKgwqDC
oMKgwqAgfMKgIDEyICsrCj4+Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1
LmR0c2nCoMKgwqDCoMKgwqDCoCB8wqAgMTcgKysrCj4+Pj4gwqAgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS92ZXJpc2lsaWNvbi9LY29uZmlnwqDCoMKgIHzCoCAxNCArKy0KPj4+PiDCoCBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL01ha2VmaWxlwqDCoCB8wqDCoCA0ICsKPj4+PiDC
oCAuLi4vbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2Rydi5jwqDCoCB8wqDCoCA0
ICsKPj4+PiDCoCAuLi4vbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2h3LmjCoMKg
wqAgfMKgwqAgMiArCj4+Pj4gwqAgLi4uL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3N0bTMybXAyNV92
ZGVjX2h3LmPCoCB8wqAgOTIgKysrKysrKysrKysrKysKPj4+PiDCoCAuLi4vcGxhdGZvcm0vdmVy
aXNpbGljb24vc3RtMzJtcDI1X3ZlbmNfaHcuY8KgIHwgMTE1IAo+Pj4+ICsrKysrKysrKysrKysr
KysrKwo+Pj4+IMKgIDkgZmlsZXMgY2hhbmdlZCwgMzA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+Pj4+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMm1wMjUtdmlkZW8tY29kZWMueWFtbAo+Pj4+
IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCAKPj4+PiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Zlcmlz
aWxpY29uL3N0bTMybXAyNV92ZGVjX2h3LmMKPj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgCj4+
Pj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9zdG0zMm1wMjVfdmVuY19ody5j
Cj4+Pj4KPj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
