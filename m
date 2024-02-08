Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C266684E282
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Feb 2024 14:54:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7301DC6C83F;
	Thu,  8 Feb 2024 13:54:21 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 503CDC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Feb 2024 13:54:19 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-604a184703bso10582687b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Feb 2024 05:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707400458; x=1708005258;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sAPBOJTqt0Eux7mZyQPffvBf26VAhOH69akvvfeddOw=;
 b=k9LBkpATX85pBi/xNvolbJslYQ2er8CPpTXMqPBXvXlxbFSyt4ppW53voqhamcuKYk
 Ap/mPlZA1FL7LpXTPQT1WGK8xDSd2XSXSZjeracXTetXSAODc3qFMMIJacEOiHE+FHkj
 nIj5ysxaOzDSAQKzLLHgXksE/XQq6SWNIcSdYBmHCcQS1bNnCE01/J80vR1UapgG8m/u
 fIWE2Hc7ZjuqVSGWf21cTicIiUkZ29USxVJNii8dGV8tMYxIXZGAb9Q/xfxTyzDwh/7h
 BQ5veIv7jFs+9p+KAeTGwL1P6x4bspk6kCgMk6LhvveLw2N+vSUhGp5COlkfqTIQWtl6
 vrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707400458; x=1708005258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sAPBOJTqt0Eux7mZyQPffvBf26VAhOH69akvvfeddOw=;
 b=XYLz8hzjV2qMurNXUj+3al5eXfqRYx2Ur7LPJCHAn/Nj90EHZkFlFtG+YrVFM4Clsz
 7vt34Yqg1KVoAOsEWTPIfxVGIxMefHuIupD4jNNoc5Tcyl2Z/mMA+C2bK3S8EmSbiFZ2
 vSOJLVd1s1rf3Nw5xK/PuIx4ApvBVF9iJV2VqdvyTA3A9kOEtzDO+eYL0GkkyEdkHKHr
 owvtPAjvnTyIqPbQksA6eZDSaa/YQpnDE/17EpcKPUk1Nl2PGlFd5FHP+MXJopaB1mis
 lIMwzxsl/BQLUq3TVvpFRKUJDH07RG+kdjKkToiHe8H7itW9hmrBtoHXed6bj2p07n5s
 7G0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIJqHIUQ1smslgVz+Rno5NU0JIVYGzSm6kejHcsLJSRCarZiwN8PraI82Ilc4cj57Ao0scTPxRniLZ892An+8ITfNJ/crXrepFf3lSNkiGieimG9ECaGOy
X-Gm-Message-State: AOJu0Yydb+P+WOAvdXKPMT0ubcMFqZnHbYDgj7kpUjf3mZjSipgp18bI
 WOu5s1Mki/AkzCjfvGWltdDHQga0DSNj89ZR/ll94MWpoeRLlER7urDsTd909EI3TBaeap19H+u
 6OF0q6lGjigZSmoMJAp/u2W/gi0JiCDCsTCa6ig==
X-Google-Smtp-Source: AGHT+IGDiOneyfJfxmHJsx95/Io/iJWK5Htw1Hg2MZmkBm+216Ld2xxxMuBHMFUPV7I9NJDT+pGjYE+Cddkb3IyflOI=
X-Received: by 2002:a05:690c:f8a:b0:603:ebf7:947b with SMTP id
 df10-20020a05690c0f8a00b00603ebf7947bmr9533612ywb.48.1707400458134; Thu, 08
 Feb 2024 05:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20240207104604.174843-1-antonio.borneo@foss.st.com>
In-Reply-To: <20240207104604.174843-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Feb 2024 14:54:07 +0100
Message-ID: <CACRpkdZ=Lf+Db7-QwM-X1RqqRJUNH20Yc6tJYjz9DK4RDxP6-w@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: fix PM support for
	stm32mp257
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

T24gV2VkLCBGZWIgNywgMjAyNCBhdCAxMTo0NuKAr0FNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFRoZSBkcml2ZXIgZm9yIHN0bTMybXAyNTcg
aXMgbWlzc2luZyB0aGUgc3VzcGVuZCBjYWxsYmFjayBpbgo+IHN0cnVjdCBkZXZfcG1fb3BzLgo+
Cj4gQWRkIHRoZSBjYWxsYmFjaywgdXNpbmcgdGhlIGNvbW1vbiBzdG0zMl9waW5jdHJsX3N1c3Bl
bmQoKQo+IGZ1bmN0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9u
aW8uYm9ybmVvQGZvc3Muc3QuY29tPgo+IEZpeGVzOiA2MTlmOGNhNGE3M2QgKCJwaW5jdHJsOiBz
dG0zMjogYWRkIHN0bTMybXAyNTcgcGluY3RybCBzdXBwb3J0IikKClBhdGNoIGFwcGxpZWQhCgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
