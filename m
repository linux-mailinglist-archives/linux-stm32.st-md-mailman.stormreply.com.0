Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C4A7307FB
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 21:20:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 619CBC6A61A;
	Wed, 14 Jun 2023 19:20:22 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 830C4C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 19:20:20 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-bd5f20508f2so960934276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 12:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686770419; x=1689362419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62GFc6AuISXXvkcrUuDGzwht+jOhfItCB1t9KaG7ZR8=;
 b=E05X0deXcZmNEBaFD+iQrEPds6MnAFDwmL+RWQK6d6ohII72LuUWoByHkrC17dcMGR
 WLa1QT41qPMBUxbbJs9/jAnZWBpw/byejQuH+HUDKpL3PA4SjnGLiFKY7HY/VIASnxbk
 cZ91bIIY/6ctPO7G+JvGtzVadzRUjw48LIXofN2cbKanxkwPlFNU1pFxY8+ZhmIvx88y
 ty3arKnYRDX/XSEUcKpGcw0nu/DCNK1NLJt9XwFu6MbcNQZsPG/71gtHAhGO1dYhmgrL
 JO9VaILTaTNVoZAHhBsqyWb/GrCAsfsRtmDc0KAcobEarjQBBLJyENjD6GZkJvfpGaUe
 zBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686770419; x=1689362419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62GFc6AuISXXvkcrUuDGzwht+jOhfItCB1t9KaG7ZR8=;
 b=fTKU1lmK23JO4dZDbsASSJT5hZeLElyxaMtzjJPByEpagI1fmEJa99VVuG9+72kP6K
 ZDlm1WIIeqFSQnYD10bJnlJMvnfQfA6YIJZO//Orw3WBPMoQG/eOzQ98JZzCCLXHAJ4i
 SNDdGJzpZqUtqep6cd87SQ8SxprCW+0FwUhPuPICD2oiPEI4I2YNa9l1LNT5iu5sovkC
 LeSnuC6h1m2B9blyHz/ZQ7T4oQ7tk8Cdn3GZMdUYLeFrHYkawYzwq4Awqowqt/UDH0ej
 N6J3O7pm+FkOry0w91Td8Fu+16OPg1aLJ6/1ZySHvtcyiQ7KrM3fvYzxP8mPz2pBA/fk
 MZXQ==
X-Gm-Message-State: AC+VfDxtWzEWWJ+ySDtSeE56+omMppSlYqoBwcObdXA9+zwRUrgR0xvO
 wus6CcYPwEtKOSIrgfFDYpnbXwQIZ69IAdCmIbU9bQ==
X-Google-Smtp-Source: ACHHUZ7XahJk1hXaPJNxEreyTt5vCy4LzZhRlq/ge2nEmlCnEb/xmxNddg1oJpQIgjnlhO14CHtDFUrt/ScznOeVRVg=
X-Received: by 2002:a25:2515:0:b0:bac:1522:f870 with SMTP id
 l21-20020a252515000000b00bac1522f870mr2609764ybl.52.1686770419378; Wed, 14
 Jun 2023 12:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
 <20230405-pl180-busydetect-fix-v4-10-df9c8c504353@linaro.org>
 <CAPDyKFrq2doTP-7Pdi3cAUtGy9fhqi9mjDZDEhSAdaEd_y+YpA@mail.gmail.com>
In-Reply-To: <CAPDyKFrq2doTP-7Pdi3cAUtGy9fhqi9mjDZDEhSAdaEd_y+YpA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Jun 2023 21:20:08 +0200
Message-ID: <CACRpkdaXS+N+O0PPeFrZ-_h3wztiAe5QtEoDhJgT4kVYganu7Q@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 10/10] mmc: mmci: Add busydetect timeout
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMjoxN+KAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKCj4gU2hvdWxkbid0IHdlIHNjaGVkdWxlIHRoZSB3b3JrIGF0
IHRoZSBwb2ludCB3aGVuIHdlIG1vdmUgdG8KPiBNTUNJX0JVU1lfV0FJVElOR19GT1JfU1RBUlRf
SVJRIGluc3RlYWQ/CgpZdXAKCj4gPiArLyoKPiA+ICsgKiBUaGlzIGJ1c3kgdGltZW91dCB3b3Jr
ZXIgaXMgdXNlZCB0byAia2ljayIgdGhlIGNvbW1hbmQgSVJRIGlmIGEKPiA+ICsgKiBidXN5IGRl
dGVjdCBJUlEgZmFpbHMgdG8gYXBwZWFyIGluIHJlYXNvbmFibGUgdGltZS4gT25seSB1c2VkIG9u
Cj4gPiArICogdmFyaWFudHMgd2l0aCBidXN5IGRldGVjdGlvbiBJUlEgZGVsaXZlcnkuCj4gPiAr
ICovCj4gPiArc3RhdGljIHZvaWQgYnVzeV90aW1lb3V0X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0
ICp3b3JrKQo+Cj4gSW4gYSB3YXkgdG8gdHJ5IHRvIGJlIGNvbnNpc3RlbnQgd2l0aCBuYW1pbmcg
ZnVuY3Rpb25zLCBwZXJoYXBzIGFkZAo+IHRoZSBwcmVmaXggInV4NTAwXyo/CgpJIHRob3VnaHQg
dG8gYWN0dWFsbHkgcHJvcG9zZSBhIHBhdGNoIGZvciBTVE0zMiB0byB1c2UgdGhpcyB0b28sIGFz
IGFuCmV4dHJhIGZhbGxiYWNrIHRpbWVvdXQuIEJ1dCBJIGRvbid0IGtub3cgaWYgaXQncyB1c2Vm
dWwgdG8gdGhlbSwgc28gSSdsbApyZW5hbWUgaXQuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
