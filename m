Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C046A8A028
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 15:54:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34ABCC78023;
	Tue, 15 Apr 2025 13:54:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A667C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 13:54:16 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso3590590f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744725256; x=1745330056;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxTErC+KnB5NGpCTc9/w/rpBQLv25Jj15o+pnsH3W3I=;
 b=KSTQs4CwSCvSddPawqoxEhWSTo2M7XKrCPwiJpJ+dLCJupZTkQguRoBiWooIe6q1l8
 aKs+HNBNFAGMeIVaAkQX8dB/ui0q0uZ0xrfZddqPVN89X0p6DRA/HE8j7K6hz2xt5Dl6
 YJ5PDa7JzmT02FPeEJBkahAs3ETDcu7nkT6mgGrV893JNX9PpW5Z/fyk9IVfxh5yhFvJ
 ffKsj7truUI0xajN/mAY6FUZ5XwbxqAWX45RzMeLVjh5Rdkd4oTwOWWhR5oRr5f9v1/u
 UJ2nkqRRj2szPxwrD2xGffV6GNC9RMLAouH1NjQYx9j6S36KMvQIBmeWUT9SuBB3Z90F
 MJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744725256; x=1745330056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dxTErC+KnB5NGpCTc9/w/rpBQLv25Jj15o+pnsH3W3I=;
 b=NRDp/Nom8wlKhdi+Iu3UddHbffSqiZ8K5YwN+zQnVSsZ1Q4WXf+j47+pRDa52BfU9T
 4wfBhr9RbYFZTbxO0ni2A2YdvxdPySCOv1G/dcpThwBIPRMB10aIRPodT4upfYVr/XRd
 Q7dr0OWJ+6rcoHyt4eHx5gFjOI6oaXhq64Q7tyi6eyzqrfvBZCuESKyXGn+NPQTC7OFh
 1R74xkdOCbWbyv+zdly/sorYNmCB/IkrssRXQF/Fmx4r8Cx5Eg0hlqSW3gINTtgu4l96
 mv+KjsebEdw0gGZ1Ny+TAkJw6hw/r1mo2CT5XNH43WriThCNZtmbjX4+FeB403Ou82JV
 yaJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc179IzQF2amNPljyNA/4FNsypTeqGGzc1wPmQUde2twGFSH2/3xQUTc7y+z6oNyiZVydyNtLh5DEzWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YznE3uvoLw8sUSRfvIb2endbDOEhXhJLR82mQ6qQ4ea+/HmCTIq
 mWtKcdD7I2QdFiV8c9+hlhMuMOKeNkLS0Kdi4+kixjmMmUSrUjqrNBAv7nZeKRY6bjbCYu0hhNu
 t3h+uWSifoLYBkwqZHeEdkagYmt0=
X-Gm-Gg: ASbGncsaLZyFMioEviXeetef9eH16934UQR8hPfaLoVPwrs3AGLb7UqTASmSlvGcRnX
 6aiEI+X4peKDc29gYR7Yjj7dQiplqt2/9mfk4OJjzjP3CFoP7KBsrlz4C3Nk9g0dPBrp18UcwdS
 zrXHk+PHg0PURf/q5B/IDBaLgYU0rR2cv1W5MB9PoPji9hL9weQdz8Gw==
X-Google-Smtp-Source: AGHT+IHIlDUG50nBX2u1LH9CaXEXWCjuUqqrtu+RUgth3OiXGHRpRs4KPtJjbrXWad3okXBSN+tXr8a7mC+87EouhWY=
X-Received: by 2002:a05:6000:18af:b0:391:4743:6dc2 with SMTP id
 ffacd0b85a97d-39ea52120e2mr13543818f8f.25.1744725256350; Tue, 15 Apr 2025
 06:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c9d8f97470c3c5a8c0214af266b9579086460ba1.camel@pengutronix.de>
In-Reply-To: <c9d8f97470c3c5a8c0214af266b9579086460ba1.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 14:53:50 +0100
X-Gm-Features: ATxdqUE9J0buGzHkD1AbdOnLT3zfOWdA_YFucRbFLlm3VKoGvgJwL6K9gejz2HM
Message-ID: <CA+V-a8tr=6ZgKSF5=CmRvrMO8ZSwtfD-cqSpi=5+5WwB-_pj_Q@mail.gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v6 3/4] net: stmmac: Add DWMAC
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

SGkgUGhpbGlwcCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIFR1ZSwgQXByIDE1LCAy
MDI1IGF0IDI6MzjigK9QTSBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPiB3
cm90ZToKPgo+IE9uIERpLCAyMDI1LTA0LTE1IGF0IDEzOjU2ICswMTAwLCBQcmFiaGFrYXIgd3Jv
dGU6Cj4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+Cj4gPgo+ID4gQWRkIHRoZSBEV01BQyBnbHVlIGxheWVyIGZvciB0aGUgR0JF
VEggSVAgZm91bmQgaW4gdGhlIFJlbmVzYXMgUlovVjJIKFApCj4gPiBTb0MuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvS2NvbmZpZyAgIHwgIDExICsrCj4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvTWFrZWZpbGUgIHwgICAxICsKPiA+ICAuLi4vc3RtaWNyby9zdG1tYWMvZHdtYWMtcmVu
ZXNhcy1nYmV0aC5jICAgICAgfCAxNDggKysrKysrKysrKysrKysrKysrCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxNjAgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZp
ZyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL0tjb25maWcKPiA+IGluZGV4
IDNjODIwZWY1Njc3NS4uMmM5OWIyM2YwZmFhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZwo+ID4gQEAgLTEzMSw2ICsxMzEsMTcgQEAgY29u
ZmlnIERXTUFDX1FDT01fRVRIUU9TCj4gPiAgICAgICAgIFRoaXMgc2VsZWN0cyB0aGUgUXVhbGNv
bW0gRVRIUU9TIGdsdWUgbGF5ZXIgc3VwcG9ydCBmb3IgdGhlCj4gPiAgICAgICAgIHN0bW1hYyBk
ZXZpY2UgZHJpdmVyLgo+ID4KPiA+ICtjb25maWcgRFdNQUNfUkVORVNBU19HQkVUSAo+ID4gKyAg
ICAgdHJpc3RhdGUgIlJlbmVzYXMgUlovVjJIKFApIEdCRVRIIHN1cHBvcnQiCj4gPiArICAgICBk
ZWZhdWx0IEFSQ0hfUkVORVNBUwo+ID4gKyAgICAgZGVwZW5kcyBvbiBPRiAmJiAoQVJDSF9SRU5F
U0FTIHx8IENPTVBJTEVfVEVTVCkKPiA+ICsgICAgIGhlbHAKPiA+ICsgICAgICAgU3VwcG9ydCBm
b3IgR2lnYWJpdCBFdGhlcm5ldCBJbnRlcmZhY2UgKEdCRVRIKSBvbiBSZW5lc2FzCj4gPiArICAg
ICAgIFJaL1YySChQKSBTb0NzLgo+ID4gKwo+ID4gKyAgICAgICBUaGlzIHNlbGVjdHMgdGhlIFJl
bmVzYXMgUlovVjJIKFApIFNvYyBzcGVjaWZpYyBnbHVlIGxheWVyIHN1cHBvcnQKPiA+ICsgICAg
ICAgZm9yIHRoZSBzdG1tYWMgZGV2aWNlIGRyaXZlci4KPiA+ICsKPiA+ICBjb25maWcgRFdNQUNf
Uk9DS0NISVAKPiA+ICAgICAgIHRyaXN0YXRlICJSb2NrY2hpcCBkd21hYyBzdXBwb3J0Igo+ID4g
ICAgICAgZGVmYXVsdCBBUkNIX1JPQ0tDSElQCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGUgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9NYWtlZmlsZQo+ID4gaW5kZXggNTk0ODgzZmI0MTY0Li45MTA1MDIxNTUx
MWIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9N
YWtlZmlsZQo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFr
ZWZpbGUKPiA+IEBAIC0yMCw2ICsyMCw3IEBAIG9iai0kKENPTkZJR19EV01BQ19MUEMxOFhYKSAr
PSBkd21hYy1scGMxOHh4Lm8KPiA+ICBvYmotJChDT05GSUdfRFdNQUNfTUVESUFURUspICs9IGR3
bWFjLW1lZGlhdGVrLm8KPiA+ICBvYmotJChDT05GSUdfRFdNQUNfTUVTT04pICAgICs9IGR3bWFj
LW1lc29uLm8gZHdtYWMtbWVzb244Yi5vCj4gPiAgb2JqLSQoQ09ORklHX0RXTUFDX1FDT01fRVRI
UU9TKSAgICAgICs9IGR3bWFjLXFjb20tZXRocW9zLm8KPiA+ICtvYmotJChDT05GSUdfRFdNQUNf
UkVORVNBU19HQkVUSCkgKz0gZHdtYWMtcmVuZXNhcy1nYmV0aC5vCj4gPiAgb2JqLSQoQ09ORklH
X0RXTUFDX1JPQ0tDSElQKSArPSBkd21hYy1yay5vCj4gPiAgb2JqLSQoQ09ORklHX0RXTUFDX1Ja
TjEpICAgICArPSBkd21hYy1yem4xLm8KPiA+ICBvYmotJChDT05GSUdfRFdNQUNfUzMyKSAgICAg
ICAgICAgICAgKz0gZHdtYWMtczMyLm8KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMKPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjg2NzRiNzYwNWQ4Mwo+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtcmVuZXNhcy1nYmV0aC5jCj4gPiBAQCAtMCwwICsxLDE0OCBAQAo+ID4gKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+ID4gKy8qCj4gPiArICogZHdtYWMtcmVuZXNh
cy1nYmV0aC5jIC0gRFdNQUMgU3BlY2lmaWMgR2x1ZSBsYXllciBmb3IgUmVuZXNhcyBHQkVUSAo+
ID4gKyAqCj4gPiArICogVGhlIFJ4IGFuZCBUeCBjbG9ja3MgYXJlIHN1cHBsaWVkIGFzIGZvbGxv
d3MgZm9yIHRoZSBHQkVUSCBJUC4KPiA+ICsgKgo+ID4gKyAqICAgICAgICAgICAgICAgICAgICAg
ICAgIFJ4IC8gVHgKPiA+ICsgKiAgIC0tLS0tLS0rLS0tLS0tLS0tLS0tLSBvbiAvIG9mZiAtLS0t
LS0tCj4gPiArICogICAgICAgICAgfAo+ID4gKyAqICAgICAgICAgIHwgICAgICAgICAgICBSeC0x
ODAgLyBUeC0xODAKPiA+ICsgKiAgICAgICAgICArLS0tLSBub3QgLS0tLSBvbiAvIG9mZiAtLS0t
LS0tCj4gPiArICoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgUmVuZXNhcyBFbGVjdHJvbmlj
cyBDb3Jwb3JhdGlvbgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4K
PiA+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICsjaW5jbHVk
ZSA8bGludXgvcmVzZXQuaD4KPiA+ICsKPiA+ICsjaW5jbHVkZSAic3RtbWFjX3BsYXRmb3JtLmgi
Cj4gPiArCj4gPiArc3RydWN0IHJlbmVzYXNfZ2JldGggewo+ID4gKyAgICAgc3RydWN0IHBsYXRf
c3RtbWFjZW5ldF9kYXRhICpwbGF0X2RhdDsKPiA+ICsgICAgIHN0cnVjdCByZXNldF9jb250cm9s
ICpyc3RjOwo+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+ID4gKyAgICAgdm9pZCBfX2lv
bWVtICpyZWdzOwo+Cj4gVGhpcyBkb2Vzbid0IHNlZW0gdG8gYmUgdXNlZCBhbnl3aGVyZS4KPgpJ
J2xsIGdldCByaWQgb2YgaXQuCgo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0IGNoYXIg
KmNvbnN0IHJlbmVzYXNfZ2JldGhfY2xrc1tdID0gewo+ID4gKyAgICAgInR4IiwgInR4LTE4MCIs
ICJyeCIsICJyeC0xODAiLAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGludCByZW5lc2FzX2di
ZXRoX2Nsa3NfY29uZmlnKHN0cnVjdCByZW5lc2FzX2diZXRoICpnYmV0aCwgYm9vbCBlbmFibGVk
KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQ7
Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgcGxhdF9kYXQgPSBnYmV0aC0+cGxh
dF9kYXQ7Cj4gPiArICAgICBpZiAoZW5hYmxlZCkgewo+ID4gKyAgICAgICAgICAgICByZXQgPSBy
ZXNldF9jb250cm9sX2RlYXNzZXJ0KGdiZXRoLT5yc3RjKTsKPiA+ICsgICAgICAgICAgICAgaWYg
KHJldCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZ2JldGgtPmRldiwgIlJl
c2V0IGRlYXNzZXJ0IGZhaWxlZFxuIik7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICByZXQgPSBj
bGtfYnVsa19wcmVwYXJlX2VuYWJsZShwbGF0X2RhdC0+bnVtX2Nsa3MsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBsYXRfZGF0LT5jbGtzKTsKPiA+ICsg
ICAgICAgICAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXNldF9jb250
cm9sX2Fzc2VydChnYmV0aC0+cnN0Yyk7Cj4gPiArICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAg
ICAgICBjbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZShwbGF0X2RhdC0+bnVtX2Nsa3MsIHBsYXRf
ZGF0LT5jbGtzKTsKPiA+ICsgICAgICAgICAgICAgcmV0ID0gcmVzZXRfY29udHJvbF9hc3NlcnQo
Z2JldGgtPnJzdGMpOwo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGRldl9lcnIoZ2JldGgtPmRldiwgIlJlc2V0IGFzc2VydCBmYWlsZWRcbiIpOwo+
ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHJldDsKPiA+ICt9Cj4KPiBBcGFydCBm
cm9tIHRoZSBwbGF0X2RhdCBhc3NpZ25tZW50LCB0aGlzIGZ1bmN0aW9uIGhhcyB0d28gY29tcGxl
dGVseQo+IHNlcGFyYXRlIHBhdGhzLiBJJ2QgZm9sZCBpdHMgY29udGVudHMgaW50byByZW5lc2Fz
X2diZXRoX2luaXQvZXhpdCgpLgo+Ck9LLCBJJ2xsIGZpeCB0aGF0IGluIHY3LgoKQ2hlZXJzLApQ
cmFiaGFrYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
