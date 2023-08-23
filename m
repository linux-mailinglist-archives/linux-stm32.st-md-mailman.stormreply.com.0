Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4F78535F
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 11:01:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A9DBC6B44C;
	Wed, 23 Aug 2023 09:01:24 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03646C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 09:01:22 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-76da4437500so194601385a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 02:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692781282; x=1693386082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtV842noA4k0ZIyALimzf7oD/qGOzDsyzAeC5Bbahhw=;
 b=DD0eFQeR5U0LXL0S4GEIehd+/RoBcYqADfjqebMQYR4Eon/trQMaQkbbyLMMxDzzxX
 gqZGqiNBWg8cBomlTR3BMmmRutNkm7WWh4rDoZ/M/FFm/8rx8Oz9yfX/zW1+5qtx9nCK
 hopzBJs/fVNKonHDAu/Rl5qm3KtM8T3eWKHY+knD9CsTan+8X2T8aNvCLL8VeRTpM8z3
 Jd2pGOiXSQajvi86ON8YV9PhPzMsnxdz7fFHD2qeDAqFL7XUcXfUQEIC04XEjyBM0kjn
 DQoeR2c/Y4Z4AqH4yOD3Wlus8MZaZu850rirnc/p7J8vAA5Ls/yQgZzxneB8C6nW4A2d
 3zrw==
X-Gm-Message-State: AOJu0YyzPrUeYP246oIZnsQZCIICaqt7djXo8Xp/xQ8vhIGkp+YTrg7E
 e4Jrc4k3P22n2rmkXhNHehePoN0b7oRJ+Q==
X-Google-Smtp-Source: AGHT+IGkmucsNWLXTlOt9KN2uA2A45FQDzzRm5G+aZlv0VpBLa9dCqBNISYjPP8UIPPF/VgEOAJt4Q==
X-Received: by 2002:a05:620a:25d1:b0:76c:e6b6:58d3 with SMTP id
 y17-20020a05620a25d100b0076ce6b658d3mr11911681qko.22.1692781281723; 
 Wed, 23 Aug 2023 02:01:21 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 r64-20020a815d43000000b00545a08184cesm3229980ywb.94.2023.08.23.02.01.20
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 02:01:20 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-d665467e134so5355293276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 02:01:20 -0700 (PDT)
X-Received: by 2002:a25:cad7:0:b0:d12:46b1:4459 with SMTP id
 a206-20020a25cad7000000b00d1246b14459mr12184522ybg.6.1692781280284; Wed, 23
 Aug 2023 02:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org>
 <20230823085146.113562-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823085146.113562-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Aug 2023 11:01:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7Gk5jTkD_hc_BAK0caQjzTBWrXedV+5rYrMRiZF1EAw@mail.gmail.com>
Message-ID: <CAMuHMdU7Gk5jTkD_hc_BAK0caQjzTBWrXedV+5rYrMRiZF1EAw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Samuel Holland <samuel@sholland.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 arm@kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] arm64: dts: use capital "OR" for
	multiple licenses in SPDX
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

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgMTA6NTLigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+IERvY3VtZW50YXRpb24vcHJv
Y2Vzcy9saWNlbnNlLXJ1bGVzLnJzdCBhbmQgY2hlY2twYXRjaCBleHBlY3QgdGhlIFNQRFgKPiBp
ZGVudGlmaWVyIHN5bnRheCBmb3IgbXVsdGlwbGUgbGljZW5zZXMgdG8gdXNlIGNhcGl0YWwgIk9S
Ii4gIENvcnJlY3QgaXQKPiB0byBrZWVwIGNvbnNpc3RlbnQgZm9ybWF0IGFuZCBhdm9pZCBjb3B5
LXBhc3RlIGlzc3Vlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKPiAgYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I4YTc3OTgwYS5kdHNpICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIGFyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzlmMC1zcGlkZXItY3B1LmR0c2kgICAgICAgICAg
IHwgMiArLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ZjAtc3BpZGVyLmR0
cyAgICAgICAgICAgICAgICB8IDIgKy0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4
YTc3OWYwLmR0c2kgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIGFyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3NzltMC5kdHNpICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5bTEtc2FsdmF0b3IteHMuZHRzICAg
ICAgICAgICB8IDIgKy0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OW0xLXVs
Y2Ita2YuZHRzICAgICAgICAgICAgICAgfCAyICstCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOGE3NzltMS11bGNiLmR0cyAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5bTEuZHRzaSAgICAgICAgICAgICAgICAgICAgICB8
IDIgKy0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OW0yLmR0c2kgICAgICAg
ICAgICAgICAgICAgICAgfCAyICstCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3
NzltMy1zYWx2YXRvci14cy5kdHMgICAgICAgICAgIHwgMiArLQo+ICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc5bTMtdWxjYi1rZi5kdHMgICAgICAgICAgICAgICB8IDIgKy0KPiAg
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OW0zLXVsY2IuZHRzICAgICAgICAgICAg
ICAgICAgfCAyICstCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzltMy5kdHNp
ICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjhhNzc5bTQuZHRzaSAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OW01LXNhbHZhdG9yLXhzLmR0cyAgICAgICAgICAgfCAy
ICstCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzltNS5kdHNpICAgICAgICAg
ICAgICAgICAgICAgIHwgMiArLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5
bTYuZHRzaSAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3OW03LmR0c2kgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzltOC5kdHNpICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5bWIuZHRzaSAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KCk1lYSBjdWxwYQoKQWNrZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9cywK
CiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9y
ZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkg
anVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
