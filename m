Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2337763718
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 15:08:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97066C6B45C;
	Wed, 26 Jul 2023 13:08:21 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7EF6C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 13:08:20 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so639785a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690376899; x=1690981699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+jvLTMD6SRKXD1ssV+mqKXmm2sh5l8tuK18dvXLDZ0=;
 b=JantokC007z8nEFr53znXAczHo3EziakfiaRd8YueLDEqP+3OiVl5VVwNRNIW0vwyw
 5Z3F7dNCrhY5oZUQm6x8veUzAlko8u/+psC0QnnHBJGmhBhmqaOYrWubRfOdw5SsF2o3
 NXY2P95drR1x5vGghA2SHkcCrfgrO6gkoLnqnaFACoxM98ENHe60SLjJ4IB8CUFG4CDq
 R4RdDZwgAjuYPVoVj3Wk3Se8xij9X4H4OfSQeLI8M2d/VYRVBep9OjXX8Bx4NCPDlfoH
 hNcM8UEjshHOtgKXJWEby7fVXN51z4IgUknmWaIrRM8bfeONOZ9kBcer8dcpxxigEhx2
 gidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690376899; x=1690981699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K+jvLTMD6SRKXD1ssV+mqKXmm2sh5l8tuK18dvXLDZ0=;
 b=PjX3GAIKKMhZjAcsR48DQLcWJ0bkd+g+5xDOheC9lnl6k9gjBj2OnUK+7i8zbmqB19
 2yYesLhPOKpg5OMY22nwk/mq4xCjnjq9IiiWuICtBs6lWQmYhswDHKFweQ7ChFWZ6lAs
 wy7TeF78SUnMt/jF0aPR7w9CYsjc0io5XWkHzuzCDpeOCJSQhyn4+Ja/a4M1wS0RBO5I
 YzVRZnPp4mnMJrcPCXfdfBV1+KcTXN5NwS0LWv9U/Xob/V1lT99Zdw1sHl0oqthYHXju
 r/MvKgw9U3+Cc6tl3UcCvgH9oqNDNVClpDnI+b4aHiQFji5yP0jgqjWSQFInyFTGTyu/
 uX8Q==
X-Gm-Message-State: ABy/qLb7cD8GdEpaTf6dBRw3c6lnXeG/6+z/Lnhygn5z3Ea32VcM5jMC
 azTAp9Y6NMpaHVR/K+s3TlmomY1KoDn9Hu8z51etAzY4zDg=
X-Google-Smtp-Source: APBJJlFTiYK0k9/t8RBR1HkDbkL5w5yMREd7qN1MlfDydukq9zeFXNYodS+7QYkQTvzjgTFnirOm6uwpPySkbSYINTs=
X-Received: by 2002:a17:90a:1189:b0:263:f36e:d610 with SMTP id
 e9-20020a17090a118900b00263f36ed610mr1965297pja.0.1690376899208; Wed, 26 Jul
 2023 06:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
 <20230726070322.103871-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726070322.103871-3-krzysztof.kozlowski@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Jul 2023 10:08:07 -0300
Message-ID: <CAOMZO5C1JN7w+LhK-J0_ttKVopyeRq6VmCpAHujN_tGPMobotA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/8] AMR: dts: imx28-m28evk: populate
	fixed regulators
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

UGF0Y2hlcyAxLCAyLCAzLCBhbmQgNCBoYXZlIGEgdHlwbyBpbiB0aGUgU3ViamVjdDogcy9BTVIv
QVJNLgoKT24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgNDowM+KAr0FNIEtyenlzenRvZiBLb3psb3dz
a2kKPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlZCByZWd1
bGF0b3JzIHB1dCB1bmRlciAicmVndWxhdG9ycyIgbm9kZSB3aWxsIG5vdCBiZSBwb3B1bGF0ZWQs
Cj4gdW5sZXNzIHNpbXBsZS1idXMgb3Igc29tZXRoaW5nIHNpbWlsYXIgaXMgdXNlZC4gIERyb3Ag
dGhlICJyZWd1bGF0b3JzIgo+IHdyYXBwZXIgbm9kZSB0byBmaXggdGhpcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9y
Zz4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvbnhwL214cy9pbXgyOC1tMjhldmsuZHRzIHwg
NDUgKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKSwgMjUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
bnhwL214cy9pbXgyOC1tMjhldmsuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL214cy9pbXgy
OC1tMjhldmsuZHRzCj4gaW5kZXggZTM1MGQ1N2E0Y2VjLi42YmYyNmYzODZhNWUgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL214cy9pbXgyOC1tMjhldmsuZHRzCj4gKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvbnhwL214cy9pbXgyOC1tMjhldmsuZHRzCj4gQEAgLTE4LDMzICsx
OCwyOCBAQCBiYWNrbGlnaHQgewo+ICAgICAgICAgICAgICAgICBkZWZhdWx0LWJyaWdodG5lc3Mt
bGV2ZWwgPSA8Nj47Cj4gICAgICAgICB9Owo+Cj4gLSAgICAgICByZWd1bGF0b3JzIHsKPiAtICAg
ICAgICAgICAgICAgcmVnX3ZkZGlvX3NkMDogcmVndWxhdG9yQDEgewo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPiAtICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MT47Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9y
LW5hbWUgPSAidmRkaW8tc2QwIjsKPiAtICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3It
bWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPiAtICAgICAgICAgICAgICAgICAgICAgICByZWd1
bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPiAtICAgICAgICAgICAgICAgICAgICAg
ICBncGlvID0gPCZncGlvMyAyOCAwPjsKPiAtICAgICAgICAgICAgICAgfTsKPiArICAgICAgIHJl
Z192ZGRpb19zZDA6IHJlZ3VsYXRvci0xIHsKCkl0IHNob3VsZCBiZSBiZXR0ZXIgdG8gd3JpdGU6
CgpyZWdfdmRkaW9fc2QwOiByZWd1bGF0b3ItdmRkaW8tc2QwIHsKCnJlZ3VsYXRvci0xIGlzIG5v
dCB2ZXJ5IGRlc2NyaXB0aXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
