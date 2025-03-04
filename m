Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18174A4EEB1
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 21:46:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFE9DC78F6A;
	Tue,  4 Mar 2025 20:46:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 343CEC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 20:46:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43bccfa7b89so8463345e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Mar 2025 12:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741121185; x=1741725985;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xe0gNALudh5AKNVpnsc99NpQysntPABXDZxfVbJ2638=;
 b=WbHE/Tq8OF/8Z1FRu7QOtln5BS2duuz1p3XxJhBgk+r/+IdfIc6B5f9H2VjYNCxorq
 6N2pM+umD2dBeDJEKsYpsqYvkr0xutvUGTimzKwDBNjVIg8HgHsHRhQJwxaZrwJh5G2R
 vE/ujEEMhGIDch116IOo5XUTAvkJKRyjBM+5SVQZkM+g0y3LiaktItT4y/pbxcPiKWJA
 a3Rf940HKx7PyDc7AeCxeYISzEptwkFChxZdS89aKDCUN5/6jtThU57cHYu9uwqbbssQ
 6X9PsNNkcIAX6Bkr18z0wEAn4hgUhFr7ueY1WQkn2DVGDB0KfnrWtvSfDIecuxyKQx+n
 +pRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121185; x=1741725985;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xe0gNALudh5AKNVpnsc99NpQysntPABXDZxfVbJ2638=;
 b=H4rLr1DcM9cOaCOpgd341FAxASzOmAOhwISvzSuUlf5KzxaUctLAr/jXVGOnVi3e45
 Po7NkYrMrM4jiWQScUAd7jh+ug6WGTHFqW/uJD4H8G/9h8mhKLSYP+Xl1wHTO09Y42UT
 r6GQBQ4b9vSeir5nLZ/d6D2Vmqv2Fi0OfdFE7mH4o3NCq0hsVUMlULMNi6N9+/uWCeXo
 YXsgNQtKrIQrrYJOY4XfSm+Evc4R8ZAp4AcwOOU/QaIX2HQ86aKsDWvEybMsZY+C24bc
 QpX6XQlaTu3metWrsknDxUvx4pomAKwfqQxMWwNhKMngax/9GfPIO7U5Z7oKXpxib0Wc
 8chQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuL/kB2gbgwcq9aLqGGw0fT2vPYY/ZNKptvUPslwD+tJ1YD39k1Xs1yDjp/ma6gY1vwiNS1Yp7MhGuBg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxaEoUUpHou8Ya9cHXvNTDk45h0Cj1FVNdvpYqLBGBDNJnHaOIu
 QYQwsxC2wgvmd0pOykoPpWwamKFoEbxd6uORqR9vTd3FzMWNcOZj4mST7TBXY7E=
X-Gm-Gg: ASbGncsO2lnxdFKGReVRXEa17u6EzKMcNES6foVrDHnDJWvj/kqDRpPFd5ru5YmGz/k
 5oATdTZAvdOu9O4yieu6oRNGDbH33cO9s0YCN/kFdqKGoH67jN7OxGAaT5GzxT8GzvKl94b0yhR
 Gl42mb0coi+Q+23MbC1OGBS0XTky1IEolV0DTVcpobd7FBZowrvMssJiqnKnr5e6idlZJ+xYIof
 rNPW3MmRF2Imc+w/DGSaKmEiN9+qvokw26D50lphritdX/QTx5/S/zFMMcZWjXDL+p7MTZa0Ypp
 rR0mgk4fLgfLlfRJdlnzNkMRSj/Mc2PJD36hbbqG8uOAUx7zkZUi5DT5FrBH2TnRCrDigkfEQg7
 sLRvDaZML
X-Google-Smtp-Source: AGHT+IHjEcU8uO80EjIqMe2Us3DZGx4pspSob8gq93Xc/2SwZ46ezNtIGH7ewMTX9XjP3bW/4xIyWA==
X-Received: by 2002:a05:600c:46c6:b0:43b:c228:1ec8 with SMTP id
 5b1f17b1804b1-43bd29463b9mr1995375e9.1.1741121184670; 
 Tue, 04 Mar 2025 12:46:24 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43bcbcc53d3sm21750535e9.0.2025.03.04.12.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 12:46:23 -0800 (PST)
Message-ID: <e4dc9c1a-bdf2-45c9-950a-69f647f6283f@linaro.org>
Date: Tue, 4 Mar 2025 21:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, tglx@linutronix.de
References: <20250224172101.3448398-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250224172101.3448398-1-fabrice.gasnier@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] clocksource: stm32-lptimer: add support
	for PM
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

T24gMjQvMDIvMjAyNSAxODoyMSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+IEFkZCBzdXBwb3J0
IGZvciBwb3dlciBtYW5hZ2VtZW50IG9uIFNUTTMyIExQVElNRVIgY2xvY2tzb3VyY2UgZHJpdmVy
Ogo+IC0gVXBvbiBjbG9ja2V2ZW50c19zdXNwZW5kKCksIHNodXRkb3duIHRoZSBMUFRJTUVSLCBh
bmQgYmFsYW5jZSB0aGUKPiBjbGtfcHJlcGFyZV9lbmFibGUoKSBmcm9tIHRoZSBwcm9iZSByb3V0
aW5lLgo+IC0gVXBvbiBjbG9ja2V2ZW50c19yZXN1bWUoKSwgcmVzdG9yZSB0aGUgcHJlc2NhbGVy
IHRoYXQgbWF5IGhhdmUgYmVlbiBsb3N0Cj4gZHVyaW5nIGxvdyBwb3dlciBtb2RlLCBhbmQgcmVz
dG9yZSB0aGUgY2xvY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBHYXNuaWVyIDxmYWJy
aWNlLmdhc25pZXJAZm9zcy5zdC5jb20+Cj4gLS0tCgpBcHBsaWVkLCB0aGFua3MKCgoKLS0gCjxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20v
cGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3Jn
PiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
