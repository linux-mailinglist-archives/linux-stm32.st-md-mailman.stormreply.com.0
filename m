Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF22AAFDE95
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 05:53:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E24DC36B2B;
	Wed,  9 Jul 2025 03:53:00 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83E5EC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 03:52:59 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-32b49ac6431so41415141fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jul 2025 20:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752033174; x=1752637974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2WLrs8UFl83Bka6HJdVR44cmF3Cl8IJgCemJs93MWgM=;
 b=sbudpaiy4xAziqVbmzmvFNINDc0i0KAAk7SPctH1EJizTQHXGRUp2Sv8pwN6RRhjNW
 QLstEDmLDLLtvo1vR1aUX2WaxwRVBhvU3UyGxqiJ5fGLNcUefzmWNBieH7vphG1LcF1y
 gHmujgY0IYzNZjKM0ciPQSMFqkJr+LtNeSKIGKDNNNkuHC0IXtC/cILzmIwt7CwFbX75
 jsUDRKpcuMgOpxxgDVRt05zqefcFpYz0hdKCVW2GKK0hA+uUPowPX5e/uyQs0HH+sYy2
 kNE+Vag3xKmr2ALNWE7DSV34/cwzwhQfpH8yt1ybQbe4rNSmBDiHfKbiASp+DBmKy6uB
 fwLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz5QaVCfS3+6OFNiQiSat6CmiMJHfJotfpTCr71lJVupSkP/2Z46SBJaLWeqc1zu4hyGmwGl0GaTfC+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxopkaTSVNjI1O4MHomvkAUrvl76ktljRsOsxbaN823mOCDaz83
 tDFl+iADVfrc9+6HqFcirgorYDX/uyE9hpkDdwXnE4FNVEdb3HCB/W6c0AFvgjYcj4RrCw==
X-Gm-Gg: ASbGncsoW8MWPgrt24glLWO1E3StyUygiSMbpfkqFsGcEeFRBRMjHx3eegBZqXirPA1
 ewRQT6e6NMj2/UJGR6+56BkNFNCAisUrVrBE+055sJPUSMWXJAbxFIbr5JKiK2gjupe9hQzNCxc
 pXor+f2SHl9RFMVLhy9jl+3ZUWwfIjMvuLINLrT36TNzCMSacFvZFB9imgAnGuGkDDgmGFT5oeV
 DsIWWBG6c920kWL3cUGzkbEN5Q72XT6kC97YYRgKnz2OMxyBTJHdRMk3ugAsm0lHZXaiPnalN/2
 qcLpKvb84gvtkO4ifZ2jxqSxgA2GVevtMwzFbr0IgnStp/E/btFZ20yNFuwq7fEdRih7o+LB0sL
 mrFDyneMLDpitK0YAIB4=
X-Google-Smtp-Source: AGHT+IHNp0/Uv+GnYHsmfu09V/CFMvN6SnBLo/h6at5CRtF11cjKkTPj1PnBfcx9xojyqMYtJ0c5ew==
X-Received: by 2002:a05:651c:54c:b0:32a:85ad:2148 with SMTP id
 38308e7fff4ca-32f48421e53mr2031931fa.8.1752033173413; 
 Tue, 08 Jul 2025 20:52:53 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1afc1c87sm15862041fa.28.2025.07.08.20.52.52
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 20:52:52 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-32f1df5b089so35629541fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jul 2025 20:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPnWkNinaQ9jfLcs2PUmKuMuM5+vwIRylUMSoZlD1RVFXXtCBtXnOmrRsshIZhLIivBpvvaQZB7YFDHQ==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:651c:221c:b0:32a:888e:b30f with SMTP id
 38308e7fff4ca-32f48421a2emr1518491fa.6.1752033172370; Tue, 08 Jul 2025
 20:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
 <20250708231152.971398-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250708231152.971398-1-sakari.ailus@linux.intel.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 9 Jul 2025 11:52:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v67zSf6X5B0rvkKPb1sOna+EW7f5JzqduO1rt1hSUo3p8w@mail.gmail.com>
X-Gm-Features: Ac12FXwreyUxlabds-QeysMrnIp1a5yDkx7pVnlh5FRhGlmU6_2tIIE3jiUb5cg
Message-ID: <CAGb2v67zSf6X5B0rvkKPb1sOna+EW7f5JzqduO1rt1hSUo3p8w@mail.gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Rob Herring \(Arm\)" <robh@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>, Samuel Holland <samuel@sholland.org>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Lechner <dlechner@baylibre.com>,
 linux-sunxi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 02/12] iio: adc: Remove redundant
 pm_runtime_mark_last_busy() calls
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

T24gV2VkLCBKdWwgOSwgMjAyNSBhdCA3OjEy4oCvQU0gU2FrYXJpIEFpbHVzCjxzYWthcmkuYWls
dXNAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5k
KCksIHBtX3J1bnRpbWVfcHV0X3N5bmNfYXV0b3N1c3BlbmQoKSwKPiBwbV9ydW50aW1lX2F1dG9z
dXNwZW5kKCkgYW5kIHBtX3JlcXVlc3RfYXV0b3N1c3BlbmQoKSBub3cgaW5jbHVkZSBhIGNhbGwK
PiB0byBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkuIFJlbW92ZSB0aGUgbm93LXJlZHVudGFu
dCBleHBsaWNpdCBjYWxsIHRvCj4gcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpLgo+Cj4gU2ln
bmVkLW9mZi1ieTogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPgo+
IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4g
LS0tCgo+ICBkcml2ZXJzL2lpby9hZGMvc3VuNGktZ3BhZGMtaWlvLmMgIHwgIDIgLS0KCkFja2Vk
LWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
