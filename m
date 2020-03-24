Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F4C191407
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 16:18:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B4E6C36B0B;
	Tue, 24 Mar 2020 15:18:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89F55C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 15:18:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OF8ngr027069; Tue, 24 Mar 2020 16:18:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=kaCicy8uIssxryPATIF8cnJYg+6hF4DZRgmwqrvYHXo=;
 b=JX+7PFmR9fqCBfLmgWnh/hm068+BXkF0TIgdVqmMQJxIOSPr1HBO/E+BTF8TCQEOZ/zT
 MSgffJARDE+zJA7X2joqwI5ywvQgkDCgQtfpFe54HY/S8ZJPTqacOGHH81ik6jwpoxwE
 Fh1AoZuhDpjxgjiQv4MSG31Zr3/NLH/FVBzjtKF9QWiDuLkKJWZ0uZBEN3tq1z1qReOJ
 SxGayKNQ+g4lM74LsbieH090uFdQXuUb1b9CYUF/ymVyaPwAA0H5klm3eAK25oUJkviu
 dNkh59nJfrqk+5zXlzNV7U23e+QhwAB51QlkjriN42BEkEZzG6YTKPfK/Xz5VnIOj8it QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw9k006tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 16:18:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17DFA10002A;
 Tue, 24 Mar 2020 16:18:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0340B2B252E;
 Tue, 24 Mar 2020 16:18:04 +0100 (CET)
Received: from lmecxl0912.tpe.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Mar
 2020 16:18:00 +0100
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
References: <20200323023145.3345133-1-marex@denx.de>
 <7f76ea73-122f-3761-a97b-57bdb99dc4fa@st.com>
 <4ffd8b7c-eb7d-83a4-3f6e-e156d3600532@denx.de>
 <c26637b2-7cf6-b7e2-3301-fafbbfde508e@st.com>
 <028556ba-f088-bf04-4473-a69569157411@denx.de>
 <792e11db-d345-03d4-6d8f-3f9b8ed40576@st.com>
 <c399c8bb-3035-70e0-7499-71974f7c30f6@denx.de>
 <9492207e929c4185bda5a709ad879c15@SFHDAG3NODE2.st.com>
 <7723c340-067b-d780-0eb1-c47d50b11ee9@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <0706c0f7-fb7b-a8e7-5ff5-8765b3170a9e@st.com>
Date: Tue, 24 Mar 2020 16:17:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7723c340-067b-d780-0eb1-c47d50b11ee9@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_05:2020-03-23,
 2020-03-24 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
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

CgpPbiAzLzI0LzIwIDM6NTggUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDMvMjQvMjAgMzoz
OSBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4KPj4KPj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4+PiBGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+IFNlbnQ6
IG1hcmRpIDI0IG1hcnMgMjAyMCAxNTozMQo+Pj4gVG86IEFsZXhhbmRyZSBUT1JHVUUgPGFsZXhh
bmRyZS50b3JndWVAc3QuY29tPjsgbGludXgtYXJtLQo+Pj4ga2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+
OyBQYXRyaWNlIENIT1RBUkQKPj4+IDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPjsgUGF0cmljayBE
RUxBVU5BWSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+OyBsaW51eC0KPj4+IHN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFtSRkNdIEFS
TTogZHRzOiBzdG0zMjogQWRkIERUcyBmb3IgU1RNMzJNUDE1eCB2YXJpYW50cwo+Pj4gb2YgdGhl
IERIIFNPTSBhbmQgUERLMgo+Pj4KPj4+IE9uIDMvMjQvMjAgMzoyOCBQTSwgQWxleGFuZHJlIFRv
cmd1ZSB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMy8yNC8yMCAzOjE1IFBNLCBNYXJlayBWYXN1
dCB3cm90ZToKPj4+Pj4gT24gMy8yNC8yMCAzOjA3IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3Rl
Ogo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAzLzI0LzIwIDI6MjIgUE0sIE1hcmVrIFZhc3V0IHdy
b3RlOgo+Pj4+Pj4+IE9uIDMvMjQvMjAgMjowNCBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToK
Pj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gT24gMy8yMy8yMCAzOjMxIEFNLCBNYXJlayBWYXN1
dCB3cm90ZToKPj4+Pj4+Pj4+IFRoZSBESCBQREsyIGNhbiBiZSBwb3B1bGF0ZWQgd2l0aCBTb00g
d2l0aCBhbnkgU1RNMzJNUDE1eCB2YXJpYW50Lgo+Pj4+Pj4+Pj4gQWRkIHRoZSBEVHMgZGVzY3Jp
YmluZyB0aGUgcmVtYWluaW5nIGNvbWJpbmF0aW9ucy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+Pj4+Pj4+IENjOiBBbGV4
YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4KPj4+Pj4+Pj4+IENjOiBNYXhp
bWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+Pj4+Pj4+PiBDYzogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPgo+Pj4+Pj4+Pj4gQ2M6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPgo+Pj4+Pj4+Pj4gQ2M6IGxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+Pj4+Pj4+IFRvOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4gTk9U
RTogSXMgdGhlcmUgYSBiZXR0ZXIgd2F5IHRvIGRvIHRoaXMgdGhhbiB0byBoYXZlIHRoaXMga2lu
ZCBvZgo+Pj4+Pj4+Pj4gYQo+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoGNvbWJpbmF0b3JpYWwgZXhw
bG9zaW9uIG9mIERUcyA/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkgaGF2ZSBubyBiZXR0ZXIgaWRlYS4g
UXVlc3Rpb24gd2FzIHRoZSBzYW1lIGZvciBzdG0zMiBib2FyZHMsIGFuZAo+Pj4+Pj4+PiBJIGNo
b3NlIHRvIHRha2UgdGhpcyBvcHRpb24uCj4+Pj4+Pj4KPj4+Pj4+PiBPbmUgb3B0aW9uIHdvdWxk
IGJlIHRvIGp1c3QgaGF2ZSBEVCBmb3IgdGhlIG1vc3QgZmVhdHVyZS1jb21wbGV0ZQo+Pj4+Pj4+
IG9wdGlvbgo+Pj4+Pj4+ICgxNTcpIGFuZCB0aGVuIGhhdmUgVS1Cb290IHJlbW92ZSB0aGUgbm9k
ZXMgZm9yIEhXIHdoaWNoIGlzIG5vdAo+Pj4+Pj4+IHByZXNlbnQgb24gdGhlIHBhcnRpY3VsYXIg
U29DIG9wdGlvbiBpZiBpdCdzIG9uZSBvZiB0aGUgbW9yZQo+Pj4+Pj4+IGxpbWl0ZWQgb25lcyAo
MTUzLCAxNTEpLgo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gWWVzIGl0IHdhcyBhIHBvc3NpYmlsaXR5
IHRoYXQgSSBkaXNjdXNzZWQgd2l0aCBrZXZpbiBILiBhdCB0aGUKPj4+Pj4+IGxhdGVzdCBFTENF
IGJ1dCBhdCB0aGUgZW5kIHRoZSBiZXN0IHdheSB0byBmb2xsb3cgd2FzIHRvIGVuaGFuY2UKPj4+
Pj4+IG51bWJlciBvZiBkdHMgZmlsZXMuIFRoZSBiZXN0IHdvdWxkIGJlIHRvIGhhdmUgZGVkaWNh
dGVkIGZvbGRlcnMgYnV0Cj4+Pj4+PiBpdCBpcyBhbm90aGVyIHN0b3J5Lgo+Pj4+Pgo+Pj4+PiBP
ciB1c2UgRFQgb3ZlcmxheXMgc29tZWhvdyA/IFUtQm9vdCBjYW4gYXBwbHkgRFRPcyBvbnRvIERU
IGJlZm9yZQo+Pj4+PiBib290aW5nIExpbnV4Lgo+Pj4+Pgo+Pj4+PiBIYXZpbmcgdG9ucyBvZiBE
VHMgb24gYSBzeXN0ZW0gaXMgYSBsb3Qgb2YgZHVwbGljYXRpb24sIEkgZG9uJ3QKPj4+Pj4gcmVh
bGx5IGxpa2UgdGhhdC4KPj4+Pgo+Pj4+IEkgYWdyZWUgdGhhdCB0byBtYWludGFpbiBpdCdzIGEg
bmlnaHRtYXJlLCBidXQgaXQncyBhIHdheSB0byBoZWxwIERUIHVzZXJzLgo+Pj4+Cj4+Pj4+Cj4+
Pj4+IEJ1dCBmb3Igc3RhcnRlcnMsIGZlZWwgZnJlZSB0byByZXZpZXcgdGhpcyBwYXRjaC4KPj4+
Pj4KPj4+Pgo+Pj4+IFlvdXIgcGF0Y2ggc291bmRzIGdvb2QuCj4+Pgo+Pj4gVGhlbiBmZWVsIGZy
ZWUgdG8gYXBwbHkgaXQsIHRoYW5rcy4KPj4+Cj4+PiBidHcgZG9uJ3QgeW91IGhhdmUgYSAibmV4
dCIgdHJlZSBzb21ld2hlcmUgd2l0aCBhbGwgdGhlIHBhdGNoZXMgcXVldWVkIHVwIGZvcgo+Pj4g
bmV4dCByZWxlYXNlID8gSWYgSSByZWJhc2Ugb24gbGludXggbmV4dCwgSSBzdGlsbCBoYXZlIHF1
aXRlIGEgZmV3IHN0bTMybXAxIERUCj4+PiBwYXRjaGVzIGluIG15IHRyZWUgd2hpY2ggYXJlIHBy
ZXN1bWFibHkgYXBwbGllZCwgYnV0IEkgZG9uJ3Qgc2VlIHRoZW0gaW4gbGludXggbmV4dC4KPj4K
Pj4KPj4gWWVzIGJ1dCBpdCBpcyBub3QgbWVyZ2VkIGludG8gTGludXgtbmV4dC4gU2VlOiBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXRvcmd1ZS9zdG0zMi5n
aXQKPj4KPj4gQnJhbmNoIHN0bTMyLW5leHQKPiAKPiBUaGFua3MuIFdvdWxkbid0IGl0IGJlIG1v
cmUgY29udmVuaWVudCBhbmQgcmVjZWl2ZSBtb3JlIHRlc3RpbmcgaWYgaXQKPiB3ZXJlIHRvIGJl
IG1lcmdlZCBpbnRvIG5leHQsIGp1c3QgbGlrZSB0aGUgb3RoZXIgdHJlZXMgYXJlID8KPiAKSSBj
b21wbGV0ZWx5IGFncmVlIHdpdGggeW91ISBPdGhlciBhcm0gdHJlZXMgYXJlIG1lcmdlZCA/Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
