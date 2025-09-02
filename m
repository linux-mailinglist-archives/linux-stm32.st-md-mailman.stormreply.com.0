Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDEB40905
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 17:36:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50E21C3FACD;
	Tue,  2 Sep 2025 15:36:10 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD95EC3FACC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 15:36:08 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b042eb09948so330107166b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Sep 2025 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756827368; x=1757432168;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Y4Hmeaj9zYXIvPRM6itRd7hBEHF7uK4IZavdf0P3hE=;
 b=fw4asSrgH/JRZQRzyNWuuJBNbibpWZJlYgDfNzzI2QOb5jUQtlEQ5+R1JRJAbw31HZ
 fBzO/D4m2LkzHwqpJbDWLnZ4yNSrQUaISQLPgF1oLlm5VTcK86gH+U2LpHvRZrHGalrr
 u5qsRMrRl626WoShXZNIL73frkqOdsv1sohkK2E34n1/R5HTOE4vSDD6Os5KUB0QkUQg
 dlrnlKSn8YX7hoZp+6J9EtLjQnh9ctN5S7z98wASFpsnLw4DF0cPgLBtxJDePI9ImkK2
 ZGssDK6jb1ZsrIXebX9ZzUIiQO+nfQpwznO8TZckhliLOFBr+UXIXmPLUTn3ODS2nm8I
 NHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756827368; x=1757432168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Y4Hmeaj9zYXIvPRM6itRd7hBEHF7uK4IZavdf0P3hE=;
 b=QS5/2GqQGkjOZSfS1HoPlTZvgDL7HVRnT7yKrxCT7z850FHcInSb5LL/Uw1yPt0cc/
 M7KHsm8jg9vTufN5QFsZWZxm6aOGrX8zB4TiDWnJsNss2XXEooe9Wr876OM31BerlpRP
 UthD5nlSMaXMopv/xWEa+/0jIR2nrDCzKBng8qnblZAPXWPdQRVa5JCkuTpiJZ3JqG6M
 f4BnmzvcviIj4ApFFVWs6cvU2oZgLuYgF9jrcGo4QQfGSAj3/KIV4+wJsFgPDAhizMjE
 W2D1OxTrDNU/AuRSRq97xXL/sy3466gMWCCMe38eUrI+YFHzyDSPnh3SoqOygpPRUqN1
 9eMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW53BlcIbhtFmMWrQ0iJfvaXbGfCJ9/r5od8jVtM/jkNMduVlkD5QwHf8ObtjefYrtP3PXsbIPR+cwMHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzR4yHNttIKMhWqSQzANWtMVMQjNBC3zclG1768jYbyS8p7/GvN
 BB7RYHYWx/2BBLEC5geH1N5N1gtqi/0Ch5g4R8jiP1zIFsjTugrjexeY5oy6R2IRkz86qmOqZyU
 CpSCYM5M6fePzEyU4C5dtP4nwMzwRWwQ=
X-Gm-Gg: ASbGncsVD96XWwSQEgwP8/4xv8Tc1CRuFuFyhTRJh9JMf6JLhkgsifHFPXYfLhcPIRI
 Umbi1QnRW+gDZpzjlxzExzUHOufYhWl24/uj7Sec/dhKmXGUd6nOilaf/qNq8JEpPDC17OZUnqs
 MVSqxX0Jzji5XhaEHgw5J60zufNioWrLXs1SHgb2o8Da2dQVHgBdQ9KsSDDRhWA/7ULvv8daOtZ
 yRoXxidAXEKmqo8NVtJGnepvE5XcPfNhpXMN2mi
X-Google-Smtp-Source: AGHT+IGvRWgNdy0fihhRjw06pq2Hs9JGdwVs/5subwnKQbYsRHg2GMq+oZlBiYJwTVV3dKdKs8PeQUmCZrUBILuRg+I=
X-Received: by 2002:a17:907:6090:b0:b04:2cc2:e495 with SMTP id
 a640c23a62f3a-b042cc31af3mr770379366b.14.1756827367715; Tue, 02 Sep 2025
 08:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250902091526.105905-3-krzysztof.kozlowski@linaro.org>
 <20250902091526.105905-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250902091526.105905-4-krzysztof.kozlowski@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:35:40 +0100
X-Gm-Features: Ac12FXxX3Y3vXxhmR1yHN5IR8o_v2hNrvGyoSHzsymFzxbirriBpH1NCmvMkVvk
Message-ID: <CA+V-a8s2H4UzovMqYJ15nWu1X55dL+7qJWifHxMEkqjtTzigzg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] dt-bindings: net: renesas,
 rzn1-gmac: Constrain interrupts
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

SGkgS3J6eXN6dG9mLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUdWUsIFNlcCAyLCAy
MDI1IGF0IDEwOjE24oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFJlbmVzYXMgUlpOMSBHTUFDIHVzZXMgZXhhY3RseSBv
bmUgaW50ZXJydXB0IGluIGluLWtlcm5lbCBEVFMgYW5kIGNvbW1vbgpjb21taXQgbWVzc2FnZSBu
ZWVkcyB1cGRhdGluZyBhcyB3ZSBhcmUgZGVzY3JpYmluZyAzIGludGVycnVwdHMuCgo+IHNucHMs
ZHdtYWMueWFtbCBiaW5kaW5nIGlzIGZsZXhpYmxlLCBzbyBkZWZpbmUgcHJlY2lzZSBjb25zdHJh
aW4gZm9yCj4gdGhpcyBkZXZpY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sICAgICAgIHwgOSArKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdt
YWMueWFtbAo+IGluZGV4IGQ5YThkNTg2ZTI2MC4uMTZkZDdhMjYzMWFiIDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMu
eWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNh
cyxyem4xLWdtYWMueWFtbAo+IEBAIC0zMCw2ICszMCwxNSBAQCBwcm9wZXJ0aWVzOgo+ICAgICAg
ICAtIGNvbnN0OiByZW5lc2FzLHJ6bjEtZ21hYwo+ICAgICAgICAtIGNvbnN0OiBzbnBzLGR3bWFj
Cj4KPiArICBpbnRlcnJ1cHRzOgo+ICsgICAgbWF4SXRlbXM6IDMKPiArCj4gKyAgaW50ZXJydXB0
LW5hbWVzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29uc3Q6IG1hY2lycQo+ICsgICAgICAt
IGNvbnN0OiBldGhfd2FrZV9pcnEKPiArICAgICAgLSBjb25zdDogZXRoX2xwaQo+ICsKCkNoYW5n
ZXMgTEdUTSwKClJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1s
YWQucmpAYnAucmVuZXNhcy5jb20+CgpDaGVlcnMsClByYWJoYWthcgoKPiAgICBwY3MtaGFuZGxl
Ogo+ICAgICAgZGVzY3JpcHRpb246Cj4gICAgICAgIHBoYW5kbGUgcG9pbnRpbmcgdG8gYSBQQ1Mg
c3ViLW5vZGUgY29tcGF0aWJsZSB3aXRoCj4gLS0KPiAyLjQ4LjEKPgo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
