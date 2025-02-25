Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC7A43902
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 10:15:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08903C78F6A;
	Tue, 25 Feb 2025 09:15:06 +0000 (UTC)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDABAC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:15:04 +0000 (UTC)
Message-ID: <a042e0ff-3c9e-45f9-a621-c15a8fc27965@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1740474904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwOgRv8FWM7xC0FLic5dPPFOQVWWI1lXpTN1kw/ZIng=;
 b=C+UKbjATfvY0KqJWT6lphcLfXqHfKo7sdCeqWUhAYnvzIZ4Yr1OGgyBr+bJvChgYPNaTW5
 TpxMuj2FPHWVPSBP7hLMCJsjU0skTjFQehT+r5cBYNUPKViVXigjO7QrL7b+XxdYtJLE96
 WGniK67QN5MD30Jb6CMLXv1kbwh13ew=
Date: Tue, 25 Feb 2025 17:14:51 +0800
MIME-Version: 1.0
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-6-phasta@kernel.org>
 <f1c3e538e19aca7fd46dd7f10da190d691bace83.camel@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <f1c3e538e19aca7fd46dd7f10da190d691bace83.camel@redhat.com>
X-Migadu-Flow: FLOW_OUT
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/4] stmmac: Replace
	deprecated PCI functions
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

CuWcqCAyLzI1LzI1IDM6MTYgUE0sIFBoaWxpcHAgU3Rhbm5lciDlhpnpgZM6Cj4gT24gTW9uLCAy
MDI1LTAyLTI0IGF0IDE0OjUzICswMTAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6Cj4+IEZyb206
IFBoaWxpcHAgU3Rhbm5lciA8cHN0YW5uZXJAcmVkaGF0LmNvbT4KPj4KPj4gVGhlIFBDSSBmdW5j
dGlvbnMKPj4gIMKgIC0gcGNpbV9pb21hcF9yZWdpb25zKCkgYW5kCj4+ICDCoCAtIHBjaW1faW9t
YXBfdGFibGUoKQo+PiBoYXZlIGJlZW4gZGVwcmVjYXRlZC4KPj4KPj4gUmVwbGFjZSB0aGVtIHdp
dGggdGhlaXIgc3VjY2Vzc29yIGZ1bmN0aW9uLCBwY2ltX2lvbWFwX3JlZ2lvbigpLgo+Pgo+PiBN
YWtlIHZhcmlhYmxlIGRlY2xhcmF0aW9uIG9yZGVyIGF0IGNsb3NlYnkgcGxhY2VzIGNvbXBseSB3
aXRoIHJldmVyc2UKPj4gY2hyaXN0bWFzIHRyZWUgb3JkZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcHAgU3Rhbm5lciA8cHN0YW5uZXJAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICDCoC4uLi9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uY8KgwqAgfCAxMSArKysr
LS0tLS0tLQo+PiAgwqBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
cGNpLmPCoMKgIHwgMTQgKysrKysrLS0tLS0tCj4+IC0tCj4+ICDCoDIgZmlsZXMgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4+IGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+PiBpbmRl
eCBmM2VhNjAxNmJlNjguLjI1ZWY3YjljNWRjZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+PiArKysgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4+IEBAIC01MjEs
MTAgKzUyMSwxMCBAQCBzdGF0aWMgaW50IGxvb25nc29uX2R3bWFjX2FjcGlfY29uZmlnKHN0cnVj
dAo+PiBwY2lfZGV2ICpwZGV2LAo+PiAgwqBzdGF0aWMgaW50IGxvb25nc29uX2R3bWFjX3Byb2Jl
KHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QKPj4gcGNpX2RldmljZV9pZCAqaWQp
Cj4+ICDCoHsKPj4gIMKgCXN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdDsKPj4gKwlz
dHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyByZXMgPSB7fTsKPj4gIMKgCXN0cnVjdCBzdG1tYWNfcGNp
X2luZm8gKmluZm87Cj4+IC0Jc3RydWN0IHN0bW1hY19yZXNvdXJjZXMgcmVzOwo+PiAgwqAJc3Ry
dWN0IGxvb25nc29uX2RhdGEgKmxkOwo+PiAtCWludCByZXQsIGk7Cj4+ICsJaW50IHJldDsKPj4g
ICAKPj4gIMKgCXBsYXQgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwbGF0KSwg
R0ZQX0tFUk5FTCk7Cj4+ICDCoAlpZiAoIXBsYXQpCj4+IEBAIC01NTQsMTMgKzU1NCwxMSBAQCBz
dGF0aWMgaW50IGxvb25nc29uX2R3bWFjX3Byb2JlKHN0cnVjdCBwY2lfZGV2Cj4+ICpwZGV2LCBj
b25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZAo+PiAgwqAJcGNpX3NldF9tYXN0ZXIocGRldik7Cj4+
ICAgCj4+ICDCoAkvKiBHZXQgdGhlIGJhc2UgYWRkcmVzcyBvZiBkZXZpY2UgKi8KPj4gLQlyZXQg
PSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgQklUKDApLCBEUklWRVJfTkFNRSk7Cj4+ICsJcmVz
LmFkZHIgPSBwY2ltX2lvbWFwX3JlZ2lvbihwZGV2LCAwLCBEUklWRVJfTkFNRSk7Cj4+ICsJcmV0
ID0gUFRSX0VSUl9PUl9aRVJPKHJlcy5hZGRyKTsKPj4gIMKgCWlmIChyZXQpCj4+ICDCoAkJZ290
byBlcnJfZGlzYWJsZV9kZXZpY2U7Cj4+ICAgCj4+IC0JbWVtc2V0KCZyZXMsIDAsIHNpemVvZihy
ZXMpKTsKPj4gLQlyZXMuYWRkciA9IHBjaW1faW9tYXBfdGFibGUocGRldilbMF07Cj4+IC0KPj4g
IMKgCXBsYXQtPmJzcF9wcml2ID0gbGQ7Cj4+ICDCoAlwbGF0LT5zZXR1cCA9IGxvb25nc29uX2R3
bWFjX3NldHVwOwo+PiAgwqAJbGQtPmRldiA9ICZwZGV2LT5kZXY7Cj4+IEBAIC02MDMsNyArNjAx
LDYgQEAgc3RhdGljIHZvaWQgbG9vbmdzb25fZHdtYWNfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2Cj4+
ICpwZGV2KQo+PiAgwqAJc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYgPSBkZXZfZ2V0X2RydmRhdGEo
JnBkZXYtPmRldik7Cj4+ICDCoAlzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYgPSBuZXRkZXZfcHJp
dihuZGV2KTsKPj4gIMKgCXN0cnVjdCBsb29uZ3Nvbl9kYXRhICpsZDsKPj4gLQlpbnQgaTsKPiBK
dXN0IHNhdyB0aGF0IHRoaXMgaXMgYSBsZWZ0LW92ZXIgdGhhdCBhY3R1YWxseSBzaG91bGQgYmUg
aW4gcGF0Y2ggMy4KPiBXaWxsIGZpeC4KPgpZZWFoLCB3aXRoIHRoaXMKCgpSZXZpZXdlZC1ieTog
WWFudGVuZyBTaSA8c2kueWFudGVuZ0BsaW51eC5kZXY+CgpUaGFua3MsCllhbnRlbmcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
