Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64554A8A016
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 15:52:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14C11C78023;
	Tue, 15 Apr 2025 13:52:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAF6AC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 13:52:54 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so5634091f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744725174; x=1745329974;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1TwZ3MTtKiM7l1EeKd00zGsHBWMHnKmuqThclAOg/Kg=;
 b=Aqmt2SE8Y19nl0Mp4gn/B4braBOV1oQSH6TDlo2wzcklN+NBWO4cy6keR2uFclYjZl
 QCa95ktHXQZV827j4j8SIIu8wRr3GR8huP1d3FEpjOVsCnYXbE4wb41sjJQy9S2IOfjK
 41unuO0jgB6IpCZTjLv/tkg6rzjYyU7eBWQSSjAVoafNTYFLTrqTVfCjZfUglgQlI27u
 idyJBU6MHshEjyTQrufBvcBKWkfjiIF6Spt00xTAbB65MPzOSP56brx+YpA/MRAz1IA0
 crliPbPTxwvXwofLHHWGlZ1oZojhmuU8OLmgHFHz/gxz3ztfzgRQfJ725O7yWKdPwtG9
 Oq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744725174; x=1745329974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1TwZ3MTtKiM7l1EeKd00zGsHBWMHnKmuqThclAOg/Kg=;
 b=Us+dwzjXn1YZmElqRweosz17qrZ4EW1UHxIsJ4PhaIJqx9omiQ/xq5oQlvNI13H2Sd
 4cq0IClhWjRgMtHu9C4pTIqW9c6LKdxzqqo4cZ0wmMP63mT/PwIkjqNHokUGsnHYecHS
 usrLlCPQlHh4hU1wvR0/woUrXJwk5o+v6zyu1fv2E9cg/HqZVkv7jUfk9+mz1ac18MsQ
 LbgSmHfU1cokCevUgTQitMGhB5fJ9X/SweVSx30oDjwwy7Z2N6gB+8MXJK2C2PKGtgmz
 uCPknNgJQ0rbgRfevOc+r2RNgfRFP94x6Zj7RSWpSg139sYpC9L8gbEb6wlxZtty0p4J
 RGuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqdlfj4U3CfIjGGVI/4PfqDmxgnNbF6KKdznDsEvGn/PmM4mSsGIr2vb+y5Mm0v9uBpCRFWdtaUshjpA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3VLKbdF8erftPNgr3W2jUENt5OLFgsn+WcSCRl2ZG0LcOnASx
 XZMaj8G1CFCMi8fyyChXJLA4Lma+n2J5NYVAWhlrX0Iv8c57xSgffF3W3k6IrBMhrZ8o4acqqLP
 udFYOBYKs6aB6cDbn7e3FD3YXZN0=
X-Gm-Gg: ASbGncsQ/iTZyTFcBdn9s6kf0Y46TmjkOvQClqIMO1SzW/ifmTf2Mg9eTUm5JltcCvY
 Gq6gveln8oufg5AgRRHxGfsSh9EEYCVh9LAHNvFSVkz1B5PRTrgcyvEOTRqYyFb8ZPwHMI25RoF
 yLZ3BqNfmQJq3EYDPzSGPmb7VMBEjJ3dJoqL4ZS1L11cWvH9lU/xdksrws9ZJIXdeA
X-Google-Smtp-Source: AGHT+IHK+m8VrLrlFlxV6nZ8ThujVJZ2WLpJFiDSDa8zctkcFlgA9baoyjBybS2403268oDSkrugum4D+6yxW9qAQH4=
X-Received: by 2002:a05:6000:2905:b0:39c:2688:612b with SMTP id
 ffacd0b85a97d-39ea51ee489mr13637534f8f.7.1744725174186; Tue, 15 Apr 2025
 06:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_5hc151mud_UM1C@shell.armlinux.org.uk>
In-Reply-To: <Z_5hc151mud_UM1C@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 14:52:27 +0100
X-Gm-Features: ATxdqUGwNzRsl8J8RvInaxREfU9EplttUyDfCX4lENAuX3MnWfvUzlpS2hWxJag
Message-ID: <CA+V-a8sTN_vUDxL7V_64U3hs2-AB2Go66_gELe4Bkx0po2734Q@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
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

SGkgUnVzc2VsbCwKCk9uIFR1ZSwgQXByIDE1LCAyMDI1IGF0IDI6MznigK9QTSBSdXNzZWxsIEtp
bmcgKE9yYWNsZSkKPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBUdWUsIEFw
ciAxNSwgMjAyNSBhdCAwMTo1Njo0MVBNICswMTAwLCBQcmFiaGFrYXIgd3JvdGU6Cj4gPiBBZGQg
dGhlIERXTUFDIGdsdWUgbGF5ZXIgZm9yIHRoZSBHQkVUSCBJUCBmb3VuZCBpbiB0aGUgUmVuZXNh
cyBSWi9WMkgoUCkKPiA+IFNvQy4KPgo+IEkgdGhpbmsgd2UncmUgYWxtb3N0IHRoZXJlLCBidXQg
bm93IHRoYXQgdGhlIHRyZWVzIGhhdmUgcGFydGVkLCB3ZSBjYW4KPiBzdGFydCBzZWVpbmcgb3Ro
ZXIgYml0cyBvZiB3b29kIDopCj4KOikKCj4gPiArc3RydWN0IHJlbmVzYXNfZ2JldGggewo+ID4g
KyAgICAgc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0X2RhdDsKPiA+ICsgICAgIHN0
cnVjdCByZXNldF9jb250cm9sICpyc3RjOwo+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+
ID4gKyAgICAgdm9pZCBfX2lvbWVtICpyZWdzOwo+Cj4gVGhpcyBhcHBlYXJzIHRvIGJlIG9ubHkg
d3JpdHRlbiwgbmV2ZXIgcmVhZC4gRG8geW91IG5lZWQgaXQ/Cj4KTm8sIEkgY2FuIGdldCByaWQg
b2YgaXQuCgo+IEkgdGhpbmsgdGhhdCdzIHRoZSBsYXN0IHRoaW5nIEkgY2FuIHNwb3QgaW4gdGhp
cyBkcml2ZXIsIHNvIHdpdGggdGhhdAo+IGZpeGVkLCBwbGVhc2UgYWRkOgo+ClRoYW5rcywgYWxv
bmcgd2l0aCB0aGlzIEknbGwgZm9sZCByZW5lc2FzX2diZXRoX2Nsa3NfY29uZmlnKCkgY29udGVu
dHMKaW50byByZW5lc2FzX2diZXRoX2luaXQvZXhpdCgpIGFzIHN1Z2dlc3RlZCBieSBQaGlsaXBw
LgoKPiBSZXZpZXdlZC1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51az4KPgpDaGVlcnMsClByYWJoYWthcgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
