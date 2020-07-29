Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B0232C72
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jul 2020 09:19:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17049C36B33;
	Thu, 30 Jul 2020 07:19:58 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96CD6C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 17:46:17 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id q75so17283278iod.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 10:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vL2EiXbptWkb+CeJ1aIsaGaoV70y1mT289hYeI0vTkg=;
 b=Pf7nKXdGqrVr1RkAz85fBJsu445+W+MUqnKlS7wvsWqPMO452kHEujmP81SJ2ac2bL
 GWC1J1h8oaCzKyxX7XK0ItTcmK31ixIteOA0BSX4uj+twuZdQpmi3po/ANKyEIYDbmn8
 EMdDl5xm6ZzEU/zfhm66lMzsaVChyR/LeQVY4PLxaz5HhQ7faPp8RLNd1F/bgLCB0qyH
 vH8NwBOTEycRR1UyELKB0AC7Pif05craVIlH+T4owJgFn7exkibt5z8R/Wu0eXaXC1D6
 8Ca2pERhmJdQ8UandVs4rt3pFeYa37PMpCkubj+L/ssLWtvhmzGKkpxEF4iPtQBqG6NQ
 9tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vL2EiXbptWkb+CeJ1aIsaGaoV70y1mT289hYeI0vTkg=;
 b=jP5L/IXd1L49uJsb9AOPCnO9oV+EVfvzadv2p81SMBvtYPmmxBbT64ENq4cRh2D1Kv
 n8aVJEEAEgQw+Tm2GLOXs3cX5h7o6u2la1JszcBzCRmXVuMd5YTDrq5zlUgMcmJ7/SbD
 G1Yop2bku7vmKuQmOQyE9IpM3xqzPhmk6BexE0TZcYDzVZ/X3+24uXpCfB8G549Q/mV7
 IbFlLpn7HnRkMrdx0i73KjXfs4cMAV98NwYUfKYq0vC/Iv0MDqABTKHXppZAZs1NM5HG
 J45L0r+dsl5/HQC7kGDZKaoRgiqJ2Wz41RWxzsAWs/p1YVGSASkvylsOrCoa5Eb1LxMF
 p4og==
X-Gm-Message-State: AOAM533GToESDiWGxWU+02vGjRACRDCv3LUCs9FUbFtrwQgtuVs6shbG
 yf/E/kRea+/VskPaZuXip8D650uXwUD4AUBnOXA=
X-Google-Smtp-Source: ABdhPJwZMsvcOsBvVWQSB6Ahydqr7L806TY0co61XGVRpo8vp0muMNJkqI8HcDgdalYRhv7rGELQFoCQfN7UP/aoQDc=
X-Received: by 2002:a02:ccd7:: with SMTP id k23mr24083657jaq.73.1596044776435; 
 Wed, 29 Jul 2020 10:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-3-krzk@kernel.org>
In-Reply-To: <20200729160942.28867-3-krzk@kernel.org>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Wed, 29 Jul 2020 19:46:04 +0200
Message-ID: <CA+Ln22EMWTRu4j-6b5Oj63Yvo+GYa_cB2+QU-h-woQ5G1K5DJw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:19:57 +0000
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Cedric Roux <sed@free.fr>,
 Russell King <linux@armlinux.org.uk>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 Lihua Yao <ylhuajnu@outlook.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Vincent Sanders <vince@simtec.co.uk>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 2/7] ARM: s3c64xx: Include header to fix
	-Wmissing-prototypes
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

MjAyMOW5tDfmnIgyOeaXpSjmsLQpIDE4OjExIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2Vy
bmVsLm9yZz46Cj4KPiBJbmNsdWRlIHRoZSBzcGktczNjNjR4eC5oIGhlYWRlciB0byBmaXggVz0x
IGJ1aWxkIHdhcm5pbmc6Cj4KPiAgICAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L3NldHVwLXNwaS5j
OjExOjU6IHdhcm5pbmc6Cj4gICAgICAgICBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICdzM2M2
NHh4X3NwaTBfY2ZnX2dwaW8nIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgICAgICAgMTEgfCBp
bnQgczNjNjR4eF9zcGkwX2NmZ19ncGlvKHZvaWQpCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvYXJtL21hY2gtczNj
NjR4eC9zZXR1cC1zcGkuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXMzYzY0eHgvc2V0dXAtc3BpLmMgYi9hcmNo
L2FybS9tYWNoLXMzYzY0eHgvc2V0dXAtc3BpLmMKPiBpbmRleCAzOWRmYWUxZjQ2ZTcuLjAzYzlk
Mjk2YmIwZiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9tYWNoLXMzYzY0eHgvc2V0dXAtc3BpLmMK
PiArKysgYi9hcmNoL2FybS9tYWNoLXMzYzY0eHgvc2V0dXAtc3BpLmMKPiBAQCAtNCw2ICs0LDcg
QEAKPiAgLy8gICAgICAgICAgICAgaHR0cDovL3d3dy5zYW1zdW5nLmNvbS8KPgo+ICAjaW5jbHVk
ZSA8bGludXgvZ3Bpby5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGF0YS9zcGktczNj
NjR4eC5oPgo+ICAjaW5jbHVkZSA8cGxhdC9ncGlvLWNmZy5oPgo+ICAjaW5jbHVkZSA8bWFjaC9n
cGlvLXNhbXN1bmcuaD4KPgo+IC0tCj4gMi4xNy4xCj4KClJldmlld2VkLWJ5OiBUb21hc3ogRmln
YSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApUb21hc3oKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
