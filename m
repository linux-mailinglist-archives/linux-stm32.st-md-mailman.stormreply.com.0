Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA880B4A9CC
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B50EC3FAC9;
	Tue,  9 Sep 2025 10:12:45 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67B40C3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:44 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-45deccb2c1eso6110535e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412764; x=1758017564;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z/JnNvzakffKPPEMHSBabUxrFocT7sdCvSDe3/0LkLI=;
 b=PWyFLlzwKepu5q8zOJ+Ge5TStNnTd4gOnHku6CBDt6gP9e7iYycF+HTvjNMUHQIVeS
 v7sptgHmxFFQtLIaFcmAgvmttKZy/eod6/BcuQgLKSTZ93yxy5c2ajrq37Q/9SwF6L1Y
 fljuu9f6GFvaQ1ilgoFGQvQEGCJ2mJ1whK03quk7wRpIl3Hu6KCT1cyYJmwIPbCO/6yt
 Me2SAiDrcofWPQstpXqPzXCyw1fYh00y/AgMEvRsEcMB3iHZKkn1y/qmhZgmhkI+YAyJ
 uV9abBuSTVbySEo9Hq3fwvV8ATZz7RFKrP7mEOOjAqyBmEk1S2rH7vLYCyRT9lxrwhMu
 c9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412764; x=1758017564;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z/JnNvzakffKPPEMHSBabUxrFocT7sdCvSDe3/0LkLI=;
 b=TP05UWIc780rCskPnimTA/pwAxg04wBgHDH3ZfN/RVbYLCBuK6LxZNfxWisj4RWmMY
 Safl2hKlZ3PMHxoXfRqbXl+IQCoucik70cbgPUpGt2Nt5G3BYwj0zpwiiXR6H8ecuMBY
 YUoMTowQGlZ+4yjcxx6MbfA43bYLnyF5hQasKw22vH7Tv4yZIxXRuvRARVkEysdp4Tbe
 i5yKHLIDw27BEx1ywWu3Jk1L9rR/lTQFNUQvPF3j3nk9qg4eZ3Y1uzOyOwnGNx9pjuKi
 NCFpN6DnIIIpLBCFd/82UalpaAaDHnU20Rf2hcGV5f+PXb4Vm+eqCd6ooGSZAXBkX2h3
 azbg==
X-Gm-Message-State: AOJu0YyglL9QCOn5rGIC4qflbnW/owJbm6Zku4RQ0jc3bs82WZKIYejd
 9HBpQiCREqFDErJxdUYEF0zTMz69A2/sM+vUzdwNeAJY7HRX+48O6RIJ
X-Gm-Gg: ASbGncvgP1qUTIytlseM9lEFbBJ6GvvGpgi/tw96tB4GOv81y7iEjXnJMPrSvtjmw6/
 8LW8FUWRVwHJHQviYbGln+0W4CqGBNn586p1e2jTOD/1flVVw/c+AeMbvmhhr9Pq8i53Jg4kLjI
 I7OI2cokY1QIzQ0ALA+H4TFWfIk4kI17PYDnVKh4ySMfpMzwSR7ox0H70XX02zADIaCCu96/ge6
 BV13PWeqq2hGLKL3qEdV1FlSNkM1QC524OXuWcDIPIViEKGX1I1e1QYBdwIqFK+ForW83uSgJz6
 rLDlTsyh8pCDV0irqpWCo5+m36quz5XwdMZh/HEne7nOEaXS0CwuddcAFJu4eOFl/YBMF7Fq4qq
 QDKWDJR8x3f5LdftQhSZoE4vAOuhMpUur1JuLKQalXF0pzTFYC/Z9laP8RGV+xg7gkAECR0Xwic
 30yePS7IcfpFcWfHoxpyaLFsZW/hH0nN8fwLo6
X-Google-Smtp-Source: AGHT+IHYgNE08p6/wajlNo3gODYmIE9OcboUMxxGcEpzItxEg+T3n0c8sN0TtIa1aNSeY+YV/NhdLA==
X-Received: by 2002:a05:600c:a47:b0:45b:6275:42cc with SMTP id
 5b1f17b1804b1-45dddeefa72mr99293505e9.28.1757412763707; 
 Tue, 09 Sep 2025 03:12:43 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dda6da5casm181833615e9.7.2025.09.09.03.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:43 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:22 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-15-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 15/20] MAINTAINERS: add myself as STM32 DDR
 PMU maintainer
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
QWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBTVE0zMiBERFIgUE1VIG1haW50YWluZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5j
b20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBn
bWFpbC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmlu
ZGV4IGNkN2ZmNTViNWQzMi4uYTM1YzQ4YWU5MjVmIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUwor
KysgYi9NQUlOVEFJTkVSUwpAQCAtMjM4NjUsNiArMjM4NjUsMTMgQEAgUzoJTWFpbnRhaW5lZAog
RjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3N1cHBseS9zdCxzdGMz
MTE3LnlhbWwKIEY6CWRyaXZlcnMvcG93ZXIvc3VwcGx5L3N0YzMxMTdfZnVlbF9nYXVnZS5jCiAK
K1NUIFNUTTMyIEREUiBQTVUKK006CUNsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVu
dEBnbWFpbC5jb20+CitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L3BlcmYvc3RtMzItZGRyLXBtdS5yc3QKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wZXJmL3N0LHN0bTMyLWRkci1wbXUueWFtbAorRjoJZHJpdmVycy9wZXJmL3N0bTMyX2Rk
ci1wbXUuYworCiBTVCBTVE0zMiBGSVJFV0FMTAogTToJR2F0aWVuIENoZXZhbGxpZXIgPGdhdGll
bi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgogUzoJTWFpbnRhaW5lZAoKLS0gCjIuNDMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
