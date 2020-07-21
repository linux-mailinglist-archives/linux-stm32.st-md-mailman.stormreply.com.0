Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F97227B30
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 10:54:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 723C1C36B2A;
	Tue, 21 Jul 2020 08:54:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 125A2C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 08:54:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L8rT3k004994; Tue, 21 Jul 2020 10:54:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=dWB555vjWWb7KL5jRYHRpdelX9CdrjuI9kFVMIuo3R4=;
 b=fxF9M4+CSWyXKXsgrxhvvH4iNYe3uslzlrhuPkmJ9TB0YkYZXNe5sTk1qGFrgRd5xVCR
 plDjHaMhALH3aSfArR42moZpqn06EzFczL6xfpoUUjOPXYtLi7badf2OIxugPq/2pwzW
 fqb7xCbBMIJwCj/klveRMTwxUqo4Bh0Cme/C5olLOVPU4vEKMguXCu7stlef2GEbvrKF
 rlH/He20nwioxhSq2TBMSP9Q/VWmJxoBb7Zo7owhGFuZXLLtd1uKbcqLDC9BTUp5x6Zr
 EeIT13qL6Sf3j56pbKBNsLzpOi99Je7Y5pUmrjlQPKCwceguJDq3KIB+SI6WfrKX12nL UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfpct3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:54:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90E93100038;
 Tue, 21 Jul 2020 10:54:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F4A42A7536;
 Tue, 21 Jul 2020 10:54:43 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 10:54:42 +0200
To: Amelie Delaunay <amelie.delaunay@st.com>, Minas Harutyunyan
 <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
References: <20200616140717.28465-1-amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <d8069a78-2640-d112-a2fb-d86b99a8e44f@st.com>
Date: Tue, 21 Jul 2020 10:54:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200616140717.28465-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Add USB role switch support to DWC2
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

SGkgQW3DqWxpZQoKT24gNi8xNi8yMCA0OjA3IFBNLCBBbWVsaWUgRGVsYXVuYXkgd3JvdGU6Cj4g
V2hlbiB1c2luZyB1c2ItYyBjb25uZWN0b3IgKGJ1dCBpdCBjYW4gYWxzbyBiZSB0aGUgY2FzZSB3
aXRoIGEgbWljcm8tYgo+IGNvbm5lY3RvciksIGlkZGlnLCBhdmFsaWQsIGJ2YWxpZCwgdmJ1c3Zh
bGlkIGlucHV0IHNpZ25hbHMgbWF5IG5vdCBiZQo+IGNvbm5lY3RlZCB0byB0aGUgRFdDMiBPVEcg
Y29udHJvbGxlci4KPiBEV0MyIE9URyBjb250cm9sbGVyIGZlYXR1cmVzIGFuIG92ZXJyaWRpbmcg
Y29udHJvbCBvZiB0aGUgUEhZIHZvbHRhZ2UgdmFsaWQKPiBhbmQgSUQgaW5wdXQgc2lnbmFscy4K
PiBTbywgbWlzc2luZyBzaWduYWxzIGNhbiBiZSBmb3JjZWQgdXNpbmcgdXNiIHJvbGUgZnJvbSB1
c2Igcm9sZSBzd2l0Y2ggYW5kCj4gdGhpcyBvdmVycmlkZSBmZWF0dXJlLgo+IAo+IFRoaXMgc2Vy
aWVzIGFkZHMgc3VwcG9ydCBmb3IgdXNiIHJvbGUgc3dpdGNoIHRvIGR3YzIsIGJ5IHVzaW5nIG92
ZXJyaWRpbmcKPiBjb250cm9sIG9mIHRoZSBQSFkgdm9sdGFnZSB2YWxpZCBhbmQgSUQgaW5wdXQg
c2lnbmFscy4KPiAKPiBJdCBoYXMgYmVlbiB0ZXN0ZWQgb24gc3RtMzJtcDE1N2MtZGsyIFsxXSwg
d2hpY2ggaGFzIGEgVHlwZS1DIGNvbm5lY3Rvcgo+IG1hbmFnZWQgYnkgYSBUeXBlLUMgcG9ydCBj
b250cm9sbGVyLCBhbmQgY29ubmVjdGVkIHRvIFVTQiBPVEcgY29udHJvbGxlci4KPiAKPiBbMV0g
aHR0cHM6Ly93d3cuc3QuY29tL2VuL2V2YWx1YXRpb24tdG9vbHMvc3RtMzJtcDE1N2MtZGsyLmh0
bWwKPiAKPiBBbWVsaWUgRGVsYXVuYXkgKDMpOgo+ICAgIHVzYjogZHdjMjogb3ZlcnJpZGUgUEhZ
IGlucHV0IHNpZ25hbHMgd2l0aCB1c2Igcm9sZSBzd2l0Y2ggc3VwcG9ydAo+ICAgIHVzYjogZHdj
MjogZG9uJ3QgdXNlIElEL1ZidXMgZGV0ZWN0aW9uIGlmIHVzYi1yb2xlLXN3aXRjaCBvbiBTVE0z
Mk1QMTUKPiAgICAgIFNvQ3MKPiAgICBBUk06IGR0czogc3RtMzI6IGVuYWJsZSB1c2Itcm9sZS1z
d2l0Y2ggb24gVVNCIE9URyBvbiBzdG0zMm1wMTV4eC1ka3gKPiAKPiAgIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNXh4LWRreC5kdHNpIHwgICAyICstCj4gICBkcml2ZXJzL3VzYi9kd2MyL0tj
b25maWcgICAgICAgICAgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL3VzYi9kd2MyL01ha2VmaWxl
ICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgZHJpdmVycy91c2IvZHdjMi9jb3JlLmggICAgICAg
ICAgICAgICAgfCAgIDggKysKPiAgIGRyaXZlcnMvdXNiL2R3YzIvZHJkLmMgICAgICAgICAgICAg
ICAgIHwgMTkwICsrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIGRyaXZlcnMvdXNiL2R3YzIv
Z2FkZ2V0LmMgICAgICAgICAgICAgIHwgICAyICstCj4gICBkcml2ZXJzL3VzYi9kd2MyL3BhcmFt
cy5jICAgICAgICAgICAgICB8ICAgNCArLQo+ICAgZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5j
ICAgICAgICAgICAgfCAgMTMgKysKPiAgIDggZmlsZXMgY2hhbmdlZCwgMjE4IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy91c2IvZHdj
Mi9kcmQuYwo+IAoKRFQgcGF0Y2ggYXBwbGllZCBvbiBzdG0zMi1uZXh0LgoKVGhhbmtzCkFsZXgK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
