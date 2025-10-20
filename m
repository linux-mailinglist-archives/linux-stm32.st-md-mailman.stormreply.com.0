Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E34BF20D5
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 17:18:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64F79C5A4E5;
	Mon, 20 Oct 2025 15:18:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20274C5A4E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 15:18:26 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47121d6da31so1921165e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760973505; x=1761578305;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIri8gPwCvgxzuVNcP5Ad0/5z9CcdBUeY3ByihuZDbc=;
 b=bfQxUjZJ4lb3DfwjLBkKeI1paAOstU3eU+g408M0evRkx+mcxXcQdIGb6gUisW4n2N
 qMdWMQRs8V+K9GFGzgDEXxAu6xegGQyo+d7BJlaSCR11IEcblpAsGtpunrNt0sMlvmkk
 UVnAZtjsed7y98jk7UATQAZVNvQJA0UC50Jl4kfRZDnjYTkZyBSrj4P6vsiOxjL+OYLT
 xvTmDGjIVPKOQ89+g0Djz6ssNPXD7UZ8bFFQY9wiYnniyu6tcrReeuOKQIycCrbX3MaL
 neAHc520hoqyfu1Lk4qQYOFhLbsdDuZqr0KEPS7JOVdXzSD2tP+NwHinQI8ScLTA1YKV
 GH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760973505; x=1761578305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIri8gPwCvgxzuVNcP5Ad0/5z9CcdBUeY3ByihuZDbc=;
 b=OwwffO2XdyTQahwBoGb8T/mSMKcFM12WBSzhi4fgrhdw46QshX3hfWXEnSGfIexaWg
 ImWB3zlQ2QaF72l+YWBjcfkMG2Q0yWWgOEhVrJk5ceCmck1j7GPTTbbOLivq8XVnFaQx
 UOm2V0o6ZaKU7vLl5HqrSD289dTPUZxSoVU/lTyYxci0hGoKs/U5KjZx9NXdaVwK81I7
 xiVZUWSfutdQyLyRNH/j3iRzEt4S1G8IS5Bwixa3qFGtawkI86RkQQetQlNS8/bE/3QX
 UNKvcm7hrISxZx55PeXb83wHvb04IJy0Xy/inODKL5ybL+t/G68UYcKpX3btG+3qspls
 NuKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvPx3XEVawNUZ0B0Ph4EJluLQfSK/s7ea5NUfzTD7bdBdnkmw8NPjizc9oTVSiqWfZfwa0BXpR00s2zw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyd3Tgyzyy26uZNkbT/3BG1o9pLnye9NeFMslL9+Akln8FUJymv
 ogpa+Z5d6u9Lc4+CzSUKScQy0EjDx+8p3U+a6lU1ONZuXPqOS9kNEMD6
X-Gm-Gg: ASbGncu0QpxEgHBWl8IaIh34AftBMxm+aeJzY6HFEziuxzwViDJ/ECwf3A4wf8HOyHA
 stPyM/l77w5zSCXdT8Opn83BcUWqhPUxZ8t7V5G2XTO7mvj5vBcyWL6ywLDBwIQsruWbonI7unp
 sjxb4edpbTnKLG0itpw+lblx0j5aTzsTkCw4BTQoY/24BOLLLdiciHhG4s1qO33b5LGEOFLrndh
 LG45gsf1V+bzl/SteLF7Mf6jcEa8bYNpJGtyJEw1KGVDai/flnghHll2bRvHbcltoLB0la0i/lY
 e/PtwUmusgVN1+lkcFFy4+c8HX03Xzxh6E4lLm95snV7fqDjmr+LHjgBZg5mjvH1YOapZ+8Ik1b
 CRcSIomNR21V1g/hFEa+bz02aK1HA6x1r0EyM1rRH+7evMwKiqMHscRZ1/gAQ1g4r/sUfmpzWyR
 Eo6l+1mz/CcOsKqLEC1otk3asiqbyiwCt1zeQVx2WD70NOjFDTh+XqJ8LuO6g267jeTzqe
X-Google-Smtp-Source: AGHT+IHQEYoBMcfx1b6Nsx/IivzRuTLpzyAZ455r3ZJisHcjzwPbpeFkoct3AeG4wC3jqAyj6VhBUA==
X-Received: by 2002:a05:600c:45c9:b0:471:115e:87bd with SMTP id
 5b1f17b1804b1-4711791c601mr98951155e9.26.1760973505153; 
 Mon, 20 Oct 2025 08:18:25 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce178sm15617638f8f.46.2025.10.20.08.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:18:24 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Mon, 20 Oct 2025 17:18:23 +0200
Message-ID: <5930653.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
 <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Chen-Yu Tsai <wens@csie.org>,
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: bus: don't check node
	names
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

RG5lIHBvbmVkZWxqZWssIDIwLiBva3RvYmVyIDIwMjUgb2IgMDg6MDk6NTAgU3JlZG5qZWV2cm9w
c2tpIHBvbGV0bmkgxI1hcyBqZSBXb2xmcmFtIFNhbmcgbmFwaXNhbChhKToKPiBOb2RlIG5hbWVz
IGFyZSBhbHJlYWR5IGFuZCBwcm9wZXJseSBjaGVja2VkIGJ5IHRoZSBjb3JlIHNjaGVtYS4gTm8g
bmVlZAo+IHRvIGRvIGl0IGFnYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdvbGZyYW0gU2FuZyA8
d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gSSdkIHN1Z2dlc3QgdG8g
Z2l2ZSBzdWJzeXN0ZW1zIHNvbWUgdGltZSB0byBwaWNrIHRoaXMgcGF0Y2ggYmVmb3JlCj4gUm9i
IGFwcGxpZXMgaXQ/Cj4gCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2J1cy9hbGx3aW5uZXIs
c3VuOGktYTIzLXJzYi55YW1sICAgICAgICB8IDIgKy0KCkZvciBhbGx3aW5uZXI6CkFja2VkLWJ5
OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRz
LApKZXJuZWoKCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2J1cy9mc2wsaW14OHF4cC1waXhl
bC1saW5rLW1zaS1idXMueWFtbCB8IDIgKy0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2J1cy9zdCxzdG0zMi1ldHpwYy55YW1sICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYnVzL3N0LHN0bTMybXAyNS1yaWZzYy55YW1sICAgfCAy
ICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
