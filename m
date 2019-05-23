Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E451927F2F
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 16:11:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91332CCB9D9
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 14:11:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80D8CCCB9D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 14:11:39 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4NE5jjk005074; Thu, 23 May 2019 16:11:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Bn0iz+tF/GtBv/wF0WfrXOWDGayct1EsCY0uvVuAAio=;
 b=foDBrFtMiEpQ4S191xrSp76m77Dycn3qTuxkYSsyrsxWzOjBws7kfFD2eGy7ZXm0JkF/
 8rES42SfBfNvk5gbWOdx0crWSpHgnsIi9EsXMiRpDrDy198KPXGZXSI2oM5Kl6j/gXOm
 kWHDQguFJF1JhQs4QAKcKDYU1JHuYJGeXHzbxwUeMK2m13mv/lWXUzDyg2GmzhGTvhwC
 lquiqMeJ+8R4cFk5rlQY+cSZv+qr1jt9H5zGBM3GBS9VeHgglBtvlzbe77RpdKQHcbME
 L9jCMT6j5SkwgeoHiRBF5soBrzvd6XlzZxoCaM0OoUuWwyhnNr8RAFuGKfsB36u7I5vw fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2snrve1myv-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 23 May 2019 16:11:13 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94D2638;
 Thu, 23 May 2019 14:11:12 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAD212CA5;
 Thu, 23 May 2019 14:11:11 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 May
 2019 16:11:11 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Thu, 23 May 2019 16:11:11 +0200
From: Amelie DELAUNAY <amelie.delaunay@st.com>
To: Linus Walleij <linus.walleij@linaro.org>
Thread-Topic: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Thread-Index: AQHVDuDxK6HzwnJUFE6SYGi4rooWzqZ2hLKAgAAnAgCAAAlUgIAACtCAgADRIYCAARFPAA==
Date: Thu, 23 May 2019 14:11:11 +0000
Message-ID: <08ea97544018430caf53af36677902b7@SFHDAG3NODE2.st.com>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell> <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell> <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
 <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
In-Reply-To: <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
fcc: imap://frq92262@localhost/Sent
x-mozilla-draft-info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=4
x-account-key: account1
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-identity-key: id1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <7D90F5DB4CC7194687CC2E9A6A3EEA8F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-23_12:, , signatures=0
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "kbuild-all@01.org" <kbuild-all@01.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stmfx: Fix compile issue when
 CONFIG_OF_GPIO is not defined
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

T24gNS8yMi8xOSAxMTo0OCBQTSwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gT24gV2VkLCBNYXkg
MjIsIDIwMTkgYXQgMTE6MjEgQU0gQW1lbGllIERFTEFVTkFZIDxhbWVsaWUuZGVsYXVuYXlAc3Qu
Y29tPiB3cm90ZToNCj4gDQo+PiAuLi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jOjQw
OToyMDogZXJyb3I6DQo+PiDigJhwaW5jb25mX2dlbmVyaWNfZHRfbm9kZV90b19tYXBfcGlu4oCZ
IHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24pDQo+PiAgICAgLmR0X25vZGVfdG9f
bWFwID0gcGluY29uZl9nZW5lcmljX2R0X25vZGVfdG9fbWFwX3BpbiwNCj4+DQo+PiBPRl9HUElP
IGRlcGVuZHMgb24gT0YuDQo+Pg0KPj4gU28gZWl0aGVyDQo+PiAgICAgICBkZXBlbmRzIG9uIE9G
IHx8IChPRiAmJiBDT01QSUxFX1RFU1QpDQo+PiBvcg0KPj4gICAgICAgZGVwZW5kcyBvbiBPRiB8
fCAoT0ZfR1BJTyAmJiBDT01QSUxFX1RFU1QpDQo+Pg0KPj4gYW5kDQo+Pg0KPj4gICAgICAgc2Vs
ZWN0IE9GX0dQSU8NCj4gDQo+IEkgd291bGQgdXNlIGp1c3Q6DQo+IA0KPiBkZXBlbmRzIG9uIE9G
X0dQSU8NCj4gDQo+IEJlY2F1c2UgT0ZfR1BJTyBhbHJlYWR5IGRlcGVuZHMgb24gT0YsIGFuZA0K
PiBjb21waWxlIHRlc3RzIHdpbGwgbm90IHdvcmsgd2l0aG91dCBPRl9HUElPIHdoaWNoDQo+IHJl
cXVpcmUgT0Ygc28uLi4NCj4gDQo+IEJlc2lkZXMgaXQgaXMgd2hhdCBtb3N0IG90aGVyIEdQSU8g
ZHJpdmVycyBkby4NCj4gDQo+IFNvIGp1c3Qga2VlcCB0aGF0IG9uZSBsaW5lIGFuZCBkcm9wIHRo
ZSByZXN0Lg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCj4gDQoNCk9rIHNvIEkgY2Fu
IGdldCByaWQgb2YgQ09NUElMRV9URVNUID8NCglkZXBlbmRzIG9uIEkyQw0KCWRlcGVuZHMgb24g
T0ZfR1BJTw0KCXNlbGVjdCBHRU5FUklDX1BJTkNPTkYNCglzZWxlY3QgR1BJT0xJQl9JUlFDSElQ
DQoJc2VsZWN0IE1GRF9TVE1GWA0KDQpCZWNhdXNlIEkndmUgbm8gYXJjaCB0byBiYWxhbmNlIENP
TVBJTEVfVEVTVC4gT3IgbWF5YmUgc29tZXRoaW5nIGxpa2UgDQoJZGVwZW5kcyBvbiBPRl9HUElP
ICYmIChPRiB8fCBDT01QSUxFX1RFU1QpDQpldmVuIGlmIE9GX0dQSU8gJiYgT0YgaXMgcmVkdW5k
YW50ID8NCg0KUmVnYXJkcywNCkFtZWxpZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
