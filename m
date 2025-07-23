Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D0AB14885
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF4FAC3F938;
	Tue, 29 Jul 2025 06:49:42 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE561C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 11:33:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5561c20e2d5so8424986e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 04:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753270384; x=1753875184;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWJ1vaC9mhdphahBr4AxdkgQcamHOy69P9zg4SNDFJE=;
 b=TfGAjFM461ajK/ZOnLpFbZ2vd41n/6WmBpNuItzhz4VVc+GONiH2NJP9dC3fcLTBAu
 /EvsoHVWgJANmoKPaQ3buql6SgRVDvAWCiF4NJ1ldhKrLpxx90Nfht8WstPXqJkO5Qaj
 DHrjnxhbTsUV2ik2wzUjOrDTA1hBHqJCvY9hRMhYVOGtpi8uYcewkKYDyTHM2aW0j7YK
 EOwSgBu7juv9vU8RyGBWY2hxfrrRpf2bvFuh/Qh6WmjWWvaAURSfV4c+zeoEBid1Hzoe
 xaSskRvq+EN5kpqJaXQqq0fg9kDQZClKIcWaCxhbzMXe/oTTm02/aKJ3NZ0wKY2EGk3q
 XZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753270384; x=1753875184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWJ1vaC9mhdphahBr4AxdkgQcamHOy69P9zg4SNDFJE=;
 b=Kn49yNZdtFprXXdFEczuBEaZ8nNuK1yrOxAKQAgdKv5XC2pwGB6YkivWykOLI1ipVW
 OiVzePHw610yIr3nnNpcpXGL8HySTnBWD4sI0xMciXKEK1AgI5PN6Gt3v+vY64fRPE33
 YDe4RVUncyb8gXl+lqkWgQRXqCztBoOcqoqIyjcDro4rJjxR2M6/8C3QcoNFKWtA+yJN
 grHmlFLYWh1ImzurtbCUzCsRawQVJhkNGHM20mb3O207lygh4rnON4x5j8JIertw8Edb
 F3h4ndlMZnwx7AInTs5IkunCuXfQpULPkoWyTV0022oeKzoFrCbmaavjWLw3PiCH5pMb
 HuzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfgAq59ko3H4qgR6pg7l04WDpi1ErwM9vGuB/LAUWf3XjNinQAt0jjHAXDWyYWiCHOzAhthE8FOFhe/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzeG1J7s20/nfRG3Ua1w3GYTYtB+KTIPkmGbQdfLvupnCTF6d8V
 CS8zSP/Z3Xc4dPtCYrMF1MHhgLP9arL3dxDqgRhyqdZShmMGKcCfnMOyDv+mPF2fan58s477msD
 Lt7Zc5X7zG6MXUZNHYi4JO6ICtqtUe62YIZfnmedTFA==
X-Gm-Gg: ASbGncvEOcJj0PoJiP/Ebw25sj0Df1alYyYFXNdczEhv2bVXKnl0Cr+UjcoDRZe0KFD
 EqhxQZUdPOdOEPQ2ugQpYvYQQm1wxYR6msjRNnfCzvv50NzxTNxitDA3QZuGR29FDwhvdxnJ1yx
 6qptD19wktN/1vAe79S6SlO4E/DSVpZbQiMnuhNvFnbwS+KqreXDV1pE61mNuZjIyr3lH+n0+pk
 Iod+k8=
X-Google-Smtp-Source: AGHT+IGAxN/JXh1EsU6InJKjwWnNX99YeFSCDuYAjM788AXYCd+mzZfDQU6t+N5nE5+MTj/X0VenBnfY0SKgi/lR+VM=
X-Received: by 2002:a05:6512:3e1f:b0:55a:826d:fa31 with SMTP id
 2adb3069b0e04-55a826dfcfemr569462e87.37.1753270383732; Wed, 23 Jul 2025
 04:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250717063042.2236524-1-christian.bruel@foss.st.com>
In-Reply-To: <20250717063042.2236524-1-christian.bruel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:32:52 +0200
X-Gm-Features: Ac12FXz0suPsP2VK94jurXo8uzOTltHa9LM0UQkrYO80w5wNLroNiLg4heFForw
Message-ID: <CACRpkdZHw8am05Qcjp7FJyo7D7bZcvzZKVjdB7BUCq3FuQCy8A@mail.gmail.com>
To: Christian Bruel <christian.bruel@foss.st.com>
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: robh@kernel.org, mani@kernel.org, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com, bhelgaas@google.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [RESEND PATCH 0/2] Add
	pinctrl_pm_select_init_state helper function
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

T24gVGh1LCBKdWwgMTcsIDIwMjUgYXQgODozM+KAr0FNIENocmlzdGlhbiBCcnVlbAo8Y2hyaXN0
aWFuLmJydWVsQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gV2UgaGF2ZSB0aGUgaGVscGVyIGZ1bmN0
aW9ucyBwaW5jdHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0YXRlIGFuZAo+IHBpbmN0cmxfcG1fc2Vs
ZWN0X3NsZWVwX3N0YXRlLgo+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgbWlzc2luZyBwaW5jdHJsX3Bt
X3NlbGVjdF9pbml0X3N0YXRlIGZ1bmN0aW9uLgo+Cj4gVGhlIFNUTTMyTVAyIG5lZWRzIHRvIHNl
dCB0aGUgcGluY3RybCB0byBhbiBpbml0aWFsIHN0YXRlIGR1cmluZwo+IHBtX3Jlc3VtZSwganVz
dCBsaWtlIGluIHByb2JlLiBUbyBhY2hpZXZlIHRoaXMsIHRoZSBmdW5jdGlvbgo+IHBpbmN0cmxf
cG1fc2VsZWN0X2luaXRfc3RhdGUgaXMgYWRkZWQuCj4KPiBUaGlzIGFsbG93cyBhIGRyaXZlciB0
byBiYWxhbmNlIHBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0YXRlKCkKPiB3aXRoIHBpbmN0cmxf
cG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoKSBhbmQKPiBwaW5jdHJsX3BtX3NlbGVjdF9pbml0X3N0
YXRlKCkgaW4gcG1fcnVudGltZV9zdXNwZW5kIGFuZCBwbV9ydW50aW1lX3Jlc3VtZS4KPgo+IENo
cmlzdGlhbiBCcnVlbCAoMik6Cj4gICBwaW5jdHJsOiBBZGQgcGluY3RybF9wbV9zZWxlY3RfaW5p
dF9zdGF0ZSBoZWxwZXIgZnVuY3Rpb24KPiAgIFBDSTogc3RtMzI6IHVzZSBwaW5jdHJsX3BtX3Nl
bGVjdF9pbml0X3N0YXRlKCkgaW4KPiAgICAgc3RtMzJfcGNpZV9yZXN1bWVfbm9pcnEoKQoKSWYg
Qmpvcm4gSGVsZ2FhcyBpcyBPSyB3aXRoIGl0IEkgY2FuIGFwcGx5IHRoaXMgdG8gdGhlIHBpbmN0
cmwgdHJlZS4KCk90aGVyd2lzZSBJIGNhbiBhbHNvIGp1c3QgYXBwbHkgcGF0Y2ggMS8yLCBidXQg
dGhhdCBkb2Vzbid0IHNvbHZlCmFueSBwcm9ibGVtLgoKV2hhdCBzaG91bGQgSSBkbz8KCllvdXJz
LApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
