Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C296F0219
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Apr 2023 09:48:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E270C6907C;
	Thu, 27 Apr 2023 07:48:49 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82DB3C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 07:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id AA15480A4;
 Thu, 27 Apr 2023 07:48:46 +0000 (UTC)
Date: Thu, 27 Apr 2023 10:48:45 +0300
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20230427074845.GG14287@atomide.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
 <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

KiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBbMjMwNDI3IDA3OjQ3
XToKPiBPbiBUaHUsIEFwciAyNywgMjAyMyBhdCA5OjM34oCvQU0gTWF0dGhpYXMgQnJ1Z2dlciA8
bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiAyNS8wNC8yMDIzIDE3OjU3LCBS
b2IgSGVycmluZyB3cm90ZToKPiA+ID4gT24gVHVlLCBBcHIgMjUsIDIwMjMgYXQgMjoyOOKAr0FN
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4gPj4g
T24gVHVlLCBBcHIgMjUsIDIwMjMgYXQgMTI6MTbigK9BTSBSb2IgSGVycmluZyA8cm9iaCtkdEBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+ID4+PiBJIGhhdmUgYSBzY3JpcHRbMV0gdGhhdCBkb2VzIHRo
ZSBjb252ZXJzaW9uIHdyaXR0ZW4gdGhlIGxhc3QgdGltZSB0aGlzCj4gPiA+Pj4gY2FtZSB1cC4g
SnVzdCBoYXZlIHRvIGFncmVlIG9uIGRpcmVjdG9yeSBuYW1lcy4gSSB0aGluayB0aGUgZWFzaWVz
dAo+ID4gPj4+IHdvdWxkIGJlIGZvciBBcm5kL09sb2YgdG8gcnVuIGl0IGF0IHRoZSBlbmQgb2Yg
YSBtZXJnZSB3aW5kb3cgYmVmb3JlCj4gPiA+Pj4gcmMxLgo+ID4gPj4KPiA+ID4+ICJlbWV2MiIg
YW5kICJzaDciIGFyZSBtaXNzaW5nIGZvciByZW5lc2FzLgo+ID4gPgo+ID4gPiBObyBkb3VidCBp
dCdzIGJlZW4gYml0cm90dGluZyAob3IgSSBtYXkgaGF2ZSBtaXNzZWQgc29tZSkuCj4gPiA+Cj4g
PiA+PiBEb2VzIHlvdXIgc2NyaXB0IGFsc28gY2F0ZXIgZm9yIC5kdHMgZmlsZXMgbm90IG1hdGNo
aW5nIGFueSBwYXR0ZXJuLAo+ID4gPj4gYnV0IGluY2x1ZGluZyBhIC5kdHNpIGZpbGUgdGhhdCBk
b2VzIG1hdGNoIGEgcGF0dGVybj8KPiA+ID4KPiA+ID4gSSBhc3N1bWUgSSBidWlsdCBldmVyeXRo
aW5nIGFmdGVyIG1vdmluZywgYnV0IG1heWJlIG5vdC4uLgo+ID4gPgo+ID4gPiBUaGF0J3MgYWxs
IGp1c3QgImRldGFpbHMiLiBGaXJzdCwgd2UgbmVlZCBhZ3JlZW1lbnQgb24gYSkgbW92aW5nCj4g
PiA+IHRoaW5ncyB0byBzdWJkaXJzIGFuZCBiKSBkb2luZyBpdCAxLWJ5LTEgb3IgYWxsIGF0IG9u
Y2UuIFNvIGZhciB3ZSd2ZQo+ID4gPiBiZWVuIHN0dWNrIG9uIGEpIGZvciBiZWluZyAndG9vIG11
Y2ggY2h1cm4nLgo+ID4gPgo+ID4KPiA+IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gbW92ZSB0
aGVtIGFuZCBwcm9iYWJseSB0aGUgYmVzdCB3YXkgdG8gZG8gc28gaXMsIGFzCj4gPiB5b3UgcHJv
cG9zZWQ6IHRoYXQgQXJuZCBvciBPbG9mIHJ1biB0aGUgc2NyaXB0IHRvIG1vdmUgdGhlbSBqdXN0
IGJlZm9yZSAtcmMxCj4gCj4gRlRSLCBubyBvYmplY3Rpb25zIGZyb20gbXkgc2lkZS4KClNvdW5k
cyBnb29kIHRvIG1lLgoKUmVnYXJkcywKClRvbnkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
