Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D2D14A4D4
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 14:21:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0D6EC36B0B;
	Mon, 27 Jan 2020 13:21:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0CE2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 13:21:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RDHIgu030114; Mon, 27 Jan 2020 14:21:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Ynyg3l3bCZvEHYJP9ooaKE6qoJny3AOLT9lZG+35P+Y=;
 b=Oa8/ux9a8wVQREI/DQEGek7/L3+KZ11oy/8M8Wqb4ntcZzz9NkaGBk5eii18tdyUP/2l
 o48/s6ku5LYMkcHRk6Lgt0qo3vx5GKdMVv6/T6QRdFjo5anu80ZlWhDz655ISyMDzeFz
 0LYci8ICQasSli1cJBR6qOx4SNXgOR5WZHkb+EbpYTDPSchmJszbbgMoowblruWO5uih
 UQdNCd7/Ejq20XtRXAJaWWNILoj9IV65o3cnL+SAx29HZi+2dYVwaO3aeaOF9KKgDKUQ
 P7S41DkRid9Omm/WBjysgy/UEsDxuDAjBMKVCJ34qprTLZ9utI6nffWfUnBNQZtWU88Y +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpas72t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 14:21:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0DA4D10002A;
 Mon, 27 Jan 2020 14:21:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECEE62B1871;
 Mon, 27 Jan 2020 14:21:19 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.49) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 14:21:18 +0100
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-8-ludovic.barre@st.com>
 <CAPDyKFqt6SuQh8V1_2-2HzBixR2HTKM+1FKgYuNA1zytc22W7g@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <1b8e1428-c1b6-86e4-8d21-4257bcc16a90@st.com>
Date: Mon, 27 Jan 2020 14:21:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqt6SuQh8V1_2-2HzBixR2HTKM+1FKgYuNA1zytc22W7g@mail.gmail.com>
Content-Language: fr
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 7/9] mmc: mmci: add volt_switch callbacks
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

aGkgVWxmCgpMZSAxLzI0LzIwIMOgIDI6MTIgUE0sIFVsZiBIYW5zc29uIGEgw6ljcml0wqA6Cj4g
T24gRnJpLCAxMCBKYW4gMjAyMCBhdCAxNDo0OSwgTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJy
ZUBzdC5jb20+IHdyb3RlOgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgMiB2b2x0YWdlIHN3aXRjaCBj
YWxsYmFja3MgaW4gbW1jaV9ob3N0X29wczoKPj4gLXByZXBfdm9sdF9zd2l0Y2ggYWxsb3dzIHRv
IHByZXBhcmUgdm9sdGFnZSBzd2l0Y2ggYmVmb3JlIHRvCj4+ICAgc2VudCB0aGUgU0RfU1dJVENI
X1ZPTFRBR0UgY29tbWFuZCAoY21kMTEpLgo+PiAtdm9sdF9zd2l0Y2ggY2FsbGJhY2sgYWxsb3dz
IHRvIGRlZmluZSBzcGVjaWZpYyBhY3Rpb24gYWZ0ZXIKPj4gICByZWd1bGF0b3Igc2V0IHZvbHRh
Z2UuCj4gCj4gSSBhbSBmaW5lIHdpdGggYWRkaW5nIHRoZXNlIGNhbGxiYWNrcywgaG93ZXZlciBJ
IHN0cm9uZ2x5IHN1Z2dlc3QgdG8KPiBoYXZlIGEgcmVmZXJlbmNlIHRvICJzaWduYWwgdm9sdGFn
ZSIgaW4gdGhlIG5hbWUgb2YgdGhlIGNhbGxiYWNrcy4gQXMKPiB0byBhdm9pZCBjb25mdXNpb24g
Zm9yIHdoYXQgdGhlcmUgYXJlIHVzZWQgZm9yLgo+IAo+IFBlcmhhcHMgLT5wb3N0X3NpZ192b2x0
X3N3aXRjaCgpIGFuZCAtPnByZV9zaWdfdm9sdF9zd2l0Y2goKSBjYW4gd29yaz8KPiAKCnN1cmUs
IEkgY2hhbmdlIHRvIHBvc3Rfc2lnX3ZvbHRfc3dpdGNoIGFuZCBwcmVfc2lnX3ZvbHRfc3dpdGNo
LgoKPj4KPj4gU2lnbmVkLW9mZi1ieTogTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJyZUBzdC5j
b20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5jIHwgOCArKysrKysrKwo+PiAg
IGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5oIHwgMiArKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMg
Yi9kcml2ZXJzL21tYy9ob3N0L21tY2kuYwo+PiBpbmRleCAwMGI0NzNmNTcwNDcuLmQ3NmE1OWMw
NmNiMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMKPj4gKysrIGIvZHJp
dmVycy9tbWMvaG9zdC9tbWNpLmMKPj4gQEAgLTIyLDYgKzIyLDcgQEAKPj4gICAjaW5jbHVkZSA8
bGludXgvbW1jL3BtLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L21tYy9ob3N0Lmg+Cj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L21tYy9jYXJkLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbW1jL3NkLmg+Cj4+
ICAgI2luY2x1ZGUgPGxpbnV4L21tYy9zbG90LWdwaW8uaD4KPj4gICAjaW5jbHVkZSA8bGludXgv
YW1iYS9idXMuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4+IEBAIC0xMjA3LDYgKzEy
MDgsOSBAQCBtbWNpX3N0YXJ0X2NvbW1hbmQoc3RydWN0IG1tY2lfaG9zdCAqaG9zdCwgc3RydWN0
IG1tY19jb21tYW5kICpjbWQsIHUzMiBjKQo+PiAgICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxh
eGVkKGNsa3MsIGhvc3QtPmJhc2UgKyBNTUNJREFUQVRJTUVSKTsKPj4gICAgICAgICAgfQo+Pgo+
PiArICAgICAgIGlmIChob3N0LT5vcHMtPnByZXBfdm9sdF9zd2l0Y2ggJiYgY21kLT5vcGNvZGUg
PT0gU0RfU1dJVENIX1ZPTFRBR0UpCj4+ICsgICAgICAgICAgICAgICBob3N0LT5vcHMtPnByZXBf
dm9sdF9zd2l0Y2goaG9zdCk7Cj4+ICsKPj4gICAgICAgICAgaWYgKC8qaW50ZXJydXB0Ki8wKQo+
PiAgICAgICAgICAgICAgICAgIGMgfD0gTUNJX0NQU01fSU5URVJSVVBUOwo+Pgo+PiBAQCAtMTgy
MCw2ICsxODI0LDcgQEAgc3RhdGljIGludCBtbWNpX2dldF9jZChzdHJ1Y3QgbW1jX2hvc3QgKm1t
YykKPj4KPj4gICBzdGF0aWMgaW50IG1tY2lfc2lnX3ZvbHRfc3dpdGNoKHN0cnVjdCBtbWNfaG9z
dCAqbW1jLCBzdHJ1Y3QgbW1jX2lvcyAqaW9zKQo+PiAgIHsKPj4gKyAgICAgICBzdHJ1Y3QgbW1j
aV9ob3N0ICpob3N0ID0gbW1jX3ByaXYobW1jKTsKPj4gICAgICAgICAgaW50IHJldCA9IDA7Cj4+
Cj4+ICAgICAgICAgIGlmICghSVNfRVJSKG1tYy0+c3VwcGx5LnZxbW1jKSkgewo+PiBAQCAtMTgz
OSw2ICsxODQ0LDkgQEAgc3RhdGljIGludCBtbWNpX3NpZ192b2x0X3N3aXRjaChzdHJ1Y3QgbW1j
X2hvc3QgKm1tYywgc3RydWN0IG1tY19pb3MgKmlvcykKPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+PiAgICAgICAgICAgICAgICAgIH0KPj4KPj4gKyAgICAgICAgICAgICAgIGlm
ICghcmV0ICYmIGhvc3QtPm9wcyAmJiBob3N0LT5vcHMtPnZvbHRfc3dpdGNoKQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICByZXQgPSBob3N0LT5vcHMtPnZvbHRfc3dpdGNoKGhvc3QsIGlvcyk7
Cj4+ICsKPj4gICAgICAgICAgICAgICAgICBpZiAocmV0KQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgZGV2X3dhcm4obW1jX2RldihtbWMpLCAiVm9sdGFnZSBzd2l0Y2ggZmFpbGVkXG4iKTsK
Pj4gICAgICAgICAgfQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmggYi9k
cml2ZXJzL21tYy9ob3N0L21tY2kuaAo+PiBpbmRleCBkZGNkZmI4Mjc5OTYuLmMwNGExNDQyNTlh
MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmgKPj4gKysrIGIvZHJpdmVy
cy9tbWMvaG9zdC9tbWNpLmgKPj4gQEAgLTM3Nyw2ICszNzcsOCBAQCBzdHJ1Y3QgbW1jaV9ob3N0
X29wcyB7Cj4+ICAgICAgICAgIHZvaWQgKCpzZXRfY2xrcmVnKShzdHJ1Y3QgbW1jaV9ob3N0ICpo
b3N0LCB1bnNpZ25lZCBpbnQgZGVzaXJlZCk7Cj4+ICAgICAgICAgIHZvaWQgKCpzZXRfcHdycmVn
KShzdHJ1Y3QgbW1jaV9ob3N0ICpob3N0LCB1bnNpZ25lZCBpbnQgcHdyKTsKPj4gICAgICAgICAg
Ym9vbCAoKmJ1c3lfY29tcGxldGUpKHN0cnVjdCBtbWNpX2hvc3QgKmhvc3QsIHUzMiBzdGF0dXMs
IHUzMiBlcnJfbXNrKTsKPj4gKyAgICAgICB2b2lkICgqcHJlcF92b2x0X3N3aXRjaCkoc3RydWN0
IG1tY2lfaG9zdCAqaG9zdCk7Cj4+ICsgICAgICAgaW50ICgqdm9sdF9zd2l0Y2gpKHN0cnVjdCBt
bWNpX2hvc3QgKmhvc3QsIHN0cnVjdCBtbWNfaW9zICppb3MpOwo+PiAgIH07Cj4+Cj4+ICAgc3Ry
dWN0IG1tY2lfaG9zdCB7Cj4+IC0tCj4+IDIuMTcuMQo+Pgo+IAo+IEtpbmQgcmVnYXJkcwo+IFVm
ZmUKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
