Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8227C94D313
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 17:14:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8381C78021;
	Fri,  9 Aug 2024 15:14:06 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2328C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 15:14:05 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 479A0pHv008310;
 Fri, 9 Aug 2024 17:13:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FlSaZnNd7y0QCcx39z10PqhY0Rx1yv+xs/5BlCrpbHQ=; b=0GhVRpzYDv+xy6ck
 hX9bTaggS95gaBY7VXM+NY4RmiYBoycMJeyIwosZSpchFK1sLxlTLeQCrJ5njOfm
 yBulZBIYBKI4j9vut/gICz7osbfrPApIOBZszePQSBsm9tIHCwADY4q8KN2c5zj4
 jLCwdjMjunaJg+sVjocNrd5f1d4zSzWpSz7dkkdG1A9G9b6dTbgdhd4I+LAvTJNy
 DxbLXdUjej6OIEB3cXrGfWVBh+FLmmighkwnPcW2XgvK2Pzou8gcEZBchbloCU1c
 QZb7RUqXuN74AWCxqzcvbg+9npPXfifETEXSvohsOEZ6bmiEHdHysOTEa688cwKo
 EkJCmA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40tu6n51kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 17:13:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7449040044;
 Fri,  9 Aug 2024 17:13:34 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 680AD2606D0;
 Fri,  9 Aug 2024 17:12:44 +0200 (CEST)
Received: from [10.252.26.60] (10.252.26.60) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 9 Aug
 2024 17:12:42 +0200
Message-ID: <e3cf0c78-133a-400a-9669-93ff529d708b@foss.st.com>
Date: Fri, 9 Aug 2024 17:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>, Yanjun Yang
 <yangyj.ee@gmail.com>, Philippe CORNU <philippe.cornu@foss.st.com>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
 <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
 <e059f157-ff9c-32cb-57a6-48f2331f2555@foss.st.com>
 <ZqeZEB9peRSQkOLZ@void.tail05c47.ts.net>
 <94ecd3a6-3a62-4be6-b384-c8237c818e98@gmail.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <94ecd3a6-3a62-4be6-b384-c8237c818e98@gmail.com>
X-Originating-IP: [10.252.26.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
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

SGksCgp3ZSBkb24ndCBnaXZlIGVub3VnaCBhdHRlbnRpb24gdG8gb2xkZXIgU09DcyBsaWtlIHN0
bTMyZjQ2OS4gVGhpcyBpcyBhbiAKZXJyb3Igb24gb3VyIHBhcnQuCgpJIHRoaW5rIHRoYXQgdG8g
Zml4IHRoaXMgcG9pbnQgaXQgd291bGQgYmUgbmVjZXNzYXJ5IHRvIGRlZmluZSB0aGUgY2xvY2sg
CmhzZSBhcyBjbG9jayBmaXguCgpJIGhvcGUgdG8gYmUgYWJsZSB0byByZWxlYXNlIGEgcGF0Y2gg
YmVmb3JlIHRoZSBlbmQgb2YgQXVndXN0CgpCZXN0IHJlZ2FyZHMKCllhbm5pY2sgRmVydHLDqQoK
CkxlIDAxLzA4LzIwMjQgw6AgMTE6MDcsIFJhcGhhw6tsIEdhbGxhaXMtUG91IGEgw6ljcml0wqA6
Cj4KPgo+IExlIDI5LzA3LzIwMjQgw6AgMTU6MjgsIFlhbmp1biBZYW5nIGEgw6ljcml0wqA6Cj4+
IE9uIEZyaSwgSnVsIDI2LCAyMDI0IGF0IDA5OjU1OjM1QU0gKzAyMDAsIFBoaWxpcHBlIENPUk5V
IHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiA3LzIyLzI0IDEwOjM4LCBZYW5qdW4gWWFuZyB3cm90ZToK
Pj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggKGNvbW1pdCBpZDoxODVmOTliNjE0NDI3MzYwKSBzZWVtcyB0
byBicmVhayB0aGUgZHNpIG9mCj4+Pj4gc3RtMzJmNDY5IGNoaXAuCj4+Pj4gSSdtIG5vdCBmYW1p
bGlhciB3aXRoIHRoZSBkcm0gYW5kIHRoZSBjbG9jayBmcmFtZXdvcmssIG1heWJlIGl0J3MKPj4+
PiBiZWNhdXNlIHRoZXJlIGlzIG5vCj4+Pj4gwqDCoCAiY2tfZHNpX3BoeSIgZGVmaW5lZCBmb3Ig
c3RtMzJmNDY5Lgo+Pj4+IFBTOsKgIFNvcnJ5IGZvciByZWNlaXZpbmcgbXVsdGlwbGUgY29waWVz
IG9mIHRoaXMgZW1haWwsIEkgZm9yZ290IHRvCj4+Pj4gdXNlIHBsYWluIHRleHQgbW9kZSBsYXN0
IHRpbWUuCj4+Pj4KPj4+Cj4+PiBIaSwKPj4+IFRoYW5rIHlvdSBmb3IgbGV0dGluZyB1cyBrbm93
IHRoYXQgdGhlcmUgd2FzIHRoaXMgZXJyb3IuIFdlIHNob3VsZCBoYXZlCj4+PiBkZXRlY3RlZCB0
aGlzIGJlZm9yZSBtZXJnaW5nLCByZWFsbHkgc29ycnkgZm9yIHRoZSBwcm9ibGVtcyBjYXVzZWQg
Cj4+PiBieSB0aGlzCj4+PiBwYXRjaC4gV2Ugd2lsbCBpbnZlc3RpZ2F0ZSB0aGUgaXNzdWUgYW5k
IGdldCBiYWNrIHRvIHlvdSBhcyBzb29uIGFzCj4+PiBwb3NzaWJsZS4gSW4gdGhlIG1lYW50aW1l
LCBJIHRoaW5rIHlvdSBjYW4gcmV2ZXJ0IHRoaXMgcGF0Y2ggaW4geW91ciAKPj4+IGdpdAo+Pj4g
dHJlZS4KPj4+Cj4+PiBQaGlsaXBwZSA6LSkKPj4+Cj4+Cj4+IEhpLAo+IEhpLAo+Cj4gRllJCj4g
RFNJIGNsb2NrIHRyZWUgZm9yIHN0bTMyZjQ2OSBjYW4gYmUgZm91bmQgaGVyZToKPiBodHRwczov
L3d3dy5zdC5jb20vcmVzb3VyY2UvZW4vcmVmZXJlbmNlX21hbnVhbC9ybTAzODYtc3RtMzJmNDY5
eHgtYW5kLXN0bTMyZjQ3OXh4LWFkdmFuY2VkLWFybWJhc2VkLTMyYml0LW1jdXMtc3RtaWNyb2Vs
ZWN0cm9uaWNzLnBkZiAKPgo+Cj4gUmVmZXIgdG8gRmlndXJlIDE3OiBEU0kgY2xvY2sgdHJlZS4K
Pgo+IEFmdGVyIHNvbWUgcmVzZWFyY2ggSSB0aGluayAiY2tfZHNpX3BoeSIgd2FzIGludHJvZHVj
ZWQgaW4gc3RtMzJoNyAKPiBwbGF0Zm9ybXMuIFRoZXJlIGlzIGEgbXV4IHdoaWNoIGludGVyZmFj
ZXMgYmV0d2VlbiB2YXJpb3VzIGNsb2NrcyAKPiAoYW1vbmcgY2tfaHNlKSBhbmQgdGhlIGJ5dGUg
bGFuZSBjbG9jay4gc3RtMzJmNDY5IGhhcyBhIG11Y2ggc2ltcGxlciAKPiBjbG9jayB0cmVlIGlu
IHdoaWNoIHdlIGRpZCBub3QgYm90aGVyIHRvIGltcGxlbWVudCB0aGlzICJnby1iZXR3ZWVuIiAK
PiBjbG9jaywgZXZlbiB0aG91Z2ggdGhleSBpcyBhbiBlcXVpdmFsZW50IG9mIHRoZSBtdXguCj4K
Pj4gQWZ0ZXIgc29tZSB0ZXN0aW5nLCB0aGUgcmVhc29uIGJlaGluZCBteSBwcm9ibGVtIGlzIHRo
ZSBwYXJlbnQncyBuYW1lIG9mCj4+ICdjbGtfZHNpX3BoeScgZm9yIHN0bTMyZjQgaXMgJ2Nsay1o
c2UnIG90aGVyIHRoYW4gJ2NrX2hzZScuwqAgSSBkb24ndAo+PiBrbm93IHdoaWNoIGlzIHRoZSBi
ZXR0ZXIgd2h5IHRvIGZpeCBpdDoKPj4gMS4gQ2hhbmdlICJja19oc2UiIHRvICJjbGstaHNlIiBp
biB3aGVyZSAiY2xrX2RzaV9waHkiIGlzIGRlZmluZWQuCj4gRG9pbmcgc28gd2lsbCBkZWZpbml0
ZWx5IGJyZWFrIG90aGVyIHBsYXRmb3Jtcy4KPgo+PiAyLiBVc2UgInBsbF9pbl9raHogPSBjbGtf
Z2V0X3JhdGUoZHNpLT5wbGxyZWZfY2xrKSAvIDEwMDAiIGluc3RlYWQgb2YKPj4gwqDCoMKgICJw
bGxfaW5fa2h6ID0gKHVuc2lnbmVkIGludCkocGFyZW50X3JhdGUgLyAxMDAwKSIgd2hlbiBnZXQg
dGhlIGNsb2NrCj4+IMKgwqDCoCByYXRlLgo+IGRzaS0+cGxscmVmX2NsayByZWZlcnMgdG8gdGhl
IEhTRSBjbG9jayBpZiB5b3UgdGFrZSBhIGxvb2sgaW4gdGhlIAo+IGRldmljZS10cmVlLiBUaGlz
IGlzIHRoZSByZWFzb24gd2h5IHRoaXMgd29yayBvbiB5b3VyIHNldHVwLiBJIGRvdWJ0IAo+IG5l
dmVydGhlbGVzcyB0aGF0IGl0IHdvdWxkbid0IHdvcmsgb24gb3RoZXIgcGxhdGZvcm1zLiBCdXQg
dGhpcyB3b3VsZCAKPiBiZSBhIHNlbWFudGljIG5vbnNlbnNlLCBzaW5jZSB0aGUgRFNJIGJ5dGUg
bGFuZSBjbG9jayBpcyBub3QgYWx3YXlzIAo+IGRlcml2ZWQgZnJvbSBIU0UgY2xvY2sgb24gb3Ro
ZXIgcGxhdGZvcm1zLgo+Cj4gTG9va2luZyBhZ2FpbiBhdCB0aGUgY2xrLXN0bTMyZjQgZHJpdmVy
IGFuZCB0aGUgRFNJIGNsb2NrIHRyZWUgbGlua2VkLCAKPiB3ZSBjYW4gbWF5YmUgaW1wbGVtZW50
IHRoZSBkZXNpcmVkIGNsb2NrIGV2ZW4gaWYgaXQgaXMgbm90IHJlcHJlc2VudGVkIAo+IG9uIHRo
ZSBkaWFncmFtLgo+Cj4gRXZlbnR1YWxseSBpZiB0aGlzIHNvbHV0aW9uIGRvZXMgbm90IHdvcmsg
d2Ugd2lsbCBnbyB0byB0aGUgc2Vjb25kIAo+IHNvbHV0aW9uIHlvdSBzdWdnZXN0ZWQgYW5kIHdl
IHdpbGwgdGVzdCBpdCBvbiBhbGwgcGxhdGZvcm1zLgo+Cj4gQFBoaWxpcHBlLCBAWWFubmljawo+
IERvIHlvdSBhZ3JlZSB3aXRoIHRoaXMgd29ya2Zsb3cgPwo+Cj4gUmVnYXJkcywKPiBSYXBoYcOr
bAo+Cj4KPj4KPj4gQm90aCBtZXRob2QgY2FuIGZpeCBteSBwcm9ibGVtLiBUaGUgZmlyc3Qgb25l
IG1pZ2h0IGJyZWFrIG90aGVyCj4+IHBsYXRmb3Jtcy4gTWF5YmUgSSBzaG91bGQgY2hhbmdlIHRo
ZSBjbG9jayBuYW1lIG9mICdjbGstaHNlJy4gSG93ZXZlciwKPj4gSSBjYW4ndCBmaW5kIHRoZSBk
ZWZpbmF0aW9uIG9mIHRoaXMgY2xvY2sgbmFtZSBmb3Igc3RtMzJmNC4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
