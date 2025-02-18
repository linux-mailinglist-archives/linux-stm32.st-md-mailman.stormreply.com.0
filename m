Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD5A39C24
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 13:29:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16113C78F8B;
	Tue, 18 Feb 2025 12:29:25 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E424CC78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 12:29:17 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30613802a6bso55951681fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 04:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739881756; x=1740486556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h+VJIQ0ApMIfEX8niiA/w5UOINZk4mk6qd15CEV+pRs=;
 b=X8sMLlBOUhW8DDechVUx/ji9LJbAEc3Ypn2tSY0z5eNsp+PSf4yhckzMt0y0+Zp1nS
 BW/Ay7tF64CWJYj+j+fvo065wORCsfeC4kGr9uYEuHrX2jjHfvBeZ5OLoY3Ja0k0eieI
 pBmZLEy/uAvP0B9JaOuOyGV5TqOZbgOX6vakd1SYmLYCvmMJGGWKYXbvwfRKuZzPE0Au
 SN/t3peUsIrQoKd2v5SUpRCVbWVL3BdS06nMKWwoOpwZlPwDASrqgvvbYXnJ4vMdzH6W
 Gxy+JTHlcONtHahK4qwebGR+psVv8CRgMRwpB38Poj/vykGjjBC6pcqW5FlgG9ZpwM0m
 dMhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEn7G3lsfmvBoiHVflTocjs8XpgO7Vn+LdwCuzzHKjjdjGa+g+/Vo3x+oA43Twimg7nqBi92YNKT6gqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJDWYVu2xhJYSdCIfPlzgAuCMYF8TAzWXQVq+fgQeb8a4dl//y
 pjJL6MZdyjJO6Ieybat2XSJzjwAvXxMFMQYL5vvHZ6PWaIAyEQsj9Z9rj2M80Mc=
X-Gm-Gg: ASbGncuMAqtXhwvfGmEUYnWaOBoZsV6AoN0+k2McSQCMjZThlDZXkdRGz6iUqZmGvYu
 k7FJHFkT3iChjOqT58XPpEGTx3znpBnwzUFsSnKP3h5bBW+OxDTXWqnyO+r9gHMsJoVxNdZ93Kh
 3zpM9ZWcQW610Zzf3eiYjN4sp1/mGxi7YZYVxdQ/zB2Y0Z6gmQi+CVWCeWbgEqEzAxGk8Ev0Oqh
 e3f9ShCMarbYj9pKx+CtBELosh3pGhU+3Sc9DYaDGa/eMpSNLPO1YOo3xYIsSYG4D/JbmsHmzwc
 48sfBHkzUjeE5t9/yRXDvftNyw/xnckOf5HkVmCOJ6ivTEDV
X-Google-Smtp-Source: AGHT+IEW7pSyNwJ3ftUbEQXBZZd9V5AC5ct1t/bSDIKI1M+gqGwyQy1B760X1A9UdI1vQHJTKGKiyw==
X-Received: by 2002:a05:6512:3d01:b0:545:109b:a9c7 with SMTP id
 2adb3069b0e04-5452fe6afa9mr4143496e87.35.1739881755415; 
 Tue, 18 Feb 2025 04:29:15 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545318aa476sm1157757e87.254.2025.02.18.04.29.15
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 04:29:15 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30795988ebeso56308741fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 04:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXJclU1X+kA+LmyUQJGS2dC3OOs8oSTJrJI8os0wKiyAn26mynf3K5ZiEPetUT7LOPd0DF0MfJJFfrP2w==@st-md-mailman.stormreply.com
X-Received: by 2002:a2e:9995:0:b0:308:fac7:9cc9 with SMTP id
 38308e7fff4ca-30927a474acmr41266951fa.14.1739881754898; Tue, 18 Feb 2025
 04:29:14 -0800 (PST)
MIME-Version: 1.0
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
 <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 18 Feb 2025 20:29:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v67xPoo-LQp9Z70yEBDXmgJTD=RvLP0tYYEXUJZr6B+Xkw@mail.gmail.com>
X-Gm-Features: AWEUYZmOiTlBF_l0MM194DGfKDDxifchVc42QrgCh8BPzRfhHgMRNbv9Q3dSaz0
Message-ID: <CAGb2v67xPoo-LQp9Z70yEBDXmgJTD=RvLP0tYYEXUJZr6B+Xkw@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Drew Fustini <drew@pdp7.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: "speed" passed
 to fix_mac_speed is an int
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

T24gVHVlLCBGZWIgMTgsIDIwMjUgYXQgNjoyNeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gcHJpdi0+cGxhdC0+Zml4X21h
Y19zcGVlZCgpIGlzIGNhbGxlZCBmcm9tIHN0bW1hY19tYWNfbGlua191cCgpLCB3aGljaAo+IGlz
IHBhc3NlZCB0aGUgc3BlZWQgYXMgYW4gImludCIuIEhvd2V2ZXIsIGZpeF9tYWNfc3BlZWQoKSBp
bXBsaWNpdGx5Cj4gY2FzdHMgdGhpcyB0byBhbiB1bnNpZ25lZCBpbnQuIFNvbWUgcGxhdGZvcm0g
Z2x1ZSBjb2RlIHByaW50IHRoaXMgdmFsdWUKPiB1c2luZyAldSwgb3RoZXJzIHdpdGggJWQuIFNv
bWUgaW1wbGljaXRseSBjYXN0IGl0IGJhY2sgdG8gYW4gaW50LCBhbmQKPiBvdGhlcnMgdG8gdTMy
Lgo+Cj4gR29vZCBwcmFjdGljZSBpcyB0byB1c2Ugb25lIHR5cGUgYW5kIG9ubHkgb25lIHR5cGUg
dG8gcmVwcmVzZW50IGEgdmFsdWUKPiBiZWluZyBwYXNzZWQgYXJvdW5kIGEgZHJpdmVyLgo+Cj4g
U3dpdGNoIGFsbCBvZiB0aGVzZSBvdmVyIHRvIGNvbnNpc3RlbnRseSB1c2UgImludCIgd2hlbiBk
ZWFsaW5nIHdpdGggYQo+IHNwZWVkIHBhc3NlZCBmcm9tIHN0bW1hY19tYWNfbGlua191cCgpLCBl
dmVuIHRob3VnaCB0aGUgc3BlZWQgd2lsbAo+IGFsd2F5cyBiZSBwb3NpdGl2ZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWs+Cj4gLS0tCgo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1z
dW54aS5jICAgICAgIHwgMiArLQoKQWNrZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9y
Zz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
