Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD400392893
	for <lists+linux-stm32@lfdr.de>; Thu, 27 May 2021 09:32:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E9D5C57B5B;
	Thu, 27 May 2021 07:32:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D8E8C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 07:32:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14R7S9x5008726; Thu, 27 May 2021 09:32:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=24c4Vwg7qSyidiemQylRls5fhbt+xsjE5P99vDEQ0jc=;
 b=x4RlBKbA+cT9ETJelwG4EFwLaBj4cVjvJrJxU4Ybyb/+aVDWIQHYnkzapQhrshMHv/JF
 zIzjGQpvxAbi9XdpIa2uNvzYxEKE+VjGYcsFMXKIxycmQrFoRHOxiegHFr5mLBEjNycQ
 3wgW1A9L8GL+2iZ9JGrm5W00DmnbibbLSenRFo1c+jkKMcntbZDNbvDp3ORVY1x/ze5i
 ZZKEmiPV73nkp2iY4FJgb2v1CwqeIN5bSlewY9YLFJ4qto0XbJPfShLKDKvJtvzaOXoH
 /o5iZr3xHfvddZkuzqRBVNwhWdal0AFz/fn/ZyqaV17LmalsmWmkIWo7yLy036nm/H09 gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t0fr1w9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 09:32:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7132510002A;
 Thu, 27 May 2021 09:32:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E9872138FD;
 Thu, 27 May 2021 09:32:12 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 09:32:11 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210526153016.32653-1-patrice.chotard@foss.st.com>
 <20210526174224.2b8714fc@xps13>
 <bbfc7b31-c49c-e52d-0ea6-20ec81317cac@foss.st.com>
Message-ID: <0072d5e7-3cf8-a8bb-569a-1ea1ba68bbae@foss.st.com>
Date: Thu, 27 May 2021 09:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bbfc7b31-c49c-e52d-0ea6-20ec81317cac@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_02:2021-05-26,
 2021-05-27 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] mtd: spinand: add spi nand mtd resume handler
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

T24gNS8yNy8yMSA5OjAxIEFNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4gSGkgTWlxdWVsCj4g
Cj4gT24gNS8yNi8yMSA1OjQyIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIZWxsbywKPj4K
Pj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGUgb24gV2VkLCAyNiBNYXkgMjAy
MSAxNzozMDoxNiArMDIwMDoKPj4KPj4+IEZyb206IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0
b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29tPgo+Pgo+PiBXb3VsZCB5b3UgbWluZCB0byB1c2UgImFk
ZCBTUEktTkFORCBNVEQgcmVzdW1lIGhhbmRsZXIiIGFzIHRpdGxlPyAod2l0aAo+PiB1cHBlciBj
YXNlIGxldHRlcnMpCj4gCj4gT2sKPiAKPj4KPj4+IEFmdGVyIHBvd2VyIHVwLCBhbGwgU1BJIE5B
TkQncyBibG9ja3MgYXJlIGxvY2tlZC4gT25seSByZWFkIG9wZXJhdGlvbnMKPj4+IGFyZSBhbGxv
d2VkLCB3cml0ZSBhbmQgZXJhc2Ugb3BlcmF0aW9ucyBhcmUgZm9yYmlkZGVuLgo+Pj4gVGhlIFNQ
SSBOQU5EIGZyYW1ld29yayB1bmxvY2tzIGFsbCB0aGUgYmxvY2tzIGR1cmluZyBpdHMgaW5pdGlh
bGl6YXRpb24uCj4+Pgo+Pj4gRHVyaW5nIGEgc3RhbmRieSBsb3cgcG93ZXIsIHRoZSBtZW1vcnkg
aXMgcG93ZXJlZCBkb3duLCBsb3NpbmcgaXRzCj4+PiBjb25maWd1cmF0aW9uLgo+Pj4gRHVyaW5n
IHRoZSByZXN1bWUsIHRoZSBRU1BJIGRyaXZlciBzdGF0ZSBpcyByZXN0b3JlZCBidXQgdGhlIFNQ
SSBOQU5ECj4+PiBmcmFtZXdvcmsgZG9lcyBub3QgcmVjb25maWd1cmVkIHRoZSBtZW1vcnkuCj4+
Pgo+Pj4gVGhpcyBwYXRjaCBhZGRzIHNwaSBuYW5kIG10ZCBQTSBoYW5kbGVycyBmb3IgcmVzdW1l
IG9wcy4KPj4KPj4gZGl0dG8gICAgICAgICAgICAgXl5eXl5eXl5eXl5eCj4gCj4gT2sKPiAKPj4K
Pj4+IFNQSSBOQU5EIHJlc3VtZSBvcCByZS1pbml0aWFsaXplcyBTUEkgTkFORCBmbGFzaCB0byBp
dHMgcHJvYmVkIHN0YXRlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxs
byA8Y2hyaXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+ICBk
cml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQv
bmFuZC9zcGkvY29yZS5jCj4+PiBpbmRleCAxN2Y2M2Y5NWY0YTIuLjZhYmFmODc0ZWIzZiAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+Pj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+PiBAQCAtMTA3NCw2ICsxMDc0LDYxIEBAIHN0YXRpYyBp
bnQgc3BpbmFuZF9kZXRlY3Qoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+Pj4gIAly
ZXR1cm4gMDsKPj4+ICB9Cj4+PiAgCj4+PiArc3RhdGljIHZvaWQgc3BpbmFuZF9tdGRfcmVzdW1l
KHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+Pj4gK3sKPj4+ICsJc3RydWN0IHNwaW5hbmRfZGV2aWNl
ICpzcGluYW5kID0gbXRkX3RvX3NwaW5hbmQobXRkKTsKPj4+ICsJc3RydWN0IG5hbmRfZGV2aWNl
ICpuYW5kID0gbXRkX3RvX25hbmRkZXYobXRkKTsKPj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0g
JnNwaW5hbmQtPnNwaW1lbS0+c3BpLT5kZXY7Cj4+PiArCWludCByZXQsIGk7Cj4+PiArCj4+PiAr
CXJldCA9IHNwaW5hbmRfcmVzZXRfb3Aoc3BpbmFuZCk7Cj4+PiArCWlmIChyZXQpCj4+PiArCQly
ZXR1cm47Cj4+PiArCj4+PiArCXJldCA9IHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJsZShzcGluYW5k
KTsKPj4+ICsJaWYgKHJldCkgewo+Pj4gKwkJZGV2X2VycihkZXYsCj4+PiArCQkJIkZhaWxlZCB0
byBpbml0aWFsaXplIHRoZSBxdWFkIHBhcnQgKGVyciA9ICVkKVxuIiwKPj4KPj4gcXVhZCBwYXJ0
PyB3aGF0IGFib3V0ICJGYWlsZWQgdG8gcmVzdW1lIHRoZSBxdWFkIHN0YXRlIiBvciBzb21ldGhp
bmcKPj4gYWxpa2U/Cj4gCj4gQWdyZWUsIGkgd2lsbCB1cGRhdGUgdGhpcwoKSSB3aWxsIGV2ZW4g
cmVtb3ZlIHRoZSBkZXZfZXJyKCksIGFzIGluIHNwaW5hbmRfaW5pdCgpIApubyBkZXZfZXJyKCkg
d2FzIGFkZGVkIG9uIHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJsZSgpIGVycm9yLgoKPiAKPj4KPj4+
ICsJCQlyZXQpOwo+Pj4gKwkJcmV0dXJuOwo+Pj4gKwl9Cj4+PiArCj4+PiArCXJldCA9IHNwaW5h
bmRfdXBkX2NmZyhzcGluYW5kLCBDRkdfT1RQX0VOQUJMRSwgMCk7Cj4+PiArCWlmIChyZXQpIHsK
Pj4+ICsJCWRldl9lcnIoZGV2LAo+Pj4gKwkJCSJGYWlsZWQgdG8gdXBkdGFlIHRoZSBPVFAgKGVy
ciA9ICVkKVxuIiwKPj4KPj4gdXBkYXRlCj4gCj4gb2sKCmRpdHRvCgo+IAo+Pgo+Pj4gKwkJCXJl
dCk7Cj4+PiArCQlyZXR1cm47Cj4+PiArCX0KPj4+ICsKPj4+ICsJcmV0ID0gc3BpbmFuZF9tYW51
ZmFjdHVyZXJfaW5pdChzcGluYW5kKTsKPj4+ICsJaWYgKHJldCkgewo+Pj4gKwkJZGV2X2Vycihk
ZXYsCj4+PiArCQkJIkZhaWxlZCB0byBpbml0aWFsaXplIHRoZSBTUEkgTkFORCBjaGlwIChlcnIg
PSAlZClcbiIsCj4+PiArCQkJcmV0KTsKPj4+ICsJCXJldHVybjsKPj4+ICsJfQo+Pj4gKwo+Pj4g
KwkvKiBBZnRlciBwb3dlciB1cCwgYWxsIGJsb2NrcyBhcmUgbG9ja2VkLCBzbyB1bmxvY2sgdGhl
bSBoZXJlLiAqLwo+Pj4gKwlmb3IgKGkgPSAwOyBpIDwgbmFuZC0+bWVtb3JnLm50YXJnZXRzOyBp
KyspIHsKPj4+ICsJCXJldCA9IHNwaW5hbmRfc2VsZWN0X3RhcmdldChzcGluYW5kLCBpKTsKPj4+
ICsJCWlmIChyZXQpIHsKPj4+ICsJCQlkZXZfZXJyKGRldiwKPj4+ICsJCQkJIkZhaWxlZCB0byBz
ZWxlY3QgdGhlIHRhcmdldCAoZXJyID0gJWQpXG4iLAo+Pj4gKwkJCQlyZXQpOwoKZGl0dG8KCj4+
PiArCQkJcmV0dXJuOwo+Pj4gKwkJfQo+Pj4gKwo+Pj4gKwkJcmV0ID0gc3BpbmFuZF9sb2NrX2Js
b2NrKHNwaW5hbmQsIEJMX0FMTF9VTkxPQ0tFRCk7Cj4+PiArCQlpZiAocmV0KSB7Cj4+PiArCQkJ
ZGV2X2VycihkZXYsCj4+PiArCQkJCSJGYWlsZWQgdG8gdW5sb2NrIGJsb2NrIChlcnIgPSAlZClc
biIsCj4+PiArCQkJCXJldCk7CgpkaXR0bwoKPj4+ICsJCQlyZXR1cm47Cj4+PiArCQl9Cj4+PiAr
CX0KPj4KPj4gSSBiZXQgdGhpcyB3b3VsZCBkZXNlcnZlIGEgaGVscGVyIGFzIHRoaXMgaXMgdGhl
IGV4YWN0IHNhbWUgcGVhY2Ugb2YKPj4gY29kZSB0aGF0IGlzIGJlaW5nIHJ1biBpbiBzcGlubmFu
ZF9pbml0KCk/Cj4gCj4gSSB3aWxsIGFkZCBhIG5ldyBmdW5jdGlvbiBzcGluYW5kX2Jsb2NrX3Vu
bG9jayhzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gCj4+Cj4+IEF0IHRoZSB2ZXJ5
IGxlYXN0IEkgdGhpbmsgdGhhdCBzcGluYW5kX2VjY19lbmFibGUoc3BpbmFuZCwgZmFsc2UpOwo+
PiBzaG91bGQgYmUgY2FsbGVkLgo+IEkgd2lsbCBhZGQgaXQuIAo+IAo+Pgo+PiBJZGVhbGx5LCBh
IHJlc3VtZSBvcGVyYXRpb24gc2hvdWxkIGJlIHByb3ZpZGVkIGJ5IEVDQyBlbmdpbmVzLCBidXQg
dGhhdAo+PiBjYW4gYmUgYWRkZWQgbGF0ZXIuCj4+Cj4+PiArfQo+Pj4gKwo+Pj4gIHN0YXRpYyBp
bnQgc3BpbmFuZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPj4+ICB7Cj4+
PiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Owo+Pj4g
QEAgLTExNjcsNiArMTIyMiw3IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9pbml0KHN0cnVjdCBzcGlu
YW5kX2RldmljZSAqc3BpbmFuZCkKPj4+ICAJbXRkLT5fYmxvY2tfaXNyZXNlcnZlZCA9IHNwaW5h
bmRfbXRkX2Jsb2NrX2lzcmVzZXJ2ZWQ7Cj4+PiAgCW10ZC0+X2VyYXNlID0gc3BpbmFuZF9tdGRf
ZXJhc2U7Cj4+PiAgCW10ZC0+X21heF9iYWRfYmxvY2tzID0gbmFuZGRldl9tdGRfbWF4X2JhZF9i
bG9ja3M7Cj4+PiArCW10ZC0+X3Jlc3VtZSA9IHNwaW5hbmRfbXRkX3Jlc3VtZTsKPj4+ICAKPj4+
ICAJaWYgKG5hbmQtPmVjYy5lbmdpbmUpIHsKPj4+ICAJCXJldCA9IG10ZF9vb2JsYXlvdXRfY291
bnRfZnJlZWJ5dGVzKG10ZCk7Cj4+Cj4+IFRoYW5rcywKPj4gTWlxdcOobAo+Pgo+IFRoYW5rcwo+
IFBhdHJpY2UKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LXN0bTMyIG1haWxpbmcgbGlzdAo+IExpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KPiBodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
