Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1EB1C7300
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 16:39:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEBE8C32EB1;
	Wed,  6 May 2020 14:39:04 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 192AAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 14:39:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49HK3V73NMz1r56m;
 Wed,  6 May 2020 16:39:02 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49HK3V65qJz1qv7v;
 Wed,  6 May 2020 16:39:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id byY3NckrvQFa; Wed,  6 May 2020 16:39:01 +0200 (CEST)
X-Auth-Info: bqmZQEPBqsSndopr7xYtlaT1XSGwHMI6HrM8T0rQEmY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  6 May 2020 16:39:01 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200429163743.67854-1-marex@denx.de>
 <13aabff1-d4d0-7afb-6a57-a8136e35c6a4@st.com>
 <1d9cbde1-2be1-f54e-7c65-202f2bc7e0a9@denx.de>
 <b100645c-32ac-325d-5838-0fab2c93df22@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <6dc6b79f-2a20-3899-e42f-eabaeb33a829@denx.de>
Date: Wed, 6 May 2020 16:39:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b100645c-32ac-325d-5838-0fab2c93df22@st.com>
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

T24gNS82LzIwIDQ6MjYgUE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4gCj4gCj4gCj4+IEFs
bCByaWdodCwgdGhhbmtzLgo+Pgo+PiBidHcgSSBoYWQgdGhpcyBpbnRlcm5hbCBkaXNjdXNzaW9u
IG5vdyBhYm91dCBoYW5kbGluZyB0aGUgY29tYmluYXRvcmlhbAo+PiBleHBsb3Npb24gb2YgYm9h
cmQgRFRzIGhlcmUuIElmIHdlIHN1cHBvcnQgdGhlbSBhbGwsIGJ5IHRoZSBlbmQgb2YgdGhlCj4+
IGxpZmVzcGFuIG9mIHRoZXNlIGRldmljZXMsIHdlIGVuZCB1cCB3aXRoOgo+Pgo+PiBTVE0zMk1Q
MTV7MSwzLDd9e2EsYyxkLGZ9IFNvTSByZXYuIHswLi43fTAwIG9uIGJhc2Vib2FyZCByZXYuIHsw
Li43fTAwLgo+Pgo+PiBUaGVyZSB3b24ndCBiZSBldmVyeSBTb00gYW5kIGJhc2Vib2FyZCByZXZp
c2lvbiBjb21iaW5hdGlvbiBhbGwgcmlnaHQuCj4+IEJ1dCBldmVuIHRoZSBhbW91bnQgb2YgU29N
IG9wdGlvbnMgZ2l2ZXMgbWUgMTIgRFRzLiBUaGF0IGlzIG5vdCBhIGxvdwo+PiBudW1iZXIuIERv
ZXMgU1QgaGF2ZSBzb21lIHBsYW4gdG8gaGFuZGxlIHN1Y2ggc2l0dWF0aW9uID8KPiAKPiBZZXMg
SSBoYXZlIHRoZSBzYW1lIHBvaW50IGluIG1pbmQuIEhvdyB0byBtYWludGFpbiBhbGwgYm9hcmRz
ID8gU2hvdWxkCj4gd2UgcmVmdXNlIHNvbWUgYm9hcmRzIGFuZCBvbmx5IGtlZXAgb25lIGFzIGV4
YW1wbGUgPwoKQnV0IHdoaWNoIG9uZXMgZG8geW91IHdhbnQgdG8gZHJvcD8gVGhlIHBkazIgaXMg
YSBkZXZraXQgLCBzbyB5b3UgY2FuCnB1dCBpbiBhbnkgU29NIG9wdGlvbiwgdGhhdCdzIHRoZSBw
cm9ibGVtLgoKPj4gSSBjYW4gaW1hZ2luZSB0aGF0IFUtQm9vdCBjYW4gcGF0Y2ggdGhlIERUIGFu
ZCBlbmFibGUvZGlzYWJsZQo+PiBmdW5jdGlvbmFsaXR5ICwgd2hpY2ggY291bGQgaGFuZGxlIHRo
ZSB7YSxjLGQsZn0gb3B0aW9ucyBhbmQgcmVkdWNlIHRoZQo+PiBhbW91bnQgb2YgRFRzLiBJdCBj
b3VsZCBwb3NzaWJseSBhbHNvIGhhbmRsZSB0aGUgezEsMyw3fSBvcHRpb25zLgo+Pgo+IAo+IEl0
IGlzIHNvbWV0aGluZyBJIGRpc2N1c3NlZCB3aXRoIEtldmluIEhpbG1hbiBhdCBFTENFIGFuZCBz
b21ldGltZSB3aXRoCj4gUm9iIG9uIElJUmMuIFdlIGNvdWxkIHVzZSB1LWJvb3QgdG8gaGFuZGxl
IGRpZmZlcmVuY2VzIGJldHdlZW4gU29DLCBhbmQKPiBib2FyZHMuIFRlY2huaWNhbGx5IGl0J3Mg
cG9zc2libGUgYnV0IHRoZSBtYWluIGlzc3VlIGRvaW5nIHRoYXQgaXMswqAgeW91Cj4gd2lsbCBo
aWRlIHNvbWUgdXBkYXRlcyBpbiB5b3VyIGJvb3Rsb2FkZXIgYW5kIHRoZW4geW91ciBkdGIgdXNl
ZCBieQo+IGtlcm5lbCB3aWxsIG5vdCByZWZsZWN0IHlvdXIgZHRzIGZpbGUuIEl0IGNvdWxkIGJl
IGNvbmZ1c2VkIGZvcgo+IGN1c3RvbWVycyBhbmQgdXNlcnMuCgpZZXMuCgo+PiBBbnkgb3RoZXIg
aWRlYXMgPwo+IAo+IFdoYXQgaXMgZm9yIHlvdSB0aGUgbWFpbiBpc3N1ZSA/IHRoZSBudW1iZXIg
b2YgZmlsZXMgdG8gYWRkIG9yIGhvdyB0bwo+IG1haW50YWluIGFsbCB0aG9zZSBmaWxlcyA/CgpU
aGUgbnVtYmVyLiBNYWludGFpbmluZyB0aGVtIGlzIG5vdCB0aGF0IG11Y2ggb2YgYSBwcm9ibGVt
LgoKPiBJZiBpdCBpcyB0aGUgbnVtYmVyIG9mIGZpbGVzIHRvIGFkZCwgd2UgY2FuIHRoaW5rIGFi
b3V0IHNldmVyYWwgd2F5czoKPiAKPiAxLUFzIG1lbnRpb25lZCBhYm92ZSwgdG8gb25seSBrZWVw
IGtpbmQgb2YgcmVmZXJlbmNlIHBsYXRmb3Jtcwo+IAo+IDItSGF2ZSB2ZW5kb3IgZGlyZWN0b3Jp
ZXMgaW4gYXJjaC9hcm0vYm9vdC9kdHMgKGJ1dCBpdCdzIGFub3RoZXIgc3RvcnkKPiB0byBtYWtl
IGl0IGFjY2VwdGVkKQoKTWF5YmUgdGhhdCdzIHNvbWV0aGluZyB3ZSBzaG91bGQgY29uc2lkZXIg
Zm9yIGFybTMyLCBidXQgdGhhdCdzIGEKZGlmZmVyZW50IGRpc2N1c3Npb24gYWx0b2dldGhlci4K
Cj4gMy1PciBtYXliZSB1c2UgRFRCTyB0byBvdmVyd3JpdGUgc29tZSBjb25maWd1cmF0aW9uLgo+
IAo+IElmIHRoZSBjb25jZXJuIGlzIGFib3V0IGhvdyB0byBtYWludGFpbiwgbWF5YmUgSSdtIHdy
b25nIGJ1dCBJIHRoaW5rCj4gdGhhdCB3aXRoIGEgZ29vZCBzcGxpdCBhbmQgZmFjdG9yaXphdGlv
biB3ZSBjb3VsZCBtaW5pbWl6ZSBzdXBwb3J0Lgo+IAo+IEN1cnJlbnRseSBJIG9ubHkgdGhvc2Ug
dGhpbmdzIGluIG1pbmQgYnV0IG5vdGhpbmcgcmVhbGx5IG1hdHVyZS4KCkkgaG9wZSB0aGlzIHBh
dGNoc2V0IGRvZXMgdGhlIHNwbGl0IHJpZ2h0LCBpdCdzIHRoZSBudW1iZXIuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
