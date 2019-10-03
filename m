Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 041FBC9C65
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2019 12:34:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B995FC36B0B;
	Thu,  3 Oct 2019 10:34:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 200C7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 10:34:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x93AVScS009886; Thu, 3 Oct 2019 12:34:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=lzOYBhAfnBcaEOuQ4FsCPxcaUazDlQqNyGCAqbms35c=;
 b=UuKcnYOLaOGuL0Jnl42Nuj/vTBvssVeWY0GmhV75H7g3Z264h+YwXcqzvw2iXzK8vJo8
 XgXG/HO97QayKRMm8RvzDS2M3KSGkpxwU3kJq/sed2nnwa2BV1c+w+IvUtxb7THmrPat
 /oGOPZibvOgKNii7sPgUnY3tCLsHWvQihDsWF/iD9KOgx1awwEZN8Lj9u/KQsChjcncY
 g7l3ba3b9jOg57BvDktTDWfHaXlIWa+5I4wWwFqcVylfYo5zmezCc433OG9az9X3q5Tg
 Dcoa4OPHaWrdMo4XZWCrtqquH367Gu6izJYbARSR9MWtQPgVtUHw5L3uL6I5j8uLwTSq hw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9vnam43h-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 03 Oct 2019 12:34:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A1C3B4C;
 Thu,  3 Oct 2019 10:34:19 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DD1F2B9881;
 Thu,  3 Oct 2019 12:34:18 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 3 Oct
 2019 12:34:18 +0200
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier
 <fabrice.gasnier@st.com>
References: <1569854751-22337-1-git-send-email-yannick.fertre@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <09ad1310-ebc5-7a41-7af6-cdef79f20802@st.com>
Date: Thu, 3 Oct 2019 12:34:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569854751-22337-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-03_04:2019-10-03,2019-10-03 signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add focaltech
 touchscreen on stm32mp157c-dk2 board
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

SGkgWWFubmljawoKT24gOS8zMC8xOSA0OjQ1IFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6Cj4g
RW5hYmxlIGZvY2FsdGVjaCBmdDYyMzYgdG91Y2hzY3JlZW4gb24gU1RNMzJNUDE1N0MtREsyIGJv
YXJkLgo+IFRoaXMgZGV2aWNlIHN1cHBvcnRzIDIgZGlmZmVyZW50IGFkZHJlc3NlcyAoMHgyYSBh
bmQgMHgzOCkKPiBkZXBlbmRpbmcgb24gdGhlIGRpc3BsYXkgIGJvYXJkIHZlcnNpb24gKE1CMTQw
NykuCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBz
dC5jb20+Cj4gLS0tCj4gICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzIHwg
MjMgKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRr
Mi5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzCj4gaW5kZXggMjBl
YTYwMS4uNTI3YmI3NSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3
Yy1kazIuZHRzCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cwo+
IEBAIC02MSw2ICs2MSwyOSBAQAo+ICAgCX07Cj4gICB9Owo+ICAgCj4gKyZpMmMxIHsKPiArCXRv
dWNoc2NyZWVuQDJhIHsKPiArCQljb21wYXRpYmxlID0gImZvY2FsdGVjaCxmdDYyMzYiOwo+ICsJ
CXJlZyA9IDwweDJhPjsKPiArCQlpbnRlcnJ1cHRzID0gPDIgMj47Cj4gKwkJaW50ZXJydXB0LXBh
cmVudCA9IDwmZ3Bpb2Y+Owo+ICsJCWludGVycnVwdC1jb250cm9sbGVyOwo+ICsJCXRvdWNoc2Ny
ZWVuLXNpemUteCA9IDw0ODA+Owo+ICsJCXRvdWNoc2NyZWVuLXNpemUteSA9IDw4MDA+Owo+ICsJ
CXN0YXR1cyA9ICJva2F5IjsKPiArCX07Cj4gKwl0b3VjaHNjcmVlbkAzOCB7Cj4gKwkJY29tcGF0
aWJsZSA9ICJmb2NhbHRlY2gsZnQ2MjM2IjsKPiArCQlyZWcgPSA8MHgzOD47Cj4gKwkJaW50ZXJy
dXB0cyA9IDwyIDI+Owo+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9mPjsKPiArCQlpbnRl
cnJ1cHQtY29udHJvbGxlcjsKPiArCQl0b3VjaHNjcmVlbi1zaXplLXggPSA8NDgwPjsKPiArCQl0
b3VjaHNjcmVlbi1zaXplLXkgPSA8ODAwPjsKPiArCQlzdGF0dXMgPSAib2theSI7Cj4gKwl9Owo+
ICt9OwoKSSdtIG5vdCBjb25maWRlbnQgYnkgdGhpcyBkdXBsaWNhdGlvbi4gV2Ugc2hvdWxkIG9u
bHkgc3VwcG9ydCB0aGUgbGF0ZXN0IApyZXZpc2lvbiBvZiB0aGUgTUIxNDA3LiBJIHVuZGVyc3Rh
bmQgdGhlIG5lZWQgYnV0IG15IGZlYXIgaXMgdG8gCmR1cGxpY2F0ZSB0aGlzIG5vZGUgZWFjaCB0
aW1lIHdlIGhhdmUgYSBuZXcgcmV2aXNpb24gKGFuZCBpbWFnaW5lIGlmIHdlIApkbyB0aGF0IGZv
ciBhbGwgaTJjIGRldmljZXMpLgoKcmVnYXJkcwphbGV4CgoKPiAgICZsdGRjIHsKPiAgIAlzdGF0
dXMgPSAib2theSI7Cj4gICAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
