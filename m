Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A15AE0013
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jun 2025 10:41:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E9EDC36B3A;
	Thu, 19 Jun 2025 08:41:43 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93FFEC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 08:41:41 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54998f865b8so378614e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750322501; x=1750927301;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
 b=Aj31dLwOkcgEbqozFQhPuzS5nTP0lHwHisSBEnWz1WHYV0Y+YtlgRO6SUlH5QL3erF
 6JKhFxUEVT0eX8uD9x/v4tGmxD7fqQKaUwkuAXDxbp7k8eRUiFLW+/KqTHjhvxG3Wzuj
 233uzLMKv9vOUIfOKTZigVdon3R/FqdRJpr4Njz4s74BnGNSGtzVytk/qXI8Ua+5J+lZ
 HpRSJ9xPjhNW07Ne8xS34VjpISnyDtfVmUBHvvfMLYbj4FtywLPeR5N325WHMANiWrU3
 t0nEwEQ3o3F9D7G1cYNLdMLWGtTReZLJfVX1DhMPHqs2vc7K6EaJDj6PrdInFGbe8U+5
 cjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750322501; x=1750927301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
 b=mJacZlmGfuYCZX+wV9cscjtDMV5OmpFQo8wPYFNRNrE9u1hkmTPHk6n+Q7ZgR2rua/
 SiqFDxj20PO9WOJbiMCYeNGoIkEnZ/dwGP2Po073q9yq6cIYxDDimT0YEe84rLrZFyAk
 /PK8eeusb0HdO5NoelnwEyibkB0PMLdadRn5/uS1hK7gu6bwzJ7gvmvzyr9YTrln2J4/
 bRbQAr8GKm+7Ju5ouBRp+ya5uuK32oE9wt4JBCJLnucuJqamresOepxw7CLgq4cQEO43
 cITXxCaxDu90GJPpGMioQ8Jpdc7OUFfUkecCT2LkAuO7OnI3DyeZ11D0rKPXynA/OnoS
 4vUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb41cXkKD79msIXvr5z135a9klfGKCh6/FPFclF6n4m5cLNVA11cyDLm+B8DFe3admTqP0XlM0IJBaZA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYANQBFRZfaizHTRn5Ertguw5zOUDUfTcI6y7gPgWgYhRS74KN
 BWW9GRbU9UoNmazlYy+Dn+Dg8aVycNLizjCA/PncakSLISGrC4XXBtyKRF8Xf/hGBhHKc8JyAR+
 BWeYbr5HcaL5PJ2MkH6v+zCJemWa0LZBCRt2BbSwidQ==
X-Gm-Gg: ASbGnct7UGnJ+XOKYSQpo92BMuUVfCjnXMnDyYPD/xH1TViVoclPDvSFYZHpzvOZby3
 ugfwezt4kIAcyDL9kDLgb7M+CkZBxQotFkY9BSApwC9GqXROnNB9g4PPgYKXANe44vYyfOctBdw
 6z2NeAfvWmYEYwWkQWvQfH4rZleAUnijsGv6gIGsOZaKA=
X-Google-Smtp-Source: AGHT+IHVGgFPaQG0OhPXqsCqY9LUDkKPUDQE3Jy/DgzWX341H6DxvHpFRsv8n2zH9CF8v26QIPfqbwftMAeHyo7UZV4=
X-Received: by 2002:a05:6512:b9e:b0:553:a64a:18b0 with SMTP id
 2adb3069b0e04-553b6f3ed33mr5548057e87.42.1750322500571; Thu, 19 Jun 2025
 01:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
 <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
 <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
 <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
In-Reply-To: <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Jun 2025 10:41:29 +0200
X-Gm-Features: AX0GCFu8Dbo5pcDv8ujsp9IKLDaddp4Y2N5p47cQpThWdtIAL2mf912Bw-JLnyM
Message-ID: <CACRpkdYNRC14d-jBbJy9-0OfdXR2anUJ6osw+DWsLNPf4VymnQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 0/9] Introduce HDP support for STM32MP
	platforms
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

T24gVGh1LCBKdW4gMTksIDIwMjUgYXQgOToyMeKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBTb3JyeSBJIGRpZG4ndCBub3RpY2UgdGhpcyBvbmUuIEJ1
dCBJIHNlZSB5b3UgYWxyZWFkeSByZXNwb25kZWQgdGhhdAo+IHlvdSBwdWxsZWQgbXkgUFIgZnJv
bSB0b2RheS4gU2hvdWxkIEkgaWdub3JlIGl0PwoKWWVhaCBpZ25vcmUgaXQsIGxldCdzIHVzZSB5
b3VyIFBSIGluc3RlYWQuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
