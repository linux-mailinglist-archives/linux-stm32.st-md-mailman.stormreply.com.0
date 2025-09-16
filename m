Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8570B59883
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Sep 2025 16:01:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BDC3C3087A;
	Tue, 16 Sep 2025 14:01:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2345CC32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 14:01:57 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so321991066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758031316; x=1758636116;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1/wO2aa6vwf2RnAiZIcGlD55m2MeNlNGw0Ms6XcA88=;
 b=dVBRwthRvyqQkMsNKAU0M4ssd1bDx8XeJOP0aGx/oxt6TjdhCcmnPDkknV0wK6alAP
 camCAEeNHBrcz9CqCTSW6NqbIQ1u7nUXpAVj7jE+ouN0d2dZyobER+/WsEucyAEksxf+
 V3ZhJFta299fUyF3jhoCRtCjuC3sliIflYgHq/dbAdLHeEwJ8RxMzk9H9an9S5PQdD3B
 anybharKxid4p8GQo+SUd5fJz49hgCdtix8+D0ur8PB6svAjFB9RAWCcqlBrpTvcvJIh
 ISwcZsgNIJUMrs4+2/e9EGD/tYeQf841+Ff4vLnWZ94XLZdt5VlBkeH/LA1LtLTF4cDE
 Fhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758031316; x=1758636116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1/wO2aa6vwf2RnAiZIcGlD55m2MeNlNGw0Ms6XcA88=;
 b=AVaGNakD9wTppxl3FZvTvSzYYFUXeqctphIo2WoUeu3/+itqV+067ciYTic84Vgqbb
 ixm2yYNgzdy0nqCZ791XbZpUHy+8dtvBOJ48a3SdbvmSBvon2LT5y8DLrN/K+43i/Xfc
 1ShtD7OrU1h/WRuY8Tt75PHE1aJjigQdr+XQLENy0x+kJESE4g3FpvX9enxyOmSEO1TW
 gm/327KgQrwMVOdYpbkZ3vGRDiXWZw99MUB0XN1S9EKoQEgOm5RajO0Yvl/xeTvDQS1K
 EXZa5C7Mw3xxZNKtyxUPF4qhGd/2HwDp6wgKgjlfuSOTSr5fJ6yWijcRM61c5QXtf51G
 O+aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5JZBfJXoE/7KnnFQ16dCXHCGyN7LWRsRTG7lmnF7G9cDl/Nomybbu1mehwBvEQdtpLUPzScUHI95xwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4vEU+ZcqePHD/BkW04GSUcQdM8M+vqk9+QLdRQNwkPXG443Gn
 eBNFsGYUtRd21i77UIaDC8A2Dr0dtzsz+UcZrxTaIAVqqsfpkx7Ei6aGxlN8jTzjlU/zRgFJeXf
 cZDpeirEIfBiu1EJQR1w4e7blzLkEY6o=
X-Gm-Gg: ASbGncse9NbEPPst9K9QvlI82bi0Fp9R6Q5urCqyCxgIZIhovkaaKYa/GAn5qsGrZIH
 C2JroBugtGCGtq98FAs0f44ArHrD+G2hXR3t4i1W+Z8A4c6PYh9zDrMB/SK9plcv4jKcH0/SIfE
 UeU6kAfGOH2JI9ij146BcF05vgIkC73s8bzaAUOztCo6wbMu39s5ea+BO7uSyBJoDgN4RZkFlt8
 46fhiKt
X-Google-Smtp-Source: AGHT+IF6Zy4nzr1OXuX8lE0GqEoG4kJn0jZymLRdcAOKhzS2jAVa02oHblL7nubcp0VuU3f+RU4UUOjge2+K+7voqcc=
X-Received: by 2002:a17:907:9629:b0:afd:d994:7d1a with SMTP id
 a640c23a62f3a-b07c3ada566mr1656686866b.63.1758031315726; Tue, 16 Sep 2025
 07:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aMlgg_QpJOEDGcEA@monster>
 <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 16 Sep 2025 15:01:28 +0100
X-Gm-Features: AS18NWCVgZqFQH49bSZ6oVph3-y6Eo3LOyTc2vGW-dgo3A64cLzcN5-yV35knnc
Message-ID: <CA+V-a8snd9Qeb_Fbj=_E6Y28EUV-ad+PO=cZcWrZ2F1_RwscGw@mail.gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac:
 dwmac-renesas-gbeth: Add support for RZ/T2H SoC
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

SGkgQW5kcmVzIGFuZCBHZWVydCwKCk9uIFR1ZSwgU2VwIDE2LCAyMDI1IGF0IDI6MzHigK9QTSBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIEFu
ZGVycywKPgo+IE9uIFR1ZSwgMTYgU2VwdCAyMDI1IGF0IDE1OjA1LCBBbmRlcnMgUm94ZWxsIDxh
bmRlcnMucm94ZWxsQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gT24gMjAyNS0wOS0wOCAxMTo1OSwg
UHJhYmhha2FyIHdyb3RlOgo+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiA+Cj4gPiA+IEV4dGVuZCB0aGUgUmVuZXNh
cyBHQkVUSCBzdG1tYWMgZ2x1ZSBkcml2ZXIgdG8gc3VwcG9ydCB0aGUgUlovVDJIIFNvQywKPiA+
ID4gd2hlcmUgdGhlIEdNQUMgaXMgY29ubmVjdGVkIHRocm91Z2ggYSBNSUlDIFBDUy4gSW50cm9k
dWNlIGEgbmV3Cj4gPiA+IGBoYXNfcGNzYCBmbGFnIGluIGBzdHJ1Y3QgcmVuZXNhc19nYmV0aF9v
Zl9kYXRhYCB0byBpbmRpY2F0ZSB3aGVuIFBDUwo+ID4gPiBoYW5kbGluZyBpcyByZXF1aXJlZC4K
PiA+ID4KPiA+ID4gV2hlbiBlbmFibGVkLCB0aGUgZHJpdmVyIHBhcnNlcyB0aGUgYHBjcy1oYW5k
bGVgIHBoYW5kbGUsIGNyZWF0ZXMgYSBQQ1MKPiA+ID4gaW5zdGFuY2Ugd2l0aCBgbWlpY19jcmVh
dGUoKWAsIGFuZCB3aXJlcyBpdCBpbnRvIHBoeWxpbmsuIFByb3BlciBjbGVhbnVwCj4gPiA+IGlz
IGRvbmUgd2l0aCBgbWlpY19kZXN0cm95KClgLiBOZXcgaW5pdC9leGl0L3NlbGVjdCBob29rcyBh
cmUgYWRkZWQgdG8KPiA+ID4gYHBsYXRfc3RtbWFjZW5ldF9kYXRhYCBmb3IgUENTIGludGVncmF0
aW9uLgo+ID4gPgo+ID4gPiBVcGRhdGUgS2NvbmZpZyB0byBzZWxlY3QgYFBDU19SWk4xX01JSUNg
IHdoZW4gYnVpbGRpbmcgdGhlIFJlbmVzYXMgR0JFVEgKPiA+ID4gZHJpdmVyIHNvIHRoZSBQQ1Mg
c3VwcG9ydCBpcyBhbHdheXMgYXZhaWxhYmxlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4g
PiA+IC0tLQo+ID4gPiB2Mi0+djM6Cj4gPiA+IC0gRHJvcHBlZCBwYXNzaW5nIFNUTU1BQ19GTEFH
X0VOX1RYX0xQSV9DTEtfUEhZX0NBUCBmbGFnIGluIHN0bW1hY19mbGFncwo+ID4gPiAgIGFzIGl0
IGlzIGFsd2F5cyBzZXQgZm9yIGFsbCB0aGUgU29Dcy4KPiA+ID4gLSBVcGRhdGVkIEtjb25maWcg
dG8gaW5jbHVkZSBSWi9UMkggYW5kIFJaL04ySC4KPiA+ID4KPiA+ID4gdjEtPnYyOgo+ID4gPiAt
IE5vIGNoYW5nZXMuCj4gPgo+ID4gVGhlIGZvbGxvd2luZyB3YXJuaW5nIGlzIHNlZW4gd2hlbiBk
b2luZyBhIGRlZmNvbmZpZyBidWlsZCAobWFrZQo+ID4gZGVmY29uZmlnKSBmb3IgYXJtNjQgb24g
dGhlIExpbnV4IG5leHQtMjAyNTA5MTUgdGFnLgo+ID4KPiA+IEZpcnN0IHNlZW4gb24gbmV4dC0y
MDI1MDkxNQo+ID4gR29vZDogbmV4dC0yMDI1MDkxMgo+ID4gQmFkOiBuZXh0LTIwMjUwOTE1Cj4g
Pgo+ID4gUmVncmVzc2lvbiBBbmFseXNpczoKPiA+IC0gTmV3IHJlZ3Jlc3Npb24/IHllcwo+ID4g
LSBSZXByb2R1Y2liaWxpdHk/IHllcwo+ID4KPiA+IEJ1aWxkIHJlZ3Jlc3Npb246IFdBUk5JTkc6
IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIFBDU19SWk4xX01JSUMKPiA+
Cj4gPiBSZXBvcnRlZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBs
aW5hcm8ub3JnPgo+ID4KPiA+IFRoaXMgaXMgdGhlIGJ1aWxkIHdhcm5pbmc6Cj4gPiBXQVJOSU5H
OiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBQQ1NfUlpOMV9NSUlDCj4g
PiAgIERlcGVuZHMgb24gW25dOiBORVRERVZJQ0VTIFs9eV0gJiYgT0YgWz15XSAmJiAoQVJDSF9S
Wk4xIFs9bl0gfHwgQ09NUElMRV9URVNUIFs9bl0pCj4gPiAgIFNlbGVjdGVkIGJ5IFttXToKPiA+
ICAgLSBEV01BQ19SRU5FU0FTX0dCRVRIIFs9bV0gJiYgTkVUREVWSUNFUyBbPXldICYmIEVUSEVS
TkVUIFs9eV0gJiYgTkVUX1ZFTkRPUl9TVE1JQ1JPIFs9eV0gJiYgU1RNTUFDX0VUSCBbPW1dICYm
IFNUTU1BQ19QTEFURk9STSBbPW1dICYmIE9GIFs9eV0gJiYgKEFSQ0hfUkVORVNBUyBbPXldIHx8
IENPTVBJTEVfVEVTVCBbPW5dKQo+ID4KPiA+IFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRl
bmNpZXMgZGV0ZWN0ZWQgZm9yIFBDU19SWk4xX01JSUMKPiA+ICAgRGVwZW5kcyBvbiBbbl06IE5F
VERFVklDRVMgWz15XSAmJiBPRiBbPXldICYmIChBUkNIX1JaTjEgWz1uXSB8fCBDT01QSUxFX1RF
U1QgWz1uXSkKPiA+ICAgU2VsZWN0ZWQgYnkgW21dOgo+ID4gICAtIERXTUFDX1JFTkVTQVNfR0JF
VEggWz1tXSAmJiBORVRERVZJQ0VTIFs9eV0gJiYgRVRIRVJORVQgWz15XSAmJiBORVRfVkVORE9S
X1NUTUlDUk8gWz15XSAmJiBTVE1NQUNfRVRIIFs9bV0gJiYgU1RNTUFDX1BMQVRGT1JNIFs9bV0g
JiYgT0YgWz15XSAmJiAoQVJDSF9SRU5FU0FTIFs9eV0gfHwgQ09NUElMRV9URVNUIFs9bl0pCj4g
PiBJOiBjb25maWc6IFBBU1MgaW4gMDowMDowMS41OTIzNTYKPgo+IFRoYW5rcyBmb3IgeW91ciBy
ZXBvcnQhCj4KPiAgICAgY29uZmlnIERXTUFDX1JFTkVTQVNfR0JFVEgKPiAgICAgICAgIGRlcGVu
ZHMgb24gT0YgJiYgKEFSQ0hfUkVORVNBUyB8fCBDT01QSUxFX1RFU1QpCj4gICAgICAgICBzZWxl
Y3QgUENTX1JaTjFfTUlJQwo+Cj4gICAgIGNvbmZpZyBQQ1NfUlpOMV9NSUlDCj4gICAgICAgICBk
ZXBlbmRzIG9uIEFSQ0hfUlpOMSB8fCBBUkNIX1I5QTA5RzA3NyB8fCBBUkNIX1I5QTA5RzA4NyB8
fCBDT01QSUxFX1RFU1QKPgo+ICJBUkNIX1JFTkVTQVMiIGlzIHdpZGVyIHRoYW4gIkFSQ0hfUlpO
MSB8fCBBUkNIX1I5QTA5RzA3NyB8fCBBUkNIX1I5QTA5RzA4NyIuCj4gSSB3b3VsZCBqdXN0IGNo
YW5nZSB0aGUgbGF0dGVyIHRvIEFSQ0hfUkVORVNBUy4KPgpUaGFuayB5b3UgYm90aC4gSSdsbCBj
cmVhdGUgYSBwYXRjaCB1cGRhdGluZyBpdCB0byB1c2UgYEFSQ0hfUkVORVNBU2AuCgpDaGVlcnMs
ClByYWJoYWthcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
