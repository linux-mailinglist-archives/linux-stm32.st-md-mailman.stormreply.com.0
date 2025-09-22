Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C2FB8FE82
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 12:06:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80BBCC3087A;
	Mon, 22 Sep 2025 10:06:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 948BEC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 10:06:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45f29e5e89bso50705325e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758535588; x=1759140388;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
 b=Y9DTu2VnVmMKvETQ/ZMfuyLdxu6D9HWxtPPk77oYcWEGA1AUIFIOJ93BgBVkzb7YWB
 O/msKqX348tUBCPUrWfzHR5G7AoKbbXzMxdGXb3+sagq2erUmTPdqVHf6ZFu89fkZ98N
 Jjd+//sfsZjgcie4YQ2mvtGItOwpttt26J9aI/SyHqD0Qtx8X/dxO9bDToqhX6v+pfGV
 Et6Y7Mgpyn8eTx3L+RfbfqertVOzYVxIrKrUFdZJviy2jAagjs4sPCLyj0DwO1ecCRLU
 UKveMUt+NglcfWaHa5LfPVPm0bfD5hQCHKftdwtDqc5ukcbt00ow1AZGm8QZjicys3OD
 /sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758535588; x=1759140388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
 b=gDxvwGcbOnHi7dA8sjlzb9Hy+VqIlA7vdU8mQiyw8krLINtltq/y8wuTyzcuVnosuk
 9VH4PVhgj9QFF/IYI+5pj54e/Ubnfr4g8L5QU8Z59N+DJJ9SGRw38d29wE6LQTUv/yQA
 ZWLAWcRMXPbqqaVFrp9B62veET3jKgvDXcZ8NTYy3z/9bfZ+tRsHum0jV3R98oS4Y8SL
 +AT/96YpSkZcyZWFSHx6UViu7FcGPXx58AcOBXv58Wjz9lV2z5VOBLBYHm9jdXNf5X3R
 wQuLWEPSy+jmdxkiVHjgQoZTmToJonJvpE8uL8j2hl2/wrYO0qBbYfZowHSa/r/f9OWE
 L1mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmbXWYai/pM0IjUjvjTGHYhHlweIU9irP4Pbp9n1teuLBJaSBjOWbOjZUXUSSXlAwTLiTF8nr8KZUSjw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxiW292UTET/hxwSYhMiIHbd4invE6aV0SERh6pgJWmWBBf1dO1
 aVldoOsCU31mii6icSrZ9UI74G7EyyyqlEnThwbJvELfJtSHwYcDoumeizt1eA==
X-Gm-Gg: ASbGnctdmr9lFV+zfaeZSlG+YssTO5XNJ35SLzb8rBa4x4x5D6j/jpXWYMQdhKtV0H+
 uiiXGLNjqbir9FKAyguD52DSB8YxkTAXQN/qTwVoAglR3dGeGS1BUng2OFxksJ8z8EB/u4i79Xd
 GR08ghG0CsXQi3mlartxkGNtU8+McDZI00pBRJQwYTr1EgdS6OQozJZj1QZcNqlXRJInRw20t5K
 nfJf/xM6Es2Ue4c08i4PJTnj/43yCrqsN3rD0HjOLh1I9zSV+xxYNuNDONIP7TCGwPlB7XIqhQK
 51e5aSNbuIxzb2B4EmwAOxTTPlboNrs4dtaiUSwEQ2610obHI9v2Rme4C4qwQIO07tTu5E6i7fQ
 HA+TUWfDFGo1u38ONTst/Wzu8Q6jPVw8/tYUUCweWdgS6Mklv7UEVKxZR2kG2UFnngiICpNOJKT
 cY2HjlU8TQs2aIp/Ff
X-Google-Smtp-Source: AGHT+IFsCK67zkg+eo0L7Dzd5uJH0Dlu0IC2iqPXJB3tB0I3Vgc0sQFVDvDEMKtjJDMRNUKipGcypw==
X-Received: by 2002:a05:6000:3113:b0:3f6:9c5a:e1ff with SMTP id
 ffacd0b85a97d-3f69c5ae5c9mr7470157f8f.39.1758535587944; 
 Mon, 22 Sep 2025 03:06:27 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-401d7fa1729sm1345904f8f.5.2025.09.22.03.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:06:27 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:19 +0200
MIME-Version: 1.0
Message-Id: <20250922-b4-ddr-bindings-v7-6-b3dd20e54db6@gmail.com>
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
Subject: [Linux-stm32] [PATCH v7 6/7] arm64: dts: st: add LPDDR channel to
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
