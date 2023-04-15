Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC1C6E316B
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Apr 2023 14:49:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19091C6A5E7;
	Sat, 15 Apr 2023 12:49:19 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2237EC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 12:49:18 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 g26-20020a4adc9a000000b0053b9059edd5so3120487oou.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681562957; x=1684154957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TqQ3SiHws9LUFOFeaTF92+MKSqS3DlyruqkxUBl1iVE=;
 b=sAInW4jdFWd18P0SfBBU1170JUXE7LLFld6YAm6j4OxSekPTZLOY5WVbySpiaUlsDL
 cpJMSyT+1ai6GPaZ+GaWtYkHgOJajm9XTRgsMpGNHdNJpFSdVJ8eIclf7bq9/lqZwTjy
 bYCndd0i63bDCsn6dTfSGaZPEXeKUTgVW8kEdsGMEbT0z3VpD/9H/GWrqqlAGE4Lefvt
 8vN3ZbLwGvCs+1TSnnJ1en9utPQWCqfFfzI10I/VkrMacWt/iSTGLzvHIyVo4jDYeh3D
 +Ov80e54jVnDI/UWw16z7QxZWBr9RpuXpXEUdPm8cjZeoDBTgzQd8mvnIFazu15hpi/D
 Heqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681562957; x=1684154957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TqQ3SiHws9LUFOFeaTF92+MKSqS3DlyruqkxUBl1iVE=;
 b=D/i/WqeaJprFkOEeYhtig94u5+BE+kIBlgQcii/ttIUrSsub41lR/wX+HchXd8EFXm
 F6L8JY3XZlnDbc2fpJlXvuUTNeEbuzHRg9m5DQhZTSayJMOXSl4Rk9izkwJriWNbHcfx
 b6VGreBEXV5Kj7VoD/jlolmAsGGvL+hWUwX1t15+Eob8RUpgtNZ7esGfHuEqTDEEQ0S+
 iHF6u6+T/LBEw7CFCU+TeyhZUyLbGa9XXtF2yQaxXRjIEYwSeAiRIJzhHGQtkYSjtOzC
 Dp07Ayx7G0YEI14r/dWu3wEU6oPZzKx0kcYTOiGkYPNv7lRtDi2YIKv91pYigjPNyEjK
 koVg==
X-Gm-Message-State: AAQBX9c1GsrCXoyuAqVS0uBrJaCjCBtTWkc3E07ouCZXHSAUoAoz8GfP
 XzN2SMH9TJW+8QwgxKwj2vgAAmwVbXKlOqw3c0w=
X-Google-Smtp-Source: AKy350aw1sitUTkN1aRNjH+bN0r38acxG6oBYdh1kAmyzRFvhhgzUT2uye2u9KKaOPwVKPk8KV+BJZuBzcqgjqA4HF4=
X-Received: by 2002:a4a:d50d:0:b0:53b:7a81:fe64 with SMTP id
 m13-20020a4ad50d000000b0053b7a81fe64mr2496510oos.0.1681562956798; Sat, 15 Apr
 2023 05:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 15 Apr 2023 14:49:04 +0200
Message-ID: <CAMhs-H8e_e29=DVU0vc42gp0EiB_zkQLcNw_rH5Om21Xbm=Fpg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?4oCaZWNraQ==?= <rafal@milecki.pl>, Jamie Iles <jamie@jamieiles.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fu Wei <fu.wei@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-renesas-soc@vger.kernel.org, Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Andy Gross <agross@kernel.org>,
 Evan Benn <evanbenn@chromium.org>, NXP Linux Team <linux-imx@nxp.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Guenter Roeck <linux@roeck-us.net>, Corentin Labbe <clabbe@baylibre.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-watchdog@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: watchdog: indentation,
 quotes and white-space cleanup
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

T24gU2F0LCBBcHIgMTUsIDIwMjMgYXQgMTE6NTjigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gTWlub3IgY2xlYW51cCB3
aXRob3V0IGZ1bmN0aW9uYWwgaW1wYWN0Ogo+IDEuIEluZGVudCBEVFMgZXhhbXBsZXMgdG8gcHJl
ZmVycmVkIGZvdXItc3BhY2VzIChtb3JlIHJlYWRhYmxlIGZvciBEVFMpLAo+IDIuIERyb3AgdW5u
ZWVkZWQgcXVvdGVzLAo+IDMuIEFkZC9kcm9wIGJsYW5rIGxpbmVzIHRvIG1ha2UgdGhlIGNvZGUg
cmVhZGFibGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gLS0tCj4gIC4uLi93YXRjaGRvZy9tZWRpYXRlayxt
dDc2MjEtd2R0LnlhbWwgICAgICAgICB8ICA2ICsrLS0KCkFja2VkLWJ5OiBTZXJnaW8gUGFyYWN1
ZWxsb3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+CgpUaGFua3MsCiAgICBTZXJnaW8g
UGFyYWN1ZWxsb3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
