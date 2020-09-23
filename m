Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C4275D46
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 18:24:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 605B7C3FAD5;
	Wed, 23 Sep 2020 16:24:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77071C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 16:24:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08NGIRP2025198; Wed, 23 Sep 2020 18:23:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=OFI2WHn7R5Idn1kfTfZOs7WKLYT06YF3k1DG4eFTyEM=;
 b=afw+/N93WMKirTjrM6XUe34XFRTjpgGMUQTmHK28EQHQYKWTSMimyQ0jOu0sihB9N3NK
 usAsCBV0mjdyUXtgzA0z/EQrKdIZKqHQHomwTPExYC36krWQGVQGaGFcG5k9jQyQgvGG
 8Qb5XxyjL00TBPcBep4qjl+ZuIDNOY2tEJkGzTf1H8jS7mwkrKHo6mqkejWQlB5idl79
 EHAPQMN4LgErjnRSUWpdchh9vbmAbb2FGH0ZaxC4gOKBkKW+4rQ9DUtA5nrbJr5OZtAA
 faNvJOzc+BB1l7P334Nf3VHGV0UdH+RuNgN5kDvLkLviHohye/a6DG0EtZlXrWtWjd5M /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n7rvx7ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 18:23:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9028710002A;
 Wed, 23 Sep 2020 18:23:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E2052C38A1;
 Wed, 23 Sep 2020 18:23:58 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Sep
 2020 18:23:57 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200822203255.61295-1-marex@denx.de>
 <f6e8619d-ff66-2f70-d22e-88ed763cf96c@st.com>
 <a3c0348b-bf5e-0382-6a6e-bbf74f5a00ce@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <2a8f7f92-1c3e-b474-7574-c1f7a37e1fb1@st.com>
Date: Wed, 23 Sep 2020 18:23:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a3c0348b-bf5e-0382-6a6e-bbf74f5a00ce@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_12:2020-09-23,
 2020-09-23 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix DH PDK2 display PWM
	channel
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

CgpPbiA5LzIzLzIwIDY6MDQgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDkvMjMvMjAgNDoz
MiBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4gSGkgTWFyZWsKPiAKPiBIaSwKPiAKPj4g
T24gOC8yMi8yMCAxMDozMiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBUaGUgZGlzcGxheSBQ
V00gY2hhbm5lbCBpcyBudW1iZXIgMyAoUFdNMiBDSDQpLCBtYWtlIGl0IHNvLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+Pj4gQ2M6IEFsZXhhbmRy
ZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgo+Pj4gQ2M6IE1heGltZSBDb3F1ZWxp
biA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPj4+IENjOiBQYXRyaWNlIENob3RhcmQgPHBh
dHJpY2UuY2hvdGFyZEBzdC5jb20+Cj4+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5k
ZWxhdW5heUBzdC5jb20+Cj4+PiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQo+Pj4gVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4g
LS0tCj4+PiAgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGRrMi5kdHNp
IHwgMiArLQo+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1k
aGNvbS1wZGsyLmR0c2kKPj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20t
cGRrMi5kdHNpCj4+PiBpbmRleCA3YzRiZDYxNWIzMTEuLjA3NWUyYTk1NzEzZiAxMDA2NDQKPj4+
IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLXBkazIuZHRzaQo+Pj4g
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGRrMi5kdHNpCj4+PiBA
QCAtMjYsNyArMjYsNyBAQCBjbGtfZXh0X2F1ZGlvX2NvZGVjOiBjbG9jay1jb2RlYyB7Cj4+PiAg
wqAgwqDCoMKgwqDCoCBkaXNwbGF5X2JsOiBkaXNwbGF5LWJsIHsKPj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsKPj4+IC3CoMKgwqDCoMKgwqDCoCBw
d21zID0gPCZwd20yIDAgNTAwMDAwIFBXTV9QT0xBUklUWV9JTlZFUlRFRD47Cj4+PiArwqDCoMKg
wqDCoMKgwqAgcHdtcyA9IDwmcHdtMiAzIDUwMDAwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBicmlnaHRuZXNzLWxldmVscyA9IDwwIDE2IDIyIDMwIDQw
IDU1IDc1IDEwMiAxMzggMTg4IDI1NT47Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQt
YnJpZ2h0bmVzcy1sZXZlbCA9IDw4PjsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZW5hYmxlLWdw
aW9zID0gPCZncGlvaSAwIEdQSU9fQUNUSVZFX0hJR0g+Owo+Pj4KPj4KPj4KPj4gQXBwbGllZCBv
biBzdG0zMi1uZXh0Lgo+IAo+IERvbid0IHlvdSB3YW50IHRvIHBpY2sgdGhlIG9uZSB3aXRoIHRo
ZSBGaXhlczogdGFnID8gOikKPiAKClllcyBJIGRpZC4gSSBqdXN0IHJlc3BvbmRlZCBvbiB0aGUg
YmFkIG9uZSA7KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
