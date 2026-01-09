Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FA8D08416
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 10:38:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCCD7C8F286;
	Fri,  9 Jan 2026 09:38:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5CBBC1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 09:38:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 358FB1A273D;
 Fri,  9 Jan 2026 09:38:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 065EF60734;
 Fri,  9 Jan 2026 09:38:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E3529103C87CC; Fri,  9 Jan 2026 10:38:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767951521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=JRAJH9fBOd961NcgKi+jmYxD8E+1gYZ7UQ1tbcQg+GY=;
 b=wMaJ5JcSagj3AqIWTTLy4J7dxcTi5IsBqHkOOvTasVGNFxUBD4SiXVZI2HmcxxwBv/kuUI
 BSGJRM9PewmgRHEVGRkvIBM35NmiKyUgvzOKc2uD9d3X/ykNySDf5CPmk+/zsXPxiIcMHV
 qoNcHKaPprGiQxYpVz+iSJtn6vkxcinKhTtjaRJJGV35EZmKwisNys51sjnfIlWTutnRHw
 yf9d9Xw9WjkzPkx5QO0JsTUlLTjOFJ5H9FHQEmu7303lFX/7664/YjGIXHAmvIVgTo0E4B
 SvjQTn574q8VxxYKIDE6QGXYNzVOTsG3FxksROn64h7QGSebxBDTeaYWd27B+Q==
Message-ID: <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
Date: Fri, 9 Jan 2026 10:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Eichenberger <eichest@gmail.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop> <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop> <aWC_ZDu0HipuVhQS@eichest-laptop>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aWC_ZDu0HipuVhQS@eichest-laptop>
X-Last-TLS-Session-Version: TLSv1.3
Cc: robh@kernel.org, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, imx@lists.linux.dev, festevam@gmail.com,
 s.hauer@pengutronix.de, francesco.dolcini@toradex.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, kernel@pengutronix.de, netdev@vger.kernel.org,
 kuba@kernel.org, Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 pabeni@redhat.com, shawnguo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v2] net: stmmac: dwmac:
 Add a fixup for the Micrel KSZ9131 PHY
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

SGkgU3RlZmFuLAoKT24gMDkvMDEvMjAyNiAwOTo0MiwgU3RlZmFuIEVpY2hlbmJlcmdlciB3cm90
ZToKPiBIaSBldmVyeW9uZSwKPiAKPiBPbiBNb24sIEphbiAwNSwgMjAyNiBhdCAwNjo1ODoyNFBN
ICswMTAwLCBTdGVmYW4gRWljaGVuYmVyZ2VyIHdyb3RlOgo+PiBPbiBNb24sIEphbiAwNSwgMjAy
NiBhdCAwNTowOToxM1BNICswMDAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4+PiBP
biBNb24sIEphbiAwNSwgMjAyNiBhdCAwNTo0MjoyM1BNICswMTAwLCBTdGVmYW4gRWljaGVuYmVy
Z2VyIHdyb3RlOgo+Pj4+IFllcyB0aGlzIGlzIGNvcnJlY3QuIEVSUjA1MDY5NCBmcm9tIE5YUCBz
dGF0ZXM6Cj4+Pj4gVGhlIElFRUUgODAyLjMgc3RhbmRhcmQgc3RhdGVzIHRoYXQsIGluIE1JSS9H
TUlJIG1vZGVzLCB0aGUgYnl0ZQo+Pj4+IHByZWNlZGluZyB0aGUgU0ZEICgweEQ1KSwgU01ELVMg
KDB4RTYsMHg0QywgMHg3Riwgb3IgMHhCMyksIG9yIFNNRC1DCj4+Pj4gKDB4NjEsIDB4NTIsIDB4
OUUsIG9yIDB4MkEpIGJ5dGUgY2FuIGJlIGEgbm9uLVBSRUFNQkxFIGJ5dGUgb3IgdGhlcmUgY2Fu
Cj4+Pj4gYmUgbm8gcHJlY2VkaW5nIHByZWFtYmxlIGJ5dGUuIFRoZSBNQUMgcmVjZWl2ZXIgbXVz
dCBzdWNjZXNzZnVsbHkKPj4+PiByZWNlaXZlIGEgcGFja2V0IHdpdGhvdXQgYW55IHByZWFtYmxl
KDB4NTUpIGJ5dGUgcHJlY2VkaW5nIHRoZSBTRkQsCj4+Pj4gU01ELVMsIG9yIFNNRC1DIGJ5dGUu
Cj4+Pj4gSG93ZXZlciBkdWUgdG8gdGhlIGRlZmVjdCwgaW4gY29uZmlndXJhdGlvbnMgd2hlcmUg
ZnJhbWUgcHJlZW1wdGlvbiBpcwo+Pj4+IGVuYWJsZWQsIHdoZW4gcHJlYW1ibGUgYnl0ZSBkb2Vz
IG5vdCBwcmVjZWRlIHRoZSBTRkQsIFNNRC1TLCBvciBTTUQtQwo+Pj4+IGJ5dGUsIHRoZSByZWNl
aXZlZCBwYWNrZXQgaXMgZGlzY2FyZGVkIGJ5IHRoZSBNQUMgcmVjZWl2ZXIuIFRoaXMgaXMKPj4+
PiBiZWNhdXNlLCB0aGUgc3RhcnQtb2YtcGFja2V0IGRldGVjdGlvbiBsb2dpYyBvZiB0aGUgTUFD
IHJlY2VpdmVyCj4+Pj4gaW5jb3JyZWN0bHkgY2hlY2tzIGZvciBhIHByZWFtYmxlIGJ5dGUuCj4+
Pj4KPj4+PiBOWFAgcmVmZXJzIHRvIElFRUUgODAyLjMgd2hlcmUgaW4gY2xhdXNlIDM1LjIuMy4y
LjIgUmVjZWl2ZSBjYXNlIChHTUlJKQo+Pj4+IHRoZXkgc2hvdyB0d28gdGFibGVzIG9uZSB3aGVy
ZSB0aGUgcHJlYW1ibGUgaXMgcHJlY2VkaW5nIHRoZSBTRkQgYW5kIG9uZQo+Pj4+IHdoZXJlIGl0
IGlzIG5vdC4gVGhlIHRleHQgc2F5czoKPj4+PiBUaGUgb3BlcmF0aW9uIG9mIDEwMDAgTWIvcyBQ
SFlzIGNhbiByZXN1bHQgaW4gc2hyaW5rYWdlIG9mIHRoZSBwcmVhbWJsZQo+Pj4+IGJldHdlZW4g
dHJhbnNtaXNzaW9uIGF0IHRoZSBzb3VyY2UgR01JSSBhbmQgcmVjZXB0aW9uIGF0IHRoZSBkZXN0
aW5hdGlvbgo+Pj4+IEdNSUkuIFRhYmxlIDM14oCTMyBkZXBpY3RzIHRoZSBjYXNlIHdoZXJlIG5v
IHByZWFtYmxlIGJ5dGVzIGFyZSBjb252ZXllZAo+Pj4+IGFjcm9zcyB0aGUgR01JSS4gVGhpcyBj
YXNlIG1heSBub3QgYmUgcG9zc2libGUgd2l0aCBhIHNwZWNpZmljIFBIWSwgYnV0Cj4+Pj4gaWxs
dXN0cmF0ZXMgdGhlIG1pbmltdW0gcHJlYW1ibGUgd2l0aCB3aGljaCBNQUMgc2hhbGwgYmUgYWJs
ZSB0bwo+Pj4+IG9wZXJhdGUuIFRhYmxlIDM14oCTNCBkZXBpY3RzIHRoZSBjYXNlIHdoZXJlIHRo
ZSBlbnRpcmUgcHJlYW1ibGUgaXMKPj4+PiBjb252ZXllZCBhY3Jvc3MgdGhlIEdNSUkuCj4+Pj4K
Pj4+PiBXZSB3b3VsZCBjaGFuZ2UgdGhlIGJlaGF2aW9yIGZyb20gIm5vIHByZWFtYmxlIGlzIHBy
ZWNlZGluZyBTRkQiIHRvICJ0aGUKPj4+PiBlbml0cmUgcHJlYW1ibGUgaXMgcHJlY2VkaW5nIFNG
RCIuIEJvdGggYXJlIGxpc3RlZCBpbiB0aGUgc3RhbmRhcmQgYW5kCj4+Pj4gc2hhbGwgYmUgc3Vw
cG9ydGVkIGJ5IHRoZSBNQUMuCj4+Pgo+Pj4gVGhhbmtzIGZvciBwcm92aWRpbmcgdGhlIGZ1bGwg
ZXhwbGFuYXRpb24sIGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZQo+Pj4gdGhhdCBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UuCj4+Cj4+IE9rYXkgdGhhbmtzLCBJIHdpbGwgcHJvdmlkZSB0aGUgZnVsbCBl
eHBsYW5hdGlvbiBpbiB0aGUgbmV4dCBjb21taXQKPj4gbWVzc2FnZS4KPj4KPj4+Cj4+PiBUaGUg
bmV4dCBxdWVzdGlvbiB3b3VsZCBiZSwgaXMgaXQganVzdCB0aGUgTlhQIEVRT1MgaW1wbGVtZW50
YXRpb24KPj4+IHRoYXQgdGhpcyBicmVha3Mgb24sIG9yIGFyZSBvdGhlciBFUU9TIGltcGxlbWVu
dGF0aW9ucyBhZmZlY3RlZD8KPj4+Cj4+PiBJbiBvdGhlciB3b3JkcywgaWYgd2UgY2hvb3NlIHRv
IGNvbmRpdGlvbmFsbHkgZW5hYmxlIHRoZSBwcmVhYmxlIGF0Cj4+PiB0aGUgUEhZLCBzaG91bGQg
dGhlIGdlbmVyaWMgcGFydHMgb2Ygc3RtbWFjIGhhbmRsZSB0aGlzIHJhdGhlciB0aGFuCj4+PiBl
bmRpbmcgdXAgd2l0aCBtdWx0aXBsZSBwbGF0Zm9ybSBzcGVjaWZpYyBnbHVlIGhhdmluZyB0byBj
b2RlIHRoaXMuCj4+PiAoVGhpcyBpcyBzb21ldGhpbmcgSSByZWFsbHkgd2FudCB0byBhdm9pZCAt
IGl0IGRvZXNuJ3Qgc2NhbGUuKQo+Pgo+PiBGcm9tIHRoZSBlcnJhdGEgZnJvbSBOWFAgaXQgc291
bmRzIHRvIG1lIGxpa2UgaXQgaXMgYSBjb25maWd1cmF0aW9uCj4+IGlzc3VlIGJ5IE5YUC4gSSBj
aGVja2VkIHRoZSBmb2xsb3dpbmcgRVJSQVRBcyBmcm9tIHZlbmRvcnMgd2hlcmUgSSBoYXZlCj4+
IGFjY2VzcyB0bzoKPj4gLSBTVCBTVE0zMk1QMTogbm90IGFmZmVjdGVkOiBodHRwczovL3d3dy5z
dC5jb20vcmVzb3VyY2UvZW4vZXJyYXRhX3NoZWV0L2VzMDQzOC1zdG0zMm1wMTUxeDN4N3gtZGV2
aWNlLWVycmF0YS1zdG1pY3JvZWxlY3Ryb25pY3MucGRmCj4+IC0gUmVuZXNhcyBSWk4xOiBub3Qg
YWZmZWN0ZWQ6IGh0dHBzOi8vd3d3LnJlbmVzYXMuY29tL2VuL2RvY3VtZW50L3RjdS9ldGhlcm5l
dC1tYWMtZ21hYy1mdW5jdGlvbi1pc3N1ZS0wP3I9MTA1NDU2MQo+PiAtIFN0YXJ2aXZlIEpINzEx
MDogbm90IGFmZmVjdGVkOiBodHRwczovL2RvYy1lbi5ydnNwYWNlLm9yZy9KSDcxMTAvUERGL0pI
NzExMF9FcnJhdGEucGRmCj4+IC0gTlhQIFMzMjogYWZmZWN0ZWQ6IChFUlIwNTA3MDYgdW5kZXIg
TkRBKQo+Pgo+PiBTbyBmcm9tIHRoYXQgSSB3b3VsZCBjb25jbHVkZSB0aGF0IGl0IGlzIGFuIE5Y
UCBzcGVjaWZpYyBpc3N1ZSBhbmQgaXQncwo+PiBub3QgdGhlIGZ1bGwgRVFPUyBpbXBsZW1lbnRh
dGlvbiB0aGF0IGlzIGJyb2tlbi4KPiAKPiBJIGp1c3Qgd2FudGVkIHRvIGNoZWNrIHdoZXRoZXIg
SSBzaG91bGQgY29udGludWUgd2l0aCB0aGUgY3VycmVudAo+IGFwcHJvYWNoIG9yIGlmIEkgc2hv
dWxkIGluc3RlYWQgZW5hYmxlIHRoZSBwcmVhbWJsZSBpbiB0aGUgUEhZIGZvciBhbGwKPiBNQUNz
LiBXaGlsZSBJIHByZWZlciB0aGUgY3VycmVudCBhcHByb2FjaCwgYXMgdGhlIGlzc3VlIGxpZXMg
d2l0aCB0aGUKPiBNQUMgcmF0aGVyIHRoYW4gdGhlIFBIWSwgSSBjYW4gYWxzbyBzZWUgdGhlIGFk
dmFudGFnZSBvZiBhbHdheXMgZW5hYmxpbmcKPiB0aGUgZmVhdHVyZS4KCk15IG1haW4gY29uY2Vy
biB3YXMgdGhhdCB3ZSBtYXkgZW5kLXVwIHdpdGggYSBsb3Qgb2YgZGlmZmVyZW50IGZpeHVwcwpm
b3IgdGhlIHZhcmlvdXMgS1NaLWZhbWlseSBQSFkgZGV2aWNlcywgZXNwZWNpYWxseSBzaW5jZSB0
aGlzIGZlYXR1cmUgaXMKc29tZXRpbWVzIHVuZG9jdW1lbnRlZC4KCkkndmUgZ29uZSB0aHJvdWdo
IHRoZSBtaWNyZWwuYyBkcml2ZXIsIGFuZCBsb29rZWQgYXQgdGhlIGRhdGFzaGVldCBvZgptb3N0
IFBIWXMgaW4gdGhlcmUsIGFuZCBzbyBmYXIgSSd2ZSBmb3VuZCB0aGF0IHRvIGZpeCB0aGlzIGlz
c3VlLCB3ZQpuZWVkIHRvIHNldCA6CgpLU1o5MTMxIC8gS1NaODA0MTogUmVnaXN0ZXIgMHgxNCBi
aXQgNgpLU1o4MDYxIC8gS1NaODA1MSA6IFJlZ2lzdGVyIDB4MTggYml0IDYKClNvIGluIHRoZSBl
bmQsIHRoZSBjb21wbGV4aXR5IGFwcGVhcnMgdG8gYmUgYSBiaXQgbGVzcyBleHBvbmVudGlhbCB0
aGFuCkkgb3JpZ2luYWxseSB0aG91Z2h0LCB3ZSBtYXkgZW5kLXVwIHdpdGggb25seSBhIGZldyBm
aXh1cHMgaW4gdGhpcyBkcml2ZXIuCgpJJ2Qgc2F5LCBJJ20gZmluZSB3aXRoIHlvdSBwcm9jZWVk
aW5nIHdpdGggdGhpcyBvcmlnaW5hbCBhcHByb2FjaCBhcyBpdAptaW5pbWl6ZXMgdGhlIGltcGFj
dCBhbmQgcmlzayB0byBicmVhayBvdGhlciBzZXR1cHMuCgpJJ20gc29ycnkgZm9yIHRyaWdnZXJp
bmcgdGhpcyB3aG9sZSBkaXNjdXNzaW9uIG9ubHkgdG8gZ2V0IGJhY2sgdG8gdGhlCnN0YXJ0aW5n
IHBvaW50IDooCgpNYXhpbWUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
