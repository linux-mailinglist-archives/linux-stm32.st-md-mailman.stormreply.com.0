Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A858078651
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2019 09:24:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 707F4C35E01;
	Mon, 29 Jul 2019 07:24:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED385C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2019 07:24:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6T7Lfvg024841; Mon, 29 Jul 2019 09:24:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=ag3607f4rZRHcp8HUBaVypYdYUkemynvgAUvHb2YYs0=;
 b=cTa6HUutdsFxJUHgsniQS2DcXuwLLWJsFjrVZtH8En5C2JGiJZ2b/TGEgzSPi0kJRVQe
 ejdE0EP46/cWqytEhxJasHdNELl3Tty51MdQxdAdKkjBHBsnmDg6ibXRh/jicctJCY1S
 qjVPxUSYrYpx1uct2CopUHWbLjevIw9utzejE0aexuXIky5ooOCUO3YKesuC12yucoPT
 FEKdY8MrsoVBnzRDxtSnyWlmyYUmgVN6MMhRNyOGKDPYCMEnqlqGFKhLIE0bsKYePFzI
 1CAWdNkAHFnNrSHfezPxkIDy1V2pssTGHMOJrYnk385lHt1AcipeBrX+zTd9KetUwU+z 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0ccwanxs-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Jul 2019 09:24:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5051342;
 Mon, 29 Jul 2019 07:24:01 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 332AC56D1;
 Mon, 29 Jul 2019 07:24:01 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 29 Jul
 2019 09:24:00 +0200
To: Olivier MOYSAN <olivier.moysan@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "robh@kernel.org"
 <robh@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <1562327580-19647-1-git-send-email-olivier.moysan@st.com>
 <27476214-07fe-886b-1cab-20902837f29c@st.com>
 <f43b8af7-e2c0-6193-d666-9fa60050e07d@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <f87aaed6-1aa4-fd52-9476-b22f9b122aeb@st.com>
Date: Mon, 29 Jul 2019 09:23:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f43b8af7-e2c0-6193-d666-9fa60050e07d@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-29_04:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add audio codec support
 on stm32mp157a-dk1 board
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

CgpPbiA3LzI1LzE5IDExOjQxIEFNLCBPbGl2aWVyIE1PWVNBTiB3cm90ZToKPiAKPiAKPiBPbiA3
LzI0LzE5IDY6NDAgUE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4+IEhpIE9saXZpZXIKPj4g
Cj4+IE9uIDcvNS8xOSAxOjUzIFBNLCBPbGl2aWVyIE1veXNhbiB3cm90ZToKPj4+IEFkZCBzdXBw
b3J0IG9mIENpcnJ1cyBjczQybDUxIGF1ZGlvIGNvZGVjIG9uIHN0bTMybXAxNTdhLWRrMSBib2Fy
ZC4KPj4+IENvbmZpZ3VyYXRpb24gb3ZlcnZpZXc6Cj4+PiAtIFNBSTJBIGlzIHRoZSBDUFUgaW50
ZXJmYWNlIHVzZWQgZm9yIHRoZSBjb2RlYyBhdWRpbyBwbGF5YmFjawo+Pj4gLSBTQUkyQiBpcyB0
aGUgQ1BVIGludGVyZmFjZSB1c2VkIGZvciB0aGUgY29kZWMgYXVkaW8gcmVjb3JkCj4+PiAtIFNB
STJBIGlzIGNvbmZpZ3VyZWQgYXMgYSBjbG9jayBwcm92aWRlciBmb3IgdGhlIGF1ZGlvIGNvZGVj
Cj4+PiAtIFNBSTJBJkIgYXJlIGNvbmZpZ3VyZWQgYXMgc2xhdmUgb2YgdGhlIGF1ZGlvIGNvZGVj
Cj4+PiAtIFNBSTJBJkIgc2hhcmUgdGhlIHNhbWUgaW50ZXJmYWNlIG9mIHRoZSBhdWRpbyBjb2Rl
Ywo+Pj4KPj4+IE5vdGU6Cj4+PiBJbiBtYXN0ZXIgbW9kZSwgY3M0Mmw1MSBhdWRpbyBjb2RlYyBw
cm92aWRlcyBhIGJpdGNsb2NrCj4+PiBhdCA2NCB4IEZTLCByZWdhcmRsZXNzIG9mIGRhdGEgd2lk
dGguIFRoaXMgbWVhbnMgdGhhdAo+Pj4gc2xvdCB3aWR0aCBpcyBhbHdheXMgMzIgYml0cy4KPj4+
IFNldCBzbG90IHdpZHRoIHRvIDMyIGJpdHMgYW5kIHNsb3QgbnVtYmVyIHRvIDIKPj4+IGluIFNB
STJBJkIgZW5kcG9pbnQgbm9kZXMsIHRvIG1hdGNoIHRoaXMgY29uc3RyYWludC4KPj4+IGRhaS10
ZG0tc2xvdC1udW0gYW5kIGRhaS10ZG0tc2xvdC13aWR0aCBwcm9wZXJ0aWVzIGFyZSB1c2VkIGhl
cmUsCj4+PiBhc3N1bWluZyB0aGF0IGkycyBpcyBhIHNwZWNpYWwgY2FzZSBvZiB0ZG0sIHdoZXJl
IHNsb3QgbnVtYmVyIGlzIDIuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogT2xpdmllciBNb3lzYW4g
PG9saXZpZXIubW95c2FuQHN0LmNvbT4KPj4+IC0tLQo+Pj7CoMKgwqAgYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1N2EtZGsxLmR0cyB8IDg5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4+PsKgwqDCoCAxIGZpbGUgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQo+Pj4KPj4g
Cj4+IC4uLgo+PiAKPj4+ICAgIAo+Pj4gKyZzYWkyIHsKPj4+ICvCoMKgwqAgY2xvY2tzID0gPCZy
Y2MgU0FJMj4sIDwmcmNjIFBMTDNfUT4sIDwmcmNjIFBMTDNfUj47Cj4+PiArwqDCoMKgIGNsb2Nr
LW5hbWVzID0gInBjbGsiLCAieDhrIiwgIngxMWsiOwo+Pj4gK8KgwqDCoCBwaW5jdHJsLW5hbWVz
ID0gImRlZmF1bHQiLCAic2xlZXAiOwo+Pj4gK8KgwqDCoCBwaW5jdHJsLTAgPSA8JnNhaTJhX3Bp
bnNfYT4sIDwmc2FpMmJfcGluc19iPjsKPj4+ICvCoMKgwqAgcGluY3RybC0xID0gPCZzYWkyYV9z
bGVlcF9waW5zX2E+LCA8JnNhaTJiX3NsZWVwX3BpbnNfYj47Cj4+PiArwqDCoMKgIHN0YXR1cyA9
ICJva2F5IjsKPj4+ICsKPj4+ICvCoMKgwqAgc2FpMmE6IGF1ZGlvLWNvbnRyb2xsZXJANDQwMGIw
MDQgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hLW5hbWVzID0gInR4IjsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmcmNjIFNBSTJfSz47Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjbG9jay1uYW1lcyA9ICJzYWlfY2siOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2Fp
MmFfcG9ydDogcG9ydCB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc2FpMmFfZW5kcG9pbnQ6IGVuZHBvaW50IHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVtb3RlLWVuZHBvaW50ID0gPCZjczQy
bDUxX3R4X2VuZHBvaW50PjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9ybWF0ID0gImkycyI7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1jbGstZnMgPSA8MjU2PjsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGFpLXRkbS1zbG90LW51bSA9IDwyPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGFpLXRkbS1zbG90LXdpZHRoID0gPDMyPjsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICvCoMKgwqAgfTsKPj4+ICsKPj4gWW91IGNvdWxkIHVz
ZSBsYWJlbCB0byBvdmVybG9hZCBzYWkyYSBhbmQgc2FpMmIuIG5vID8KPiBJIHByb3Bvc2UgdG8g
a2VlcCBpdCB1bmNoYW5nZWQgZm9yIGJldHRlciByZWFkYWJpbGl0eQo+PiAKCk9rLiBBcHBsaWVk
IG9uIHN0bTMyLW5leHQuCgpSZWdhcmRzCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
