Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C9C11A39
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:15:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0917C628A5;
	Mon, 27 Oct 2025 22:15:05 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6ADB8C628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:15:05 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-592ee9a16adso8899663e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603304; x=1762208104;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MklpS3nPFH/8Q8+o9LUwlAzS9y0GP87dIrP5WY05aXE=;
 b=CtSh4Gra/XrXOinYHbxilFtB6CdZ9x7ecPvCrbWpSnLJLjFYl0vDPC3fWqmsb1nHii
 IwslAzpRq7ESdEb4CYMucnwAvKsKeVw3dZUpjXJPAKLBJ3E80SwMXimDzaeDqI9fgG1m
 EOblWDrEQ5WBmGzK4SWqmS4KvD4JeoqFwddZCzSoE98TVJZLB5bDvffHJLUf6qI0OPKB
 e0ViAh+jRrhgLKZ3JrOwz/PQvL+om9dvl2dG0+zhnlm69QEY7hNIp10voud6ZsPgKUX9
 vZhkPASNhdAp2GAMj+TDKIIAh8JU1bp31ABkHJZgRsyGwWr3hNbLb17N7eXqy1KdYj1o
 YZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603304; x=1762208104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MklpS3nPFH/8Q8+o9LUwlAzS9y0GP87dIrP5WY05aXE=;
 b=Jr8DRy3uOr/ycamkJTjagoHtiv10Th6csx4CX8k855Xbg3dmkzLbw47zg64e1Xe1La
 +MvCB+4fWjqtOLupVgZgNXqie72BbICfabvsOxnrr8s2o7q9P4gS4mf5gWy0nlx0IG39
 EZoCdiMccKq/EFYVFMURD1NA6xjmj7C6OGxU7uWzhI2F4pOTaTEECrZRVaCaMhohSKYI
 xiizjwRkRa6wgP2a8Kw360DGMEBK+I6D3z/kPMFHEcZTvXKBN4h2uqjahIr2bmnIGJg5
 WS9RcoGL3gOUcGRA5xSyn204+zEdAAyPwvcAnB6KamLD0TWlLZK+zhrE5ZkG2kY6Ny9Z
 MjkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTlQkD8eTPBU4K3C/JGhNGHUDr/vSxGIRD6axzFAEIMnHbayqEv4UUOvyYpKNIagNf8qaQumVfXOzkVg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/OeStlQmsQ1oH9Gwkia9vT+Xv8slFzzXzYYUnBGG0zlYFVZMl
 ifL45R+RGRc7xxNqjSBJ+Ag6GvvrctLIwEXdRpn9rqmhAeCmrMGVn25tAx9j++EVK+H3Y+4wq8n
 1LrRmQim5iwiR9irv3O0wZNxjdewYRdW2iXAKdNi1nw==
X-Gm-Gg: ASbGncuj2kPpjpztvVlHXHVgOz9VdwXy2iuCATnRkejzkkEJH8wa1jUDReE/XIY4IMR
 oO4wx20DQYQTpz7JUnEC8Nhlr6IuGsOv+/lRMXJWUl8hUB9n4hVjhppyQicvOq2NTgaEMXHa1E1
 IDBJnjLLSVDNlitVY6z6CkNyR4rv9+oNCQ7K3MmsH6Ki2xs0U71O8C2e0241hPee1b7aPvgGMvf
 Y7hF7oVYYxZxA1u94wYrMf1FHLm1nAu/GfXm3da6/QWBoL1N1mPpyI3MEtKBd1bmsKoGN8=
X-Google-Smtp-Source: AGHT+IGLhiO6SgwWEy6J63NGSkHEkhNG2WH3ZWZ7Mjt5HjFADLOLTHG32rGKFBXTboiBLjapU4iKntf9dVI4uinRnL8=
X-Received: by 2002:a05:6512:308c:b0:591:ec0d:3014 with SMTP id
 2adb3069b0e04-5930e9c3bb1mr426683e87.48.1761603304563; Mon, 27 Oct 2025
 15:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-10-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-10-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:14:53 +0100
X-Gm-Features: AWmQ_bld4K6zXNCkN---w7iwBNN2WjFxw2gv2dtNkgQHft2zTjwtq7Bsw-LLEv4
Message-ID: <CACRpkdZoecqkKfXmu4ih3qb00OMPmAtJVvyqerXf52n+s7vFxg@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 09/12] pinctrl: stm32: Support I/O
	synchronization parameters
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
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IERldmljZXMgaW4gdGhlIHN0bTMybXAyeHgg
ZmFtaWx5IGluY2x1ZGUgYW4gSS9PIHN5bmNocm9uaXphdGlvbgo+IGJsb2NrIG9uIGVhY2ggcGlu
IHRoYXQgaXMgdXNlZCB0byBmaW5lIHR1bmUgYW5kIGltcHJvdmUgdGhlIEkvTwo+IHRpbWluZyBt
YXJnaW5zIG9mIGhpZ2ggc3BlZWQgc3luY2hyb25vdXMgaW50ZXJmYWNlcy4KPiBJdCBjYW4gYmUg
Y29uZmlndXJlZCB0byBwcm92aWRlIGluZGVwZW5kZW50bHkgZm9yIGVhY2ggcGluOgo+IC0gc2tl
dyByYXRlIG9uIGlucHV0IGRpcmVjdGlvbiBvciBsYXRjaCBkZWxheSBvbiBvdXRwdXQgZGlyZWN0
aW9uOwo+IC0gaW52ZXJzaW9uIG9mIGNsb2NrIHNpZ25hbHMgb3IgcmUtc2FtcGxpbmcgb2YgZGF0
YSBzaWduYWxzLgo+Cj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBnZW5lcmljIHByb3BlcnRpZXM6Cj4g
LSBza2V3LWRlbGF5LWlucHV0LXBzOwo+IC0gc2tldy1kZWxheS1vdXRwdXQtcHMuCj4KPiBBZGQg
c3VwcG9ydCBmb3IgdGhlIHByb3BlcnR5ICdzdCxpby1zeW5jJyB0byBjb25maWd1cmUgY2xvY2sK
PiBpbnZlcnNpb24gb3IgZGF0YSByZS1zYW1wbGluZyBtb2RlLgo+Cj4gU2hvdyB0aGUgbmV3IHBh
cmFtZXRlcnMgb24gZGVidWdmcyBwaW5jb25mLXBpbnMuCj4KPiBFbmFibGUgaXQgZm9yIHRoZSBz
dG0zMm1wMjU3IHBpbmN0cmwgZHJpdmVyLgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBWYWxlbnRpbiBD
YXJvbiA8dmFsZW50aW4uY2Fyb25AZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmFsZW50
aW4gQ2Fyb24gPHZhbGVudGluLmNhcm9uQGZvc3Muc3QuY29tPgo+IENvLWRldmVsb3BlZC1ieTog
RmFiaWVuIERlc3Nlbm5lIDxmYWJpZW4uZGVzc2VubmVAZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogRmFiaWVuIERlc3Nlbm5lIDxmYWJpZW4uZGVzc2VubmVAZm9zcy5zdC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgoK
UGF0Y2ggYXBwbGllZCEKCkknbSByZWFsbHkgaGFwcHkgYWJvdXQgaG93IHRoaXMgdHVybmVkIG91
dCwgbG90cyBvZiBnZW5lcmljIGltcHJvdmVtZW50CndpdGggdGhpcyBhcyB0aGUgZW5kIHJlc3Vs
dCEKCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
