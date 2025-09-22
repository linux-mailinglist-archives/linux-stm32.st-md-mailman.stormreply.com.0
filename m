Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 920A4B8FE79
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 12:06:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55A83C32E8F;
	Mon, 22 Sep 2025 10:06:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD93AC32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 10:06:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso30369895e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758535585; x=1759140385;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
 b=mSq7ALbrdvv4WEtsgsqe8q7SzLXKC15sKXVxqitpkbFjWn8PNVHcLt4ZPW1kwdmtBE
 yfWpovWkFERShUENTt9ksEB12GbA7bj/ID7fXhJjcKQwiUxbUuCGVT/duZOL56WTFfs6
 OY2IP/rhm2AGB+Qg7p28VUE466YujMaJYu80LNkGwmM4Mez/KfErHJDoVAti8Sk3fmq+
 6kuHAL4ACEN/+r+JEWIL6hMY5qpjJy1yD6QIAPa6tP1OM2mICxbPAApAbLMOHeYx0Pkl
 /a3vfueMbUJUHbgmhwjZ6YHUjwvmYV74EgevqROTLMLyMKA6aTWGA4+4zsqmdyY+aKcG
 J22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758535585; x=1759140385;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
 b=B/IZ+ZTQV2O+Jgqe7SESLKGK3HYqHC82RjlNEQSH2VO/8f4iOkgzDN7qt1gOCK6LpX
 m3Ah9W8VaOI5zvzfqICQJuZNsKJMiwl7d3bnCwU+E643+SWhwPS9XY+8VQvRb6Q0fN7e
 vCvNfA8/2/x7M5st+BBXmQLmOqX2O7751otWgrA3uuh3BC82phMB5+HWU0r+mrgWiRPR
 75sTtHBur4Q6n859QOdRS6ttwy3CXjDovKL8OvPaQjK2Trrc8l4lj4Q6Cst0nsGxdgCQ
 /lcUn0cPF92RXNAP+856ppt81onO2zY3545dXquPckP2rbDpa8IeyT5jMr/ZDybOCal0
 pRMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdaigGWo0/CVsd+H9RravvgF+OljFW4CnQ225xpEkrg8EVCO/RMsGE1NHkPEUDUqYDm2DaxFgWBPt0Bw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+pjZfXlN0b506pXF5UVtPFCqzvUY0bTg9ISulR9F+JPnx5JlZ
 Hx39GR5OVURYNn+xxXKBNPJ742tAUv9UTfaUWThzap88zpvI50i8FeJu
X-Gm-Gg: ASbGncuJ3TxhE1EtjHCwyYwckLp38NmauFM/xfZwq1UCohz9mvcth/p4YJOjNKr7Skn
 7Liw0GxcRZ4vFsbr1lyFpQDCVEkhPtPUPLFcsAqNHqHpFRVVjs7reoq89O7tTAWUZ39lA4OeNfo
 Ak75/tvP1rx0v91vPV1ts+xOxjEr9vS94KN53irXTxc3f2ba6CLgXLkBr608O9qzuRBTUPIR++V
 Je4GzAavBDPFsfvSjlfVEsrkAVBCLaqdYB5CCbgIGTDcJSL0DkXFp/MPla0KfY16V4HQHYlsnrg
 Di4r6xbDAWaS3ObC5042YKAc5ANnvcQVv5Zj7YiOmO0fpXt4aXRz1OZEZNUGhwWdM8WNVKI6MYP
 7SY/gz3GOeHerT4GhClt6GQKUvDBYZ3Y2wJbo3nyOHPo+6Q1v63Mi7GccjyCUd5JpqkGqLMe8Nn
 +05/Qwa/l8eQwUokvDrq7Ap6f5b8s=
X-Google-Smtp-Source: AGHT+IH/nuiP33vxdi6haBkztRav20FFYyckleFU6YyLjEkl9KoqVa24kjV3Z8p0lBzYdX5BRmqpMA==
X-Received: by 2002:a05:600c:3585:b0:459:d451:3364 with SMTP id
 5b1f17b1804b1-467efb044a8mr139254985e9.24.1758535585151; 
 Mon, 22 Sep 2025 03:06:25 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-461391232e7sm233177835e9.6.2025.09.22.03.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:06:24 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:17 +0200
MIME-Version: 1.0
Message-Id: <20250922-b4-ddr-bindings-v7-4-b3dd20e54db6@gmail.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
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
Subject: [Linux-stm32] [PATCH v7 4/7] dt-binding: memory: add DDR4 channel
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
