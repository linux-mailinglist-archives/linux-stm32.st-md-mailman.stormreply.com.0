Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 926C51C71CC
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 15:38:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE111C32EAB;
	Wed,  6 May 2020 13:38:20 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E306C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 13:38:19 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49HHjQ2dxcz1s1JW;
 Wed,  6 May 2020 15:38:18 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49HHjQ1bvBz1qv7v;
 Wed,  6 May 2020 15:38:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3KN4bsAQxT6U; Wed,  6 May 2020 15:38:16 +0200 (CEST)
X-Auth-Info: 4DWnPBYHMklv/kwreqt1QFvRGEODd0nz79rnH37mwv8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  6 May 2020 15:38:16 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200429163743.67854-1-marex@denx.de>
 <13aabff1-d4d0-7afb-6a57-a8136e35c6a4@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <1d9cbde1-2be1-f54e-7c65-202f2bc7e0a9@denx.de>
Date: Wed, 6 May 2020 15:37:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <13aabff1-d4d0-7afb-6a57-a8136e35c6a4@st.com>
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

T24gNS82LzIwIDk6NDYgQU0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4gSGkgTWFyZWsKCkhp
LAoKPiBPbiA0LzI5LzIwIDY6MzcgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBBZGQgYW5vdGhl
ciBtdXggb3B0aW9uIGZvciBJMkMyIHBpbnMsIHRoaXMgaXMgdXNlZCBvbiBBVjk2IGJvYXJkLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gQ2M6IEFs
ZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgo+PiBDYzogTWFuaXZhbm5h
biBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4KPj4gQ2M6IE1h
eGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPj4gQ2M6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KPj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkg
PHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPgo+PiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQo+PiBUbzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4+IC0tLQo+PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNp
IHwgMTcgKysrKysrKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5j
dHJsLmR0c2kKPj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpCj4+
IGluZGV4IGFlZGRjYWFkYjgyOS4uY2E0ZWRjZjM2OWQwIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0c2kKPj4gQEAgLTQwOCw2ICs0MDgsMjMgQEAgcGlucyB7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiDCoMKgwqDCoMKgIH07Cj4+IMKgICvCoMKgwqAg
aTJjMl9waW5zX2M6IGkyYzItNCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBwaW5zIHsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnRicsIDEsIEFGNCk+LCAv
KiBJMkMyX1NDTCAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMy
X1BJTk1VWCgnSCcsIDUsIEFGNCk+OyAvKiBJMkMyX1NEQSAqLwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBiaWFzLWRpc2FibGU7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRyaXZlLW9w
ZW4tZHJhaW47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNsZXctcmF0ZSA9IDwwPjsKPj4g
K8KgwqDCoMKgwqDCoMKgIH07Cj4+ICvCoMKgwqAgfTsKPj4gKwo+PiArwqDCoMKgIGkyYzJfcGlu
c19zbGVlcF9jOiBpMmMyLTUgewo+IAo+IHNob3VsZCBiZSBpMmMyLXNsZWVwLTQuIEknbGwgZml4
IGl0IGRpcmVjdGx5IHdoZW4gSSdsbCBtZXJnZS4KCkFsbCByaWdodCwgdGhhbmtzLgoKYnR3IEkg
aGFkIHRoaXMgaW50ZXJuYWwgZGlzY3Vzc2lvbiBub3cgYWJvdXQgaGFuZGxpbmcgdGhlIGNvbWJp
bmF0b3JpYWwKZXhwbG9zaW9uIG9mIGJvYXJkIERUcyBoZXJlLiBJZiB3ZSBzdXBwb3J0IHRoZW0g
YWxsLCBieSB0aGUgZW5kIG9mIHRoZQpsaWZlc3BhbiBvZiB0aGVzZSBkZXZpY2VzLCB3ZSBlbmQg
dXAgd2l0aDoKClNUTTMyTVAxNXsxLDMsN317YSxjLGQsZn0gU29NIHJldi4gezAuLjd9MDAgb24g
YmFzZWJvYXJkIHJldi4gezAuLjd9MDAuCgpUaGVyZSB3b24ndCBiZSBldmVyeSBTb00gYW5kIGJh
c2Vib2FyZCByZXZpc2lvbiBjb21iaW5hdGlvbiBhbGwgcmlnaHQuCkJ1dCBldmVuIHRoZSBhbW91
bnQgb2YgU29NIG9wdGlvbnMgZ2l2ZXMgbWUgMTIgRFRzLiBUaGF0IGlzIG5vdCBhIGxvdwpudW1i
ZXIuIERvZXMgU1QgaGF2ZSBzb21lIHBsYW4gdG8gaGFuZGxlIHN1Y2ggc2l0dWF0aW9uID8KCkkg
Y2FuIGltYWdpbmUgdGhhdCBVLUJvb3QgY2FuIHBhdGNoIHRoZSBEVCBhbmQgZW5hYmxlL2Rpc2Fi
bGUKZnVuY3Rpb25hbGl0eSAsIHdoaWNoIGNvdWxkIGhhbmRsZSB0aGUge2EsYyxkLGZ9IG9wdGlv
bnMgYW5kIHJlZHVjZSB0aGUKYW1vdW50IG9mIERUcy4gSXQgY291bGQgcG9zc2libHkgYWxzbyBo
YW5kbGUgdGhlIHsxLDMsN30gb3B0aW9ucy4KCkFueSBvdGhlciBpZGVhcyA/Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
