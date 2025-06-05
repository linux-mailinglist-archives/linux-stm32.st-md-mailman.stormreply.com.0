Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 998DDACEFC6
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 14:59:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62B4BC32EB5;
	Thu,  5 Jun 2025 12:59:47 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F617C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 12:59:46 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so1258185e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Jun 2025 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749128385; x=1749733185;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
 b=DiRQSCfjbbVf8euG7HRfJePg/WnlbxZHTxTO0UctOj95VhHxus6yp1NuWJtR+Tv25z
 v77tqIENOp2AggnLmRqe8d+X8QW+YgYTBY/idHcsEFy4s0iXvc4YM4c2Dzm1s++qlSPi
 znPsR9u7VWjdp0yTjwX1/FUTxmY/+3Ylt7iyjckHjarutsK2+5r8OF4Kbv1i00FSWubj
 hgE0JuE3KciGxzWF44xHOmpSkoL6yObIsRi98rzYDHSbLt4imEUoDzRLXMLwGdHwGtBU
 kLxhQL1fdpfFZ1XbScc5PBiNm+TBhFehqFRNN3ECT7252qqQ0dp3UnmHodMgTeCZZTVC
 9w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749128385; x=1749733185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
 b=dTHLC1X5e/fF1rViIoc9KJf8TWq6bgayL7oI2cOlhtD1tjQNY2JcTP4wnaC3VFs4dd
 p2CxUZ1WCswoK/Zv7j5bw3gnzm70q+0963dG7Q25lNBRbqraR/77i2afyM+9zWeRh3kj
 unt0yBR9Rws6dKwt6zYXsZt/mhlXHv/R8c7Y7MgoPFAaIysaC7LrrqX5e3v9hI2PNuyb
 J2e1esuyX2YeRoYvKienKoXyv1iDKITAVUl0WgPvaKxSvWKHtJiqExQ3GxQE2arPM3Bg
 7ETsO66gCx45FWjBzJPXzZHYK/OwVlAb1RlW+w4FWyCoCCrWH5PqIY72tIpybVrTJLe+
 FOUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUifCsq9T1g8bS+zVeO9CUX9hmi1qbhRJo0S8v3+uqmUuZa5srTabkilCfyAWueTYJ7dVCuCubfxDpkDg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzA+Vpg7z9izEkizCaHV3ZT+mtnVh6LupNMoG6CyinHKSX5sMEN
 iNIkvcWbe3F4v1p3MWJ1Q28l/cdU3RjO/NZ0zXsq/T2H+jtH9JPlnGEP3RQqCZl4uJIXQnqopN/
 gPHMmgcVfJoocQvgw3qd9fPwtYYOFhXn0NacVKO038Q==
X-Gm-Gg: ASbGncuvLxO6fI4K5E056YL/EEzdmQ58UeAZA+JqkB58Qf+Fa8A7hCHBfc6Sti2INT/
 kjtu7La7O0NWCqVdpfzzaLtCL75KDvsqii/srRBGq0Cu2BrkzV+jotyXtJ+H0kGba1CiGONG82r
 D2NVNQv59emJZ7x7CdTM2eZcAtGb7brl/cGZzMoqvWG+Y=
X-Google-Smtp-Source: AGHT+IFCavHF9adGcVmqAC/SJ2B/xxLRQCctMY8xdnqc9im25wwFXVUPSZMsCxZi+sqtxi8x7B4+E8N2egCUTx7o6NA=
X-Received: by 2002:a05:6512:2399:b0:553:3028:75bd with SMTP id
 2adb3069b0e04-55356df25f4mr1863539e87.49.1749128385410; Thu, 05 Jun 2025
 05:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:59:34 +0200
X-Gm-Features: AX0GCFu6YXXSfinnPxm6al8Hk87Fy7463uSEHIJGoc535sekNRVPuuiSEP4FOgU
Message-ID: <CACRpkdYfU0xGAWwjJVaDLS_QjT2jjVZouQ4bVU8gqMkfEc05Bg@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/9] gpio: mmio: add BGPIOF_NO_INPUT
	flag for GPO gpiochip
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMzozM+KAr1BNIENsw6ltZW50IExlIEdvZmZpYwo8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFdoZW4gdXNpbmcgYmdwaW9faW5p
dCB3aXRoIGEgZ3Bpb2NoaXAgYWN0aW5nIGFzIGEgR1BPIChvdXRwdXQgb25seSksIHRoZQo+IGdw
aW9jaGlwIG9wcyBgZGlyZWN0aW9uX2lucHV0YCB3YXMgc2V0IHRvIGBiZ3Bpb19zaW1wbGVfZGly
X2luYCBieQo+IGRlZmF1bHQgYnV0IHdlIGhhdmUgbm8gaW5wdXQgYWJpbGl0eS4KPgo+IEFkZGlu
ZyB0aGlzIGZsYWcgYWxsb3dzIHRvIHNldCBhIHZhbGlkIG9wcyBmb3IgdGhlIGBkaXJlY3Rpb25f
b3V0cHV0YAo+IG9wcyB3aXRob3V0IHNldHRpbmcgYSB2YWxpZCBvcHMgZm9yIGBkaXJlY3Rpb25f
aW5wdXRgIGJ5IGRlZmF1bHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMg
PGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
