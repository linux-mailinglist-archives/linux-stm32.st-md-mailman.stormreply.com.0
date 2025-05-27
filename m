Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C5AC4BCA
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 11:52:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D2D6C36B19;
	Tue, 27 May 2025 09:52:36 +0000 (UTC)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2501CC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 09:52:35 +0000 (UTC)
Message-ID: <6147503e-1e73-42dc-a2b9-1b0cf26ca147@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1748339554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNzPqOcrIMLkbW6pqRkowgAwEnkW9pgS1P80rwoJM3g=;
 b=PG14+0f5KR1BMnGZAy6/w+as+/MDDALfjtqd2pISAmd/GyJsxozPgbxkP36Ulhp0xRYSQV
 HWL9XZg1J5r+JF4BVayfI9XukkXMpYtBoeYASJgpNuhHawLQJSIQ6WOHZbpRvChvCLljeh
 hy28I9XIT+OxVgBZb66LRh7ViM+zpyw=
Date: Tue, 27 May 2025 17:52:26 +0800
MIME-Version: 1.0
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
References: <20250523-stmmac_tstamp_div-v1-1-bca8a5a3a477@bootlin.com>
 <8f1928e5-472e-4140-875c-6b5743be8fd3@linux.dev>
 <DA666WVCP2OB.300LVHEGH5V4Y@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <DA666WVCP2OB.300LVHEGH5V4Y@bootlin.com>
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

CuWcqCA1LzI2LzI1IDEwOjQyIFBNLCBBbGV4aXMgTG90aG9yw6kg5YaZ6YGTOgo+IE9uIE1vbiBN
YXkgMjYsIDIwMjUgYXQgNDoyMiBBTSBDRVNULCBZYW50ZW5nIFNpIHdyb3RlOgo+PiDlnKggNS8y
My8yNSA3OjQ2IFBNLCBBbGV4aXMgTG90aG9yw4PCqSDlhpnpgZM6Cj4+PiBXaGlsZSBzb21lIHBs
YXRmb3JtcyBpbXBsZW1lbnRpbmcgZHdtYWMgb3Blbi1jb2RlIHRoZSBjbGtfcHRwX3JhdGUKPj4+
IHZhbHVlLCBzb21lIG90aGVycyBkeW5hbWljYWxseSByZXRyaWV2ZSB0aGUgdmFsdWUgYXQgcnVu
dGltZS4gSWYgdGhlCj4+PiByZXRyaWV2ZWQgdmFsdWUgaGFwcGVucyB0byBiZSAwIGZvciBhbnkg
cmVhc29uLCBpdCB3aWxsIGV2ZW50dWFsbHkKPj4+IHByb3BhZ2F0ZSB1cCB0byBQVFAgaW5pdGlh
bGl6YXRpb24gd2hlbiBicmluZ2luZyB1cCB0aGUgaW50ZXJmYWNlLAo+Pj4gbGVhZGluZyB0byBh
IGRpdmlkZSBieSAwOgo+IFsuLi5dCj4KPj4gICBGcm9tIHlvdXIgZGVzY3JpcHRpb24sIEkgY2Fu
bm90IGRldGVybWluZSB0aGUgc2NvcGUKPj4gb2YgInNvbWUgcGxhdGZvcm1zIi4gTXkgcG9pbnQg
aXM6IGlmIHRoZXJlIGFyZSBvbmx5Cj4+IGEgZmV3IHBsYXRmb3JtcywgY2FuIHdlIGZpbmQgYSB3
YXkgdG8gaGFuZGxlIHRoaXMgaW4KPj4gdGhlIGRpcmVjdG9yeSBvZiB0aGUgY29ycmVzcG9uZGlu
ZyBwbGF0Zm9ybT8KPiAgRnJvbSB3aGF0IEkgY2FuIHNlZSwgaXQgY2FuIGFmZmVjdCBhbnkgcGxh
dGZvcm0gdXNpbmcgdGhlIHN0bW1hYyBkcml2ZXIgYXMKPiB0aGUgcGxhdGZvcm0gZHJpdmVyIChl
eGNlcHQgbWF5YmUgZHdtYWMtcWNvbS1ldGhxb3MuYywgd2hpY2ggZW5mb3JjZXMgYW4KPiBvcGVu
LWNvZGVkIGNsa19wdHBfcmF0ZSBhZnRlciB0aGUgc3RtbWFjX3Byb2JlX2NvbmZpZ19kdCBjYWxs
IHRoYXQgc2V0cwo+IHRoZSBjbGtfcHRwX3JhdGUpLCBpZiB0aGUgcGxhdGZvcm0gZGVjbGFyZXMg
YSBkZWRpY2F0ZWQgY2xrX3B0cF9yZWYgY2xvY2suCj4gU28gSSB3b3VsZCByYXRoZXIgc2F5IHRo
YXQgaXQgY2FuIGFmZmVjdCBtb3N0IG9mIHRoZSBwbGF0Zm9ybXMuCj4KPiBJbiBteSBjYXNlLCBJ
IGhhdmUgb2JzZXJ2ZWQgdGhlIGlzc3VlIHdpdGggdGhlIGR3bWFjLXN0bTMyLmMgZHJpdmVyLCBv
biBhbgo+IFNUTTMyTVAxNTdhLWRrMSBwbGF0Zm9ybS4KT2theSEKPgo+PiBBbmQgdGhlcmUgbmVl
ZCBhIEZpeGVzIHRhZy4KPiBPaywgSSdsbCBhZGQgYSByZWxldmFudCBGaXhlcyB0YWcuCgpPbiB0
aGlzIHByZW1pc2UsCgoKUmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpLnlhbnRlbmdAbGludXgu
ZGV2PgoKClRoYW5rcywKCllhbnRlbmcKCj4KPiBBbGV4aXMKPgo+Pj4gU2lnbmVkLW9mZi1ieTog
QWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPj4+IC0tLQo+Pj4g
ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDUg
KysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4u
YyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPj4+
IGluZGV4IDkxOGQ3ZjJlOGJhOTkyMjA4ZDdkNjUyMWExZTlkYmEwMTA4NjA1OGYuLmY2OGUzZWNl
OTE5Y2M4OGQwYmYxOTlhMzk0YmM3ZTQ0YjVkZWUwOTUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4+PiArKysgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4+PiBAQCAtODM1
LDYgKzgzNSwxMSBAQCBpbnQgc3RtbWFjX2luaXRfdHN0YW1wX2NvdW50ZXIoc3RydWN0IHN0bW1h
Y19wcml2ICpwcml2LCB1MzIgc3lzdGltZV9mbGFncykKPj4+ICAgIAlpZiAoIShwcml2LT5kbWFf
Y2FwLnRpbWVfc3RhbXAgfHwgcHJpdi0+ZG1hX2NhcC5hdGltZV9zdGFtcCkpCj4+PiAgICAJCXJl
dHVybiAtRU9QTk9UU1VQUDsKPj4+ICAgIAo+Pj4gKwlpZiAoIXByaXYtPnBsYXQtPmNsa19wdHBf
cmF0ZSkgewo+Pj4gKwkJbmV0ZGV2X2Vycihwcml2LT5kZXYsICJJbnZhbGlkIFBUUCBjbG9jayBy
YXRlIik7Cj4+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4+ICsJfQo+Pj4gKwo+Pj4gICAgCXN0bW1h
Y19jb25maWdfaHdfdHN0YW1waW5nKHByaXYsIHByaXYtPnB0cGFkZHIsIHN5c3RpbWVfZmxhZ3Mp
Owo+Pj4gICAgCXByaXYtPnN5c3RpbWVfZmxhZ3MgPSBzeXN0aW1lX2ZsYWdzOwo+Pj4gICAgCj4+
Pgo+Pj4gLS0tCj4+PiBiYXNlLWNvbW1pdDogZTBlMmY3ODI0MzM4NWU3MTg4YTU3ZmNmY2ViNmEx
OWY3MjNmMWRmZgo+Pj4gY2hhbmdlLWlkOiAyMDI1MDUyMi1zdG1tYWNfdHN0YW1wX2Rpdi1mNTUx
MTJmMDYwMjkKPj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4KPgo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
