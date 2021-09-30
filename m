Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEDA41D5A7
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Sep 2021 10:48:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E6B3C5A4F8;
	Thu, 30 Sep 2021 08:48:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F21DC597AB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 08:48:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U7NYEa006694; 
 Thu, 30 Sep 2021 10:47:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LuzvPakSGeIgrzpUBElZTEkeMxrFYfaFwh7HewqAPWs=;
 b=riU96bxiu2IzHgCfubE5+yFhTdT736xfd0meWSqb2gaJS2XmyWat0RfGl2RGKDTEHmlR
 ze9stPzbdnU5EUIQdfbuHNICLIxlVly6nrxN8Z8PlWp8ykgpDUITyNi3MxS1Nt1lurdO
 Twklu1Bj3gEnXNsyaV8KqA9p9dxTQdjbSCnoWxS1+fP2m4cs9hF5XVAqrPGjdH8ub6Md
 LvQIpOTAHW7FzTSwIMaVKytHkg4kSauknczwzA54RL/nRrtbIHwPDm/MOA9jttm82/MQ
 SofjMEslDFLc23WvJp8x4sd2tsrM0jFlTzGg9fNM0wPupj9AO71CHsBBQftiTA0qbniD Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bd0gg2ts3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 10:47:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC68B10002A;
 Thu, 30 Sep 2021 10:47:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C708A233C97;
 Thu, 30 Sep 2021 10:47:52 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 10:47:51 +0200
To: Marek Vasut <marex@denx.de>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20210927114553.21843-1-olivier.moysan@foss.st.com>
 <beb6e7c8-f3c8-fc4e-6017-fea5690b9f33@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <e8d40be8-045c-096a-f079-d9f6364254e9@foss.st.com>
Date: Thu, 30 Sep 2021 10:47:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <beb6e7c8-f3c8-fc4e-6017-fea5690b9f33@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_02,2021-09-29_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: fix AV96 board SAI2B
 pin muxing on stm32mp15
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

SGkgTWFyZWsKCk9uIDkvMjkvMjEgMToxOCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gOS8y
Ny8yMSAxOjQ1IFBNLCBPbGl2aWVyIE1veXNhbiB3cm90ZToKPj4gRml4IFNBSTJCIHBpbiBtdXhp
bmcgZm9yIEFWOTYgYm9hcmQgb24gU1RNMzJNUDE1Lgo+PiBUaGUgbGFiZWwgInNhaTJhLTQiIGlz
IGRlZmluZWQgdHdpY2UuIENoYW5nZSByZWR1bmRhbnQgbGFiZWwgdG8gCj4+ICJzYWkyYi00Ii4K
Pj4KPj4gRml4ZXM6IGRjZjE4NWNhODE3NSAoIkFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVybmF0
ZSBwaW5tdXggZm9yIFNBSTIgCj4+IHBpbnMgb24gc3RtMzJtcDE1IikKPj4KPj4gU2lnbmVkLW9m
Zi1ieTogT2xpdmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQGZvc3Muc3QuY29tPgo+PiAtLS0K
Pj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaSB8IDIgKy0KPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpIAo+PiBi
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0c2kKPj4gaW5kZXggNWI2MGVj
YmQ3MThmLi5iOWNjOWUwZGQ0ZmMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMybXAxNS1waW5jdHJsLmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
LXBpbmN0cmwuZHRzaQo+PiBAQCAtMTIzNSw3ICsxMjM1LDcgQEAKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIH07Cj4+IMKgwqDCoMKgwqAgfTsKPj4gLcKgwqDCoCBzYWkyYl9waW5zX2M6IHNhaTJhLTQg
ewo+PiArwqDCoMKgIHNhaTJiX3BpbnNfYzogc2FpMmItNCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBwaW5zMSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbm11eCA9IDxTVE0zMl9Q
SU5NVVgoJ0YnLCAxMSwgQUYxMCk+OyAvKiBTQUkyX1NEX0IgKi8KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYmlhcy1kaXNhYmxlOwo+IAo+IFRoaXMgbXAxIHBpbm11eGluZyBpcyBhIHRv
dGFsIG1lc3MsIHNpZ2guCgpXaGF0IGlzIHRoZSBpc3N1ZSBoZXJlID8KCj4gQ2FuIHlvdSBwbGVh
c2UgYWxzbyBmaXggc2FpMWEtNCBhbmQgc2FpMWEtNSwgd2hpY2ggc2hvdWxkIHJlYWxseSBiZSAK
PiBzYWkxYS0yIGFuZCBzYWkxYS1zbGVlcC0yID8gU2FtZSBhcyB0aGUgc2FpMmItNCBhbmQgc2Fp
MmItNSBzaG91bGQgYmUgCj4gc2FpMmItMiBhbmQgc2FpMmItc2xlZXAtMiAuCj4gCj4gV2l0aCB0
aGF0LCBpdCB3b3VsZCBiZSBwZXJmZWN0LCB0aGFuayB5b3UuCj4gCj4gWy4uLl0KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
