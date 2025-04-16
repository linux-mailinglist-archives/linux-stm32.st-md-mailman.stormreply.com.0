Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08933A8B797
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 13:25:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9FBEC78F81;
	Wed, 16 Apr 2025 11:25:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA59CCFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 11:25:15 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso3876580f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 04:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744802715; x=1745407515;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UK1qE9wdXLtXZ7bpXZQ96bl6ineBI8nWFsz8yMF/6bs=;
 b=GVnLhRYhJA9UowAvsMkQ98agzJbIt6fq6V7O7I9HVUrISj+X6qc/dESkJw9MWl4nvT
 v/rY8VBbvloVkMsajiBHdf2ZhUFVsdPi4eciMPS/gZZ9JxVuX+v4y27sH7yYrXsvAh5l
 r1ivFBP7iaiCNkYjdnQi4swCd7T0lzvwe6RAt0xREQOHz/RrJanDIJuVmFJEkLpma9ri
 V9fJlbTbehEOqADEHlsd0sC5WTfiFhRf57QfnoEuVQYPrvbdLhFOcfBVxXvr2+5eZyat
 XKfhpYQib/gHmHKMwlz93svM6WyVwdjuySX/mw6isShdF08l3z3f1qutMalF3W1s9Yk2
 SCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744802715; x=1745407515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UK1qE9wdXLtXZ7bpXZQ96bl6ineBI8nWFsz8yMF/6bs=;
 b=oZ3UAT+DCD/bJHuBKxUUvuW5eKw4eYQD1ORKJrlVsIR5WT3FjJXzxkOjxYtim4T9G/
 48UBvG6DWathLbbRP2VGnfDd4ehLJq8zyyQ7CEpndmoLgpz72oHAaVrbpmUHL+ojmZ8m
 Ra7vWqLq36p6cSwKGCE3VVnQKA/FUCJ2D646JmJMiozLYScQmtU6/UoAGEl7lfCGBK1m
 so3TfjGM27TxenVdgRPCd3RRTkQ7nQzg5EE6y2jRg5yyY37+dnxN0tqj34KuvBDY6CgN
 cQI3dU3mFUg0NLMOWpgqT8zSaJwwC2zSrbqr8qUHRXSpumqFascJNs+fuQJ1L388zE1t
 rSXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYQko4QYQgWn0CPkMV8ECYDk85WNI+QPbtqOlwr3czHS/M5uUZ8PDAUVCPZELoUMxlDy+4AdxeFkwNDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwgNyM1hzlsPxgbTfmAQ4t/WEfB8ypIvkdUxdFbq+7RvnkyB7EE
 W3HY4K+fA2+o4LeZ4RjJQR6ub3F+oOVwz8VpRaBoraV5LUMi5RGFCugrAy+GqA9syOZ+X+By/Oh
 eCOBXrrLIXttsSjxPS4273U2+9fI=
X-Gm-Gg: ASbGncvzJU62YjSHeAY2xaM9p8zqPx5fVBR2oQuPy1bzmMSLbMRaLWTJmqrDK5fNSqr
 mTDD1vpaPn3LzmbScjvUdKQFI4Rd40nqUC3BsHWV8Mt1ZLD5ralJnQWJW/8WdNgd+09EivqRxxZ
 k4ZSjxxo5HwzQQ9iUEI9RuFnyFo2yNdYFnH6QvyUwe84q5dq/LBLF3oMc=
X-Google-Smtp-Source: AGHT+IG20ioUwmVK8jT1auGEvfYmau6FZT4iN5r9cG0sTpD+CwE5vavkmt0SHhCn9DBrwBdOjgbt0xLoMYoKYshrtUA=
X-Received: by 2002:a05:6000:1867:b0:39e:cbca:922f with SMTP id
 ffacd0b85a97d-39ee5b12f23mr1105841f8f.12.1744802714969; Wed, 16 Apr 2025
 04:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346266349649D5E69923BAC86BD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346266349649D5E69923BAC86BD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Apr 2025 12:24:48 +0100
X-Gm-Features: ATxdqUHUY3qYyUELPpVyGQloNfVvIlHwW8HOxGgTg9mF-SSWoLexEHk-cqLqtZo
Message-ID: <CA+V-a8tu-9gu_Rm3TGeGPjO48tpUVYu+PR7K9FyUU6DORQYQYg@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/4] net: stmmac: Add DWMAC
 glue layer for Renesas GBETH
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

SGkgQmlqdSwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIFdlZCwgQXByIDE2LCAyMDI1
IGF0IDExOjQ04oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90
ZToKPgo+IEhpIFByYWJoYWthciwKPgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLgo+Cj4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogUHJhYmhha2FyIDxwcmFiaGFrYXIuY3Nl
bmdnQGdtYWlsLmNvbT4KPiA+IFNlbnQ6IDE2IEFwcmlsIDIwMjUgMTE6NDAKPiA+IFN1YmplY3Q6
IFtQQVRDSCBuZXQtbmV4dCB2NyAzLzRdIG5ldDogc3RtbWFjOiBBZGQgRFdNQUMgZ2x1ZSBsYXll
ciBmb3IgUmVuZXNhcyBHQkVUSAo+ID4KPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBBZGQgdGhlIERXTUFDIGds
dWUgbGF5ZXIgZm9yIHRoZSBHQkVUSCBJUCBmb3VuZCBpbiB0aGUgUmVuZXNhcyBSWi9WMkgoUCkg
U29DLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBSdXNzZWxsIEtpbmcg
KE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZyAgIHwgIDExICsrCj4gPiAgZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGUgIHwgICAxICsKPiA+ICAu
Li4vc3RtaWNyby9zdG1tYWMvZHdtYWMtcmVuZXNhcy1nYmV0aC5jICAgICAgfCAxNDYgKysrKysr
KysrKysrKysrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1yZW5lc2FzLWdiZXRoLmMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL0tjb25maWcKPiA+IGluZGV4IDNjODIwZWY1Njc3NS4uMmM5OWIyM2YwZmFhIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZp
Zwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZwo+
ID4gQEAgLTEzMSw2ICsxMzEsMTcgQEAgY29uZmlnIERXTUFDX1FDT01fRVRIUU9TCj4gPiAgICAg
ICAgIFRoaXMgc2VsZWN0cyB0aGUgUXVhbGNvbW0gRVRIUU9TIGdsdWUgbGF5ZXIgc3VwcG9ydCBm
b3IgdGhlCj4gPiAgICAgICAgIHN0bW1hYyBkZXZpY2UgZHJpdmVyLgo+ID4KPiA+ICtjb25maWcg
RFdNQUNfUkVORVNBU19HQkVUSAo+ID4gKyAgICAgdHJpc3RhdGUgIlJlbmVzYXMgUlovVjJIKFAp
IEdCRVRIIHN1cHBvcnQiCj4gPiArICAgICBkZWZhdWx0IEFSQ0hfUkVORVNBUwo+ID4gKyAgICAg
ZGVwZW5kcyBvbiBPRiAmJiAoQVJDSF9SRU5FU0FTIHx8IENPTVBJTEVfVEVTVCkKPiA+ICsgICAg
IGhlbHAKPiA+ICsgICAgICAgU3VwcG9ydCBmb3IgR2lnYWJpdCBFdGhlcm5ldCBJbnRlcmZhY2Ug
KEdCRVRIKSBvbiBSZW5lc2FzCj4gPiArICAgICAgIFJaL1YySChQKSBTb0NzLgo+ID4gKwo+ID4g
KyAgICAgICBUaGlzIHNlbGVjdHMgdGhlIFJlbmVzYXMgUlovVjJIKFApIFNvYyBzcGVjaWZpYyBn
bHVlIGxheWVyIHN1cHBvcnQKPiA+ICsgICAgICAgZm9yIHRoZSBzdG1tYWMgZGV2aWNlIGRyaXZl
ci4KPiA+ICsKPiA+ICBjb25maWcgRFdNQUNfUk9DS0NISVAKPiA+ICAgICAgIHRyaXN0YXRlICJS
b2NrY2hpcCBkd21hYyBzdXBwb3J0Igo+ID4gICAgICAgZGVmYXVsdCBBUkNIX1JPQ0tDSElQCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZp
bGUKPiA+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGUKPiA+
IGluZGV4IDU5NDg4M2ZiNDE2NC4uOTEwNTAyMTU1MTFiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGUKPiA+ICsrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlCj4gPiBAQCAtMjAsNiArMjAsNyBA
QCBvYmotJChDT05GSUdfRFdNQUNfTFBDMThYWCkgKz0gZHdtYWMtbHBjMTh4eC5vCj4gPiAgb2Jq
LSQoQ09ORklHX0RXTUFDX01FRElBVEVLKSArPSBkd21hYy1tZWRpYXRlay5vCj4gPiAgb2JqLSQo
Q09ORklHX0RXTUFDX01FU09OKSAgICArPSBkd21hYy1tZXNvbi5vIGR3bWFjLW1lc29uOGIubwo+
ID4gIG9iai0kKENPTkZJR19EV01BQ19RQ09NX0VUSFFPUykgICAgICArPSBkd21hYy1xY29tLWV0
aHFvcy5vCj4gPiArb2JqLSQoQ09ORklHX0RXTUFDX1JFTkVTQVNfR0JFVEgpICs9IGR3bWFjLXJl
bmVzYXMtZ2JldGgubwo+ID4gIG9iai0kKENPTkZJR19EV01BQ19ST0NLQ0hJUCkgKz0gZHdtYWMt
cmsubwo+ID4gIG9iai0kKENPTkZJR19EV01BQ19SWk4xKSAgICAgKz0gZHdtYWMtcnpuMS5vCj4g
PiAgb2JqLSQoQ09ORklHX0RXTUFDX1MzMikgICAgICAgICAgICAgICs9IGR3bWFjLXMzMi5vCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
cmVuZXNhcy1nYmV0aC5jCj4gPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjLXJlbmVzYXMtZ2JldGguYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZjM0YmVjNzc5NGUyCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMK
PiA+IEBAIC0wLDAgKzEsMTQ2IEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjArCj4gPiArLyoKPiA+ICsgKiBkd21hYy1yZW5lc2FzLWdiZXRoLmMgLSBEV01BQyBTcGVj
aWZpYyBHbHVlIGxheWVyIGZvciBSZW5lc2FzIEdCRVRICj4gPiArICoKPiA+ICsgKiBUaGUgUngg
YW5kIFR4IGNsb2NrcyBhcmUgc3VwcGxpZWQgYXMgZm9sbG93cyBmb3IgdGhlIEdCRVRIIElQLgo+
ID4gKyAqCj4gPiArICogICAgICAgICAgICAgICAgICAgICAgICAgUnggLyBUeAo+ID4gKyAqICAg
LS0tLS0tLSstLS0tLS0tLS0tLS0tIG9uIC8gb2ZmIC0tLS0tLS0KPiA+ICsgKiAgICAgICAgICB8
Cj4gPiArICogICAgICAgICAgfCAgICAgICAgICAgIFJ4LTE4MCAvIFR4LTE4MAo+ID4gKyAqICAg
ICAgICAgICstLS0tIG5vdCAtLS0tIG9uIC8gb2ZmIC0tLS0tLS0KPiA+ICsgKgo+ID4gKyAqIENv
cHlyaWdodCAoQykgMjAyNSBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnBvcmF0aW9uICAqLwo+ID4g
Kwo+ID4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNl
Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPiA+ICsKPiA+
ICsjaW5jbHVkZSAic3RtbWFjX3BsYXRmb3JtLmgiCj4gPiArCj4gPiArc3RydWN0IHJlbmVzYXNf
Z2JldGggewo+ID4gKyAgICAgc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0X2RhdDsK
PiA+ICsgICAgIHN0cnVjdCByZXNldF9jb250cm9sICpyc3RjOwo+ID4gKyAgICAgc3RydWN0IGRl
dmljZSAqZGV2Owo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHJl
bmVzYXNfZ2JldGhfY2xrc1tdID0gewo+ID4gKyAgICAgInR4IiwgInR4LTE4MCIsICJyeCIsICJy
eC0xODAiLAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGludCByZW5lc2FzX2diZXRoX2luaXQo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgdm9pZCAqcHJpdikKPiA+ICt7Cj4gPiArICAg
ICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0Owo+ID4gKyAgICAgc3RydWN0
IHJlbmVzYXNfZ2JldGggKmdiZXRoID0gcHJpdjsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4g
PiArICAgICBwbGF0X2RhdCA9IGdiZXRoLT5wbGF0X2RhdDsKPiA+ICsKPiA+ICsgICAgIHJldCA9
IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZ2JldGgtPnJzdGMpOwo+ID4gKyAgICAgaWYgKHJldCkg
ewo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKGdiZXRoLT5kZXYsICJSZXNldCBkZWFzc2VydCBm
YWlsZWRcbiIpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgfQo+ID4g
Kwo+ID4gKyAgICAgcmV0ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUocGxhdF9kYXQtPm51bV9j
bGtzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGxhdF9kYXQtPmNs
a3MpOwo+ID4gKyAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgcmVzZXRfY29udHJvbF9h
c3NlcnQoZ2JldGgtPnJzdGMpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4KPiAgICAgICAg
IHJldHVybiByZXQ/Pwo+CkluZGVlZCBJIG1pc3NlZCBpdC4KCkNoZWVycywKUHJhYmhha2FyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
