Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF64C11A2D
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:14:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2444C628A5;
	Mon, 27 Oct 2025 22:14:03 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6809C6048D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:14:02 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-378cffe5e1aso54828511fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603242; x=1762208042;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDb4heLwVr8F9tF67JPmU+lJmZbzaUPek/3Lt5kxQUA=;
 b=SE6s70/lgsFuc2o9uzq+bbnPAWbEq6RBmCehFaNpfdsdiCEXr1taBfgpHlJi4jdgtH
 i9go0azU0eDzfmtzymE2yhjeT59LCIE55Ab9w7q2i7j5LfiLaDSvseCOf6E35I6yj9hR
 W34BITdH13m6fqQlk5RTjaDgKSU626w3mOzbpQ0PS6SdOIYuEsiIH+d7uMzXhBHMmrVP
 tejp+28WSUZnMgafxx9vQu7+1FrBjk63JWJEAftxn+RV7AyxtWMIDeGy5hKubhrHC16P
 W2tOikLLNIkLFpddeuw2F86f04mTwFudmSs4NKFfBusurQaWMBrMNnNXsRQoo/QsJ1RT
 DuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603242; x=1762208042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDb4heLwVr8F9tF67JPmU+lJmZbzaUPek/3Lt5kxQUA=;
 b=KIoaAoVMYKL/c2qAtzAP0PqRHCBNZSzehu2huAf5brsDZnxRfFuHiPomK0KJX3fkoX
 DMdv/UHVLWaszwNfofSrqnRbCzr4a5re4r/vIbrpcrB2lAzz8zb9Go+VImh/asMML1gh
 WmW3qoiDnM0UXZcwa7pJQCth/3EQfRyoLnkFVAZ1e4vYLPL4nmwzmZxetmbJalXUgCQx
 s3M8NsZyTEWhFImI3yyHwZROnV8hPXRxus29kW8fPn9HtZDZhprdCbaFL/GHetpDA7Hg
 j9iQnY2Xp+cyyW+Kxi5pcNaiZmk+EGwAZxPgX5YW3I8oq1VE1G8p2m78tGe/OtObuqUX
 sMYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvwoU3IDwgzjqguBjjToSbdG2sQFPqvF6kPqwS/J/yqXGyUCjwJA7GAJxg9DTJ4c9pG1eZzbWSSXAQ/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyI7hVL+ZK8wSgvff9EYBqdBh7djM714Q2y/HxPolQgt0otHsiF
 beK5HA80otOYa3xWgxWZ2XgiOH9GaAt3ceLuFUR5/bGO2nN+VQkl/RYQW/vzW60Cbna9QQPqcPO
 pO67eOwTqg0G4BThJHlMrn6dcXrsNANBt5azQVYJ1Vw==
X-Gm-Gg: ASbGncvU/zJ3Nzq3DThUII/2pMcDnxUweY1cMQ0K0GeZraeE6cBCEsrV9guTJDT0QrS
 IpHlJcQnlgmAvJ3mNBXtxQ3PRUlnx0yYmBEWlW5VsPgPhGZknjF6MmxPjpErKexXRM+y0uAXQ4a
 HvhOyex9CeJXbcZwi+7l3flGjzqNInsF827idNAAduQk8+Vwa43AoPMYQwu2QpO1C868mXU7NJV
 rGIxjwA+x++NDMFstEHYwYErvPwuBMUTAKENfKyRjq2BrE0oDCe5JysXD65NiI1J6d1Ytc=
X-Google-Smtp-Source: AGHT+IGTHGniqnqswQZQSU1fhk8hxerxmT/RZLzkXLtCHwAUJ+0N8EhP8qUlWdXk3822xFbRTLDLonsWXqEkAXahWao=
X-Received: by 2002:a05:651c:1503:b0:36a:a87c:d139 with SMTP id
 38308e7fff4ca-3790776da7emr2956771fa.42.1761603241771; Mon, 27 Oct 2025
 15:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-9-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-9-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:13:50 +0100
X-Gm-Features: AWmQ_bkjaJPnQvsqyBKfvEn0_gjRiWDur5QLSrzsQpj3h_gRODNUm-q5XFQgAKQ
Message-ID: <CACRpkdZrNKgoxy0aHTVQmyeryiDbu3Dc8FQR_KhbubwuLxcc9A@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 08/12] pinctrl: stm32: Avoid keeping a
 bool value in a u32 variable
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
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IENoYW5nZSB0eXBlIG9mIHZhcmlhYmxlIHRv
IGF2b2lkIGtlZXBpbmcgdGhlIGJvb2wgcmV0dXJuIHZhbHVlIGluCj4gYSB2YXJpYWJsZSBvZiB1
MzIgdHlwZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5l
b0Bmb3NzLnN0LmNvbT4KClBhdGNoIGFwcGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
