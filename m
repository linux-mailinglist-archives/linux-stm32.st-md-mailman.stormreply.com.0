Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA7AB02421
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 20:52:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9A33C3087A;
	Fri, 11 Jul 2025 18:52:11 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4245CC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 18:52:11 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-717b580ff2aso22203897b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752259930; x=1752864730;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0H6HqwurK8du4Yig7CnNYD3RLplnogpWij/DKV6wnM=;
 b=IJzRIyG3ZKeh8GZGavMq9s9tYtdoqwT0pt91GUFh9dmmQ6oLuD83P+6FkNSxHBOrdo
 uDHC3Wrs/TPrqdFeW1m7znbwGeLbjtl/fDxOAX5MbtQMkAu3BWpNnPU1nzGmu72C9Uv2
 l2wjpvNSqAf5DFHS8i6aI2EeIcwVYBFN+O2pHTLVSP66kbC+PK+iy5MGisawK9P0FPei
 n3pU/nZGunRA0MYESrAoXJOuxZfP73tz3rkP8KgKkWmYExSYQiaZjeqUa/C8ZPTo02gy
 EL9oqibCDcuETLksHoeEoOc5QfM07YR5Jylc6NyNdWW96DFLW6jeEslesJB3smfH6Aqr
 2LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752259930; x=1752864730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0H6HqwurK8du4Yig7CnNYD3RLplnogpWij/DKV6wnM=;
 b=JY1YfZUUTxGnUgcdDqjrc1BKmkYtynP+U45cRQ1KYvseWx1WkDZdGDHPBI2zeOsXUZ
 BZiZAyfd0LkIWtCu9+sOtrhwxFZDGUlqFV3YiEEI20XBkEEyJ910b14ziyBKh3qKxGmM
 wOR0mKlmXx/PHmx1KNUkRCSge2mAlZiB2OXWr7GYdxTaHzc3OZpK0IfOuYwewn9ESE5i
 +oHZnN3rDUsGmSd4x52wAUA8OiZmqyHoggpAmlq6UWiSXCvnxPd/QznGQj3SUgqf5XPz
 hpfYsxhAVWSqXiPWPAzwSvAsWU8Ta1LoU/uJOuviiyT4Iygv1/YswlawM4Tw9qW+1FS2
 85Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgWM3pB+oPW+E2OlMsRu0VXN1fzvWTpwtR4Af82/eiWV6n++H97l9iLTHvAsldqou8rApEv3JDxAjBbw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyalFJcU88TY2hYtS0KzONmtxGxHiiPblQpJKpj1D0R5MsMSix0
 dw8oNSzfKpRv5ZvlSrcszi7353lUr78IiXpNr7iWTgddH6ty4HOw1vHBO2abSNxERIyICQtGqN5
 DmtIJmi28ZdV4pjbzhQreQL+SutAtrGqvRzrFZ0CTYg==
X-Gm-Gg: ASbGncsbEw0oMu6uDpc+XhUnuGHD3ukpQhi0MuZ7Nq9YumqAf2uvf81gU0Y/qUO7Noo
 3tuu1mdGNtXsu5fqOHa/PC9FJhBNB2OGm/3fHsTQos0utPZyXQly/K6x5qTVfQhLvJjEEsEfmya
 dmysPwF+QOWBfh8SufPVA7NHBB9iitdNP12caut367er5LFdNLZaFhql2aBMC0jRrfkz6fJbQ1X
 C827UY=
X-Google-Smtp-Source: AGHT+IFufbqtAPFq7ox05U9WlMb90rIorTP+4zmeOZAsbdsvZ9oDhtS+8uVsO137m7BSFuFbQhKQyBmLxkmw/Jfm0ww=
X-Received: by 2002:a05:690c:6ac2:b0:70e:73ce:80de with SMTP id
 00721157ae682-717daeb302dmr49577697b3.25.1752259929914; Fri, 11 Jul 2025
 11:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
 <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com>
 <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
In-Reply-To: <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:51:56 +0200
X-Gm-Features: Ac12FXxNxgzgzDBEHJS_Xpef7MtqDivB9Et0gKV7kxfFrSfbv0PvRNxLHxkuJiA
Message-ID: <CACRpkdYXQRGO7BrF9+08StWyOkDoqLhNQdgk=bhoccg1BogpqQ@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 1/8] dt-bindings: pinctrl: stm32:
	Introduce HDP
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

T24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgMTA6MDTigK9BTSBDbGVtZW50IExFIEdPRkZJQwo8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+ID4gK21haW50YWluZXJzOgo+ID4g
KyAgLSBDbMOpbWVudCBMRSBHT0ZGSUMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4K
PiBPb3BzLCBuZWVkIHRvIGNoYW5nZSB0aGUgbWFpbCBhZGRyZXNzIGhlcmUgdG9vLgoKRG9uJ3Qg
d29ycnkgSSBmaXhlZCBpdCB3aGlsZSBhcHBseWluZyB0aGUgcGF0Y2guCgpZb3VycywKTGludXMg
V2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
