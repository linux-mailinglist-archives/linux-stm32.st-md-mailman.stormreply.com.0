Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E23691BA9
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 10:41:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45593C6A5E9;
	Fri, 10 Feb 2023 09:41:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCDC7C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 09:41:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id u10so3357329wmj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FXtJIM3du57xUfV949O/wulNn8qW+AxKoWuOnlA8Zs8=;
 b=Q4I+nSXtzNQtYSSBlK1tnkNWOBobkj//fQnII73nliusIFWbS4CyMXwv790TWVzaIR
 XeJFKMr09KxD6VEIwh0GADzS0KBeXwSd/Z2PuYcBx5wrwvwYKnpwCDcrhxRlRw1DIemu
 MShr1vbHI1OaKEdj393Dhbfx1croPFoH/IAHV4O1JI2sVfq1pnRj8CyYMXARz/VHSfkB
 +G0O6Aj1djeAFoK6kGfSCNq92z0a1Be0RoRQsmFaFkAFFZi/8jacKoA+8TQepXSM+Kfj
 3xzyBztnswh5ZMW2uGJwfNW1lkjNA2TL5EfxLYmohtuFUIh9ADwLNXuqvunAKu5Ksdr8
 LJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FXtJIM3du57xUfV949O/wulNn8qW+AxKoWuOnlA8Zs8=;
 b=PyXQfrUtoGxKJ4W1TG9+LfqiDNMW43GLn4CbAIhCYEbqXN0jg4Q809XVCgGZBvAd3L
 ZiCzM74QLkHdmxnlSadRPfYdKX0ypduTsrx/YRSXI8kFJ4R+GX6MD56feVnRGN9LJ/8C
 wixkSiuqP90DW95djdcyV40QCefScWNaL/86uuymT3/B2d+ogCBRf6T7ex3FQ700nuVh
 xNCoIRCRLEbDAPnKIQhnsqvOF+L9dTPVXCqDCzqBOilaXwuq0aDGU8yBixW6bPKdDQGM
 rzX+nsO4x86bcWBGdDsJpEPE2DQMdIjL3LSo2besu+li9wKAX8282FyyOiQrqf4ugZ0b
 jg8A==
X-Gm-Message-State: AO0yUKWoyKVh1s7YdiC6WFqEyU4noEi/+iHqMIdp4Atzidao68PyA7KE
 HC9+vIqvS+rubqvqOn+HioL80g==
X-Google-Smtp-Source: AK7set9g8UOPh4E6E2LgZ5q7toZT7ywT9NslTSP9dH/BzqJlUMVqwQWZGYqb6Lx8fO9DrtqztHmmEQ==
X-Received: by 2002:a05:600c:3317:b0:3e0:111:28a9 with SMTP id
 q23-20020a05600c331700b003e0011128a9mr12224837wmp.22.1676022063255; 
 Fri, 10 Feb 2023 01:41:03 -0800 (PST)
Received: from linaro.org (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056000128300b002c3e600d1a8sm3208693wrx.95.2023.02.10.01.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 01:41:02 -0800 (PST)
Date: Fri, 10 Feb 2023 10:40:56 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rafael.j.wysocki@intel.com
Message-ID: <20230210094056.GC175687@linaro.org>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Haowen Bai <baihaowen@meizu.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Remove core header inclusion
	from drivers
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

SGkgUmFmYWVsLAoKT24gTW9uLCBGZWIgMDYsIDIwMjMgYXQgMDQ6MzQ6MjlQTSArMDEwMCwgRGFu
aWVsIExlemNhbm8gd3JvdGU6Cj4gQXMgdGhlIG5hbWUgc3RhdGVzICJ0aGVybWFsX2NvcmUuaCIg
aXMgdGhlIGhlYWRlciBmaWxlIGZvciB0aGUgY29yZQo+IGNvbXBvbmVudHMgb2YgdGhlIHRoZXJt
YWwgZnJhbWV3b3JrLgo+IAo+IFRvbyBtYW55IGRyaXZlcnMgYXJlIGluY2x1ZGluZyBpdC4gSG9w
ZWZ1bGx5IHRoZSByZWNlbnQgY2xlYW51cHMKPiBoZWxwZWQgdG8gc2VsZiBlbmNhcHN1bGF0ZSB0
aGUgY29kZSBhIGJpdCBtb3JlIGFuZCBwcmV2ZW50ZWQgdGhlCj4gZHJpdmVycyB0byBuZWVkIHRo
aXMgaGVhZGVyLgo+IAo+IFJlbW92ZSB0aGlzIGluY2x1c2lvbiBpbiBldmVyeSBwbGFjZSB3aGVy
ZSBpdCBpcyBwb3NzaWJsZS4KPiAKPiBTb21lIG90aGVyIGRyaXZlcnMgZGlkIGEgY29uZnVzaW9u
IHdpdGggdGhlIGNvcmUgaGVhZGVyIGFuZCB0aGUgb25lCj4gZXhwb3J0ZWQgaW4gbGludXgvdGhl
cm1hbC5oLiBUaGV5IGluY2x1ZGUgdGhlIGZvcm1lciBpbnN0ZWFkIG9mIHRoZQo+IGxhdHRlci4g
VGhlIGNoYW5nZXMgYWxzbyBmaXggdGhpcy4KPiAKPiBUaGUgdGVncmEvc29jdGhlcm0gZHJpdmVy
IHN0aWxsIHJlbWFpbnMgYXMgaXQgdXNlcyBhbiBpbnRlcm5hbAo+IGZ1bmN0aW9uIHdoaWNoIG5l
ZWQgdG8gYmUgcmVwbGFjZWQuCj4gCj4gVGhlIEludGVsIEhGSSBkcml2ZXIgdXNlcyB0aGUgbmV0
bGluayBpbnRlcm5hbCBmcmFtZXdvcmsgY29yZSBhbmQKPiBzaG91bGQgYmUgY2hhbmdlZCB0byBw
cmV2ZW50IHRvIGRlYWwgd2l0aCB0aGUgaW50ZXJuYWxzLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlcwoKQXJlIHlvdSBvayBpZiBJIHRha2UgdGhpcyBwYXRjaCA/CgpUaGFua3MKCiAgLS0gRGFu
aWVsCgoKLS0gCgogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3
LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNv
bS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1i
bG9nLz4gQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
