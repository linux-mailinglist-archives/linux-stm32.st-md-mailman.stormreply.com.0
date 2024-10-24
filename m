Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096E9AF546
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 00:20:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D18EEC78F62;
	Thu, 24 Oct 2024 22:20:29 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6CC0C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 22:20:22 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f53973fdso1191916e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729808422; x=1730413222;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGEbKYgOX5rc8HvwKP+HLvbmqzBX4NlMnm5BCSkGUCA=;
 b=ixPYSiQxnKiXKONFcfgJizga9E6M1SLr4Kx2vac9kitn1YRMGgW+4MVSmeDhaSFNPR
 24kSREcnD27GMi/G9y3yYwA+eZ2on65l6L0IKlz+Ge7lr6xWCQ86kg2+Gq/axPxwzom7
 scfktCrOmIcpVHqe6qsoOX3Au/ZfC/yiJZyGjX1LwkkobMA+oLYhxaaDWZzW4iT2XhNK
 3OBQps4i633Vc+r7jD3WJFHc4+BvJ+BMCu0Dp6r+XDIxjUWp2iOf4mNj8aOWbQ5RUYtW
 uQ5mXxOWcs502qYOBr68d8hX6D7+74pSlEBWT9wmbom34ARs8QZVuuyZbxTaDW9PROCb
 XTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729808422; x=1730413222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gGEbKYgOX5rc8HvwKP+HLvbmqzBX4NlMnm5BCSkGUCA=;
 b=ExdKaALZlMINKNrwkzrWSjASHkXKZa+BdZwQljsxQm4sZf/Zgm9wRO2gh7AeWIc8GG
 ozMA9K2hQu01fOKP/Mx/uWo+ZEIMXPAzYNAjgc/dtrHekLNjgd5H9yF4ppeyJvw4hF3U
 mTI7dV5VoehwpfZ1eBqvjTi+PMHUi05kmsn4R2SAsff3WTHJZy/dcLQQt9/U8j2ynfzx
 4kyuhChh6g2/JhBT2RR+yCzRRTcth0F8GsTpkEehkAIcCZaOtuYS9FvJGqrVcSqeP2/K
 7kAW6Yrm21ADnVs4ljN7tZXNHWDanUXyiYS0/V7jiCA22luLCdeCNWh/GJH5gslVvE+q
 EEvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTPAs4DiFKYtflSEVJLrCq40aEnwa5efG+xSeRKh6n2XB6QZfAkPUvIQSTQPVP1ua6vhjEECiHqNi0Zg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzwuEpftE4Gabk8rD47bXhVa54H7HbhoEftJMu2uDVYrTnqORaK
 X7CZhM29g+V4+74t4ZJ7SkiEk8qkuN+S+fB27qKL7O4/SNQTytW1ss0XytV2AxKmPrBVVQCC1FJ
 BecpjTOFojn9MMf9nv7Hztj3RqVAfOWXvPSVlAg==
X-Google-Smtp-Source: AGHT+IHGIsrqaQ/7HUksQWKQu+JFY6k3cD9zvm7NsmQfaV2x40ET3jcwxFaCHaKIFyRB5Uq3hXr7QboUps1FaB+xBco=
X-Received: by 2002:a05:6512:110e:b0:539:fbba:db71 with SMTP id
 2adb3069b0e04-53b23752862mr1167501e87.26.1729808421764; Thu, 24 Oct 2024
 15:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 00:20:10 +0200
Message-ID: <CACRpkdb=-gw0ryP1H+K9BQS_kUrQG9STLQMSrVWs8BZ=QejV5g@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Cheick Traore <cheick.traore@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/14] pinctrl: stm32: Add new features
 and support for more SoC
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

T24gVHVlLCBPY3QgMjIsIDIwMjQgYXQgNTo1OeKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgdGhl
IHN1cHBvcnQgZm9yIHRoZSBuZXcgU29DCj4gLSBTVE0zMk1QMjE1LAo+IC0gU1RNMzJNUDIzNSwK
Pgo+IGJ5IGFkZGluZyB0aGUgc3VwcG9ydCBmb3IgdGhlIG5ldyBmdW5jdGlvbmFsaXRpZXMKPiAt
IGlycSBhZmZpbml0eSwKPiAtIFJlc291cmNlIElzb2xhdGlvbiBGcmFtZXdvcmsgKFJJRiksCj4g
LSBSZXNlcnZlZCAoUlNWRCkgcGlubXV4IGZ1bmN0aW9uLAo+IC0gSU8gc3luY2hyb25pemF0aW9u
IHBhcmFtZXRlcnMsCj4gLSBjb21waWxlIHRoZSBkcml2ZXIgYXMgbW9kdWxlLgo+Cj4gU29tZSBt
aW5vciBjb2RlIHJlb3JnYW5pemF0aW9uIGlzIGFsc28gaW50cm9kdWNlZC4KCk92ZXJhbGx0IHRo
ZSBjb2RlIGxvb2tzIGdvb2QgdG8gbWUgKEkgc2VlIGJpbmRpbmdzIGFyZSBiZWluZyBkaXNjdXNz
ZWQKYW5kIEkgbWlnaHQgaGF2ZSBzb21lIGNvbW1lbnQgb24gdGhhdCBhcyB3ZWxsLikKCkkgd29u
ZGVyIGlmIE1heGltZSBjYW4gbG9vayBvdmVyIHRoZSBjb2RlIGFzIHdlbGw/IEhlJ3MgdGhlIG9u
bHkKU1RNMzIgbWFpbnRhaW5lciB3aG8gaGFzbid0IHdyaXR0ZW4gYW55IG9mIHRoZSBwYXRjaGVz
IGFuZCBJIHRoaW5rCmhlIGtub3dzIHRoZSBkcml2ZXIgcHJldHR5IHdlbGwuCgpZb3VycywKTGlu
dXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
