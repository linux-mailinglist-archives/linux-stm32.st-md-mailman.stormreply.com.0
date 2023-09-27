Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5F7B0ED3
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 00:19:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DEF2C6A60C;
	Wed, 27 Sep 2023 22:19:30 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0274C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 22:19:28 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-59f6767a15dso107521897b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 15:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695853168; x=1696457968;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WNPNE6ZI/33m69iO4nrfDEaqDNZF0EXoDxHt8Xj7A5c=;
 b=THfp/03gNECHP/D48TMbskz8DDXO/80apB8T0WQ8lwf1fLCqvyomAEOk60uEoG0gEz
 vTyc8OS4iMOWF0FJ2nNp+1siosX0rRmkv2d56w4mKeBf8epCR+z2ZuDeoqOeozCWQyAx
 SZIouHB6EGWxleAJ6TxUTJ+j00KNtk0BeXXw6qtv6caTuTelttEC0+0Q/h9sYWpupedj
 HAZGrXfJz5Y1j8qRvHhB0fUYJ3ycbiln7I2vwT+PaYQC2v9TLSqCw5JzE6ZK1g5nlSAG
 zjBtvCbPmdgNSj5cVL6SmyVpUB5s/S0zR3g6VLDR+gMDCxsUQelBJoiLJMxSSjtXt7vp
 1j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695853168; x=1696457968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WNPNE6ZI/33m69iO4nrfDEaqDNZF0EXoDxHt8Xj7A5c=;
 b=c8o6WmTxU5XoxC55CyIc2BsCZKMNyEAaedVHC+F+i51VNTzAmrxTuouF9s0rXbEFFf
 X1IFVZewaALXi6wz6en/xw/aDJw87WKqlCxcQWWcso7jJ/IAg6anhwyml1K3Q/p2tq0C
 XI5TBr667IUdJM/Uhk+tZJtxV/iyNPY30xosSMVxRRltrAetieJSQjsnDmXJIEjeMSS5
 C/591izTS9KyzLY3a9YyGdm9b+lzFMHTZgFMWOj1umbFvA8orbPphFronffyP/7ZnGYM
 NgGW++PKX8Y4Wm5afmi9/ENGndxcGlHqty0AkBqEEfKszJUuzm/DCVZJC5Y3MUay4oSm
 SL3A==
X-Gm-Message-State: AOJu0YzcBA4FjOnHVCMuOWQUAEOJW81wqFb/qv4ovjwGm4QStcq4DyxM
 hAFxE3CJ0RTYjcdBiGsOW4VbGt0nlovIwPlJokyt8A==
X-Google-Smtp-Source: AGHT+IGOFDBVqzOLee/sxAR9iGgK1IsrGDxg0u9N7DeadlJtHUbFJGeHuARY+QXmXwqa6r7dlyDUMkozYOV9NkpmD3M=
X-Received: by 2002:a0d:dd47:0:b0:59b:e743:630 with SMTP id
 g68-20020a0ddd47000000b0059be7430630mr5040982ywe.22.1695853167792; Wed, 27
 Sep 2023 15:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230927184556.1422122-1-ben.wolsieffer@hefring.com>
In-Reply-To: <20230927184556.1422122-1-ben.wolsieffer@hefring.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Sep 2023 00:19:16 +0200
Message-ID: <CACRpkdY=kuwiBb965Q7cwu4AeGaG2j0UQ=SOVEZAu=Nq+U265g@mail.gmail.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: use peripheral flow control
	for STM32
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

SGkgQmVuLAoKdGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gV2VkLCBTZXAgMjcsIDIwMjMgYXQg
ODo0N+KAr1BNIEJlbiBXb2xzaWVmZmVyCjxiZW4ud29sc2llZmZlckBoZWZyaW5nLmNvbT4gd3Jv
dGU6Cgo+IEBAIC0zNzgsNiArMzc5LDcgQEAgc3RydWN0IHZhcmlhbnRfZGF0YSB7Cj4gICAgICAg
ICB1OCAgICAgICAgICAgICAgICAgICAgICBkbWFfbGxpOjE7Cj4gICAgICAgICB1MzIgICAgICAg
ICAgICAgICAgICAgICBzdG0zMl9pZG1hYnNpemVfbWFzazsKPiAgICAgICAgIHUzMiAgICAgICAg
ICAgICAgICAgICAgIHN0bTMyX2lkbWFic2l6ZV9hbGlnbjsKPiArICAgICAgIHU4ICAgICAgICAg
ICAgICAgICAgICAgIGRtYV9mbG93X2NvbnRyb2xsZXI6MTsKCkkndmUgaW5zaXN0ZWQgdGhhdCB3
ZSB1c2UgYm9vbCByYXRoZXIgdGhhbiB1ODoxLCB1dCBhZG1pdHRlZGx5IGl0IGlzCm5pdHBpY2tp
bmcuCgpFaXRoZXIgd2F5OgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
