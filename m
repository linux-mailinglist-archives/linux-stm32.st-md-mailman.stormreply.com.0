Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6C7EB108
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 14:43:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB2B3C6B479;
	Tue, 14 Nov 2023 13:43:18 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8DA5C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 13:43:17 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5a90d6ab962so65312917b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 05:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699969396; x=1700574196;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e9I1+HuMjUOXRka8oYccWC1sMj8od0MqtKuun6lk2Gk=;
 b=LpOvLf7Nt6YDsd+XFfGoXakvePVVatXSXQrEtYO5tAJ5XoE0uW0k+1WuStj/eoErgJ
 sXi+Dwj6DQPWqz3o/KY3oHGMDrbpl1HAqLxLQK56kRlSDoFzZs+DOxSeAq/++HWen01+
 jjENtTSNRcq05bJCt2vlhI3hFKxtXb/YXT1VTD4oVt00aF7O/9pBjcw/Pp0WBERKng6k
 YqkFeUvl+Q05KZZSyTlpB0oHLLQ2cnxegyWsRYCEAn5vq/DfOo+kSca+Tx1mQ//SXuPC
 XIszPVTRl4GSjpWqxPyRDebA9IPIwWpE/sC5m72Tc9688EqOVpIuultDYgpnpYGsupfP
 oQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699969396; x=1700574196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e9I1+HuMjUOXRka8oYccWC1sMj8od0MqtKuun6lk2Gk=;
 b=mTyVz/KJyzii/89Ai7ra0GUvpcjwgLJlLs/97Amz63xucb17wweWepvE6O8lBwqjAq
 eJA9UlehV4t5g4iL+eg79sWYpk4dA8curUg/VzIBAS1zfnG0nMuPHTF4Z1Gf88oOaKvH
 863bRemKt7Rk6/3bKRMnx4YSwdgtrNAda4Vek3jm7EIXKFd9iCkeJibp1PKSAIQyECxp
 wdPuzXkkavt/LJek9tH0PZvcwtjEXH2nZxuRCYNgPooSb1mKNqlf2pfWYGLpdH77ZCPU
 ECa+e8WSl05yu8K9DsgPoKh3pEGwikllZxMvmIhxEobcu9ZYDtwdIsw7Jy/kFrjEAowZ
 GKHw==
X-Gm-Message-State: AOJu0YxqTqbYfXwQXbafEAmAwSjpGaBc2M5vnJA04Af090jAY0QGqwUU
 jITmHid7/gLej3yACMqXJrnbmycRqzCzuhOjwJDkOQ==
X-Google-Smtp-Source: AGHT+IETVNVRx+UHRWTMbFT8MvR2FR1FnRXu1s74l+weM1l/KrAH5OgSnaA8wp+8GfGDd6aNNN115dmrpYwW1pLZt5o=
X-Received: by 2002:a81:8357:0:b0:5ad:cd52:d6f0 with SMTP id
 t84-20020a818357000000b005adcd52d6f0mr10580139ywf.45.1699969396564; Tue, 14
 Nov 2023 05:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20231107110520.4449-1-antonio.borneo@foss.st.com>
In-Reply-To: <20231107110520.4449-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:43:05 +0100
Message-ID: <CACRpkdZziT+3E30-u_PV8Q=eR=8r8N-s7QomCbmdLi2BtD4WXg@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: fix array read out of
	bound
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

T24gVHVlLCBOb3YgNywgMjAyMyBhdCAxMjowNuKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFRoZSBleGlzdGluZyBjb2RlIGRvZXMgbm90
IHZlcmlmeSBpZiB0aGUgInRlbnRhdGl2ZSIgaW5kZXggZXhjZWVkcwo+IHRoZSBzaXplIG9mIHRo
ZSBhcnJheSwgY2F1c2luZyBvdXQgb2YgYm91bmQgcmVhZC4KPiBJc3N1ZSBpZGVudGlmaWVkIHdp
dGgga2FzYW4uCj4KPiBDaGVjayB0aGUgaW5kZXggYmVmb3JlIHVzaW5nIGl0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgo+IEZp
eGVzOiAzMmMxNzBmZjE1YjAgKCJwaW5jdHJsOiBzdG0zMjogc2V0IGRlZmF1bHQgZ3BpbyBsaW5l
IG5hbWVzIHVzaW5nIHBpbiBuYW1lcyIpCgpQYXRjaCBhcHBsaWVkIGZvciBmaXhlcy4KCkFuZCBu
b3cgSSBmZWVsIGJldHRlciBhYm91dCB0aGF0IEkgc3BlbnQgc28gbXVjaCB0aW1lIHBvcnRpbmcg
S2FzYW4gdG8gQVJNMzIuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
