Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA44C6D98BC
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 15:56:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99875C6A61D;
	Thu,  6 Apr 2023 13:56:28 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBBA1C6A61B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 13:56:27 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id i7so604290wrc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Apr 2023 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680789387; x=1683381387;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VtdWe2FmvtgwmWTeOABvPcq/IF1uN7ZuplszcAHjajI=;
 b=jOSEvV/5SZmvbDHZkDsiI5WEd69V0/TQu630mOausA4EmJ+Gl3R2IvxPQOYbNZzGqC
 42xFXvVsZr8pW16lHPH9pA7CH1bbgJA3F/F44vKLip2HAn8QaQYJwxoFST7AfdNAbSV4
 4BQeKKxZWLoj4JtOxS1Q7nPGoaP89nkOzme4oGlA3/y0zh7Xj9qBx6FAhdRUPfP4hi89
 +EtlWyytR9rkoVqXQsan5KPy41KOY8d+M73vmwn6grY2hITaI0jcgmqXcNxi39/51AW1
 hDBnmHExanfFuWsFA9oatcFcpRTx2/CztDedPCsukCJPlwhMJO+gg2+fpwROsd/vgaK5
 /z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680789387; x=1683381387;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VtdWe2FmvtgwmWTeOABvPcq/IF1uN7ZuplszcAHjajI=;
 b=8P6Ql8DJs1E2WGKeixdHbr02H+cZn01z2fn9bjL0GVVKWBJmlOAaHNjog8VtGEOZig
 sswqfFxBWefZOQoQZ9PVUVjWgwhrGLW1sNDrEV/Jski/SVQzP7IoXRhqH2r7ss3gb2KV
 Cedn0DRkUhANvnuYAZJHJ+HOIBH/M6NeMbhDzBpH8AIdeSerg/ydJIVPkfFkukud124N
 DSVI4mRtcwmzsLC5fMja4++gCJqaWcrSGzFaGg2ajWa//C8SMeU0cjY0FasLoy7dubQQ
 1u6tS5/GdAD4YEeK0RWyZTBh43+wM3eeugHldNWKU0dRfWMBLN2XQ60jPC7d2bVxQmzH
 Dj7A==
X-Gm-Message-State: AAQBX9ex/bgK4mRYInHIwJ2t9ipQi6tiAXhw1MF8JQ6P9vEs3SAkhviC
 oIg9y6ukKxY/CJ0Jb8hkOwLg4w==
X-Google-Smtp-Source: AKy350ao7+BZhKsr9AmZG6YqOpkivPKyiVoqslyt9TcMeCroCbSSbfCW0oHA2IneDtOuI2lJUYLGrQ==
X-Received: by 2002:adf:f402:0:b0:2e4:cbbe:cfc2 with SMTP id
 g2-20020adff402000000b002e4cbbecfc2mr7273887wro.25.1680789387134; 
 Thu, 06 Apr 2023 06:56:27 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:6630:ee96:3710:24c8?
 ([2a05:6e02:1041:c10:6630:ee96:3710:24c8])
 by smtp.googlemail.com with ESMTPSA id
 f7-20020adff587000000b002cfe71153b4sm1818118wro.60.2023.04.06.06.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 06:56:26 -0700 (PDT)
Message-ID: <a2b0c505-29dd-446e-ab5a-95f008254a72@linaro.org>
Date: Thu, 6 Apr 2023 15:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20230311173803.263446-1-krzysztof.kozlowski@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230311173803.263446-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] clocksource: stm32-lp: drop of_match_ptr
	for ID table
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

T24gMTEvMDMvMjAyMyAxODozOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBUaGUgZHJp
dmVyIGNhbiBtYXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUgc28gdGhlIHRhYmxlIHNob3VsZCBi
ZSBhbHdheXMKPiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRyIGRvZXMgbm90IGhhdmUgYW55IHNl
bnNlICh0aGlzIGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZlbiB0
aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgo+IAo+ICAgIGRyaXZlcnMvY2xv
Y2tzb3VyY2UvdGltZXItc3RtMzItbHAuYzoyMDM6MzQ6IGVycm9yOiDigJhzdG0zMl9jbGtldmVu
dF9scF9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29u
c3QtdmFyaWFibGU9XQo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPiAtLS0KCkFwcGxpZWQsIHRoYW5rcwoKLS0g
CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5j
b20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJv
b3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
