Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3927E9E48
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Nov 2023 15:13:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1E96C6C839;
	Mon, 13 Nov 2023 14:13:08 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BB62C6B47D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Nov 2023 14:13:08 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5a81ab75f21so51412937b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Nov 2023 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699884787; x=1700489587;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6+pycgnZG58S2WudqRgu7/urmppv02RyU1W64E8pNI=;
 b=wkxlrK6hX8FYD0tkvQh7bOzNKszgSY2/FPhZ+6s2++SNOdcisbNeKe5TKpPfLs1Hug
 fquCtsAotAAwIX4RGwzMStPW04bX77XqvHra83cTXO4MHY+l9KEdkEY9WvSnVctnNNQp
 8BxgmLgs9IUDHPEGnS7aQPfAF50i5dZL82Mh6bhU1W609RElakcI0fW9kRvNX9PzFeOD
 xqvStC4JoJUHq9XQ7oBkSg8dYrKQNyiY2KYBv+eYnxQsDhncizAAFVXCITcNx9c/gBWA
 oVX+IJBI6j2hEXHQ9SrfzIn4fRzJzE8IO+jeMRW5aOsbH3acElJYbujsfAr5Ou8J7pDT
 24Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699884787; x=1700489587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j6+pycgnZG58S2WudqRgu7/urmppv02RyU1W64E8pNI=;
 b=oF+kPgvSppUK+jAWWsc9Xd6ahuBge4QDa4lCrmDaumDUBgR6Cte7Qp2QpxxjsRd6sa
 90PK4N7QIgn56YIEVWzU2Yo4frYk/dVREqT85MajlRHNHUlyz3+DhoYO8IDN3C78Zp1i
 mB3fKfU1XeWJflo98IxVmF1JG41YVEoqYQCeLJYKE5rNhnaAp3H6amqOF5ohTLTNDy+o
 PPTNkBJ4VGjAI67TuoVchtzsmA7/Oaz/KO0pZhlrNgVsVS4k/yaIVVMOWJfPhYM2MAzz
 9StHT31TdtZVURN2XUABg9Ptwp2qCbvbdBOAH3Rj9h9ED2t6Sca/EKkyfqAxj68TpKM/
 jb+g==
X-Gm-Message-State: AOJu0Yx/JSE1KfinYVjujfhh7wXznkLM5BeTRjLW5iARb74CnirsNR9d
 VQK6FNlO5bTOGKysO9DJxeazTEsPuOOUP1fx4oaOyg==
X-Google-Smtp-Source: AGHT+IGD26Kjd6X8qP+F+2+1/G7gpSLJN4W5nonKQd8XlGJZqGmUhTtV0CPqPtSKJ5F9k1AZ7XAeeH4NgiSFjX1VrYM=
X-Received: by 2002:a81:6c54:0:b0:5a8:1ff3:ef96 with SMTP id
 h81-20020a816c54000000b005a81ff3ef96mr7595283ywc.7.1699884787153; Mon, 13 Nov
 2023 06:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20231031080807.3600656-1-nichen@iscas.ac.cn>
In-Reply-To: <20231031080807.3600656-1-nichen@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 15:12:56 +0100
Message-ID: <CACRpkdZdmJQPx7-q0QY7=TpSDxr0W1md-sGwbKYc_kbCdEmY4w@mail.gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: robh@kernel.org, bero@baylibre.com, geert+renesas@glider.be,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dario.binacchi@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: Add check for devm_kcalloc
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

T24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgOTowOeKAr0FNIENoZW4gTmkgPG5pY2hlbkBpc2Nhcy5h
Yy5jbj4gd3JvdGU6Cgo+IEFkZCBjaGVjayBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiBkZXZtX2tj
YWxsb2MoKSBhbmQgcmV0dXJuIHRoZSBlcnJvcgo+IGlmIGl0IGZhaWxzIGluIG9yZGVyIHRvIGF2
b2lkIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZS4KPgo+IEZpeGVzOiAzMmMxNzBmZjE1YjAgKCJw
aW5jdHJsOiBzdG0zMjogc2V0IGRlZmF1bHQgZ3BpbyBsaW5lIG5hbWVzIHVzaW5nIHBpbiBuYW1l
cyIpCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBOaSA8bmljaGVuQGlzY2FzLmFjLmNuPgoKUGF0Y2gg
YXBwbGllZC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
