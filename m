Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A541A8B711
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 12:45:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CF34C78F81;
	Wed, 16 Apr 2025 10:45:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F3A4CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 10:45:20 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so36218145e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 03:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744800320; x=1745405120;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQ+hpkAofX+aHeqBJMhX3S0jMco9fodVrcXEVVX60Pw=;
 b=Aboh4XKOp5yBxUKOhM7a4lLqMDJ3aS/VwKipVCtyhkOd3ijtgbpzkzcos1Oq4CrSz3
 EQ+u3ZE0BVCpPfG+Exgy9uRyCczRXECPWpMkhrABuYub3/c+PyXASgVGXBtfzenX65mf
 yKgohUj/Y7nGJy5XqObQ4Z0JaBjOfn8GrSACC/DxPiyWqtAROMYg5DohJ0NPYPwBy+UV
 JkpmsdhvsyoCRy4zOKRLsdGJrBHGzDjryVHN0yCD+6ejfxKigtv0c/KTbeHa/Itq8iGs
 S06RpOHTWwLJePgBUab4Kvo2eHNsZ1iv15SnA9ZpSrZR/iuw80L5r+2FCz8cjzwJoqTz
 1GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744800320; x=1745405120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQ+hpkAofX+aHeqBJMhX3S0jMco9fodVrcXEVVX60Pw=;
 b=Wijdk327bbOW71M2M6BII4gjP0PC2G+HWQxlaKet5mrltXq2qPpvJFed+pd4YACIpE
 q5LkDwJbGk4E9m1R7xDPsd75OeGEhIfw1iCFehpns107H+KjFdHyrz01VhAvaM/ya+Ry
 /Xncaj4pAjiBGo85Cw717oFXDK27BufxFQvU3U4/DX+qgCmRQGvLJbTes5Mkfz6m8v1Q
 LzciAbnUA/f6PNjUlWKGTUI7aqThR8po1wOym4nrmMCzRUIMrT2A1btbQb+yf9PCd5cS
 XjFOt6u5+bskgOQT10YdvdRl5yG0/k1+U8VQjy75+DDMQfZo1T0eZDkuPvHKSijQnxVP
 rCEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvuUk+8Z95UxGRFCUtivsk5Oi7dztYRcjvo7ivH9hAJJwToDRh8UxV0Zj0IdiRWt1wq+vxrL9Liym+TQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzYpi7q8do1vtlU23dQ0zgQbqxeXXZSg/nFeTXaLIN0kuA2YIib
 oKiPftyxVgwM76YVcJ5PQ1DeY0GG2doaT/P+AfJgU9hbIPXUfSIF0/qxShaAWi10A7nnpycaC3b
 1qrnt2t4XZmgXWC6vKGXFdBHD1DU=
X-Gm-Gg: ASbGnctbBOeUDuvqt9T1nVbE2gPonIFRaOaOEIYWotksBpPFPVhl7DrTqSWhhpkKakl
 j9sz6BpFn/e3HMa2qCp+K5bt7VS9yYVLLIKNzIXc8J4ccKe6T61nYbjyWU0x3PYCcfhR1uJeSiL
 GFYbvVJfKw6RNF9IF5d7TMXZE5Cw/NxBgR2tKjyd2xDj4j3V5VzSRTYHs=
X-Google-Smtp-Source: AGHT+IHceAQPkYgr6gv4d+47dQi2BveM4MNunE8eLD0kPVn7VMp8NlOF14LAKjl5p9eftjHmJMrjHs4kMBezXamCYyU=
X-Received: by 2002:a05:6000:1863:b0:39a:ca04:3e4d with SMTP id
 ffacd0b85a97d-39ee5b1123amr1251169f8f.7.1744800319726; Wed, 16 Apr 2025
 03:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Apr 2025 11:44:53 +0100
X-Gm-Features: ATxdqUFZg4onSRXp1_kJuV7m9X73pVYBtmBk0hrdoERO50FU_acfBNENrSpy6UU
Message-ID: <CA+V-a8ua8anSCuyEYrdcpcCcdzE4EmQ0SDidYfiwe9zzezccaA@mail.gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

SGkgQWxsLAoKT24gV2VkLCBBcHIgMTYsIDIwMjUgYXQgMTE6NDDigK9BTSBQcmFiaGFrYXIgPHBy
YWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IExhZCBQcmFiaGFrYXIg
PHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEFkZCB0aGUgRFdN
QUMgZ2x1ZSBsYXllciBmb3IgdGhlIEdCRVRIIElQIGZvdW5kIGluIHRoZSBSZW5lc2FzIFJaL1Yy
SChQKQo+IFNvQy4KPgo+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiBSZXZpZXdlZC1ieTogUnVzc2VsbCBLaW5n
IChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KPiAtLS0KPiAgZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZyAgIHwgIDExICsrCj4gIGRyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlICB8ICAgMSArCj4gIC4uLi9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMgICAgICB8IDE0NiArKysrKysrKysrKysr
KysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmVuZXNh
cy1nYmV0aC5jCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvS2NvbmZpZyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL0tjb25m
aWcKPiBpbmRleCAzYzgyMGVmNTY3NzUuLjJjOTliMjNmMGZhYSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZwo+IEBAIC0xMzEsNiArMTMxLDE3IEBA
IGNvbmZpZyBEV01BQ19RQ09NX0VUSFFPUwo+ICAgICAgICAgICBUaGlzIHNlbGVjdHMgdGhlIFF1
YWxjb21tIEVUSFFPUyBnbHVlIGxheWVyIHN1cHBvcnQgZm9yIHRoZQo+ICAgICAgICAgICBzdG1t
YWMgZGV2aWNlIGRyaXZlci4KPgo+ICtjb25maWcgRFdNQUNfUkVORVNBU19HQkVUSAo+ICsgICAg
ICAgdHJpc3RhdGUgIlJlbmVzYXMgUlovVjJIKFApIEdCRVRIIHN1cHBvcnQiCj4gKyAgICAgICBk
ZWZhdWx0IEFSQ0hfUkVORVNBUwo+ICsgICAgICAgZGVwZW5kcyBvbiBPRiAmJiAoQVJDSF9SRU5F
U0FTIHx8IENPTVBJTEVfVEVTVCkKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgU3VwcG9ydCBm
b3IgR2lnYWJpdCBFdGhlcm5ldCBJbnRlcmZhY2UgKEdCRVRIKSBvbiBSZW5lc2FzCj4gKyAgICAg
ICAgIFJaL1YySChQKSBTb0NzLgo+ICsKPiArICAgICAgICAgVGhpcyBzZWxlY3RzIHRoZSBSZW5l
c2FzIFJaL1YySChQKSBTb2Mgc3BlY2lmaWMgZ2x1ZSBsYXllciBzdXBwb3J0Cj4gKyAgICAgICAg
IGZvciB0aGUgc3RtbWFjIGRldmljZSBkcml2ZXIuCj4gKwo+ICBjb25maWcgRFdNQUNfUk9DS0NI
SVAKPiAgICAgICAgIHRyaXN0YXRlICJSb2NrY2hpcCBkd21hYyBzdXBwb3J0Igo+ICAgICAgICAg
ZGVmYXVsdCBBUkNIX1JPQ0tDSElQCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvTWFrZWZpbGUKPiBpbmRleCA1OTQ4ODNmYjQxNjQuLjkxMDUwMjE1NTExYiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9NYWtlZmlsZQo+ICsr
KyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlCj4gQEAgLTIw
LDYgKzIwLDcgQEAgb2JqLSQoQ09ORklHX0RXTUFDX0xQQzE4WFgpICAgKz0gZHdtYWMtbHBjMTh4
eC5vCj4gIG9iai0kKENPTkZJR19EV01BQ19NRURJQVRFSykgICArPSBkd21hYy1tZWRpYXRlay5v
Cj4gIG9iai0kKENPTkZJR19EV01BQ19NRVNPTikgICAgICArPSBkd21hYy1tZXNvbi5vIGR3bWFj
LW1lc29uOGIubwo+ICBvYmotJChDT05GSUdfRFdNQUNfUUNPTV9FVEhRT1MpICAgICAgICArPSBk
d21hYy1xY29tLWV0aHFvcy5vCj4gK29iai0kKENPTkZJR19EV01BQ19SRU5FU0FTX0dCRVRIKSAr
PSBkd21hYy1yZW5lc2FzLWdiZXRoLm8KPiAgb2JqLSQoQ09ORklHX0RXTUFDX1JPQ0tDSElQKSAg
ICs9IGR3bWFjLXJrLm8KPiAgb2JqLSQoQ09ORklHX0RXTUFDX1JaTjEpICAgICAgICs9IGR3bWFj
LXJ6bjEubwo+ICBvYmotJChDT05GSUdfRFdNQUNfUzMyKSAgICAgICAgICAgICAgICArPSBkd21h
Yy1zMzIubwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1yZW5lc2FzLWdiZXRoLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZjM0YmVjNzc5NGUyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJlbmVzYXMtZ2JldGguYwo+IEBA
IC0wLDAgKzEsMTQ2IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+
ICsvKgo+ICsgKiBkd21hYy1yZW5lc2FzLWdiZXRoLmMgLSBEV01BQyBTcGVjaWZpYyBHbHVlIGxh
eWVyIGZvciBSZW5lc2FzIEdCRVRICj4gKyAqCj4gKyAqIFRoZSBSeCBhbmQgVHggY2xvY2tzIGFy
ZSBzdXBwbGllZCBhcyBmb2xsb3dzIGZvciB0aGUgR0JFVEggSVAuCj4gKyAqCj4gKyAqICAgICAg
ICAgICAgICAgICAgICAgICAgIFJ4IC8gVHgKPiArICogICAtLS0tLS0tKy0tLS0tLS0tLS0tLS0g
b24gLyBvZmYgLS0tLS0tLQo+ICsgKiAgICAgICAgICB8Cj4gKyAqICAgICAgICAgIHwgICAgICAg
ICAgICBSeC0xODAgLyBUeC0xODAKPiArICogICAgICAgICAgKy0tLS0gbm90IC0tLS0gb24gLyBv
ZmYgLS0tLS0tLQo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgUmVuZXNhcyBFbGVjdHJv
bmljcyBDb3Jwb3JhdGlvbgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3Jl
c2V0Lmg+Cj4gKwo+ICsjaW5jbHVkZSAic3RtbWFjX3BsYXRmb3JtLmgiCj4gKwo+ICtzdHJ1Y3Qg
cmVuZXNhc19nYmV0aCB7Cj4gKyAgICAgICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBs
YXRfZGF0Owo+ICsgICAgICAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGM7Cj4gKyAgICAgICBz
dHJ1Y3QgZGV2aWNlICpkZXY7Cj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3QgY2hhciAqY29uc3Qg
cmVuZXNhc19nYmV0aF9jbGtzW10gPSB7Cj4gKyAgICAgICAidHgiLCAidHgtMTgwIiwgInJ4Iiwg
InJ4LTE4MCIsCj4gK307Cj4gKwo+ICtzdGF0aWMgaW50IHJlbmVzYXNfZ2JldGhfaW5pdChzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCB2b2lkICpwcml2KQo+ICt7Cj4gKyAgICAgICBzdHJ1
Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0Owo+ICsgICAgICAgc3RydWN0IHJlbmVz
YXNfZ2JldGggKmdiZXRoID0gcHJpdjsKPiArICAgICAgIGludCByZXQ7Cj4gKwo+ICsgICAgICAg
cGxhdF9kYXQgPSBnYmV0aC0+cGxhdF9kYXQ7Cj4gKwo+ICsgICAgICAgcmV0ID0gcmVzZXRfY29u
dHJvbF9kZWFzc2VydChnYmV0aC0+cnN0Yyk7Cj4gKyAgICAgICBpZiAocmV0KSB7Cj4gKyAgICAg
ICAgICAgICAgIGRldl9lcnIoZ2JldGgtPmRldiwgIlJlc2V0IGRlYXNzZXJ0IGZhaWxlZFxuIik7
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
cmV0ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUocGxhdF9kYXQtPm51bV9jbGtzLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGxhdF9kYXQtPmNsa3MpOwo+ICsgICAg
ICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgcmVzZXRfY29udHJvbF9hc3NlcnQoZ2JldGgt
PnJzdGMpOwo+ICsKPiArICAgICAgIHJldHVybiAwOwpKdXN0IG5vdGljZWQgdGhpcyBoYXMgdG8g
YmUgcmV0LCBJJ2xsIHNlbmQgYSBuZXcgdmVyc2lvbiBmaXhpbmcgdGhpcy4KCkNoZWVycywKUHJh
Ymhha2FyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
