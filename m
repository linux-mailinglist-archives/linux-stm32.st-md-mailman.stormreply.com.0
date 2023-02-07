Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCA568DBC8
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Feb 2023 15:39:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D765EC6A5E8;
	Tue,  7 Feb 2023 14:39:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DD71C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Feb 2023 14:39:19 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1ADFA1BF214;
 Tue,  7 Feb 2023 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675780759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgTjkfhErQAXd/2bdHyqrP5YcPwCn6JNIcfadunoXU4=;
 b=Fu2pSU8TRoi+yu5AR3jUSEf/++jNuEOCQoM3+F5Ob6MagmavxDFR4HVwRZCFeiAuckyw9D
 I3BX/YR1VhGI8D8gv6I8aZGtUxuVx2mkunIIMNEZv5xw/bL0Z20V4xSW9syXWDjk1I6xds
 PC4oCwtCfFK8C8CfTX0Ss+Kv4g5tkfd4Kj4H9Bq5SL/dPm83cHt69/tHh+e3E7dsV8r3vN
 HC4S+exCpCM+6iP4w3v6uNM0S1dZVDPVpRdWexVqK2tzDFFXPNfOJErl5oXagRIH1M2VIk
 jfBOxwCaM6pWs73TFjMSX83dkwnDcS+2bSKOBqVvkJsoOGqRId+B1cRR4Z4cQQ==
Date: Tue, 7 Feb 2023 15:41:35 +0100
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230207154135.6f0e59f8@fixe.home>
In-Reply-To: <Y8UsvREsKOR2ejzT@shell.armlinux.org.uk>
References: <20230116103926.276869-1-clement.leger@bootlin.com>
 <20230116103926.276869-4-clement.leger@bootlin.com>
 <Y8UsvREsKOR2ejzT@shell.armlinux.org.uk>
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
 Milan Stevanovic <milan.stevanovic@se.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
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

TGUgTW9uLCAxNiBKYW4gMjAyMyAxMDo1Mzo0OSArMDAwMCwKIlJ1c3NlbGwgS2luZyAoT3JhY2xl
KSIgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gYSDDqWNyaXQgOgoKPiBPbiBNb24sIEphbiAxNiwg
MjAyMyBhdCAxMTozOToyM0FNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4u
YyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiA+
IGluZGV4IGYyMjQ3YjhjZjBhMy4uODhjOTQxMDAzODU1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4gKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4gQEAgLTM4
MTgsNiArMzgxOCwxMiBAQCBzdGF0aWMgaW50IF9fc3RtbWFjX29wZW4oc3RydWN0IG5ldF9kZXZp
Y2UgKmRldiwKPiA+ICAJCX0KPiA+ICAJfQo+ID4gIAo+ID4gKwkvKiBXZSBuZWVkIHRvIHNldHVw
IHRoZSBwaHkgJiBQQ1MgYmVmb3JlIGFjY2Vzc2luZyB0aGUgc3RtbWFjIHJlZ2lzdGVycwo+ID4g
KwkgKiBiZWNhdXNlIGluIHNvbWUgY2FzZXMgKFJaL04xKSwgaWYgdGhlIHN0bW1hYyBJUCBpcyBu
b3QgY2xvY2tlZCBieSB0aGUKPiA+ICsJICogUENTLCBoYXJkd2FyZSBpbml0IHdpbGwgZmFpbCBi
ZWNhdXNlIGl0IGxhY2tzIGEgUkdNSUkgUlggY2xvY2suCj4gPiArCSAqLwo+ID4gKwlwaHlsaW5r
X3N0YXJ0KHByaXYtPnBoeWxpbmspOyAgCj4gCj4gU28gd2hhdCBoYXBwZW5zIGlmIHlvdSBlbmQg
dXAgd2l0aCB0aGUgbWFjX2xpbmtfdXAgbWV0aG9kIGJlaW5nIGNhbGxlZAo+IGF0IHRoaXMgcG9p
bnQgaW4gdGhlIGRyaXZlciwgYmVmb3JlIHRoZSBoYXJkd2FyZSBoYXMgYmVlbiBzZXR1cCA/Cj4g
Cj4gSWYgeW91IHVzZSBhIGZpeGVkLWxpbmssIHRoYXQncyBhIHJlYWwgcG9zc2liaWxpdHkuCgpJ
IGFjdHVhbGx5IGhhdmUgdGhpcyBzZXR1cC4gT24gdGhlIGJvYXJkLCBvbmUgR01BQyBpcyBjb25u
ZWN0ZWQgdG8gYQpEU0Egc3dpdGNoIHVzaW5nIGEgZml4ZWQtbGluayBhbmQgdGhlIG90aGVyIHVz
aW5nIHRoZSBQQ1Mgc3VjaCBhcyBhZGRlZApieSB0aGlzIHNlcmllcy4KCkZyb20gd2hhdCBJIHNl
ZSwgaW5kZWVkLCB0aGUgbWFjX2xpbmtfdXAoKSBmdW5jdGlvbiBpcyBjYWxsZWQgYmVmb3JlCnN0
bW1hY19od19zZXR1cCgpLiBUaGlzIGRvZXMgbm90IHNlZW1zIHRvIGhhdmUgYW55IGVmZmVjdCBv
biBteSBzZXR1cAooZXhjZXB0IG1ha2luZyBpdCB3b3JraW5nIG9mIGNvdXJzZSkgYnV0IEkgYWdy
ZWUgdGhpcyBpcyBjbGVhcmx5IG5vdAppZGVhbC4KCldoYXQgSSBjb3VsZCBkbyBpcyBhZGRpbmcg
YSBmdW5jdGlvbiBpbiB0aGUgbWlpYyBwY3MgZHJpdmVyIHRoYXQgY291bGQKYmUgY2FsbGVkIGZy
b20gbXkgcnpuMSBzdG1tYWMgcHJvYmUgZnVuY3Rpb24gdG8gYWN0dWFsbHkgY29uZmlndXJlIHRo
ZQpQQ1MgYXQgcHJvYmUgdGltZSBiYXNlZCBvbiB0aGUgZGV0ZWN0ZWQgInBoeS1tb2RlIi4gRG9l
cyB0aGF0IHNlZW1zCmJldHRlciB0byB5b3UgPwoKVGhhbmtzLAoKLS0gCkNsw6ltZW50IEzDqWdl
ciwKRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlciBhdCBCb290bGluCmh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
