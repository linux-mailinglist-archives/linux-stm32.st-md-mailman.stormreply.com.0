Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B1B4A9C4
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36B14C3F93A;
	Tue,  9 Sep 2025 10:12:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45AE3C3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45cb5e1adf7so44481035e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412757; x=1758017557;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
 b=PLJDO6eL+4RAWgPeH4KAKcxlUd8qOHkHKapBa+DgUwW8D4KTyM/h4LTLFRwr698v7B
 M/0t1wCMS4cBJ2B+4EDBzOGcM5YVrOvMYOHyeG5yQLfgqy2wi4EMVoQPNa+HXPvGgBjy
 bLfH3leF2dvnSdFOo0974Cunxwis3C3bDZiLfC8ITL2ULNPAI50M/n6+8e8/A0Umhb7A
 PRMILri2RyTeYvMbMLnCuP5j2KGkmySmlwuos/oFzM4iY/TYUXA6gkY6HghiosUxnpW3
 IE/S/9+21Cxo61JI+P01148DHuq49GAMj9uD6fFJFXaQEBEG9bMdsQdsiiWtCeEQisUX
 IIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412757; x=1758017557;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
 b=SxToRzpVB7LzAUUhBg9SqU7mimnOwvGDZRAnUnbZ5x2kkAgBSZfka3b7Oy4AqTynKB
 Z9cHs+i7D/hIqUn4YmUU/+8wErK4uhi4qPFwkWF9RewtclZ+7a/QdmfSKEbiRLLR1vlj
 jS3l5gK3HljbMwHZw8V7HdwVWmr6Vjfybq2egHIET7xjTHL4U27bbRq2BdmcZhFxl4/i
 c1N6nFrmYdkm1MTFRGnbz4gZL/Yr0LpzpEj3wdCutMF65KjoLAcID8Ufv0uMqyxbryc4
 iGYVzXdi96MiAed//b8fTwtIVXQrf8J2ua+ieL40Bd/o09IpTWNqMcOyzkJey7YBDQnx
 7BtA==
X-Gm-Message-State: AOJu0YyGec+9F3wOT+YLBT7PNI8rX4qQH2VFTj/IB2JGnGTBJ22gKW3E
 sFjwjmweLbKal6Esmfmkuh/IyV4s4R3VVlTnNZZHWyAeRHhKwIcSYvMe
X-Gm-Gg: ASbGncv0EPi6y0vA6nZQhCaDnYDdVDvHZ9dwvb4ehpBd0GeqHy7zPEHKdnvDBruJZB3
 yuP08VPXhOnI0F+PiNg3uCUodqZ+wObdBzA3BUp9+pih/luxGqz3oP0KDnTvZKlQCk5G5ipRdzc
 JO3bD1+nNGcpQAUAMkl23SlzQTFcolK7YyyBaUS8tyfb7dxYsPKmAMb4k5Fxox3DW7Bs+rNLnpn
 rBzohVLv6J2HDLxrS8eem7o4Hcl8nM2W7/OataR0HVywb5t+TKOiE8mLNGXD9U3UPhQi5dg0qcg
 45Vk5byIeTItPIF1+MscbHca8Oy7O3X8CohIg/fQ3BqbU+U393hTrMng2pZJtHC7LFzum+bCRqj
 vewgAxvKDN+6qoVgY4vSPkj62kkZTgKVVjPxMMYGTlZUe7VeLDkscrjkxnJrz/UEC45rwEcsjgE
 AeRYQl7J2slFA5Pa8=
X-Google-Smtp-Source: AGHT+IHKOV/tD2Z3OucLG0PdmljH+LI/bDbmIWYAmtOmyF/7Dm5UNviLw/7AZ2HS1Z+3OaIscmV+Mw==
X-Received: by 2002:a05:600c:154f:b0:45b:7f72:340 with SMTP id
 5b1f17b1804b1-45dec73107dmr27260045e9.25.1757412756628; 
 Tue, 09 Sep 2025 03:12:36 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45ddd47b6easm150506865e9.18.2025.09.09.03.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:36 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:18 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-11-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 11/20] arm64: dts: st: add DDR channel to
 stm32mp257f-ev1 board
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
QWRkIDMyYml0cyBERFI0IGNoYW5uZWwgdG8gdGhlIHN0bTMybXAyNTdmLWRrIGJvYXJkLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRA
Z21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0
cyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cwppbmRleCA4MzZiMTk1OGNlNjUuLmM0
MjIzZjA2Mzk2YSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3
Zi1ldjEuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0
cwpAQCAtNDEsNiArNDEsMTMgQEAgcGFkX2NsazogcGFkLWNsayB7CiAJCX07CiAJfTsKIAorCWRk
cl9jaGFubmVsOiBzZHJhbS1jaGFubmVsLTAgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJ
I3NpemUtY2VsbHMgPSA8MD47CisJCWNvbXBhdGlibGUgPSAiamVkZWMsZGRyNC1jaGFubmVsIjsK
KwkJaW8td2lkdGggPSA8MzI+OworCX07CisKIAlpbXgzMzVfMnY5OiByZWd1bGF0b3ItMnY5IHsK
IAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwogCQlyZWd1bGF0b3ItbmFtZSA9ICJp
bXgzMzUtYXZkZCI7CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
