Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10357A0BE39
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 18:02:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B501BC78018;
	Mon, 13 Jan 2025 17:02:01 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3652C030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=258ufSRhmAKCNH7ZmIiFnUQr7BuMTzRbL7O6cvZOqdU=; b=f8
 iBETVcZeENe2KuK9+Iy18jnMuirgQ/hRPCOx2rLaLlicuMaOXL8rdhDRoW1J3quvkUQKdiLu1YWeV
 YGTl1z0lCXqNWsCoGTCykYSkg5wl8hkOkkrX04qPOoRlQH8xIGw6S3hbgdVKClW2y1BsZNomObUrY
 reA/JawS4XnvhSs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tXNol-0049xb-4Q; Mon, 13 Jan 2025 18:01:35 +0100
Date: Mon, 13 Jan 2025 18:01:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yanteng Si <si.yanteng@linux.dev>
Message-ID: <c4714984-8250-4bf2-9ac1-5a9204d3aca8@lunn.ch>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
 <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgMDQ6MDU6MTNQTSArMDgwMCwgWWFudGVuZyBTaSB3cm90
ZToKPiDlnKggMjAyNS8xLzEyIDIxOjMyLCBLcnp5c3p0b2YgS296bG93c2tpIOWGmemBkzoKPiA+
IFVzZSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MoKSB3aGljaCBpcyBhIHdy
YXBwZXIgb3Zlcgo+ID4gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZSgpIGNvbWJpbmVk
IHdpdGggZ2V0dGluZyB0aGUgc3lzY29uCj4gPiBhcmd1bWVudC4gIEV4Y2VwdCBzaW1wbGVyIGNv
ZGUgdGhpcyBhbm5vdGF0ZXMgd2l0aGluIG9uZSBsaW5lIHRoYXQgZ2l2ZW4KPiA+IHBoYW5kbGUg
aGFzIGFyZ3VtZW50cywgc28gZ3JlcHBpbmcgZm9yIGNvZGUgd291bGQgYmUgZWFzaWVyLgo+ID4g
Cj4gPiBUaGVyZSBpcyBhbHNvIG5vIHJlYWwgYmVuZWZpdCBpbiBwcmludGluZyBlcnJvcnMgb24g
bWlzc2luZyBzeXNjb24KPiA+IGFyZ3VtZW50LCBiZWNhdXNlIHRoaXMgaXMgZG9uZSBqdXN0IHRv
byBsYXRlOiBydW50aW1lIGNoZWNrIG9uCj4gPiBzdGF0aWMvYnVpbGQtdGltZSBkYXRhLiAgRHRz
Y2hlbWEgYW5kIERldmljZXRyZWUgYmluZGluZ3Mgb2ZmZXIgdGhlCj4gPiBzdGF0aWMvYnVpbGQt
dGltZSBjaGVjayBmb3IgdGhpcyBhbHJlYWR5Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gPiAtLS0K
PiA+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYyB8
IDkgKystLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtc3RtMzIuYwo+ID4gaW5kZXggMWU4YmFjNjY1Y2M5YmM5NWMzYWE5NmU4N2E4
ZTk1ZDljNjNiYThlMS4uMWZjYjc0ZTllM2ZmYWNkYzc1ODFiMjY3ZmViYjU1ZDAxNWE4M2FlZCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LXN0bTMyLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLXN0bTMyLmMKPiA+IEBAIC00MTksMTYgKzQxOSwxMSBAQCBzdGF0aWMgaW50IHN0bTMyX2R3
bWFjX3BhcnNlX2RhdGEoc3RydWN0IHN0bTMyX2R3bWFjICpkd21hYywKPiA+ICAgCX0KPiA+ICAg
CS8qIEdldCBtb2RlIHJlZ2lzdGVyICovCj4gPiAtCWR3bWFjLT5yZWdtYXAgPSBzeXNjb25fcmVn
bWFwX2xvb2t1cF9ieV9waGFuZGxlKG5wLCAic3Qsc3lzY29uIik7Cj4gPiArCWR3bWFjLT5yZWdt
YXAgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MobnAsICJzdCxzeXNjb24i
LAo+ID4gKwkJCQkJCQkgICAgIDEsICZkd21hYy0+bW9kZV9yZWcpOwo+IFRoZSBuZXR3b3JrIHN1
YnN5c3RlbSBzdGlsbCByZXF1aXJlcyB0aGF0IHRoZSBsZW5ndGggb2YKPiBlYWNoIGxpbmUgb2Yg
Y29kZSBzaG91bGQgbm90IGV4Y2VlZCA4MCBjaGFyYWN0ZXJzLgo+IFNvLCBsZXQncyBzaWxlbmNl
IHRoZSB3YXJuaW5nOgo+IAo+IFdBUk5JTkc6IGxpbmUgbGVuZ3RoIG9mIDgzIGV4Y2VlZHMgODAg
Y29sdW1ucwo+ICMzMzogRklMRTogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtaW14LmM6MzA3Ogo+ICsJCQkJCQkJICAgICAmZHdtYWMtPmludGZfcmVnX29mZik7Cgpj
aGVja3BhdGNoIHNob3VsZCBiZSBjb25zaWRlcmVkIGEgZ3VpZGUsIG5vdCBhIHN0cmljdCBjb25m
b3JtYW5jZQp0b29sLiBZb3Ugb2Z0ZW4gbmVlZCB0byBsb29rIGF0IGl0cyBvdXRwdXQgYW5kIGNv
bnNpZGVyIGRvZXMgd2hhdCBpdApzdWdnZXN0IHJlYWxseSBtYWtlIHRoZSBjb2RlIGJldHRlcj8g
SW4gdGhpcyBjYXNlLCBpIHdvdWxkIGRpc2FncmVlCndpdGggY2hlY2twYXRjaCBhbmQgYWxsb3cg
dGhpcyBjb2RlLgoKSWYgdGhlIGNvZGUgaGFkIGFsbCBiZWVuIG9uIG9uZSBsb25nIGxpbmUsIHRo
ZW4gaSB3b3VsZCBzdWdnZXN0IHRvCndyYXAgaXQuIEJ1dCBhcyBpdCBpcywgaXQga2VlcHMgd2l0
aCB0aGUgc3Bpcml0IG9mIDgwIGNoYXJhY3RlcnMsIGV2ZW4KaWYgaXQgaXMgdGVjaG5pY2FsbHkg
bm90LgoKCUFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
