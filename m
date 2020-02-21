Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B176168265
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2020 16:55:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D7BAC36B0B;
	Fri, 21 Feb 2020 15:55:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51D60C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2020 15:55:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LFhAUN005224; Fri, 21 Feb 2020 16:54:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ROT/iOnqrfVSU9ijMpaQxfKfuAyFkTIabMfISg7FtfU=;
 b=jYGxGa9j/+XAP2+y41QpABkqTrowJtuZQyejHh2XeJPqio5sbPSNKrq7RXTksUw/w61J
 bvJIl3pI2htB7ykpduKO8XZTNzjfn26vK6tAYAmV8MY6SjbY0/FOessi0qSytIlPbSO1
 9vwLamnm7ZDFiabh0Zor9eWPuZkH79g9AkcAgI+IcPuSQsOVD64CqAG7nvlq/Q/+kpQk
 QCrivJ91JhTcpwoxDvsZI6rMb2H4XibBMUJiGKOj3jDQH4KcsvqZQLyERXrk5Or+D5bg
 G0/4nnvdpYL/u1VXwzAoBOEO9bVmZyPAlQODkhT19v4MFe8Wp9LNtlXtdL6Ns0TeVPdv Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y8uag090q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 16:54:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A1B71100034;
 Fri, 21 Feb 2020 16:54:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 794412BC7C1;
 Fri, 21 Feb 2020 16:54:51 +0100 (CET)
Received: from SFHDAG3NODE1.st.com (10.75.127.7) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 21 Feb
 2020 16:54:51 +0100
Received: from SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86]) by
 SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86%20]) with mapi id
 15.00.1473.003; Fri, 21 Feb 2020 16:54:51 +0100
From: Erwan LE RAY <erwan.leray@st.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Thread-Topic: [PATCH v3 0/4] STM32 early console
Thread-Index: AQHV2prax5EEBcSNuEGO1gU2i+LKNqgJeEAAgBxgRQA=
Date: Fri, 21 Feb 2020 15:54:51 +0000
Message-ID: <889ce6c3-bcce-c0fa-69fd-3a05f6e44973@st.com>
References: <20200203140425.26579-1-erwan.leray@st.com>
 <CAJiuCcfRuHXajo7+cDMpQ73vhGuerW3_ObrfG0YOEzogKaH-sA@mail.gmail.com>
In-Reply-To: <CAJiuCcfRuHXajo7+cDMpQ73vhGuerW3_ObrfG0YOEzogKaH-sA@mail.gmail.com>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <22961633DE64E3408A1C412FCA67F660@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_05:2020-02-21,
 2020-02-21 signatures=0
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gerald BAEZA <gerald.baeza@st.com>, Olof Johansson <olof@lixom.net>,
 Nathan Huckleberry <nhuck15@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/4] STM32 early console
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

SGkgUnVzc2VsLCBNYXgsIEFsZXgsIEFybmQsIExpbnVzIGFuZCBPbG9mLA0KDQpHZW50bGUgcmVt
aW5kZXIuDQoNCkNhbiB5b3UgcGxlYXNlIHByb3ZpZGUgeW91ciBmZWVkYmFjayBvbiB0aGlzIHNl
cmllcyA/DQoNCkJlc3QgUmVnYXJkcywgRXJ3YW4uDQoNCg0KT24gMi8zLzIwIDM6MzUgUE0sIENs
w6ltZW50IFDDqXJvbiB3cm90ZToNCj4gSGkgRXJ3YW4sDQo+DQo+IE9uIE1vbiwgMyBGZWIgMjAy
MCBhdCAxNTowNCwgRXJ3YW4gTGUgUmF5IDxlcndhbi5sZXJheUBzdC5jb20+IHdyb3RlOg0KPj4g
QWRkIFVBUlQgaW5zdGFuY2UgY29uZmlndXJhdGlvbiB0byBTVE0zMiBGNCBhbmQgRjcgZWFybHkg
Y29uc29sZS4NCj4+IEFkZCBTVE0zMiBINyBhbmQgTVAxIGVhcmx5IGNvbnNvbGUgc3VwcG9ydC4N
Cj4+DQo+PiBDaGFuZ2VzIGluIHYzOg0KPj4gLSBmaXggYSBtaXNzaW5nIGNvbmRpdGlvbiBmb3Ig
U1RNMzJNUDENCj4+DQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBzcGxpdCAiW1BBVENIXSBBUk06
IGRlYnVnOiBzdG0zMjogYWRkIFVBUlQgZWFybHkgY29uc29sZSBjb25maWd1cmF0aW9uIg0KPj4g
ICAgaW50byBzZXBhcmF0ZSBwYXRjaGVzIGFzIHN1Z2dlc3RlZCBieSBDbGVtZW50IGludG8gWzFd
DQo+IFRoYW5rcyBmb3Igc3BsaXR0aW5nIHRoZSBwYXRjaCwgdGhlIHdob2xlIHNlcmllcyBsb29r
cyBmaW5lIHRvIG1lLg0KPg0KPiBBY2tlZC1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVt
QGdtYWlsLmNvbT4NCj4NCj4gQ2zDqW1lbnQNCj4NCj4NCj4NCj4+IFsxXSBodHRwczovL2xrbWwu
b3JnL2xrbWwvMjAxOS80LzEwLzE5OQ0KPj4NCj4+IEVyd2FuIExlIFJheSAoNCk6DQo+PiAgICBB
Uk06IGRlYnVnOiBzdG0zMjogYWRkIFVBUlQgZWFybHkgY29uc29sZSBjb25maWd1cmF0aW9uIGZv
ciBTVE0zMkY0DQo+PiAgICBBUk06IGRlYnVnOiBzdG0zMjogYWRkIFVBUlQgZWFybHkgY29uc29s
ZSBjb25maWd1cmF0aW9uIGZvciBTVE0zMkY3DQo+PiAgICBBUk06IGRlYnVnOiBzdG0zMjogYWRk
IFVBUlQgZWFybHkgY29uc29sZSBzdXBwb3J0IGZvciBTVE0zMkg3DQo+PiAgICBBUk06IGRlYnVn
OiBzdG0zMjogYWRkIFVBUlQgZWFybHkgY29uc29sZSBzdXBwb3J0IGZvciBTVE0zMk1QMQ0KPj4N
Cj4+ICAgYXJjaC9hcm0vS2NvbmZpZy5kZWJ1ZyAgICAgICAgIHwgNDIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLQ0KPj4gICBhcmNoL2FybS9pbmNsdWRlL2RlYnVnL3N0bTMyLlMg
fCAgOSArKysrLS0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IC0tDQo+PiAyLjE3LjENCj4+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
