Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B68AC37C0
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 03:38:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC178C78F71;
	Mon, 26 May 2025 01:38:53 +0000 (UTC)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8556DC78F6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 01:38:52 +0000 (UTC)
Message-ID: <7a42e9d1-93ce-4666-b7e7-3c0b4e2c0c99@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1748223531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hFUsN/K02BBP5aa1d+e+JjhSauhkH1OuFe7JHH5P4E=;
 b=SRmnfHNINkkKfSn8W6N3pK4Z32Bvd80Uh08Q+VdxonIAirvRyyHDvIwm8ANYNOvux0/JLO
 0U2c1dWTONVN/nJbFvjAgwMBItF9uxzGpG/L5ch0SkuohWyu1lMmpHsVjDjvtxMxO1S6Z2
 TyB5xx15aOYf1UA8YhwNyYLwFBVbGo0=
Date: Mon, 26 May 2025 09:38:41 +0800
MIME-Version: 1.0
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250526002924.2567843-2-james.hilliard1@gmail.com>
X-Migadu-Flow: FLOW_OUT
Cc: Paul Kocialkowski <paulk@sys-base.io>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Yinggang Gu <guyinggang@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow
 runtime AC200/AC300 phy selection
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

CuWcqCA1LzI2LzI1IDg6MjkgQU0sIEphbWVzIEhpbGxpYXJkIOWGmemBkzoKPiBUaGUgQWxsd2lu
bmVyIEg2MTYgc2hpcHMgd2l0aCB0d28gZGlmZmVyZW50IG9uLWRpZSBwaHkgdmFyaWFudHMsIGlu
Cj4gb3JkZXIgdG8gZGV0ZXJtaW5lIHRoZSBwaHkgYmVpbmcgdXNlZCB3ZSBuZWVkIHRvIHJlYWQg
YW4gZWZ1c2UgYW5kCj4gdGhlbiBzZWxlY3QgdGhlIGFwcHJvcHJpYXRlIFBIWSBiYXNlZCBvbiB0
aGUgQUMzMDAgYml0Lgo+Cj4gQnkgZGVmaW5pbmcgYW4gZW1hYyBub2RlIHdpdGhvdXQgYSBwaHkt
aGFuZGxlIHdlIGNhbiBvdmVycmlkZSB0aGUKPiBkZWZhdWx0IFBIWSBzZWxlY3Rpb24gbG9naWMg
aW4gc3RtbWFjIGJ5IHBhc3NpbmcgYSBzcGVjaWZpYyBwaHlfbm9kZQo+IHNlbGVjdGVkIGJhc2Vk
IG9uIHRoZSBhYzIwMCBhbmQgYWMzMDAgbmFtZXMgaW4gYSBwaHlzIGxpc3QuCj4KPiBUaGlzIGFs
bG93cyB1cyB0byBoYXZlIGEgZGV2aWNlIHRyZWUgdGhhdCBkZWZpbmVzIGJvdGggUEhZIHZhcmlh
bnRzCj4gZXZlbiB0aG91Z2ggb25seSBvbmUgd2lsbCBhY3R1YWxseSBlbmQgdXAgYmVpbmcgdXNl
ZCBhdCBydW50aW1lCj4gYmFzZWQgb24gdGhlIGFjMzAwIG52bWVtIGVmdXNlIGJpdC4KPgo+IFNp
Z25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+
IC0tLQo+ICAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIHwg
MTkgKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1zdW44aS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
c3VuOGkuYwo+IGluZGV4IDZjN2U4NjU1YTdlYi4uZTI3NWY0Y2FhNjg0IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bjhpLmMKPiArKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jCj4gQEAg
LTExLDYgKzExLDcgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9tZGlvLW11eC5oPgo+ICAgI2luY2x1
ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4KPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L252bWVtLWNvbnN1bWVyLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvb2Yu
aD4KPiAgICNpbmNsdWRlIDxsaW51eC9vZl9tZGlvLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvb2Zf
bmV0Lmg+Cj4gQEAgLTI4MCw2ICsyODEsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGVtYWNfdmFy
aWFudCBlbWFjX3ZhcmlhbnRfaDYgPSB7Cj4gICAjZGVmaW5lIFNZU0NPTl9FVENTX0VYVF9HTUlJ
CTB4MQo+ICAgI2RlZmluZSBTWVNDT05fRVRDU19JTlRfR01JSQkweDIKPiAgIAoKPiArI2RlZmlu
ZSBBQzMwMF9LRVkJCUJJVCg4KQo+ICsKCkkgaGF2ZSBvYnNlcnZlZCBhbGwgdGhlIEJJVCBtYWNy
b3MgaW4gdGhpcyBmaWxlLCBhbmQgdGhleSBhbGwKCmhhdmUgYSBsaW5lIG9mIGNvbW1lbnRzLiBJ
IHRoaW5rIGEgY29tbWVudCBpcyBhbHNvIG5lZWRlZCBoZXJlLgoKPiAgIC8qIHN1bjhpX2R3bWFj
X2RtYV9yZXNldCgpIC0gcmVzZXQgdGhlIEVNQUMKPiAgICAqIENhbGxlZCBmcm9tIHN0bW1hYyB2
aWEgc3RtbWFjX2RtYV9vcHMtPnJlc2V0Cj4gICAgKi8KPiBAQCAtMTE1OSw2ICsxMTYyLDcgQEAg
c3RhdGljIGludCBzdW44aV9kd21hY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICAgCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2Owo+ICAgCXN0cnVjdCByZWdtYXAgKnJlZ21h
cDsKPiAgIAlpbnQgcmV0Owo+ICsJdTE2IHZhbDsKPiAgIAo+ICAgCXJldCA9IHN0bW1hY19nZXRf
cGxhdGZvcm1fcmVzb3VyY2VzKHBkZXYsICZzdG1tYWNfcmVzKTsKPiAgIAlpZiAocmV0KQo+IEBA
IC0xMjIyLDYgKzEyMjYsMjEgQEAgc3RhdGljIGludCBzdW44aV9kd21hY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCWlmIChJU19FUlIocGxhdF9kYXQpKQo+ICAgCQly
ZXR1cm4gUFRSX0VSUihwbGF0X2RhdCk7Cj4gICAKPiArCWlmICghbnZtZW1fY2VsbF9yZWFkX3Ux
NihkZXYsICJhYzMwMCIsICZ2YWwpKSB7Cj4gKwkJY29uc3QgY2hhciAqcGh5X25hbWUgPSAodmFs
ICYgQUMzMDBfS0VZKSA/ICJhYzMwMCIgOiAiYWMyMDAiOwo+ICsJCWludCBpbmRleCA9IG9mX3By
b3BlcnR5X21hdGNoX3N0cmluZyhkZXYtPm9mX25vZGUsICJwaHktbmFtZXMiLCBwaHlfbmFtZSk7
Cj4gKwkJaWYgKGluZGV4IDwgMCkgewo+ICsJCQlkZXZfZXJyKGRldiwgIlBIWSBuYW1lIG5vdCBm
b3VuZCBpbiBkZXZpY2UgdHJlZVxuIik7Cj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsJCX0KPiAr
Cj4gKwkJcGxhdF9kYXQtPnBoeV9ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUs
ICJwaHlzIiwgaW5kZXgpOwo+ICsJCWlmICghcGxhdF9kYXQtPnBoeV9ub2RlKSB7Cj4gKwkJCWRl
dl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBQSFkgbm9kZSBmcm9tIHBoeXMgcHJvcGVydHlcbiIp
Owo+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPiArCQl9Cj4gKwl9Cj4gKwpIb3cgYWJvdXQgcHJlcGFy
aW5nIGEgc2VwYXJhdGUgZnVuY3Rpb24gZm9yIGl0P8KgIFRoZW4gY2FsbCBpdCBpbiBwcm9iZSgp
LgoKSWYgeW91IGFyZSB3aWxsaW5nIHRvIGRvIHNvLCByZW1lbWJlciB0byB3cml0ZSBhIGNvZGUg
Y29tbWVudC4KCgpUaGFua3MsCgpZYW50ZW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
