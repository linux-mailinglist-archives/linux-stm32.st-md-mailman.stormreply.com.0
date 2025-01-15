Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 612DEA128BC
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 17:34:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19814C78F74;
	Wed, 15 Jan 2025 16:34:15 +0000 (UTC)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3210EC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 16:34:08 +0000 (UTC)
Message-ID: <171d1123-af12-4ac9-90a1-71eeca5f716d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736958847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icHLKv5VN6jwSr7MhzVN0//BkA8Uxelerc6wDiydU88=;
 b=LJeQqzuJHboM4Y2r+z5jdvuyn7WuMOgq6VU9c+TYcGUmNZrbKchqTiX6jWoFHWuZcD+RqL
 aI4aF0mkc4CgGDxDRZ5KE1pLftSWkG7NDzckMYSoSSfzIlVLX5vFeqtDaXFdOY9nqly8p8
 DROGM/1Hw+2C8GyG+oMmwgi9J9UOgCU=
Date: Thu, 16 Jan 2025 00:33:16 +0800
MIME-Version: 1.0
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1736910454.git.0x1207@gmail.com>
 <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
X-Migadu-Flow: FLOW_OUT
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/4] net: stmmac: Convert
 prefetch() to net_prefetch() for received frames
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

5ZyoIDEvMTUvMjUgMTE6MjcsIEZ1cm9uZyBYdSDlhpnpgZM6Cj4gVGhlIHNpemUgb2YgRE1BIGRl
c2NyaXB0b3JzIGlzIDMyIGJ5dGVzIGF0IG1vc3QuCj4gbmV0X3ByZWZldGNoKCkgZm9yIHJlY2Vp
dmVkIGZyYW1lcywgYW5kIGtlZXAgcHJlZmV0Y2goKSBmb3IgZGVzY3JpcHRvcnMuCj4gCj4gVGhp
cyBwYXRjaCBicmluZ3MgfjQuOCUgZHJpdmVyIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGluIGEg
VENQIFJYCj4gdGhyb3VnaHB1dCB0ZXN0IHdpdGggaVBlcmYgdG9vbCBvbiBhIHNpbmdsZSBpc29s
YXRlZCBDb3J0ZXgtQTY1IENQVQo+IGNvcmUsIDIuOTIgR2JpdHMvc2VjIGluY3JlYXNlZCB0byAz
LjA2IEdiaXRzL3NlYy4KPiAKPiBTdWdnZXN0ZWQtYnk6IEpvZSBEYW1hdG8gPGpkYW1hdG9AZmFz
dGx5LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBGdXJvbmcgWHUgPDB4MTIwN0BnbWFpbC5jb20+ClJl
dmlld2VkLWJ5OiBZYW50ZW5nIFNpIDxzaS55YW50ZW5nQGxpbnV4LmRldj4KClRoYW5rcywKWWFu
dGVuZwo+IC0tLQo+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X21haW4uYyB8IDMgKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfbWFpbi5jCj4gaW5kZXggYWQ5MjhlOGUyMWE5Li40OWI0MTE0OGQ1OTQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4u
Ywo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMKPiBAQCAtNTUyOSw3ICs1NTI5LDggQEAgc3RhdGljIGludCBzdG1tYWNfcngoc3RydWN0IHN0
bW1hY19wcml2ICpwcml2LCBpbnQgbGltaXQsIHUzMiBxdWV1ZSkKPiAgIAo+ICAgCQkJZG1hX3N5
bmNfc2luZ2xlX2Zvcl9jcHUocHJpdi0+ZGV2aWNlLCBidWYtPmFkZHIsCj4gICAJCQkJCQlidWYx
X2xlbiwgZG1hX2Rpcik7Cj4gLQkJCXByZWZldGNoKHBhZ2VfYWRkcmVzcyhidWYtPnBhZ2UpICsg
YnVmLT5wYWdlX29mZnNldCk7Cj4gKwkJCW5ldF9wcmVmZXRjaChwYWdlX2FkZHJlc3MoYnVmLT5w
YWdlKSArCj4gKwkJCQkgICAgIGJ1Zi0+cGFnZV9vZmZzZXQpOwo+ICAgCj4gICAJCQl4ZHBfaW5p
dF9idWZmKCZjdHgueGRwLCBidWZfc3osICZyeF9xLT54ZHBfcnhxKTsKPiAgIAkJCXhkcF9wcmVw
YXJlX2J1ZmYoJmN0eC54ZHAsIHBhZ2VfYWRkcmVzcyhidWYtPnBhZ2UpLAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
