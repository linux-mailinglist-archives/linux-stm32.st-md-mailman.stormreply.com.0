Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF776B4A9CD
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98038C3F939;
	Tue,  9 Sep 2025 10:12:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEB33C3F939
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45de1084868so12928535e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412765; x=1758017565;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fz+B+CL4iaScWz0taGfrGQauvYCWLu7diA57jxmU9w0=;
 b=jxQl7fiTEJA9ZZXKuwxnqrdeMvcVqbALMAVQB4Ljg5qD4VYCXy65kvIpIxQGzfb81T
 ojJ3tcx8CFHf2UPtglDixwCLEsatyDjpkX9GSwtWRr2AFjP2T46/Sa8d4Cbrr81oe1/g
 N9cCxeL8CEUZF+T1/1yealEa75QFu2n6MBTKH4Wm5ukYIy2cZAxzp3NwRea/xW0Zw6YL
 xyMt/4+bKGC+ZwSfntvbtJxTC/MR49Udf+FMYuXXHTcFaVfyfv+JXcQ4+LcfchBhNVCH
 87JuI1kwess5UU/g6CGyjBXQGeeu5M6MDSlaQWD5ZvfYlEoWsEVvYS5o17Bkb+eaPgWh
 Msdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412765; x=1758017565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fz+B+CL4iaScWz0taGfrGQauvYCWLu7diA57jxmU9w0=;
 b=XIqGsPT7Xd+V0u2aA5S4E+/9pM0QfXSuXky0EQbnYB0e6moRXNre7NKkaF1M0Qs9EC
 7gt798Xw/f8BuzzsjQ5oMZCFgcr/yi6oj9CrPpbAH0LFO0S8b7vtArFfWXIhve4oE/Sx
 ev5DqtayqFHINXlxxuJl4IhSBelV+lClVS5sZb6EGr5omCTsR0SYImAxVIZeTq5e2cw2
 G8PhASD9fgJ1ud3QRrnIq8DOwA/ayRG7BhlpIqX5HR9xyq0q66Yfe8O0lsJ8VlyfQLVR
 r3cVlG9OV94ET29LaFPwVWRhrPqwCUBFc6CUfUDkIe12/d2FsW2wnObMVcaucC+KGE8h
 DP7w==
X-Gm-Message-State: AOJu0Yzzt0yBrkSAhY+BHfge+xqSCN4+jcGNWKIl5Gvqr4eL5RyAkJHr
 aFcNVHcaJM1nx5F2HEuptekXnZjmk+44mDkODFXhQRLSVO3URcNFrO3q
X-Gm-Gg: ASbGncsF7T0YP0i+E1IrzEwp2ez9RhLst8Bk/8ISonKveU/nv2VemzH9muod5P7BwQO
 VmeRaA7Yj65o1t/pnVH6G7I+AYGmfsKHwt1vddJurjOn+NGoibep7UBlnxl4j3NeUY74/ujwTW9
 57O8xtsV3YQqND68VAM+zNA3+u6fn0BcAhFmRaEb0WsD4/5RReazcxIfQRa31ykP0abRbAVSs1k
 mUagD5Kw8C7QprS0jRfAqHbT6v/6e9B4WFLe2QVgyGlUNTp8Gzncre1pY99KflyQUFd/lpR7sKL
 qVJXWKRnaAKFhVzgqld6Hlk+WzhaEnGCNwwnAMqa09mqyRbMuVf8cDh7yINVD1iizd6QonGPY2i
 vS3UKfB5DReFdDKeomOQU/OdPlmWTDAMfVm5HYiGlTQxrcTzEHALXbphDVfiPyUTTxlzBc/JEMx
 HEpwXkq+wgl6bIzq4=
X-Google-Smtp-Source: AGHT+IGIpwds5m1f99DmZYWHr5hx00ReCcHO4qawO0+yYPkO3AH5Qzc/5zzp8Hi+Au0bjFxBpPBAkg==
X-Received: by 2002:a05:600c:45cc:b0:459:dde3:1a55 with SMTP id
 5b1f17b1804b1-45dddec78d3mr98436055e9.24.1757412765321; 
 Tue, 09 Sep 2025 03:12:45 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df15e4f44sm13157475e9.6.2025.09.09.03.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:45 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:23 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-16-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 16/20] ARM: dts: stm32: add ddrperfm on
	stm32mp131
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
VGhlIEREUlBFUkZNIGlzIHRoZSBERFIgUGVyZm9ybWFuY2UgTW9uaXRvciBlbWJlZGRlZCBpbiBT
VE0zMk1QMTMxIFNvQy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVu
dC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmlj
IDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTMxLmR0c2kgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kKaW5kZXggYWNlOTQ5NWI5YjA2Li43
ZWYzOTMxZmQ2YzUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzEu
ZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kKQEAgLTk5OCw2
ICs5OTgsMTMgQEAgaXdkZzI6IHdhdGNoZG9nQDVhMDAyMDAwIHsKIAkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7CiAJCX07CiAKKwkJZGRycGVyZm06IHBlcmZANWEwMDcwMDAgeworCQkJY29tcGF0aWJs
ZSA9ICJzdCxzdG0zMm1wMTMxLWRkci1wbXUiOworCQkJcmVnID0gPDB4NWEwMDcwMDAgMHg0MDA+
OworCQkJY2xvY2tzID0gPCZyY2MgRERSUEVSRk0+OworCQkJcmVzZXRzID0gPCZyY2MgRERSUEVS
Rk1fUj47CisJCX07CisKIAkJcnRjOiBydGNANWMwMDQwMDAgewogCQkJY29tcGF0aWJsZSA9ICJz
dCxzdG0zMm1wMS1ydGMiOwogCQkJcmVnID0gPDB4NWMwMDQwMDAgMHg0MDA+OwoKLS0gCjIuNDMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
