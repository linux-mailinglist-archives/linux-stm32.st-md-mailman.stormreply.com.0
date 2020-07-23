Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D6D22A95F
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 09:15:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 570D5C36B29;
	Thu, 23 Jul 2020 07:15:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 656D1C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 07:15:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N7DD7m014051; Thu, 23 Jul 2020 09:15:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=yqcfY/padsjVsHSiHABJVoYRhWwTvp1SMriQZY8ccyU=;
 b=At0Pl150HlvjCdBUER0ftWuQuekxfi0EwklT75x/bePqYqO4iWqKjxuNsDn7aFrOZpLe
 42WJqY4eJEJYzCCfh/TdisUjXbq47ICeBRdrfFAg1n3vrswF9wFc/L6+9l7FjlYtbXQt
 ozlUIOEaCMZYqIrJm2Hkl+fcCAUERTXyqFjbBOcq/0GLgFxwvX8H7yVXfR6PxmwRFprp
 eNlqkDES+OBWBOHik1XACNAmvweFWNWXHS8ed4YVhMeDS/KSfUhK60bbf0KJWTXQs8CG
 btG6mEnaLZj84V88bkHov2UkcUEiRRfWtd1swOyWMnDoc2ka7q39STFgU6Gh1OKqTcVS 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsah95dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 09:15:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B13610002A;
 Thu, 23 Jul 2020 09:15:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32E0621FEA9;
 Thu, 23 Jul 2020 09:15:19 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jul
 2020 09:15:18 +0200
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "balbi@kernel.org" <balbi@kernel.org>
References: <20200616140717.28465-2-amelie.delaunay@st.com>
 <20200704174219.612060-1-martin.blumenstingl@googlemail.com>
 <05a81997-5ddb-ea81-7a89-8078b8a2b610@st.com>
 <CAFBinCCVYJ=DuKbqhJJ8463Gs+GW0bgxyXSFiLXhUfvWV6AR0Q@mail.gmail.com>
 <ee4ee889-835e-2244-504c-2b1b605d78aa@st.com>
 <CAFBinCDUxvovAyDywz3xVcu_1v4nai+ebR2D38U2B8oBGss=yg@mail.gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <7497c0ed-bac6-969e-8198-c40a41e874e3@st.com>
Date: Thu, 23 Jul 2020 09:15:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCDUxvovAyDywz3xVcu_1v4nai+ebR2D38U2B8oBGss=yg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_02:2020-07-22,
 2020-07-23 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "hminas@synopsys.com" <hminas@synopsys.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/3] usb: dwc2: override PHY input signals
 with usb role switch support
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

SGkgRmVsaXBlLApIaSBNYXJ0aW4sCgpJIHNhdyB0aGUgaXNzdWUgcmVwb3J0ZWQgKFtiYWxiaS11
c2I6dGVzdGluZy9uZXh0IDIvMTddIApkcml2ZXJzL3VzYi9kd2MyL2RyZC5jOjgwOjM4OiBlcnJv
cjogbm8gbWVtYmVyIG5hbWVkICd0ZXN0X21vZGUnIGluIAonc3RydWN0IGR3YzJfaHNvdGcnKS4g
SSBwcmVwYXJlIGEgVjIgZml4aW5nIGl0ICsgYWRyZXNzaW5nIE1hcnRpbidzIApjb21tZW50cy4K
ClJlZ2FyZHMsCkFtZWxpZQoKT24gNy8xOS8yMCA5OjU2IFBNLCBNYXJ0aW4gQmx1bWVuc3Rpbmds
IHdyb3RlOgo+IEhlbGxvIEFtZWxpZSwKPiAKPiBzb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkKPiAK
PiBPbiBXZWQsIEp1bCA4LCAyMDIwIGF0IDY6MDAgUE0gQW1lbGllIERFTEFVTkFZIDxhbWVsaWUu
ZGVsYXVuYXlAc3QuY29tPiAKPiB3cm90ZToKPiBbLi4uXQo+PiBDb3VsZCB5b3UgcGxlYXNlIHRl
c3Qgd2l0aDoKPj4KPj4gc3RhdGljIGludCBkd2MyX2RyZF9yb2xlX3N3X3NldChzdHJ1Y3QgZGV2
aWNlICpkZXYsIGVudW0gdXNiX3JvbGUgcm9sZSkKPj4gewo+PsKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGR3YzJfaHNvdGcgKmhzb3RnID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4+wqDCoMKgwqDC
oMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PsKgwqDCoMKgwqDCoMKgwqAgaW50IGFscmVh
ZHkgPSAwOwo+Pgo+PsKgwqDCoMKgwqDCoMKgwqAgLyogU2tpcCBzZXNzaW9uIG5vdCBpbiBsaW5l
IHdpdGggZHJfbW9kZSAqLwo+PsKgwqDCoMKgwqDCoMKgwqAgaWYgKChyb2xlID09IFVTQl9ST0xF
X0RFVklDRSAmJiBoc290Zy0+ZHJfbW9kZSA9PSBVU0JfRFJfTU9ERV9IT1NUKSB8fAo+PsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAocm9sZSA9PSBVU0JfUk9MRV9IT1NUICYmIGhzb3RnLT5kcl9t
b2RlID09IFVTQl9EUl9NT0RFX1BFUklQSEVSQUwpKQo+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pgo+PsKgwqDCoMKgwqDCoMKgwqAgLyogU2tpcCBz
ZXNzaW9uIGlmIGNvcmUgaXMgaW4gdGVzdCBtb2RlICovCj4+wqDCoMKgwqDCoMKgwqDCoCBpZiAo
cm9sZSA9PSBVU0JfUk9MRV9OT05FICYmIGhzb3RnLT50ZXN0X21vZGUpIHsKPj7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZGJnKGhzb3RnLT5kZXYsICJDb3JlIGlzIGluIHRl
c3QgbW9kZVxuIik7Cj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
QlVTWTsKPj7CoMKgwqDCoMKgwqDCoMKgIH0KPj4KPj7CoMKgwqDCoMKgwqDCoMKgIHNwaW5fbG9j
a19pcnFzYXZlKCZoc290Zy0+bG9jaywgZmxhZ3MpOwo+Pgo+PsKgwqDCoMKgwqDCoMKgwqAgaWYg
KHJvbGUgPT0gVVNCX1JPTEVfSE9TVCkgewo+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFscmVhZHkgPSBkd2MyX292cl9hdmFsaWQoaHNvdGcsIHRydWUpOwo+PsKgwqDCoMKgwqDC
oMKgwqAgfSBlbHNlIGlmIChyb2xlID09IFVTQl9ST0xFX0RFVklDRSkgewo+PsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFscmVhZHkgPSBkd2MyX292cl9idmFsaWQoaHNvdGcsIHRy
dWUpOwo+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFRoaXMgY2xlYXIgRENU
TC5TRlRESVNDT04gYml0ICovCj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHdj
Ml9oc290Z19jb3JlX2Nvbm5lY3QoaHNvdGcpOwo+PsKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsK
Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZHdjMl9pc19kZXZpY2VfbW9k
ZShoc290ZykpIHsKPj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
ICghZHdjMl9vdnJfYnZhbGlkKGhzb3RnLCBmYWxzZSkpCj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFRoaXMgc2V0IERDVEwuU0ZURElTQ09OIGJp
dCAqLwo+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
d2MyX2hzb3RnX2NvcmVfZGlzY29ubmVjdChoc290Zyk7Cj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfSBlbHNlIHsKPj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZHdjMl9vdnJfYXZhbGlkKGhzb3RnLCBmYWxzZSk7Cj4+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PsKgwqDCoMKgwqDCoMKgwqAgfQo+Pgo+PsKgwqDC
oMKgwqDCoMKgwqAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaHNvdGctPmxvY2ssIGZsYWdzKTsK
Pj4KPj7CoMKgwqDCoMKgwqDCoMKgIGlmICghYWxyZWFkeSAmJgo+PsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByb2xlICE9IFVTQl9ST0xFX05PTkUgJiYgaHNvdGctPmRyX21vZGUgPT0gVVNCX0RS
X01PREVfT1RHKQo+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFRoaXMgd2ls
bCByYWlzZSBhIENvbm5lY3RvciBJRCBTdGF0dXMgQ2hhbmdlIEludGVycnVwdCAqLwo+PsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGR3YzJfZm9yY2VfbW9kZShoc290Zywgcm9sZSA9
PSBVU0JfUk9MRV9IT1NUKTsKPj4KPj7CoMKgwqDCoMKgwqDCoMKgIGRldl9kYmcoaHNvdGctPmRl
diwgIiVzLXNlc3Npb24gdmFsaWRcbiIsCj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcm9sZSA9PSBVU0JfUk9MRV9OT05FID8gIk5vIiA6Cj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcm9sZSA9PSBVU0JfUk9MRV9IT1NUID8gIkEiIDogIkIiKTsKPj4KPj7CoMKg
wqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiB9Cj4+Cj4+Cj4+IGR3YzJfZm9yY2VfbW9kZSBpcyBj
YWxsZWQgb3V0c2lkZSB0aGUgc3Bpbl9sb2NrX2lycXNhdmUgc28gdGhlIGtlcm5lbAo+PiBzaG91
bGQgbm90IGNvbXBsYWluLiBJJ3ZlIHRlc3RlZCBvbiBteSBzZXR1cCBhbmQgdGhlIGJlaGF2aW9y
IHNlZW1zIHRoZQo+PiBzYW1lLgo+IHRoaXMgb25lIGlzIGxvb2tpbmcgZ29vZCAtIHRoZSBwcmV2
aW91cyBrZXJuZWwgd2FybmluZ3MgYXJlIG5vdyBnb25lIQo+IHRoYW5rIHlvdSB2ZXJ5IG11Y2gK
PiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
