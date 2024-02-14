Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE4E854B85
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 15:36:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD29FC57194;
	Wed, 14 Feb 2024 14:36:39 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD7D3CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 14:36:38 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-599fc25071bso3655183eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 06:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707921396; x=1708526196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieRFgVX+l5qNLg5VWXa9Hrv9zNfV92pS7+FucPfjsp8=;
 b=MyA2XFqQN1uxkT6/FhiB/ZOlIK3ZXRa+p8abTaLKZoSA76jIWsv1k3oQMyV7tzqYoU
 f5Cru9nl18Jn+h9ab14vreNjhZb1K86SdtSFNfY3ExoUVoBi3jA5dB1pvAmtAaCICGEU
 tVWl//A3QZ7BQl0rJ6/gqMiZlqEZ0Mt59xuUaEUFe7zDjFYoYvDswrjcNBmErI8a7ei8
 u6U7+w0Ix4KVDUdP0ANXcLjkne6QpdE9r8x+6kahn8OKj9wgYGsFNHRZA6YTsKlQ5BaR
 Zc5BvaVT2q+UYuYkznqDeP4UBaO3fPZmb9mOZ/liiWkNesRA3mOLC146Pjp/USsDcm2B
 CZBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQZPaVtATRwg9C92nmSb/faY2zBc0D92scPucKAQjMVcl+2NEP4cd74jMHDyATtZeI8QiMWjDLgGk9FnScAu4l1r0UH5t5Yi2KfwrtfHeexrpoPxTP/7/l
X-Gm-Message-State: AOJu0YwKINRNXVtV/fi2z+KYVM+6QqBHxxSEvxYhYH8SLZFgR0J1sr5I
 gCFj8rECp11vfLg6jlfQwKHIAZqIj2/8vwwwftI36J6KV7s+cjFPrH7hmryIgk8=
X-Google-Smtp-Source: AGHT+IEDrHoVRejYjjyByDbeZl9UVciUUcCSo3E2tIPf19FX7PF0Rb0QhpENvJGSZ3q39tEdOmq0LQ==
X-Received: by 2002:a05:6820:161e:b0:59d:d349:d2ea with SMTP id
 bb30-20020a056820161e00b0059dd349d2eamr3690218oob.0.1707921395963; 
 Wed, 14 Feb 2024 06:36:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLZGzPgfYYuMNqlFAD9PqT/CjuVNB6oZmiuMEHoukVP+55M/jny7wmMBeP50u8FSOevIuihC0e6qw1sC+JxsgmVhT74AenjJdKMlSpvIyhKIi5JzcyHdmb
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com.
 [209.85.161.44]) by smtp.gmail.com with ESMTPSA id
 g25-20020a4a2519000000b0059a826dcf53sm842074ooa.40.2024.02.14.06.36.35
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 06:36:35 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-599fc25071bso3655156eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 06:36:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXIfWtK63dYxVeABeYBnb4QLJxWp6738z7O3lV9GZ2uZhkl1haQil+e7mcqpFsPUeXNhAZH2EgFTy87OhE/bHH0lU/RQEwqIPoB51AigzasPU3ml2L21Ms5
X-Received: by 2002:a25:8686:0:b0:dc7:4546:d107 with SMTP id
 z6-20020a258686000000b00dc74546d107mr2758581ybk.23.1707921374648; Wed, 14 Feb
 2024 06:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 15:36:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjJcsFiusnBQmJg1p-oy-NPmr+qyt0znOk0n+wL8TrnA@mail.gmail.com>
Message-ID: <CAMuHMdXjJcsFiusnBQmJg1p-oy-NPmr+qyt0znOk0n+wL8TrnA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Chanho Min <chanho.min@lge.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Schier <nicolas@fjasle.eu>, Bjorn Andersson <andersson@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, linux-renesas-soc@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kbuild@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Nathan Chancellor <nathan@kernel.org>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Imre Kaloz <kaloz@openwrt.org>, Scott Branden <sbranden@broadcom.com>,
 openbmc@lists.ozlabs.org, Antoine Tenart <atenart@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>
Subject: Re: [Linux-stm32] [PATCH 3/6] arm64: dts: Fix dtc
	interrupt_provider warnings
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgODozNeKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IFRoZSBkdGMgaW50ZXJydXB0X3Byb3ZpZGVyIHdhcm5pbmcgaXMgb2Zm
IGJ5IGRlZmF1bHQuIEZpeCBhbGwgdGhlIHdhcm5pbmdzCj4gc28gaXQgY2FuIGJlIGVuYWJsZWQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKPiAgYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3VsY2Ita2YuZHRzaSAgICAgICAgICAgIHwgNCArKysr
CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4KQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAK
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
