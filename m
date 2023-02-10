Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A89691E0A
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 12:18:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 894B8C6A5EA;
	Fri, 10 Feb 2023 11:18:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D737C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 11:18:21 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 34740FF805;
 Fri, 10 Feb 2023 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1676027900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGwyNDweKOny7cUymOWAbYX6Mq3MlF6z2NnyCm7S6IA=;
 b=ZeKttHtFULihjZv3XE4iLc9Cm3nSL2XmbzdizN7jbSGDFC1iB33AJM+e2ZsNiHfJegAtWX
 ejNzXUYLtRWGaHrF9WuFx/5GwolTjyYhJquXnkSlQq0d0WaIVfvWOmNE3PijJRBUC0md+Z
 YfM4VsLWfBjiwy7Qu/fo7KnbE25sSsuh8nbEir+rwYNT3LyDxikKvRrPFE5FXQstUbiq7X
 xL0XZZW0k4B3GbXhr3Jo3IDUmR4bwEbn2AgGFS+ll3wHyiZo45+gvXtk5YJE8eflzSj9ax
 zl/lUwq+1ZaBY3thoSN8FcKWWYalgmZxmv93xUCRo3fML+jcUka5DBTMzqungg==
Date: Fri, 10 Feb 2023 12:20:38 +0100
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230210122038.20fab507@fixe.home>
In-Reply-To: <Y+YkhjyaL+hNGW+7@shell.armlinux.org.uk>
References: <20230116103926.276869-1-clement.leger@bootlin.com>
 <20230116103926.276869-4-clement.leger@bootlin.com>
 <Y8UsvREsKOR2ejzT@shell.armlinux.org.uk>
 <20230207154135.6f0e59f8@fixe.home>
 <Y+YkhjyaL+hNGW+7@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Herve Codina <herve.codina@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kurt Kanzenbach <kurt@linutronix.de>, Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?B?TWlxdcOobA==?= Raynal <miquel.raynal@bootlin.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Milan Stevanovic <milan.stevanovic@se.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, linux-arm-kernel@lists.infradead.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: stmmac: start phylink
 before setting up hardware
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

TGUgRnJpLCAxMCBGZWIgMjAyMyAxMTowMzozNCArMDAwMCwKIlJ1c3NlbGwgS2luZyAoT3JhY2xl
KSIgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gYSDDqWNyaXQgOgoKPiBPbiBUdWUsIEZlYiAwNywg
MjAyMyBhdCAwMzo0MTozNVBNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPiBMZSBN
b24sIDE2IEphbiAyMDIzIDEwOjUzOjQ5ICswMDAwLAo+ID4gIlJ1c3NlbGwgS2luZyAoT3JhY2xl
KSIgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gYSDDqWNyaXQgOgo+ID4gICAKPiA+ID4gT24gTW9u
LCBKYW4gMTYsIDIwMjMgYXQgMTE6Mzk6MjNBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3Rl
OiAgCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9z
dG1tYWNfbWFpbi5jCj4gPiA+ID4gaW5kZXggZjIyNDdiOGNmMGEzLi44OGM5NDEwMDM4NTUgMTAw
NjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3Rt
bWFjX21haW4uYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tYWluLmMKPiA+ID4gPiBAQCAtMzgxOCw2ICszODE4LDEyIEBAIHN0YXRpYyBp
bnQgX19zdG1tYWNfb3BlbihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ICAJCX0KPiA+
ID4gPiAgCX0KPiA+ID4gPiAgCj4gPiA+ID4gKwkvKiBXZSBuZWVkIHRvIHNldHVwIHRoZSBwaHkg
JiBQQ1MgYmVmb3JlIGFjY2Vzc2luZyB0aGUgc3RtbWFjIHJlZ2lzdGVycwo+ID4gPiA+ICsJICog
YmVjYXVzZSBpbiBzb21lIGNhc2VzIChSWi9OMSksIGlmIHRoZSBzdG1tYWMgSVAgaXMgbm90IGNs
b2NrZWQgYnkgdGhlCj4gPiA+ID4gKwkgKiBQQ1MsIGhhcmR3YXJlIGluaXQgd2lsbCBmYWlsIGJl
Y2F1c2UgaXQgbGFja3MgYSBSR01JSSBSWCBjbG9jay4KPiA+ID4gPiArCSAqLwo+ID4gPiA+ICsJ
cGh5bGlua19zdGFydChwcml2LT5waHlsaW5rKTsgICAgCj4gPiA+IAo+ID4gPiBTbyB3aGF0IGhh
cHBlbnMgaWYgeW91IGVuZCB1cCB3aXRoIHRoZSBtYWNfbGlua191cCBtZXRob2QgYmVpbmcgY2Fs
bGVkCj4gPiA+IGF0IHRoaXMgcG9pbnQgaW4gdGhlIGRyaXZlciwgYmVmb3JlIHRoZSBoYXJkd2Fy
ZSBoYXMgYmVlbiBzZXR1cCA/Cj4gPiA+IAo+ID4gPiBJZiB5b3UgdXNlIGEgZml4ZWQtbGluaywg
dGhhdCdzIGEgcmVhbCBwb3NzaWJpbGl0eS4gIAo+ID4gCj4gPiBJIGFjdHVhbGx5IGhhdmUgdGhp
cyBzZXR1cC4gT24gdGhlIGJvYXJkLCBvbmUgR01BQyBpcyBjb25uZWN0ZWQgdG8gYQo+ID4gRFNB
IHN3aXRjaCB1c2luZyBhIGZpeGVkLWxpbmsgYW5kIHRoZSBvdGhlciB1c2luZyB0aGUgUENTIHN1
Y2ggYXMgYWRkZWQKPiA+IGJ5IHRoaXMgc2VyaWVzLgo+ID4gCj4gPiBGcm9tIHdoYXQgSSBzZWUs
IGluZGVlZCwgdGhlIG1hY19saW5rX3VwKCkgZnVuY3Rpb24gaXMgY2FsbGVkIGJlZm9yZQo+ID4g
c3RtbWFjX2h3X3NldHVwKCkuIFRoaXMgZG9lcyBub3Qgc2VlbXMgdG8gaGF2ZSBhbnkgZWZmZWN0
IG9uIG15IHNldHVwCj4gPiAoZXhjZXB0IG1ha2luZyBpdCB3b3JraW5nIG9mIGNvdXJzZSkgYnV0
IEkgYWdyZWUgdGhpcyBpcyBjbGVhcmx5IG5vdAo+ID4gaWRlYWwuCj4gPiAKPiA+IFdoYXQgSSBj
b3VsZCBkbyBpcyBhZGRpbmcgYSBmdW5jdGlvbiBpbiB0aGUgbWlpYyBwY3MgZHJpdmVyIHRoYXQg
Y291bGQKPiA+IGJlIGNhbGxlZCBmcm9tIG15IHJ6bjEgc3RtbWFjIHByb2JlIGZ1bmN0aW9uIHRv
IGFjdHVhbGx5IGNvbmZpZ3VyZSB0aGUKPiA+IFBDUyBhdCBwcm9iZSB0aW1lIGJhc2VkIG9uIHRo
ZSBkZXRlY3RlZCAicGh5LW1vZGUiLiBEb2VzIHRoYXQgc2VlbXMKPiA+IGJldHRlciB0byB5b3Ug
PyAgCj4gCj4gSSB0aGluayBDbGFyayBXYW5nIGlzIGFsc28gd29ya2luZyBvbiBhZGRyZXNzaW5n
IGEgdmVyeSBzaW1pbGFyIHByb2JsZW0KPiB3aXRoIHN0bW1hYy4gUGxlYXNlIGNhbiB5b3UgY2hl
Y2sgb3V0IGhpcyB3b3JrIGZpcnN0LCBoZSdzIGFkZGluZyBhIG5ldwo+IGZ1bmN0aW9uIHRvIHBo
eWxpbmsgdG8gYnJpbmcgdGhlIFBIWSB1cCBlYXJseSBpbiB0aGUgcmVzdW1lIHBhdGguCj4gCj4g
SSB3b3VsZCBsaWtlIHlvdSBib3RoIHRvIHdvcmsgdG9nZXRoZXIgdG8gYWRkcmVzcyB3aGF0IHNl
ZW1zIHRvIGJlIHRoZQo+IHNhbWUgaXNzdWUuCj4gCgpBY2tlZAoKLS0gCkNsw6ltZW50IEzDqWdl
ciwKRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlciBhdCBCb290bGluCmh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
