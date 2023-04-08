Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D67436DBCEF
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Apr 2023 22:36:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84768C6B44F;
	Sat,  8 Apr 2023 20:36:10 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39713C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 20:36:08 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id z9so1477384ybs.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680986167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZZscF2fONOwXuFXGvRXOAh5rZYNfj5+qAkcLUluk3c=;
 b=oAlGXoXnKf1mb3thE0+2Avw7QwYKWVsScj36Mtg5OHZ2uBg5ByXpsql2XwSCtK7QJu
 uxJx82qzQ6pdQ7L4V8MFyZVIzDtc/uehKUURjEDSqa1NMb1esjH7bkSaVruTFYnuEjKx
 /tMK4O0ujl8q6O6rLF4Grr/kvBGxPtP7tvy75gU5Wn1PMNpDdEQJ2wVd+G/+jPApt5uX
 iK/CVgmGg7IvJdvJgX+1yMbuGBJiHpU0RCd/6MBNcA61ARNYgJJitm26Ce5ySRKq+YKx
 tr4eo5HusgT5ZIf1ecOt7iIShpGF1VAqRMVkjcMKllsvKwio9Pe59A2rrc0AcxTFtGHw
 7ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680986167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NZZscF2fONOwXuFXGvRXOAh5rZYNfj5+qAkcLUluk3c=;
 b=xJgwZagivVVtgF+tv9t00n/mMCWhBdRePI1b7GigpbY8DQuyAIKv06ZwoulsHYujCA
 boEcBlOQQATSIG2qgupTTylnxz4cDe6Wrp+HViDRQ8NLr/ZfEodVI7fIsV0VTdQHP7Cb
 ISwhLVDq2ZkPHrAZwh8A+58uxBAZ2u7NM0hyL9i/cEON6BIYK8NzEa16nX0a4a1eAYAU
 prhvyWpxgfpzsJSofQS+8TLdkPqc8YnIrJ10XlsoDOPcgIgQjJ0O79AKsznVAYQIoXLE
 qhb1kfUNRBk4HJ9E/kCSxRaMY4hYOODz8vogn4ZcUmKzqvFAZj3D8TBVNfSqlO5X1yHs
 3+zg==
X-Gm-Message-State: AAQBX9fA/qGW8sdMB8GdHs5v6P45/7aXXTBVeaopHXbbbN8RjeXseF4p
 /7qW2TRDOl7iSy0FaCZH1SmqQstqO3qAspEpK3Jmzw==
X-Google-Smtp-Source: AKy350ZCSktfVdSajWHk3Kn/fazYQY7zKRnkVbw1QkBqCtdZTrtjrJZ/VLLHDLKz8vf/X7ENsAiVz4UlF+h4HVCyPtY=
X-Received: by 2002:a25:d215:0:b0:b75:8ac3:d5d2 with SMTP id
 j21-20020a25d215000000b00b758ac3d5d2mr4241008ybg.4.1680986167032; Sat, 08 Apr
 2023 13:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
 <20230405-pl180-busydetect-fix-v1-1-28ac19a74e5e@linaro.org>
 <CAPDyKFp1KDV+q9ApKfq7C4PoiJnMOsACKJvbEiZLhv06GJGB_w@mail.gmail.com>
In-Reply-To: <CAPDyKFp1KDV+q9ApKfq7C4PoiJnMOsACKJvbEiZLhv06GJGB_w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 8 Apr 2023 22:35:55 +0200
Message-ID: <CACRpkdZqosXtxsnTb87-Aw6m2MwC7ScGPNXmN_2=JxqRXA6mig@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stefan Hansson <newbyte@disroot.org>, linux-mmc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 01/13] mmc: mmci: Only call busy_complete
	if callback defined
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

T24gVGh1LCBBcHIgNiwgMjAyMyBhdCAxMTozMeKAr0FNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKCj4gQWxsIHZhcmlhbnRzIHRoYXQgaGF2ZSB0aGUgLmJ1c3lf
ZGV0ZWN0IGZsYWdzIHNldCwgbmVlZCB0byBhc3NpZ24gdGhlCj4gLT5idXN5X2NvbXBsZXRlKCkg
Y2FsbGJhY2sgdG9vLgo+Cj4gVG8gbWUgaXQgc2VlbXMgYSBiaXQgc2lsbHksIHRvIGNoZWNrIGZv
ciBhIG1hbmRhdG9yeSBjYWxsYmFjaywKPiBhbHRob3VnaCBpZiB5b3UgcHJlZmVyIGl0LCB0aGVu
IEkgc3VnZ2VzdCB3ZSBkbyBpdCBkdXJpbmcgLT5wcm9iZSgpCj4gaW5zdGVhZC4KCk5haCBJIGRy
b3AgaXQuCgpJdCdzIGp1c3QgYSBiaXQgcmVkdW5kYW50LCB3aGF0IHlvdSBzYXkgaXMgdGhhdCBp
bnN0ZWFkIG9mCgppZiAoaG9zdC0+dmFyaWFudC0+YnVzeV9kZXRlY3QpIHsgLi4uIH0KCml0IHdv
dWxkIHN1ZmZpY2UgdG8gZXZlcnl3aGVyZSBqdXN0IGNoZWNrIGlmIHdlIGhhdmUKdGhlIGNhbGxi
YWNrOgoKaWYgKGhvc3QtPm9wcy0+YnVzeV9jb21wbGV0ZSkgey4uLn0KCmFuZCB3ZSBjYW4gZHJv
cCAuYnVzeV9kZXRlY3QgYWx0b2dldGhlci4KCkJ1dCBJIGNhbiBkZWFsIHdpdGggdGhhdCBhbm90
aGVyIHRpbWUuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
