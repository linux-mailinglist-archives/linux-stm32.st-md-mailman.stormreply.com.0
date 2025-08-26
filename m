Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA4B358E6
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 11:29:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2403BC3F930;
	Tue, 26 Aug 2025 09:29:13 +0000 (UTC)
Received: from mail-m155110.qiye.163.com (mail-m155110.qiye.163.com
 [101.71.155.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75360C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 09:29:11 +0000 (UTC)
Received: from [172.16.12.153] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 20a66879b;
 Tue, 26 Aug 2025 17:29:06 +0800 (GMT+08:00)
Message-ID: <ae11b993-5844-4da1-b433-c27b5a73060a@rock-chips.com>
Date: Tue, 26 Aug 2025 17:29:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250815023515.114-1-kernel@airkyi.com>
 <CGME20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93@eucas1p2.samsung.com>
 <a30a8c97-6b96-45ba-bad7-8a40401babc2@samsung.com>
 <d0fe6d16-181f-4b38-9457-1099fb6419d0@rock-chips.com>
 <809848c9-2ffa-4743-adda-b8b714b404de@samsung.com>
 <aKxnHFSrVeM7Be5A@shell.armlinux.org.uk>
 <8240a3cc-aade-40d8-b2f4-09681f76be68@rock-chips.com>
 <aK19bSmrbXjoVXdO@shell.armlinux.org.uk>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aK19bSmrbXjoVXdO@shell.armlinux.org.uk>
X-HM-Tid: 0a98e5b5b15b03abkunm7ebc238e12acdf2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkpJHVZIGUJDTEtPTR9JH0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=d+nvem5rq+OdX5QANolTVxd6PoZAEDv1TqtFvJ3xCapUp0mrt5rvGanWBQuRmxpya0wc2AL+cDxtbWGKDw1ZAleQS4w0XgNjQvhsDvLOodrUm5jzmofqfL0aOAV645iDH7xQIjlMx/bZ0IEstSGFCxriCCPC15is03iEJTesAgg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=lBlDCclLQ1+AiQeVLpAB/kctkShHB5e19AZ8+JDxJP0=;
 h=date:mime-version:subject:message-id:from;
Cc: Chaoyi Chen <kernel@airkyi.com>, Jonas Karlman <jonas@kwiboo.se>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gOC8yNi8yMDI1IDU6MjUgUE0sIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKCj4gT24g
VHVlLCBBdWcgMjYsIDIwMjUgYXQgMDQ6MDg6NDBQTSArMDgwMCwgQ2hhb3lpIENoZW4gd3JvdGU6
Cj4+IEhpIFJ1c3NlbGwsCj4+Cj4+IE9uIDgvMjUvMjAyNSA5OjM3IFBNLCBSdXNzZWxsIEtpbmcg
KE9yYWNsZSkgd3JvdGU6Cj4+PiBPbiBNb24sIEF1ZyAyNSwgMjAyNSBhdCAxMjo1MzozN1BNICsw
MjAwLCBNYXJlayBTenlwcm93c2tpIHdyb3RlOgo+Pj4+IE9uIDI1LjA4LjIwMjUgMTE6NTcsIENo
YW95aSBDaGVuIHdyb3RlOgo+Pj4+PiBPbiA4LzI1LzIwMjUgMzoyMyBQTSwgTWFyZWsgU3p5cHJv
d3NraSB3cm90ZToKPj4+Pj4+IE9uIDE1LjA4LjIwMjUgMDQ6MzUsIENoYW95aSBDaGVuIHdyb3Rl
Ogo+Pj4+Pj4+IEZyb206IENoYW95aSBDaGVuIDxjaGFveWkuY2hlbkByb2NrLWNoaXBzLmNvbT4K
Pj4+Pj4+Pgo+Pj4+Pj4+IEZvciBleHRlcm5hbCBwaHksIGNsa19waHkgc2hvdWxkIGJlIG9wdGlv
bmFsLCBhbmQgc29tZSBleHRlcm5hbCBwaHkKPj4+Pj4+PiBuZWVkIHRoZSBjbG9jayBpbnB1dCBm
cm9tIGNsa19waHkuIFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBzZXR0aW5nCj4+Pj4+Pj4g
Y2xrX3BoeSBmb3IgZXh0ZXJuYWwgcGh5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
RGF2aWQgV3UgPGRhdmlkLnd1QHJvY2stY2hpcHMuY29tPgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IENoYW95aSBDaGVuIDxjaGFveWkuY2hlbkByb2NrLWNoaXBzLmNvbT4KPj4+Pj4+PiAtLS0KPj4+
Pj4+Pgo+Pj4+Pj4+IENoYW5nZXMgaW4gdjM6Cj4+Pj4+Pj4gLSBMaW5rIHRvIFYyOgo+Pj4+Pj4+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi8yMDI1MDgxMjAxMjEyNy4xOTctMS1rZXJu
ZWxAYWlya3lpLmNvbS8KPj4+Pj4+PiAtIFJlYmFzZSB0byBuZXQtbmV4dC9tYWluCj4+Pj4+Pj4K
Pj4+Pj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4+Pj4+IC0gTGluayB0byBWMToKPj4+Pj4+PiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvMjAyNTA4MDYwMTE0MDUuMTE1LTEta2VybmVsQGFp
cmt5aS5jb20vCj4+Pj4+Pj4gLSBSZW1vdmUgZ2V0IGNsb2NrIGZyZXF1ZW5jeSBmcm9tIERUIHBy
b3AKPj4+Pj4+Pgo+Pj4+Pj4+ICAgwqDCoCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1yay5jIHwgMTEgKysrKysrKy0tLS0KPj4+Pj4+PiAgIMKgwqAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pj4+Pgo+Pj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5j
Cj4+Pj4+Pj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5j
Cj4+Pj4+Pj4gaW5kZXggYWM4Mjg4MzAxOTk0Li41ZDkyMWU2MmMyZjUgMTAwNjQ0Cj4+Pj4+Pj4g
LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+Pj4+
Pj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMK
Pj4+Pj4+PiBAQCAtMTQxMiwxMiArMTQxMiwxNSBAQCBzdGF0aWMgaW50IHJrX2dtYWNfY2xrX2lu
aXQoc3RydWN0Cj4+Pj4+Pj4gcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXQpCj4+Pj4+Pj4gICDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjbGtfc2V0X3JhdGUocGxhdC0+c3RtbWFjX2NsaywgNTAwMDAw
MDApOwo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+PiAgIMKgwqAgLcKgwqDCoCBpZiAo
cGxhdC0+cGh5X25vZGUgJiYgYnNwX3ByaXYtPmludGVncmF0ZWRfcGh5KSB7Cj4+Pj4+Pj4gK8Kg
wqDCoCBpZiAocGxhdC0+cGh5X25vZGUpIHsKPj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJzcF9wcml2LT5jbGtfcGh5ID0gb2ZfY2xrX2dldChwbGF0LT5waHlfbm9kZSwgMCk7Cj4+Pj4+
Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBQVFJfRVJSX09SX1pFUk8oYnNwX3ByaXYt
PmNsa19waHkpOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+Pj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiQ2Fubm90
IGdldCBQSFkgY2xvY2tcbiIpOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBjbGtfc2V0X3JhdGUo
YnNwX3ByaXYtPmNsa19waHksIDUwMDAwMDAwKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyog
SWYgaXQgaXMgbm90IGludGVncmF0ZWRfcGh5LCBjbGtfcGh5IGlzIG9wdGlvbmFsICovCj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChic3BfcHJpdi0+aW50ZWdyYXRlZF9waHkpIHsKPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJDYW5ub3Qg
Z2V0IFBIWQo+Pj4+Pj4+IGNsb2NrXG4iKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjbGtfc2V0X3JhdGUoYnNwX3ByaXYtPmNsa19waHksIDUwMDAwMDAwKTsKPj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgfQo+Pj4+PiBJIHRoaW5rwqAgd2Ugc2hvdWxkIHNldCBic3BfcHJpdi0+Y2xr
X3BoeSB0byBOVUxMIGhlcmUgaWYgd2UgZmFpbGVkIHRvCj4+Pj4+IGdldCB0aGUgY2xvY2suCj4+
Pj4+Cj4+Pj4+IENvdWxkIHlvdSB0cnkgdGhpcyBvbiB5b3VyIGJvYXJkPyBUaGFuayB5b3UuCj4+
Pj4gUmlnaHQsIHRoZSBmb2xsb3dpbmcgY2hhbmdlIGFsc28gZml4ZXMgdGhpcyBpc3N1ZToKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1yay5jCj4+Pj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1yay5jCj4+Pj4gaW5kZXggOWZjNDEyMDdjYzQ1Li4yZDE5ZDQ4YmUwMWYgMTAwNjQ0Cj4+Pj4g
LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+Pj4+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKPj4+
PiBAQCAtMTQxNSw2ICsxNDE1LDggQEAgc3RhdGljIGludCBya19nbWFjX2Nsa19pbml0KHN0cnVj
dAo+Pj4+IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0KQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKg
IGlmIChwbGF0LT5waHlfbm9kZSkgewo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBic3BfcHJpdi0+Y2xrX3BoeSA9IG9mX2Nsa19nZXQocGxhdC0+cGh5X25vZGUsIDApOwo+
Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBQVFJfRVJSX09SX1pF
Uk8oYnNwX3ByaXYtPmNsa19waHkpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmIChyZXQpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJzcF9wcml2LT5jbGtfcGh5ID0gTlVMTDsKPj4+IE9yIGp1c3Q6Cj4+Pgo+Pj4gCQljbGsg
PSBvZl9jbGtfZ2V0KHBsYXQtPnBoeV9ub2RlLCAwKTsKPj4+IAkJaWYgKGNsayA9PSBFUlJfUFRS
KC1FUFJPQkVfREVGRVIpKQo+PiBEbyB3ZSBhY3R1YWxseSBuZWVkIHRoaXM/wqBNYXliZSBvdGhl
ciBkZXZtX2Nsa19nZXQoKSBiZWZvcmUgaXQgd291bGQgZmFpbCBpbiBhZHZhbmNlLgo+IElzIGl0
IHRoZSBzYW1lIGNsb2NrIGFzIGRldm1fY2xrX2dldCgpPyBJZiBpdCBpcywgd2hhdCdzIHRoZSBw
b2ludCBvZgo+IGdldHRpbmcgaXQgYSBzZWNvbmQgdGltZS4gSWYgaXQgaXNuJ3QsIHRoZW4gaXQg
Y291bGQgYmUgYSBkaWZmZXJlbnQKPiBjbG9jayB3aGljaCBtYXkgYmUgeWV0IHRvIHByb2JlLgoK
SXQncyBub3QgdGhlIHNhbWUgY2xvY2ssIGJ1dCBpdCBzaG91bGQgYmUgdXNlIHRoZSBzYW1lIGNs
b2NrIGNvbnRyb2xsZXIgZHJpdmVyLCB3aGljaCBpcyB0aGUgQ1JVIG9uIHRoZSBSb2NrY2hpcCBw
bGF0Zm9ybS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
