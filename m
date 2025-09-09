Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E3B4A9BC
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1903C3F93B;
	Tue,  9 Sep 2025 10:12:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 958FEC3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:29 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so33094605e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412749; x=1758017549;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=;
 b=T6ZuoDDb5CKDsEeDesSKqCk1IhR6JEcGmLn3ONqY6i9OOlUNNSeYyczmDTktCybbIP
 p0P0G14vNyCN2qTc6SfBCyK/L0qoOlvu11iP1SIu9RKpi0WUcvWaSS4/ZU0PWfb68zeW
 bHwQq8CFU/88eKjh0+7rfQX5XhocdZo5XMsDzMrxNJQHzhwQylNikmCFEM3nFwCVxPHb
 2nQc4DOOpHJKHuXlicXz1pPZ2xVovjUwxNTtHnAb4BtZC5Y3e7zDo4zgsm+CTQOV0FxD
 a/ucE+QSpzWNFoiGIYBAqFCmJxY6IEJsUMmQ9WfB/9xdMaMWETRxtG+tolWoWWcrPlhB
 /G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412749; x=1758017549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=;
 b=MWqibNts8LoLRLGuAqpE+5EqT362HMmckQZkJt7Lg9sCm+xZ6wnMmeXmI4iUOUQulq
 eZbd3ALhFuHWHbpKOr0u6Q+0gRXLet0eM5mUqHAQJxwvrJUrUED2L4dvDmg9v3oeCtjl
 X+RQDJVRbtXRBs2guhA1wvGZR2Ies3vdsZa/8CdXjWGHZEHhJ3Wmi+y+T8A42hUsob15
 a+b94vk2hcUC/6Vl+3tNk0zWeLq7YmGjbFCa5DfJ+uUzJQaxR3MLG4c5lt4Iyn162XOg
 BELbYQpRx9z1IQKZgmNUn2ydbFoHHKM0iPO5IhZAeKsoUCS5PSD6zPYV2Qbnqx1QU+1L
 KauA==
X-Gm-Message-State: AOJu0Yydvhxk+13kHg1NhVzpR7Y6ISh7FKKZ7Iom7XVCNUxZ4VJWr6p7
 F95Ep8RVexjpvgnmrs2oAmsIFj0tlOEjfQD1pN3vd9GhoA7U1IglkkN2
X-Gm-Gg: ASbGncvvCBx6WI4/onuX6i+2t7gVUhiI6cUnHRnj6NFKj8kAVGGGiUEeHV9l3+hFoSy
 JPp50E0xvRCZCufmpr6KK5mGFy4fJ8vjGnX5HiRA+w+7n3xJRXQyV0aQXO0L8MpifjrjSqMd378
 LfjIV25oWpCLZINCgdmlChNC6mByWomL6z4ygAuCHwu90r4AOk5+Nolo6Ql5c8gPpfALddR8rCF
 X3n86YoNt7GefzRLL+yoYC9bwXcJqgORKuj2gxp/E6dSS+fW14xZ3yzl17CxzSFBDoYRHbB4AxM
 40BECx/vRvQCr9GvA7lmkzaZWp/JfRdbqy+RSR8G2+gLsB4jJjkHhTi3rL9+Y/TC22cAipoUOpi
 s5ux58Dio7Eqj7VWj1HCGxpe1bvFoXPMdP937phXNKwGbJ2A94jkq+joiKOgScksec+1KtqltvL
 rykcEQ+fd0llwVUfw=
X-Google-Smtp-Source: AGHT+IGKpZNRoMZ6IP/YPEfGuW0EUWhvKOcP7+Jc1iIS/x57GSvJehzCKAQ3NC+/6rTUpYigpfqyQA==
X-Received: by 2002:a05:600c:1c9d:b0:45b:9912:9f30 with SMTP id
 5b1f17b1804b1-45de241c015mr86065355e9.6.1757412748701; 
 Tue, 09 Sep 2025 03:12:28 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45de15de318sm129398365e9.13.2025.09.09.03.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:28 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:13 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-6-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.15-dev-dfb17
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-perf-users@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 06/20] dt-bindings: memory: introduce DDR4
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

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
SW50cm9kdWNlIEpFREVDIGNvbXBsaWFudCBERFIgYmluZGluZ3MsIHRoYXQgdXNlIG5ldyBtZW1v
cnktcHJvcHMgYmluZGluZy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29m
ZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xs
ZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMs
ZGRyNC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250
cm9sbGVycy9kZHIvamVkZWMsZGRyNC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uYmYxZGFlMTViNjViCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyNC55
YW1sCkBAIC0wLDAgKzEsMzQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwj
Ciskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
KwordGl0bGU6IEREUjQgU0RSQU0gY29tcGxpYW50IHRvIEpFREVDIEpFU0Q3OS00RAorCittYWlu
dGFpbmVyczoKKyAgLSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CisKK2Fs
bE9mOgorICAtICRyZWY6IGplZGVjLHNkcmFtLXByb3BzLnlhbWwjCisKK3Byb3BlcnRpZXM6Cisg
IGNvbXBhdGlibGU6CisgICAgaXRlbXM6CisgICAgICAtIHBhdHRlcm46ICJeZGRyNC1bMC05YS1m
XXs0fSxbYS16XXsxLDEwfSxbMC05YS1mXXsyfSQiCisgICAgICAtIGNvbnN0OiBqZWRlYyxkZHI0
CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBkZW5zaXR5CisgIC0gaW8td2lkdGgK
KwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAg
ZGRyIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJkZHI0LTAwZmYsYXpheixmZiIsICJqZWRlYyxk
ZHI0IjsKKyAgICAgICAgZGVuc2l0eSA9IDw4MTkyPjsKKyAgICAgICAgaW8td2lkdGggPSA8OD47
CisgICAgfTsKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
