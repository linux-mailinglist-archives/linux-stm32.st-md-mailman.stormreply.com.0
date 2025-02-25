Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FCA438AA
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 10:06:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CF42C78F6A;
	Tue, 25 Feb 2025 09:06:20 +0000 (UTC)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBAB7C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:06:19 +0000 (UTC)
Message-ID: <437d4fad-6cd4-4f90-a1bb-07193d015cad@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1740474378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lV30hEBZWC7S4rSDYnKgsoznUoPxWCDHm7ubHwj+3ww=;
 b=RZU30SkkWMDPf0R4W8ZcMdFVMAMhESLDuqfrOaBfZ2FhTz1FNYwNnhjHcyhSE7ivfaLIMv
 GAaE7ySpqQEbYPn6gyP79F+9JJPtUwG1C/mOK6wHF9a18rdSVPQLeMNpU2+mwVzZm1RCuD
 KhxroJ3p9YDVD3jJd4qYotSalUSgK+k=
Date: Tue, 25 Feb 2025 17:06:10 +0800
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
 <20250224135321.36603-4-phasta@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250224135321.36603-4-phasta@kernel.org>
X-Migadu-Flow: FLOW_OUT
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/4] stmmac: loongson: Remove
	surplus loop
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

CuWcqCAyLzI0LzI1IDk6NTMgUE0sIFBoaWxpcHAgU3Rhbm5lciDlhpnpgZM6Cj4gbG9vbmdzb25f
ZHdtYWNfcHJvYmUoKSBjb250YWlucyBhIGxvb3Agd2hpY2ggZG9lc24ndCBoYXZlIGFuIGVmZmVj
dCwKPiBiZWNhdXNlIGl0IHRyaWVzIHRvIGNhbGwgcGNpbV9pb21hcF9yZWdpb25zKCkgd2l0aCB0
aGUgc2FtZSBwYXJhbWV0ZXJzCj4gc2V2ZXJhbCB0aW1lcy4gVGhlIGJyZWFrIHN0YXRlbWVudCBh
dCB0aGUgbG9vcCdzIGVuZCBmdXJ0aGVybW9yZSBlbnN1cmVzCj4gdGhhdCB0aGUgbG9vcCBvbmx5
IHJ1bnMgb25jZSBhbnl3YXlzLgo+Cj4gUmVtb3ZlIHRoZSBzdXJwbHVzIGxvb3AuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBQaGlsaXBwIFN0YW5uZXIgPHBoYXN0YUBrZXJuZWwub3JnPgoKSXQgc2VlbXMg
dGhhdCB0aGUgZml4LXRhZyBoYXMgYmVlbiBmb3Jnb3R0ZW4sIG5leHQgdHdvIHBhdGNoZXMgYXMg
d2VsbC4KCgpSZXZpZXdlZC1ieTogWWFudGVuZyBTaSA8c2kueWFudGVuZ0BsaW51eC5kZXY+CgpU
aGFua3MsCllhbnRlbmcKCj4gLS0tCj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1sb29uZ3Nvbi5jIHwgMTEgKysrLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiBpbmRleCA3M2E2
NzE1YTkzZTYuLmUzY2FjZDA4NWIzZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+IEBAIC01NTQsMTQgKzU1NCw5
IEBAIHN0YXRpYyBpbnQgbG9vbmdzb25fZHdtYWNfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkCj4gICAJcGNpX3NldF9tYXN0ZXIocGRldik7Cj4g
ICAKPiAgIAkvKiBHZXQgdGhlIGJhc2UgYWRkcmVzcyBvZiBkZXZpY2UgKi8KPiAtCWZvciAoaSA9
IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsKPiAtCQlpZiAocGNpX3Jlc291cmNlX2xl
bihwZGV2LCBpKSA9PSAwKQo+IC0JCQljb250aW51ZTsKPiAtCQlyZXQgPSBwY2ltX2lvbWFwX3Jl
Z2lvbnMocGRldiwgQklUKDApLCBEUklWRVJfTkFNRSk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJZ290
byBlcnJfZGlzYWJsZV9kZXZpY2U7Cj4gLQkJYnJlYWs7Cj4gLQl9Cj4gKwlyZXQgPSBwY2ltX2lv
bWFwX3JlZ2lvbnMocGRldiwgQklUKDApLCBEUklWRVJfTkFNRSk7Cj4gKwlpZiAocmV0KQo+ICsJ
CWdvdG8gZXJyX2Rpc2FibGVfZGV2aWNlOwo+ICAgCj4gICAJbWVtc2V0KCZyZXMsIDAsIHNpemVv
ZihyZXMpKTsKPiAgIAlyZXMuYWRkciA9IHBjaW1faW9tYXBfdGFibGUocGRldilbMF07Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
