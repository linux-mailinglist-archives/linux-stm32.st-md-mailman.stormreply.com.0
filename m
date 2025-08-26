Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 964FAB35669
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 10:08:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 565D9C3F92F;
	Tue, 26 Aug 2025 08:08:49 +0000 (UTC)
Received: from mail-m49245.qiye.163.com (mail-m49245.qiye.163.com
 [45.254.49.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E8B8C3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 08:08:47 +0000 (UTC)
Received: from [172.16.12.153] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 20a3254b0;
 Tue, 26 Aug 2025 16:08:42 +0800 (GMT+08:00)
Message-ID: <8240a3cc-aade-40d8-b2f4-09681f76be68@rock-chips.com>
Date: Tue, 26 Aug 2025 16:08:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20250815023515.114-1-kernel@airkyi.com>
 <CGME20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93@eucas1p2.samsung.com>
 <a30a8c97-6b96-45ba-bad7-8a40401babc2@samsung.com>
 <d0fe6d16-181f-4b38-9457-1099fb6419d0@rock-chips.com>
 <809848c9-2ffa-4743-adda-b8b714b404de@samsung.com>
 <aKxnHFSrVeM7Be5A@shell.armlinux.org.uk>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aKxnHFSrVeM7Be5A@shell.armlinux.org.uk>
X-HM-Tid: 0a98e56c163203abkunmeb456a22128a486
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlJTFZJHRpIT0lNTh1KT0hWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=UusjxQNFmrhgPsBeO4BSS3vwfcXBVWMPRqRdZNCreD0Y3L9qO8EqBSlYU2i1ULdp+iyY6GbBaf/00QZeXLzGw3wjtT9ZJo4HN1rR7oYsMs2ha4d9dM+kLxiPLGjbAciiCssQvAVh1ppofzqZbMudcpH4MkQE7IH114QtmiGhntE=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=59s5xl47iUIECmsf5jnpdKqma5NgiHbA2ceA9PEBxGI=;
 h=date:mime-version:subject:message-id:from;
Cc: Chaoyi Chen <kernel@airkyi.com>, Jonas Karlman <jonas@kwiboo.se>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
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

SGkgUnVzc2VsbCwKCk9uIDgvMjUvMjAyNSA5OjM3IFBNLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkg
d3JvdGU6Cj4gT24gTW9uLCBBdWcgMjUsIDIwMjUgYXQgMTI6NTM6MzdQTSArMDIwMCwgTWFyZWsg
U3p5cHJvd3NraSB3cm90ZToKPj4gT24gMjUuMDguMjAyNSAxMTo1NywgQ2hhb3lpIENoZW4gd3Jv
dGU6Cj4+PiBPbiA4LzI1LzIwMjUgMzoyMyBQTSwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPj4+
PiBPbiAxNS4wOC4yMDI1IDA0OjM1LCBDaGFveWkgQ2hlbiB3cm90ZToKPj4+Pj4gRnJvbTogQ2hh
b3lpIENoZW4gPGNoYW95aS5jaGVuQHJvY2stY2hpcHMuY29tPgo+Pj4+Pgo+Pj4+PiBGb3IgZXh0
ZXJuYWwgcGh5LCBjbGtfcGh5IHNob3VsZCBiZSBvcHRpb25hbCwgYW5kIHNvbWUgZXh0ZXJuYWwg
cGh5Cj4+Pj4+IG5lZWQgdGhlIGNsb2NrIGlucHV0IGZyb20gY2xrX3BoeS4gVGhpcyBwYXRjaCBh
ZGRzIHN1cHBvcnQgZm9yIHNldHRpbmcKPj4+Pj4gY2xrX3BoeSBmb3IgZXh0ZXJuYWwgcGh5Lgo+
Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXdSA8ZGF2aWQud3VAcm9jay1jaGlwcy5j
b20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENoYW95aSBDaGVuIDxjaGFveWkuY2hlbkByb2NrLWNo
aXBzLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+Cj4+Pj4+IENoYW5nZXMgaW4gdjM6Cj4+Pj4+IC0gTGlu
ayB0byBWMjoKPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjUwODEyMDEy
MTI3LjE5Ny0xLWtlcm5lbEBhaXJreWkuY29tLwo+Pj4+PiAtIFJlYmFzZSB0byBuZXQtbmV4dC9t
YWluCj4+Pj4+Cj4+Pj4+IENoYW5nZXMgaW4gdjI6Cj4+Pj4+IC0gTGluayB0byBWMToKPj4+Pj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjUwODA2MDExNDA1LjExNS0xLWtlcm5l
bEBhaXJreWkuY29tLwo+Pj4+PiAtIFJlbW92ZSBnZXQgY2xvY2sgZnJlcXVlbmN5IGZyb20gRFQg
cHJvcAo+Pj4+Pgo+Pj4+PiAgwqDCoCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1yay5jIHwgMTEgKysrKysrKy0tLS0KPj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKPj4+Pj4gYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4+Pj4+IGluZGV4
IGFjODI4ODMwMTk5NC4uNWQ5MjFlNjJjMmY1IDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKPj4+Pj4gQEAgLTE0MTIsMTIg
KzE0MTIsMTUgQEAgc3RhdGljIGludCBya19nbWFjX2Nsa19pbml0KHN0cnVjdAo+Pj4+PiBwbGF0
X3N0bW1hY2VuZXRfZGF0YSAqcGxhdCkKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa19z
ZXRfcmF0ZShwbGF0LT5zdG1tYWNfY2xrLCA1MDAwMDAwMCk7Cj4+Pj4+ICDCoMKgwqDCoMKgwqAg
fQo+Pj4+PiAgwqDCoCAtwqDCoMKgIGlmIChwbGF0LT5waHlfbm9kZSAmJiBic3BfcHJpdi0+aW50
ZWdyYXRlZF9waHkpIHsKPj4+Pj4gK8KgwqDCoCBpZiAocGxhdC0+cGh5X25vZGUpIHsKPj4+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJzcF9wcml2LT5jbGtfcGh5ID0gb2ZfY2xrX2dldChwbGF0
LT5waHlfbm9kZSwgMCk7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBQVFJfRVJS
X09SX1pFUk8oYnNwX3ByaXYtPmNsa19waHkpOwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHJl
dCkKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCByZXQsICJDYW5ub3QgZ2V0IFBIWSBjbG9ja1xuIik7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBj
bGtfc2V0X3JhdGUoYnNwX3ByaXYtPmNsa19waHksIDUwMDAwMDAwKTsKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIC8qIElmIGl0IGlzIG5vdCBpbnRlZ3JhdGVkX3BoeSwgY2xrX3BoeSBpcyBvcHRpb25h
bCAqLwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGJzcF9wcml2LT5pbnRlZ3JhdGVkX3BoeSkg
ewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiQ2Fu
bm90IGdldCBQSFkKPj4+Pj4gY2xvY2tcbiIpOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjbGtfc2V0X3JhdGUoYnNwX3ByaXYtPmNsa19waHksIDUwMDAwMDAwKTsKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIH0KPj4+IEkgdGhpbmvCoCB3ZSBzaG91bGQgc2V0IGJzcF9wcml2LT5jbGtfcGh5
IHRvIE5VTEwgaGVyZSBpZiB3ZSBmYWlsZWQgdG8KPj4+IGdldCB0aGUgY2xvY2suCj4+Pgo+Pj4g
Q291bGQgeW91IHRyeSB0aGlzIG9uIHlvdXIgYm9hcmQ/IFRoYW5rIHlvdS4KPj4gUmlnaHQsIHRo
ZSBmb2xsb3dpbmcgY2hhbmdlIGFsc28gZml4ZXMgdGhpcyBpc3N1ZToKPj4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKPj4gYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4+IGluZGV4IDlm
YzQxMjA3Y2M0NS4uMmQxOWQ0OGJlMDFmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKPj4gQEAgLTE0MTUsNiArMTQxNSw4IEBAIHN0
YXRpYyBpbnQgcmtfZ21hY19jbGtfaW5pdChzdHJ1Y3QKPj4gcGxhdF9zdG1tYWNlbmV0X2RhdGEg
KnBsYXQpCj4+ICAgwqDCoMKgwqDCoMKgwqAgaWYgKHBsYXQtPnBoeV9ub2RlKSB7Cj4+ICAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJzcF9wcml2LT5jbGtfcGh5ID0gb2ZfY2xrX2dl
dChwbGF0LT5waHlfbm9kZSwgMCk7Cj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldCA9IFBUUl9FUlJfT1JfWkVSTyhic3BfcHJpdi0+Y2xrX3BoeSk7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBic3BfcHJpdi0+Y2xrX3BoeSA9IE5VTEw7Cj4gT3IganVzdDoK
Pgo+IAkJY2xrID0gb2ZfY2xrX2dldChwbGF0LT5waHlfbm9kZSwgMCk7Cj4gCQlpZiAoY2xrID09
IEVSUl9QVFIoLUVQUk9CRV9ERUZFUikpCgpEbyB3ZSBhY3R1YWxseSBuZWVkIHRoaXM/wqBNYXli
ZSBvdGhlciBkZXZtX2Nsa19nZXQoKSBiZWZvcmUgaXQgd291bGQgZmFpbCBpbiBhZHZhbmNlLgoK
Cj4gCQkJLi4uCj4gCQllbHNlIGlmICghSVNfRVJSKQo+IAkJCWJzcF9wcml2LT5jbGtfcGh5ID0g
Y2xrOwo+Cj4gSSBkb24ndCBoYXZlIGEgZnJlZSB0ZXJtaW5hbCB0byB3b3JrIG91dCB3aGF0ICIu
Li4iIHNob3VsZCBiZS4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
