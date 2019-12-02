Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B58F10EABB
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2019 14:22:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B02C1C36B0B;
	Mon,  2 Dec 2019 13:22:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54DFDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2019 13:22:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB2DCk8P026461; Mon, 2 Dec 2019 14:22:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=e/Togba5U9ys+8oqJTXGaZUdpDWn0rAPQUQJmgN0SO0=;
 b=xjiDFUmNL8x0aNlPPh4I+U6OGwFIwBLTXy6g0AQPbagKm2qGswk+2ggHTZ2a8UsUtb2X
 nAwm5FaCrwh03iIfMRdTlMS+fKf56ZAGPa8pmTSlv7f0P5Ky74GRGah5on0gmZ6vkJaG
 YNzx7Pu0ZPcI5XBoyZIfU6vFtAMwT2du5F9PP6n2K6wBNjYrYLhruXTtK29hn1eRnYlI
 OOHhzEoCQQyzQF96dDgN8NZhdt4kb4PqggrM+TmjmefeL1rhydNdHGZHnsyx24umUg3y
 iacc5eHs9dIUDtYBNshxOjf6Gx9b3o+1ADV1BOgFYlzdK/fHZ3oqLNFsT83KvgjOLISk fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkg6k9qtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2019 14:22:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F43A100039;
 Mon,  2 Dec 2019 14:22:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BEF42C9D9B;
 Mon,  2 Dec 2019 14:22:15 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Dec
 2019 14:22:14 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Mon, 2 Dec 2019 14:22:14 +0100
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Marc Zyngier <maz@kernel.org>, Daode Huang <huangdaode@hisilicon.com>
Thread-Topic: [PATCH] irqchip/stm32: Fix "WARNING: invalid free of devm_
 allocated
Thread-Index: AQHVqRODxV7lpFAqyU+rnFWM+DebYg==
Date: Mon, 2 Dec 2019 13:22:14 +0000
Message-ID: <d7a90e49-b847-7fad-d11c-5969050e8d12@st.com>
References: <1574931880-168682-1-git-send-email-huangdaode@hisilicon.com>
 <8acaa494701c91b8a8acd60a2390d810@www.loen.fr>
 <028744c349410eb1f74b7e2b18590c75@www.loen.fr>
In-Reply-To: <028744c349410eb1f74b7e2b18590c75@www.loen.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <D0A2F87ABFC4674D83462422A4D8618F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_02:2019-11-29,2019-12-02 signatures=0
Cc: "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] irqchip/stm32: Fix "WARNING: invalid free
 of devm_ allocated
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

SGkgRGFvZGUsDQoNCg0KSSBjb25maXJtIHRoYXQgdGhpcyBwYXRjaCBpcyBub3QgYSBnb29kIGlk
ZWEsIGhlcmUgYXJlIHNvbWUgZXhwbGFuYXRpb25zLg0KDQppcnEtc3RtMzItZXh0aS5jIGRlYWxz
IHdpdGggdHdvIGRpZmZlcmVudCBwdXJwb3NlczoNCg0KLSBlaXRoZXIgaXQgaXMgdXNlZCB0byBw
cm9iZSB0aGUgInN0LHN0bTMybXAxLWV4dGkiIGNvbXBhdGlibGUgZGV2aWNlLiANCkluIHRoYXQg
Y2FzZSAucHJvYmUoKSBpcyBpbnZva2VkIGFuZCB1c2VzIGRldm1fa3phbGxvYygpIHRvIGdldCBt
ZW1vcnkuIA0KTm8gbmVlZCB0byBmcmVlIG1lbW9yeS4NCg0KLWVpdGhlciBpcyBpdCB1c2VkIGZv
ciBvdGhlciBzdG0zMiBkZXZpY2VzLiBJbiB0aGF0IGNhc2UsIHRoZXJlIGlzIG5vIA0KcHJvYmUg
ZnVuY3Rpb24sIHRoZSBkcml2ZXIgaXMgJ2p1c3QnIGluaXQnZWQuIEluIHRoYXQgY2FzZSwgDQpk
ZXZtX2t6YWxsb2MoKSBpcyBub3QgdXNlZCBhbmQgZXhwbGljaXQgZnJlZSBtZW1vcnkgaXMgcmVx
dWlyZWQuDQoNCkFzIHNhaWQgYnkgTWFyaywgeW91IGhhdmUganVzdCBtaXhlZCB0aGUgdHdvIHBh
dGhzLg0KDQpGYWJpZW4NCg0KDQoNCk9uIDAyLzEyLzIwMTkgMTo0MCBQTSwgTWFyYyBaeW5naWVy
IHdyb3RlOg0KPiBPbiAyMDE5LTEyLTAyIDEyOjI5LCBNYXJjIFp5bmdpZXIgd3JvdGU6DQo+PiBP
biAyMDE5LTExLTI4IDA5OjA0LCBEYW9kZSBIdWFuZyB3cm90ZToNCj4+PiBTaW5jZSBkZXZtXyBh
bGxvY2F0ZWQgZGF0YSBjYW4gYmUgYXV0b21haXRjYWxseSByZWxlYXNlZCwgaXQncyBubw0KPj4+
IG5lZWQgdG8gZnJlZSBpdCBhcHBhcmVudGx5LCBqdXN0IHJlbW92ZSBpdC4NCj4+Pg0KPj4+IEZp
eGVzOiBjZmJmOWU0OTcwOTQgKCJpcnFjaGlwL3N0bTMyOiBVc2UgYSBwbGF0Zm9ybSBkcml2ZXIg
Zm9yDQo+Pj4gc3RtMzJtcDEtZXh0aSBkZXZpY2UiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IERhb2Rl
IEh1YW5nIDxodWFuZ2Rhb2RlQGhpc2lsaWNvbi5jb20+DQo+Pj4gLS0tDQo+Pj4gwqBkcml2ZXJz
L2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYyB8IDIgLS0NCj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
c3RtMzItZXh0aS5jDQo+Pj4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYw0KPj4+
IGluZGV4IGUwMGYyZmEuLjQ2ZWMwYWYgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9pcnFjaGlw
L2lycS1zdG0zMi1leHRpLmMNCj4+PiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4
dGkuYw0KPj4+IEBAIC03NzksOCArNzc5LDYgQEAgc3RhdGljIGludCBfX2luaXQgc3RtMzJfZXh0
aV9pbml0KGNvbnN0IHN0cnVjdA0KPj4+IHN0bTMyX2V4dGlfZHJ2X2RhdGEgKmRydl9kYXRhLA0K
Pj4+IMKgwqDCoMKgIGlycV9kb21haW5fcmVtb3ZlKGRvbWFpbik7DQo+Pj4gwqBvdXRfdW5tYXA6
DQo+Pj4gwqDCoMKgwqAgaW91bm1hcChob3N0X2RhdGEtPmJhc2UpOw0KPj4+IC3CoMKgwqAga2Zy
ZWUoaG9zdF9kYXRhLT5jaGlwc19kYXRhKTsNCj4+PiAtwqDCoMKgIGtmcmVlKGhvc3RfZGF0YSk7
DQo+Pj4gwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+PiDCoH0NCj4+DQo+PiBBcHBsaWVkLCB0aGFu
a3MuDQo+DQo+IFNjcmF0Y2ggdGhhdC4gVGhpcyBwYXRjaCBpcyBqdXN0IHdyb25nLCBhbmQganVz
dCByZWFkaW5nIHRoZSBjb2RlDQo+IG1ha2VzIGl0IG9idmlvdXMuIHN0bTMyX2V4dGlfaW5pdCgp
IGlzIG9ubHkgY2FsbGVkIG9uIHBhdGhzDQo+IHRoYXQgYWxsb2NhdGUgdGhlIG1lbW9yeSB3aXRo
IGttYWxsb2MuDQo+DQo+IENsZWFybHkgeW91IGhhdmVuJ3QgdHJpZWQgdG8gdW5kZXJzdGFuZCB3
aGF0IGlzIGdvaW5nIG9uLg0KPg0KPiDCoMKgwqDCoMKgwqDCoCBNLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
