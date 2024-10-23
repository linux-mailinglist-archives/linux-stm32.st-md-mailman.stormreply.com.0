Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF949AC779
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 12:10:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFA69C71287;
	Wed, 23 Oct 2024 10:10:51 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50B21C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 10:10:45 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N81PNq031369;
 Wed, 23 Oct 2024 12:10:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Xo1eeiTgVZYq4ByM4vw+H1JV/QTd+caClf5hFYE3Uik=; b=E/rc47slUUGkV4Qb
 X7SV5eUil6zyjtO4R3GKzIPDzBE3qYYbm8Tr95nRH8qxltKNVCfXtJriYD8XDt+S
 XBXFEmbXp/hKilUlVUd1bshlMF/qO/aKh1JmxmCrO5tkoEYGBTthrL4xBwgrW3Nv
 Pvwenlc9Ib8gh1+1o1qIlyHKciFTY2DKub3Vj1f6qxaEQvlONyvYnAEwXQwmxYwD
 2r/Q9MZV1/I27hg9JzvVaL/ZNhcKnd61OZv2lbmWnf1ShO1MRWeazfbaPZgY8ZQ7
 Wj3x2aRoWMAQMDDjpWB9g97pHBiAo+Bh1gwK2+JGHMk4gZ2dRIxlSm/ovNgzv5I4
 3pIsIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42em4djq8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2024 12:10:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 34AC640050;
 Wed, 23 Oct 2024 12:09:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D04E82699F1;
 Wed, 23 Oct 2024 12:09:01 +0200 (CEST)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 23 Oct
 2024 12:09:00 +0200
Message-ID: <334845caee45ed72ef08867f23f69b5333be57c5.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 23 Oct 2024 12:08:59 +0200
In-Reply-To: <2g65375shtjq4udjfarfspqtpg5q27oeerqskt2uzwj44pvnbb@rderpevnrzxs>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-12-antonio.borneo@foss.st.com>
 <2g65375shtjq4udjfarfspqtpg5q27oeerqskt2uzwj44pvnbb@rderpevnrzxs>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/14] dt-bindings: pinctrl: stm32:
 support for stm32mp215 and additional packages
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

T24gV2VkLCAyMDI0LTEwLTIzIGF0IDEwOjUxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDIyLCAyMDI0IGF0IDA1OjU2OjU1UE0gKzAyMDAsIEFudG9uaW8g
Qm9ybmVvIHdyb3RlOgo+ID4gRnJvbTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlA
Zm9zcy5zdC5jb20+Cj4gPiAKPiA+IEFkZCBzdXBwb3J0IGZvciBzdCxzdG0zMm1wMjE1LXBpbmN0
cmwgYW5kIHN0LHN0bTMybXAyMTUtei1waW5jdHJsLgo+IAo+IFNvIGFsbCBwcmV2aW91cyBwYXRj
aGVzIGFyZSBmb3IgdGhpcz8gVGhlbiB0aGV5IGFyZSBzdXBwb3NlZCB0byBiZSBoZXJlLgoKSGkg
S3J6eXN6dG9mLAoKSSdtIG5vdCBzdXJlIEkgZnVsbHkgZ2V0IHlvdXIgcG9pbnQgaGVyZS4KVGhl
IHByZXZpb3VzIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgYWRkIHRoZSBuZXcgZmVhdHVyZXMgdG8g
dGhlIGFscmVhZHkgdXBzdHJlYW1lZCBTVE0zMk1QMjU3LgpUaGUgc2FtZSBmZWF0dXJlcyBhcmUg
YWxzbyBuZWVkZWQgaGVyZSBieSBTVE0zMk1QMjE1IGFuZCBpbiBuZXh0IHBhdGNoZXMgMTIvMTQg
YW5kIDEzLzE0IGJ5IFNUTTMyTVAyMzUuCgo+IAo+ID4gQWRkIHBhY2thZ2VzIEFNLCBBTiBhbmQg
QU8gKHZhbHVlcyA6IDB4MTAwMCwgMHgyMDAwIGFuZCAweDgwMDApCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29t
Pgo+ID4gLS0tCj4gPiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzIt
cGluY3RybC55YW1swqDCoMKgwqDCoMKgwqDCoCB8IDQgKysrLQo+ID4gwqBpbmNsdWRlL2R0LWJp
bmRpbmdzL3BpbmN0cmwvc3RtMzItcGluZnVuYy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMyArKysKPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFtbAo+ID4g
aW5kZXggOWE3ZWNmZWE2ZWI1Yi4uMGEyZDY0NGRiZWNlMyAxMDA2NDQKPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFt
bAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qs
c3RtMzItcGluY3RybC55YW1sCj4gPiBAQCAtMjcsNiArMjcsOCBAQCBwcm9wZXJ0aWVzOgo+ID4g
wqDCoMKgwqDCoMKgIC0gc3Qsc3RtMzJtcDEzNS1waW5jdHJsCj4gPiDCoMKgwqDCoMKgwqAgLSBz
dCxzdG0zMm1wMTU3LXBpbmN0cmwKPiA+IMKgwqDCoMKgwqDCoCAtIHN0LHN0bTMybXAxNTctei1w
aW5jdHJsCj4gPiArwqDCoMKgwqDCoCAtIHN0LHN0bTMybXAyMTUtcGluY3RybAo+ID4gK8KgwqDC
oMKgwqAgLSBzdCxzdG0zMm1wMjE1LXotcGluY3RybAo+ID4gwqDCoMKgwqDCoMKgIC0gc3Qsc3Rt
MzJtcDI1Ny1waW5jdHJsCj4gPiDCoMKgwqDCoMKgwqAgLSBzdCxzdG0zMm1wMjU3LXotcGluY3Ry
bAo+ID4gwqAKPiA+IEBAIC01OSw3ICs2MSw3IEBAIHByb3BlcnRpZXM6Cj4gPiDCoMKgwqDCoMKg
wqAgSW5kaWNhdGVzIHRoZSBTT0MgcGFja2FnZSB1c2VkLgo+ID4gwqDCoMKgwqDCoMKgIE1vcmUg
ZGV0YWlscyBpbiBpbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvc3RtMzItcGluZnVuYy5oCj4g
PiDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIK
PiA+IC3CoMKgwqAgZW51bTogWzB4MSwgMHgyLCAweDQsIDB4OCwgMHgxMDAsIDB4NDAwLCAweDgw
MF0KPiA+ICvCoMKgwqAgZW51bTogWzB4MSwgMHgyLCAweDQsIDB4OCwgMHgxMDAsIDB4NDAwLCAw
eDgwMCwgMHgxMDAwLCAweDIwMDAsIDB4NDAwMF0KPiA+IMKgCj4gPiDCoHBhdHRlcm5Qcm9wZXJ0
aWVzOgo+ID4gwqDCoCAnXmdwaW9AWzAtOWEtZl0qJCc6Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMyLXBpbmZ1bmMuaCBiL2luY2x1ZGUvZHQtYmluZGlu
Z3MvcGluY3RybC9zdG0zMi1waW5mdW5jLmgKPiA+IGluZGV4IGFmM2ZkMzg4MzI5YTAuLjAxYmM4
YmU3OGVmNzIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvc3Rt
MzItcGluZnVuYy5oCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvc3RtMzIt
cGluZnVuYy5oCj4gPiBAQCAtNDEsNiArNDEsOSBAQAo+ID4gwqAjZGVmaW5lIFNUTTMyTVBfUEtH
X0FJwqAweDEwMAo+ID4gwqAjZGVmaW5lIFNUTTMyTVBfUEtHX0FLwqAweDQwMAo+ID4gwqAjZGVm
aW5lIFNUTTMyTVBfUEtHX0FMwqAweDgwMAo+ID4gKyNkZWZpbmUgU1RNMzJNUF9QS0dfQU3CoDB4
MTAwMAo+ID4gKyNkZWZpbmUgU1RNMzJNUF9QS0dfQU7CoDB4MjAwMAo+ID4gKyNkZWZpbmUgU1RN
MzJNUF9QS0dfQU/CoDB4NDAwMAo+IAo+IFdoeSB0aGVzZSBhcmUgc29tZSByYW5kb20gaGV4IHZh
bHVlcyBidXQgbm90IGZvciBleGFtcGxlIDB4ODAxLCAweDgwMgo+IGFuZCAweDgwMz8gVGhhdCdz
IGFuIGVudW0sIHNvIGJpdG1hc2sgZG9lcyBub3QgbWFrZSBzZW5zZSBoZXJlLgoKVGhlIGFyZSBi
aXRtYXNrLiBZb3UgY2FuIGNoZWNrIGluIHBhdGNoIDE0LzE0IHRoYXQgYWRkcyBhIG5ldyBwYWNr
YWdlIHRvIHRoZSBleGlzdGluZyBjb2RlIG9mIFNUTTMyTVAyNTcuCkRvIHlvdSBwcmVmZXIgSSBy
ZXdyaXRlIHRoZW0gYWxsIGFzLCBlLmcuCiNkZWZpbmUgU1RNMzJNUF9QS0dfQU8gKDEgPDwgMTQp
Cj8KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKUmVnYXJkcywKQW50b25pbwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
