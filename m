Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C52B4A9C2
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D52BC3F93A;
	Tue,  9 Sep 2025 10:12:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C311C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45ddddbe31fso18657115e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412755; x=1758017555;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
 b=dK+jQcgdjn5r+Gu/da8pghk/7j09KWn0Jkj/kJpLGPdD9YC3vRNMIh63eWZ0pb2Cl/
 RzEEgaVYJJgSEVYv8aOXjGlExg9izdZ+JVb39lYeQQDtJdixtjaRF4o3Tk1Zcq0MqHYE
 HsVr4i4bgpO8jKaC6AVWOjsZWUQ9b15WLxJRRdHSGljW4UDfHsI4nqE0BmhCPuU53gyx
 ZLVmUu/iebTn1JHZa0VC0Hd7DsZo+qqF8jnRleEP3Q0uJSi20kzOqxls4Hh4xsqNtNS6
 DBtesm7vrCD0e1fk3UaFFKoGTm2/46FZt4QMPLND2tC3Piwk+FbrV2y1Il5eqXh+2432
 VXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412755; x=1758017555;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
 b=HQ1ONZ6cBTcRNyWfe8Fch/LE/IPGJxqhmRp3lR+39bCcMhtJ6D3BMtmsCT63XvuFnP
 9+yMvtvsvmObAj18yOjNJXRKhQlf3yRUJefxgmz26n+GhhbE8RpQMIyIy2KiGbhMTpIi
 whKS2/OwzcsJXgcVQwggWn3TTKfjDKwjEeeWPQMeVbm/lpVpM/sulSm5F9x6B4zg9Xp2
 wH0zz5xs9ZEqaQ29cGJALG5SujrKzKNIWqfCifRXG7YbqiPtKRu59HH33HPXSKafzlLy
 6GUOUU/WBGG7A8A4xnfMO8HGyxuEkY1Fbd9MA16sgS/QameeUugi8hx5gQoeW6VD/UCN
 24DQ==
X-Gm-Message-State: AOJu0Yxl6GD9REwV4wNF1zlEeIh/XGQj2S2EEgaYinlbLUbBPiuEiZlC
 03uZjQFuDx+4DcrRzplJjmRsUxIq/zwigwvhSnQPjPvTCuUTLuh8v1kS
X-Gm-Gg: ASbGncu5MG4T5V6eQcJ8s9C6dTRl5Cq6RNEWo5WOgF5+mk8YMYVArWa8d/6cuNhk5kD
 C+8sUJDw/eKDMjHn6v2SV3mBimlvGoni2r4Bc71Zwo+VcDrcCeOkBpEl0S6KjlFUDv4im6taIl9
 fEBAJSn032uAOLtVIE+Hhf7PWqR3tjcZpqlCLkuuWRvCd6djPBTc04pFWfHs46SIUvimfJqWpfe
 rlDIjUPr9eX9fFxNwL3jecXmyORxw29JOjwhZMI4d6XKQvGLyml4tWEAOuin7XeI+OB0vNc8/0J
 qIYRI2VgWeeHPAf/iRSFs4lWTDW9xZMYmQbj8ikMKf9uAwl4N9d3fPF4D5qoLLVeRjfbBmLAFYV
 yC6ngHLT6SkNHrcdBE4ISoArdYiQRgoolqMinSTMd+cZH9Syv904S0VTKpWBwUR/+16I0zZMug5
 awmCHJZE+sQrSPe134k+wWZ4g67g==
X-Google-Smtp-Source: AGHT+IGkhJ0ZatSqTvrdN7sVofatAvU35CszjTeWZR69spsiQKrhVoFE96C4gnQYc/Sc1XJis21p+Q==
X-Received: by 2002:a05:6000:2285:b0:3e7:4334:2afe with SMTP id
 ffacd0b85a97d-3e743342e6cmr8608316f8f.5.1757412755107; 
 Tue, 09 Sep 2025 03:12:35 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e75224cd1dsm2002355f8f.56.2025.09.09.03.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:34 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:17 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-10-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 10/20] arm64: dts: st: add LPDDR channel to
 stm32mp257f-dk board
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
QWRkIDMyYml0cyBMUEREUjQgY2hhbm5lbCB0byB0aGUgc3RtMzJtcDI1N2YtZGsgYm9hcmQuCgpT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5z
dC5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVu
dEBnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1kay5k
dHMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZGsuZHRzCmluZGV4IGEyNzhhMWUzY2UwMy4uNDVm
ZmEzNThjODAwIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdm
LWRrLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cwpA
QCAtNTQsNiArNTQsMTMgQEAgbGVkLWJsdWUgewogCQl9OwogCX07CiAKKwlscGRkcl9jaGFubmVs
OiBzZHJhbS1jaGFubmVsLTAgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2Vs
bHMgPSA8MD47CisJCWNvbXBhdGlibGUgPSAiamVkZWMsbHBkZHI0LWNoYW5uZWwiOworCQlpby13
aWR0aCA9IDwzMj47CisJfTsKKwogCW1lbW9yeUA4MDAwMDAwMCB7CiAJCWRldmljZV90eXBlID0g
Im1lbW9yeSI7CiAJCXJlZyA9IDwweDAgMHg4MDAwMDAwMCAweDEgMHgwPjsKCi0tIAoyLjQzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
