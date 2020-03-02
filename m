Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2838175C0A
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Mar 2020 14:48:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D2DCC36B0B;
	Mon,  2 Mar 2020 13:48:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A51E3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 13:48:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022Dhffg032358; Mon, 2 Mar 2020 14:47:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=z0zTg9vDN9RLRb4HKBo0xtz0EHRAqKWxASBqeCbA8Bo=;
 b=oPsC0aUaAjk62s5mmZl/vPqJboFCIgVW5Eh/Z+sAlwS7fCi4o32xbLQ9kGIj76Wdu9Cv
 aqCsNp7aB1fKBcfCjPpv8zcFq9MyvFrwdViJRWNQCW2TY+k+VXMLv75hiBJZpmOMfDwN
 y9KLV8V667aqc8OZ6dHCwv+io+uebkR4lxnH4gMHxGP/IBIdFP50wdaswv3IMx6JtHh+
 PGqqY7un6udMvNQsLMjwos3qrFDHkqz0aVI0a4NgilH2AB+CWf+iqrxJXIWQRBz/iRWr
 fKcHn+iW0B3T32LECaCZVM9oJpHcf5fpXlwfA7iMfgGSY+/2/hQGll1AaK2o98fll4+x jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem0ksh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 14:47:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC1C610002A;
 Mon,  2 Mar 2020 14:47:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 985EC20DE4C;
 Mon,  2 Mar 2020 14:47:51 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Mar
 2020 14:47:51 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200119191143.50033-1-marex@denx.de>
 <20200119191143.50033-6-marex@denx.de>
 <1b288811-8ffb-a150-71ef-4c006e6d5740@st.com>
 <1ec643e9-217d-c83d-793f-c05d6c4502bd@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <46e68418-21c0-b82c-d226-4f5ada0ef351@st.com>
Date: Mon, 2 Mar 2020 14:47:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1ec643e9-217d-c83d-793f-c05d6c4502bd@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_04:2020-03-02,
 2020-03-02 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 6/6] ARM: dts: stm32: Add DH
 Electronics DHCOM STM32MP1 SoM and PDK2 board
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

SGkgTWFyZWsKCk9uIDIvMjMvMjAgMzozNyBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMi8x
MC8yMCA1OjM1IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+PiBIaSBNYXJlawo+IAo+IEhp
LAo+IAo+PiBPbiAxLzE5LzIwIDg6MTEgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gQWRkIHN1
cHBvcnQgZm9yIERIIEVsZWN0cm9uaWNzIERIQ09NIFNvTSBhbmQgUERLMiByZXYuIDQwMCBjYXJy
aWVyCj4+PiBib2FyZC4gVGhpcyBpcyBhbiBTb00gd2l0aCBTVE0zMk1QMTU3QyBhbmQgYW4gZXZh
bHVhdGlvbiBraXQuIFRoZQo+Pj4gYmFzZWJvYXJkIHByb3ZpZGVzIEV0aGVybmV0LCBVQVJULCBV
U0IsIENBTiBhbmQgb3B0aW9uYWwgZGlzcGxheS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJl
ayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5k
cmUudG9yZ3VlQHN0LmNvbT4KPj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0z
MkBnbWFpbC5jb20+Cj4+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3Qu
Y29tPgo+Pj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPgo+
Pj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+IFRvOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IC0tLQo+Pj4gVjI6IC0gQWRk
IHN0bTMybXAxIGludG8gdGhlIHN1YmplY3QgYW5kIGNvbW1pdCBtZXNzYWdlCj4+PiAgwqDCoMKg
wqAgLSBTb3J0IERUIGFscGhhbnVtZXJpY2FsbHkKPj4+ICDCoMKgwqDCoCAtIE1vdmUgYWxsIHBp
bmNvbnRyb2wgZW50cmllcyBpbnRvIHN0bTMybXAxNS1waW5jdHJsLmR0c2kKPj4+IC0tLQo+Pgo+
PiBUaGFua3MgdG8gYWRkIGEgbmV3IFNUTTMyIGJvYXJkLgo+Pgo+PiBTZXJpZXMgYXBwbGllZCBv
biBzdG0zMi1uZXh0Lgo+IAo+IEhvdyBjb21lIHRoZXNlIGFyZSBub3QgaW4gbmV4dC9tYXN0ZXIg
eWV0LCBpcyB0aGUgYnJhbmNoIG5vdCBiZWluZwo+IG1lcmdlZCBpbnRvIG5leHQgcmVndWxhcmx5
ID8KPiAKCk5vIHRoaXMgYnJhbmNoIGlzIG5vdCBtZXJnZWQgcmVndWxhcmx5IGluIG5leHQvbWFz
dGVyLiBZb3UnbGwgZ2V0IGl0IGluIAo1LjctcmMxLgoKcmVnYXJkcwpBbGV4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
