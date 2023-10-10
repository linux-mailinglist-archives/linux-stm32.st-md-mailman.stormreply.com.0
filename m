Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 691547BFD9C
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 15:35:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35886C6B442;
	Tue, 10 Oct 2023 13:35:55 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB21EC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 13:35:53 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5a7afd45199so15349507b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696944953; x=1697549753;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwaODl/6SngYIesq4fd26Zf7cKEGOc6/vuChneskjdc=;
 b=t5QpoxPP2FOBz+zihShpDCOahqBvHKCn3toyqHtzcSa/byM1fOrOl7DgLnOXzaKpnf
 x52wfv3L4kWfek3Z/2ZcEXMAIIka0AuUAFltyqOnJNkyg/rLaeq5qfgbxl8IWl3nlOLD
 vSJPGP2gFTnREC5ieby+NU/PUIakgeo4xcx41qDcOh1H8FvloJyhq8SgBIPA9UVO14nS
 4ADtUIg3codMcVzsX3MLdraDEn/8dzR6siuxZTQ72vr4MmopDvLq5sbMLa2By/+fcvT6
 Sq73iu/BFO6D3BA3pnsZ+SuhKKFlo2IZDIjqD7ZUfGMBhSQrmZ3vJCj01lfaBxEROot2
 OB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696944953; x=1697549753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwaODl/6SngYIesq4fd26Zf7cKEGOc6/vuChneskjdc=;
 b=QUF1/3wiGNi/PSQaVjRt/WXwQGpsSf4Jlc2Livp9SfY4/dpILqjklqvMHZynJJ0cY9
 nAAMW6HnirGl/uU638ZePPN8i53AvOtBou6ehDG037/0rlNi0fxJ+I+YtDCytVd7fgLT
 3EqhSQYolSAY0JsFpn1GFKkMt+1SRpBpHDqwgW4+RKBDG7zYyIEdIPq/MbSqsyS1f74F
 9oiu/MgzrPI+Z32LibNt+FXgywMo9VmucPJ7c6QTmyLM5m6q6by/XAO8teQr7JBNUSsc
 r1Pz/ldNrGjEN3XVcOHL89e+atumpZWwMP0uwGuJaTMfNGgWNUUWw3QwTLuUO8f5/DUe
 YNWA==
X-Gm-Message-State: AOJu0Yz2xAW4vl/LPS4+DFUFp06AhGgxR7JmN5XSZwDwN9s6cjIZgyEZ
 6wN45refK1mW6THF546oZWkJQJSD4jbG22XYNLj7dQ==
X-Google-Smtp-Source: AGHT+IGG3gi8s+Fcz5VP7yTY/DRWNo6Zujz9HnOJaU190QxNyFwVrfyV42NA8H4la4b2WLErva3zQYndcUdDa01huh4=
X-Received: by 2002:a81:5cd5:0:b0:595:2094:f87 with SMTP id
 q204-20020a815cd5000000b0059520940f87mr19266136ywb.47.1696944952747; Tue, 10
 Oct 2023 06:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
 <20231009083856.222030-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-2-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Oct 2023 15:35:41 +0200
Message-ID: <CACRpkdYoqxP89nC=e8Yrt+Jxs1je4jnBBGtaUQfkKpjcR5vQ6Q@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/20] pinctrl: stmfx: Improve error
 message in .remove()'s error path
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

T24gTW9uLCBPY3QgOSwgMjAyMyBhdCAxMToyMuKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgoKCj4gVGhlIGRyaXZlciBjb3JlIGhh
cyBubyBoYW5kbGluZyBmb3IgZXJyb3JzIHJldHVybmVkIGJ5IHRoZSAucmVtb3ZlKCkKPiBjYWxs
YmFjay4gVGhlIG9ubHkgYWN0aW9uIG9uIGVycm9yIGlzIGEgZGV2X3dhcm4oKSB3aXRoIGdlbmVy
aWMgZXJyb3IKPiBtZXNzYWdlIHRoYXQgdGhlIHJldHVybmVkIHZhbHVlIGlzIHJldHVybmVkLgo+
Cj4gUmVwbGFjZSBpdCBieSBhIG1vcmUgc3BlY2lmaWMgYW5kIHVzZWZ1bCBtZXNzYWdlLiBUaGVu
IHJldHVybmluZyB6ZXJvIGlzCj4gdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLCB0aGUgb25seSBlZmZl
Y3QgaXMgdG8gc3VwcHJlc3MgdGhlIGNvcmUncwo+IHdhcm5pbmcuCj4KPiBUaGlzIHByZXBhcmVz
IHRoZSBkcml2ZXIgZm9yIHRoZSBjb252ZXJzaW9uIHRvIC5yZW1vdmVfbmV3KCkuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPgoKUGF0Y2ggYXBwbGllZC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
