Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4FEB4A9CE
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4A30C3F93B;
	Tue,  9 Sep 2025 10:12:48 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDEA2C3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:47 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3d19699240dso3819899f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412767; x=1758017567;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IlK/iNZ8DIEQsXS4KP8/YUmihD2i2QrXsBZ3ReqKvlQ=;
 b=leqKg4u7iIhzyD1f0ya1C6eRBITX4IzbCexfDYMinojagllyIijIGRaIRSsJ0O3zft
 IqI70jDOEjh4jV8Afl8mxjxt4FqR0ZqROEgwlkF6U6W4dvskmt1BKigpMforRYraSacr
 G8ctCvnbF1Nj1pr8SArRnCrLsxk300Cp7xj/LBByvEXXjqR2bGIq7eFznyfZqB3xAUOA
 iGkyXwIfZK9tYswHSC8ESI0xzHKcFJLRa2FlFxOCkCOBAPt24kReWdnwvOy2RTjs5hZc
 xM3CMDgajxbfQFswhTIceA7XTnMHtY4+bRzQO8yLA4gKo/dr+XMkekzMhwASL8wZnNVT
 9bUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412767; x=1758017567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IlK/iNZ8DIEQsXS4KP8/YUmihD2i2QrXsBZ3ReqKvlQ=;
 b=wl6cUn6PyAgBWsb85BxSSq0bXrol0v0yZHGg10GREpbPal8SNfQ5nROKKsVnXUyysA
 6kKqkchfglrmgdQyYe4D9SQw4NQox0Sh+ecaHRhp7zILgmAFfFAwJp/DWkzn0RKSTdFw
 oph/9RWlIzvoJl7RnBrcFrxLwu8TK1+wxzB76hATzgKuMBeR1EQVa/aWmXOOj0G0r/47
 gv+JGSm72qMUEYSlcRp4SAo5Lngr+CevkLqwWYS9T2ZCyD8rmSbbt1VWc8nZfiDkJSwW
 aUJIC5E5ESmHULJKTOS3YpbK6ed6tsUN/x2mtgNvbyGVlktsYIfns0C5yT7esJ4VkipF
 +cwQ==
X-Gm-Message-State: AOJu0Yz9FZhJvZGMpUtqrrfp9B3/kv6YElDXhzdrcWsPzuovkO2ZH04T
 UuSlycfS7NNJhxvu/0n5kLU7/fs+xPUOHk812TkjP1jdjBBjyP4eWYWB
X-Gm-Gg: ASbGncuhIBPfgIqr53AfGqBiT7+kYnbENl+goRy/jbHfXtUOLp0XVAefmvWBPfJDBRs
 xuDlWTbp9fDYAt59fXEkeZcNwe0AshbYNJO+Sha7afQwpNKwZ/21sWO23qAs53uDMs5X7eGSpsB
 J1bgKDZfaG3PyKgVNJ9Fo2IMFLfQZ2AkmJNClUs3ZC902wEuDUcxg5Y8+Sigd+nbF+jZ7sCNPLH
 81S5Er5SaRb+K7mTnT7QlYdo24xediuihUwJWDNWiM/Ej47Tn+cFg6XZF8pOQEaT2jF3xE2uPyU
 3VhOe82Kv0k18Zbje+cpakwIjiKAAvnZkBq17kD2IT/8cIqEG8NCorruHel+gi+QIBLBI1DsUaK
 9bxTbvEI7uGylFKSV9Gm7lL0gon4K9qYkmIqxs7Dk+3btDK2qI1QnHiaTZ7vaghCpddBcbOwS6j
 ys4g6dM5MjgxkRY+s=
X-Google-Smtp-Source: AGHT+IHRIX6vr2XfK61Crfawn0MHIaaIC95LfFY/9lt6EdrZ/Z8HN/tDbVJ1BoCPFUR1QpzV15dodg==
X-Received: by 2002:a05:6000:2910:b0:3d0:c6bf:60e1 with SMTP id
 ffacd0b85a97d-3e305964e1fmr11645857f8f.24.1757412766899; 
 Tue, 09 Sep 2025 03:12:46 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45de229238fsm112894875e9.16.2025.09.09.03.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:46 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:24 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-17-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 17/20] ARM: dts: stm32: add ddrperfm on
	stm32mp151
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
VE0zMk1QMTUxIFNvQy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVu
dC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmlj
IDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTUxLmR0c2kgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kKaW5kZXggMGRhYThmZmUyZmY1Li5l
MTIxZGU1MmEwNTQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEu
ZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kKQEAgLTM4Myw2
ICszODMsMTMgQEAgdXNicGh5Y19wb3J0MTogdXNiLXBoeUAxIHsKIAkJCX07CiAJCX07CiAKKwkJ
ZGRycGVyZm06IHBlcmZANWEwMDcwMDAgeworCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTUx
LWRkci1wbXUiLCAic3Qsc3RtMzJtcDEzMS1kZHItcG11IjsKKwkJCXJlZyA9IDwweDVhMDA3MDAw
IDB4NDAwPjsKKwkJCWNsb2NrcyA9IDwmcmNjIEREUlBFUkZNPjsKKwkJCXJlc2V0cyA9IDwmcmNj
IEREUlBFUkZNX1I+OworCQl9OworCiAJCXJ0YzogcnRjQDVjMDA0MDAwIHsKIAkJCWNvbXBhdGli
bGUgPSAic3Qsc3RtMzJtcDEtcnRjIjsKIAkJCXJlZyA9IDwweDVjMDA0MDAwIDB4NDAwPjsKCi0t
IAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
