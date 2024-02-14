Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD3854C0C
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 16:01:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68852C57194;
	Wed, 14 Feb 2024 15:01:24 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0678BCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 15:01:22 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-42a0ba5098bso28647881cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 07:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707922880; x=1708527680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6upARWbXs1k8V4Vnc/YI44n6rxziwjW/OPtXVVY76s=;
 b=OKXZyYkk6T2hjB35RVqn3u2ZT/HeNRfA+zRqqnjDCMXJxECTboZowu7qBm0eR6t4zo
 lF4otxxkS6UvPKWFMDj3YMQ/qs07qb4mMlMZonI+/1+sKSP7zDbKGPvdKfaOWB0QMXYj
 lKzAnwdUK1+khxP/64KxSMQmDKG1jEzR+i31H047TdSm1+dMTRVgY+vW2j8uozB0q6Gh
 KHx/brm4/vlYUOvI2rA77UuaNcIIlKawbVH+hG9faL2CJU6wNPTRSRwZ8Z3mNh+YItmV
 VubmdS4OoJSDuO4uxdf4J7H1wjRC2uo02ATRAbVlEFV5OOyAAdVpnQOytGRVHyx66hrO
 JKcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW21aJvwdKXUgqgKJLA9/KFLbdluuFDZtZjDGbcfoz8CMh+Mb4Blihhu0lxl5/gOBq/XFatAmNJ0R2u2qkzQhxZp0JEWNbb1hJdLvB32H4zgjZ+M0ybkS7p
X-Gm-Message-State: AOJu0Yw8mSrWJlhHE+/vSYV5aKsAZxvwduCGo+TQldFQTLSQ1J3lg08M
 9qQujWOz2zEXyltYN5dI36Q8BlsdT0shx6AWb6r4cjyqNBiHTjoVmLRBERd5wQE=
X-Google-Smtp-Source: AGHT+IGBeRxkP0QD3OhK/cg7IzduAD9DUesf3WvMij+9SrsrE1XKDLEbWlarubzGX7wOMHenHvwKwg==
X-Received: by 2002:ac8:5756:0:b0:42d:b20d:d6fc with SMTP id
 22-20020ac85756000000b0042db20dd6fcmr3064201qtx.3.1707922879070; 
 Wed, 14 Feb 2024 07:01:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZnOnh9dVJTC7TP9hTCDg/R4Op6QnMi9BuBqKl8Wlxg1z/PqbYRRV4dM/V+Q/Lzr8CXtClDGfVUALW00ftjIRyFazREcEax5i2JA1CaQGNeHsuzk/UVDRP
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 c22-20020ac84e16000000b0042994b3c20dsm2052898qtw.29.2024.02.14.07.01.18
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 07:01:18 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-42a8a3973c5so28297781cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 07:01:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJJzQ8VJndiO/cGkASNQlc1tKi6x3rWkuKHoRGu6lHtwuSKYdj+qPDYf38nv0t7D5SfY6fBgLP3n+KuhRO07L+tICg8OMtVIL+sskpZfDyn/qMfIT9f9t4
X-Received: by 2002:a25:84c9:0:b0:dc2:3fbd:82fe with SMTP id
 x9-20020a2584c9000000b00dc23fbd82femr2322270ybm.46.1707922857034; Wed, 14 Feb
 2024 07:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 16:00:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
Message-ID: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Chanho Min <chanho.min@lge.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Schier <nicolas@fjasle.eu>, Bjorn Andersson <andersson@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
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
Subject: Re: [Linux-stm32] [PATCH 0/6] dts: Fix dtc interrupt warnings
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

SGkgUm9iLAoKT24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgODozNeKAr1BNIFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+IEkgaGFkIGEgYnJhbmNoIHdpdGggbW9zdCBvZiB0aGVz
ZSBjaGFuZ2VzIHNpdHRpbmcgaW4gbXkgdHJlZSBmb3Igc29tZQo+IHRpbWUuIEdlZXJ0J3MgYXNr
aW5nIGFib3V0IHNvbWUgZXJyb3JzIG5vdCBnZXR0aW5nIGZvdW5kIHByb21wdGVkIG1lIHRvCj4g
Y2xlYW4gaXQgdXAgYW5kIHNlbmQgaXQgb3V0LiBUaGlzIHNlcmllcyBmaXhlcyBhbGwqIGludGVy
cnVwdCByZWxhdGVkCj4gd2FybmluZ3MgYW5kIGVuYWJsZXMgdGhlIGNoZWNrIGJ5IGRlZmF1bHQu
Cgo+ICpUaGVyZSdzIGEgZmV3IFJlbmVzYXMgd2FybmluZ3Mgc3RpbGwgR2VlcnQgc2FpZCBoZSB3
b3VsZCBmaXguCgpUaGFua3MsIGZpeCBzZW50Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYTM1
MWU1MDNlYTk3ZmIxYWY2ODM5NTg0M2Y1MTM5MjVmZjFiZGYyNi4xNzA3OTIyNDYwLmdpdC5nZWVy
dCtyZW5lc2FzQGdsaWRlci5iZQoKPiAgICAgICBkdGM6IEVuYWJsZSBkdGMgaW50ZXJydXB0X3By
b3ZpZGVyIGNoZWNrCgo+ICBzY3JpcHRzL01ha2VmaWxlLmxpYiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzICstLQoKSnVzdCB3b25kZXJpbmcsIGNhbiB0aGUgcmVtYWluaW5n
IGRpc2FibGVyIGJlIHJlbW92ZWQsIHRvbz8KCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9NYWtlZmlsZTogICAgIC1Xbm8taW50ZXJydXB0X3Byb3ZpZGVyIFwKCkdye29ldGplLGVl
dGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
