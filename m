Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A3F3CD5D7
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jul 2021 15:40:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FC75C57189;
	Mon, 19 Jul 2021 13:40:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B2BAC57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 13:40:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JDbF3U028393; Mon, 19 Jul 2021 15:40:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OPnz7GgLa8oBsVio/uq8oZKdX3WKnEdHcpPLC45ORr8=;
 b=HPl9cSj3lPAOMW5xhJapuhSPgSSZI1ke9xYFQDeEyz7o7kv6CX28N+OD9Fb68S7YlrBY
 RVkMPwlhGNJQYylUg+bwQOgdqOlVP/KiNGPzOW3jjQxz2eDOx6lvDNZI01HdUR1/KuIN
 2VLboleqDLg+/G99BvE8uC9brDf01o72QBXyYT3wrKqyzpOZ8y/1ZmG+TljyOUZJXNpb
 NbLbDatueUEKVAoPxyBlKu4NMhAdmJx0jfgzeEoZ+7g1hnGDHCS3d4WZR6NgQUTQooRK
 ZHPAFmeUo6mV5t9GG7R3vQ3SGAWdxmjnciupKxlxYQEt/0XTQwwSDR9ODrZO8669Pubz ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39w40eaag8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 15:40:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6222810002A;
 Mon, 19 Jul 2021 15:40:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 360A42291C7;
 Mon, 19 Jul 2021 15:40:40 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Jul
 2021 15:40:39 +0200
From: Philippe CORNU <philippe.cornu@foss.st.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20210713144941.3599-1-antonio.borneo@foss.st.com>
 <fab62613-59a4-5d0b-4ff8-3900ef70a49d@foss.st.com>
Message-ID: <780cf379-3b7a-3e75-0803-0ebd30e649ea@foss.st.com>
Date: Mon, 19 Jul 2021 15:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fab62613-59a4-5d0b-4ff8-3900ef70a49d@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
Cc: linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: dsi: compute the transition time
 from LP to HS and back
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

CgpPbiA3LzEzLzIxIDY6NDcgUE0sIFBoaWxpcHBlIENPUk5VIHdyb3RlOgo+IEhpIEFudG9uaW8s
Cj4gCj4gT24gNy8xMy8yMSA0OjQ5IFBNLCBBbnRvbmlvIEJvcm5lbyB3cm90ZToKPj4gVGhlIGRy
aXZlciB1c2VzIGEgY29uc2VydmF0aXZlIHNldCBvZiBoYXJkY29kZWQgdmFsdWVzIGZvciB0aGUK
Pj4gbWF4aW11bSB0aW1lIGRlbGF5IG9mIHRoZSB0cmFuc2l0aW9ucyBiZXR3ZWVuIExQIGFuZCBI
UywgZWl0aGVyCj4+IGZvciBkYXRhIGFuZCBjbG9jayBsYW5lcy4KPj4KPj4gQnkgdXNpbmcgdGhl
IGluZm8gaW4gU1RNMzJNUDE1NyBkYXRhc2hlZXQsIHZhbGlkIGFsc28gZm9yIG90aGVyIFNUCj4+
IGRldmljZXMsIGNvbXB1dGUgdGhlIGFjdHVhbCBkZWxheSBmcm9tIHRoZSBsYW5lJ3MgYnBzLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5z
dC5jb20+Cj4+IC0tLQo+PiBUbzogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Mu
c3QuY29tPgo+PiBUbzogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QGZvc3Muc3QuY29t
Pgo+PiBUbzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+
Cj4+IFRvOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4+IFRvOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4+IFRvOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20+Cj4+IFRvOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3Vl
QGZvc3Muc3QuY29tPgo+PiBUbzogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlz
LXBvdUBmb3NzLnN0LmNvbT4KPj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Pj4gVG86IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4gVG86IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZwo+Pgo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0
bS5jIHwgMTcgKysrKysrKysrKysrKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlw
aV9kc2ktc3RtLmMKPj4gaW5kZXggODM5OWQzMzc1ODlkLi4zMmNiNDFiMjIwMmYgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYwo+PiBAQCAtMzA5LDE0ICszMDksMjMg
QEAgZHdfbWlwaV9kc2lfZ2V0X2xhbmVfbWJwcyh2b2lkICpwcml2X2RhdGEsIGNvbnN0IAo+PiBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4g
wqAgfQo+PiArI2RlZmluZSBEU0lfUEhZX0RFTEFZKGZwLCB2cCwgbWJwcykgRElWX1JPVU5EX1VQ
KChmcCkgKiAobWJwcykgKyAxMDAwIAo+PiAqICh2cCksIDgwMDApCj4+ICsKPj4gwqAgc3RhdGlj
IGludAo+PiDCoCBkd19taXBpX2RzaV9waHlfZ2V0X3RpbWluZyh2b2lkICpwcml2X2RhdGEsIHVu
c2lnbmVkIGludCBsYW5lX21icHMsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBkd19taXBpX2RzaV9kcGh5X3RpbWluZyAqdGltaW5nKQo+PiDCoCB7Cj4+IC3CoMKg
wqAgdGltaW5nLT5jbGtfaHMybHAgPSAweDQwOwo+PiAtwqDCoMKgIHRpbWluZy0+Y2xrX2xwMmhz
ID0gMHg0MDsKPj4gLcKgwqDCoCB0aW1pbmctPmRhdGFfaHMybHAgPSAweDQwOwo+PiAtwqDCoMKg
IHRpbWluZy0+ZGF0YV9scDJocyA9IDB4NDA7Cj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICog
RnJvbSBTVE0zMk1QMTU3IGRhdGFzaGVldCwgdmFsaWQgZm9yIFNUTTMyRjQ2OSwgU1RNMzJGN3g5
LCAKPj4gU1RNMzJINzQ3Cj4+ICvCoMKgwqDCoCAqIHBoeV9jbGtoczJscF90aW1lID0gKDI3Misx
MzYqVUkpLyg4KlVJKQo+PiArwqDCoMKgwqAgKiBwaHlfY2xrbHAyaHNfdGltZSA9ICg1MTIrNDAq
VUkpLyg4KlVJKQo+PiArwqDCoMKgwqAgKiBwaHlfaHMybHBfdGltZSA9ICgxOTIrNjQqVUkpLyg4
KlVJKQo+PiArwqDCoMKgwqAgKiBwaHlfbHAyaHNfdGltZSA9ICgyNTYrMzIqVUkpLyg4KlVJKQo+
PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCB0aW1pbmctPmNsa19oczJscCA9IERTSV9QSFlfREVM
QVkoMjcyLCAxMzYsIGxhbmVfbWJwcyk7Cj4+ICvCoMKgwqAgdGltaW5nLT5jbGtfbHAyaHMgPSBE
U0lfUEhZX0RFTEFZKDUxMiwgNDAsIGxhbmVfbWJwcyk7Cj4+ICvCoMKgwqAgdGltaW5nLT5kYXRh
X2hzMmxwID0gRFNJX1BIWV9ERUxBWSgxOTIsIDY0LCBsYW5lX21icHMpOwo+PiArwqDCoMKgIHRp
bWluZy0+ZGF0YV9scDJocyA9IERTSV9QSFlfREVMQVkoMjU2LCAzMiwgbGFuZV9tYnBzKTsKPiAK
PiBNYW55IHRoYW5rcyBmb3IgeW91ciBwYXRjaC4KPiAKPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUg
Q29ybnUgPHBoaWxpcHBlLmNvcm51QGZvc3Muc3QuY29tPgo+IEFja2VkLWJ5OiBQaGlsaXBwZSBD
b3JudSA8cGhpbGlwcGUuY29ybnVAZm9zcy5zdC5jb20+Cj4gCj4gSSB3aWxsIGFwcGx5IGl0IG9u
IGRybS1taXNjLW5leHQgZWFybHkgbmV4dCB3ZWVrLAo+IAo+IFBoaWxpcHBlIDotKQo+IAo+PiDC
oMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+Cj4+IGJhc2UtY29tbWl0OiAzNWQyODM2NThh
NjE5NmIyMDU3YmU1NjIwOTY2MTBjNjc5M2UxMjE5Cj4+CgpBcHBsaWVkIG9uIGRybS1taXNjLW5l
eHQuCk1hbnkgdGhhbmtzIGZvciB5b3VyIHBhdGNoLApQaGlsaXBwZSA6LSkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
