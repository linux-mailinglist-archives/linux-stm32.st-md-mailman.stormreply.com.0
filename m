Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE455A9DEF8
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 06:43:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73F94C7802E;
	Sun, 27 Apr 2025 04:43:17 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6675C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 04:43:15 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3d6d6d82633so12112915ab.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Apr 2025 21:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745728990; x=1746333790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gISrtxFe1XEI3Oi2O6vm+8m4GXkK+giUIqyVFsOJWKk=;
 b=R+C0WgXSeDi8eYmC6jHtHRVi0dMIjoSoZcvjWU4/RbjIhytAiL+vWp+MtJUgJxIveB
 e5WSEJBKDjXy4RH/cFYsuBMEedDSrbp9pPMpA48kwJD8gcU1/Oum0WKO3DqwYj2u+Lim
 v4mQg7ojXRcqpT5pZ6i+5qw0IdPNLVCm0BkGZX1m/lkru/YuXGrVDjOyZxYPkNIL+4cB
 EQ5p9B0sa0pX9MF7jOG6kVIMTMjnxxnh/D/ZHjvpGT18X3grTpZBQpKtCaU28/o8ypLZ
 x1Zz+1n/dhs4Iu1aYRKmdxpqQ7y3r/AMms5GflmqtpaaDw0qivHN9LhZtqWD0ZVpzh4C
 Dy5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi8OgEx9vsang9fq/tkaaFeuWGjHafWRFUooPFFzFeNjAkbsRURFDUz8/lPgMdztJ/DEutJwcsTdLbCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz86a2byoNRo7ApyxAlkPfNidcDKodc8PLV7FdKPQtaADwtqs5L
 8C58n50nLNExT3+u4NgkiDXNCAfWy4N+qCIsH9q21vaA6dEizGD/jwSb4zAQljc=
X-Gm-Gg: ASbGncv7Bv6fKKgFqjwcm4s4ZzPEdJMhKubToBOpAuCokqvf2SYo2QeiSUjsHpwrE7E
 JR3chJhM+abekIToAFDqau0Nhu9FjJxmB6LanfJxm8wDVuOgvNyM4JIsLycJvgvuPzU/EvzTeVh
 Ax60Qv5Bm7GB1vXwp4f1Xd3q6byPVNPBnQnospATLpxJuTGA8US07oMQTSOIGSU7f25a67eGjhy
 8lc0o1Pe8rOrINPvplOoX1HSW0H80UQIDuzB5nWq/Yw8opbHGUzkGPfSvpP1IyRY8IhBB2VcidF
 Ckz2DT7B4ztBmPpNH9M+s+7DvPbKeH6Pg02y93982Mk8SYJLKDGIqLmGbxyBYm0CYfCoDc/a+g=
 =
X-Google-Smtp-Source: AGHT+IHV69utL+5zMDHZ8UkG+rZXsDKUvLgfvIWqSiBs2xAo7J9tzxRfuNvE10kEXDmNFyYCebpIEg==
X-Received: by 2002:a05:6e02:1847:b0:3d8:1d7c:e197 with SMTP id
 e9e14a558f8ab-3d93b42921bmr71428135ab.7.1745728990422; 
 Sat, 26 Apr 2025 21:43:10 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f824ba0f52sm1567018173.114.2025.04.26.21.43.08
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3d6d6d82633so12112695ab.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVq7TBkxWyvKzYyrD/mSkKgzbx2+V/WsUFh8kTvl1i22nx0ywifhG4s/+mxBqcxF7icjtL+FRuUTdoJtQ==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6e02:1847:b0:3d8:1d7c:e197 with SMTP id
 e9e14a558f8ab-3d93b42921bmr71427715ab.7.1745728988001; Sat, 26 Apr 2025
 21:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
 <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
In-Reply-To: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:42:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
X-Gm-Features: ATxdqUGlkS5EQPGwaf23ftJzckW9DcLS2uG0Iv-DsC8_L7KpG4vBmNT4ibxuK1o
Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
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

T24gU3VuLCBBcHIgMjcsIDIwMjUgYXQgMTI6MzjigK9QTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3Np
ZS5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgNCwgMjAyNSBhdCA3OjU34oCvUE0gS3J6eXN6
dG9mIEtvemxvd3NraQo+IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+
ID4KPiA+IEVuYWJsaW5nIHRoZSBjb21waWxlIHRlc3Qgc2hvdWxkIG5vdCBjYXVzZSBhdXRvbWF0
aWMgZW5hYmxpbmcgb2YgYWxsCj4gPiBkcml2ZXJzLiAgUmVzdHJpY3QgdGhlIGRlZmF1bHQgdG8g
QVJDSCBhbHNvIGZvciBpbmRpdmlkdWFsIGRyaXZlcnMsIGV2ZW4KPiA+IHRob3VnaCB0aGVpciBj
aG9pY2UgaXMgbm90IHZpc2libGUgd2l0aG91dCBzZWxlY3RpbmcgcGFyZW50IEtjb25maWcKPiA+
IHN5bWJvbCwgYmVjYXVzZSBvdGhlcndpc2Ugc2VsZWN0aW5nIHBhcmVudCB3b3VsZCBzZWxlY3Qg
dGhlIGNoaWxkIGR1cmluZwo+ID4gY29tcGlsZSB0ZXN0aW5nLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvY2xrL3N1bnhpL0tjb25maWcgfCAxMCArKysrKy0tLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3VueGkvS2NvbmZpZyBiL2RyaXZlcnMvY2xrL3N1
bnhpL0tjb25maWcKPiA+IGluZGV4IDFjNGU1NDMzNjZkZGI3NmMxNjY5YjU3N2MxYWMzMzdkYzFi
ZTYxNmYuLjVlMmY5MmJmZTQxMjA5ODFhYjY4YjE3NWRjZTc5OGFjOGIzMjY4YjAgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2Nsay9zdW54aS9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL2Nsay9z
dW54aS9LY29uZmlnCj4gPiBAQCAtMiwxMyArMiwxMyBAQAo+ID4gIG1lbnVjb25maWcgQ0xLX1NV
TlhJCj4gPiAgICAgICAgIGJvb2wgIkxlZ2FjeSBjbG9jayBzdXBwb3J0IGZvciBBbGx3aW5uZXIg
U29DcyIKPiA+ICAgICAgICAgZGVwZW5kcyBvbiAoQVJNICYmIEFSQ0hfU1VOWEkpIHx8IENPTVBJ
TEVfVEVTVAo+ID4gLSAgICAgICBkZWZhdWx0IHkKPiA+ICsgICAgICAgZGVmYXVsdCAoQVJNICYm
IEFSQ0hfU1VOWEkpCj4KPiBKdXN0IHdvbmRlcmluZywgc2hvdWxkbid0IHRoaXMgY2hhbmdlIGFs
b25lIGJlIGVub3VnaD8gVGhlIHJlbWFpbmluZwo+IEtjb25maWcgb3B0aW9ucyBhcmUgZ2F0ZWQg
YnkgdGhpcyBvbmUuCgpIYXZpbmcgcmUtcmVhZCB5b3VyIHJlcGx5IHRvIHRoZSBvdGhlciBwYXRj
aCwgdGhpcyBvbmUgbWFrZXMgc2Vuc2Ugbm93LgoKU29ycnkgZm9yIHRoZSBub2lzZS4KCj4gPiAg
aWYgQ0xLX1NVTlhJCj4gPgo+ID4gIGNvbmZpZyBDTEtfU1VOWElfQ0xPQ0tTCj4gPiAgICAgICAg
IGJvb2wgIkxlZ2FjeSBjbG9jayBkcml2ZXJzIgo+ID4gLSAgICAgICBkZWZhdWx0IHkKPiA+ICsg
ICAgICAgZGVmYXVsdCBBUkNIX1NVTlhJCj4gPiAgICAgICAgIGhlbHAKPiA+ICAgICAgICAgICBM
ZWdhY3kgY2xvY2sgZHJpdmVycyBiZWluZyB1c2VkIG9uIG9sZGVyIChBMTAsIEExMywgQTIwLAo+
ID4gICAgICAgICAgIEEyMywgQTMxLCBBODApIFNvQ3MuIFRoZXNlIGRyaXZlcnMgYXJlIGtlcHQg
YXJvdW5kIGZvcgo+ID4gQEAgLTE5LDE0ICsxOSwxNCBAQCBjb25maWcgQ0xLX1NVTlhJX0NMT0NL
Uwo+ID4KPiA+ICBjb25maWcgQ0xLX1NVTlhJX1BSQ01fU1VONkkKPiA+ICAgICAgICAgYm9vbCAi
TGVnYWN5IEEzMSBQUkNNIGRyaXZlciIKPiA+IC0gICAgICAgZGVmYXVsdCB5Cj4gPiArICAgICAg
IGRlZmF1bHQgQVJDSF9TVU5YSQo+ID4gICAgICAgICBoZWxwCj4gPiAgICAgICAgICAgTGVnYWN5
IGNsb2NrIGRyaXZlciBmb3IgdGhlIEEzMSBQUkNNIGNsb2Nrcy4gVGhvc2UgYXJlCj4gPiAgICAg
ICAgICAgdXN1YWxseSBuZWVkZWQgZm9yIHRoZSBQTUlDIGNvbW11bmljYXRpb24sIG1vc3RseS4K
PiA+Cj4gPiAgY29uZmlnIENMS19TVU5YSV9QUkNNX1NVTjhJCj4gPiAgICAgICAgIGJvb2wgIkxl
Z2FjeSBzdW44aSBQUkNNIGRyaXZlciIKPiA+IC0gICAgICAgZGVmYXVsdCB5Cj4gPiArICAgICAg
IGRlZmF1bHQgQVJDSF9TVU5YSQo+ID4gICAgICAgICBoZWxwCj4gPiAgICAgICAgICAgTGVnYWN5
IGNsb2NrIGRyaXZlciBmb3IgdGhlIHN1bjhpIGZhbWlseSBQUkNNIGNsb2Nrcy4KPiA+ICAgICAg
ICAgICBUaG9zZSBhcmUgdXN1YWxseSBuZWVkZWQgZm9yIHRoZSBQTUlDIGNvbW11bmljYXRpb24s
Cj4gPiBAQCAtMzQsNyArMzQsNyBAQCBjb25maWcgQ0xLX1NVTlhJX1BSQ01fU1VOOEkKPiA+Cj4g
PiAgY29uZmlnIENMS19TVU5YSV9QUkNNX1NVTjlJCj4gPiAgICAgICAgIGJvb2wgIkxlZ2FjeSBB
ODAgUFJDTSBkcml2ZXIiCj4gPiAtICAgICAgIGRlZmF1bHQgeQo+ID4gKyAgICAgICBkZWZhdWx0
IEFSQ0hfU1VOWEkKPiA+ICAgICAgICAgaGVscAo+ID4gICAgICAgICAgIExlZ2FjeSBjbG9jayBk
cml2ZXIgZm9yIHRoZSBBODAgUFJDTSBjbG9ja3MuIFRob3NlIGFyZQo+ID4gICAgICAgICAgIHVz
dWFsbHkgbmVlZGVkIGZvciB0aGUgUE1JQyBjb21tdW5pY2F0aW9uLCBtb3N0bHkuCj4gPgo+ID4g
LS0KPiA+IDIuNDUuMgo+ID4KPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
