Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94122A0B08B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 09:06:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43283C78024;
	Mon, 13 Jan 2025 08:06:11 +0000 (UTC)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52843C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 08:06:04 +0000 (UTC)
Message-ID: <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736755559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcuNFQWJylkhPh7t8gonvzvwWsZ6sN4LnbhC8eusAv0=;
 b=X8Hz6+4QavDAiS3Ew+4O7uWu/tOuSMl4stek9qSeQKLJAusNsXpq1L88iuACDbzN77VEkg
 dwdnWW1K6ANumpRwxOSgxq1C3eSzvUt0qkcxWVD99BYd1ErmKtoYhWWYw2jQuObsjnhUpf
 UnCeBErX+lqVQJ7NUvQ5rjqnRMFbWy4=
Date: Mon, 13 Jan 2025 16:05:13 +0800
MIME-Version: 1.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
X-Migadu-Flow: FLOW_OUT
Cc: netdev@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

5ZyoIDIwMjUvMS8xMiAyMTozMiwgS3J6eXN6dG9mIEtvemxvd3NraSDlhpnpgZM6Cj4gVXNlIHN5
c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGVfYXJncygpIHdoaWNoIGlzIGEgd3JhcHBlciBv
dmVyCj4gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZSgpIGNvbWJpbmVkIHdpdGggZ2V0
dGluZyB0aGUgc3lzY29uCj4gYXJndW1lbnQuICBFeGNlcHQgc2ltcGxlciBjb2RlIHRoaXMgYW5u
b3RhdGVzIHdpdGhpbiBvbmUgbGluZSB0aGF0IGdpdmVuCj4gcGhhbmRsZSBoYXMgYXJndW1lbnRz
LCBzbyBncmVwcGluZyBmb3IgY29kZSB3b3VsZCBiZSBlYXNpZXIuCj4gCj4gVGhlcmUgaXMgYWxz
byBubyByZWFsIGJlbmVmaXQgaW4gcHJpbnRpbmcgZXJyb3JzIG9uIG1pc3Npbmcgc3lzY29uCj4g
YXJndW1lbnQsIGJlY2F1c2UgdGhpcyBpcyBkb25lIGp1c3QgdG9vIGxhdGU6IHJ1bnRpbWUgY2hl
Y2sgb24KPiBzdGF0aWMvYnVpbGQtdGltZSBkYXRhLiAgRHRzY2hlbWEgYW5kIERldmljZXRyZWUg
YmluZGluZ3Mgb2ZmZXIgdGhlCj4gc3RhdGljL2J1aWxkLXRpbWUgY2hlY2sgZm9yIHRoaXMgYWxy
ZWFkeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yu
a296bG93c2tpQGxpbmFyby5vcmc+Cj4gLS0tCj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jIHwgOSArKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jCj4gaW5kZXggMWU4YmFjNjY1
Y2M5YmM5NWMzYWE5NmU4N2E4ZTk1ZDljNjNiYThlMS4uMWZjYjc0ZTllM2ZmYWNkYzc1ODFiMjY3
ZmViYjU1ZDAxNWE4M2FlZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYwo+IEBAIC00MTksMTYgKzQxOSwxMSBAQCBzdGF0aWMg
aW50IHN0bTMyX2R3bWFjX3BhcnNlX2RhdGEoc3RydWN0IHN0bTMyX2R3bWFjICpkd21hYywKPiAg
IAl9Cj4gICAKPiAgIAkvKiBHZXQgbW9kZSByZWdpc3RlciAqLwo+IC0JZHdtYWMtPnJlZ21hcCA9
IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUobnAsICJzdCxzeXNjb24iKTsKPiArCWR3
bWFjLT5yZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MobnAsICJz
dCxzeXNjb24iLAo+ICsJCQkJCQkJICAgICAxLCAmZHdtYWMtPm1vZGVfcmVnKTsKVGhlIG5ldHdv
cmsgc3Vic3lzdGVtIHN0aWxsIHJlcXVpcmVzIHRoYXQgdGhlIGxlbmd0aCBvZgplYWNoIGxpbmUg
b2YgY29kZSBzaG91bGQgbm90IGV4Y2VlZCA4MCBjaGFyYWN0ZXJzLgpTbywgbGV0J3Mgc2lsZW5j
ZSB0aGUgd2FybmluZzoKCldBUk5JTkc6IGxpbmUgbGVuZ3RoIG9mIDgzIGV4Y2VlZHMgODAgY29s
dW1ucwojMzM6IEZJTEU6IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LWlteC5jOjMwNzoKKwkJCQkJCQkgICAgICZkd21hYy0+aW50Zl9yZWdfb2ZmKTsKCgpCVFcsIFRo
ZSBvdGhlciB0d28gc3RtbWFjIHBhdGNoZXMgYWxzbyBuZWVkIHRvIGFkanVzdAp0aGUgY29kZSBz
byB0aGF0IGVhY2ggbGluZSBkb2Vzbid0IGV4Y2VlZCA4MCBjaGFyYWN0ZXJzLgoKVGhhbmtzLApZ
YW50ZW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
