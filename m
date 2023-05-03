Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD996F6000
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 22:25:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5755C69073;
	Wed,  3 May 2023 20:25:55 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FC0DC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 20:25:53 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-b9e2f227640so4848210276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 May 2023 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683145552; x=1685737552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gEz7yCW0YNWEyofUMW+bM1YB2JKr4lLhGCi/13fTrc=;
 b=Mzh0ZV1liVt0pO7T3ehH+wp5tHq2eHIvxMQvgVLhBNtjThUcDrX/+aDvPu0tBZ/9ee
 EXtPp3wMLIa74YOBsQ0e08IZyzEb9z2PtCzmiGLSL5FFkcqFzSprSbu/p4OtMtm5Z8vg
 QTb+851VnqyKufW9AlhGHuA8W1rOsuyTf/U1ngEssyK7U0XiMTLfkIYXQJ/3BWdZ/+nL
 IlkiQndW7FfaXvB3Wtdi5hEfH46S40YPblPeGAPLxeQ85pZXExi718VSSliADLafDbtF
 EIagwxP3z0ZUYRpd+UFfoZPqXzZHPfYekCM7c+V8IvPd0peQzIxx4yrWJn2aqzP6n/mT
 v8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683145552; x=1685737552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1gEz7yCW0YNWEyofUMW+bM1YB2JKr4lLhGCi/13fTrc=;
 b=fHyP68TshFOJGKmLGuwIl8dfO6QbETWCMnb/cZ7OgGnp7+ABnruynuA2iZg4iIJ6Qe
 f1+ASpsf8SlwdkBi1GvisB8g0YBQAruVIEZTwCQYhgtwbfXRjtdFcyUhi2juPIcNNj8v
 rkybsiEt1q8JqJHK9sPdL9seAXXPUIaYrlqL6VG1mUj37KLSjSN8vgnqxNLPnsW1q+rv
 DBajEMiQMrZaRkmqLzMYGtR83ZGqGyzb+8GqL+ItDqNB7XxHwo98qiTpAann+jnqvmge
 CutF9PDOh+bWtik93aoAutddnCfvsFY10kPkXwUfbWQ124P5FQdEpNRAagmh1CB6DXHG
 qayQ==
X-Gm-Message-State: AC+VfDwTpG0CKvjORKtxCtb4u+iaNq+SY0G3ALIY15X6MU5XUkT3STun
 DdfbAXh3Hn+5Ph12UaolgjAiGqTTJFykS2eUYrrKoA==
X-Google-Smtp-Source: ACHHUZ6bWBOMBfCcUnb1ZA+ngbZpzrLgmQlXt3j9zhiGPRBmWSduiRqy3n8tV6EAdgHxuWzjmwHy1P//RM78ldQ0LkU=
X-Received: by 2002:a25:fc0c:0:b0:b9e:7ec8:5d41 with SMTP id
 v12-20020a25fc0c000000b00b9e7ec85d41mr5902733ybd.55.1683145551966; Wed, 03
 May 2023 13:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
In-Reply-To: <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 May 2023 22:25:39 +0200
Message-ID: <CACRpkdaZdxNZ3amHxE44NZOZcVMpBa4Kx126+7WW3XHGM2NU=A@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gV2VkLCBNYXkgMywgMjAyMyBhdCAxOjAz4oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cgo+ID4gICAgICdnZW1pbmknIDogJ2dlbWluaScsCj4KPiBUaGlzIG9uZSBp
cyBhbHNvIGEgcHJvZHVjdCBuYW1lLCBub3QgYSBjb21wYW55LiBBcHBhcmVudGx5LAo+IGdlbWlu
aSB3YXMgb3JpZ2luYWxseSBtYWRlIGJ5IFN0b3JtIFNlbWljb25kdWN0b3IsIGFuZCB0aGVuCj4g
YnkgQ29ydGluYSwgd2hpY2ggd2FzIHN1YnNlcXVlbnRseSBhY3F1aXJlZCBieSBJbnBoaSwgYW5k
IHRoYXQgZW5kZWQKPiB1cCBpbiBNYXJ2ZWxsIGFmdGVyIHRoZSBwcm9kdWN0IHdhcyBhbHJlYWR5
IGRpc2NvbnRpbnVlZC4KPgo+IE91dCBvZiB0aGUgZm91ciwgSSdkIHByb2JhYmx5IGdvIHdpdGgg
J2NvcnRpbmEnIGFzIHRoZQo+IGRpcmVjdG9yeSBuYW1lLgo+CgpTdG9yTGluayB3YXMgdGhlIGlu
aXRpYWwgY29tcGFueSwgdGh1cyBTTDM1MTYsIFNMMzUxMgp0aGUgbmFtZSBvZiB0aGUgY2hpcHMu
CgpUaGVuIHRoYXQgY29tcGFueSBjaGFuZ2VkIG5hbWUgdG8gU3Rvcm0gU2VtaWNvbmR1Y3Rvci4K
CkdpdCBhY3F1aXJlZCBieSBDb3J0aW5hLgoKVGhlbiBJbnBoaSBhY3F1aXJlZCBDb3J0aW5hLgoK
VGhlbiBNYXJ2ZWxsIHNjb29wZWQgdXAgdGhlIElQLgoKSWYgd2UgKmhhdmUqIHRvIHVzZSBhIGNv
bXBhbnkgbmFtZSBJIHdvdWxkIHVzZSBzdG9ybGluaywKYmVjYXVzZSB0aGUgY2hpcHMgYXJlIG5h
bWVkIGFmdGVyIHRoYXQuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
