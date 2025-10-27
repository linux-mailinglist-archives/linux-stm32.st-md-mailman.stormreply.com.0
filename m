Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C82C11A1E
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:12:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8506DC628A0;
	Mon, 27 Oct 2025 22:12:53 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44E6BC6048D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:12:52 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-378ddb31efaso62034431fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603171; x=1762207971;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0VYuTzD+pw6O+ffSIwOFLJ+utPOn6Ed1+UK3H7oZ0A=;
 b=lltblpSQSGPxj9veiICOkGPGxZ85YjFMxp4VfSyzfbwM8wEPDwR/DSzZfqs47jalXP
 7SJc8799ZfhOCO5k/WMDWLJHSFfwaXk7C8tSHrd9yo2imTKa7ND3okgwFSsDmOe1+5H/
 4l/YXJ6Nq6oFtwK0w5VLMy7ZhJdcI/hU9zCpIXzW/I1xm3OBEwtN6korxqyTF11k9tGI
 uh295/BRQARgAASltQPde+bGKBQydU0WZuA/kQbtE/VeScVAIeTyQZvdH09x1KXwB/hU
 PIR7HZ2M3Qb/SOa9hianQv1SJkZUgOAd4Zl00mC5Z7jADSaRRuDAkOrqtQ91B04Ox6+/
 SX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603171; x=1762207971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0VYuTzD+pw6O+ffSIwOFLJ+utPOn6Ed1+UK3H7oZ0A=;
 b=a0TelVJTT9feNbLDjVbjwbbBRrVabo1n99zzTaxj+k8DJpJxQKU3IeGeT8oF4MpgYM
 UNJV9VRFYdltpsblfBp9Y1WhxAFlbdK6eL9+FiQB0Vq/zMUjLCaeFEa6/T9fFQN8l97G
 pU/7tDtmyZV9Kdy5tDZKnWG/7yLE9noWspPxiFAJpCRIowY7j+SGYhRjYbs9ayHCkeVk
 9hKe7vmjselQCSTNzUt5SWbd7oXJQWO1if6QGZQvMEl3HvR4bbiPa7nJk38FFdK9oTMO
 CgfGioKFsuDN+x5s93CEM5KAfPitA26uOqFjr4KNgTOpjNCfA8z5aJ17PzAb/NgjRzHI
 sfGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXBk0PCQiZHpg7t9hhyBtc/5jczWhhsAfvTnX+mKkKWzpkIoLRsthKGazdwMY3C/mzKsh1S7AXlFY7QQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4eN3QW2ksCI8H6f4uPXZPdZJyf2blGRnwZ9XPiniPbyPml217
 0lveYrU/0N5hbSG054JvSuuM9oE8CT22t0BGkiYdbQUXeZW+Jc2pxhoAyOviC8sW03yJt7TIFVq
 zH06W9uqlT3LwdxaOZ/ffNdbZRXeMn9oHTv3CrwUwOQ==
X-Gm-Gg: ASbGncv2N8RI7BnezzBk/VeN8Ep9r2xUlVcxFRH1wDnnWJCooSDTLkKfN4rXrXnT6j5
 mU5LxLg27pIkEB+Nv/JwbWBUPv++aU4y91z8K7JhvhFDasIV8DTekN3SXM5qM7Vpgt0mUo0s0+N
 omXsVXCrPMqiL0nPGDqj7XFayasTteaTMWSgzM0bUbiZlxC0yNvguEBqJ7vQZfIvCncBhl785nG
 2aEtzV4egCBAfgcE6f1UV+NTeTfAeplx9d9sbPosSRrEXsYWWiUA3CY8YT4
X-Google-Smtp-Source: AGHT+IEO4OBX6LOPY6n+Kwj2RHxhOjz2+JIoc8GL2mJCp5ePHLtyDD4AZKAQpVBpjKroBtS/M17W9y9jzhmN3enwix8=
X-Received: by 2002:a05:651c:4406:20b0:378:e437:904f with SMTP id
 38308e7fff4ca-3790774c7cdmr3152661fa.40.1761603171396; Mon, 27 Oct 2025
 15:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-7-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-7-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:12:40 +0100
X-Gm-Features: AWmQ_bmFZYqcGNF8COoxdkJmlFz45N7cHtmhxRN-kPjjoyKz6dQA3AfG9pT2B40
Message-ID: <CACRpkdaSvKiGaOMbp5cmH=cCCzmi=cbUf+=4GvMZ-e-NbJT=+w@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 06/12] pinctrl: stm32: Simplify
	handling of backup pin status
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMzoyN+KAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFVzZSBDIGJpdC1maWVsZCB0byBrZWVwIHRo
ZSBiYWNrdXAgb2YgdGhlIHBpbiBzdGF0dXMsIGluc3RlYWQgb2YKPiBleHBsaWNpdGx5IGhhbmRs
aW5nIHRoZSBiaXQtZmllbGQgdGhyb3VnaCBzaGlmdCBhbmQgbWFzayBvZiBhIHUzMgo+IGNvbnRh
aW5lci4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bm
b3NzLnN0LmNvbT4KClBhdGNoIGFwcGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
