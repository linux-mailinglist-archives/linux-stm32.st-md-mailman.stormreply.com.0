Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE9CA9DEF5
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 06:39:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BC7CC7802E;
	Sun, 27 Apr 2025 04:39:12 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E2E2C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 04:39:11 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30bfc79ad97so51377311fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Apr 2025 21:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745728750; x=1746333550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QNo7qe9Lz9mlSgoeITrfWOs7/oXxKQcv8brSPsNOFbQ=;
 b=gQ5yLxkzZc+/zekl+hlvMNq5U1cVGt15h5Eck8ty4gnGNWzxa0VJYy+rzIW6jN7NQB
 pPI3orH4ezpULp2K76u7mKVhFhsOubEsfW8QSwbk6aSWWzcUtHCiXvVmIC0Il50Ai2jn
 eKWQo5bjH0WQAlSYV2rCDKAAO5GABlCW8YTvcGs2wPQqOynBJg5kqsRqAdhHYCUuzboR
 tTEpIre0nCNa34tt+wxQkBFHFfa4CV/G/GJeBRrQYJZdDaHTrd7STTFhpl4H+gpPiJwN
 SqwtfdRUM9xkDUp5BO/9132mO8esQS09FcgszasBF3/8KUXu1wZqqYQHA9VuDXk0V3fS
 jmvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq1d3B5gzANtMSUUc1T/7i1rBNMmFZ3T/EkYP221oQBKZyDcTihNwglp/qzs17mgLtXiEC8wLDrUv35g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxuEuGFO0Yma1X/onSAq5aodlNcdt+5pN0u2pPR3BojeVjx4LN3
 5t2h/bf1bmq/i7auyf0Xmw2gTRaZrDpPd+DHmueLHWpYtGAmx/OZxu0nHmN0
X-Gm-Gg: ASbGncsEvmDfUp1KKTzFsIpPiFd0BF24raCGcipjVyW21xD73agZEt1bdMXMUDs8H3/
 uSs+AhD6V9DkMC7NWWyVadD11XxJzM2jaT3iwTn1mOEzRTIxYmyxOpsVdVfRVAxq2FMBzHcdwA+
 QEgvob8303Y2fPXzE7Xwpx/obgF5m4iUmwCXJT+L00qpyT+qiFnLBSuGCHQ7q7EyRpkHqAszxEX
 7Mk6/1Mg6dDTm+rjreU2Pld1G8hIKM6QK5M763ou0etnqoyRT3XyPsvwNMtHNexX0cavbGXXho3
 JvAINiMP22Vh51u+VK0s6C/qPQ7oA+9y0kJZYpcbmpkLQ5feOQUcwSXm6i8EalNDr0B0tcb8yw=
 =
X-Google-Smtp-Source: AGHT+IHdi+i52iPFg3RtVtL7jdECMLQu6/UbverXeFK8KBZCLCzXMuj6nv6Ohpo89PKgT47olK4HWg==
X-Received: by 2002:a2e:a543:0:b0:30c:799:8418 with SMTP id
 38308e7fff4ca-318ff81dac8mr22035841fa.4.1745728749572; 
 Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317cf659d5asm16117941fa.2.2025.04.26.21.39.09
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30effbfaf61so41198881fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ3Ca73UURZWxzm4W6QhobFDI7Eo7c+vJTeYGNwjgot+7rURlUb8AVGtmmdErzbG7rbOqgIjMigAVapA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:651c:12c8:b0:30b:fc16:d482 with SMTP id
 38308e7fff4ca-317cc3b4babmr34833351fa.3.1745728749245; Sat, 26 Apr 2025
 21:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:38:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
X-Gm-Features: ATxdqUFqwWzMoc8bpc0UG6R3aiwwevesO0_bqj7uRg6TeOMZWI1Q6QZaB7zJ9oE
Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH 5/5] clk: sunxi: Do not enable by default
	during compile testing
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCBBcHIgNCwgMjAyNSBhdCA3OjU34oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEVuYWJsaW5nIHRoZSBjb21w
aWxlIHRlc3Qgc2hvdWxkIG5vdCBjYXVzZSBhdXRvbWF0aWMgZW5hYmxpbmcgb2YgYWxsCj4gZHJp
dmVycy4gIFJlc3RyaWN0IHRoZSBkZWZhdWx0IHRvIEFSQ0ggYWxzbyBmb3IgaW5kaXZpZHVhbCBk
cml2ZXJzLCBldmVuCj4gdGhvdWdoIHRoZWlyIGNob2ljZSBpcyBub3QgdmlzaWJsZSB3aXRob3V0
IHNlbGVjdGluZyBwYXJlbnQgS2NvbmZpZwo+IHN5bWJvbCwgYmVjYXVzZSBvdGhlcndpc2Ugc2Vs
ZWN0aW5nIHBhcmVudCB3b3VsZCBzZWxlY3QgdGhlIGNoaWxkIGR1cmluZwo+IGNvbXBpbGUgdGVz
dGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9jbGsvc3VueGkvS2NvbmZpZyB8
IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zdW54aS9LY29uZmlnIGIvZHJp
dmVycy9jbGsvc3VueGkvS2NvbmZpZwo+IGluZGV4IDFjNGU1NDMzNjZkZGI3NmMxNjY5YjU3N2Mx
YWMzMzdkYzFiZTYxNmYuLjVlMmY5MmJmZTQxMjA5ODFhYjY4YjE3NWRjZTc5OGFjOGIzMjY4YjAg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvc3VueGkvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMv
Y2xrL3N1bnhpL0tjb25maWcKPiBAQCAtMiwxMyArMiwxMyBAQAo+ICBtZW51Y29uZmlnIENMS19T
VU5YSQo+ICAgICAgICAgYm9vbCAiTGVnYWN5IGNsb2NrIHN1cHBvcnQgZm9yIEFsbHdpbm5lciBT
b0NzIgo+ICAgICAgICAgZGVwZW5kcyBvbiAoQVJNICYmIEFSQ0hfU1VOWEkpIHx8IENPTVBJTEVf
VEVTVAo+IC0gICAgICAgZGVmYXVsdCB5Cj4gKyAgICAgICBkZWZhdWx0IChBUk0gJiYgQVJDSF9T
VU5YSSkKCkp1c3Qgd29uZGVyaW5nLCBzaG91bGRuJ3QgdGhpcyBjaGFuZ2UgYWxvbmUgYmUgZW5v
dWdoPyBUaGUgcmVtYWluaW5nCktjb25maWcgb3B0aW9ucyBhcmUgZ2F0ZWQgYnkgdGhpcyBvbmUu
CgpDaGVuWVUKCj4gIGlmIENMS19TVU5YSQo+Cj4gIGNvbmZpZyBDTEtfU1VOWElfQ0xPQ0tTCj4g
ICAgICAgICBib29sICJMZWdhY3kgY2xvY2sgZHJpdmVycyIKPiAtICAgICAgIGRlZmF1bHQgeQo+
ICsgICAgICAgZGVmYXVsdCBBUkNIX1NVTlhJCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIExl
Z2FjeSBjbG9jayBkcml2ZXJzIGJlaW5nIHVzZWQgb24gb2xkZXIgKEExMCwgQTEzLCBBMjAsCj4g
ICAgICAgICAgIEEyMywgQTMxLCBBODApIFNvQ3MuIFRoZXNlIGRyaXZlcnMgYXJlIGtlcHQgYXJv
dW5kIGZvcgo+IEBAIC0xOSwxNCArMTksMTQgQEAgY29uZmlnIENMS19TVU5YSV9DTE9DS1MKPgo+
ICBjb25maWcgQ0xLX1NVTlhJX1BSQ01fU1VONkkKPiAgICAgICAgIGJvb2wgIkxlZ2FjeSBBMzEg
UFJDTSBkcml2ZXIiCj4gLSAgICAgICBkZWZhdWx0IHkKPiArICAgICAgIGRlZmF1bHQgQVJDSF9T
VU5YSQo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBMZWdhY3kgY2xvY2sgZHJpdmVyIGZvciB0
aGUgQTMxIFBSQ00gY2xvY2tzLiBUaG9zZSBhcmUKPiAgICAgICAgICAgdXN1YWxseSBuZWVkZWQg
Zm9yIHRoZSBQTUlDIGNvbW11bmljYXRpb24sIG1vc3RseS4KPgo+ICBjb25maWcgQ0xLX1NVTlhJ
X1BSQ01fU1VOOEkKPiAgICAgICAgIGJvb2wgIkxlZ2FjeSBzdW44aSBQUkNNIGRyaXZlciIKPiAt
ICAgICAgIGRlZmF1bHQgeQo+ICsgICAgICAgZGVmYXVsdCBBUkNIX1NVTlhJCj4gICAgICAgICBo
ZWxwCj4gICAgICAgICAgIExlZ2FjeSBjbG9jayBkcml2ZXIgZm9yIHRoZSBzdW44aSBmYW1pbHkg
UFJDTSBjbG9ja3MuCj4gICAgICAgICAgIFRob3NlIGFyZSB1c3VhbGx5IG5lZWRlZCBmb3IgdGhl
IFBNSUMgY29tbXVuaWNhdGlvbiwKPiBAQCAtMzQsNyArMzQsNyBAQCBjb25maWcgQ0xLX1NVTlhJ
X1BSQ01fU1VOOEkKPgo+ICBjb25maWcgQ0xLX1NVTlhJX1BSQ01fU1VOOUkKPiAgICAgICAgIGJv
b2wgIkxlZ2FjeSBBODAgUFJDTSBkcml2ZXIiCj4gLSAgICAgICBkZWZhdWx0IHkKPiArICAgICAg
IGRlZmF1bHQgQVJDSF9TVU5YSQo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBMZWdhY3kgY2xv
Y2sgZHJpdmVyIGZvciB0aGUgQTgwIFBSQ00gY2xvY2tzLiBUaG9zZSBhcmUKPiAgICAgICAgICAg
dXN1YWxseSBuZWVkZWQgZm9yIHRoZSBQTUlDIGNvbW11bmljYXRpb24sIG1vc3RseS4KPgo+IC0t
Cj4gMi40NS4yCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
