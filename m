Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 341931C7376
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 16:58:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3B61C32EB4;
	Wed,  6 May 2020 14:58:09 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0198C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 14:58:08 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49HKTX19p1z1tBxW;
 Wed,  6 May 2020 16:58:08 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49HKTX0WZ9z1qv7v;
 Wed,  6 May 2020 16:58:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 8prpPn8b4VFT; Wed,  6 May 2020 16:58:06 +0200 (CEST)
X-Auth-Info: joOXOhu0ZLlQ4TzH0UKzkHH/FQ3E3yfdX4rqUl0Du5E=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  6 May 2020 16:58:06 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200429163743.67854-1-marex@denx.de>
 <13aabff1-d4d0-7afb-6a57-a8136e35c6a4@st.com>
 <1d9cbde1-2be1-f54e-7c65-202f2bc7e0a9@denx.de>
 <b100645c-32ac-325d-5838-0fab2c93df22@st.com>
 <6dc6b79f-2a20-3899-e42f-eabaeb33a829@denx.de>
 <c012b356-c935-3536-a3eb-0683f4339dda@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <dde82c6c-ec30-ad28-406d-4bd955c670c0@denx.de>
Date: Wed, 6 May 2020 16:58:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c012b356-c935-3536-a3eb-0683f4339dda@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 01/12] ARM: dts: stm32: Add alternate
	pinmux for I2C2 pins
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

T24gNS82LzIwIDQ6NTUgUE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4gCj4gCj4gT24gNS82
LzIwIDQ6MzkgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA1LzYvMjAgNDoyNiBQTSwgQWxl
eGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4+Cj4+Pgo+Pj4KPj4+PiBBbGwgcmlnaHQsIHRoYW5rcy4K
Pj4+Pgo+Pj4+IGJ0dyBJIGhhZCB0aGlzIGludGVybmFsIGRpc2N1c3Npb24gbm93IGFib3V0IGhh
bmRsaW5nIHRoZSBjb21iaW5hdG9yaWFsCj4+Pj4gZXhwbG9zaW9uIG9mIGJvYXJkIERUcyBoZXJl
LiBJZiB3ZSBzdXBwb3J0IHRoZW0gYWxsLCBieSB0aGUgZW5kIG9mIHRoZQo+Pj4+IGxpZmVzcGFu
IG9mIHRoZXNlIGRldmljZXMsIHdlIGVuZCB1cCB3aXRoOgo+Pj4+Cj4+Pj4gU1RNMzJNUDE1ezEs
Myw3fXthLGMsZCxmfSBTb00gcmV2LiB7MC4uN30wMCBvbiBiYXNlYm9hcmQgcmV2LiB7MC4uN30w
MC4KPj4+Pgo+Pj4+IFRoZXJlIHdvbid0IGJlIGV2ZXJ5IFNvTSBhbmQgYmFzZWJvYXJkIHJldmlz
aW9uIGNvbWJpbmF0aW9uIGFsbCByaWdodC4KPj4+PiBCdXQgZXZlbiB0aGUgYW1vdW50IG9mIFNv
TSBvcHRpb25zIGdpdmVzIG1lIDEyIERUcy4gVGhhdCBpcyBub3QgYSBsb3cKPj4+PiBudW1iZXIu
IERvZXMgU1QgaGF2ZSBzb21lIHBsYW4gdG8gaGFuZGxlIHN1Y2ggc2l0dWF0aW9uID8KPj4+Cj4+
PiBZZXMgSSBoYXZlIHRoZSBzYW1lIHBvaW50IGluIG1pbmQuIEhvdyB0byBtYWludGFpbiBhbGwg
Ym9hcmRzID8gU2hvdWxkCj4+PiB3ZSByZWZ1c2Ugc29tZSBib2FyZHMgYW5kIG9ubHkga2VlcCBv
bmUgYXMgZXhhbXBsZSA/Cj4+Cj4+IEJ1dCB3aGljaCBvbmVzIGRvIHlvdSB3YW50IHRvIGRyb3A/
IFRoZSBwZGsyIGlzIGEgZGV2a2l0ICwgc28geW91IGNhbgo+PiBwdXQgaW4gYW55IFNvTSBvcHRp
b24sIHRoYXQncyB0aGUgcHJvYmxlbS4KPiAKPiBPayBidXQgd2UgY291bGQgY2hvaWNlIHRvIGJ1
aWxkIG9ubHkgb25lIChvciBmZXcpIHBvc3NpYmlsaXRpZXMuIEkgbWVhbgo+IG1heWJlIG9ubHkg
bXAxNTcgPwoKQnV0IHRoYXQgb25lIGlzbid0IGdvbm5hIHdvcmsgZm9yIGUuZy4gMTUzIHRoZW4s
IHdvdWxkIGl0PwoKPj4+PiBJIGNhbiBpbWFnaW5lIHRoYXQgVS1Cb290IGNhbiBwYXRjaCB0aGUg
RFQgYW5kIGVuYWJsZS9kaXNhYmxlCj4+Pj4gZnVuY3Rpb25hbGl0eSAsIHdoaWNoIGNvdWxkIGhh
bmRsZSB0aGUge2EsYyxkLGZ9IG9wdGlvbnMgYW5kIHJlZHVjZSB0aGUKPj4+PiBhbW91bnQgb2Yg
RFRzLiBJdCBjb3VsZCBwb3NzaWJseSBhbHNvIGhhbmRsZSB0aGUgezEsMyw3fSBvcHRpb25zLgo+
Pj4+Cj4+Pgo+Pj4gSXQgaXMgc29tZXRoaW5nIEkgZGlzY3Vzc2VkIHdpdGggS2V2aW4gSGlsbWFu
IGF0IEVMQ0UgYW5kIHNvbWV0aW1lIHdpdGgKPj4+IFJvYiBvbiBJSVJjLiBXZSBjb3VsZCB1c2Ug
dS1ib290IHRvIGhhbmRsZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIFNvQywgYW5kCj4+PiBib2FyZHMu
IFRlY2huaWNhbGx5IGl0J3MgcG9zc2libGUgYnV0IHRoZSBtYWluIGlzc3VlIGRvaW5nIHRoYXQg
aXMswqAgeW91Cj4+PiB3aWxsIGhpZGUgc29tZSB1cGRhdGVzIGluIHlvdXIgYm9vdGxvYWRlciBh
bmQgdGhlbiB5b3VyIGR0YiB1c2VkIGJ5Cj4+PiBrZXJuZWwgd2lsbCBub3QgcmVmbGVjdCB5b3Vy
IGR0cyBmaWxlLiBJdCBjb3VsZCBiZSBjb25mdXNlZCBmb3IKPj4+IGN1c3RvbWVycyBhbmQgdXNl
cnMuCj4+Cj4+IFllcy4KPj4KPj4+PiBBbnkgb3RoZXIgaWRlYXMgPwo+Pj4KPj4+IFdoYXQgaXMg
Zm9yIHlvdSB0aGUgbWFpbiBpc3N1ZSA/IHRoZSBudW1iZXIgb2YgZmlsZXMgdG8gYWRkIG9yIGhv
dyB0bwo+Pj4gbWFpbnRhaW4gYWxsIHRob3NlIGZpbGVzID8KPj4KPj4gVGhlIG51bWJlci4gTWFp
bnRhaW5pbmcgdGhlbSBpcyBub3QgdGhhdCBtdWNoIG9mIGEgcHJvYmxlbS4KPiAKPiBJIGFncmVl
Cj4gCj4+Cj4+PiBJZiBpdCBpcyB0aGUgbnVtYmVyIG9mIGZpbGVzIHRvIGFkZCwgd2UgY2FuIHRo
aW5rIGFib3V0IHNldmVyYWwgd2F5czoKPj4+Cj4+PiAxLUFzIG1lbnRpb25lZCBhYm92ZSwgdG8g
b25seSBrZWVwIGtpbmQgb2YgcmVmZXJlbmNlIHBsYXRmb3Jtcwo+Pj4KPj4+IDItSGF2ZSB2ZW5k
b3IgZGlyZWN0b3JpZXMgaW4gYXJjaC9hcm0vYm9vdC9kdHMgKGJ1dCBpdCdzIGFub3RoZXIgc3Rv
cnkKPj4+IHRvIG1ha2UgaXQgYWNjZXB0ZWQpCj4+Cj4+IE1heWJlIHRoYXQncyBzb21ldGhpbmcg
d2Ugc2hvdWxkIGNvbnNpZGVyIGZvciBhcm0zMiwgYnV0IHRoYXQncyBhCj4+IGRpZmZlcmVudCBk
aXNjdXNzaW9uIGFsdG9nZXRoZXIuCj4gCj4gSSBnb25uYSBzZWUgaG93IHRvIHN0YXJ0IGRpc2N1
c3Npb24gb24gdGhhdCAobWF5YmUgdGhhbmtzIHRvIExpbmFybyBhbmQKPiBkZXZpY2UgdHJlZSBl
dm9sdXRpb24pCgpBbGwgcmlnaHQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
