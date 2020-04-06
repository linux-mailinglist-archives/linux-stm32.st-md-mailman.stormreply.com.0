Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DEF19F183
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 10:25:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67DDAC36B0E;
	Mon,  6 Apr 2020 08:25:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2349C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 08:18:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0368HUvb124787;
 Mon, 6 Apr 2020 03:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1586161050;
 bh=dBNRdO4qjuUg0RS1p/z67TE2khhRn2hu1uvilxmf+c0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=e+t0jx7+2BdPzDD4c47L46lozlZZaC6OkEtj7jZUFAFnIPnRjvA0pHPGSmJv0jA2t
 tolAaqWvl4UhUHzaIardb8IELE8ZbCfwEFoBcCnuszVl4SkYKtJpnPN8K1ko4R+dS9
 xODVjfifgPDKo+MIQt52PzzLlCguJKaWHHWh9M/g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0368HUom120221;
 Mon, 6 Apr 2020 03:17:30 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Apr
 2020 03:17:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Apr 2020 03:17:29 -0500
Received: from [10.250.133.125] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0368HMcQ118835;
 Mon, 6 Apr 2020 03:17:23 -0500
To: Amit Kucheria <amit.kucheria@verdurent.com>, Markus Elfring
 <Markus.Elfring@web.de>
References: <05f49ae7-5cc7-d6a0-fc3d-abaf2a0b373c@web.de>
 <CAHLCerMS5ghVXhOD7RAd5unxEe7w1W4_8hBP5Tf9HvuMEh5Lqg@mail.gmail.com>
From: "J, KEERTHY" <j-keerthy@ti.com>
Message-ID: <ac59c663-18a5-5bbf-09da-2cd8d034138c@ti.com>
Date: Mon, 6 Apr 2020 13:47:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHLCerMS5ghVXhOD7RAd5unxEe7w1W4_8hBP5Tf9HvuMEh5Lqg@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 06 Apr 2020 08:25:39 +0000
Cc: Pascal Paillet <p.paillet@st.com>, Tang Bin <tangbin@cmss.chinamobile.com>,
 Linux PM list <linux-pm@vger.kernel.org>, Clark Williams <williams@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Eduardo Valentin <edubezval@gmail.com>, linux-rockchip@lists.infradead.org,
 Allison Randal <allison@lohutok.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 lakml <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Subject: Re: [Linux-stm32] [PATCH] thermal: Delete an error message in four
	functions
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

CgpPbiA0LzYvMjAyMCAxOjAwIFBNLCBBbWl0IEt1Y2hlcmlhIHdyb3RlOgo+IE9uIFN1biwgQXBy
IDUsIDIwMjAgYXQgMTA6MjEgUE0gTWFya3VzIEVsZnJpbmcgPE1hcmt1cy5FbGZyaW5nQHdlYi5k
ZT4gd3JvdGU6Cj4+Cj4+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4KPj4gRGF0ZTogU3VuLCA1IEFwciAyMDIwIDE4OjM1OjE2ICswMjAwCj4+Cj4+
IFRoZSBmdW5jdGlvbiDigJxwbGF0Zm9ybV9nZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJyb3IgYWxy
ZWFkeS4KPj4gVGh1cyBvbWl0IHJlZHVuZGFudCBtZXNzYWdlcyBmb3IgdGhlIGV4Y2VwdGlvbiBo
YW5kbGluZyBpbiB0aGUKPj4gY2FsbGluZyBmdW5jdGlvbnMuCj4+Cj4+IFRoaXMgaXNzdWUgd2Fz
IGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+CgpS
ZXZpZXdlZC1ieTogS2VlcnRoeSA8ai1rZWVydGh5QHRpLmNvbT4KCj4gCj4gUmV2aWV3ZWQtYnk6
IEFtaXQgS3VjaGVyaWEgPGFtaXQua3VjaGVyaWFAbGluYXJvLm9yZz4KPiAKPj4gLS0tCj4+ICAg
ZHJpdmVycy90aGVybWFsL3JvY2tjaGlwX3RoZXJtYWwuYyAgICAgICAgICB8IDQgKy0tLQo+PiAg
IGRyaXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsX21lbW1hcC5jICAgICAgfCA0ICstLS0KPj4g
ICBkcml2ZXJzL3RoZXJtYWwvc3Qvc3RtX3RoZXJtYWwuYyAgICAgICAgICAgIHwgNCArLS0tCj4+
ICAgZHJpdmVycy90aGVybWFsL3RpLXNvYy10aGVybWFsL3RpLWJhbmRnYXAuYyB8IDUgKystLS0K
Pj4gICA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvcm9ja2NoaXBfdGhlcm1hbC5jIGIvZHJp
dmVycy90aGVybWFsL3JvY2tjaGlwX3RoZXJtYWwuYwo+PiBpbmRleCA3YzFhOGJjY2RjYmEuLjE1
YTcxZWNjOTE2YyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy90aGVybWFsL3JvY2tjaGlwX3RoZXJt
YWwuYwo+PiArKysgYi9kcml2ZXJzL3RoZXJtYWwvcm9ja2NoaXBfdGhlcm1hbC5jCj4+IEBAIC0x
MjQxLDEwICsxMjQxLDggQEAgc3RhdGljIGludCByb2NrY2hpcF90aGVybWFsX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTlhJ
TzsKPj4KPj4gICAgICAgICAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPj4gLSAg
ICAgICBpZiAoaXJxIDwgMCkgewo+PiAtICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2
LCAibm8gaXJxIHJlc291cmNlP1xuIik7Cj4+ICsgICAgICAgaWYgKGlycSA8IDApCj4+ICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+IC0gICAgICAgfQo+Pgo+PiAgICAgICAgICB0
aGVybWFsID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZihzdHJ1Y3Qgcm9ja2NoaXBf
dGhlcm1hbF9kYXRhKSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VS
TkVMKTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsX21lbW1h
cC5jIGIvZHJpdmVycy90aGVybWFsL3N0L3N0X3RoZXJtYWxfbWVtbWFwLmMKPj4gaW5kZXggYTgy
NGI3OGRhYmY4Li5hMDExNDQ1MmQxMWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC9z
dC9zdF90aGVybWFsX21lbW1hcC5jCj4+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9zdC9zdF90aGVy
bWFsX21lbW1hcC5jCj4+IEBAIC05NCwxMCArOTQsOCBAQCBzdGF0aWMgaW50IHN0X21tYXBfcmVn
aXN0ZXJfZW5hYmxlX2lycShzdHJ1Y3Qgc3RfdGhlcm1hbF9zZW5zb3IgKnNlbnNvcikKPj4gICAg
ICAgICAgaW50IHJldDsKPj4KPj4gICAgICAgICAgc2Vuc29yLT5pcnEgPSBwbGF0Zm9ybV9nZXRf
aXJxKHBkZXYsIDApOwo+PiAtICAgICAgIGlmIChzZW5zb3ItPmlycSA8IDApIHsKPj4gLSAgICAg
ICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIElSUVxuIik7Cj4+ICsg
ICAgICAgaWYgKHNlbnNvci0+aXJxIDwgMCkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gc2Vu
c29yLT5pcnE7Cj4+IC0gICAgICAgfQo+Pgo+PiAgICAgICAgICByZXQgPSBkZXZtX3JlcXVlc3Rf
dGhyZWFkZWRfaXJxKGRldiwgc2Vuc29yLT5pcnEsCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTlVMTCwgc3RfbW1hcF90aGVybWFsX3RyaXBfaGFuZGxlciwKPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jIGIvZHJpdmVycy90
aGVybWFsL3N0L3N0bV90aGVybWFsLmMKPj4gaW5kZXggOTMxNGUzZGY2YTQyLi4zMzFlMmI3Njhk
ZjUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jCj4+ICsr
KyBiL2RyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jCj4+IEBAIC0zODUsMTAgKzM4NSw4
IEBAIHN0YXRpYyBpbnQgc3RtX3JlZ2lzdGVyX2lycShzdHJ1Y3Qgc3RtX3RoZXJtYWxfc2Vuc29y
ICpzZW5zb3IpCj4+ICAgICAgICAgIGludCByZXQ7Cj4+Cj4+ICAgICAgICAgIHNlbnNvci0+aXJx
ID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPj4gLSAgICAgICBpZiAoc2Vuc29yLT5pcnEg
PCAwKSB7Cj4+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIiVzOiBVbmFibGUgdG8gZmlu
ZCBJUlFcbiIsIF9fZnVuY19fKTsKPj4gKyAgICAgICBpZiAoc2Vuc29yLT5pcnEgPCAwKQo+PiAg
ICAgICAgICAgICAgICAgIHJldHVybiBzZW5zb3ItPmlycTsKPj4gLSAgICAgICB9Cj4+Cj4+ICAg
ICAgICAgIHJldCA9IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoZGV2LCBzZW5zb3ItPmlycSwK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLAo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL3RpLXNvYy10aGVybWFsL3RpLWJhbmRnYXAuYyBiL2Ry
aXZlcnMvdGhlcm1hbC90aS1zb2MtdGhlcm1hbC90aS1iYW5kZ2FwLmMKPj4gaW5kZXggMjYzYjA0
MjBmYmU0Li5hYjE5Y2VmZjZlMmEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC90aS1z
b2MtdGhlcm1hbC90aS1iYW5kZ2FwLmMKPj4gKysrIGIvZHJpdmVycy90aGVybWFsL3RpLXNvYy10
aGVybWFsL3RpLWJhbmRnYXAuYwo+PiBAQCAtNzcyLDEwICs3NzIsOSBAQCBzdGF0aWMgaW50IHRp
X2JhbmRnYXBfdGFsZXJ0X2luaXQoc3RydWN0IHRpX2JhbmRnYXAgKmJncCwKPj4gICAgICAgICAg
aW50IHJldDsKPj4KPj4gICAgICAgICAgYmdwLT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IDApOwo+PiAtICAgICAgIGlmIChiZ3AtPmlycSA8IDApIHsKPj4gLSAgICAgICAgICAgICAgIGRl
dl9lcnIoJnBkZXYtPmRldiwgImdldF9pcnEgZmFpbGVkXG4iKTsKPj4gKyAgICAgICBpZiAoYmdw
LT5pcnEgPCAwKQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiBiZ3AtPmlycTsKPj4gLSAgICAg
ICB9Cj4+ICsKPj4gICAgICAgICAgcmV0ID0gcmVxdWVzdF90aHJlYWRlZF9pcnEoYmdwLT5pcnEs
IE5VTEwsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRpX2JhbmRnYXBf
dGFsZXJ0X2lycV9oYW5kbGVyLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBJUlFGX1RSSUdHRVJfSElHSCB8IElSUUZfT05FU0hPVCwKPj4gLS0KPj4gMi4yNi4wCj4+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
