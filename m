Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19613ADE6CB
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 11:26:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6BA3C36B3A;
	Wed, 18 Jun 2025 09:26:29 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BED5C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 09:26:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5532a30ac45so532712e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750238788; x=1750843588;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWFR3lJZvy4GZXmA1xUeMKYw+5FpI0OcmJNgyVyXgIw=;
 b=fIeNMNQVFAh3m35JgYrpty6hOQiyDEr7Qao37RbObYup7DP88zEoU/SHfTSb/9XucR
 2GZzkVHfc9sdNB1vRmWo0NtNnjOBq1/0q4V+bNk0ROM2gUgmn9DkJgbkHYUWJUMC4yNQ
 rXy7pLzL2vB39qugbn07fJL7Vu2B88xuTngyeh769xFp9lOPDIFzsXdU2v0z3GLx9mxN
 LVpxaYaI96+0+wPNpmGsdYYixtRAqz9HUwnucthnz8j7v6QR+AInE+YsQV2SfuSFQy2a
 kLYrZzc3odQiCMqNOqdGzAQze9lVImmd1Bs8+qtQoz6B7hj/M6Q/mV3AP9fjjTTtCj08
 6xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750238788; x=1750843588;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QWFR3lJZvy4GZXmA1xUeMKYw+5FpI0OcmJNgyVyXgIw=;
 b=bL+l64unICE4KCnRueDr7h4hVjzYAh4mduj5Y4W7THzce5ANn7YEg7UqLbK6XmTT7E
 MpYk5CC44Jefp+6f7la+d6rH9UGIVHY5Kxdyuup0ujwNq2GnmLJV8oyvjH+qhxvNnfSh
 OY46PxItShAOUC39Z+z/a18unYwliwT+32OThurL34Ip+b2H6TAo3mAC1P7ZOvdZMBaM
 HwSuiTZz5A5rWj5ADU8n/057wAOysx8NPKsuX9q2xV2xEnda/DsJhPqdkgUYKSEgl+Fr
 jN2Wq7EKoJh1VO5juWZPJRYtUR13H8QmhXSSbLvtFSyjFgrGFcGdG+iNoNyw4I+dAFEm
 YaqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhtANCARiyWFm8utrqIcjO0qyM1JlgCU/AgrHTxc7YojX8pwUHktUxFwQWXYll+yo66yIjgA3+2iLOnA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPO2/RU9OKYU7VAH1P8GCOUusGKNfztu5RsdVDVGPKEkDyEKzo
 c14zlmi8wFgZ7oMoKbPrETAbZ77HDkkFZnaxRG/DBYoZkaLdRDrYvzj7/rP78zRINGr2A8ozm1x
 SfIbctFoO+8IW3iZ0DweUjGLedGsfuVfFfvj+f/EMEw==
X-Gm-Gg: ASbGnctDpAZpewFsU5Zopz6FOW51FDAX9g45kjzjAQySr1U2xkjiK8B3hLO167O7k63
 w95dpkv4X4v3OhR3kLu2U4TsECj4lztw2iYsmFQ19KmoSbM3M+Q1YUawYCRCQmVqo6fVyUIy+vn
 PymRP6aNkWioAZ+NGrdDSETcp1EWxV2aG86ngGhqTESq5XmAJ9qqMhfg==
X-Google-Smtp-Source: AGHT+IGZulR1H9+iCIC55gEsLEoE0oqDCjkL5Fd28aQJZaej+7J7V66hn4S2QtWJZn/tk65wm8JptBmvBC8HG7edLQ4=
X-Received: by 2002:a05:6512:4023:b0:553:2375:c6e8 with SMTP id
 2adb3069b0e04-553d38bc9edmr644722e87.1.1750238782845; Wed, 18 Jun 2025
 02:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:26:11 +0200
X-Gm-Features: AX0GCFudSA6Ai2Ztyy99YXMMTippK2eV4K98kdxAH7hr-WIHL4mRq5_nr4kVdg8
Message-ID: <CACRpkdYy+sVQAdntEWMfJGqEzw+eexLGG6pXt8QVYD47rVzjdw@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 0/5] STM32 pinctrl: Add mux
	function RSVD
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
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IEFudG9uaW8gQm9ybmVvICgzKToKPiAgIEFS
TTogZHRzOiBzdG0zMjogQWRkIHBpbm11eCBmb3IgQ000IGxlZHMgcGlucwo+ICAgQVJNOiBkdHM6
IHN0bTMyOiBBZGQgbGVkcyBmb3IgQ000IG9uIHN0bTMybXAxNXh4LWVkMSBhbmQKPiAgICAgc3Rt
MzJtcDE1eHgtZGt4CgpQbGVhc2UgYXBwbHkgdGhlc2UgdHdvIHRocm91Z2ggdGhlIFNvQyB0cmVl
LgoKPiAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBzdG0zMjogQWRkIG1pc3NpbmcgYmxhbmsgbGlu
ZXMKCldhaXRpbmcgZm9yIGEgRFQgYmluZGluZyBtYWludGFpbmVyIHJldmlldyBvbiB0aGlzIG9u
ZS4KCj4gRmFiaWVuIERlc3Nlbm5lICgyKToKPiAgIHBpbmN0cmw6IHN0bTMyOiBIYW5kbGUgUlNW
RCBwaW4gY29uZmlndXJhdGlvbgo+ICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IHN0bTMyOiBBZGQg
UlNWRCBtdXggZnVuY3Rpb24KCkkgYXBwbGllZCB0aGVzZSB0b3cgYmVjYXVzZSBJIGhhdmUgYSBE
VCBiaW5kaW5nIEFDSyBvbiAyLzUuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
