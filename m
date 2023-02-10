Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A028E69255F
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 19:34:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48B8AC6A5EB;
	Fri, 10 Feb 2023 18:34:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7A0EC65E73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 18:34:05 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h16so5896667wrz.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 10:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=itUHF+gJAOR68gNrNXTOhv2YTwp1LN4BGzGEfAiI2PA=;
 b=OaHJvANNeMAGzvf2uYI2xzLCi6qVzIoIMRJNUMUHlzvdQB4946tyfjwuc64G0AuREt
 YuNu/sR7FoiaVytT1wVaU5lS9eCpEu+2qZzqFTXe8g0PKYQ8cn7vuhmv1w2DLp6+rjPA
 VwOA/5nkkyxSNWkLJwLwBdi4zTMzi2yWNOmuPS3e0bp1oXuv0KGwifRBRdkJDANIcHba
 R3SJAVIxCBohLDCUmxIZjPJ21/NShmd2frAAkS2VIIGuJGHBcjEwfjIq9x3inxKTiZ9g
 VG+SmLQxhW1N+uckd3zByXCY+rK10AxGZ+y40dNt15bf8dXcveDzkzi962Xg7HQX+XtT
 EisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=itUHF+gJAOR68gNrNXTOhv2YTwp1LN4BGzGEfAiI2PA=;
 b=xh/L38XMqXchRYkUOrh+UoEmIsWNcZ5A/RVxEhxmz0H63VNPfpTLW6nbaZDvbg6qu4
 EAmA86A627yuR19RC27KzNTuQpQhtlNwlIVG9UPATzLmApTj7iPXU+pC67GbLeaVZ16s
 dszWVyqOIWYO7zChvEJdS4oiOrsnIARdihUluOWRQhKQCvvGFMiKYAdGR5ivYD2xNBAD
 jq3gy2E2Ql82UxL3GEPJ7jesjkqd6g7528lhFgLKmXGFKbgmSMujvXGkp9bSMs11FOtG
 NkiSi47AuzrFVZztN0xsZgkU4mdN+AeDTnoUJiG2BvPBdS/pLqQfWMfhfMmixFehRfLB
 mZqg==
X-Gm-Message-State: AO0yUKUoxYeNBZyehIxmWW+mthiT0LgDJbjGSHft7TdPx0dKueuYct6o
 h6nMYz7mfcc53CyQ2XEk9NADbQ==
X-Google-Smtp-Source: AK7set+sfAI5v+pm+Ta+c+I585wZnYR7ZKSMkHtr+epDPjtPngGn8hHOvj4Pt1bfuGTly/qfkXFNSg==
X-Received: by 2002:adf:f80c:0:b0:2c3:cdcd:f0b3 with SMTP id
 s12-20020adff80c000000b002c3cdcdf0b3mr13276955wrp.9.1676054045329; 
 Fri, 10 Feb 2023 10:34:05 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 i12-20020a5d438c000000b002c512f56859sm4135084wrq.70.2023.02.10.10.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 10:34:04 -0800 (PST)
Message-ID: <8f557084-e185-6bf5-ab2b-4e1ebf4fc516@linaro.org>
Date: Fri, 10 Feb 2023 19:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Alain Volmat <avolmat@me.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20230209091659.1409-1-avolmat@me.com>
 <20230209091659.1409-7-avolmat@me.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230209091659.1409-7-avolmat@me.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/11] thermal/drivers/st: remove syscfg
	based driver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDkvMDIvMjAyMyAxMDoxNiwgQWxhaW4gVm9sbWF0IHdyb3RlOgo+IFRoZSBzeXNjZmcgYmFz
ZWQgdGhlcm1hbCBkcml2ZXIgaXMgb25seSBzdXBwb3J0aW5nIFNUaUg0MTUKPiBTVGlINDE2IGFu
ZCBTVGlEMTI3IHBsYXRmb3JtcyB3aGljaCBhcmUgYWxsIG5vIG1vcmUgc3VwcG9ydGVkLgo+IFdl
IGNhbiB0aHVzIHNhZmVseSByZW1vdmUgdGhpcyBkcml2ZXIgc2luY2UgdGhlIHJlbWFpbmluZyBT
VGkKPiBwbGF0Zm9ybSBTVGlINDA3L1NUaUg0MTAgYW5kIFNUaUg0MTggYXJlIGFsbCB1c2luZyB0
aGUgbWVtbWFwCj4gYmFzZWQgdGhlcm1hbCBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxh
aW4gVm9sbWF0IDxhdm9sbWF0QG1lLmNvbT4KPiAtLS0KCkFwcGxpZWQsIHRoYW5rcwoKLS0gCjxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20v
cGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3Jn
PiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
