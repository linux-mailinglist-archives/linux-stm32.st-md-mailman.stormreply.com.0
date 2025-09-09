Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC5B4A9D2
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01F63C3F938;
	Tue,  9 Sep 2025 10:12:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C832C3FAC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45b9a856dc2so34098065e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412772; x=1758017572;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kIgb7J1F10HYxfdjdkrY8eTpLG0sHZrvPdCfUXjCXl0=;
 b=jQjZy46/QBqtR5w/cmno4IFS2RmwV3XFrkoDAAEE+2ez1Ezk43C3TU7+PCZXDE57lz
 fuc8tXvUwI7i3rduzSoov0Vz8wuhV2ofsm5w0InAB96R4ozMe+fzDzs/NzZIhCLLMaLT
 IFkKvZH2RGMXXgFqGAGWoNc+E+5GeQauVDsGMmywcAgbjE2fwTPk75zQg7I6XYjRvord
 mXgIQxPyS4X5nIrrYCxI7DtQ40MV5/Z6KJp9upMaaokIEVOA5pkXNyvLUht+f70zxz/b
 yLIH6Tsw8QF5B13MCm97vtsxxFDMEEg0SVCnfMoa1Z7+7UihJ/XZrqTnbB9tzMR9z+S4
 fojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412772; x=1758017572;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIgb7J1F10HYxfdjdkrY8eTpLG0sHZrvPdCfUXjCXl0=;
 b=i1yiUyWBKDH0O8DLSfBjwghN2yLsLD1ycn8VvT79R6TLWE85fs1cQTny+yml523Nap
 kNpEHxGZQGKIU/H3CWGWWhic+pG9GrmRxeUpBlwE2MaKAC0ex2/aBTkLfpqTYNJO3fCc
 hF4DrHeo93+HdP5VqN6C5oChKp7FnX/vo0aKt2DOvfhb8+LTp3iIVEEbxbX26qCnOEa3
 W0zc2yM52DIOEuzEo6XRbpVhACD3iufr/2BGvn5aFf/3QaivdAwAXol4YIhwNfwV8gpL
 iooyMONqUxaAe8+W7VcCH+Oli+EGTlH6azlM+EuV6neZncZTHkx1bdMPmRRt+UfrQwgb
 tWNw==
X-Gm-Message-State: AOJu0Yylwqnkb8Lf8ib+2gIcI4+3P72D+sDxZY9iuIvBrvwFuI5Ke6Uz
 0wElWaFyEqmX/vhqu4X8a79+VpmdqTN7NQfUUX6TEka5XABhPV8Cmd9+
X-Gm-Gg: ASbGnculwtG4yjrueQWSmbcJ+7K//KBJjagrc5PWtLZfPvUmnFZDwbcGOx25MRp5SgA
 JdyLG2eOrlyARQJ6FzgHp/b9RMCTSx0RMtvktuwTqQI+bx6ZEJYzf3GBplOwRiWfAQF4qAkHQc0
 8yMbyV1X1/wOkmOKgYmw/P/j2Qu6PrDgu5rjgkslHEKw2O4tk0bbhaFXIh2beqD5wGddxDR4lDw
 tmq9L/FAWqL8MyLlZYca5yJ9+RyVjiEn6KNUvlggbyeSXeRYfZcIOU/dY4/4iw0+MIcYPLK0uJT
 6gdIOkFUmZQ6Fy7RURYvt0PrrN0UJHmhWBHDbk4jKtYTV7vW+YL9vAw0n7pIkoJ5VKAC/mJlhnd
 ztXyfQe8gDdceFoUxC6VNHgzU7Nev+foWguNKaunFeumoRm4lIyAYcu4F4NxX7rGTFNJYEmLERp
 kwc4b4Vsvor3jnw1ARUmD+ZL/XtQ==
X-Google-Smtp-Source: AGHT+IFVsl0KBBNudami4eVXse3EwUG6m0w7N65Hz7CHd/3ZnVXJY+5tMMekyix7eYIjIw4+THAIGw==
X-Received: by 2002:a05:600c:1991:b0:45b:5f3d:aa3d with SMTP id
 5b1f17b1804b1-45dddeee57cmr87267925e9.21.1757412771663; 
 Tue, 09 Sep 2025 03:12:51 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45de16b8b58sm130632525e9.4.2025.09.09.03.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:51 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:27 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-20-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 20/20] arm64: dts: st: support ddrperfm on
 stm32mp257f-ev1
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
Q29uZmlndXJlIEREUlBFUkZNIG5vZGUgb24gc3RtMzJtcDI1N2YtZXYxIGJvYXJkLgpEaXNhYmxl
IHRoZSBub2RlIGFzIEREUlBFUkZNIHdpbGwgcHJvZHVjZSBhbiBlcnJvciBtZXNzYWdlIGlmIGl0
J3MgY2xvY2sKKHNoYXJlZCB3aXRoIHRoZSBERFJDVFJMIG9uIFNUTTMyTVAyNXgpIGlzIHNlY3Vy
ZWQgYnkgY29tbW9uIGJvb3Rsb2FkZXJzLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29m
ZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0
bTMybXAyNTdmLWV2MS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2
MS5kdHMKaW5kZXggYzQyMjNmMDYzOTZhLi5jNjg1YTY0NmEyMWIgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cworKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2MS5kdHMKQEAgLTEzMCw2ICsxMzAsMTEgQEAgY3NpX3Nv
dXJjZTogZW5kcG9pbnQgewogCX07CiB9OwogCismZGRycGVyZm0geworCW1lbW9yeS1jaGFubmVs
ID0gPCZkZHJfY2hhbm5lbD47CisJc3RhdHVzID0gImRpc2FibGVkIjsKK307CisKICZkY21pcHAg
ewogCXN0YXR1cyA9ICJva2F5IjsKIAlwb3J0IHsKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
