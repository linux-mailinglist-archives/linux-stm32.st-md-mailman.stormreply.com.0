Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69292C119FD
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:11:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DBE2C6049D;
	Mon, 27 Oct 2025 22:11:04 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56497C6049A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:11:02 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-378de7d3057so46245401fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603061; x=1762207861;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9H38XxmVOscTdAXBIMgyb10vFFsNxVOxLuwwMxDzMg=;
 b=kKj1XOAVIMWWz9foscUE8vpw0qDvaciERCRVtaKoFi424fOQP6T8KHqcLxFaOOuNWm
 fMZRe7+1xSibfkqVZOeMejWaZITG80F/DcZC5B+5Cgvnv3obBiVEPlBhD73U4NIEDxBQ
 maINEaz8ZxlKHCyCv9Y41bytkmB2t5SY3aHhO8OhtjCqLB+pPUxfx13Cj7NaBhganZpF
 IiVhVLpB12UXMGd+CbEEPABuKSyBukPwdb0Ro+rV1SrV3apeHijLdpPzVjqER7vME42m
 Ut80BiO7Z3K3vlIfMnf6Y3VCw/VVatKYYktS9EyPHrFAOefKjWAGzUFUhqeDnAb59fIC
 cDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603061; x=1762207861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v9H38XxmVOscTdAXBIMgyb10vFFsNxVOxLuwwMxDzMg=;
 b=TGNVOGyoqSQ1wj0ajgKRJosOK9+GkE7DHbS76tFG9oeL69El0OQbcUwJS+M1xpGrFd
 Pve2V2+Y27JRPYgzWpMeYyb8hdYulaeh9vPSJN9QjPrd/baGo7vww3KL1/qxfUSjyS/I
 7NF1P7WS+mlJKbDZTLGGqXq87CRGF/CC4VsxUwpCrpX/VZYzWYOn/Z3DiKTe/TWNZ2Mn
 URSpZRCAwGgb6PbQzd9vwpnOPl55fsm0qWegSaoaYe7GPAnsV6Go8qH4JnaNgfgkr0bO
 bGEH+DJHCfG1Ol11MNNZ74vX424n+0uSgUMt9z71sVtqC8q0z7YUd+NfNMdYRBWZpOLM
 pTAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6FODXEoRjDroG8wkA+RooXowju+NCGf+z5bsA9l2FH7i8MatOD+fZGwhb6lKcnwRgoqd1l9ZB0aI4Rg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YykN+RAgq1lK7lZ6wZ8H9Ry7jOJ1VQCNArD11xCEKf3v0+qwJi6
 o98tkyDHXydQUw3kdkwP+M3fX+YHr+/lQC6k+IRpH3/7820+kAhJiiizCnMg5CpFPSjMmyADhYJ
 kZ0zgzEuRsxEKEMemWT0J7BOoDwkwguOxx99JehUMZA==
X-Gm-Gg: ASbGncvMuGTmGtCzhZ0FIxhvyx2NqqaYmC4rDQNjZo0GtLerBIHW58vMHYPh5vcxcJ/
 tMv+Yd2ZEYMS49qdeZmu6GZUOO37eZb/hVrvLEK1D2ULHVXNNjicbwJt9+/WrOdZz6nYfB03cEc
 S9uyVQ3MH6ifADMubG4PqKYM/PlOxfqAiTVTjZ+PIiPKHhTWxifCC60NLRDJbWHdlaSYxP1fUia
 dIF9POWJ1usRM7UVjwrAFYG396kDUt9X/ITxs/XQ8VPkluImrONyPWvDPIV
X-Google-Smtp-Source: AGHT+IE3B73ELbUQavOS3+9V8O99ObkxGs1XUoqNSIUdKZBsD2NXFZZaX5rjgwqiz7ABPv8TjN+usn9RpujxaCi3agw=
X-Received: by 2002:a2e:bd89:0:b0:378:e097:e195 with SMTP id
 38308e7fff4ca-3790775a094mr3319331fa.33.1761603061549; Mon, 27 Oct 2025
 15:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-4-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-4-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:10:50 +0100
X-Gm-Features: AWmQ_bln6fs42YRtiqP8ik_NX7rcLNvMO96ITfFJr8FlYTKtoHQT9TbJlFukMl8
Message-ID: <CACRpkdZETuUGn47foo49xhj5krfE42sJ09vYf7EuKzm7J7kfUg@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 03/12] pinctrl: pinconf-generic: Add
	properties 'skew-delay-{in, out}put-ps'
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
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IEFkZCB0aGUgcHJvcGVydGllcyAnc2tldy1k
ZWxheS1pbnB1dC1wcycgYW5kICdza2V3LWRlbGF5LW91dHB1dC1wcycKPiB0byB0aGUgZ2VuZXJp
YyBwYXJhbWV0ZXJzIHVzZWQgZm9yIHBhcnNpbmcgRFQgZmlsZXMuIFRoaXMgYWxsb3dzIHRvCj4g
c3BlY2lmeSB0aGUgaW5kZXBlbmRlbnQgc2tldyBkZWxheSB2YWx1ZSBmb3IgdGhlIHR3byBkaXJl
Y3Rpb25zLgo+IFRoaXMgZW5hYmxlcyBkcml2ZXJzIHRoYXQgdXNlIHRoZSBnZW5lcmljIHBpbiBj
b25maWd1cmF0aW9uIHRvIGdldAo+IHRoZSB2YWx1ZSBwYXNzZWQgdGhyb3VnaCB0aGVzZSBuZXcg
cHJvcGVydGllcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJv
cm5lb0Bmb3NzLnN0LmNvbT4KClBhdGNoIGFwcGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
