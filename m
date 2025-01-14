Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3637A10671
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 13:17:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F93BC7802D;
	Tue, 14 Jan 2025 12:17:23 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70664C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 12:17:15 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30225b2586cso58934011fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 04:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736857035; x=1737461835;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
 b=GlrXb/bOteL3j72nQjP3+YJPF1McUZ3L01k0qfBn3qqGe+XW/aU1ETNHTKIV9QrPwT
 /L1ldb4mBLSGsw7W+v/UVQZj8/Io9nuqDpgiFg9C5PePH10PQwYXEjxr+H7jRwghOPvZ
 hajypRoTU5f8ksfumZw+WaPbPVcVcle6UaNbDnP8sN7VNPL/BujaWo1i6XE96nFueJ/w
 3FArNegDWK/Z7QRWstuSrc9y21/uFDoIla+SqQnmIzjBzlIFt+sLlKAfSbGvinxMAqCb
 Smhx+vOla88DE0qiURQOMru8UoIASrdvRZE7iYxMKuY34ARC8KPHQRq/XdvDEC5vQYmO
 XN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736857035; x=1737461835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
 b=NHTnVoM/1s23oT2+A+aPpj6kO0glMz8EQgjRkG66IoyHNY86AOv+/YyBhqjKDB5zN4
 J4xmPgfXxQYg9EosC9Sv9ujn1DwjWGtoZ50qg8iXijrXaQOvqAGPaT1PRv9f8f737s1I
 tQaamB5PHFJ7Xy1jtE8Urm+4INLGCuVOa/qcuuiRBDkQIHooFytefmphuN6BuMmRMgG6
 g5/hkK5fomsNEEy622TizIPQZorOrxoUF7IKc54QSs8Bb2mNql2NiEZBUb5RyPpQEZt2
 lRTntW5kXr6xA4BfOx4laud2WvFP8buGj56o0r/+mB0Ea6MC6LYLmA653rjcSC4Fi5Bt
 MsWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSQZszsq5ts/A1eAbGOgg/7MD8hNB+ia2WZs1VZIwXl/8NJRqWNYKLKvWYjRzIHmOmVXc4fsE8MRA5jg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6U6iFROwgPNryzNeIj/+NZhBlA1NlCwPLW8abPUpWj08CcCJ7
 8K7mESzYN8cf/Cp+4oDBAWjkU/sLphrGomnmXOiJHsYPXjtHgF5tZ2vKqjXWWzkAC2K2x7ZkNUL
 8hfAWkkg8gTQxJPBQ9T3QVVgdLy7HTHPs2i20Uw==
X-Gm-Gg: ASbGncuMNDbFgL/iefkToNmZ3rWHxE3bWbh0xcn+A0b3IM+Mkz/tLn4tma4RGPQa+xU
 Qg86++BlpA0rdmsYv06tdHApM7AX2WaqGvY0d
X-Google-Smtp-Source: AGHT+IG/nVzJ4usllSB7WeL3esJ0/+hz1rQx2YNWDFn17mueoKalfz6Uj0tzGOzfhZRqk49pDpDqslNG3Jdx7c4EaqI=
X-Received: by 2002:a05:6512:b97:b0:542:986b:de08 with SMTP id
 2adb3069b0e04-542986be0a1mr3961478e87.26.1736857034594; Tue, 14 Jan 2025
 04:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
 <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:17:03 +0100
X-Gm-Features: AbW1kvYSSgagqOIiggVP1rEX84eySXcyOvS8Yel1NcZ50o6oIQlw1NaD7KnQIZM
Message-ID: <CACRpkdbFtLhGXwSbCF+v54eEdm0w=sDsseUPiRfc=xmak-DbhQ@mail.gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-rtc@vger.kernel.org, Len Brown <len.brown@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 09/12] rtc: pm8xxx: Use
	devm_pm_set_wake_irq
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

T24gRnJpLCBKYW4gMywgMjAyNSBhdCA5OjQy4oCvQU0gUGVuZyBGYW4gKE9TUykgPHBlbmcuZmFu
QG9zcy5ueHAuY29tPiB3cm90ZToKCj4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
Cj4KPiBVc2UgZGV2bV9wbV9zZXRfd2FrZV9pcnEsIHRoZW4gdGhlICdkcml2ZXIucmVtb3ZlKCkn
IGNvdWxkIGJlIGNsZWFuZWQgdXAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5m
YW5AbnhwLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
