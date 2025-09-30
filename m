Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9116BAC1BC
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 10:46:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D5ADC424C6;
	Tue, 30 Sep 2025 08:46:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA64DC424C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 08:46:56 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e47cca387so36852405e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 01:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759222016; x=1759826816;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
 b=jaNvh6VYxBC6g+nwpRaZgH9X2V+PUAVlx5WcNoiSqvZmxX9Gam4wDJPUAPMlzB+fow
 I24rLpA8V69DecRvektYS0chUMoGR6smy1abqEoXaLhT/z1V02Q6+WGl6aNAYUuSzZ85
 umIxHjhXdVUYx+os2oBsQawQp8MMgNzodF/eRk2tcJ5W8rle9NCO9UCpY7w7Zq4WMdjj
 bj2W6QJJyf0nHhCymkqS0xjN3ZECoMbs+iOW6KmGrFTCHP47PqNeF0+5zHjZcT+vX/sT
 P5fIkwYibrQsLaLprDZdpe1OQOuaExesk5TcALavnVakIqgjZxEIpTwSYjxtQmkZOdhP
 YtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759222016; x=1759826816;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
 b=Z1kiU3RqO96VtzyEibpN+UoMfLvaBXrdotksY7JyjSecC3/Wa15kzyTmIZTA6YJuLY
 nOR0h5YHj+ib5Dlmet9TEZ4FT7hWUCyIvCOqsQ3HNJS55wEgjyn/r/2eokniZVpxOyGa
 pUjOn8FhYSmSwhW9OL3O0yXV/tqsy/Z++pM7BNibzq0CbtkinC0UNaX3lc9V5HrPy7O1
 gfHr9vWivWqjqrOt9+CnSAzza70A8SEcY+HjK8+Lgdrw6+KSjFd8fjxJrL4jVnmh8rat
 WEpskiB+/rxq4aQAXk+gZWLR3isxrkPZBCLtObQ8eak9iiygNpDq8uhYzKsalaLoifC8
 ZGOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVM1Phc/xwnc/H8WqtnkcZrFnjI4YRZQ6FRySU/T1/Dcw37imSmCSKnzywriGtgyaMrw+qD3Y0E5vKJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxiOeLyt4lexqgUvyV7J6RCEGMLqyj1DVr3M3QyA8oCC/sKyxob
 POViSWFNooJfw2jZl/Mq9Xmhuwoq1ja3NCo4Kqg39x+i52pQ6nqMgee0
X-Gm-Gg: ASbGncsq9DOg9U9/TRDBqWNBcQdXVu205m/zg1RPNZX/J0VC+IWf5OWhA2jahr4Nej3
 d0OuJDb+fBKBNyHAg801k9CB5kxS7R5vuY+teSV24Zt/S5JtiAAzsxfJMuBx51jyssMD34ejIOD
 aZfXGafLAntiOxhvt8iAFndtnFFdpeZPaKfyueWswEksFTZy5silurabsb4STDyQBFWNeYT3jHI
 7DY7kks7M5VV1XYZA5SKqqs5yBAelh07SgclMf+Gv4r3OQN0AY8IEP+mkjnpPFsdHRDEzloQYmC
 lv6av6kWOOMr9fq04ba8r6HhW+Z1JYpEtnzJkggNYIpZaEVN8Nh5zihTi5RcytPUw6uthyGOMAr
 B/G6QVr6ovEEzBL8WZY0+z9nNgZl9uXRfXWaJw9EHGAWG+yoQf2kg14O/aTCYQE3IK5mWvp7TLG
 BDT8n2CR/XHlyOg5D1eFczELS/QXOw5WmKNMzwFdkXJwG2sVksRP8=
X-Google-Smtp-Source: AGHT+IGVQJJHamU6NUy4goartpYaIkfUJZ0iBlzOkN6u19q5qmKKBnwS/nG0zfk91bdRAJZUfDhusw==
X-Received: by 2002:a05:600c:1d16:b0:46d:5189:3583 with SMTP id
 5b1f17b1804b1-46e3292fea3mr191174625e9.0.1759222016056; 
 Tue, 30 Sep 2025 01:46:56 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net.
 [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f536a3sm54098975e9.8.2025.09.30.01.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:46:55 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:47 +0200
MIME-Version: 1.0
Message-Id: <20250930-b4-ddr-bindings-v8-4-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 4/7] dt-binding: memory: add DDR4 channel
	compatible
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
QWRkIGluIHRoZSBtZW1vcnkgY2hhbm5lbCBiaW5kaW5nIHRoZSBERFI0IGNvbXBhdGlibGUgdG8g
c3VwcG9ydCBERFI0Cm1lbW9yeSBjaGFubmVsLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUg
R29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgpSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUg
R29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvbWVt
b3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFubmVsLnlhbWwgICB8IDEwICsrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVk
ZWMsc2RyYW0tY2hhbm5lbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsc2RyYW0tY2hhbm5lbC55YW1sCmluZGV4IDk4
OTJkYTUyMGZlNC4uODY2YWY0MGI2NTRkIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFubmVs
LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250
cm9sbGVycy9kZHIvamVkZWMsc2RyYW0tY2hhbm5lbC55YW1sCkBAIC0xOSw2ICsxOSw3IEBAIG1h
aW50YWluZXJzOgogcHJvcGVydGllczoKICAgY29tcGF0aWJsZToKICAgICBlbnVtOgorICAgICAg
LSBqZWRlYyxkZHI0LWNoYW5uZWwKICAgICAgIC0gamVkZWMsbHBkZHIyLWNoYW5uZWwKICAgICAg
IC0gamVkZWMsbHBkZHIzLWNoYW5uZWwKICAgICAgIC0gamVkZWMsbHBkZHI0LWNoYW5uZWwKQEAg
LTYxLDYgKzYyLDE1IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgICAgLSByZWcKIAogYWxsT2Y6
CisgIC0gaWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxlOgorICAgICAg
ICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IGplZGVjLGRkcjQtY2hhbm5lbAorICAg
IHRoZW46CisgICAgICBwYXR0ZXJuUHJvcGVydGllczoKKyAgICAgICAgIl5yYW5rQFswLTldKyQi
OgorICAgICAgICAgICRyZWY6IC9zY2hlbWFzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMs
ZGRyNC55YW1sIwogICAtIGlmOgogICAgICAgcHJvcGVydGllczoKICAgICAgICAgY29tcGF0aWJs
ZToKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
