Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA20098468B
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Sep 2024 15:12:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C28BC78017;
	Tue, 24 Sep 2024 13:12:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3CB9C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Sep 2024 13:12:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 787498814D;
 Tue, 24 Sep 2024 15:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727183532;
 bh=n7OBSndBBjC1EH1IxTFK9YvGedMJTiLcAZ4olyfRRL4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=QSRdj1N1dqWU09ThEOU0wk+gZf3USpIPkoTD+TdjRYTaF7Dlivvdko/69HoLChu1g
 TXIIJPEDLifzIinOxw7xmg0RVZWyScGHzR0H5hYeTrLIwn5klvrsQQ85AylRFX5BHP
 ex80ArMi0kh1qaOkgMXLbmXcVhZICIRHteNyPwGeU8Hacre1+8Xe4eFqmh2Nz9jxh/
 +WnoqchZSlPL8ZK5enPaEOlJhHM4kuhjyn2MXhP318HVUB04mSOZjlRqtvSnT/hDCg
 7e217uoxQciUje8evEHavzYy1s0hfn9G20JqokEGUf6R8amNhCthO3sa3ybgjmgjte
 cCP5PuDVMCDhw==
Message-ID: <20d9dfe7-44a1-4f92-92bb-9b760a735e60@denx.de>
Date: Tue, 24 Sep 2024 12:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
To: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240415134903.8084-1-marex@denx.de>
 <f93b5a80-33fb-4708-ab86-6b28f626a186@denx.de>
 <4386a9c2-bf9e-4612-a928-dddb1adb9571@denx.de>
Content-Language: en-US
In-Reply-To: <4386a9c2-bf9e-4612-a928-dddb1adb9571@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4] watchdog: stm32_iwdg: Add pretimeout
	support
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

T24gOS81LzI0IDM6MTIgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDYvMjMvMjQgODoxOCBQ
TSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDQvMTUvMjQgMzo0OCBQTSwgTWFyZWsgVmFzdXQg
d3JvdGU6Cj4+PiBUaGUgU1RNMzJNUDE1eHggSVdERyBhZGRzIHJlZ2lzdGVycyB3aGljaCBwZXJt
aXQgdGhpcyBJUCB0byBnZW5lcmF0ZQo+Pj4gcHJldGltZW91dCBpbnRlcnJ1cHQuIFRoaXMgaW50
ZXJydXB0IGNhbiBhbHNvIGJlIHVzZWQgdG8gd2FrZSB0aGUgQ1BVCj4+PiBmcm9tIHN1c3BlbmQu
IEltcGxlbWVudCBzdXBwb3J0IGZvciBnZW5lcmF0aW5nIHRoaXMgaW50ZXJydXB0IGFuZCBsZXQK
Pj4+IHVzZXJzcGFjZSBjb25maWd1cmUgdGhlIHByZXRpbWVvdXQuIEluIGNhc2UgdGhlIHByZXRp
bWVvdXQgaXMgbm90Cj4+PiBjb25maWd1cmVkIGJ5IHVzZXIsIHNldCBwcmV0aW1lb3V0IHRvIDMv
NCBvZiB0aGUgV0RUIHRpbWVvdXQgY3ljbGUuCj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IENsw6ltZW50
IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4+IFRlc3RlZC1ieTog
Q2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+Pj4gU2ln
bmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+PiAtLS0KPj4+IENjOiBB
bGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+Pj4gQ2M6IEd1
ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPj4+IENjOiBNYXhpbWUgQ29xdWVsaW4g
PG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+PiBDYzogV2ltIFZhbiBTZWJyb2VjayA8d2lt
QGxpbnV4LXdhdGNoZG9nLm9yZz4KPj4+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cj4+PiBDYzogbGludXgtd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnCj4+PiAtLS0KPj4+IFYyOiAt
IFN1YnRyYWN0IHRoZSBwcmV0aW1lb3V0IHZhbHVlIGZyb20gdGltZW91dCB2YWx1ZSBiZWZvcmUg
d3JpdGluZyBpdAo+Pj4gwqDCoMKgwqDCoMKgIGludG8gdGhlIElXREcgcHJldGltZW91dCByZWdp
c3RlciwgYmVjYXVzZSB0aGUgd2F0Y2hkb2cgY291bnRlcgo+Pj4gwqDCoMKgwqDCoMKgIHJlZ2lz
dGVyIGlzIGNvdW50aW5nIGRvd24sIGFuZCB0aGUgcHJldGltZW91dCBpbnRlcnJ1cHQgdHJpZ2dl
cnMKPj4+IMKgwqDCoMKgwqDCoCB3aGVuIHdhdGNoZG9nIGNvdW50ZXIgcmVnaXN0ZXIgbWF0Y2hl
cyB0aGUgcHJldGltZW91dCByZWdpc3Rlcgo+Pj4gwqDCoMKgwqDCoMKgIGNvbnRlbnQuCj4+PiDC
oMKgwqDCoCAtIFNldCBkZWZhdWx0IHByZXRpbWVvdXQgdG8gMy80IG9mIHRpbWVvdXQgLgo+Pj4g
VjM6IC0gVXNlIGRldiBpbnN0ZWFkIG9mIHBkZXYtPmRldgo+Pj4gwqDCoMKgwqAgLSBTd2FwIG9y
ZGVyIG9mIHJldC9yZXR1cm4gMAo+Pj4gwqDCoMKgwqAgLSBTcGxpdCB0aGlzIGZyb20gdGhlIERU
IGNoYW5nZXMsIHdoaWNoIGFyZSBvcnRob2dvbmFsCj4+PiDCoMKgwqDCoCAtIFVoLCB0aGlzIHBh
dGNoIGdvdCBzdHVjayBpbiB1cHN0cmVhbWluZyBxdWV1ZSwgc29ycnkKPj4+IFY0OiAtIFVwZGF0
ZSBjb21taXQgbWVzc2FnZSB0byBtYXRjaCBWMiBkZWZhdWx0IHByZXRpbWVvdXQgdG8gMy80Cj4+
PiDCoMKgwqDCoCAtIEFkZCBSQi9UQiBmcm9tIENsw6ltZW50Cj4+Cj4+IEhpLAo+Pgo+PiBBcmUg
dGhlcmUgc3RpbGwgYW55IG9wZW4gdG9waWNzIHdpdGggdGhpcyBwYXRjaCA/Cj4gCj4gQW55dGhp
bmcgPwoKQ2FuIHRoaXMgYmUgcHVsbGVkIHZpYSB0aGUgc3RtMzIgU29DIHRyZWUgPwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
