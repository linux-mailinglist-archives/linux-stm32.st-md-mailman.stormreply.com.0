Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4336271E0
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 23:48:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37084CC06F5
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 21:48:59 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFA29CC06F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 21:48:57 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a10so3513783ljf.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iOQBrNwTYw1SJ63/WnHNyssBXV9YJJ2k4UCp73ToEmY=;
 b=qp7ksrqLx5ft/ImrAs4PupVHbiOySR7j6SkKW6uxuR8rBj9z12Uj+F7+UyVWnv3ZHz
 W/Ns+ZonjORK43hZe/WgphVUkLMjHRH7+C2CNrYMyTxOBeGlmhgZvFCL3PHMXZmIupnV
 Y2hwr1kXNAqp9r+XIOwauIZzoI8Lf/63GwjL23s1Vuiuc+XwA+i9mAAypjha7jlDGIAc
 X1S4iBB9s9w2hOve0jwvAT44+DQbAXUFZIBTrQLJLV064mcfUB8fUhoDVxPJogbRtnJH
 JgXNXOCEvNqmZWHkGd1aN6+yQ+zGUCJ4ndPiPzuSsnpNVvkz4tIcl79YBJdEbf44d11d
 JSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iOQBrNwTYw1SJ63/WnHNyssBXV9YJJ2k4UCp73ToEmY=;
 b=DGqtd2Y0nd9BWHtHXA/JRPdBBqII73bRo6p4B9saYeTvDc0QnU84oXBwipbBVSQ9DR
 JsuqHh8NS4pRyXGrRm3pM62IlPU5Ray6faObARdPubX9o2uR5cHUP/wBPZ55LubfYpXK
 5EZmWORDd1vac6iarCyscENY4E0K44xMVH+hxmBxm9nxN4me9prEedeIbCNJmGKwpnfP
 Iy+oB4Ls4TdYyulCBDFdO6wGrocMDJm8ealsjl9G9rOo5dRR6VkXsmYC/dw9jfCxxj37
 GFRfpjJTz3v3QBKOq2SOF7nctmEXgzPG33wiCP5RYfSQ3xfWpl7j5EoA2imJ8cx1iRMq
 7yWQ==
X-Gm-Message-State: APjAAAXtGz4wJTEbLUNgBMugcVVYrkltH/4EPpv9+sT51FNmeovmhYC3
 igr59RovEAZ6OyCtOS3yIg88Z0iJCZ38mSmPiNC6tw==
X-Google-Smtp-Source: APXvYqwn7Y1cj8wPhej94OTp0JB16CcRc/bDKnwG8PWg9M3eToMM02XbJOSHxYn9oeKK6KCeZ6o6KloIF4NRh2kbJzU=
X-Received: by 2002:a2e:95d2:: with SMTP id y18mr24141079ljh.167.1558561737233; 
 Wed, 22 May 2019 14:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell> <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell> <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
In-Reply-To: <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 May 2019 23:48:45 +0200
Message-ID: <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "kbuild-all@01.org" <kbuild-all@01.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stmfx: Fix compile issue when
 CONFIG_OF_GPIO is not defined
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

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMTE6MjEgQU0gQW1lbGllIERFTEFVTkFZIDxhbWVsaWUu
ZGVsYXVuYXlAc3QuY29tPiB3cm90ZToKCj4gLi4vZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3Rt
ZnguYzo0MDk6MjA6IGVycm9yOgo+IOKAmHBpbmNvbmZfZ2VuZXJpY19kdF9ub2RlX3RvX21hcF9w
aW7igJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbikKPiAgICAuZHRfbm9kZV90
b19tYXAgPSBwaW5jb25mX2dlbmVyaWNfZHRfbm9kZV90b19tYXBfcGluLAo+Cj4gT0ZfR1BJTyBk
ZXBlbmRzIG9uIE9GLgo+Cj4gU28gZWl0aGVyCj4gICAgICBkZXBlbmRzIG9uIE9GIHx8IChPRiAm
JiBDT01QSUxFX1RFU1QpCj4gb3IKPiAgICAgIGRlcGVuZHMgb24gT0YgfHwgKE9GX0dQSU8gJiYg
Q09NUElMRV9URVNUKQo+Cj4gYW5kCj4KPiAgICAgIHNlbGVjdCBPRl9HUElPCgpJIHdvdWxkIHVz
ZSBqdXN0OgoKZGVwZW5kcyBvbiBPRl9HUElPCgpCZWNhdXNlIE9GX0dQSU8gYWxyZWFkeSBkZXBl
bmRzIG9uIE9GLCBhbmQKY29tcGlsZSB0ZXN0cyB3aWxsIG5vdCB3b3JrIHdpdGhvdXQgT0ZfR1BJ
TyB3aGljaApyZXF1aXJlIE9GIHNvLi4uCgpCZXNpZGVzIGl0IGlzIHdoYXQgbW9zdCBvdGhlciBH
UElPIGRyaXZlcnMgZG8uCgpTbyBqdXN0IGtlZXAgdGhhdCBvbmUgbGluZSBhbmQgZHJvcCB0aGUg
cmVzdC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
