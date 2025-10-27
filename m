Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEFFC11A42
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:15:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E80FFC628AA;
	Mon, 27 Oct 2025 22:15:42 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE8B6C628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:15:41 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3737d09d123so73609081fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603341; x=1762208141;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dKH8vYMf6SqqIJ4Nr7m9tVSkocGsGWocEbO61fBw+IQ=;
 b=zAEHiYkgD7ShE7ZSglwrCk+uEUD1j1sNKY076wuiOdJHL7sSFpcqklIL/qKpMrcoyt
 g0D+GvqWkgWcdjMIvWE0YsAaWEO58vRlv10uGoPbUTL5rF2DGKQVu1S3NPleQCGs3qq3
 WPb+gVdyhszAAdDopmN/YY1c+JCxTWQX9krt2XwIPA0kpTNQnzn+X0rs8SPDIzf20fPa
 uj/bMvF22dI+Xa0GVSDssuLay0EA9f+1EeGxDxYXdOU7m5XY9TReUQK+HhFTwDExk1lP
 ldm4q3Ia0Q91OtEDNhfZm4zX0piw9e9y5iNtOMRpIGcfE46C2tQbqRmNrhD+9ePnqWVm
 POPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603341; x=1762208141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dKH8vYMf6SqqIJ4Nr7m9tVSkocGsGWocEbO61fBw+IQ=;
 b=Nkj73tuVlAPW0ReVB3npxQ2OobdXYE24D1qZ9I/E7Q7auVP7wfpU+06QTA5SxvlknU
 lqk9qLHMwJBlCoOY4H2iwldmR7eURI3cWGZXW8rdyiNR6d0srnI0w6BX+VNnxDzRwoiZ
 HBmzLc4j0zSbLuYVueF19xSZpsUy60tM4sd5vJjP6u2BhoYVaHKRJhENU45o0Jzc5HyA
 kXSYWyLGazPyj+puvjhHuedvMu6zDgCCMZwAJcKrtWGC6YjcfoKApQAG+tuztk386hE+
 tOEbET7Fdam0NerKxeIoYTQAlM+G+MutTL2YO5qzClfC1QkhBcfwRxdSlLtZlvSvroSp
 wUwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcdBECL061E5rvCy6ntqrU9eX2l5rT5vINQxjR18dyNKK1OOcbtNcAlNbQomvW5tSW3zNHCy3ju77PYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyt3GJyjwwM9GldCdmQHRSicYfokFhZgoNKVPI87+hI2Hsuxa+/
 OJjKpSdpUB4TEeV5tOKnXQqJDvrDSvnLpy6hjpLjspPvQmoj4xC/Pfvs5vBBnm7qtqGOCmR2Y3l
 hG+KZF4PVo5AAR1QC+eNSTWlYSqsK3k6KfzZEIOaZ1w==
X-Gm-Gg: ASbGnctghIfVHEDhC+rj8ZULqt+dMyxZXlR63oPZgCr2iSNa82IE+10fj4Bfy5CfrAg
 a7B4eHujF1R5AP1UX97ZK9JFlZ1oNa7wH2AXv3/wCa33RBgvLnri/cDStgVGl3bSth5I+snOa5z
 Scya/vw7uKv/Dok+t7qPlsxFOUNwnZNCCCTJc0Dvj9WXlsjLC4BRRuGOaYHLeTjVNvojBRAo9Qm
 mSy8SDKWSsp2hjjYy4dvTasv5mdDbTABGXW0xk5QEWt9vT35zA9esE/7yvb9cTWe/ThQt8=
X-Google-Smtp-Source: AGHT+IH6m3DSKBdAo1TUZBBV1Cir681XUQKPd2M1XukvdECylY8ML9HXimk23Lw5yV+XpOoav6hKjxByUPzz5iNTOgg=
X-Received: by 2002:a05:651c:1107:20b0:378:cd74:a289 with SMTP id
 38308e7fff4ca-3790774e9edmr2648271fa.42.1761603340965; Mon, 27 Oct 2025
 15:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-11-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-11-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:15:28 +0100
X-Gm-Features: AWmQ_bmjdTr7EUx2uJYxfPf9xIolvT4VGvVXwZyfYUonTVISSkwT-eVliP6qaRY
Message-ID: <CACRpkdYzT3DaqiXTg2swEKxxh2UQbhw2=uF6Md=RON9rWz+6ZQ@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 10/12] dt-bindings: pinctrl: stm32: Use
	properties from pincfg-node.yaml
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
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IERvbid0IHJlLWRlY2xhcmUgdGhlIHN0YW5k
YXJkIHBpbmNmZyBwcm9wZXJ0aWVzOyB0YWtlIHRoZW0gZnJvbQo+IHRoZSBkZWZhdWx0IHNjaGVt
YS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bmb3Nz
LnN0LmNvbT4KClBhdGNoIGFwcGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
