Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6C146530
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 10:55:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74EE3C36B0C;
	Thu, 23 Jan 2020 09:55:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9843FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 09:55:47 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N9qXbi031077; Thu, 23 Jan 2020 10:55:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8LaG/1fNvR/SDka0zlIvY8T8Nf7NU3M6GJ1TJ1wJF/w=;
 b=oNMMVrfqy6wcfIg2N7AFwlkNpdRP1xKhr1GsjnpoE1/k0+5iL7JDB0swwVWMxKq1piI7
 KKY0xj8YQN3xwhL8OCfsLYqe37PLbnBl5IDxT6n79gl4pTSw9YjfLq1Eo6MNdQxfp3K3
 vhcLwJMh7yRypWXrwyLwUmkmWd/Mp0QOlW9luMYSxN+dIygxgjrpMbkmUGiDHmtpX69E
 F8bLiZKBvvyYC9Qk1Wnwd4r2OJ1gPbxeCdbP1sqJ16Cjux1y+FXWl+or98yty4bnrkLX
 0fs1zpypcnPyHeZQr7/vWSiv0Y8JHI8d20ddvJprS6eIA50sXaLXgqRn2kJMd3qtxNXE pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrp2hf1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 10:55:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29CF810002A;
 Thu, 23 Jan 2020 10:55:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1910D220308;
 Thu, 23 Jan 2020 10:55:41 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan
 2020 10:55:40 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 10:55:40 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 TORGUE" <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] drm/bridge/synopsys: dsi: missing post disable
Thread-Index: AQHV0EUIPo4ZhmMZfUasUYZhQS9gRqf39TwA
Date: Thu, 23 Jan 2020 09:55:40 +0000
Message-ID: <c817740e-4d44-c3a2-0229-06c653a8d8d9@st.com>
References: <1579602296-7683-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1579602296-7683-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <B1DCD6E889303F4CA55F3B1DA98A9478@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_01:2020-01-23,
 2020-01-22 signatures=0
Subject: Re: [Linux-stm32] [PATCH] drm/bridge/synopsys: dsi: missing post
	disable
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

RGVhciBZYW5uaWNrLA0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLA0KDQpSZXZpZXdlZC1ieTog
UGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4NCg0KUGhpbGlwcGUgOi0pDQoN
Ck9uIDEvMjEvMjAgMTE6MjQgQU0sIFlhbm5pY2sgRmVydHJlIHdyb3RlOg0KPiBGcm9tOiBZYW5u
aWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gDQo+IFNvbWV0aW1lIHRoZSBw
b3N0X2Rpc2FibGUgZnVuY3Rpb24gaXMgbWlzc2luZyAobm90IHJlZ2lzdGVyZWQpLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8
IDMgKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
bWlwaS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2ku
Yw0KPiBpbmRleCBiMTgzNTFiLi4xMjgyM2FlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+IEBAIC04MjQsNyArODI0LDggQEAgc3Rh
dGljIHZvaWQgZHdfbWlwaV9kc2lfYnJpZGdlX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlKQ0KPiAgIAkgKiBUaGlzIG5lZWRzIHRvIGJlIGZpeGVkIGluIHRoZSBkcm1fYnJp
ZGdlIGZyYW1ld29yayBhbmQgdGhlIEFQSQ0KPiAgIAkgKiBuZWVkcyB0byBiZSB1cGRhdGVkIHRv
IG1hbmFnZSBvdXIgb3duIGNhbGwgY2hhaW5zLi4uDQo+ICAgCSAqLw0KPiAtCWRzaS0+cGFuZWxf
YnJpZGdlLT5mdW5jcy0+cG9zdF9kaXNhYmxlKGRzaS0+cGFuZWxfYnJpZGdlKTsNCj4gKwlpZiAo
ZHNpLT5wYW5lbF9icmlkZ2UtPmZ1bmNzLT5wb3N0X2Rpc2FibGUpDQo+ICsJCWRzaS0+cGFuZWxf
YnJpZGdlLT5mdW5jcy0+cG9zdF9kaXNhYmxlKGRzaS0+cGFuZWxfYnJpZGdlKTsNCj4gICANCj4g
ICAJaWYgKHBoeV9vcHMtPnBvd2VyX29mZikNCj4gICAJCXBoeV9vcHMtPnBvd2VyX29mZihkc2kt
PnBsYXRfZGF0YS0+cHJpdl9kYXRhKTsNCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
