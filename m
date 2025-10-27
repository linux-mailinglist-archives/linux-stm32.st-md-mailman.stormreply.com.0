Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47AC119BE
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:05:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0F3EC6049B;
	Mon, 27 Oct 2025 22:05:03 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0060DC60498
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:05:01 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-592fa38fe60so6045841e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761602701; x=1762207501;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=881iDkPEZh85ObsSmrMAZ48Htve0Wj9g+gfovyJ15uM=;
 b=ZLkYFSjdT/IKt76yHq4TOOzuwkXzPMye/CwzFpuKPJDZOuIKyKUoz3H0GMvXG7f47N
 qh7vq3BsTtM6AvtZgo4EsxLeU2+d7Hchpf47T0LNjVFI5erG1fQvf2Ic1oPEWJHt1HJb
 LvvHyRfoD+7eljW4B9AfVefOmE6PTePbNAufdMgCHgZvBJ/stTyu88OVzL3f9gGVrWxC
 lHxqAAC87GtUqpqo9UwjBgVC3HpoQpUIX0YfwBsXzFS6iYbSxmXoiU5gxzROumJ9HHE7
 ydcxOhx6nmyF6RNTvxQufYTR7LUp44wxRS2UbpRdXTCEsQyMeAmYoJqRZVJJM+sAqIjr
 79UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761602701; x=1762207501;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=881iDkPEZh85ObsSmrMAZ48Htve0Wj9g+gfovyJ15uM=;
 b=QvAqIARvniuRhSV6MsassZOJd4OdFH/IPKkbtQLqbWp01e5NMIXDcPqubLCyxLYpcw
 0ilbKPVyp2qu3QHsG0pE6Dt0B7nYearoMklteFtCf3SEayGp22oElvZ6388XUTAFb+2L
 QCERw8c7nXaGBj8NGlDsvx0l1d1+H7+iAsjtGEj7XlEa36mE3uNYnT+viThDRUSC67o/
 Cd80RmfnE7KxOjRSJCj54pF9eq4/oYhto4vQclgvKugBSyBLqj6DwumJ0hYyFbB2DpcG
 bKWQqKuzO6htQcL8A2+yNiLfF0aL2WNAPL/yX5MncFKQc3sksky7BhkbT/A7+vbKkBDq
 Z1ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2la5x9O7lg26IkK8Ec6vEqrYSDOvqbN6vse41A7qzlSYy4GpEQXJPs4cdKIb2nwlH1GitywJ37vQh3w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyTl1AVAmT5+XQrqvNXiERCSAqumWuHbMECQhFDO2U2/guuwG8N
 MezmRscxEcde+dMSu7b2Mp/y+0bveSnZYTY/h8cb3AFivNRpAfh/vprC5f9DEALwEy2EO23YEnz
 owAOW67bNdd/ZP+jm0/DXncLqhQidzbhWxEZz19xVSQ==
X-Gm-Gg: ASbGncuJlUexY/NaskOa3K8htnwYV4CAanIcSFBe/krJGxMFEsNNtXEeCgKHkZLecpq
 18TBmESn56DN3/OnBLe7vUs18fA7Eg3LPpdTBV2xH2PQClhMd6k6oUkSrTRleE/8DRo1jZXcnI9
 x69GYogF+J2/TX+Ti1OWuMrPKPho20PKJjl1PC2cXUp9oRrT5IZSmY4lb6PjHWVRykD+LpmvfX6
 Qk4kj2arG/gEWcPSx7uXrfI9FuwpgXzuW9zg2mAddfNDKFuTblgHsj3t0bH9Aw+fJ282lU=
X-Google-Smtp-Source: AGHT+IHoUF4RHiTK1ixTbcpPhI4tBBI8uNgdSo0LDy74WVyTiTCN+lBwjm/Roz3VFn6Yvs6CWMINeSQ/2LwI3eIrZ6o=
X-Received: by 2002:a2e:ac13:0:b0:378:d757:d307 with SMTP id
 38308e7fff4ca-379076bc3a7mr3168981fa.11.1761602701023; Mon, 27 Oct 2025
 15:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-2-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-2-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:04:49 +0100
X-Gm-Features: AWmQ_bkqvtHBv2ihzMqbHUb5leNu-ZCVXzL1Rr2PRCeRlwPcmd2dgcjDCOHd-pw
Message-ID: <CACRpkdYUt3mZX_KjFps_BSRQVrPcn70SrwEJGKRQUjHq3VXcDw@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 01/12] pinctrl: pinconf-generic: Fix
	minor typos in comments
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
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IHMvc3BlY3lmeWluZy9zcGVjaWZ5aW5nLwo+
IHMvcHJvcGVydGl0eS9wcm9wZXJ0eS8KPgo+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVv
IDxhbnRvbmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4KClBhdGNoIGFwcGxpZWQhCgpZb3VycywKTGlu
dXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
