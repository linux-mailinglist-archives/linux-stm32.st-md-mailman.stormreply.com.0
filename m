Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C72AF8318
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 00:04:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77257C3F958;
	Thu,  3 Jul 2025 22:04:42 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ED48C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 22:04:40 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-32b435ef653so3620781fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Jul 2025 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751580280; x=1752185080;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
 b=jM3yVZG/eCECrBrZ3/xkvKw7Ejk/DTWEwOFEcaWVYdMFkvXRW5Nkb8A+Crm4eGXrXY
 jdAE9vDLvOr9f4AeXAfWqF/yfTZLA/igo27SGR4z71ZxtUUSmDZB+BAyRR32lbw+kgye
 wxZQDRc8ENQaiEJoAH+NQ213hLS5+Ardjr2NzVKdJSXiRTIQslngjfbs36WXYs8ZZJCG
 95B9NjuIvG1LuiBAGqL9ri2P6izJWiFIyI443KrqfIpaKbqIGMS+UPGd+uz7ezVGii/m
 3KFz+wLjeuD+Duvn1P+8Glmx7D02W6l2pnrzLRumt3VlVSjGCA0NZvMP80/u8iDqQZO8
 R+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751580280; x=1752185080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
 b=eGTa8dj7HsEXM/+SSM2OCtkCCQbKkNZJMKltff+CYLUw2pQHoniAagi3OszCEcw78O
 C5gNpohUmR6V0LIf/gcqz39guxVPVr1CsHFNEAfJU5IiJfMUpmyWDHgRQJU1t5G0Xprv
 gYpDquM5bmLZykr2i0oR17GjYdosFqc2gSQfi3cOJLWN2FKyM7P44mMzbqYrvlzLcjCW
 wGw4ujwWkDJpQgkMf+zhwOGhrDJn6Nu6vSUbgH/WCUV0M7EXcE2UdI+uyt7o6gGPW08M
 laiWcW6dxnbTk4t95+KQ0+R7eeGFTfRykADZXuf8294hjayTv1A1ZyDJu5H1HCqMJf76
 qlrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSfOwzN3arvDqgudgD0woBiokfPZAHDzBGR4ig/eK1DWp6uPm/wrllvzus6iXAUtTy6h9U71zLZRqy2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywjd01EUklzHjqXmo6Y5fiIc0ZHjmJAUMa/ymFP3lOIYeYUv4H+
 j8GeFEXH1UCxydaLfeilihwgBK4y/Bc+/V1xhRGf++55+S8mvG8QfZiOpfYN1/KT1UIpw3KVH9l
 4szBosejIpj8zLP2uSgSfaO2LexCRoQ0x0i7n5A0iOw==
X-Gm-Gg: ASbGncvbccoM/rNzqmydsOos7AH+K0gAodpALa42jeGWc1k2pSyyorLzJqMz8BrLL1Y
 tEjGFQCOxuQYSDSkZmsR7pd3kePzQneNmwZ3gEs5hSRVHlGkLMY07jZlfTgSE3U2QHYKlX55pby
 FPLNjfNZEG2sXmgz/hRNMLfRPWtH21R8o0mi9MQmDRv8E=
X-Google-Smtp-Source: AGHT+IGImGMP5Fq/y4gpdZAXe/bNUj9t48oLyRIX8c3HTSvwJygjhM/8i/8L71e57dTnyWSS9tDnQTa49ULtKebAmMU=
X-Received: by 2002:a2e:8a8f:0:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-32e5f581285mr443871fa.10.1751580280107; Thu, 03 Jul 2025
 15:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
 <20250610152309.299438-6-antonio.borneo@foss.st.com>
In-Reply-To: <20250610152309.299438-6-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:04:28 +0200
X-Gm-Features: Ac12FXyERrVVYpDPvl_uPGT_I6xGEjEKe5SU2NHnd5_uoaadOpsZN_FvQyb9INI
Message-ID: <CACRpkdbKNDr00y9-7gL5vixuvtdx7WgkPh5krGKkW9fNizx_HA@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 5/5] dt-bindings: pinctrl:
 stm32: Add missing blank lines
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgNToyNOKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFNlcGFyYXRlIHRoZSBwcm9wZXJ0aWVzIHRo
cm91Z2ggYSBibGFuayBsaW5lLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFu
dG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgoKVGhpcyBwYXRjaCA1LzUgYXBwbGllZCB0byB0aGUg
cGluY3RybCB0cmVlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
