Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 325531B38ED
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 09:28:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEC72C36B0B;
	Wed, 22 Apr 2020 07:28:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 607C2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 07:28:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03M7NAdg011053; Wed, 22 Apr 2020 09:27:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=pNYrQd9/DJVoCXwSmxOIXASciMdhgtT5EdZIzl1pg9A=;
 b=pWohZzQhL1jTypopmfEEjq+d/SwHxHHgc0jPdnos1ang6tw9ddbX7HSfJkXZNJRtZdU6
 Wml0VqLh1anjmaa2i4NbKPWCbu1nL8zzSPKywR5nTHNxBFM8J6IijVMhNceq64ER2HzK
 e/GM9VJ9otz7egcTTTuW0EHtoO7NxalMG9bP8KMNMqDZXjbvRANjeeKZKeIeKBMvMHjC
 7B5G6VZCMzbllILUA0NczQFs9nj2vmbWqVUYexNgjk7Z7nYmQu8s5MUdEAhIpwo3a+sA
 dfbilCPf0kw04vHyscuFKTEAhFKkfOttGTTW9FuAYVCoX6PXyzBBQ0z9ORbK29Qj3SuG bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqawcpka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 09:27:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25E6910002A;
 Wed, 22 Apr 2020 09:27:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B640212A75;
 Wed, 22 Apr 2020 09:27:58 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Apr
 2020 09:27:53 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200401132237.60880-1-marex@denx.de>
 <971b9046-2d77-fdc6-2916-8b02ffb601d5@denx.de>
 <b73cb2bf-e50b-ce52-8e53-d8b72fa273f0@st.com>
 <37cfbbb1-64a2-aca6-8901-5bdff6df71e9@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c9a973f2-6f39-bec9-334a-07d2a134bffa@st.com>
Date: Wed, 22 Apr 2020 09:27:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <37cfbbb1-64a2-aca6-8901-5bdff6df71e9@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_02:2020-04-21,
 2020-04-22 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V4 00/22] ARM: dts: stm32: Repair AV96
	board
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

CgpPbiA0LzIxLzIwIDc6MDcgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDQvMjEvMjAgNjow
NCBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4gSGkgTWFyZWsKPiAKPiBIaSwKPiAKPj4g
T24gNC8yMS8yMCAxMjozMCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiA0LzEvMjAgMzoy
MiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+Pj4gVGhlIEFWOTYgYm9hcmQgZGV2aWNlIHRyZWUg
aXMgY29tcGxldGVseSBicm9rZW4gYW5kIGRvZXMgbm90IG1hdGNoIHRoZQo+Pj4+IGhhcmR3YXJl
LiBUaGlzIHNlcmllcyBmaXhlcyBpdCB1cC4KPj4+Pgo+Pj4+IE1hcmVrIFZhc3V0ICgyMik6Cj4+
Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgZXRoZXJu
ZXQgUkdNSUkKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IFJlcGFpciBldGhlcm5ldCBvcGVy
YXRpb24gb24gQVY5Ngo+Pj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIG1pc3NpbmcgZXRo
ZXJuZXQgUEhZIHJlc2V0IG9uIEFWOTYKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBt
aXNzaW5nIGV0aGVybmV0IFBIWSBza2V3cyBvbiBBVjk2Cj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0
bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgU0RNTUMxIGRpcmVjdGlvbiBwaW5zCj4+Pj4g
IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIgU0RNTUMxIG9wZXJhdGlvbiBvbiBBVjk2Cj4+
Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIgUE1JQyBjb25maWd1cmF0aW9uIG9uIEFW
OTYKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IFJlcGFpciBQTUlDIGludGVycnVwdCBvbiBB
Vjk2Cj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3Ig
U0RNTUMyIHBpbnMgNC03Cj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgZU1NQyBhdHRh
Y2hlZCB0byBTRE1NQzIgb24gQVY5Ngo+Pj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIFFT
UEkgTk9SIG9uIEFWOTYKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBjb25maWd1cmF0
aW9uIEVFUFJPTSBvbiBBVjk2Cj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJu
YXRlIHBpbm11eCBmb3IgU0RNTUMzIHBpbnMKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IEVu
YWJsZSBXaUZpIG9uIEFWOTYKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5h
dGUgcGlubXV4IGZvciBVU0FSVDIgcGlucwo+Pj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMjogRW5h
YmxlIEJsdWV0b290aCBvbiBBVjk2Cj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0
ZXJuYXRlIHBpbm11eCBmb3IgTFREQyBwaW5zCj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBB
ZGQgYmluZGluZ3MgZm9yIEhETUkgdmlkZW8gb24gQVY5Ngo+Pj4+ICDCoMKgIEFSTTogZHRzOiBz
dG0zMjogQWRkIGFsdGVybmF0ZSBwaW5tdXggZm9yIFNBSTIgcGlucwo+Pj4+ICDCoMKgIEFSTTog
ZHRzOiBzdG0zMjogQWRkIGJpbmRpbmdzIGZvciBhdWRpbyBvbiBBVjk2Cj4+Pj4gIMKgwqAgQVJN
OiBkdHM6IHN0bTMyOiBBZGQgYmluZGluZ3MgZm9yIFVTQiBvbiBBVjk2Cj4+Pj4gIMKgwqAgQVJN
OiBkdHM6IHN0bTMyOiBSZW5hbWUgTEVEcyB0byBtYXRjaCBzaWxrc2NyZWVuIG9uIEFWOTYKPj4+
Pgo+Pj4+ICDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpwqDCoMKg
IHwgMjgwICsrKysrKysrKysrKysrKysrCj4+Pj4gIMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdhLWF2ZW5nZXI5Ni5kdHMgfCAzMjQgKysrKysrKysrKysrKysrKysrLS0KPj4+PiAgwqAg
MiBmaWxlcyBjaGFuZ2VkLCA1NzEgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pCj4+Pgo+
Pj4gQWxleCwgY2FuIHlvdSBwcm92aWRlIHNvbWUgcmV2aWV3IG9mIHRoaXMgc2VyaWVzID8gSXQn
cyBiZWVuIHBvc3RlZCBmb3IKPj4+IHRocmVlIHdlZWtzIG5vdy4KPj4+Cj4+Cj4+IFllcywgSSB3
YXMgd2FpdGluZyBmb3IgTWFuaSdzIHJldmlldyBmaXJzdCAoYW5kIEkgd2FzIGEgYml0IGJ1c3kg
c29ycnkpLgo+IAo+IEl0IHNlZW1zIG1vc3Qgb2YgdGhlIHBhdGNoZXMgZ290IHRoYXQgcmV2aWV3
LgoKWWVzLgoKPiAKPj4gQWxsIHBhdGNoZXMgbG9va3MgZ29vZCBmb3IgbWUuIE1heWJlIEknbGwg
c3F1YXNoIHNvbWUgcGluY3RybCBwYXRjaGVzIHRvCj4+IGRlY3JlYXNlIG51bWJlciBvZiBwYXRj
aGVzLgo+IAo+IE9uZSBwYXRjaCBzaG91bGQgZG8gb25lIHRoaW5nIGFuZCBvbmUgdGhpbmcgb25s
eSwgbm8gPwoKQWRkaW5nIGFsbCBTRE1NQyBwaW5ncm91cHMgdXBkYXRlIGluIG9uZSBwYXRjaCBj
b3VsZCBtYWtlIHNlbnNlIGZvciAKZXhhbXBsZS4KCj4gCj4+IE9uZSByZW1haW5pbmcgcXVlc3Rp
b25zIGFib3V0IHBhdGNoIDcgKCJSZXBhaXIgUE1JQyBjb25maWd1cmF0aW9uIG9uCj4+IEFWOTYp
LiBJIHNhdyBhIGRpc2N1c3Npb24gb24gdS1ib290IHRocmVhZCB3aXRoIHBhc2NhbCBQLiwgZXhw
bGFpbmluZwo+PiB0aGF0IDgwMG12IGlzIG5vdCB0aGUgbWluaW1hbCB2b2x0YWdlIGFjY2VwdGFi
bGUgZm9yIHZkZGNvcmUuIFdoYXQgaXMKPj4gdGhlIHN0YXR1cyA/Cj4gCj4gSXQgc2hvdWxkIGxp
a2VseSBiZSBzZXQgdG8gMVYyLCBzYW1lIGFzIDc5MWJlOTRlMjg3OCAoIkFSTTogZHRzOiBzdG0z
MjoKPiBjaGFuZ2UgZGVmYXVsdCBtaW5pbWFsIGJ1Y2sxIHZhbHVlIG9uIHN0bTMybXAxNTciKSBk
b2VzLiBJJ2xsIGFkZCBpdAo+IGludG8gdGhlIGxpc3Qgb2YgZml4ZXMgZm9yIFY1Lgo+IAoKb2ss
IHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
