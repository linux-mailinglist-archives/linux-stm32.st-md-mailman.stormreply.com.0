Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48E771CA8
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 10:56:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFC32C6B45C;
	Mon,  7 Aug 2023 08:56:23 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEA65C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 08:56:21 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-c4cb4919bb9so4662084276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Aug 2023 01:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691398581; x=1692003381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zTR/u2PpG3LKb8wVdD7nsllACEqpd45z6GcRCQZJTqE=;
 b=g2llslmFRX3ySdXig161Vyh5DEUBnJUIvcrEJN67E5rLmdq2oqwU1ffFvhJTzo+MJa
 V/tzrXoX50fE7NHvM/WDa1n6S1g/bewiFxGcTQBEv2HhPJzMuRhghasqF/rZDU5j5ils
 0bXa/jK1mikiBk7bu6CVIUqQsJWnXeVIjy9ZLhcmeWzNqLe+fT5QUA/ncIE+jSgan4Yr
 QeKkQxLUrin9aF9cCdRe3fdd5Q9fQ9g4MSVdSZH+rcyXYoCCXZ8hZdi4Wfd3Y1Zkjk67
 m5vD4x+8NjALkDkWEnYcnlj9OJVqD0t+0KBmfCjyhC1RZlP/GGkTcT1XWLwYrMybClRv
 HsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691398581; x=1692003381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTR/u2PpG3LKb8wVdD7nsllACEqpd45z6GcRCQZJTqE=;
 b=XNWanhpA/cM+vkm3eEtSXWXp5J9Lm19FTr5ZStilYgxsjEFoxaxSPy4TD0N+jvUL5g
 kUevU1pJQYqNowy1wa2T+q+bLwgn9KxMA8KHsrZqqe/Vz2B1cM0XnW9Rif1t2GmQ/BcM
 69P4RgYpqFqNpd7VjfUjZWNTW/0pQ5Bv7awlMBqjYlzOeIrdftBp80GUZn4Wm5bKweOz
 LmQy1kNLntQmWKuXS4Ey+AxVNKfX/r+dzisvDBkl70hff1ZJHxHt2mD6hxKJNGCXgfT5
 t++17y2RBgto08uT8MP+K2iRUMZqv9ylXZqKV2MrLhKlia/pT5QoCm6YqhlmVDKLvKCY
 7mXA==
X-Gm-Message-State: AOJu0YwDc5w25SjVdVR1hOg7kOCaKkdDqkycxKtq+fmk5f6WXJDaMy9J
 EcLIKM+soC716dGSWPxWzZhmra9OkIeATxhTdNfxaw==
X-Google-Smtp-Source: AGHT+IEz8bMj8U7s2yoRZBwu0+uMDX8L1rdxKLELEeUY1Cg3hgASws6siBfe5bn9m1H3rny67X2StZqhmW7DsuKoDW0=
X-Received: by 2002:a25:c345:0:b0:d0f:926b:c734 with SMTP id
 t66-20020a25c345000000b00d0f926bc734mr7593218ybf.61.1691398580784; Mon, 07
 Aug 2023 01:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 10:56:09 +0200
Message-ID: <CACRpkdZFqkn8epsP2OVDO-+Di9ymxe+n02+9Wcc4MAT5ea7GrQ@mail.gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: leds: Add
	gpio-line-names to PCA9532 GPIO
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgODozNeKAr0FNIEFsZXhhbmRlciBTdGVpbgo8YWxleGFu
ZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4gd3JvdGU6Cgo+IFRoaXMgaXMgYSBncGlvLWNvbnRy
b2xsZXIsIHNvIGdwaW8tbGluZS1uYW1lcyBzaG91bGQgYmUgYWxsb3dlZCBhcyB3ZWxsLgo+IHBj
YTk1MzIgc3VwcG9ydHMgdXAgdG8gMTYgR1BJT3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
ZXIgU3RlaW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+CgpSZXZpZXdlZC1ieTog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
