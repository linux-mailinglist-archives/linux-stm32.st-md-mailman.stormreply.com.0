Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DFACE619
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 16:53:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A83EC36B0C;
	Mon,  7 Oct 2019 14:53:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 866C6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 14:53:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97Eke9C003277; Mon, 7 Oct 2019 16:53:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BHdMjWZVBOApScvksxR8joV5keqKZpJ60rXE2ibEO8g=;
 b=fpejq/z7supoEWxe+slx8u6VsoOpWCsVfD19jaAqZhI0pGQbGv+uJOtfLP7w1ByISxdX
 CYK7sCHsQVt2L31c2fYrKMxsnwZkc5uqOwdxtWgmUwK4BOb+whM+iCemw6GeF4p6MVWk
 IXbLeZ59vIWWv/VQE9UIHvcuEaZF8D9W7TowMUWX7m7dLpCMq1WbpTZPTk/6EyEwci6u
 Y2UjuqSbPnsaON8A9D+I9S8LNdbmRJbtGk4kPlB31EpsXVzBf669j3K+9gHsp4WsF/pI
 5/5T32y1goOidFIYn5kiV9QGm+44s5OKMQa5D1xGw4nwtE0FwzFpIUw1UpYMsCuzbzjp vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vegaguahy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 16:53:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83456100034;
 Mon,  7 Oct 2019 16:53:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76D982ACFE5;
 Mon,  7 Oct 2019 16:53:10 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 7 Oct
 2019 16:53:09 +0200
To: Linus Walleij <linus.walleij@linaro.org>
References: <20191004122923.22674-1-amelie.delaunay@st.com>
 <CACRpkda6CyYCt-s-VkaK856Jt3TxQg+HVDz-5Ww9T9KNHHAjaQ@mail.gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <8eb2090a-e50e-2e4f-982b-073ad24e553c@st.com>
Date: Mon, 7 Oct 2019 16:53:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda6CyYCt-s-VkaK856Jt3TxQg+HVDz-5Ww9T9KNHHAjaQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] pinctrl: stmfx: add
 irq_request/release_resources callbacks
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

SGkgTGludXMsCgpPbiAxMC81LzE5IDY6NDkgUE0sIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gT24g
RnJpLCBPY3QgNCwgMjAxOSBhdCAyOjI5IFBNIEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1
bmF5QHN0LmNvbT4gCj4gd3JvdGU6Cj4gCj4+IFdoZW4gYW4gU1RNRlggSU8gaXMgdXNlZCBhcyBp
bnRlcnJ1cHQgdGhyb3VnaCB0aGUgaW50ZXJydXB0LWNvbnRyb2xsZXIKPj4gYmluZGluZywgdGhl
IFNUTUZYIGRyaXZlciBzaG91bGQgY29uZmlndXJlIHRoaXMgSU8gYXMgaW5wdXQuIERlZmF1bHQK
Pj4gdmFsdWUgb2YgU1RNRlggSU8gZGlyZWN0aW9uIGlzIGlucHV0LCBidXQgaWYgdGhlIElPIGlz
IHVzZWQgYXMgb3V0cHV0Cj4+IGJlZm9yZSB0aGUgaW50ZXJydXB0IHVzZSwgaXQgd2lsbCBub3Qg
d29yayB3aXRob3V0IHRoZXNlIGNhbGxiYWNrcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW1lbGll
IERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAc3QuY29tPgo+IAo+IE9LIEkgc2VlIHdoYXQgeW91
IHdhbnQgdG8gYWNoaWV2ZS4KPiAKPj4gK3N0YXRpYyBpbnQgc3RtZnhfZ3Bpb19pcnFfcmVxdWVz
dF9yZXNvdXJjZXMoc3RydWN0IGlycV9kYXRhICpkYXRhKQo+PiArewo+PiArwqDCoMKgwqDCoMKg
IHN0cnVjdCBncGlvX2NoaXAgKmdwaW9fY2hpcCA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRh
KGRhdGEpOwo+PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBzdG1meF9waW5jdHJsICpwY3RsID0gZ3Bp
b2NoaXBfZ2V0X2RhdGEoZ3Bpb19jaGlwKTsKPj4gK8KgwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiAr
Cj4+ICvCoMKgwqDCoMKgwqAgcmV0ID0gc3RtZnhfZ3Bpb19kaXJlY3Rpb25faW5wdXQoJnBjdGwt
PmdwaW9fY2hpcCwgZGF0YS0+aHdpcnEpOwo+PiArwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICsKPj4gK8KgwqDCoMKg
wqDCoCByZXQgPSBncGlvY2hpcF9sb2NrX2FzX2lycSgmcGN0bC0+Z3Bpb19jaGlwLCBkYXRhLT5o
d2lycSk7Cj4+ICvCoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZXZfZXJyKHBjdGwtPmRldiwgIlVuYWJsZSB0byBsb2NrIGdwaW8gJWx1IGFz
IElSUTogJWRcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkYXRhLT5od2lycSwgcmV0KTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHJldDsKPj4gK8KgwqDCoMKgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCByZXR1
cm4gMDsKPj4gK30KPiAKPiBKdXN0IGNhbGwgZ3Bpb2NoaXBfcmVxcmVzX2lycSgpIGluc3RlYWQg
b2YgY2FsbGluZyB0aGUgbG9jayBldGMKPiBleHBsaWNpdGx5Lgo+IAo+PiArc3RhdGljIHZvaWQg
c3RtZnhfZ3Bpb19pcnFfcmVsZWFzZV9yZXNvdXJjZXMoc3RydWN0IGlycV9kYXRhICpkYXRhKQo+
PiArewo+PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBncGlvX2NoaXAgKmdwaW9fY2hpcCA9IGlycV9k
YXRhX2dldF9pcnFfY2hpcF9kYXRhKGRhdGEpOwo+PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBzdG1m
eF9waW5jdHJsICpwY3RsID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ3Bpb19jaGlwKTsKPj4gKwo+PiAr
wqDCoMKgwqDCoMKgIGdwaW9jaGlwX3VubG9ja19hc19pcnEoJnBjdGwtPmdwaW9fY2hpcCwgZGF0
YS0+aHdpcnEpOwo+PiArfQo+IAo+IEp1c3QgY2FsbCBncGlvY2hpcF9yZWxyZXNfaXJxKCkKPiAK
PiBCdXQgYWxsIHRoaXMgZHVwbGljYXRlZCBhIGxvdCBvZiBjb2RlIGZyb20gdGhlIGNvcmUgd2hp
Y2ggaXMgbm90IHNvIG5pY2UuCj4gCj4+IEBAIC02NzgsNiArNzA2LDggQEAgc3RhdGljIGludCBz
dG1meF9waW5jdHJsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+wqDCoMKg
wqDCoMKgwqDCoCBwY3RsLT5pcnFfY2hpcC5pcnFfc2V0X3R5cGUgPSBzdG1meF9waW5jdHJsX2ly
cV9zZXRfdHlwZTsKPj7CoMKgwqDCoMKgwqDCoMKgIHBjdGwtPmlycV9jaGlwLmlycV9idXNfbG9j
ayA9IHN0bWZ4X3BpbmN0cmxfaXJxX2J1c19sb2NrOwo+PsKgwqDCoMKgwqDCoMKgwqAgcGN0bC0+
aXJxX2NoaXAuaXJxX2J1c19zeW5jX3VubG9jayA9IHN0bWZ4X3BpbmN0cmxfaXJxX2J1c19zeW5j
X3VubG9jazsKPj4gK8KgwqDCoMKgwqDCoCBwY3RsLT5pcnFfY2hpcC5pcnFfcmVxdWVzdF9yZXNv
dXJjZXMgPSBzdG1meF9ncGlvX2lycV9yZXF1ZXN0X3Jlc291cmNlczsKPj4gK8KgwqDCoMKgwqDC
oCBwY3RsLT5pcnFfY2hpcC5pcnFfcmVsZWFzZV9yZXNvdXJjZXMgPSBzdG1meF9ncGlvX2lycV9y
ZWxlYXNlX3Jlc291cmNlczsKPiAKPiBXaGF0IGFib3V0IGp1c3QgYWRkaW5nCj4gCj4gcGN0bC0+
aXJxX2NoaXAuaXJxX2VuYWJsZSBhbmQgZG8gc3RtZnhfZ3Bpb19kaXJlY3Rpb25faW5wdXQoKQo+
IGluIHRoYXQgY2FsbGJhY2sgaW5zdGVhZD8gZ3Bpb2xpYiB3aWxsIGhlbHBmdWxseSB3cmFwIGl0
LgoKVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dCB0byBtZS4KCkkgY2FuJ3QgdXNlIC5pcnFf
ZW5hYmxlIGJlY2F1c2Ugb2YgSTJDIHRyYW5zZmVyIHRvIHNldCBncGlvIGRpcmVjdGlvbiAKKHNj
aGVkdWxpbmcgd2hpbGUgYXRvbWljIEJVRyBvY2N1cnMgaW4gdGhpcyBjYXNlKS4gSW5kZWVkLCAu
aXJxX2VuYWJsZSAKaXMgY2FsbGVkIHVuZGVyIHJhd19zcGluX2xvY2tfaXJxc2F2ZSBpbiBfX3Nl
dHVwX2lycSgpIHdoaWxlIAppcnFfcmVxdWVzdF9yZXNvdXJjZXMgaXMgY2FsbGVkIGJlZm9yZS4K
CkkgY291bGQgYXBwbHkgZ3BpbyBkaXJlY3Rpb24gaW4gc3RtZnhfcGluY3RybF9pcnFfYnVzX3N5
bmNfdW5sb2NrIApkZXBlbmRpbmcgb24gcGN0bC0+aXJxX2dwaV9zcmNbXSAoY2hlY2tpbmcgd2hp
Y2ggb25lIGlzIHNldCwgdG8gc2V0IAppbnB1dCBkaXJlY3Rpb24pLCBidXQgdGhpcyB3aWxsIGJl
IGFwcGxpZWQgZWFjaCB0aW1lIGEgY29uc3VtZXIgcmVxdWVzdHMgCmEgc3RtZnggZ3BpbyBpcnEu
CgpJTUhPLCBrZWVwaW5nIC5pcnFfcmVxdWVzdC9yZWxlYXNlX3Jlc291cmNlcyBjYWxsYmFja3Mg
YW5kIHVzaW5nIApncGlvY2hpcF9yZXFyZXNfaXJxKCkvZ3Bpb2NoaXBfcmVscmVzX2lycSgpIHNl
ZW1zIHRvIGJlIHRoZSBiZXN0IGNvbXByb21pc2UuCgpSZWdhcmRzLApBbWVsaWUKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
