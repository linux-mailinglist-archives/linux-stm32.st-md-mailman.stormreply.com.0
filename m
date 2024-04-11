Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8E8A0A5A
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Apr 2024 09:45:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6D42C6C83C;
	Thu, 11 Apr 2024 07:45:45 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D68E2C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Apr 2024 07:45:44 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6154a1812ffso80579167b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Apr 2024 00:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712821541; x=1713426341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TLCbqACAEmw1RFUJ3MP/4fcprBXm3Vbx6jGa7VJAGWQ=;
 b=iy7A8B364UK52LLGCeBnLp3Isfzdcp6EnJUfIG3Mr+YNo6s+WLP8cWBaoOCbFg8EQA
 dV5X4KskPNYRaSr/PPSil0ODT4KbHktaR5U+wWfX6VAahWYwrtjkoOJQ7wGnjkv9bNZI
 QJZEKaft5KXNkp26MfUUNrGO7IMuJiFdN8Kmw8reyaRG08bu5hS33ZW+wIJ8k2nJvup4
 JWgKeciZe0JqK/8wvKxmPR4nu9OxAXc7iAlnVsSZg40TdnyRunLALWO4FY7TU4Ha4R88
 fBOlJiPAomAfw3jfjIrLSiHTxQFdZqb/uS7nyGX1V8IUKLD2xnX7oeCuG1wWabILrg6Z
 Kowg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhtnFWQwDreq21iL/Qsw163HrrbUgWY21IOjoZBurXvy6Zk1h5ii2Z44QX3jtXjco6DQw+n1zrPACSwFkbOoehqg/1qASS1bxBsN4JcxxzCD0GloqexGLE
X-Gm-Message-State: AOJu0YydXK3IxPcUJZrHt/APhqR4VPAQEInI8C3CFrE4YDAazt9zHEq3
 M19WQvKpq7E3rn61KisRGfq0c/00Xcz/7x8qMs+5m/rDKjrruPK0jmlMivHL
X-Google-Smtp-Source: AGHT+IF5sD+Nuiqb3sIESGCseziFvW8ZGK17GWwbx1QQlNBKE5mlCb2z9lHDXqU8wG/fWOUt5MQYmQ==
X-Received: by 2002:a81:9142:0:b0:615:2603:7efd with SMTP id
 i63-20020a819142000000b0061526037efdmr5687758ywg.8.1712821540733; 
 Thu, 11 Apr 2024 00:45:40 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 n192-20020a0dcbc9000000b0061505c41d13sm202971ywd.30.2024.04.11.00.45.39
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 00:45:40 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-ddda842c399so7818015276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Apr 2024 00:45:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZQnIcHA3oKPbeIJIlXn3n2A/bVajdN1VLNzb7gSf4fblRJC8na6LXmplNOTdRnQb8YfFw92jyTFd9ERbUEMY348cDKjji/IT4SHIyWyhtNfcaF/L0uQiq
X-Received: by 2002:a25:bac9:0:b0:dda:abbd:7395 with SMTP id
 a9-20020a25bac9000000b00ddaabbd7395mr4287330ybk.51.1712821539199; Thu, 11 Apr
 2024 00:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
 <20240409-rzn1-gmac1-v2-4-79ca45f2fc79@bootlin.com>
 <CAMuHMdX-F8LXWx=Ras4f+Dt_r485HKjRDLydDXZsnZBW8HJzxw@mail.gmail.com>
 <9bd8eee4-952d-d5b2-c462-45c1466c54d6@bootlin.com>
In-Reply-To: <9bd8eee4-952d-d5b2-c462-45c1466c54d6@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Apr 2024 09:45:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVAB8CuSkrnp+b7-+s3v0eHLr0Lvm1=MveGMVRW3T9T-A@mail.gmail.com>
Message-ID: <CAMuHMdVAB8CuSkrnp+b7-+s3v0eHLr0Lvm1=MveGMVRW3T9T-A@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/5] net: stmmac: add support
	for RZ/N1 GMAC
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

SGkgUm9tYWluLAoKT24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMjoyNOKAr1BNIFJvbWFpbiBHYW50
b2lzCjxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCA5IEFwciAy
MDI0LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiA+ICtjb25maWcgRFdNQUNfUlpOMQo+
ID4gPiArICAgICAgIHRyaXN0YXRlICJSZW5lc2FzIFJaL04xIGR3bWFjIHN1cHBvcnQiCj4gPiA+
ICsgICAgICAgZGVmYXVsdCBBUkNIX1JaTjEKPiA+Cj4gPiBXaHkgZGVmYXVsdCB0byBlbmFibGVk
Pwo+ID4KPiA+ID4gKyAgICAgICBkZXBlbmRzIG9uIE9GICYmIChBUkNIX1JaTjEgfHwgQ09NUElM
RV9URVNUKQo+Cj4gVGhlIGtlcm5lbCBkb2Mgc3RhdGVzIHRoaXMgYXMgb25lIG9mIHRoZSBwb3Nz
aWJsZSBjYXNlcyB3aGVyZSBzZXR0aW5nIGRlZmF1bHQKPiB5L20gbWFrZXMgc2Vuc2U6Cj4KPiBg
YGAKPiBTdWItZHJpdmVyIGJlaGF2aW9yIG9yIHNpbWlsYXIgb3B0aW9ucyBmb3IgYSBkcml2ZXIg
dGhhdCBpcyDigJxkZWZhdWx0IG7igJ0uIFRoaXMKPiBhbGxvd3MgeW91IHRvIHByb3ZpZGUgc2Fu
ZSBkZWZhdWx0cy4KPiBgYGAKPgo+IEluIHRoZSBjYXNlIG9mIERXTUFDX1JaTjEsIGl0IGlzIGEg
c3Vib3B0aW9uIG9mIHN0bW1hYyB3aGljaCBpcyAiZGVmYXVsdCBuIiwgYW5kCj4gSSB0aGluayBp
dCBtYWtlcyBzZW5zZSB0byBlbmFibGUgdGhlIFJaTjEgZXRoZXJuZXQgY29udHJvbGxlciBkcml2
ZXIgaWYgYm90aCB0aGUKPiBzdG1tYWMgZHJpdmVyIGFuZCB0aGUgUlpOMSBhcmNoaXRlY3R1cmUg
d2VyZSBleHBsaWNpdGVseSBzZWxlY3RlZC4KClRoYW5rcyBmb3IgeW91ciBhbnN3ZXIsIHRoYXQg
bWFrZXMgcGVyZmVjdCBzZW5zZSEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
