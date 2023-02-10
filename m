Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F79691F0D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 13:27:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33BD9C6A5EA;
	Fri, 10 Feb 2023 12:27:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EEE2C65E73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 12:27:03 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B9FD6C0005;
 Fri, 10 Feb 2023 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1676032023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onC4uvSvom/UzAuHfG54ufV5S11DPr9PwQEDZQSvD/8=;
 b=D17I3QpQS2PBGfHhv5YdbROETUA+7fAsoT6dg4Br3BNDYs78m2tMntxVZ4/F4ORHBm3MsM
 PIxxe/dJ5MIrm7A7GSeYLl86oQ1yY8FGQNrFQwYK/8psH5xalF7vexhDY3Ng4kw5Ytg/m7
 HHEFHly7quw+bfnMAu9Mt9duRki+Zl3+gbq7slWurMCNlLQIWNOgcGP1uV13SmIf4YY+ks
 WDZtzKrqM1zSksFoZFCSRkukqAPo0gNjir4+3putED9OScnNes0Qh2HFOHI4yocR6HATB6
 udOEiLkIiwedm2twRteLedmCkJerZ3qruz6KSSwKAgrhAeWvN3vWwMFVtYLYtg==
Date: Fri, 10 Feb 2023 13:29:21 +0100
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230210132921.2d6ab6a0@fixe.home>
In-Reply-To: <f894aa27-0f14-5bc9-2eae-114fae7ef3b0@linaro.org>
References: <20230209151632.275883-1-clement.leger@bootlin.com>
 <20230209151632.275883-5-clement.leger@bootlin.com>
 <f894aa27-0f14-5bc9-2eae-114fae7ef3b0@linaro.org>
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
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Milan Stevanovic <milan.stevanovic@se.com>,
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/6] dt-bindings: net: renesas,
 rzn1-gmac: Document RZ/N1 GMAC support
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

TGUgRnJpLCAxMCBGZWIgMjAyMyAxMzowMTowMSArMDEwMCwKS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiBhIMOpY3JpdCA6Cgo+IE9uIDA5LzAyLzIw
MjMgMTY6MTYsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPiA+IEFkZCAicmVuZXNhcyxyem4xLWdt
YWMiIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiB3aGljaCBpcyBjb21wYXRpYmxlIHdpdGgKPiA+ICJz
bnBzLGR3bWFjIiBjb21wYXRpYmxlIGRyaXZlciBidXQgdXNlcyBhIGN1c3RvbSBQQ1MgdG8gY29t
bXVuaWNhdGUKPiA+IHdpdGggdGhlIHBoeS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Jp
bmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sICAgICAgIHwgNjcgKysrKysrKysrKysr
KysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNh
cyxyem4xLWdtYWMueWFtbAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMjljZTc1OGEyOWMKPiA+
IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbAo+ID4gQEAgLTAsMCArMSw2NyBAQAo+ID4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+
ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IFJl
bmVzYXMgR01BQwo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBDbMOpbWVudCBMw6ln
ZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4gPiArCj4gPiArc2VsZWN0Ogo+ID4gKyAg
cHJvcGVydGllczoKPiA+ICsgICAgY29tcGF0aWJsZToKPiA+ICsgICAgICBjb250YWluczoKPiA+
ICsgICAgICAgIGVudW06Cj4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwNmcwMzItZ21hYwo+
ID4gKyAgICAgICAgICAtIHJlbmVzYXMscnpuMS1nbWFjCj4gPiArICByZXF1aXJlZDoKPiA+ICsg
ICAgLSBjb21wYXRpYmxlCj4gPiArCj4gPiArYWxsT2Y6Cj4gPiArICAtICRyZWY6IHNucHMsZHdt
YWMueWFtbCMKPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsg
ICAgaXRlbXM6Cj4gPiArICAgICAgLSBlbnVtOgo+ID4gKyAgICAgICAgICAtIHJlbmVzYXMscjlh
MDZnMDMyLWdtYWMKPiA+ICsgICAgICAtIGNvbnN0OiByZW5lc2FzLHJ6bjEtZ21hYwo+ID4gKyAg
ICAgIC0gY29uc3Q6IHNucHMsZHdtYWMgIAo+IAo+IFRoYW5rcywgbG9va3MgZ29vZCBub3cuCj4g
Cj4gPiArCj4gPiArICBwY3MtaGFuZGxlOgo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAg
ICBwaGFuZGxlIHBvaW50aW5nIHRvIGEgUENTIHN1Yi1ub2RlIGNvbXBhdGlibGUgd2l0aAo+ID4g
KyAgICAgIHJlbmVzYXMscnpuMS1taWljLnlhbWwjCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUgIAo+IAo+IHlvdSBkbyBub3QgbmVlZCByZWYg
aGVyZSAtIGl0IGlzIGNvbWluZyBmcm9tIGV0aGVybmV0LWNvbnRyb2xsZXIueWFtbAo+IHZpYSBz
bnBzLGR3bWFjLnlhbWwuIFlvdSBhY3R1YWxseSBjb3VsZCBkcm9wIGVudGlyZSBwcm9wZXJ0eSwg
YnV0IGl0IGNhbgo+IGFsc28gc3RheSBmb3IgdGhlIGRlc2NyaXB0aW9uLgoKT2sgdGhhbmtzIGZv
ciB0aGUgdGlwLiBJIHdpbGwgZHJvcCBpdCBzaW5jZSB0aGVyZSB3aWxsIGJlIGEgdjQuCgo+IAo+
ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArCj4gPiArdW5ldmFs
dWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4g
PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yOWEwNmcwMzItc3lzY3RybC5oPgo+
ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdp
Yy5oPgo+ID4gKwo+ID4gKyAgICBldGhlcm5ldEA0NDAwMDAwMCB7Cj4gPiArICAgICAgY29tcGF0
aWJsZSA9ICJyZW5lc2FzLHI5YTA2ZzAzMi1nbWFjIiwgInJlbmVzYXMscnpuMS1nbWFjIiwgInNu
cHMsZHdtYWMiOwo+ID4gKyAgICAgIHJlZyA9IDwweDQ0MDAwMDAwIDB4MjAwMD47Cj4gPiArICAg
ICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ2ljPjsKPiA+ICsgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMzQgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gPiArICAgICAgICAgICAgIDxHSUNfU1BJ
IDM2IElSUV9UWVBFX0xFVkVMX0hJR0g+LCAgCj4gCj4gUGxlYXNlIGFsaWduIHdpdGggcHJldmlv
dXMgPAo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAKCgoKLS0gCkNsw6ltZW50
IEzDqWdlciwKRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlciBhdCBCb290bGluCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
