Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6944E277
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 08:42:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F13A0C5EC71;
	Fri, 12 Nov 2021 07:42:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF4F8C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 07:42:41 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6148307wmd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 23:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
 b=L0G7vqzIu4OmVtWPcfcfA5NzLtPk2i0H7s2BzObNlHQTFEkm03sqk/2QHQ4kjpk9BH
 XMXouE5QpmwrxFfo6B5ZLvuccwWWhT/w9Ko9Yi7L+7BfDDnicqyRLnT+TM8ck5H5bQEY
 cyD6P6qfh9iWldNqTQR7o5UJ+sXkSMXyDzLNU6kkBq7ka/+ZuUqEk/qcSbQ3GxXC7kiU
 cm9dyledHK9n0gr3crraQGaAfhd3vfTQwfXVu/kwmwojjE1dRCSgNEVgeiJJB70r7ke9
 OYePQHHEPa/usZJXytv516/nCeAGVXFsmZBOHnIcNaOTOhsULeXowN7ikvsxKqOo/gxw
 3O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
 b=y4GscFAmP6lwCyyG5ExmrA2PnEhi/p65rGnnwvjvHjDtxqrCOmooV4NvQT8TjSKFjB
 P9GLhY33NWPjrlFvUH885qa1rHZtu0uAjYl2RG//tSsKyhpMyxgqYBNUnbvnLAURNB3g
 6e1hzkDupx5yZ6AKcHVsDTO+J108kO0a82cOQ37jBwibyW7OMe07ZbXw7l9jMkg86moX
 yjHSlBC6G57KHJ1LaB96OUnxpKLrG8ozPX7zwhiZskyzGej0sRXTHjnmgqsIwU42axhv
 siMygr8n+8xmFbvAQcv08U8UfY9ZS69CMLF9qu4/GCwlJTxm3jnPT0yzMD4JrG/3vpAN
 Mxyw==
X-Gm-Message-State: AOAM531eglDvUzt9Tn2gIWyb9NPiOXrFEJEVRVFrlRXzNTIyhdbbbFED
 X4gUAq7++vpYPZXGCbuJvK9gVQ==
X-Google-Smtp-Source: ABdhPJyYtg+MHn61GMl0MRFqSO/sm1wnHgrm7yORmq7WT7ihtvN7d0mp317CBhRDaom5mAlXGDszmg==
X-Received: by 2002:a05:600c:2107:: with SMTP id
 u7mr32377342wml.82.1636702961238; 
 Thu, 11 Nov 2021 23:42:41 -0800 (PST)
Received: from google.com ([95.148.6.174])
 by smtp.gmail.com with ESMTPSA id q8sm4978469wrx.71.2021.11.11.23.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 23:42:40 -0800 (PST)
Date: Fri, 12 Nov 2021 07:42:37 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <YY4a7ZxzhNq6Or+t@google.com>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-3-patrice.chotard@foss.st.com>
 <YYwjPAoCtuM6iycz@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYwjPAoCtuM6iycz@robh.at.kernel.org>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Guenter Roeck <linux@roeck-us.net>, ohad ben-cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 thierry reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 lars-peter clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, stephen boyd <sboyd@kernel.org>,
 pascal Paillet <p.paillet@foss.st.com>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, jonathan cameron <jic23@kernel.org>,
 linux-iio@vger.kernel.org, michael turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, baolin wang <baolin.wang7@gmail.com>,
 "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
 Marc Zyngier <maz@kernel.org>, herbert xu <herbert@gondor.apana.org.au>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, yannick fertre <yannick.fertre@foss.st.com>,
 vinod koul <vkoul@kernel.org>, daniel vetter <daniel@ffwll.ch>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/5] dt-bindings: mfd: timers: Update
 maintainers for st, stm32-timers
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

T24gV2VkLCAxMCBOb3YgMjAyMSwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IE9uIFdlZCwgMTAgTm92
IDIwMjEgMTY6MDE6NDEgKzAxMDAsIHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbSB3cm90ZToK
PiA+IEZyb206IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+
ID4gCj4gPiBCZW5qYW1pbiBoYXMgbGVmdCB0aGUgY29tcGFueSwgcmVtb3ZlIGhpcyBuYW1lIGZy
b20gbWFpbnRhaW5lcnMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8
cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi10aW1lcnMueWFtbCB8IDEgLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiAKPiBMZWUgaW5kaWNhdGVkIGhlIHdh
cyBnb2luZyB0byBwaWNrIHRoaXMgb25lIHVwLCBzbzoKPiAKPiBBY2tlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KClNpbmNlIHlvdSBhbHJlYWR5IG1lcmdlZCB0aGUgdHJlZXdp
ZGUgcGF0Y2gsIHlvdSBtYXkgYXMgd2VsbCB0YWtlCnRoaXMgdG9vLiAgV2UnbGwgd29yayB0aHJv
dWdoIGFueSBjb25mbGljdHMgdGhhdCBtYXkgb2NjdXIgYXMgYQpyZXN1bHQuCgpBY2tlZC1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
