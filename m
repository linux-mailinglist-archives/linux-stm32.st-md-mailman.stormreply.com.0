Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C0A438DB
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 10:11:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABD46C78F6A;
	Tue, 25 Feb 2025 09:11:08 +0000 (UTC)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF151C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:11:07 +0000 (UTC)
Message-ID: <425215fb-8fb5-4412-87e7-1d29c4ac0b7f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1740474667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+uneR/mJS3GnAKzOPOj3taPV7XZaDcHgKVZzaJi0fo=;
 b=DDefn0rw48FmnpU4dE1uzQN58xOKblryXKII2hPkQlzaPz9m/h8jhLz7SHxlkpRBfpxqtO
 zqlhWACWT2n6KotMuGTBKZH/4KDxrB1BeTioPMtSI5wvaY4aXn8wOp8uFvSG3FE52bafWy
 gbI0sciBbXJFt9Pdp4DL92u1CiJP6VA=
Date: Tue, 25 Feb 2025 17:10:58 +0800
MIME-Version: 1.0
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Philipp Stanner
 <pstanner@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Qing Zhang <zhangqing@loongson.cn>
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-5-phasta@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250224135321.36603-5-phasta@kernel.org>
X-Migadu-Flow: FLOW_OUT
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/4] stmmac: Remove pcim_*
 functions for driver detach
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

CuWcqCAyLzI0LzI1IDk6NTMgUE0sIFBoaWxpcHAgU3Rhbm5lciDlhpnpgZM6Cj4gRnVuY3Rpb25z
IHByZWZpeGVkIHdpdGggInBjaW1fIiBhcmUgbWFuYWdlZCBkZXZyZXMgZnVuY3Rpb25zIHdoaWNo
Cj4gcGVyZm9ybSBhdXRvbWF0aWMgY2xlYW51cCBvbmNlIHRoZSBkcml2ZXIgdW5sb2Fkcy4gSXQg
aXMsIHRodXMsIG5vdAo+IG5lY2Vzc2FyeSB0byBjYWxsIGFueSBjbGVhbnVwIGZ1bmN0aW9ucyBp
biByZW1vdmUoKSBjYWxsYmFja3MuCj4KPiBSZW1vdmUgdGhlIHBjaW1fIGNsZWFudXAgZnVuY3Rp
b24gY2FsbHMgaW4gdGhlIHJlbW92ZSgpIGNhbGxiYWNrcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBo
aWxpcHAgU3Rhbm5lciA8cGhhc3RhQGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jIHwgIDcgLS0tLS0tLQo+ICAg
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BjaS5jICAgICB8IDEw
IC0tLS0tLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTcgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdz
b24uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29u
LmMKPiBpbmRleCBlM2NhY2QwODViM2YuLmYzZWE2MDE2YmU2OCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gKysrIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+IEBA
IC02MTQsMTMgKzYxNCw2IEBAIHN0YXRpYyB2b2lkIGxvb25nc29uX2R3bWFjX3JlbW92ZShzdHJ1
Y3QgcGNpX2RldiAqcGRldikKPiAgIAlpZiAobGQtPmxvb25nc29uX2lkID09IERXTUFDX0NPUkVf
TFNfTVVMVElDSEFOKQo+ICAgCQlsb29uZ3Nvbl9kd21hY19tc2lfY2xlYXIocGRldik7Cj4gICAK
PiAtCWZvciAoaSA9IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsKPiAtCQlpZiAocGNp
X3Jlc291cmNlX2xlbihwZGV2LCBpKSA9PSAwKQo+IC0JCQljb250aW51ZTsKPiAtCQlwY2ltX2lv
dW5tYXBfcmVnaW9ucyhwZGV2LCBCSVQoaSkpOwo+IC0JCWJyZWFrOwo+IC0JfQo+IC0KPiAgIAlw
Y2lfZGlzYWJsZV9kZXZpY2UocGRldik7Cj4gICB9Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BjaS5jIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BjaS5jCj4gaW5kZXggMzUyYjAxNjc4YzIy
Li45MWZmNmMxNWY5NzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX3BjaS5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX3BjaS5jCj4gQEAgLTIyNywyMCArMjI3LDEwIEBAIHN0YXRpYyBpbnQg
c3RtbWFjX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAgICAqCj4gICAgKiBAcGRl
djogcGxhdGZvcm0gZGV2aWNlIHBvaW50ZXIKCj4gICAgKiBEZXNjcmlwdGlvbjogdGhpcyBmdW5j
dGlvbiBjYWxscyB0aGUgbWFpbiB0byBmcmVlIHRoZSBuZXQgcmVzb3VyY2VzCgpUaGVyZSBpcyBh
IG1pc3NpbmcgZnVsbCBzdG9wLiBZb3UgY29tbWVudGVkIG9uIHRoZSBuZXh0IGVtYWlsLAoKYW5k
IGl0IHNlZW1zIHRoYXQgeW91IGFyZSBhbHJlYWR5IHByZXBhcmluZyBmb3IgdjQuwqAgV2l0aCB0
aGlzCgoKUmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpLnlhbnRlbmdAbGludXguZGV2PgoKVGhh
bmtzLApZYW50ZW5nCgo+IC0gKiBhbmQgcmVsZWFzZXMgdGhlIFBDSSByZXNvdXJjZXMuCj4gICAg
Ki8KPiAgIHN0YXRpYyB2b2lkIHN0bW1hY19wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQo+ICAgewo+IC0JaW50IGk7Cj4gLQo+ICAgCXN0bW1hY19kdnJfcmVtb3ZlKCZwZGV2LT5kZXYp
Owo+IC0KPiAtCWZvciAoaSA9IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsKPiAtCQlp
ZiAocGNpX3Jlc291cmNlX2xlbihwZGV2LCBpKSA9PSAwKQo+IC0JCQljb250aW51ZTsKPiAtCQlw
Y2ltX2lvdW5tYXBfcmVnaW9ucyhwZGV2LCBCSVQoaSkpOwo+IC0JCWJyZWFrOwo+IC0JfQo+ICAg
fQo+ICAgCj4gICBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bW1hY19wY2lfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
