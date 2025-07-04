Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C68BCAF8EA5
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 11:31:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EE55C36B2F;
	Fri,  4 Jul 2025 09:31:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92A55C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 09:31:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647Zun2015076;
 Fri, 4 Jul 2025 11:31:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 M9BwNdO0n+eHL0EUvWD6TuFBUIy3YHt8PoUYOzrUspw=; b=gWUdzPm1DMpm70oQ
 fRrkubsgs3v5Gb9JpVToX2KBdsuIS/RenqmRaDuYoqMHFleZZVulGExY/A8H5Ide
 PxUNFj5eIwlsNJmcwj94812gBYnsVL3IYkYRs3YGtMhbI75ipQApdhvimHpJsaik
 6HxZAVTRLtZMdAjD3kJEuYwdYt+zJ/apxGTd4fgLzv+K9eH0TEBz2cyt0craIir2
 OCTb2Tn1X+8Ip8SnHQshqTVevaC3on+povzaJ2GCIrOhxub1VKo69fykFy/OGe86
 6VJrE0Y2h03C862lJ3t6agAHH7NlBiBQfwLDzjmV10plO9myKiPv4+TL+6/OSvi3
 8UW/Tg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r6m7fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jul 2025 11:31:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 73C1A4004A;
 Fri,  4 Jul 2025 11:29:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A28CAA07D2;
 Fri,  4 Jul 2025 11:29:02 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 11:29:01 +0200
Message-ID: <dfbc604f-e43f-44a4-ac2c-d5fcdcbb1297@foss.st.com>
Date: Fri, 4 Jul 2025 11:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
Cc: devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 0/7] Introduce STM32MP157F-DK2 board
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

SGkgQW3DqWxpZQoKT24gNi8zLzI1IDExOjAyLCBBbWVsaWUgRGVsYXVuYXkgd3JvdGU6Cj4gVGhl
IG1haW4gaGFyZHdhcmUgZGlmZmVyZW5jZSB3aXRoIFNUTTMyTVAxNTdDLURLMiBib2FyZCBpcyB0
aGUgU29DOiAnRicKPiB2YXJpYW50IGVtYmVkcyBhIFNUTTMyTVAxNTdGIFNvQywgd2hpY2ggaGFz
IHRoZSBzYW1lIGxldmVsIG9mIGZlYXR1cmVzCj4gdGhhbiBhIFNUTTMyTVAxNTdDIFNvQyBidXQg
QTcgY2xvY2sgZnJlcXVlbmN5IGNhbiByZWFjaCA4MDBNaHogKGluc3RlYWQKPiBvZiBmaXhlZCA2
NTBNaHogZm9yICdDJyB2YXJpYW50KS4KPiBzdG0zMm1wMTU3Zi1kazIgZGV2aWNlIHRyZWUgcmV1
c2VzIHRoZSBleGlzdGluZyBza2V0ZXRvbiBmb3IgU1RNMzJNUDE1Cj4gREt4IGJvYXJkcywgYnV0
IGl0IGlzIFNDTUktYmFzZWQgd2l0aCBJMkM0ICYgUE1JQyBtYW5hZ2VkIGJ5IE9QLVRFRSwKPiBs
aWtlIG90aGVyIFNUTTMyIE1QVSBib2FyZHMgKFNUTTMyTVAxMzVGLURLLCBTVE0zMk1QMjU3Ri1E
Sy9FVjEsIC4uLikuCj4gSGltYW5zaHUncyBiaW5kaW5ncyBwYXRjaCBbMV0gaGFzIGJlZW4gcmVy
b2xsZWQgdG8gaW50cm9kdWNlCj4gc3Qsc3RtMzJtcDE1N2YtZGsyIGNvbXBhdGlibGUuCj4gCj4g
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDI1MDUyNDEw
MDMxOS4yMjUyMS0zLWhpbWFuc2h1LmJoYXZhbmlAc2lsaWNvbnNpZ25hbHMuaW8vIFsxXQo+IFNp
Z25lZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QGZvc3Muc3QuY29t
Pgo+IENjOiBIaW1hbnNodSBCaGF2YW5pIDxoaW1hbnNodS5iaGF2YW5pQHNpbGljb25zaWduYWxz
LmlvPgo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBEcm9wIGVtcHR5IHN0bTMybXAxNXhhLmR0c2kg
YW5kIHN0bTMybXAxNXhkLmR0c2kgZmlsZXMuCj4gLSBGdWxmaWxsIFNDTUkgcmVndWxhdG9yIGRl
ZmluZXMgYW5kIGFkZCBQYXNjYWwncyBTb0IKPiAtIEFkZCBwYXRjaCBbNC83XSB0byB1c2UgU0NN
SSByZWd1bGF0b3IgZGVmaW5lcwo+IC0gQWRkIHBhdGNoIFs1LzddIGZvciBPUC1URUUgYXN5bmMg
bm90aWYKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1Mjct
c3RtMzJtcDE1N2YtZGsyLXYxLTAtOGFlZjg4NWE0OTI4QGZvc3Muc3QuY29tCj4gCj4gLS0tCj4g
QWxleGFuZHJlIFRvcmd1ZSAoMSk6Cj4gICAgICAgIEFSTTogZHRzOiBzdG0zMjogZnVsbGZpbGwg
ZGl2ZXJzaXR5IHdpdGggT1BQIGZvciBTVE0zMk0xNXhGIFNPQ3MKPiAKPiBBbWVsaWUgRGVsYXVu
YXkgKDMpOgo+ICAgICAgICBBUk06IGR0czogc3RtMzI6IHVzZSAndHlwZWMnIGdlbmVyaWMgbmFt
ZSBmb3Igc3R1c2IxNjAwIG9uIHN0bTMybXAxNXh4LWRreAo+ICAgICAgICBBUk06IGR0czogc3Rt
MzI6IHVzZSBpbnRlcm5hbCByZWd1bGF0b3JzIGJpbmRpbmdzIGZvciBNUDE1IHNjbWkgdmFyaWFu
dHMKPiAgICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgc3RtMzJtcDE1N2YtZGsyIGJvYXJkIHN1
cHBvcnQKPiAKPiBFdGllbm5lIENhcnJpZXJlICgyKToKPiAgICAgICAgZHQtYmluZGluZ3M6IHJl
Z3VsYXRvcjogQWRkIFNUTTMyTVAxNSBTQ01JIHJlZ3VsYXRvciBpZGVudGlmaWVycwo+ICAgICAg
ICBBUk06IGR0czogc3RtMzI6IG9wdGVlIGFzeW5jIG5vdGlmIGludGVycnVwdCBmb3IgTVAxNSBz
Y21pIHZhcmlhbnRzCj4gCj4gSGltYW5zaHUgQmhhdmFuaSAoMSk6Cj4gICAgICAgIGR0LWJpbmRp
bmdzOiBhcm06IHN0bTMyOiBhZGQgU1RNMzJNUDE1N0YtREsyIGJvYXJkIGNvbXBhdGlibGUKPiAK
PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sICAgICAgIHwg
ICAxICsKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgIHwgICAzICstCj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUtc2NtaS5kdHNp
ICAgICAgICAgICB8ICAxMCArLQo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2Yt
ZGsyLXNjbWkuZHRzaSAgICAgfCAxOTYgKysrKysrKysrKysrKysrKysrKysrCj4gICBhcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Zi1kazIuZHRzICAgICAgICAgICB8IDE3OSArKysrKysr
KysrKysrKysrKysrCj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Zi5kdHNpICAg
ICAgICAgICAgICB8ICAxNyArKwo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgt
ZGt4LmR0c2kgICAgICAgICAgfCAgIDIgKy0KPiAgIC4uLi9kdC1iaW5kaW5ncy9yZWd1bGF0b3Iv
c3Qsc3RtMzJtcDE1LXJlZ3VsYXRvci5oIHwgIDQwICsrKysrCj4gICA4IGZpbGVzIGNoYW5nZWQs
IDQ0MyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiBk
YzM5MjM0MmI3YmIxNGIxMmYyZGU5NjIwMTkzN2NiMDJiZTc4MDJmCj4gY2hhbmdlLWlkOiAyMDI1
MDUyNy1zdG0zMm1wMTU3Zi1kazItMmE0ODRhMDE5NzNhCj4gCj4gQmVzdCByZWdhcmRzLAoKU2Vy
aWVzIGFwcGxpZWQgb24gc3RtMzItbmV4dC4KCkNoZWVycy4KCkFsZXgKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
