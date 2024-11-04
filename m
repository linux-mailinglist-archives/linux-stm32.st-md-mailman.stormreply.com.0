Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB79BB0D5
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 11:18:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF3F7C6DD66;
	Mon,  4 Nov 2024 10:18:55 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80227C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2024 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730715530;
 bh=/BqvSMpzIqUrh5h8PydNqYZk+71Ku8Hj2PODCROFwpI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CzWRbvj8/pyD1ZMGCxhxWd7tLZTkAJdm6ZqhdISZcqc3Of8hl7ClnfCJ9uNK29czu
 8qjJMjbf5L1ZAhAoNZhFfL4kdMsaSg9XYJfqUABwQgaFVEG+buPWl+uSMrhcDucnC6
 40Pwfvei/3WemTpOZRCRDi5GAo797qNEvZbbmNK2z1plwGdxckWhjdGvKeCL2/NrbR
 npqhZAEk5SIfyr4ksowGlfrFu9YBIvHaQnNNdjM81FCfLBf/QIg9GZBoLxaH29gpdg
 Yf8V060wqDVEK0istqFXnnYmQmJbF6pncJ9H/QfhC+m0LrITeVLX/LiYYc35E3RNFt
 drkQCwiPEF9KQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C1D017E1541;
 Mon,  4 Nov 2024 11:18:49 +0100 (CET)
Message-ID: <9a1ce320-e1ce-4d2f-a8d1-7680155ef71f@collabora.com>
Date: Mon, 4 Nov 2024 11:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] net: stmmac: dwmac-mediatek: Fix
 inverted logic for mediatek, mac-wol
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

SWwgMDEvMTEvMjQgMTY6MjAsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
VGhpcyBzZXJpZXMgZml4ZXMgdGhlIGludmVydGVkIGhhbmRsaW5nIG9mIHRoZSBtZWRpYXRlayxt
YWMtd29sIERUCj4gcHJvcGVydHkgd2hpbGUga2VlcGluZyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5
LiBJdCBkb2VzIHNvIGJ5IGludHJvZHVjaW5nCj4gYSBuZXcgcHJvcGVydHkgb24gcGF0Y2ggMSBh
bmQgdXBkYXRpbmcgdGhlIGRyaXZlciB0byBoYW5kbGUgaXQgb24gcGF0Y2gKPiAyLiBQYXRjaCAz
IGFkZHMgdGhpcyBwcm9wZXJ0eSBvbiB0aGUgR2VuaW8gNzAwIEVWSyBEVCwgd2hlcmUgdGhpcyBp
c3N1ZQo+IHdhcyBub3RpY2VkLCB0byBnZXQgV09MIHdvcmtpbmcgb24gdGhhdCBwbGF0Zm9ybS4g
UGF0Y2ggNCBhZGRzIHRoZSBuZXcKPiBwcm9wZXJ0eSBvbiBhbGwgRFRzIHdpdGggdGhlIE1lZGlh
VGVrIERXTUFDIGV0aGVybmV0IG5vZGUgZW5hYmxlZAo+IGFuZCBpbnZlcnRzIHRoZSBwcmVzZW5j
ZSBvZiBtZWRpYXRlayxtYWMtd29sIHRvIG1haW50YWluIHRoZQo+IGN1cnJlbnQgYmVoYXZpb3Ig
YW5kIGhhdmUgaXQgbWF0Y2ggdGhlIGRlc2NyaXB0aW9uIGluIHRoZSBiaW5kaW5nLgo+IAoKQWN0
dWFsbHksIEknbSBzdXJlIHRoYXQgYWxsIG9mIHRoZXNlIGJvYXJkcyAqZG8qIG5lZWQgTUFDIFdP
TCBhbmQgKm5vdCogUEhZIFdPTC4KClRoZSBvbmx5IG9uZSBJJ20gdW5zdXJlIGFib3V0IGlzIE1U
MjcxMiwgYnV0IHRoYXQncyBhbiBldmFsdWF0aW9uIGJvYXJkIGFuZCBub3QKYSByZXRhaWwgcHJv
ZHVjdCB3aXRoICJ0aGF0IGtpbmQgb2YgZGlmZnVzaW9uIi4KCkkgdGhpbmsgeW91IGNhbiBqdXN0
IGZpeCB0aGUgYnVnIGluIHRoZSBkcml2ZXIgd2l0aG91dCBnZXR0aW5nIG5ldyBwcm9wZXJ0aWVz
CmFuZCBzdWNoLiBPbmUgY29tbWl0LCB0d28gbGluZXMuCgpDaGVlcnMsCkFuZ2VsbwoKPiBTaWdu
ZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5j
b20+Cj4gLS0tCj4gTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gKDQpOgo+ICAgICAgICBuZXQ6IGR0
LWJpbmRpbmdzOiBkd21hYzogSW50cm9kdWNlIG1lZGlhdGVrLG1hYy13b2wtbm9uaW52ZXJ0ZWQK
PiAgICAgICAgbmV0OiBzdG1tYWM6IGR3bWFjLW1lZGlhdGVrOiBIYW5kbGUgbm9uLWludmVydGVk
IG1lZGlhdGVrLG1hYy13b2wKPiAgICAgICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IG10ODM5MC1n
ZW5pby03MDAtZXZrOiBFbmFibGUgZXRoZXJuZXQgTUFDIFdPTAo+ICAgICAgICBhcm02NDogZHRz
OiBtZWRpYXRlazogQWRkIG1lZGlhdGVrLG1hYy13b2wtbm9uaW52ZXJ0ZWQgdG8gZXRoZXJuZXQg
bm9kZXMKPiAKPiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbWVkaWF0
ZWstZHdtYWMueWFtbCAgICAgfCAxMSArKysrKysrKysrKwo+ICAgYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDI3MTItZXZiLmR0cyAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gICBh
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS1kZW1vLmR0cyAgICAgICAgICAgICAg
ICAgIHwgIDIgKysKPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MzkwLWdlbmlv
LTcwMC1ldmsuZHRzICAgICAgICAgfCAgMSArCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODM5NS1nZW5pby0xMjAwLWV2ay5kdHMgICAgICAgIHwgIDIgKy0KPiAgIGFyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1LWtvbnRyb24tMy01LXNiYy1pMTIwMC5kdHMgfCAg
MiArKwo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgzOTUtcmFkeGEtbmlvLTEy
bC5kdHMgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1tZWRpYXRlay5jICAgICAgICAgIHwgIDkgKysrKysrLS0tCj4gICA4IGZpbGVz
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1j
b21taXQ6IGM4ODQxNmJhMDc0YTg5MTNjZjZkNjFiNzg5ZGQ4MzRiYmNhNjY4MWMKPiBjaGFuZ2Ut
aWQ6IDIwMjQxMTAxLW1lZGlhdGVrLW1hYy13b2wtbm9uaW52ZXJ0ZWQtMTk4YzZjNDA0NTM2Cj4g
Cj4gQmVzdCByZWdhcmRzLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
