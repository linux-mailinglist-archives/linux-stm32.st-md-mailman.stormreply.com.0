Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270EAF82EE
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 23:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C812DC3F959;
	Thu,  3 Jul 2025 21:55:31 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 481A5C3F958
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 21:55:30 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-553dceb342fso374632e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Jul 2025 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751579729; x=1752184529;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
 b=gSnvhFhRJv4DxnRVYUHeTuvrO3z+OrooCa4YP9KapYpAMXLQIYMaR71DOXAxBKB7Ez
 /bjkmyKS1tYCrTz7td0bw0Z4+l/WJX7jnJrKqjfIY27Jo68l7moeQzI3/9Ta6Tp8MWlg
 J1sMfY+p9nwqr/cTJaFn920jfJ8DU5KZAbJvBM/kv8GqKWrQTRUNZ+1uLmINfwmD2tda
 NlmNKO/MzbB48GUIICUuwuWCMMHqsT2cJe210gXqzamG3RY080HDWzixR6gD/LjQtmc3
 1WimVSaNKkml/9M9sewAiYWJ7fmtgGqmGZK5WuA2O3/TyEBE7tLghI2d2LGmkNpdNotI
 HbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751579729; x=1752184529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
 b=oN5P029OstGaUrRrmHMDKaup3pz2z4/2KAsVlQ4PrnTkc5IXQNrqxctQ/2XT/sy6sc
 FZ0f/5tHL5NFissKOw74vbutFY5kJzUtzxnSAeqMX/TvhT84VYrJLXfwMt98OKAiBBP8
 IxvFpvJ2LTKUCPA4EsHfA+XF7fkJG/zJ8g9BiHG6qJcwe9W14FnIsoOhZIWo3jXo0ucd
 Glbo3iqKSn7w2SgbqO3KUzqA+xSo5Vot7OMNkZyDdclISnmcUrTn58ZwOX1qDv+NGHAT
 KDPKZ3htxGyS+RD194rNKQrHvNFa0h5T8THY2HJaANJdjHeYQ0BYzg0EN+xcYI3fwOaF
 JCuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq66YZOSrzd7r6n6fO28RjPAIBo2JusVsgxWd6GD7dJ70Q631GI39brulhl5NBRSSMGWnJVSnAjSD38g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdbFEQJE+LpYqU69p7KW4cw6V32MyShPGAGPeJIUsr7ynS7dDY
 xX+xpZvdUpk69spJV2fqLjLS+vlJaj4P+1soyK3Crm6Lz8DRmR3eDerAX9VRQBwOFgQS8egTtXW
 UFd28vBPCfudOW26fTh+gR2cdv+SM/OgAgoKN0ryKCw==
X-Gm-Gg: ASbGncu0dv8P8P81Ihgp9SvquiNsd1+7PQ/5+lrvPL1yNPsqXwKhUywd4CGkRzAOmfE
 amzR+N9XlbG6dxMgUL0+sS+3S9q2eWPfeqqX7UExbi4NmPIEFkFVL2wAGbfQErWRDSkXXud2qM7
 61rdEOQxCkjSb7WvZKxdL4orUcZRS09OVKOQNrSqtA8FAjYZDn+j9wnA==
X-Google-Smtp-Source: AGHT+IHy+6VU1NwR5hSQKpWzK3RCXChUuB9Un+z3AYwhqdaiRedo471AkDhodxUcy7i+LlhTDM6edhCtprSC1oAz8MQ=
X-Received: by 2002:a05:6512:ac1:b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-556dca2b8f1mr22283e87.15.1751579729319; Thu, 03 Jul 2025
 14:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:55:18 +0200
X-Gm-Features: Ac12FXzOS746MKEQ8T_6q3redzT1OE7J4o6V1m0jt5q39x7cc8PQ_RL8cK-Gjdc
Message-ID: <CACRpkdYgx-XGu+yg1u421Pwb8o+7OW7xBgCkcP1KUzRUz6dUuQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/12] gpio: stmpe: use new GPIO line
	value setter callbacks
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

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMTI6MzPigK9QTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiB3cm90ZToKCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Cj4gc3RydWN0IGdwaW9fY2hpcCBub3cgaGFzIGNh
bGxiYWNrcyBmb3Igc2V0dGluZyBsaW5lIHZhbHVlcyB0aGF0IHJldHVybgo+IGFuIGludGVnZXIs
IGFsbG93aW5nIHRvIGluZGljYXRlIGZhaWx1cmVzLiBDb252ZXJ0IHRoZSBkcml2ZXIgdG8gdXNp
bmcKPiB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
