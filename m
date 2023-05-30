Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C37716E29
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 21:54:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 763EFC6A614;
	Tue, 30 May 2023 19:54:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C54D8C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 19:54:29 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B357F85CA9;
 Tue, 30 May 2023 21:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685476469;
 bh=G+1Vmt9Dkgnv/Vb0JUTMTNbgBRfDLfGMaauC6b5xeLA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j2Eah2mvnXyFkp39cA9WHJOIZBPFJVKAdvknvesZU+06iy4rDsHjc8/CEosgck1d3
 8jm/OnLZ/m1IbC7iTXHV9kL9gob7UdztLdmuke/TuK7NCnlGG0DRG1kyn7pqUUVXmp
 kD38ulb5fW6geemSLCIDO0B19yfghIoGxcaRtPbkh4kB8BD+vmIXpY3ZsRd1RUdBic
 jFekVfJwLpzttkyPqcS6tgOi+DJb3FQlH9vXcLnZ0ERhWNT0K+xJQ1cFARje+M6p2d
 oI2Ym6nX4vy/jJU5UBmF3OSEM9J0FvJ9nzYzvt9J5pxCuPlkSP4Vmyb4UosDYmZuiQ
 jThrsr+hpwtPQ==
Message-ID: <d9c1809f-7359-58f8-4cdf-95f957256e55@denx.de>
Date: Tue, 30 May 2023 21:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, linux-rtc@vger.kernel.org
References: <20230518003311.415018-1-marex@denx.de>
 <4a24cd14-9cca-7499-a0d3-37f7e4c3b087@foss.st.com>
 <eb76a6e9-150a-5daf-75fd-7574c36714f8@denx.de>
 <be0aeb7e-d278-7d0e-9fdf-9974ea5a14e1@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <be0aeb7e-d278-7d0e-9fdf-9974ea5a14e1@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: Handle single EXTI IRQ as
	wake up source
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

T24gNS8zMC8yMyAxNzoxOCwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+IE9uIDUvMzAvMjMgMTY6
MTMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA1LzMwLzIzIDE2OjAyLCBBbWVsaWUgRGVsYXVu
YXkgd3JvdGU6Cj4+PiBIaSBNYXJlaywKPj4KPj4gSGVsbG8gQW1lbGllLAo+Pgo+Pj4gT24gNS8x
OC8yMyAwMjozMywgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+Pj4gVGhlIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTEuZHRzaSBzcGVjaWZpZXMgb25lIGludGVycnVwdCBmb3IgdGhlCj4+Pj4gUlRD
IG5vZGUsIHdoaWxlIHRoZSBleHBlY3RhdGlvbiBvZiB0aGUgUlRDIGRyaXZlciBpcyB0d28gaW50
ZXJydXB0cyBvbgo+Pj4+IFNUTTMyTVAxNXh4IFNvQywgb25lIGNvbm5lY3RlZCB0byBHSUMgaW50
ZXJydXB0IGNvbnRyb2xsZXIgYW5kIGFub3RoZXIKPj4+PiBvbmUgdG8gRVhUSS4gUGVyIFNUTTMy
TVAxNXh4IHJlZmVyZW5jZSBtYW51YWwsIHRoZSB0d28gaW50ZXJydXB0cyBzZXJ2ZQo+Pj4+IHRo
ZSBzYW1lIHB1cnBvc2UsIGV4Y2VwdCB0aGUgRVhUSSBvbmUgY2FuIGFsc28gd2FrZSB0aGUgc3lz
dGVtIHVwLiBUaGUKPj4+PiBFWFRJIGRyaXZlciBhbHJlYWR5IGludGVybmFsbHkgaGFuZGxlcyB0
aGlzIEdJQyBhbmQgRVhUSSBkdWFsaXR5IGFuZAo+Pj4+IG1hcHMgdGhlIEVYVEkgaW50ZXJydXB0
IG9udG8gR0lDIGR1cmluZyBydW50aW1lLCBhbmQgb25seSB1c2VzIHRoZSBFWFRJCj4+Pj4gZm9y
IHdha2UgdXAgZnVuY3Rpb25hbGl0eS4KPj4+Pgo+Pj4+IFRoZXJlZm9yZSwgZml4IHRoZSBkcml2
ZXIgc3VjaCB0aGF0IGlmIG9uIFNUTTMyTVAxNXh4IHRoZXJlIGlzIG9ubHkgb25lCj4+Pj4gaW50
ZXJydXB0IHNwZWNpZmllZCBpbiB0aGUgRFQsIHVzZSB0aGF0IGludGVycnVwdCBhcyBFWFRJIGlu
dGVycnVwdCBhbmQKPj4+PiBzZXQgaXQgYXMgd2FrZSB1cCBzb3VyY2UuCj4+Pj4KPj4+PiBUaGlz
IGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZyBpbiB0aGUga2VybmVsIGxvZyBvbiBTVE0zMk1Q
MTV4eDoKPj4+PiAiCj4+Pj4gc3RtMzJfcnRjIDVjMDA0MDAwLnJ0YzogZXJyb3IgLUVOWElPOiBJ
UlEgaW5kZXggMSBub3QgZm91bmQKPj4+PiBzdG0zMl9ydGMgNWMwMDQwMDAucnRjOiBhbGFybSBj
YW4ndCB3YWtlIHVwIHRoZSBzeXN0ZW06IC02Cj4+Pj4gIgo+Pj4+Cj4+Pj4gVGhpcyBhbHNvIGZp
eGVzIHRoZSBzeXN0ZW0gd2FrZSB1cCB2aWEgYnVpbHQtaW4gUlRDIHVzaW5nIGUuZy46Cj4+Pj4g
JCBydGN3YWtlIC1zIDUgLW0gbWVtCj4+Pj4KPj4+PiBGaXhlczogYjcyMjUyYjY1ODBjICgicnRj
OiBzdG0zMjogYWRkIHN0bTMybXAxIHJ0YyBzdXBwb3J0IikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBN
YXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+PiAtLS0KPj4+PiBDYzogQWxlc3NhbmRybyBa
dW1tbyA8YS56dW1tb0B0b3dlcnRlY2guaXQ+Cj4+Pj4gQ2M6IEFsZXhhbmRyZSBCZWxsb25pIDxh
bGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4KPj4+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8
YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPj4+PiBDYzogQW1lbGllIERFTEFVTkFZIDxh
bWVsaWUuZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Pj4gQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNv
cXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPj4+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCj4+Pj4gQ2M6IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmcKPj4+PiBDYzog
bGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4+IC0tLQo+Pj4+IMKg
IGRyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jIHwgOSArKysrKy0tLS0KPj4+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jIGIvZHJpdmVycy9ydGMvcnRjLXN0bTMyLmMKPj4+
PiBpbmRleCAyMjljYjI4NDdjYzQ4Li43Mjk5NGI5Zjk1MzE5IDEwMDY0NAo+Pj4+IC0tLSBhL2Ry
aXZlcnMvcnRjL3J0Yy1zdG0zMi5jCj4+Pj4gKysrIGIvZHJpdmVycy9ydGMvcnRjLXN0bTMyLmMK
Pj4+PiBAQCAtNzgwLDE0ICs3ODAsMTUgQEAgc3RhdGljIGludCBzdG0zMl9ydGNfcHJvYmUoc3Ry
dWN0IAo+Pj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+PiDCoMKgwqDCoMKgIHJldCA9IGRl
dmljZV9pbml0X3dha2V1cCgmcGRldi0+ZGV2LCB0cnVlKTsKPj4+PiDCoMKgwqDCoMKgIGlmIChy
dGMtPmRhdGEtPmhhc193YWtlaXJxKSB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJ0Yy0+d2FrZWly
cV9hbGFybSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHJ0Yy0+d2FrZWlycV9hbGFybSA9IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwocGRldiwgMSk7
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChydGMtPndha2VpcnFfYWxhcm0gPiAwKSB7Cj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZGV2X3BtX3NldF9kZWRpY2F0ZWRf
d2FrZV9pcnEoJnBkZXYtPmRldiwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcnRjLT53YWtlaXJxX2FsYXJtKTsK
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNl
IGlmIChydGMtPndha2VpcnFfYWxhcm0gPT0gLUVQUk9CRV9ERUZFUikgewo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHJ0Yy0+d2FrZWlycV9hbGFybTsKPj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAocnRjLT53YWtlaXJxX2FsYXJtID09IC1FUFJPQkVfREVGRVIp
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsKPj4+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNl
IHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBkZXZfcG1fc2V0X3dha2VfaXJx
KCZwZGV2LT5kZXYsIHJ0Yy0+aXJxX2FsYXJtKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+
Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+Cj4+PiBJbiBvdXIg
ZG93bnN0cmVhbSBbMV0sIGRlZGljYXRlZCB3YWtldXAgaXJxIG1hbmFnZW1lbnQgaXMgZHJvcHBl
ZDogaXQgCj4+PiBpcyBuZWl0aGVyIGRlc2NyaWJlZCBpbiBzdCxzdG0zMi1ydGMgYmluZGluZ3Mg
bm9yIHVzZWQgaW4gU1RNMzJGeCwgCj4+PiBTVE0zMkh4LCBTVE0zMk1QMXggZGV2aWNlIHRyZWVz
Lgo+Pj4gVGhlIHBvaW50ZWQgcGF0Y2ggaXMgZ29pbmcgdG8gYmUgdXBzdHJlYW1lZC4KPj4+Cj4+
PiBbMV0gCj4+PiBodHRwczovL2dpdGh1Yi5jb20vU1RNaWNyb2VsZWN0cm9uaWNzL2xpbnV4L2Nv
bW1pdC81YTQ1ZTFmMTAwZDU5YzMzYjZiNTBmZTk4YzBmNjI4NjJiZDZmM2QyCj4+Cj4+IFdvbid0
IHRoYXQgYnJlYWsgY29tcGF0aWJpbGl0eSB3aXRoIERUcyB3aGljaCBkbyB1c2UgdHdvIGludGVy
cnVwdHMgCj4+IGVudHJpZXMgPwo+IAo+IEkgZGlkbid0IGZpbmQgYW55IERUcyB1c2luZyBTVE0z
MiBSVEMgd2l0aCB0d28gaW50ZXJydXB0cy4gRGlkIEkgbWlzcyAKPiBzb21ldGhpbmc/CgpJIGFt
IG5vdCBhd2FyZSBvZiBhbnkgZWl0aGVyIChJIGFsc28gZGlkIGNoZWNrIGEgY291cGxlIG9mIHJl
cG9zaXRvcmllcyAKdG8gYmUgc3VyZSkgLiBIb3dldmVyLCB0aGUgRFQgaXMgYW4gQUJJICwgc28g
dGhlcmUgbWlnaHQgYmUgdXNlcnMgd2UgZG8gCm5vdCBrbm93IGFib3V0LCB3aG8gbWlnaHQgYmUg
dW5hYmxlIHRvIHVwZGF0ZSB0aGVpciBEVHMgLCBhbmQgd2hvIHdvdWxkIApiZSBicm9rZW4gYnkg
ZHJvcHBpbmcgdGhlIHN1cHBvcnQgZm9yIHR3byBpbnRlcnJ1cHRzLgoKT24gdGhlIG90aGVyIGhh
bmQsIEkgb25seSB1c2Ugb25lIGludGVycnVwdCBhbnl3YXksIHNvIEkgYW0gbm90IGFmZmVjdGVk
IAphbmQgSSBkb24ndCBoYXZlIGEgc3Ryb25nIHByZWZlcmVuY2UgcmVnYXJkaW5nIHdoaWNoIHBh
dGNoIGdldHMgaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
