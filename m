Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A42DA0FE58
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 02:58:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 295C4C7802B;
	Tue, 14 Jan 2025 01:58:31 +0000 (UTC)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E8CCC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 01:58:24 +0000 (UTC)
Message-ID: <e48f70bd-bb2b-4443-bb76-1b3511700043@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736819898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P1DH/dRPY0Nuv7rtnJpzenWYHpKBr5t8Ih4nWX4KnGc=;
 b=F+yGNX+EtQuMGlvoRx0cEcpciJ9enfIt5EaNKn6B6+JuXPjh0SxIMd7/fpqz1spYD3oTjD
 bNMwUbsGPaQhWVE2B9NdjxMqqkYWVpXNjOkeHWI0JGrv5g8zl3uQiSMWaYv+hOA5gqPcwp
 X50P45HGDhNCF2i2HNQQY3B6FjCuqC0=
Date: Tue, 14 Jan 2025 09:58:08 +0800
MIME-Version: 1.0
To: Andrew Lunn <andrew@lunn.ch>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
 <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
 <c4714984-8250-4bf2-9ac1-5a9204d3aca8@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <c4714984-8250-4bf2-9ac1-5a9204d3aca8@lunn.ch>
X-Migadu-Flow: FLOW_OUT
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: stm32: Use
 syscon_regmap_lookup_by_phandle_args
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

CgoK5ZyoIDIwMjUvMS8xNCAwMTowMSwgQW5kcmV3IEx1bm4g5YaZ6YGTOgo+IE9uIE1vbiwgSmFu
IDEzLCAyMDI1IGF0IDA0OjA1OjEzUE0gKzA4MDAsIFlhbnRlbmcgU2kgd3JvdGU6Cj4+IOWcqCAy
MDI1LzEvMTIgMjE6MzIsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+Pj4gVXNlIHN5c2Nv
bl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGVfYXJncygpIHdoaWNoIGlzIGEgd3JhcHBlciBvdmVy
Cj4+PiBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKCkgY29tYmluZWQgd2l0aCBnZXR0
aW5nIHRoZSBzeXNjb24KPj4+IGFyZ3VtZW50LiAgRXhjZXB0IHNpbXBsZXIgY29kZSB0aGlzIGFu
bm90YXRlcyB3aXRoaW4gb25lIGxpbmUgdGhhdCBnaXZlbgo+Pj4gcGhhbmRsZSBoYXMgYXJndW1l
bnRzLCBzbyBncmVwcGluZyBmb3IgY29kZSB3b3VsZCBiZSBlYXNpZXIuCj4+Pgo+Pj4gVGhlcmUg
aXMgYWxzbyBubyByZWFsIGJlbmVmaXQgaW4gcHJpbnRpbmcgZXJyb3JzIG9uIG1pc3Npbmcgc3lz
Y29uCj4+PiBhcmd1bWVudCwgYmVjYXVzZSB0aGlzIGlzIGRvbmUganVzdCB0b28gbGF0ZTogcnVu
dGltZSBjaGVjayBvbgo+Pj4gc3RhdGljL2J1aWxkLXRpbWUgZGF0YS4gIER0c2NoZW1hIGFuZCBE
ZXZpY2V0cmVlIGJpbmRpbmdzIG9mZmVyIHRoZQo+Pj4gc3RhdGljL2J1aWxkLXRpbWUgY2hlY2sg
Zm9yIHRoaXMgYWxyZWFkeS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4+PiAtLS0KPj4+ICAgIGRyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMgfCA5ICsrLS0tLS0t
LQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtc3RtMzIuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LXN0bTMyLmMKPj4+IGluZGV4IDFlOGJhYzY2NWNjOWJjOTVjM2FhOTZlODdhOGU5NWQ5YzYzYmE4
ZTEuLjFmY2I3NGU5ZTNmZmFjZGM3NTgxYjI2N2ZlYmI1NWQwMTVhODNhZWQgMTAwNjQ0Cj4+PiAt
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jCj4+
PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5j
Cj4+PiBAQCAtNDE5LDE2ICs0MTksMTEgQEAgc3RhdGljIGludCBzdG0zMl9kd21hY19wYXJzZV9k
YXRhKHN0cnVjdCBzdG0zMl9kd21hYyAqZHdtYWMsCj4+PiAgICAJfQo+Pj4gICAgCS8qIEdldCBt
b2RlIHJlZ2lzdGVyICovCj4+PiAtCWR3bWFjLT5yZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xvb2t1
cF9ieV9waGFuZGxlKG5wLCAic3Qsc3lzY29uIik7Cj4+PiArCWR3bWFjLT5yZWdtYXAgPSBzeXNj
b25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MobnAsICJzdCxzeXNjb24iLAo+Pj4gKwkJ
CQkJCQkgICAgIDEsICZkd21hYy0+bW9kZV9yZWcpOwo+PiBUaGUgbmV0d29yayBzdWJzeXN0ZW0g
c3RpbGwgcmVxdWlyZXMgdGhhdCB0aGUgbGVuZ3RoIG9mCj4+IGVhY2ggbGluZSBvZiBjb2RlIHNo
b3VsZCBub3QgZXhjZWVkIDgwIGNoYXJhY3RlcnMuCj4+IFNvLCBsZXQncyBzaWxlbmNlIHRoZSB3
YXJuaW5nOgo+Pgo+PiBXQVJOSU5HOiBsaW5lIGxlbmd0aCBvZiA4MyBleGNlZWRzIDgwIGNvbHVt
bnMKPj4gIzMzOiBGSUxFOiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1pbXguYzozMDc6Cj4+ICsJCQkJCQkJICAgICAmZHdtYWMtPmludGZfcmVnX29mZik7Cj4gY2hl
Y2twYXRjaCBzaG91bGQgYmUgY29uc2lkZXJlZCBhIGd1aWRlLCBub3QgYSBzdHJpY3QgY29uZm9y
bWFuY2UKPiB0b29sLiBZb3Ugb2Z0ZW4gbmVlZCB0byBsb29rIGF0IGl0cyBvdXRwdXQgYW5kIGNv
bnNpZGVyIGRvZXMgd2hhdCBpdAo+IHN1Z2dlc3QgcmVhbGx5IG1ha2UgdGhlIGNvZGUgYmV0dGVy
PyBJbiB0aGlzIGNhc2UsIGkgd291bGQgZGlzYWdyZWUKPiB3aXRoIGNoZWNrcGF0Y2ggYW5kIGFs
bG93IHRoaXMgY29kZS4KPgo+IElmIHRoZSBjb2RlIGhhZCBhbGwgYmVlbiBvbiBvbmUgbG9uZyBs
aW5lLCB0aGVuIGkgd291bGQgc3VnZ2VzdCB0bwo+IHdyYXAgaXQuIEJ1dCBhcyBpdCBpcywgaXQg
a2VlcHMgd2l0aCB0aGUgc3Bpcml0IG9mIDgwIGNoYXJhY3RlcnMsIGV2ZW4KPiBpZiBpdCBpcyB0
ZWNobmljYWxseSBub3QuCk9oLCBJIGdvdCBpdCEgVGhhbmtzIGZvciBleHBsYWluaW5nLiBZb3Ug
Y2xlYXJlZCB1cCBteSBjb25mdXNpb24uCgpJIG1hZGUgdGhvc2UgY29tbWVudHMgYmFzZWQgb24g
bXkgcGFzdCBleHBlcmllbmNlLiBBY3R1YWxseSwgSQpoZXNpdGF0ZWQgZm9yIGFnZXMgYmVmb3Jl
IGhpdHRpbmcgdGhlIHNlbmQgYnV0dG9uLiBJIGNvdWxkbid0CmZpZ3VyZSBvdXQgYSBiZXR0ZXIg
d2F5IG90aGVyIHRoYW4gcmVmYWN0b3JpbmcgdGhlIGZ1bmN0aW9uLgpJIGd1ZXNzIEkgbWlnaHQg
aGF2ZSBjb21lIGFjcm9zcyBhcyBhIGJpdCB1bnJlYXNvbmFibGUuIEJ1dApub3cgSSB1bmRlcnN0
YW5kIHRoZSByZWFzb25pbmcgYmVoaW5kIHRoZSDigJg4MCAtIGNoYXJhY3RlcuKAmQp0aGluZy4g
SSdsbCBiZSBtb3JlIGNvbmZpZGVudCB3aGVuIGRlYWxpbmcgd2l0aCB0aGlzIGtpbmQKb2Ygc2l0
dWF0aW9uIGluIHRoZSBmdXR1cmUuCgoKVGhhbmtz77yMCllhbnRlbmcKCj4gCUFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
