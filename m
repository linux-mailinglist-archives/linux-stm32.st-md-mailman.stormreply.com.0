Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E1F1BD845
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 11:31:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C017C36B0D;
	Wed, 29 Apr 2020 09:31:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6337C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 09:31:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T9QQA7009878; Wed, 29 Apr 2020 11:31:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=DRjQYztleGVSiDwTizC2lxz1DCDBXrRlNa50jKUHHJc=;
 b=Na+Wj74zfR2NIBXfPk/efWyfHb+B7utgS3kgr6bnLeGH3k+bB3soaIG7zA3YhDiXZP1S
 s3gPfT4pA3WHL+dhLEEh/dVakow4UAXkG2RtytHlC3cxF12fK7ISJb1C8NkvBzcQaOoq
 NTsNQE62FcpzG7mABhYo5lekMkFJS+sJtfZMNbdt6hdR/yM2OJe2SdPs9CldkARVdU6f
 5CZNnznzgnlHQjK7yuCLOw2aN1cf1LiaYX5mXAs/NdvQRsQzqG4ERNeR/4KqIFXNfbiX
 20+pC7ySrt7TMAdTYDkAQchy7dAnR49j0rCsxvsKwy4yuE7ltYSBeXFv8OZuGmF2eele HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq65djh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 11:31:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BD1710002A;
 Wed, 29 Apr 2020 11:31:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6209207570;
 Wed, 29 Apr 2020 11:31:09 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.44) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 11:31:08 +0200
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-8-git-send-email-christophe.kerello@st.com>
 <20200427203314.798b3c4e@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <bb4a6377-2cbd-f990-0c55-cb393292aee9@st.com>
Date: Wed, 29 Apr 2020 11:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200427203314.798b3c4e@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_03:2020-04-28,
 2020-04-29 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 07/12] mtd: rawnand: stm32_fmc2: cleanup
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

SGkgTWlxdcOobCwKCk9uIDQvMjcvMjAgODozMyBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDaHJpc3RvcGhlLAo+IAo+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKPiAyMDIwIDE3OjU3OjMxICswMjAwOgo+IAo+
PiBUaGlzIHBhdGNoIHJlbmFtZXMgZnVuY3Rpb25zIGFuZCBsb2NhbCB2YXJpYWJsZXMgdG8gYmUg
cmVhZHkgdG8gdXNlCj4+IHN0bTMyX2ZtYzIgc3RydWN0dXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4+IC0tLQo+
IAo+PiAtc3RhdGljIGludCBzdG0zMl9mbWMyX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+PiAtCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX2Rh
dGFfaW50ZXJmYWNlICpjb25mKQo+PiArc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19zZXR1cF9p
bnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKPj4gKwkJCQkJICBj
b25zdCBzdHJ1Y3QgbmFuZF9kYXRhX2ludGVyZmFjZSAqY2YpCj4gCj4gSSBzdXBwb3NlIHlvdSBz
L2NvbmYvY2YvIGJlY2F1c2Ugb2YgdGhlIDgwIGNoYXJzIGJvdW5kYXJ5LiBJbiB0aGlzIGNhc2UK
PiBJIGRvbid0IG1pbmQgY3Jvc3NpbmcgaXQsIEkgZG9uJ3QgdGhpbmsgaXQgaXMgYmV0dGVyIHRv
IHJlbmFtZSB0aGUKPiBjb25mIHBhcmFtZXRlciBmb3IgdGhpcyByZWFzb24uCj4gCgpZZXMsIHlv
dSBhcmUgcmlnaHQuIEkgaGF2ZSBtb2RpZmllZCBpdCBiZWNhdXNlIG9mIDgwIGNoYXJzIGJvdW5k
YXJ5LgpJIHdpbGwga2VlcCBjb25mIGluIHYzLgoKPj4gICB7Cj4+ICAgCWNvbnN0IHN0cnVjdCBu
YW5kX3Nkcl90aW1pbmdzICpzZHJ0Owo+PiAgIAo+PiAtCXNkcnQgPSBuYW5kX2dldF9zZHJfdGlt
aW5ncyhjb25mKTsKPj4gKwlzZHJ0ID0gbmFuZF9nZXRfc2RyX3RpbWluZ3MoY2YpOwo+PiAgIAlp
ZiAoSVNfRVJSKHNkcnQpKQo+PiAgIAkJcmV0dXJuIFBUUl9FUlIoc2RydCk7Cj4+ICAgCj4+ICAg
CWlmIChjaGlwbnIgPT0gTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkpCj4+ICAgCQlyZXR1cm4g
MDsKPj4gICAKPj4gLQlzdG0zMl9mbWMyX2NhbGNfdGltaW5ncyhjaGlwLCBzZHJ0KTsKPj4gLQlz
dG0zMl9mbWMyX3RpbWluZ3NfaW5pdChjaGlwKTsKPj4gKwlzdG0zMl9mbWMyX25mY19jYWxjX3Rp
bWluZ3MoY2hpcCwgc2RydCk7Cj4+ICsJc3RtMzJfZm1jMl9uZmNfdGltaW5nc19pbml0KGNoaXAp
Owo+PiAgIAo+PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+ICAgCj4gCj4gWy4uLl0KPiAKPj4gICAK
Pj4gLXN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX2ZtYzJfZHJpdmVyID0gewo+
PiAtCS5wcm9iZQk9IHN0bTMyX2ZtYzJfcHJvYmUsCj4+IC0JLnJlbW92ZQk9IHN0bTMyX2ZtYzJf
cmVtb3ZlLAo+PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfZm1jMl9uZmNf
ZHJpdmVyID0gewo+PiArCS5wcm9iZQk9IHN0bTMyX2ZtYzJfbmZjX3Byb2JlLAo+PiArCS5yZW1v
dmUJPSBzdG0zMl9mbWMyX25mY19yZW1vdmUsCj4+ICAgCS5kcml2ZXIJPSB7Cj4+IC0JCS5uYW1l
ID0gInN0bTMyX2ZtYzJfbmFuZCIsCj4+IC0JCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX2ZtYzJf
bWF0Y2gsCj4+IC0JCS5wbSA9ICZzdG0zMl9mbWMyX3BtX29wcywKPj4gKwkJLm5hbWUgPSAic3Rt
MzJfZm1jMl9uZmMiLAo+PiArCQkub2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl9mbWMyX25mY19tYXRj
aCwKPj4gKwkJLnBtID0gJnN0bTMyX2ZtYzJfbmZjX3BtX29wcywKPj4gICAJfSwKPj4gICB9Owo+
PiAtbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihzdG0zMl9mbWMyX2RyaXZlcik7Cj4+ICttb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKHN0bTMyX2ZtYzJfbmZjX2RyaXZlcik7Cj4+ICAgCj4+IC1NT0RVTEVf
QUxJQVMoInBsYXRmb3JtOnN0bTMyX2ZtYzJfbmFuZCIpOwo+PiArTU9EVUxFX0FMSUFTKCJwbGF0
Zm9ybTpzdG0zMl9mbWMyX25mYyIpOwo+PiAgIE1PRFVMRV9BVVRIT1IoIkNocmlzdG9waGUgS2Vy
ZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4iKTsKPj4gLU1PRFVMRV9ERVNDUklQVElP
TigiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIEZNQzIgbmFuZCBkcml2ZXIiKTsKPj4gK01PRFVM
RV9ERVNDUklQVElPTigiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIEZNQzIgbmZjIGRyaXZlciIp
Owo+IAo+IEkgd291bGQgcHJlZmVyOiBzL25mYy9ORkMvIGhlcmUgcGxlYXNlLgo+IAoKSXQgd2ls
bCBiZSBtb2RpZmllZCBpbiB2My4KClJlZ2FyZHMsCkNocmlzdG9waGUgS2VyZWxsby4KCj4+ICAg
TU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwo+IAo+IFdpdGggdGhlc2UgdHdvIG5pdHMsCj4gCj4g
UmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4g
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
