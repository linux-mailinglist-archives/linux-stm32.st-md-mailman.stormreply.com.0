Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 466F4B4A9BF
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05D7DC3FACB;
	Tue,  9 Sep 2025 10:12:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D62EC3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:32 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45de6ab6ce7so12359105e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412752; x=1758017552;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
 b=LVqsNXHVhBQMAJptTYIsTjVjOV9TS9niK8syEJquy8RW0deDBdgOwlOokmy0xCPXiP
 awgOXPqBlIzv4cvnHtuQJnd9JEbH0PODPTMMSuHSP96dAfYgsnTapx6nl3V064in9+ys
 ytta4H4vxp12bbRGVVznFUdk7l41rAyim+kfB04i6tRXdC6WBUEHhm+sMr/qmNyvQ0V8
 krnSZ+GSsCevaK8D+M0e+F6GNh82eNh8LitHn8Yx2bxkKW0YusROujxcUwzjRgpdQ2o5
 fh0EKqDctwBKyAfe6v+1QE8nC7tlOXN8DwU1jxq/B9BWDvQHxhGkT9aQXXT4ycs8mgwA
 nLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412752; x=1758017552;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
 b=kPY//CIofnZINMmnrQfTdsV+NmAWGtugNxB+duRzHmbCZdJ9Be8UEEkzoOaiFNYBcP
 0gUpgOp4K0Fm1YjQBNb5JlULFbR9lCxkggWMbUZtuZv93RHgbPch975s7rGBlk88kvH0
 Ihc3yWVBw80NcrK1sBiWYJZ83D0yqIHDv8MF4trA7hSCRMoFLq3EFJljU6DcJ1r+ABkm
 PFZpmtU95MH4MA3FYOIZ2H2xEpJjo8YJaUJrWhjj0MAguIy0OnUg9hF3dR4yh+oLxIEG
 HuW8f6IE4HCIXqRGEB8534hVE7YvkPQ2+7ZXYFYpCap3sYE2vJTq/AleURcc/MCfpg9l
 XNYw==
X-Gm-Message-State: AOJu0YwC9RY6cEnBoeElkFrm1446fZWsa70r6R6Sf1a5drWoQPp3LMok
 g8ldGAX3FSvfzfWgxrRIru1SimnRwK1lO5MSoaC3BTJfvdUtQ3nHIFtW
X-Gm-Gg: ASbGncv75P1Mi/jN2Tfllmgwt7CZHWu1h5e7xSvfe63al/J6dtQhKvFD4RkZ1wHA700
 07RQPRe3MibD+hDn8lLu/sToAw7Hf+LlvtyexrbqsDa4EkGNyak3jXzTYPoY1TYfa3ktFiOtkLO
 D9JT04/rH9sUidY+3lwx1SklSVzQvbB+hpWakNbePhX9aDrTkd+AtFBq9o09TXNiDpP2ZVjrfBJ
 pCh86I1/0+gjyngsyuxjQ45fbMx4Bs+b3fqzQB5xAtcjTVjzQHQWmpd8W5pnTPiVizybrI8hV9c
 Y1G1bKNTRuBcZqA6Kd6JnDF/6y5R53FcVTYQxJyROPWzd+zQkSy3RXV9waqyMRmYOdL+/C1MR9R
 i9VuJHG8+PP+VYgiRDXYNwcnL8RB498lwrYNqx6dhJl+faErZDOsOrFWUuO/WT580EZveOkQYF7
 MY8tkH/rcf2oS0x+0=
X-Google-Smtp-Source: AGHT+IGFWj1csfftMrTtbBzav0aJP8+tqV8mMQwZl+VGz1A+6Wfp7GkhRRrJnvAXOv1+MxZTXBPtKg==
X-Received: by 2002:a05:600c:1912:b0:45d:d099:873 with SMTP id
 5b1f17b1804b1-45de2547b9emr85467345e9.6.1757412751881; 
 Tue, 09 Sep 2025 03:12:31 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45cb5693921sm289241375e9.0.2025.09.09.03.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:31 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:15 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-8-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 08/20] dt-binding: memory: add DDR4 channel
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
