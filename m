Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF5857C01
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 12:47:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E03DCC65E42;
	Fri, 16 Feb 2024 11:47:06 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43CF2C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 11:47:06 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso689282276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 03:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708084023; x=1708688823;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lQ7tnAKFUkQOj4UEtgJN4h/6u4fraBJnTp0nHjLT6cQ=;
 b=BHSITBDCzVAP9Tfnoxq9LAlWEdCxwBXpfADE5kRXMK4pOH5yNC8GvCFVek3+qOFLba
 HfoN1QRUiQxVnCbvCPUliMXhc74nloJNP3ovPns7iZ67IgsB1gG0yfg6QGaUcGPo4WbL
 2TvZCCxjdJv6CalWybA+urDj+ZlNPkYqzW0VLeVoDU/g+DJT+Y03VEzbsY3/n3ThAo++
 DzPLeZjBHD5Wm96j2Qgw43HUXiehbOyJk7y6713rKmsquS1XD4YQNkzDUolXGA/IU7JN
 jQb3CT4zKJEphsYnLZN+56nmyt9ENijXEaoY+mR4Kjv6/LBIKa2JdXM3R0aCBOydDLoW
 tbXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXow+VlsiNV1DygPH/bv/DAFeeianpTZrGdtXGMVV2wHTzsTKoIVjBY019CMtrlVGVTVS3r5nWVB/vUFXOb6MnwICepX30m3EQ16Y1LoIZ/W4dJ53DGNpqk
X-Gm-Message-State: AOJu0YzzESK0pUXK4Z8kQvGPt7qS3ZD4sD3dtEksg5A2yL91uAp+wNTL
 nfy9hWFlUpVK1Qla+vuPOyrvGRBSqiJXNWQjsjBjjXyvhni1KETbNmT5joBOEVo=
X-Google-Smtp-Source: AGHT+IG+4DTR+XesvChTiV7lGzeBZP3/XpLuzwyaWd2O0+E/FxQjADLV3aTWyiQ6GEMACxpZz6CvRA==
X-Received: by 2002:a25:97c8:0:b0:dcc:4b84:67cd with SMTP id
 j8-20020a2597c8000000b00dcc4b8467cdmr4264044ybo.9.1708084022815; 
 Fri, 16 Feb 2024 03:47:02 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 z2-20020a5b0202000000b00dcc45635f27sm272074ybl.18.2024.02.16.03.47.01
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 03:47:01 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcbc00f6c04so621711276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 03:47:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWGQpS/xJL/WOiLoDw60vMDzA/TwPbFha4Gt4lygJa7e/9PVDDSlzlL6wl1JFCBRuaI4gXxJeeC+nlS6e5PvTmC2im6m6Lgk4Qo1lzJXMfAu2wFm7YDQEvp
X-Received: by 2002:a5b:708:0:b0:dc6:cc35:35e9 with SMTP id
 g8-20020a5b0708000000b00dc6cc3535e9mr4412013ybq.35.1708084021189; Fri, 16 Feb
 2024 03:47:01 -0800 (PST)
MIME-Version: 1.0
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 12:46:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXzObEqExtJZpUpXLfCWB5fW9ZhekbbotcxcMrN+uj0Ag@mail.gmail.com>
Message-ID: <CAMuHMdXzObEqExtJZpUpXLfCWB5fW9ZhekbbotcxcMrN+uj0Ag@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Russell King <linux@armlinux.org.uk>,
 Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] clk: constify the of_phandle_args
	argument of of_clk_provider
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

T24gVGh1LCBGZWIgOCwgMjAyNCBhdCA1OjM34oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiBOb25lIG9mIHRoZSBpbXBsZW1l
bnRhdGlvbnMgb2YgdGhlIGdldCgpIGFuZCBnZXRfaHcoKSBjYWxsYmFja3Mgb2YKPiAic3RydWN0
IG9mX2Nsa19wcm92aWRlciIgbW9kaWZ5IHRoZSBjb250ZW50cyBvZiByZWNlaXZlZCBvZl9waGFu
ZGxlX2FyZ3MKPiBwb2ludGVyLiAgVGhleSB0cmVhdCBpdCBhcyByZWFkLW9ubHkgdmFyaWFibGUg
dXNlZCB0byBmaW5kIHRoZSBjbG9jayB0bwo+IHJldHVybi4gIE1ha2Ugb2J2aW91cyB0aGF0IGlt
cGxlbWVudGF0aW9ucyBhcmUgbm90IHN1cHBvc2VkIHRvIG1vZGlmeQo+IHRoZSBvZl9waGFuZGxl
X2FyZ3MsIGJ5IG1ha2luZyBpdCBhIHBvaW50ZXIgdG8gY29uc3QuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cgo+
ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA2ZzAzMi1jbG9ja3MuYyAgICAgICAgfCAgMiArLQo+
ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3JlbmVzYXMtY3BnLW1zc3IuYyAgICAgICAgfCAgMiArLQo+
ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jICAgICAgICAgICAgICAgfCAgMiArLQoK
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
CkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
