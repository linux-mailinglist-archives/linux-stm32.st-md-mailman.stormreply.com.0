Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1374FF1F
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 08:18:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FAB4C6B459;
	Wed, 12 Jul 2023 06:18:43 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F799C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 06:18:42 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-c50c797c31bso7372071276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 23:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689142721; x=1691734721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3UcQnC6XJzlnBm/ohIqlFQ7AujbAuynZNi/RKUXh2qI=;
 b=VtqX1eUcALhqoeJ19D0Agh84NQLT8VLTnTTh6WuOE4FSY5WZOT2y9ENKXIY0cL0fi7
 Hw94ksyrq+f1ItUFA5cbM1IV+ztHYhPF078lCznoJwCEnJcmeTJ3VGyPT00OD49rHCXh
 dFmZOI9XNJZkRaZJiEqyEQZVnI8LJ53267v+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689142721; x=1691734721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3UcQnC6XJzlnBm/ohIqlFQ7AujbAuynZNi/RKUXh2qI=;
 b=EsmGx/OnRFuY/42Yedc/+fgOvKnBw5g0BVLsaBNK4L534yBZsqqgx3X5ZbgyyyxgRU
 zee0zqeXjZ6pRSGoxMujwK+RAPV48od/gR9cvFuBXeqcMQ26/a4h/ve2k88viFqfDj3T
 +Fp24V3nJlM3RdDzBO8UqnOK138ch28FFOTC/VMoNVeFKixgL42L08GzjhoyVUtkWMyA
 AHz6qXFFvWlxIuO5+U8W967hRWsZJGoL88nYmauJbhW2Hbb/iAzKn1qMp6Rj8K22pHpS
 EJ2SlVVy7ZLahm1Lua4VHBy6AJ4aC28a5/SDc78I5p8BKf6QZJ8GzSBLfFZmJtj5ZYP3
 qdMg==
X-Gm-Message-State: ABy/qLaYj2MVyo2Ajm8nJ/EOrFEEDpCKEVF8pcI/dBFEmXR1EGOL0YJd
 l4JPo7/6ILgiGHA1nb7QySHimkanqalk5E/maZOYNld1hBjpblylvvZjgQ==
X-Google-Smtp-Source: APBJJlHY1IbnRRAm/Qj9tQjHFFbO9MWz4j4dqbzCFNB9i/b3OpaXq7yxG9EAIw7QaGIDo+b5F3MDRDZIDj5tNn4YyUw=
X-Received: by 2002:a0d:dcc4:0:b0:55a:8c02:c00b with SMTP id
 f187-20020a0ddcc4000000b0055a8c02c00bmr18097989ywe.25.1689142720925; Tue, 11
 Jul 2023 23:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230629083726.84910-1-dario.binacchi@amarulasolutions.com>
 <20230629083726.84910-4-dario.binacchi@amarulasolutions.com>
 <abff4a25-a178-7eb7-1576-a94b0a57a896@foss.st.com>
In-Reply-To: <abff4a25-a178-7eb7-1576-a94b0a57a896@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 12 Jul 2023 08:18:29 +0200
Message-ID: <CABGWkvo5nYDJvkOAs=kSFs7-7FUmWKQ0eCunrkEdF6Fk2btEgA@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 3/3] ARM: dts: stm32: support display
 on stm32f746-disco board
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

SGkgQWxleGFuZHJlLAoKT24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMjoxM+KAr1BNIEFsZXhhbmRy
ZSBUT1JHVUUKPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gSGkgRGFy
aW8KPgo+IE9uIDYvMjkvMjMgMTA6MzcsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4gQWRkIHN1
cHBvcnQgdG8gUm9ja3RlY2ggUkswNDNGTjQ4SCBkaXNwbGF5IG9uIHN0bTMyZjc0Ni1kaXNjbyBi
b2FyZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNj
aGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPgo+ID4gLS0tCj4gPgo+ID4gQ2hhbmdlcyBpbiB2
NToKPiA+IEkgYW0gY29uZmlkZW50IHRoYXQgZnJhbWVidWZmZXIgc2l6aW5nIGlzIGEgcmVhbCBy
ZXF1aXJlbWVudCBmb3IgU1RNMzIgYm9hcmRzLAo+ID4gYnV0IEkgbmVlZCBzb21lIHRpbWUgdG8g
dW5kZXJzdGFuZCBpZiBhbmQgaG93IHRvIGludHJvZHVjZSB0aGlzIGZ1bmN0aW9uYWxpdHkuCj4g
PiBUaGVyZWZvcmUsIEkgZHJvcCB0aGUgZm9sbG93aW5nIHBhdGNoZXMgdG8gYWxsb3cgdGhlIHNl
cmllcyB0byBiZSBmdWxseSBtZXJnZWQ6Cj4gPiAgIC0gWzQvNl0gZHQtYmluZGluZ3M6IGRpc3Bs
YXk6IHN0bTMyLWx0ZGM6IGFkZCBvcHRpb25hbCBzdCxmYi1icHAgcHJvcGVydHkKPiA+ICAgLSBb
NS82XSBBUk06IGR0czogc3RtMzI6IHNldCBmcmFtZWJ1ZmZlciBiaXQgZGVwdGggb24gc3RtMzJm
NzQ2LWRpc2NvCj4gPiAgIC0gWzYvNl0gZHJtL3N0bTogc2V0IGZyYW1lYnVmZmVyIGJpdCBkZXB0
aCB0aHJvdWdoIERUUyBwcm9wZXJ0eQo+ID4KPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAtIFVzZSBE
VFMgcHJvcGVydHkgaW5zdGVhZCBvZiBtb2R1bGUgcGFyYW1ldGVyIHRvIHNldCB0aGUgZnJhbWVi
dWZmZXIgYml0IGRlcHRoLgo+ID4KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAtIGRyb3AgWzQvNl0g
ZHQtYmluZGluZ3M6IGRpc3BsYXk6IHNpbXBsZTogYWRkIFJvY2t0ZWNoIFJLMDQzRk40OEgKPiA+
ICAgIEFwcGxpZWQgdG8gaHR0cHM6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9naXQvZHJtL2Ry
bS1taXNjLmdpdCAoZHJtLW1pc2MtbmV4dCk6Cj4gPiAgICBodHRwczovL2NnaXQuZnJlZWRlc2t0
b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPWM0MmEzN2EyN2M3NzdkNjM5NjFkZDYzNGEz
MGY3Yzg4Nzk0OTQ5MWEKPiA+IC0gZHJvcCBbNS82XSBkcm0vcGFuZWw6IHNpbXBsZTogYWRkIHN1
cHBvcnQgZm9yIFJvY2t0ZWNoIFJLMDQzRk40OEggcGFuZWwKPiA+ICAgIEFwcGxpZWQgdG8gaHR0
cHM6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9naXQvZHJtL2RybS1taXNjLmdpdCAoZHJtLW1p
c2MtbmV4dCkKPiA+ICAgIGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNj
L2NvbW1pdC8/aWQ9MTNjZGQxMmE5ZjkzNDE1OGY0ZWM4MTdjZjA0OGZjYjQzODRhYTlkYwo+ID4K
PiA+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNzQ2LWRpc2NvLmR0cyB8IDUxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygr
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3NDYtZGlzY28u
ZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNzQ2LWRpc2NvLmR0cwo+ID4gaW5kZXggYzEx
NjE2ZWQ1ZmM2Li5jZGE0MjNiNmE4NzQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0
cy9zdG0zMmY3NDYtZGlzY28uZHRzCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3
NDYtZGlzY28uZHRzCj4gPiBAQCAtNjAsMTAgKzYwLDQxIEBAIG1lbW9yeUBjMDAwMDAwMCB7Cj4g
PiAgICAgICAgICAgICAgIHJlZyA9IDwweEMwMDAwMDAwIDB4ODAwMDAwPjsKPiA+ICAgICAgIH07
Cj4gPgo+ID4gKyAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsKPiA+ICsgICAgICAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4g
KyAgICAgICAgICAgICByYW5nZXM7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGxpbnV4LGNtYSB7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wi
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG5vLW1hcDsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBzaXplID0gPDB4ODAwMDA+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGxpbnV4LGRt
YS1kZWZhdWx0Owo+ID4gKyAgICAgICAgICAgICB9Owo+ID4gKyAgICAgfTsKPiA+ICsKPiA+ICAg
ICAgIGFsaWFzZXMgewo+ID4gICAgICAgICAgICAgICBzZXJpYWwwID0gJnVzYXJ0MTsKPiA+ICAg
ICAgIH07Cj4gPgo+ID4gKyAgICAgYmFja2xpZ2h0OiBiYWNrbGlnaHQgewo+ID4gKyAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImdwaW8tYmFja2xpZ2h0IjsKPiA+ICsgICAgICAgICAgICAgZ3Bp
b3MgPSA8JmdwaW9rIDMgR1BJT19BQ1RJVkVfSElHSD47Cj4gPiArICAgICAgICAgICAgIHN0YXR1
cyA9ICJva2F5IjsKPiA+ICsgICAgIH07Cj4gPiArCj4gPiArICAgICBwYW5lbF9yZ2I6IHBhbmVs
LXJnYiB7Cj4gPiArICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicm9ja3RlY2gscmswNDNmbjQ4
aCI7Cj4gPiArICAgICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKPiA+ICsgICAg
ICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZncGlvaSAxMiBHUElPX0FDVElWRV9ISUdIPjsKPiA+
ICsgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gKyAgICAgICAgICAgICBwb3J0IHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBwYW5lbF9pbl9yZ2I6IGVuZHBvaW50IHsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbHRkY19vdXRf
cmdiPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Owo+ID4gKyAgICAgICAgICAgICB9Owo+
ID4gKyAgICAgfTsKPiA+ICsKPiA+ICAgICAgIHVzYm90Z19oc19waHk6IHVzYi1waHkgewo+ID4g
ICAgICAgICAgICAgICAjcGh5LWNlbGxzID0gPDA+Owo+ID4gICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gInVzYi1ub3AteGNlaXYiOwo+ID4gQEAgLTk5LDYgKzEzMCwyNiBAQCAmaTJjMSB7Cj4g
PiAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiAgIH07Cj4gPgo+ID4gKyZkbWExIHsKPiA+ICsg
ICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICt9Owo+ID4gKwo+ID4gKyZkbWEyIHsKPiA+ICsgICAg
IHN0YXR1cyA9ICJva2F5IjsKPiA+Cj4gV2h5IGRvIHlvdSBlbmFibGUgRE1BcyA/IEl0IHNlZW1z
IG5vdCB1c2VkIGJ5IExUREMuCgpZb3UncmUgcmlnaHQsIEknbGwgc2VuZCB2ZXJzaW9uIDYgc2hv
cnRseSB3aXRoIHRoZSByZW1vdmFsIG9mIERNQS4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8K
Cj4KPiA+ICsmbHRkYyB7Cj4gPiArICAgICBwaW5jdHJsLTAgPSA8Jmx0ZGNfcGluc19hPjsKPiA+
ICsgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiArICAgICBzdGF0dXMgPSAib2th
eSI7Cj4gPiArCj4gPiArICAgICBwb3J0IHsKPiA+ICsgICAgICAgICAgICAgbHRkY19vdXRfcmdi
OiBlbmRwb2ludCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0g
PCZwYW5lbF9pbl9yZ2I+Owo+ID4gKyAgICAgICAgICAgICB9Owo+ID4gKyAgICAgfTsKPiA+ICt9
Owo+ID4gKwo+ID4gICAmc2RpbzEgewo+ID4gICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gICAg
ICAgdm1tYy1zdXBwbHkgPSA8Jm1tY192Y2FyZD47Cj4KCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpT
ZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEg
U29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8s
IElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5h
bWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
