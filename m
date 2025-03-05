Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D26FA50643
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 18:23:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2DF1C78F68;
	Wed,  5 Mar 2025 17:23:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07A3DC78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 17:23:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43bb6b0b898so34793825e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Mar 2025 09:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741195387; x=1741800187;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=alT+zALmOJxTVW5BnA8w1UfBmWenGfChKrkcnTMAdpQ=;
 b=CqXNCANlh0XtbJZ8feiyAkAMZprYe+gY3QI7YLfc3thA5daP9JDm7JJDkx38iXfnme
 3ecjWbo4eYFEMROhTBXvqJidAoTAq8d4irVzGMgXFqBIwkj9V3AbRUp1N1rTot9I7ZXK
 Jnjs5ouRtianN5mh+NFGiKXUMdysMl4oGbx5ZKu4cbdKL6RP1SsOXt1YziwkgzaA6x60
 blh56BDFmZAsAzyh4kXuZcO4kkXMigC4CNUEY7kk9Cwv4ogTMd4vJKhaP7dgkQVXYIoN
 i0rO1isripyM1/uZf88nTPBLItbS0a/cZPGQ1YxptSY+wcl48T5xe95tGUnfQpwhPfBO
 UpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741195387; x=1741800187;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=alT+zALmOJxTVW5BnA8w1UfBmWenGfChKrkcnTMAdpQ=;
 b=sF5nS5uCUZgFoqyt8935dCl7mo0yvSuYlP6P/aWydYw1ur9MJvJdq8gV9GCry1zH0y
 oC77vCzxQ5vwdNr7A4fH6LPWSpzfvEljFTlowjERtBOARD904+uqfsaEfjwfgq/pS2Zu
 DDszphqX63npiWaHVG6aDfne3ZgoZFyc+viCtwLGMPUDd6qACEjeTuUGes2Pi9YjGx4Q
 WEnYkDX1gdjkwhCUm+fDcQ03V6NQ+O7F4v5mTTsqDXmmsNMw/8pBISlkNkJrwj7lS3Ow
 p87UzZx7TPQCLmeKWy7sGymOITLLhMoKRyTGqt9sf/QiEZOXcF8Tei9I+PyHpJcb9ZKP
 belA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEB/QBxwIVeC86LRFVmPh/zg+fEhVUEsmgVFOegl18JDivCDaZMQHD/QurSR8F3dhFZ2YK4DRgV2pLfg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxO5Gypk+H65vFdYF3/LQdAgCFgChmbOZGLpEnlB5wqYelrTvr7
 NLitxFLLSZfDHwnuyPXdFJkKp2XzJ23IOLG97i4kfj7vZp38P86aMQrjXKQSG6k=
X-Gm-Gg: ASbGncuszgwpgpMKrvg3VxNVPlsx78DgFThlbkTc9U3rgdaIEseFbJ2StTc04jDPxkA
 dX4cbPah8aQmfeZ9czi8OlT2+9jyjGh5+jcKluIZjTa7JX6Lt4VYRdVSbxy39NZazHkKiaHGx0h
 q48K+D2tN1nEz7SGIb3hrajFS4k+ypUxGshxzYFW38A8aVQ7QB/i/7itIC07jblvbbDxHBqJZXp
 sXmUoUxp2Nu9f33ADZDuHSWChQwVzA2d2jwqD73N8/sTJjFLRq8U/N1AMbRa/PeJGhTuNNRiLnY
 cyKJpCu5V3wJl5Bkf/cwhp0QhelRt01yhxRXUYCGFUGYSngKwW7Fa/XUNc2znUNNqjMJy5ffUfT
 Tb6IY0DJj
X-Google-Smtp-Source: AGHT+IGpqFVx176QiSlOJSi7wc2dopFl/WDHZbSXP9T991xV1xy9GzI6/Dnmfiz+XboGhP5rub1OWw==
X-Received: by 2002:a05:600c:1d0e:b0:439:969e:d80f with SMTP id
 5b1f17b1804b1-43bd2aefa41mr32049945e9.31.1741195387395; 
 Wed, 05 Mar 2025 09:23:07 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43bd42c8050sm23402385e9.21.2025.03.05.09.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 09:23:06 -0800 (PST)
Message-ID: <a7489f16-ca31-4530-8ef1-33079b3c99a9@linaro.org>
Date: Wed, 5 Mar 2025 18:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, tglx@linutronix.de
References: <20250305125146.1858978-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250305125146.1858978-1-fabrice.gasnier@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] clocksource: stm32-lptimer: use wakeup
 capable instead of init wakeup
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

T24gMDUvMDMvMjAyNSAxMzo1MSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+IEZyb206IEFsZXhh
bmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gCj4gIndha2V1cC1z
b3VyY2UiIHByb3BlcnR5IGRlc2NyaWJlcyBhIGRldmljZSB3aGljaCBoYXMgd2FrZXVwIGNhcGFi
aWxpdHkKPiBidXQgc2hvdWxkIG5vdCBmb3JjZSB0aGlzIGRldmljZSBhcyBhIHdha2V1cCBzb3Vy
Y2UuCgpJcyB0aGF0IGEgZml4IHRvIGJlIGNhcnJpZWQgb24gPwoKPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+IC0t
LQo+ICAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdG0zMi1scC5jIHwgNCArLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYyBiL2RyaXZlcnMvY2xv
Y2tzb3VyY2UvdGltZXItc3RtMzItbHAuYwo+IGluZGV4IDk2ZDk3NWFkZjdhNC4uZjA4YmFhNjcy
MGY4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYwo+
ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYwo+IEBAIC0xODYsOSAr
MTg2LDcgQEAgc3RhdGljIGludCBzdG0zMl9jbGtldmVudF9scF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICAgCX0KPiAgIAo+ICAgCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jv
b2wocGRldi0+ZGV2LnBhcmVudC0+b2Zfbm9kZSwgIndha2V1cC1zb3VyY2UiKSkgewo+IC0JCXJl
dCA9IGRldmljZV9pbml0X3dha2V1cCgmcGRldi0+ZGV2LCB0cnVlKTsKPiAtCQlpZiAocmV0KQo+
IC0JCQlnb3RvIG91dF9jbGtfZGlzYWJsZTsKPiArCQlkZXZpY2Vfc2V0X3dha2V1cF9jYXBhYmxl
KCZwZGV2LT5kZXYsIHRydWUpOwo+ICAgCj4gICAJCXJldCA9IGRldl9wbV9zZXRfd2FrZV9pcnEo
JnBkZXYtPmRldiwgaXJxKTsKPiAgIAkJaWYgKHJldCkKCgotLSAKPGh0dHA6Ly93d3cubGluYXJv
Lm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoK
Rm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZh
Y2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0
cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
