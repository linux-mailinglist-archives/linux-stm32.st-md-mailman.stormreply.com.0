Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94207B51186
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:37:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B090C3FACE;
	Wed, 10 Sep 2025 08:37:11 +0000 (UTC)
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net
 (zg8tmty1ljiyny4xntuumtyw.icoremail.net [165.227.155.160])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 981C3C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:37:10 +0000 (UTC)
Received: from weishangjuan$eswincomputing.com ( [10.12.96.155] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 10 Sep 2025 16:36:19 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.155]
Date: Wed, 10 Sep 2025 16:36:19 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20250905-hissing-papaya-badger-1b2ddf@kuoka>
References: <20250904085913.2494-1-weishangjuan@eswincomputing.com>
 <20250904090055.2546-1-weishangjuan@eswincomputing.com>
 <20250905-hissing-papaya-badger-1b2ddf@kuoka>
MIME-Version: 1.0
Message-ID: <3579e9ca.106c.19932c4c2f0.Coremail.weishangjuan@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgAXt5WDOMFo7PzMAA--.25110W
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/1tbiAQEBEGjAVn gdDwAAsF
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: vladimir.oltean@nxp.com, 0x1207@gmail.com, edumazet@google.com,
 jszhang@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, faizal.abdul.rahim@linux.intel.com,
 lizhi2@eswincomputing.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, inochiama@gmail.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, krzk+dt@kernel.org, emil.renner.berthing@canonical.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 1/2] dt-bindings: ethernet: eswin:
 Document for EIC7700 SoC
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

RGVhciBLcnp5c3p0b2YgS296bG93c2tpLAoKSSBob3BlIHRoaXMgZW1haWwgZmluZHMgeW91IHdl
bGwuIEZpcnN0LCBwbGVhc2UgYWxsb3cgbWUgdG8gYXBvbG9naXplIGZvciBhbnkgaW5jb252ZW5p
ZW5jZQpjYXVzZWQgYnkgdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHlhbWwgZGVzY3JpcHRp
b24uIFdlIGhhdmUgbm93IHJldmlzZWQgdGhlIGRlc2NyaXB0aW9uCmNvbnRlbnQgYWNjb3JkaW5n
bHkgYXMgZm9sbG93OgoKZGVzY3JpcHRpb246CsKgIFBsYXRmb3JtIGdsdWUgbGF5ZXIgaW1wbGVt
ZW50YXRpb24gZm9yIFNUTU1BQyBFdGhlcm5ldCBkcml2ZXIuCgpJbiBhZGRpdGlvbiwgdGhlIGxp
bmsgdG8gdjUgcGF0Y2hlcyBpcyBhcyBmb2xsb3dz77yaCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI1MDkwNDA5MDA1NS4yNTQ2LTEtd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNv
bS8KCkkgaGF2ZSBhIHF1ZXN0aW9uIHRvIHNlZWsgeW91ciBhZHZpY2UuCkFmdGVyIHNlbmRpbmcg
dGhlIHY1IHBhdGNoZXMsIHdlIHJlY2VpdmVkIHlvdXIgZmVlZGJhY2suIE9yaWdpbmFsbHksIHdo
ZW4gcHJlcGFyaW5nIHRoZSB2NiBwYXRjaGVzLAp3ZSBpbnRlbmRlZCB0byBpbmNsdWRlIHRoZSAi
UmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kga3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnIiB0YWcuCkhvd2V2ZXIsIGdpdmVuIHRoYXQgd2UgaGF2ZSByZXZpc2VkwqB0aGUgeWFt
bCBkZXNjcmlwdGlvbiwgSSBhbSB1bmNlcnRhaW4gd2hldGhlciB0aGlzIHRhZyBzaG91bGQKc3Rp
bGwgYmUgaW5jbHVkZWQgaW4gdGhlIHY2IHBhdGNoZXMuIFBlcnNvbmFsbHksIEkgYmVsaWV2ZSBp
dCB3b3VsZCBiZSBhcHByb3ByaWF0ZSB0byByZXRhaW4gdGhlCiJSZXZpZXdlZC1ieSIgdGFnLiBD
b3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gaWYgdGhpcyBpcyBjb3JyZWN0PwpUaGFuayB5b3UgZm9y
IHlvdXIgdGltZSBhbmQgZ3VpZGFuY2UuIEkgbG9vayBmb3J3YXJkIHRvIHlvdXIgcmVzcG9uc2Uu
CkJlc3QgcmVnYXJkcywKU2hhbmdqdWFuIFdlaQoKCj4gLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+
IOWPkeS7tuS6ujogIktyenlzenRvZiBLb3psb3dza2kiIDxrcnprQGtlcm5lbC5vcmc+Cj4g5Y+R
6YCB5pe26Ze0OjIwMjUtMDktMDUgMTU6NTM6MzAgKOaYn+acn+S6lCkKPiDmlLbku7bkuro6IHdl
aXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20KPiDmioTpgIE6IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVk
dW1hemV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIHJv
YmhAa2VybmVsLm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIG1jb3F1ZWxpbi5zdG0zMkBnbWFp
bC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIHlvbmcubGlhbmcuY2hvb25nQGxp
bnV4LmludGVsLmNvbSwgdmxhZGltaXIub2x0ZWFuQG54cC5jb20sIHJtaytrZXJuZWxAYXJtbGlu
dXgub3JnLnVrLCBmYWl6YWwuYWJkdWwucmFoaW1AbGludXguaW50ZWwuY29tLCBwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20sIGlub2NoaWFtYUBnbWFpbC5jb20sIGphbi5w
ZXRyb3VzQG9zcy5ueHAuY29tLCBqc3poYW5nQGtlcm5lbC5vcmcsIHAuemFiZWxAcGVuZ3V0cm9u
aXguZGUsIGJvb24ua2hhaS5uZ0BhbHRlcmEuY29tLCAweDEyMDdAZ21haWwuY29tLCBuZXRkZXZA
dmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBsaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tLCBlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5v
bmljYWwuY29tLCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRp
bmcuY29tLCBsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9j
aGlwcy5jb20KPiDkuLvpopg6IFJlOiBbUEFUQ0ggdjUgMS8yXSBkdC1iaW5kaW5nczogZXRoZXJu
ZXQ6IGVzd2luOiBEb2N1bWVudCBmb3IgRUlDNzcwMCBTb0MKPiAKPiBPbiBUaHUsIFNlcCAwNCwg
MjAyNSBhdCAwNTowMDo1NVBNICswODAwLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29t
IHdyb3RlOgo+ID4gRnJvbTogU2hhbmdqdWFuIFdlaSA8d2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0
aW5nLmNvbT4KPiA+IAo+ID4gQWRkIEVTV0lOIEVJQzc3MDAgRXRoZXJuZXQgY29udHJvbGxlciwg
c3VwcG9ydGluZyBjbG9jawo+ID4gY29uZmlndXJhdGlvbiwgZGVsYXkgYWRqdXN0bWVudCBhbmQg
c3BlZWQgYWRhcHRpdmUgZnVuY3Rpb25zLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGkgTGkg
PGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGFuZ2p1YW4g
V2VpIDx3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gCj4g
QmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
