Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15475A1289F
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 17:24:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88EF2C78F74;
	Wed, 15 Jan 2025 16:24:55 +0000 (UTC)
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1980DC78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 16:24:48 +0000 (UTC)
Message-ID: <a6d4dd7c-3dd5-45b1-bd9c-5ec16d1564ff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736958287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Rt/FiGiWaoV/ETmmA43v61vSgTdbSa8IULrC3r6ZIE=;
 b=fruPS3fE2nNX2DzJZIt7T8OGxUW9/D+0Er9moyG2kT4U60O93Ra1Ddjp2dGLDxkc/VquLq
 lx1jN/KvUv08kZVrxQq/WVSO66rYTMLAoWGlddqpdrKdh3UYxh8p+HYwoTW5y/uh622o4f
 4ZyQkIChBDwKi8tKTk4jjkZf7cClbhY=
Date: Thu, 16 Jan 2025 00:24:06 +0800
MIME-Version: 1.0
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1736910454.git.0x1207@gmail.com>
 <2574b35be4a9ccf6c4b1788c854fe8c13951f9d5.1736910454.git.0x1207@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <2574b35be4a9ccf6c4b1788c854fe8c13951f9d5.1736910454.git.0x1207@gmail.com>
X-Migadu-Flow: FLOW_OUT
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/4] net: stmmac: Optimize
 cache prefetch in RX path
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

5ZyoIDEvMTUvMjUgMTE6MjcsIEZ1cm9uZyBYdSDlhpnpgZM6Cj4gQ3VycmVudCBjb2RlIHByZWZl
dGNoZXMgY2FjaGUgbGluZXMgZm9yIHRoZSByZWNlaXZlZCBmcmFtZSBmaXJzdCwgYW5kCj4gdGhl
biBkbWFfc3luY19zaW5nbGVfZm9yX2NwdSgpIGFnYWluc3QgdGhpcyBmcmFtZSwgdGhpcyBpcyB3
cm9uZy4KPiBDYWNoZSBwcmVmZXRjaCBzaG91bGQgYmUgdHJpZ2dlcmVkIGFmdGVyIGRtYV9zeW5j
X3NpbmdsZV9mb3JfY3B1KCkuCj4gCj4gVGhpcyBwYXRjaCBicmluZ3MgfjIuOCUgZHJpdmVyIHBl
cmZvcm1hbmNlIGltcHJvdmVtZW50IGluIGEgVENQIFJYCj4gdGhyb3VnaHB1dCB0ZXN0IHdpdGgg
aVBlcmYgdG9vbCBvbiBhIHNpbmdsZSBpc29sYXRlZCBDb3J0ZXgtQTY1IENQVQo+IGNvcmUsIDIu
ODQgR2JpdHMvc2VjIGluY3JlYXNlZCB0byAyLjkyIEdiaXRzL3NlYy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBGdXJvbmcgWHUgPDB4MTIwN0BnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRl
ciBMb2Jha2luIDxhbGVrc2FuZGVyLmxvYmFraW5AaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogWWFu
dGVuZyBTaSA8c2kueWFudGVuZ0BsaW51eC5kZXY+CgpUaGFua3MsCllhbnRlbmcKPiAtLS0KPiAg
IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCA1ICst
LS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFp
bi5jCj4gaW5kZXggODExZTJkMzcyYWJmLi5hZDkyOGU4ZTIxYTkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ICsrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiBAQCAtNTUw
OCwxMCArNTUwOCw2IEBAIHN0YXRpYyBpbnQgc3RtbWFjX3J4KHN0cnVjdCBzdG1tYWNfcHJpdiAq
cHJpdiwgaW50IGxpbWl0LCB1MzIgcXVldWUpCj4gICAKPiAgIAkJLyogQnVmZmVyIGlzIGdvb2Qu
IEdvIG9uLiAqLwo+ICAgCj4gLQkJcHJlZmV0Y2gocGFnZV9hZGRyZXNzKGJ1Zi0+cGFnZSkgKyBi
dWYtPnBhZ2Vfb2Zmc2V0KTsKPiAtCQlpZiAoYnVmLT5zZWNfcGFnZSkKPiAtCQkJcHJlZmV0Y2go
cGFnZV9hZGRyZXNzKGJ1Zi0+c2VjX3BhZ2UpKTsKPiAtCj4gICAJCWJ1ZjFfbGVuID0gc3RtbWFj
X3J4X2J1ZjFfbGVuKHByaXYsIHAsIHN0YXR1cywgbGVuKTsKPiAgIAkJbGVuICs9IGJ1ZjFfbGVu
Owo+ICAgCQlidWYyX2xlbiA9IHN0bW1hY19yeF9idWYyX2xlbihwcml2LCBwLCBzdGF0dXMsIGxl
bik7Cj4gQEAgLTU1MzMsNiArNTUyOSw3IEBAIHN0YXRpYyBpbnQgc3RtbWFjX3J4KHN0cnVjdCBz
dG1tYWNfcHJpdiAqcHJpdiwgaW50IGxpbWl0LCB1MzIgcXVldWUpCj4gICAKPiAgIAkJCWRtYV9z
eW5jX3NpbmdsZV9mb3JfY3B1KHByaXYtPmRldmljZSwgYnVmLT5hZGRyLAo+ICAgCQkJCQkJYnVm
MV9sZW4sIGRtYV9kaXIpOwo+ICsJCQlwcmVmZXRjaChwYWdlX2FkZHJlc3MoYnVmLT5wYWdlKSAr
IGJ1Zi0+cGFnZV9vZmZzZXQpOwo+ICAgCj4gICAJCQl4ZHBfaW5pdF9idWZmKCZjdHgueGRwLCBi
dWZfc3osICZyeF9xLT54ZHBfcnhxKTsKPiAgIAkJCXhkcF9wcmVwYXJlX2J1ZmYoJmN0eC54ZHAs
IHBhZ2VfYWRkcmVzcyhidWYtPnBhZ2UpLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
