Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93597853D8A
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 22:47:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46F6DC6DD69;
	Tue, 13 Feb 2024 21:47:52 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F18E1C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 21:47:50 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dc6d9a8815fso5038564276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 13:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707860870; x=1708465670;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
 b=AC8himf3KV6KYurFcW2+Dvm7AfgaIPzG39SOIO/MByLrrSbu5hp49hVHJ/kXXOLPbH
 Q30GAQxS1VdOB5SNi64172ZixtMhBDnJewIo/gJOO6nKsZEMsZ8P6PprX5nYBR1Ir2Ay
 tH5SRpwHqdAoZ8Q9kQwU1WiGQrvbhTTnDZr1JNZt1Y2FMVdy2VETfGNqG3pNGhaiABa/
 a6psis4gPCACp1KrzHL9iKJRPSuSGab/yJSYhUQzVEWWpWV35MgTgBz8mx0o5cXFk042
 qc64LxcKaIc8LE1DlDWL73qkDZyAOw4Nlgd8WZCPgP3MN3QRmQwWVMagcUZOX6u2qEBr
 wt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707860870; x=1708465670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
 b=rSusHvo9sEyc6Ky2YDRsjmBQoZEs4hh3BXH7RyCYfNcLVPVhcx4oBna8zRoRNNK/Zh
 c5UY6rGB9AVgsraHrUolMyuetNZubHa6I3u4S6E36sdbUkbBxPtmDUWUpJig5GnhyqXS
 H0WAgUyhY7j0i90klocz10vJzzZETIcCYObskjfy7QIVxsZPUxAqjToAaitRee/TjSVL
 OcfUFdkrQjBNYX8DR/tHvy1CnH2DvElrfVqXwsa75djFJuddDsqRqkGTXo4ZNOVLabgM
 59unWejUJa+nPM0dTNuCdPaxOkzbd34aTQGY18vJ45QB/fyj/NoMesOU5x7C0SnP1MQq
 rhIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3jdXjrr/llZle4ZAVcXdfN4fCowLf/ap5F9trLiTQiUyg7EMdKWCW69gBBj2dxpG/7ZFzxSK3TxBJJiUboC9gjrT6RPAz5YWT7o3NHnWvyUrH9LCCVXpZ
X-Gm-Message-State: AOJu0YyOYmJy3BE23bXQQmz191SXS14JlUEAyI0F1nZHwgMoyDgfobLM
 4E2yHmCSFAZQPzdLKfHPEka3SBwzSTlkiYJbfCYDXLbCtbE4YtqvLISAUVRdjvfyw/0+DGDrv3U
 yq6netVpsojWqKduLTcvPaMbfISibz41+B8ZYog==
X-Google-Smtp-Source: AGHT+IFa7Zt8v9y973vv6MpdAwv7+Tn3+by0Zhu9bHJxIuhmjm9zf8ed0hjSWCanmVOGM7vq2XjFxfCkSYAs+ofuT1Q=
X-Received: by 2002:a25:ae47:0:b0:dcd:49d0:eece with SMTP id
 g7-20020a25ae47000000b00dcd49d0eecemr434149ybe.60.1707860869809; Tue, 13 Feb
 2024 13:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:47:39 +0100
Message-ID: <CACRpkdbPANM0-h_g+6Zazgw9U5W8ZDc=EG4ZiTv64JVmZAPivg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 4/6] arm: dts: Fix dtc interrupt_map
	warnings
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
bC5vcmc+IHdyb3RlOgoKPiBUaGUgZHRjIGludGVycnVwdF9tYXAgd2FybmluZyBpcyBvZmYgYmVj
YXVzZSBpdHMgZGVwZW5kZW5jeSwKPiBpbnRlcnJ1cHRfcHJvdmlkZXIsIGlzIG9mZiBieSBkZWZh
dWx0LiBGaXggYWxsIHRoZSB3YXJuaW5ncyBzbyBpdCBjYW4gYmUKPiBlbmFibGVkLgo+Cj4gU2ln
bmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KClRoYW5rcyBmb3IgZG9p
bmcgdGhpcyBSb2IhIFRoZSBzY2hlbWFzIGZpbmRzIHNvIG1hbnkgbWlzdGFrZXMuLi4KUmV2aWV3
ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApM
aW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
