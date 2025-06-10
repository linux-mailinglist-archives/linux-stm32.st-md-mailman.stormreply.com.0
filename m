Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21310AD35CC
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 14:17:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF0FEC32E93;
	Tue, 10 Jun 2025 12:17:02 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09E30C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 12:17:01 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-310447fe59aso51954751fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749557821; x=1750162621;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
 b=PPDDMkhAV4Avzkyl1jWSZtKjO0JM10xZ361MzKGOviDFXLsbInurufb9gX4/paxPzM
 USGugjzgcq7WcaGUE068KokBajYYYLCJ9RC5vTaoKveRyuPGLCGmFP0q7LJ+yE2JeOo8
 bdTJ9vX9V1dZlqv5A4LCysTG2Pd6fvgAnV14L6bPNtnSGglxukzrw56Ho+IwKo17dCEz
 +/qGCmn2HhaSqbe7SexIdYGsjiKZAG+f79HfU5V2F1e10MUsKQAd/6l1WACErwy8XD3/
 Byhozrz7Qw52iRw/5VU4IEVg4gtFODoRVGy0OpnuCXqWact1r2xBu8E4AaSF7KhvcNsR
 xh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557821; x=1750162621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
 b=WA54Be9VdiVjBVngXAOHCtrillS/fQzpqj7NLw7U4Y65V8S5I1ECJKBbjCgsJaqOBA
 flnUwGmVJX+gGSp94EX+Z7EGgDgwWEBgRQUH/Yy7WFPvZODJ/azsCVecxw9Y/Xm3zxIZ
 hSKQjhlfGeHUI0VKvMQ/fBv35SImH27MqR1ttDIM1vSiA43SMd1DkkTvsC6tBO3rmJrp
 sUvl2loa5v+A989fynmR79Wv3kskwLsEIBWiOYkooc/EkajRuBhxUlMtjmK1/5AN4zMe
 3m3hZOQ2eJihyUkcpHxYke532lG0i6wEe8HydD0gsHt6uNmjVlN6eAePD5HEvC9j12+C
 DM8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1FQEIOUhLGokXhtHB+KhrDkbpyAmGG2A9cnmkAU83PgoTvAyAbBiwoIRi/+Oa/lQC+B44gBPeTZ0Mpg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJJ+IViK7UFoL+dmbFgoTHhrSNjuMU1HgLy/4JPPsz0qP7Jv+t
 BVK2jYjYRKCBAXDEWO9zLtvElzeoSDbAzlRZ/kV/f8t4XrXwX3eS6TeI+agqZ4Yrp8cnCweZLul
 Wf/JW9mKY3gDcYVhQepdTI0XPdQkW7fY7gR4ylIAHAw==
X-Gm-Gg: ASbGncvgXhZG8mcf43cjlgYK4e9pBfwq3XQWpvfUSYeT493X355t992SFFHfN9Hq+NT
 ul8tyWuLokM1indrd4rnUO7hBhNPyShKwqQSZweHEaadIrlucbKbka2tGLn8tL/w8RA1uHBaBur
 5isN67N8+D7Fy5c+ytbOfjXm5omv+xWG37yY/yT+4IEbBIT47B/Lcozg==
X-Google-Smtp-Source: AGHT+IFQxMti2+Q8Uenwhc0/S6UdaliHxGCkJGgDod8emAA4asQK/90KUnu0JtAhA4sI4nKXBC2mhVRJZkpkWFN1Jcw=
X-Received: by 2002:a05:651c:2211:b0:32a:8591:66a9 with SMTP id
 38308e7fff4ca-32adfbb0c50mr43449421fa.6.1749557820819; Tue, 10 Jun 2025
 05:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:16:49 +0200
X-Gm-Features: AX0GCFuA2Dfvx1J77MshD7Tzhu9rwDlijvkgXfC-wltdCoDdq-4uVh1ABAKFvmw
Message-ID: <CACRpkdaQLq3YGfOg81gt5=1Wh2ZkoKHeK6H=NWaeW9aLbX4VCA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, Emil Renner Berthing <kernel@esmil.dk>,
 linux-rtc@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, Hal Feng <hal.feng@starfivetech.com>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Subject: Re: [Linux-stm32] [PATCH 00/17] pinctrl: Constify pointers to
	'pinctrl_desc' and more
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

SGkgS3J6eXN6dG9mLAoKT24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMTI6NDHigK9QTSBLcnp5c3p0
b2YgS296bG93c2tpCjxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBJ
biBzZXZlcmFsIGRyaXZlcnMgcG9pbnRlcnMgdG8gJ3N0cnVjdCBwaW5jdHJsX2Rlc2MnIGlzIG5v
dCBtb2RpZmllZCwgc28KPiBzaW5jZSBjb3JlIGRvZXMgbm90IG1vZGlmeSBpdCwgaXQgY2FuIGJl
IG1hZGUgYXMgY29uc3QuCgp3aWxsIHlvdSByZWJhc2UgdGhpcyBzZXJpZXMgb24gdjYuMTYtcmMx
LCBmaXggdGhlIHNuYWdzIGFuZCBzZW5kIGEgbmV3IHZlcnNpb24/Ckl0J3MgYWxsIG5pY2UgY2xl
YW51cHMgc28gaXQnZCBiZSBncmVhdCB0byBqdXN0IG1lcmdlIHRoaXMuCgpZb3VycywKTGludXMg
V2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
