Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D5B99362
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 11:44:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 596C8C3F93D;
	Wed, 24 Sep 2025 09:44:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1D7DC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 09:44:52 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-46e23a6617dso15029515e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758707092; x=1759311892;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hH7fDiyFIwd5GKCGsoTM7UQ+n2/6xvaN9QjJ2WXUyBY=;
 b=Qsb/ZCdBpZrkkQMGJpb5brBURykszGBy/is0PznlTsZty1MvKP2hZHTWGmgqweNtYN
 RUXp4s8oUKXiU42zyOsEzTLyMNGLxuEDqEd7Qvz6t8lez9dMOTxkVccPMibGOtSDZ6Qw
 O1Hnn/8tDWcfm07/unhwAA1CJ4SVa8aKzeyciP86/1+kfl41LlKyDsg3JKRmVFK3L14s
 OVko0mnhyAc18DDFoFs1ZbTU881C7tTryzSOTpvjSrJSoPRGCvS0qEewj9plLHGyU7MW
 LpUiLyCXMM4nTbV49nnRnvdu0KC18yRLkg0yKX2mRY9da3hja7evFcvX7QO+MZTMihrR
 wNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758707092; x=1759311892;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hH7fDiyFIwd5GKCGsoTM7UQ+n2/6xvaN9QjJ2WXUyBY=;
 b=NxG8DdHsSCj2huAA0vl2pHes3zwa28yZDCHWSACUu1FmFv8ugot9rX/2X+0TG2gQbf
 MPDNide6HZYKWIm3ONbHrATsoMchd836G8ChXl+MDskhUKrQ9uMZxcDiV7o0JGM/73Wa
 iANbW+PSO19sO8geavwjxGfpr5uk+7xofz4i963timV2+9m/C32UIbrYYcD5coPKCe3U
 b3sa+PWLmKKVW2xQtAsjlQteDgvuENDClh/JCTJKDl9Tg2OT6kMGt162rUpv8aoLHdfo
 KBoQ8OGMh4AmTgY8A3ZYRWjEY4huLBGwVZdUIvh3nsp5EXK1VwBWhcTMId5ldgqq3UFY
 06jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu3lCUOpDIHghAryXIDLMfuD/Ry9QixkP8gAX5sZ7VPIbCOgEFsnUybGor6NlEvRY275ty0zOSSeCG0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJ2MvWHbaGgHMuMLAYazTG2fSyeX5/NtGwEbS7c874GJiaFRMa
 nhgFKWvy9iprmmiN/LVCw/HkhOELPbyestExzwMCzBg43tOwQAT5IdHGywc95g==
X-Gm-Gg: ASbGncuNTCE1MeGKOxZJ/xlsW34R31KrnNkNLENhSamRkzijcnDNBuWhwcTcHXBBlJ6
 UC9jFQcNdxUWPuATDf05p2ZlfYV+Z60HqreoTe7uj5+i48ZCszwvSZdFzIDGbb1eBUZs9G3pLCe
 QjKpngwPqQ3YF/YpKNxsTGK82lrt/DKUSmvsBzp2/I+YKks9PhvIT/aRC376kufLYfqyoZG5r1N
 NPJdEYaefpvKMxXeFr7w8J2nusUfS18RigP3e0/L2/p2NvklRe0FkjjVmlan9BJuNrNX1W9S9l1
 O1J6zPu86ymPtFKdHJS5pgLHW8WWR/Ykt7gD6wry2T4wcA080iBuCqhFS5ch789wG2+/kZB3iI+
 Zjg3ILMKkloPzrdVOK4qqjGhb1Wm+u/uzg0IolEfCPocDs5nKq06nTh60gCHkUKDklVw9q0iiTC
 8kp6p0Q34EXGnfKoDD9G9WMB6j
X-Google-Smtp-Source: AGHT+IEIpicMOfP08Ui6PtoUDCNZ6++RjL5ZW9INST6VLjpDrbiX7bE7tvizzZ3gSwxM8E2g4eP1TA==
X-Received: by 2002:a05:600c:1914:b0:45b:8adf:cf2b with SMTP id
 5b1f17b1804b1-46e1dab512bmr50452905e9.21.1758707091986; 
 Wed, 24 Sep 2025 02:44:51 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net.
 [2a02:8440:7503:805b:76:f865:8f03:23d3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07407cffsm27184233f8f.16.2025.09.24.02.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 02:44:51 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Wed, 24 Sep 2025 11:44:44 +0200
MIME-Version: 1.0
Message-Id: <20250924-b4-rcc-upstream-v8-3-b32d46f71a38@gmail.com>
References: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
In-Reply-To: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 3/3] arm64: dts: st: set RCC as an
	access-controller
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
UkNDIG5vdyBpbXBsZW1lbnRzIGZpcmV3YWxsIGFjY2VzcyBvcHMgdG8gY2hlY2sgdGhlIGFjY2Vz
cyB0bwpyZXNvdXJjZXMuIEFsbG93IGNsaWVudCBub2RlcyB0byBxdWVyeSB0aGUgUkNDIHdpdGgg
b25lIGZpcmV3YWxsIElELgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVt
ZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2Zm
aWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMv
c3Qvc3RtMzJtcDIzMS5kdHNpIHwgMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
NTEuZHRzaSB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyMzEuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvc3Qvc3RtMzJtcDIzMS5kdHNpCmluZGV4IDc1Njk3YWNkMTM0NS4uOGMwZGVhMjc5
NmE0IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyMzEuZHRzaQor
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyMzEuZHRzaQpAQCAtNzc2LDYgKzc3
Niw3IEBAIHJjYzogY2xvY2stY29udHJvbGxlckA0NDIwMDAwMCB7CiAJCQlyZWcgPSA8MHg0NDIw
MDAwMCAweDEwMDAwPjsKIAkJCSNjbG9jay1jZWxscyA9IDwxPjsKIAkJCSNyZXNldC1jZWxscyA9
IDwxPjsKKwkJCSNhY2Nlc3MtY29udHJvbGxlci1jZWxscyA9IDwxPjsKIAkJCWNsb2NrcyA9IDwm
c2NtaV9jbGsgQ0tfU0NNSV9IU0U+LAogCQkJCTwmc2NtaV9jbGsgQ0tfU0NNSV9IU0k+LAogCQkJ
CTwmc2NtaV9jbGsgQ0tfU0NNSV9NU0k+LApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEu
ZHRzaQppbmRleCAzMDNhYmY5MTViOGUuLmZiZWRmMjNkZWY1MiAxMDA2NDQKLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kKQEAgLTE2NzcsNiArMTY3Nyw3IEBAIHJjYzogY2xvY2stY29u
dHJvbGxlckA0NDIwMDAwMCB7CiAJCQlyZWcgPSA8MHg0NDIwMDAwMCAweDEwMDAwPjsKIAkJCSNj
bG9jay1jZWxscyA9IDwxPjsKIAkJCSNyZXNldC1jZWxscyA9IDwxPjsKKwkJCSNhY2Nlc3MtY29u
dHJvbGxlci1jZWxscyA9IDwxPjsKIAkJCWNsb2NrcyA9IDwmc2NtaV9jbGsgQ0tfU0NNSV9IU0U+
LAogCQkJCTwmc2NtaV9jbGsgQ0tfU0NNSV9IU0k+LAogCQkJCTwmc2NtaV9jbGsgQ0tfU0NNSV9N
U0k+LAoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
