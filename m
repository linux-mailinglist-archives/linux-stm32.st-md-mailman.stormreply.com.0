Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AD7B40955
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 17:44:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3210FC3FACD;
	Tue,  2 Sep 2025 15:44:00 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C6A8C3FACC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 15:43:58 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b04163fe08dso436204666b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Sep 2025 08:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756827838; x=1757432638;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPqqn0GnguGU5cSP0RswoQ1BZy2RQuhjSXsG1srLe9w=;
 b=iD3sk7z/M+wpoEs259UCe8Lt0iu05g6FrmagHPsUGoJuBun2cuYN0kZyxp9s8FfVBl
 h2Yi9LzIxwZ72ZymgGSiEKRaHNoOQb/VSzS6AiomSQnQSE+XLC633wGE+9XUQvP3pd23
 yUN609/y7OzmKgW6FbZ8aSEeEa+CYcjGepayqrFogzvyXtxPJi89NBdwVlFp3I8ZraMa
 iKeof9CFCyudkb8kdNBUpFJ3I1VQP5KU+x+XKGH8dbqttKelB1CD+BLkCgIJ84KVrFnh
 FEEoxgKU7id6JIUCWBWi5Z+LvEU7ouH2NK32isg4g6C4VnAHyDzRKsGST4aO0iud/0Mw
 XQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756827838; x=1757432638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPqqn0GnguGU5cSP0RswoQ1BZy2RQuhjSXsG1srLe9w=;
 b=mfZGWLX+CJKm8BKuq6HKKYBOdM5lq2zAJiwsqcjYkI/Kyk4s/t28aIcsa9gueQ93yG
 VOEaFZeJonmTs8NEVUiimmPv955hWAOIOgXnU3l1QRtuJeXHLG6KLQ1pVJ7NsrTv3r/j
 EsSFwIit1/4f0jRfKhfk9n+lNuBMJLXLKQzdpN7460R/iXCxl1JCUehf2Ksor0b3zZEP
 A7z0YHYQDzyVZPJ3373oUivS0lirPrDV2SKzkIfogLkR0IJDYJD3440j67Q8zrwOPsKH
 9yYgBF+QbDXCvUNxutYfmys1SbZ4ZYQOCciCMsYYqRnLjrugeYAklHybMajooeGyMWie
 KhCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0gW1IhGmLWAYd/gqnAgXZch9oFjDlyAWDavRNRN4YfT02pJHutVuKu+UAh47CimIuE+urD2NXKOsxgQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzuUQwANoFc3RZpmnSPBi8ZhqskndcaoR9bmnP10Ag1OWgaQH0C
 fLYp5W5PPUMOHBUjyqlyMJv/4suu6+yBw0BnHif5g3MXQ4GxfGxG89zceS+O+i4bngfLzwEjcvE
 gPT3oKnLY9NBXBMsCpixhY+C9ir2nR54=
X-Gm-Gg: ASbGncvzSrKYKTilwbk/fLDExkT4mrddEX+3qYctWV+6LK/AYKi6xruVCxV9qao7aj9
 Wt95ysT9/1MvFPC4oxvlsBeCZWzSFR3X3g20rSruVLkuV7ccrK7MtzEldtsHu+6cdUMWwsDli58
 AhlonwuSMuGm+9cCABCir/p/QL+4ACJ0wK0LZbjUU0LdQuwHtB1KsOYF/mzBtPdWlCIXvKAPCCj
 VC65pak7ZRMuybg7XdeKvwjTwgsP2o8N1aaVOyPfnHbiVWJtec=
X-Google-Smtp-Source: AGHT+IGjVz9zqn8BbtmRC26R4QSkX6A4Q84g3hbk2BHW4+6JnnTvFG+jS17Ww+dxP48t8AY/g3mKnA0lZtUe2mcohUY=
X-Received: by 2002:a17:906:4786:b0:afe:e7f1:28a2 with SMTP id
 a640c23a62f3a-b01d8c7835emr1258659066b.23.1756827837577; Tue, 02 Sep 2025
 08:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902-spirited-congenial-stingray-f8aff7@kuoka>
In-Reply-To: <20250902-spirited-congenial-stingray-f8aff7@kuoka>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:43:31 +0100
X-Gm-Features: Ac12FXzIsq1sQ-x5uMFEMxBzln58PfPIlzCTK000OG7RlVhFny-x7C12oPVK8qY
Message-ID: <CA+V-a8uy++vzYh5956X2Dpv2Low5uAK+FRTONaP4Nc3FMty6Bw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: dwmac:
 Increase 'maxItems' for 'interrupts' and 'interrupt-names'
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

SGkgS3J6eXN6dG9mLAoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgoKT24gVHVlLCBTZXAgMiwg
MjAyNSBhdCA5OjQ54oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDAyLCAyMDI1IGF0IDAxOjEyOjU5QU0gKzAxMDAsIFByYWJo
YWthciB3cm90ZToKPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBJbmNyZWFzZSB0aGUgYG1heEl0ZW1zYCB2YWx1
ZSBmb3IgdGhlIGBpbnRlcnJ1cHRzYCBhbmQgYGludGVycnVwdC1uYW1lc2AKPiA+IHByb3BlcnRp
ZXMgdG8gMTkgdG8gc3VwcG9ydCBhZGRpdGlvbmFsIHBlci1jaGFubmVsIFR4L1J4IGNvbXBsZXRp
b24KPiA+IGludGVycnVwdHMgb24gdGhlIFJlbmVzYXMgUlovVDJIIFNvQywgd2hpY2ggZmVhdHVy
ZXMgdGhlCj4gPiBgc25wcyxkd21hYy01LjIwYCBJUCB3aXRoIDggUnggcXVldWVzIGFuZCA4IFR4
IHF1ZXVlcy4KPgo+IFRoaXMgYWxvbmUgbWFrZXMgbm8gc2Vuc2UuIFdoeSB3b3VsZCB3ZSBuZWVk
IG1vcmUgaW50ZXJydXB0cyBoZXJlIGlmCj4gdGhlcmUgaXMgbm8gdXNlciBvZiBpdCBhdCBhbGw/
IFNxdWFzaCBwYXRjaGVzLgo+Ck9rLCBJIHdpbGwgc3F1YXNoIHRoZSBjaGFuZ2VzLgoKPiBZb3Ug
YWxzbyBuZWVkIHRvIGNvbnN0cmFpbiBvdGhlciBkZXZpY2VzLCBiZWNhdXNlIG5vdyBvbmUgUmVu
ZXNhcwo+IGJpbmRpbmcgZ2V0cyAxOSBpbnRlcnJ1cHRzIHdpdGhvdXQgYW55IGV4cGxhbmF0aW9u
LiBQbGVhc2UgcmV0aGluayBob3cKPiB5b3Ugc3BsaXQgeW91ciBwYXRjaGVzLi4uCj4KSSBzZWUg
eW91IGhhdmUgYWxyZWFkeSB0YWtlbiBjYXJlIG9mIHRoaXMsIHRoYW5rIHlvdS4KCkNoZWVycywK
UHJhYmhha2FyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
