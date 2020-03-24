Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7F0191272
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 15:07:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96BC8C36B0B;
	Tue, 24 Mar 2020 14:07:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18ECEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 14:07:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OE2JdD011562; Tue, 24 Mar 2020 15:07:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Vaix7rErqG1LJOvQ01RYY9nHddjAZx25/lenxF4h+Yk=;
 b=OAjpa4OmyZHKvCZuLlT9Id5YG+kgj5Hg86qE+wOVOCgWs4U+ZJkeBVDd/dP9gAIrJo+m
 xTF/1pE5NXHDULqWlk6LISuvvcgkJWYMwBp8zM9IZqBGj+YGoJwpPjtxQ8g2hfg9BY6h
 RfMEpGO8Q126eW7ld4FMtp7J44H6Bi9RcLoZmgsCcCG1YnCqdmgj0De+6K7bauBcxEnp
 pMyAWzW6lxrbQvz62H2ehpq/EXLWCE24s+sqfc68EYMaoCzJNA6rfUNAujKV6+jZ4mVD
 lAa5JDrpkCf3OeRsZt/qJ7sXSRlzRWtfYCoGtAEgtE/pI8t5vQr1WwYlfEqCFuHAkFFq Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw8xe01u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 15:07:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53783100034;
 Tue, 24 Mar 2020 15:07:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 483442AF12F;
 Tue, 24 Mar 2020 15:07:38 +0100 (CET)
Received: from lmecxl0912.tpe.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Mar
 2020 15:07:33 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200323023145.3345133-1-marex@denx.de>
 <7f76ea73-122f-3761-a97b-57bdb99dc4fa@st.com>
 <4ffd8b7c-eb7d-83a4-3f6e-e156d3600532@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c26637b2-7cf6-b7e2-3301-fafbbfde508e@st.com>
Date: Tue, 24 Mar 2020 15:07:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4ffd8b7c-eb7d-83a4-3f6e-e156d3600532@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_05:2020-03-23,
 2020-03-24 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] [RFC] ARM: dts: stm32: Add DTs for
 STM32MP15x variants of the DH SOM and PDK2
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

CgpPbiAzLzI0LzIwIDI6MjIgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDMvMjQvMjAgMjow
NCBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4KPj4KPj4gT24gMy8yMy8yMCAzOjMxIEFN
LCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IFRoZSBESCBQREsyIGNhbiBiZSBwb3B1bGF0ZWQgd2l0
aCBTb00gd2l0aCBhbnkgU1RNMzJNUDE1eCB2YXJpYW50Lgo+Pj4gQWRkIHRoZSBEVHMgZGVzY3Jp
YmluZyB0aGUgcmVtYWluaW5nIGNvbWJpbmF0aW9ucy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBN
YXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4
YW5kcmUudG9yZ3VlQHN0LmNvbT4KPj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20+Cj4+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRA
c3QuY29tPgo+Pj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29t
Pgo+Pj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+IFRv
OiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IC0tLQo+Pj4gTk9URTog
SXMgdGhlcmUgYSBiZXR0ZXIgd2F5IHRvIGRvIHRoaXMgdGhhbiB0byBoYXZlIHRoaXMga2luZCBv
ZiBhCj4+PiAgwqDCoMKgwqBjb21iaW5hdG9yaWFsIGV4cGxvc2lvbiBvZiBEVHMgPwo+Pgo+PiBJ
IGhhdmUgbm8gYmV0dGVyIGlkZWEuIFF1ZXN0aW9uIHdhcyB0aGUgc2FtZSBmb3Igc3RtMzIgYm9h
cmRzLCBhbmQgSQo+PiBjaG9zZSB0byB0YWtlIHRoaXMgb3B0aW9uLgo+IAo+IE9uZSBvcHRpb24g
d291bGQgYmUgdG8ganVzdCBoYXZlIERUIGZvciB0aGUgbW9zdCBmZWF0dXJlLWNvbXBsZXRlIG9w
dGlvbgo+ICgxNTcpIGFuZCB0aGVuIGhhdmUgVS1Cb290IHJlbW92ZSB0aGUgbm9kZXMgZm9yIEhX
IHdoaWNoIGlzIG5vdCBwcmVzZW50Cj4gb24gdGhlIHBhcnRpY3VsYXIgU29DIG9wdGlvbiBpZiBp
dCdzIG9uZSBvZiB0aGUgbW9yZSBsaW1pdGVkIG9uZXMgKDE1MywKPiAxNTEpLgo+IAoKWWVzIGl0
IHdhcyBhIHBvc3NpYmlsaXR5IHRoYXQgSSBkaXNjdXNzZWQgd2l0aCBrZXZpbiBILiBhdCB0aGUg
bGF0ZXN0IApFTENFIGJ1dCBhdCB0aGUgZW5kIHRoZSBiZXN0IHdheSB0byBmb2xsb3cgd2FzIHRv
IGVuaGFuY2UgbnVtYmVyIG9mIGR0cyAKZmlsZXMuIFRoZSBiZXN0IHdvdWxkIGJlIHRvIGhhdmUg
ZGVkaWNhdGVkIGZvbGRlcnMgYnV0IGl0IGlzIGFub3RoZXIgc3RvcnkuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
