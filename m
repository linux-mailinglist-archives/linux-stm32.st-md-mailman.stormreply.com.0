Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16990AC37F0
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 04:23:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B91AFC78F6F;
	Mon, 26 May 2025 02:23:02 +0000 (UTC)
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA815C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 02:23:01 +0000 (UTC)
Message-ID: <8f1928e5-472e-4140-875c-6b5743be8fd3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1748226180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHrrgO4T8/5vtp/a4llt3X0WdmaU+h5OTxvm6amIygc=;
 b=Zekzu02VUU4sA5O/Q7hlWJRDia/qU8bJPMeFs2zxqQb1BH6yp6B3EstCyGEgyCb5+PSHyn
 wh6v/EiZN01xVP96FIKAc8+OXWJ0aGTBTvPbw9lPiGnXDY3lSvOn8lSatgw238V+31C2YK
 JBEtsP+6KT1Cm55H4qHnrlMTw2x7V2c=
Date: Mon, 26 May 2025 10:22:47 +0800
MIME-Version: 1.0
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
References: <20250523-stmmac_tstamp_div-v1-1-bca8a5a3a477@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250523-stmmac_tstamp_div-v1-1-bca8a5a3a477@bootlin.com>
X-Migadu-Flow: FLOW_OUT
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add explicit check and error
 on invalid PTP clock rate
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

5ZyoIDUvMjMvMjUgNzo0NiBQTSwgQWxleGlzIExvdGhvcsODwqkg5YaZ6YGTOgo+IFdoaWxlIHNv
bWUgcGxhdGZvcm1zIGltcGxlbWVudGluZyBkd21hYyBvcGVuLWNvZGUgdGhlIGNsa19wdHBfcmF0
ZQo+IHZhbHVlLCBzb21lIG90aGVycyBkeW5hbWljYWxseSByZXRyaWV2ZSB0aGUgdmFsdWUgYXQg
cnVudGltZS4gSWYgdGhlCj4gcmV0cmlldmVkIHZhbHVlIGhhcHBlbnMgdG8gYmUgMCBmb3IgYW55
IHJlYXNvbiwgaXQgd2lsbCBldmVudHVhbGx5Cj4gcHJvcGFnYXRlIHVwIHRvIFBUUCBpbml0aWFs
aXphdGlvbiB3aGVuIGJyaW5naW5nIHVwIHRoZSBpbnRlcmZhY2UsCj4gbGVhZGluZyB0byBhIGRp
dmlkZSBieSAwOgo+IAo+ICAgRGl2aXNpb24gYnkgemVybyBpbiBrZXJuZWwuCj4gICBDUFU6IDEg
VUlEOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNi4xMi4zMC0wMDAwMS1n
NDgzMTNiZDU3NjhhICMyMgo+ICAgSGFyZHdhcmUgbmFtZTogU1RNMzIgKERldmljZSBUcmVlIFN1
cHBvcnQpCj4gICBDYWxsIHRyYWNlOgo+ICAgIHVud2luZF9iYWNrdHJhY2UgZnJvbSBzaG93X3N0
YWNrKzB4MTgvMHgxYwo+ICAgIHNob3dfc3RhY2sgZnJvbSBkdW1wX3N0YWNrX2x2bCsweDZjLzB4
OGMKPiAgICBkdW1wX3N0YWNrX2x2bCBmcm9tIExkaXYwXzY0KzB4OC8weDE4Cj4gICAgTGRpdjBf
NjQgZnJvbSBzdG1tYWNfaW5pdF90c3RhbXBfY291bnRlcisweDE5MC8weDFhNAo+ICAgIHN0bW1h
Y19pbml0X3RzdGFtcF9jb3VudGVyIGZyb20gc3RtbWFjX2h3X3NldHVwKzB4YzFjLzB4MTExYwo+
ICAgIHN0bW1hY19od19zZXR1cCBmcm9tIF9fc3RtbWFjX29wZW4rMHgxOGMvMHg0MzQKPiAgICBf
X3N0bW1hY19vcGVuIGZyb20gc3RtbWFjX29wZW4rMHgzYy8weGJjCj4gICAgc3RtbWFjX29wZW4g
ZnJvbSBfX2Rldl9vcGVuKzB4ZjQvMHgxYWMKPiAgICBfX2Rldl9vcGVuIGZyb20gX19kZXZfY2hh
bmdlX2ZsYWdzKzB4MWNjLzB4MjI0Cj4gICAgX19kZXZfY2hhbmdlX2ZsYWdzIGZyb20gZGV2X2No
YW5nZV9mbGFncysweDI0LzB4NjAKPiAgICBkZXZfY2hhbmdlX2ZsYWdzIGZyb20gaXBfYXV0b19j
b25maWcrMHgyZTgvMHgxMWEwCj4gICAgaXBfYXV0b19jb25maWcgZnJvbSBkb19vbmVfaW5pdGNh
bGwrMHg4NC8weDMzYwo+ICAgIGRvX29uZV9pbml0Y2FsbCBmcm9tIGtlcm5lbF9pbml0X2ZyZWVh
YmxlKzB4MWI4LzB4MjE0Cj4gICAga2VybmVsX2luaXRfZnJlZWFibGUgZnJvbSBrZXJuZWxfaW5p
dCsweDI0LzB4MTQwCj4gICAga2VybmVsX2luaXQgZnJvbSByZXRfZnJvbV9mb3JrKzB4MTQvMHgy
OAo+ICAgRXhjZXB0aW9uIHN0YWNrKDB4ZTA4MTVmYjAgdG8gMHhlMDgxNWZmOCkKPiAKPiBQcmV2
ZW50IHRoaXMgZGl2aXNpb24gYnkgMCBieSBhZGRpbmcgYW4gZXhwbGljaXQgY2hlY2sgYW5kIGVy
cm9yIGxvZwo+IGFib3V0IHRoZSBhY3R1YWwgaXNzdWUuCgogRnJvbSB5b3VyIGRlc2NyaXB0aW9u
LCBJIGNhbm5vdCBkZXRlcm1pbmUgdGhlIHNjb3BlCm9mICJzb21lIHBsYXRmb3JtcyIuIE15IHBv
aW50IGlzOiBpZiB0aGVyZSBhcmUgb25seQphIGZldyBwbGF0Zm9ybXMsIGNhbiB3ZSBmaW5kIGEg
d2F5IHRvIGhhbmRsZSB0aGlzIGluCnRoZSBkaXJlY3Rvcnkgb2YgdGhlIGNvcnJlc3BvbmRpbmcg
cGxhdGZvcm0/CgpBbmQgdGhlcmUgbmVlZCBhIEZpeGVzIHRhZy4KCgpUaGFua3MsCllhbnRlbmcK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3Rs
aW4uY29tPgo+IC0tLQo+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3Rt
bWFjX21haW4uYyB8IDUgKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3Rt
bWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19t
YWluLmMKPiBpbmRleCA5MThkN2YyZThiYTk5MjIwOGQ3ZDY1MjFhMWU5ZGJhMDEwODYwNThmLi5m
NjhlM2VjZTkxOWNjODhkMGJmMTk5YTM5NGJjN2U0NGI1ZGVlMDk1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiArKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4gQEAgLTgz
NSw2ICs4MzUsMTEgQEAgaW50IHN0bW1hY19pbml0X3RzdGFtcF9jb3VudGVyKHN0cnVjdCBzdG1t
YWNfcHJpdiAqcHJpdiwgdTMyIHN5c3RpbWVfZmxhZ3MpCj4gICAJaWYgKCEocHJpdi0+ZG1hX2Nh
cC50aW1lX3N0YW1wIHx8IHByaXYtPmRtYV9jYXAuYXRpbWVfc3RhbXApKQo+ICAgCQlyZXR1cm4g
LUVPUE5PVFNVUFA7Cj4gICAKPiArCWlmICghcHJpdi0+cGxhdC0+Y2xrX3B0cF9yYXRlKSB7Cj4g
KwkJbmV0ZGV2X2Vycihwcml2LT5kZXYsICJJbnZhbGlkIFBUUCBjbG9jayByYXRlIik7Cj4gKwkJ
cmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICAgCXN0bW1hY19jb25maWdfaHdfdHN0YW1waW5n
KHByaXYsIHByaXYtPnB0cGFkZHIsIHN5c3RpbWVfZmxhZ3MpOwo+ICAgCXByaXYtPnN5c3RpbWVf
ZmxhZ3MgPSBzeXN0aW1lX2ZsYWdzOwo+ICAgCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IGUwZTJm
NzgyNDMzODVlNzE4OGE1N2ZjZmNlYjZhMTlmNzIzZjFkZmYKPiBjaGFuZ2UtaWQ6IDIwMjUwNTIy
LXN0bW1hY190c3RhbXBfZGl2LWY1NTExMmYwNjAyOQo+IAo+IEJlc3QgcmVnYXJkcywKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
