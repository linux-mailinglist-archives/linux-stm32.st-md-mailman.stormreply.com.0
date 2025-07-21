Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF279B0BF7C
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 10:57:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BDE6C32E8E;
	Mon, 21 Jul 2025 08:57:36 +0000 (UTC)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A00AC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 08:57:35 +0000 (UTC)
Received: from [192.168.2.202] (p5dc55eaf.dip0.t-ipconnect.de [93.197.94.175])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9118D61E64844;
 Mon, 21 Jul 2025 10:56:34 +0200 (CEST)
Message-ID: <8c9e97e4-3590-49a8-940b-717deac0078d@molgen.mpg.de>
Date: Mon, 21 Jul 2025 10:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jason Xing <kerneljasonxing@gmail.com>
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-2-kerneljasonxing@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250721083343.16482-2-kerneljasonxing@gmail.com>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, maciej.fijalkowski@intel.com,
 hawk@kernel.org, ast@kernel.org, magnus.karlsson@intel.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, bjorn@kernel.org,
 mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH net-next 1/2] stmmac:
 xsk: fix underflow of budget in zerocopy mode
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

RGVhciBKYXNvbiwKCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCgpBbSAyMS4wNy4yNSB1bSAx
MDozMyBzY2hyaWViIEphc29uIFhpbmc6Cj4gRnJvbTogSmFzb24gWGluZyA8a2VybmVseGluZ0B0
ZW5jZW50LmNvbT4KPiAKPiBUaGUgaXNzdWUgY2FuIGhhcHBlbiB3aGVuIHRoZSBidWRnZXQgbnVt
YmVyIG9mIGRlc2NzIGFyZSBjb25zdW1lZC4gQXMKCkluc3RlYWQgb2Yg4oCcVGhlIGlzc3Vl4oCd
LCBJ4oCZZCB1c2Ug4oCcQW4gdW5kZXJmbG93IOKApuKAnS4KCj4gbG9uZyBhcyB0aGUgYnVkZ2V0
IGlzIGRlY3JlYXNlZCB0byB6ZXJvLCBpdCB3aWxsIGFnYWluIGdvIGludG8KPiB3aGlsZSAoYnVk
Z2V0LS0gPiAwKSBzdGF0ZW1lbnQgYW5kIGdldCBkZWNyZWFzZWQgYnkgb25lLCBzbyB0aGUKPiB1
bmRlcmZsb3cgaXNzdWUgY2FuIGhhcHBlbi4gSXQgd2lsbCBsZWFkIHRvIHJldHVybmluZyB0cnVl
IHdoZXJlYXMgdGhlCj4gZXhwZWN0ZWQgdmFsdWUgc2hvdWxkIGJlIGZhbHNlLgoKV2hhdCBpcyDi
gJxpdOKAnT8KCj4gSW4gdGhpcyBjYXNlIHdoZXJlIGFsbCB0aGUgYnVkZ2V0IGFyZSB1c2VkIHVw
LCBpdCBtZWFucyB6YyBmdW5jdGlvbgoKKmlzKiB1c2VkPwoKPiBzaG91bGQgcmV0dXJuIGZhbHNl
IHRvIGxldCB0aGUgcG9sbCBydW4gYWdhaW4gYmVjYXVzZSBub3JtYWxseSB3ZQo+IG1pZ2h0IGhh
dmUgbW9yZSBkYXRhIHRvIHByb2Nlc3MuCgpEbyB5b3UgaGF2ZSBhIHJlcHJvZHVjZXIsIHlvdSBj
b3VsZCBhZGQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlPwoKPiBGaXhlczogMTMyYzMyZWU1YmMwICgi
bmV0OiBzdG1tYWM6IEFkZCBUWCB2aWEgWERQIHplcm8tY29weSBzb2NrZXQiKQo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uIFhpbmcgPGtlcm5lbHhpbmdAdGVuY2VudC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIHwgNCArKystCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4g
aW5kZXggZjM1MGE2NjYyODgwLi5lYTU1NDFmOWU5YTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ICsrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiBAQCAtMjU5Niw3ICsy
NTk2LDcgQEAgc3RhdGljIGJvb2wgc3RtbWFjX3hkcF94bWl0X3pjKHN0cnVjdCBzdG1tYWNfcHJp
diAqcHJpdiwgdTMyIHF1ZXVlLCB1MzIgYnVkZ2V0KQo+ICAgCj4gICAJYnVkZ2V0ID0gbWluKGJ1
ZGdldCwgc3RtbWFjX3R4X2F2YWlsKHByaXYsIHF1ZXVlKSk7Cj4gICAKPiAtCXdoaWxlIChidWRn
ZXQtLSA+IDApIHsKPiArCXdoaWxlIChidWRnZXQgPiAwKSB7CgpTbywgaWYgdGhlIHdoaWxlIGxv
b3Agc2hvdWxkIG5vdCBiZSBlbnRlcmVkIHdpdGggYnVkZ2V0IGJlaW5nIDAsIHRoZW4gCnRoZSBs
aW5lIGNvdWxkICBiZSBjaGFuZ2VkIHRvIGB3aGlsZSAoLS1idWRnZXQgPiAwKSB7YD8gQnV0IHRo
ZW4gaXQgCndvdWxkbuKAmXQgYmUgY2FsbGVkIGZvciBidWRnZXQgYmVpbmcgMS4KCkEgZm9yIGxv
b3AgbWlnaHQgYmUgdGhlIGJldHRlciBjaG9pY2UgZm9yIGEgbG9vcCB3aXRoIGJ1ZGdldCBhcyBj
b3VudGluZyAKdmFyaWFibGU/Cgo+ICAgCQlzdHJ1Y3Qgc3RtbWFjX21ldGFkYXRhX3JlcXVlc3Qg
bWV0YV9yZXE7Cj4gICAJCXN0cnVjdCB4c2tfdHhfbWV0YWRhdGEgKm1ldGEgPSBOVUxMOwo+ICAg
CQlkbWFfYWRkcl90IGRtYV9hZGRyOwo+IEBAIC0yNjgxLDYgKzI2ODEsOCBAQCBzdGF0aWMgYm9v
bCBzdG1tYWNfeGRwX3htaXRfemMoc3RydWN0IHN0bW1hY19wcml2ICpwcml2LCB1MzIgcXVldWUs
IHUzMiBidWRnZXQpCj4gICAKPiAgIAkJdHhfcS0+Y3VyX3R4ID0gU1RNTUFDX0dFVF9FTlRSWSh0
eF9xLT5jdXJfdHgsIHByaXYtPmRtYV9jb25mLmRtYV90eF9zaXplKTsKPiAgIAkJZW50cnkgPSB0
eF9xLT5jdXJfdHg7Cj4gKwo+ICsJCWJ1ZGdldC0tOwo+ICAgCX0KPiAgIAl1NjRfc3RhdHNfdXBk
YXRlX2JlZ2luKCZ0eHFfc3RhdHMtPm5hcGlfc3luY3ApOwo+ICAgCXU2NF9zdGF0c19hZGQoJnR4
cV9zdGF0cy0+bmFwaS50eF9zZXRfaWNfYml0LCB0eF9zZXRfaWNfYml0KTsKCkV4Y3VzZSBteSBp
Z25vcmFuY2UsIGJ1dCBJIGRvIG5vdCB5ZXQgc2VlIHRoZSBwcm9ibGVtIHRoYXQgdGhlIHdoaWxl
IApsb29wIGlzIGVudGVyZWQgYW5kIGJ1ZmZlciBpcyBzZXQgdG8gMC4gSXMgaXQgbGF0ZXIgdGhl
IHJldHVybiBjb25kaXRpb24/CgogICAgIHJldHVybiAhIWJ1ZGdldCAmJiB3b3JrX2RvbmU7CgoK
S2luZCByZWdhcmRzLAoKUGF1bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
