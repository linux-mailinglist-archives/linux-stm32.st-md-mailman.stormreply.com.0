Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B2CB33D38
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 12:53:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F32EC36B31;
	Mon, 25 Aug 2025 10:53:41 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 199BDC36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 10:53:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250825105340euoutp0171d2c07c0c176e77fcfb195266c6790c~e-SBbhUbW0147801478euoutp01j
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 10:53:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250825105340euoutp0171d2c07c0c176e77fcfb195266c6790c~e-SBbhUbW0147801478euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756119220;
 bh=/fa4+ZI2ynYvAnmTSBhg899GLSJbeJtzYjuSjpeEGlo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=O7Cv3imsFNC7IeAXaIsQOTVSs76RWqKfhuY1jXd2FZM3Ej/vljQpDs3xEZkUN5oVS
 yD3dDR5BV5Iy+WZgQeEsmHuWRu5jXr5enJzwDjpRONP0YLo+IUG8+2kMY+tteupH4e
 6arTUTVUhfF3zVlfow0G8gUAI3YCMMvTsmHj+HwI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250825105339eucas1p13cf980f9b7f4ba4f465f5953b97f149c~e-SA9vcu40800108001eucas1p1m;
 Mon, 25 Aug 2025 10:53:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250825105337eusmtip19068233323fe8c45892597caf271a2e6~e-R-X77KD1201812018eusmtip19;
 Mon, 25 Aug 2025 10:53:37 +0000 (GMT)
Message-ID: <809848c9-2ffa-4743-adda-b8b714b404de@samsung.com>
Date: Mon, 25 Aug 2025 12:53:37 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>, Chaoyi Chen
 <kernel@airkyi.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Jonas Karlman <jonas@kwiboo.se>, David Wu
 <david.wu@rock-chips.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <d0fe6d16-181f-4b38-9457-1099fb6419d0@rock-chips.com>
X-CMS-MailID: 20250825105339eucas1p13cf980f9b7f4ba4f465f5953b97f149c
X-Msg-Generator: CA
X-RootMTR: 20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93
X-EPHeader: CA
X-CMS-RootMailID: 20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93
References: <20250815023515.114-1-kernel@airkyi.com>
 <CGME20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93@eucas1p2.samsung.com>
 <a30a8c97-6b96-45ba-bad7-8a40401babc2@samsung.com>
 <d0fe6d16-181f-4b38-9457-1099fb6419d0@rock-chips.com>
Cc: netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: ethernet: stmmac:
 dwmac-rk: Make the clk_phy could be used for external phy
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

T24gMjUuMDguMjAyNSAxMTo1NywgQ2hhb3lpIENoZW4gd3JvdGU6Cj4gT24gOC8yNS8yMDI1IDM6
MjMgUE0sIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6Cj4+IE9uIDE1LjA4LjIwMjUgMDQ6MzUsIENo
YW95aSBDaGVuIHdyb3RlOgo+Pj4gRnJvbTogQ2hhb3lpIENoZW4gPGNoYW95aS5jaGVuQHJvY2st
Y2hpcHMuY29tPgo+Pj4KPj4+IEZvciBleHRlcm5hbCBwaHksIGNsa19waHkgc2hvdWxkIGJlIG9w
dGlvbmFsLCBhbmQgc29tZSBleHRlcm5hbCBwaHkKPj4+IG5lZWQgdGhlIGNsb2NrIGlucHV0IGZy
b20gY2xrX3BoeS4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHNldHRpbmcKPj4+IGNsa19w
aHkgZm9yIGV4dGVybmFsIHBoeS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXdSA8ZGF2
aWQud3VAcm9jay1jaGlwcy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFveWkgQ2hlbiA8Y2hh
b3lpLmNoZW5Acm9jay1jaGlwcy5jb20+Cj4+PiAtLS0KPj4+Cj4+PiBDaGFuZ2VzIGluIHYzOgo+
Pj4gLSBMaW5rIHRvIFYyOiAKPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi8yMDI1
MDgxMjAxMjEyNy4xOTctMS1rZXJuZWxAYWlya3lpLmNvbS8KPj4+IC0gUmViYXNlIHRvIG5ldC1u
ZXh0L21haW4KPj4+Cj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4gLSBMaW5rIHRvIFYxOiAKPj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi8yMDI1MDgwNjAxMTQwNS4xMTUtMS1rZXJuZWxA
YWlya3lpLmNvbS8KPj4+IC0gUmVtb3ZlIGdldCBjbG9jayBmcmVxdWVuY3kgZnJvbSBEVCBwcm9w
Cj4+Pgo+Pj4gwqDCoCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1y
ay5jIHwgMTEgKysrKysrKy0tLS0KPj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYyAKPj4+IGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+Pj4gaW5kZXggYWM4Mjg4MzAxOTk0Li41ZDky
MWU2MmMyZjUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1yay5jCj4+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1yay5jCj4+PiBAQCAtMTQxMiwxMiArMTQxMiwxNSBAQCBzdGF0aWMgaW50IHJr
X2dtYWNfY2xrX2luaXQoc3RydWN0IAo+Pj4gcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXQpCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGtfc2V0X3JhdGUocGxhdC0+c3RtbWFjX2NsaywgNTAw
MDAwMDApOwo+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+IMKgwqAgLcKgwqDCoCBpZiAocGxhdC0+cGh5
X25vZGUgJiYgYnNwX3ByaXYtPmludGVncmF0ZWRfcGh5KSB7Cj4+PiArwqDCoMKgIGlmIChwbGF0
LT5waHlfbm9kZSkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnNwX3ByaXYtPmNsa19waHkg
PSBvZl9jbGtfZ2V0KHBsYXQtPnBoeV9ub2RlLCAwKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldCA9IFBUUl9FUlJfT1JfWkVSTyhic3BfcHJpdi0+Y2xrX3BoeSk7Cj4+PiAtwqDCoMKgwqDC
oMKgwqAgaWYgKHJldCkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgcmV0LCAiQ2Fubm90IGdldCBQSFkgY2xvY2tcbiIpOwo+Pj4gLcKgwqDCoMKg
wqDCoMKgIGNsa19zZXRfcmF0ZShic3BfcHJpdi0+Y2xrX3BoeSwgNTAwMDAwMDApOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIC8qIElmIGl0IGlzIG5vdCBpbnRlZ3JhdGVkX3BoeSwgY2xrX3BoeSBpcyBv
cHRpb25hbCAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChic3BfcHJpdi0+aW50ZWdyYXRlZF9w
aHkpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiQ2Fu
bm90IGdldCBQSFkgCj4+PiBjbG9ja1xuIik7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
bGtfc2V0X3JhdGUoYnNwX3ByaXYtPmNsa19waHksIDUwMDAwMDAwKTsKPj4+ICvCoMKgwqDCoMKg
wqDCoCB9Cj4KPiBJIHRoaW5rwqAgd2Ugc2hvdWxkIHNldCBic3BfcHJpdi0+Y2xrX3BoeSB0byBO
VUxMIGhlcmUgaWYgd2UgZmFpbGVkIHRvIAo+IGdldCB0aGUgY2xvY2suCj4KPiBDb3VsZCB5b3Ug
dHJ5IHRoaXMgb24geW91ciBib2FyZD8gVGhhbmsgeW91LgoKUmlnaHQsIHRoZSBmb2xsb3dpbmcg
Y2hhbmdlIGFsc28gZml4ZXMgdGhpcyBpc3N1ZToKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jIApiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKaW5kZXggOWZjNDEyMDdjYzQ1Li4yZDE5ZDQ4YmUw
MWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LXJrLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsu
YwpAQCAtMTQxNSw2ICsxNDE1LDggQEAgc3RhdGljIGludCBya19nbWFjX2Nsa19pbml0KHN0cnVj
dCAKcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXQpCiDCoMKgwqDCoMKgwqDCoCBpZiAocGxhdC0+
cGh5X25vZGUpIHsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBic3BfcHJpdi0+Y2xr
X3BoeSA9IG9mX2Nsa19nZXQocGxhdC0+cGh5X25vZGUsIDApOwogwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldCA9IFBUUl9FUlJfT1JfWkVSTyhic3BfcHJpdi0+Y2xrX3BoeSk7CivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBic3BfcHJpdi0+Y2xrX3BoeSA9IE5VTEw7CiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSWYgaXQgaXMgbm90IGludGVncmF0ZWRfcGh5
LCBjbGtfcGh5IGlzIG9wdGlvbmFsICovCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKGJzcF9wcml2LT5pbnRlZ3JhdGVkX3BoeSkgewogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQoKCiA+IC4uLgoKQmVzdCByZWdhcmRzCi0t
IApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
