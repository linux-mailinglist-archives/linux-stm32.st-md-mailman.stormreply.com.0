Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A6D0F457
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jan 2026 16:20:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03063C349C4;
	Sun, 11 Jan 2026 15:20:18 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F0DBC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 15:20:16 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-6420c08f886so7931254d50.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768144815; x=1768749615;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s2F+wtW2B2tq7BsEJcg+uHjqj3junFFF4szv2VXtjwo=;
 b=kWY36WawnYfvf4DbTnh6kF0kntOuoNjVNoUcNeVd9LSussEwkHBkhzU5Q0onITAxDm
 qvmx34d5DVRwjplwZwhicUo7yQYi1HaHP8bt4IcfVbeKI5IFIDYkjlET5njKBtItZy8y
 mGtIHNZfDA+64Z4AmpTPUGK+6jWptOco26SNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768144815; x=1768749615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s2F+wtW2B2tq7BsEJcg+uHjqj3junFFF4szv2VXtjwo=;
 b=iXgbpdPLkUu9X5DC9J39817rNy1RmTDPNmvwgpx0EwAJ55Rd5zckK5RVkJl28l1D97
 rslMgv5Jj25Af5FtDLdPTZ7pnQAm247skw8s6P457rYxDC2661hXewDZ4+dX9psX2PdQ
 i+TV2BQ5e5FwDLcrdApYY2MxY6r7go+JVzwSGiXwvXF7PxdrP5BEYXnwvxnVwawBsSe+
 yj3TmPwJXyaF+7ARTFbUrnBTkGDsP/PAFA+f4HI1PgHvnqElh/Ya7HZmc6gZmQbaTq89
 +GWTFOpEH0CsbYANKxPMvGQraG97WpjIa0+y80oh+ZEYO/oSO5Tia5NjqzmMssF93Ac7
 h/Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrwiTMhB8W25wD1tRPxsrZUBiM178UdCZXmQQGR8qlO1k3TDQOd771zq+PMJBWFu2Z1/wY4aDaNc4D4w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdwurF6yiHAvVziTmB2wc0N8ebNWPK339Sb27FZ8S3AYuieWmC
 DEc9pSFOWstuSTYNsoOec3Nvm0+4JOk/TEWAJZs/l9edrD9MY2x/FkmIhJAuWYbhEfQjgjkBunI
 zPttqXBJO8KY0xRskYzuu1OLoTknnIhI5xGKwzOsFSQ==
X-Gm-Gg: AY/fxX49+66khoJ82M6UF5ViAZwjmFLkio4xBEgDnN3KOzG/2bfc6vg6VMO2tyM/9g0
 BgRTRg7vfDltLGWylASDh5T8rAcfyBAX72xyeo9nu1Zp2OVS7/1aYH8liMUYqgdltjbO+7vgii3
 cQ1hI/3/tRxIpezBiprOGEctavZoQy1ShcC1YJkC9UAH+AzBQZkKUigUTlttPr+/bZ+7NaANLi7
 3E3kbAIiLRUilwoFuDEwzcl3MggF0C2MWStan1YFw5cMU0qIqHwHdu02VwDJ+Lqs1SBszJvSBXA
 2dGnhJLBOfnpt2fuocFHEsvuOw==
X-Google-Smtp-Source: AGHT+IEJEJ7k3ehyLTPliKyhrb/A8vsiv4gmMtQ/Bm40VuLX6dMeiGkvDwyYywXWPJ3D1t/yNNUsPFQGqqJW0lMTk4M=
X-Received: by 2002:a05:690e:1501:b0:646:e354:7325 with SMTP id
 956f58d0204a3-64716b6ff9emr13204975d50.22.1768144815134; Sun, 11 Jan 2026
 07:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
 <20260107194541.1843999-2-dario.binacchi@amarulasolutions.com>
 <58006bf6-425a-4016-996b-4a01fdb22cea@foss.st.com>
In-Reply-To: <58006bf6-425a-4016-996b-4a01fdb22cea@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 11 Jan 2026 16:20:04 +0100
X-Gm-Features: AZwV_QjEh5isWh6rzhvUm7qUpn5m3290bgM2aqJv_0TrtCZXLOfst-o_irVmNjk
Message-ID: <CABGWkvrgH6tNsaq3P4xctQxV2w2pkAkko-qGy4Oay=yAwitufA@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] arm64: dts: st: add TAMP-NVRAM
 support for STM32MP25
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

SGVsbG8gUGF0cmljZSwKCk9uIEZyaSwgSmFuIDksIDIwMjYgYXQgMTE6NDDigK9BTSBQYXRyaWNl
IENIT1RBUkQKPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24g
MS83LzI2IDIwOjQ1LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+IEFkZCB0aGUgVEFNUCBub2Rl
IGFsb25nIHdpdGggaXRzIE5WUkFNIGNoaWxkIG5vZGUgYW5kIGRlZmluZSB0aGUKPiA+IGZpeGVk
LWxheW91dCBmb3IgZnd1X2luZm8gYW5kIGJvb3RfbW9kZSByZWdpc3RlcnMuCj4gPgo+ID4gVGhl
IFRBTVAgKFRhbXBlciBhbmQgYmFja3VwIHJlZ2lzdGVycykgYmxvY2sgaXMgYSBzeXN0ZW0gY29u
dHJvbGxlciB0aGF0Cj4gPiBwcm92aWRlcyBhY2Nlc3MgdG8gYmFja3VwIHJlZ2lzdGVycyBhcyBO
Vk1FTSBzdG9yYWdlIHRoYXQgcGVyc2lzdHMgYWNyb3NzCj4gPiByZWJvb3RzLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRp
b25zLmNvbT4KPiA+Cj4gPiAtLS0KPiA+Cj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0z
Mm1wMjUxLmR0c2kgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0z
Mm1wMjUxLmR0c2kKPiA+IGluZGV4IGE4ZTZlMGY3N2I4My4uYzc4MzllNzMyZjMxIDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCj4gPiBAQCAtMjA4NCw2ICsy
MDg0LDMyIEBAIHJ0YzogcnRjQDQ2MDAwMDAwIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBz
dGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gICAgICAgICAgICAgICB9Owo+ID4KPiA+ICsgICAgICAg
ICAgICAgdGFtcDogdGFtcEA0NjAxMDAwMCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJzdCxzdG0zMi10YW1wIiwgInN5c2NvbiIsICJzaW1wbGUtbWZkIjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHg0NjAxMDAwMCAweDQwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmFuZ2Vz
Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG52cmFtOiBudnJhbUA0NjAxMDEwMCB7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMy
bXAyNS10YW1wLW52cmFtIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDQ2MDEwMTAwIDB4MjAwPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG52
bWVtLWxheW91dCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiZml4ZWQtbGF5b3V0IjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4gKwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmd3VfaW5mbzogdGFtcC1ia3BAYzAgewo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGMw
IDB4ND47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb3RfbW9kZTogdGFt
cC1ia3BAMTgwIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHgxODAgMHg0PjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgfTsKPiA+ICsgICAgICAgICAgICAgfTsKPiA+ICsKPiA+ICAgICAg
ICAgICAgICAgcGluY3RybF96OiBwaW5jdHJsQDQ2MjAwMDAwIHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwxPjsKPiBIaSBEYXJpbwo+Cj4gQXQgU1RNaWNyb2VsZWN0cm9uaWNzIHdl
IGludGVuZCB0byB1cHN0cmVhbSB0YW1wLXZyYW0gZHJpdmVyIGZvciBTVE0zMk1QIHNlcmllcy4K
PiBJZiB5b3UgZG9uJ3Qgc2VlIGFueSBvYmplY3Rpb24sIHdlIHByZWZlciB0byBtYW5hZ2UgaXQg
aW4gb3VyIHNpZGUuCgpPaywgbm8gcHJvYmxlbXMuCgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlv
Cj4KPiBUaGFua3MKPiBQYXRyaWNlCgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJl
ZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29t
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMg
U1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICsz
OSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1
dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
