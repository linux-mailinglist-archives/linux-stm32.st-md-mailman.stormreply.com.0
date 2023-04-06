Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B01C06D9626
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 13:45:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68A20C6A61D;
	Thu,  6 Apr 2023 11:45:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E552C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 11:45:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336ATw9q027880; Thu, 6 Apr 2023 13:45:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zT5xwQSUkWp9peu1emk0ObpqbLoHMLcORF6k156EZm8=;
 b=qRBhvsdqeH40V5Oj/NTPYvoKlDy+YMCXJNbxidYNKmNbbeYHUVyQdU79hx+Gr6bdri29
 D1tNkh0AVo4UbwqFRCpPaaJN0vZo3c4RiEtuWUhoZqPKo2z+on/GcEoXl46hDv0J/7Wn
 TgJbGQBGTbDmWLJprY9jobLkY/561TKJeFF3xN3df5MjD50UvsgFJ0fl/ISbBY6co9VW
 UGJK4fqvXCtDpHhZgYTPnwuT6av1DPeEZL0JeqzvdIyVgah8pOR2RUuCAkRsjMY7/1Ff
 UyQocXvQDpRwLfEXEOPjPZe5Im7jaoag8bb3YRrvQfVbcd4XOUkELF301g/nQAN21obQ HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ps5k5gtf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 13:45:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2DF9F10003A;
 Thu,  6 Apr 2023 13:45:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14B6021ED5D;
 Thu,  6 Apr 2023 13:45:01 +0200 (CEST)
Received: from [10.201.21.210] (10.201.21.210) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 6 Apr
 2023 13:44:58 +0200
Message-ID: <059a7da3-31e2-bd45-d640-ad604145acac@foss.st.com>
Date: Thu, 6 Apr 2023 13:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: Yann Gautier <yann.gautier@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Stefan Hansson
 <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
 <7d1b13cb-9588-d4c3-73ac-ac6a5a1dacdf@foss.st.com>
In-Reply-To: <7d1b13cb-9588-d4c3-73ac-ac6a5a1dacdf@foss.st.com>
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_06,2023-04-06_01,2023-02-09_01
Cc: linux-mmc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 00/13] Fix busydetect on Ux500 PL180/MMCI
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

T24gNC82LzIzIDExOjI3LCBZYW5uIEdhdXRpZXIgd3JvdGU6Cj4gT24gNC81LzIzIDA4OjUwLCBM
aW51cyBXYWxsZWlqIHdyb3RlOgo+PiBUaGlzIHNlcmllcyBmaXhlcyBhIHByZXR0eSBzZXJpb3Vz
IHByb2JsZW0gaW4gdGhlIE1NQ0kKPj4gYnVzeSBkZXRlY3QgaGFuZGxpbmcsIGRpc2NvdmVyZWQg
b25seSBhZnRlciBnb2luZyB1cCBhbmQKPj4gZG93biBhIGxhZGRlciBvZiByZWZhY3RvcmluZ3Mu
Cj4+Cj4+IFRoZSBjb2RlIGlzIHdyaXR0ZW4gZXhwZWN0aW5nIHRoZSBVeDUwMCBidXN5IGRldGVj
dAo+PiB0byBmaXJlIHR3byBpbnRlcnJ1cHRzOiBvbmUgYXQgdGhlIHN0YXJ0IG9mIHRoZSBidXN5
Cj4+IHNpZ25hbGxpbmcgYW5kIG9uZSBhdCB0aGUgZW5kIG9mIHRoZSBidXN5IHNpZ25hbGxpbmcu
Cj4+Cj4+IFRoZSByb290IGNhdXNlIG9mIHRoZSBwcm9ibGVtIHNlZW4gb24gc29tZSBkZXZpY2Vz
Cj4+IGlzIHRoYXQgb25seSB0aGUgZmlyc3QgSVJRIGFycml2ZXMsIGFuZCB0aGVuIHRoZSBkZXZp
Y2UKPj4gaGFuZ3MsIHdhaXRpbmcgcGVycGV0dWFsbHkgZm9yIHRoZSBuZXh0IElSUSB0byBhcnJp
dmUuCj4+Cj4+IFRoaXMgaXMgZXZlbnR1YWxseSBzb2x2ZWQgYnkgYWRkaW5nIGEgdGltZW91dCB1
c2luZwo+PiBhIGRlbGF5ZWQgd29yayB0aGF0IGZpcmUgYWZ0ZXIgMTAgbXMgaWYgdGhlIGJ1c3kg
ZGV0ZWN0Cj4+IGhhcyBub3Qgc3RvcHBlZCBhdCB0aGlzIHBvaW50LiAoT3RoZXIgZGVsYXkgc3Bh
bnMgY2FuCj4+IGJlIHN1Z2dlc3RlZC4pIFRoaXMgaXMgdGhlIGxhc3QgcGF0Y2ggaW4gdGhlIHNl
cmllcy4KPj4KPj4gSSBpbmNsdWRlZCB0aGUgcmV3cml0ZSBvZiB0aGUgZW50aXJlIGJ1c3kgZGV0
ZWN0IGxvZ2ljCj4+IHRvIHVzZSBhIHN0YXRlIG1hY2hpbmUgYXMgdGhpcyBtYWtlcyBpdCB3YXkg
ZWFzaWVyIHRvCj4+IGRlYnVnIGFuZCB3aWxsIHByaW50IG1lc3NhZ2VzIGFib3V0IG90aGVyIGVy
cm9yCj4+IGNvbmRpdGlvbnMgYXMgd2VsbC4KPj4KPj4gVGhlIHByb2JsZW0gYWZmZWN0cyBlc3Bl
Y2lhbGx5IHRoZSBTa29tZXIKPj4gKFNhbXN1bmcgR1QtSTkwNzApIGFuZCBLeWxlIChTYW1zdW5n
IFNHSC1JNDA3KS4KPj4KPj4gSXQgaXMgZmluZSB0byBqdXN0IGFwcGx5IHRoaXMgZm9yIHRoZSAt
bmV4dCBrZXJuZWwsCj4+IGRlc3BpdGUgaXQgZml4ZXMgdGhlIGJ1c3kgZGV0ZWN0IHRoYXQgaGFz
IGJlZW4gYnJva2VuCj4+IGZvciB0aGVzZSBkZXZpY2VzIGZvciBhIHdoaWxlLCB3ZSBjYW4gdGhp
bmsgYWJvdXQKPj4gYmFja3BvcnRpbmcgYSBzaW1wbGVyIHZlcnNpb24gb2YgdGhlIHRpbWVvdXQg
Zm9yCj4+IHN0YWJsZSBrZXJuZWxzIGlmIHdlIHdhbnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPj4gLS0tCj4+IExpbnVzIFdh
bGxlaWogKDEzKToKPj4gwqDCoMKgwqDCoMKgIG1tYzogbW1jaTogT25seSBjYWxsIGJ1c3lfY29t
cGxldGUgaWYgY2FsbGJhY2sgZGVmaW5lZAo+PiDCoMKgwqDCoMKgwqAgbW1jOiBtbWNpOiBDbGVh
ciBidXN5X3N0YXR1cyB3aGVuIHN0YXJ0aW5nIGNvbW1hbmQKPj4gwqDCoMKgwqDCoMKgIG1tYzog
bW1jaTogVW53aW5kIGJpZyBpZigpIGNsYXVzZQo+PiDCoMKgwqDCoMKgwqAgbW1jOiBtbWNpOiBT
dGFzaCBzdGF0dXMgd2hpbGUgd2FpdGluZyBmb3IgYnVzeQo+PiDCoMKgwqDCoMKgwqAgbW1jOiBt
bWNpOiBCcmVhayBvdXQgZXJyb3IgY2hlY2sgaW4gYnVzeSBkZXRlY3QKPj4gwqDCoMKgwqDCoMKg
IG1tYzogbW1jaTogTWFrZSBidXN5IGNvbXBsZXRlIHN0YXRlIG1hY2hpbmUgZXhwbGljaXQKPj4g
wqDCoMKgwqDCoMKgIG1tYzogbW1jaTogUmV0cnkgdGhlIGJ1c3kgc3RhcnQgY29uZGl0aW9uCj4+
IMKgwqDCoMKgwqDCoCBtbWM6IG1tY2k6IFVzZSBzdGF0ZSBtYWNoaW5lIHN0YXRlIGFzIGV4aXQg
Y29uZGl0aW9uCj4+IMKgwqDCoMKgwqDCoCBtbWM6IG1tY2k6IFVzZSBhIHN3aXRjaCBzdGF0ZW1l
bnQgbWFjaGluZQo+PiDCoMKgwqDCoMKgwqAgbW1jOiBtbWNpOiBCcmVhayBvdXQgYSBoZWxwZXIg
ZnVuY3Rpb24KPj4gwqDCoMKgwqDCoMKgIG1tYzogbW1jaTogbW1jaV9jYXJkX2J1c3koKSBmcm9t
IHN0YXRlIG1hY2hpbmUKPj4gwqDCoMKgwqDCoMKgIG1tYzogbW1jaTogRHJvcCBlbmQgSVJRIGZy
b20gVXg1MDAgYnVzeWRldGVjdAo+PiDCoMKgwqDCoMKgwqAgbW1jOiBtbWNpOiBBZGQgYnVzeWRl
dGVjdCB0aW1lb3V0Cj4+Cj4+IMKgIGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMTY1IAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0KPj4gwqAgZHJpdmVycy9tbWMvaG9zdC9tbWNpLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDE3ICsrKysKPj4gwqAgZHJpdmVycy9tbWMvaG9zdC9tbWNpX3N0bTMyX3NkbW1jLmMgfMKg
wqAgNiArLQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDE0OSBpbnNlcnRpb25zKCspLCAzOSBkZWxl
dGlvbnMoLSkKPj4gLS0tCj4+IGJhc2UtY29tbWl0OiBmZTE1YzI2ZWUyNmVmYTExNzQxYTdiNjMy
ZTlmMjNiMDFhY2E0Y2M2Cj4+IGNoYW5nZS1pZDogMjAyMzA0MDUtcGwxODAtYnVzeWRldGVjdC1m
aXgtNjZhMDM2MGQzOThhCj4+Cj4+IEJlc3QgcmVnYXJkcywKPiAKPiBIaSBMaW51cywKPiAKPiBX
aXRoIHRoaXMgc2VyaWVzLCBpdCBpcyBubyBtb3JlIHBvc3NpYmxlIHRvIHN3aXRjaCB0byBVSFMg
bW9kZXMgb24gCj4gU1RNMzJNUDEuIEkgd2lsbCBhZGQgc29tZSB0cmFjZXMgYW5kIHRyeSB0byBz
ZWUgd2hhdCdzIHdyb25nIG9yIG1pc3NpbmcgCj4gdG8gaGF2ZSBpdCB3b3JraW5nIGFnYWluLgo+
IEkndmUgdGVzdGVkIG9uIFNUTTMyTVAxNTdGLUVWMSBib2FyZCBhbmQgZ290IHRob3NlIHRyYWNl
czoKPiBbwqDCoMKgIDMuMTg2NTA0XSBtbWMwOiBTa2lwcGluZyB2b2x0YWdlIHN3aXRjaAo+IFvC
oMKgwqAgMy4zMDIxNzBdIG1tYzA6IG5ldyBoaWdoIHNwZWVkIFNESEMgY2FyZCBhdCBhZGRyZXNz
IGFhYWEKPiAKPiBXaGVyZWFzIHdpdGggdGhlIHByZXZpb3VzIHZlcnNpb24gSSBoYWQ6Cj4gW8Kg
wqDCoCAxLjg4MjA4NF0gbW1jMDogbmV3IHVsdHJhIGhpZ2ggc3BlZWQgRERSNTAgU0RIQyBjYXJk
IGF0IGFkZHJlc3MgYWFhYQo+IFvCoMKgwqAgMS44OTkxNDJdIG1tY2JsazA6IG1tYzA6YWFhYSBT
QzE2RyAxNC44IEdpQgo+IAo+IE9uIFNUTTMyTVAxMyB0aGF0IGNhbiBkbyBTRFIxMDQgKHRlc3Rl
ZCBvbiBhbiBpbnRlcm5hbCBib2FyZCksIGl0IGZhaWxzIAo+IHRvIGluaXRpYWxpemVkIHRoZSBj
YXJkOgo+IFvCoMKgwqAgMy4xOTQwNzJdIG1tYzA6IGVycm9yIC0xMTAgd2hpbHN0IGluaXRpYWxp
c2luZyBTRCBjYXJkCj4gCj4gV2hlbiBhZGRpbmcgc29tZSBkeW5hbWljIGRlYnVnIHRyYWNlcywg
SSBjYW4gc2VlIHRoaXMgaW4gdGhlIHRyYWNlOgo+IFvCoMKgIDc4LjAzOTY0OF0gbW1jMDogU2ln
bmFsIHZvbHRhZ2Ugc3dpdGNoIGZhaWxlZCwgcG93ZXIgY3ljbGluZyBjYXJkCj4gCj4gSSdsbCB0
cnkgdG8gYWRkIG1vcmUgdHJhY2VzIHRvIHNlZSB3aGF0IGhhcHBlbnMgZXhhY3RseS4KPiAKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gWWFubgoKCkhpLAoKVGhlIGlzc3VlIG9jY3VycyBpbiAgbW1jX3Nl
dF91aHNfdm9sdGFnZSgpLCB3aGVuIGNhbGxpbmcgCmhvc3QtPm9wcy0+Y2FyZF9idXN5KCksIHdo
aWNoIGlzIG1tY2lfY2FyZF9idXN5KCkgZm9yIHRoaXMgZHJpdmVyLgpJdCBpcyBleHBlY3RlZCBo
ZXJlIHRvIHJldHVybiBidXN5IGFmdGVyIHRoZSBTRF9TV0lUQ0hfVk9MVEFHRSAoQ01EMTEpLApi
dXQgaG9zdC0+YnVzeV9zdGF0ZSA9IDAgaW4gbW1jaV9jYXJkX2J1c3koKSwgc28gaXQgcmV0dXJu
IDAuCgpBIHBvc3NpYmxlIGNvcnJlY3Rpb24sIGJ1dCB0aGF0IG1heSBicmVhayB3aGF0IHlvdSd2
ZSBkb25lLCBjb3VsZCBiZToKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21tY2kuYyBi
L2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5jCmluZGV4IDNmZjY2NTVhNTZkMS4uMDA2ZmQ4NDA5MGFj
IDEwMDY0NAotLS0gYS9kcml2ZXJzL21tYy9ob3N0L21tY2kuYworKysgYi9kcml2ZXJzL21tYy9o
b3N0L21tY2kuYwpAQCAtMzQwLDEzICszNDAsMTAgQEAgc3RhdGljIGludCBtbWNpX2NhcmRfYnVz
eShzdHJ1Y3QgbW1jX2hvc3QgKm1tYykKICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKICAg
ICAgICAgaW50IGJ1c3kgPSAwOwoKLSAgICAgICBpZiAoaG9zdC0+b3BzLT5idXN5X2NvbXBsZXRl
KSB7Ci0gICAgICAgICAgICAgICBpZiAoKGhvc3QtPmJ1c3lfc3RhdGUgPT0gTU1DSV9CVVNZX0lE
TEUpIHx8Ci0gICAgICAgICAgICAgICAgICAgKGhvc3QtPmJ1c3lfc3RhdGUgPT0gTU1DSV9CVVNZ
X0RPTkUpKQotICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKLSAgICAgICAgICAgICAg
IGVsc2UKLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7Ci0gICAgICAgfQorICAgICAg
IGlmIChob3N0LT5vcHMtPmJ1c3lfY29tcGxldGUgJiYKKyAgICAgICAgICAgaG9zdC0+YnVzeV9z
dGF0ZSAhPSBNTUNJX0JVU1lfSURMRSAmJgorICAgICAgICAgICBob3N0LT5idXN5X3N0YXRlICE9
IE1NQ0lfQlVTWV9ET05FKQorICAgICAgICAgICAgICAgcmV0dXJuIDE7CgogICAgICAgICBzcGlu
X2xvY2tfaXJxc2F2ZSgmaG9zdC0+bG9jaywgZmxhZ3MpOwoKClRoZSBTRC1jYXJkIGlzIG5vdyBw
cm9wZXJseSBkZXRlY3RlZCAoYW5kIGluIFNEUjEwNCBtb2RlKSBvbiBTVE0zMk1QMTMgCmJvYXJk
LgoKCkJlc3QgcmVnYXJkcywKWWFubgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
