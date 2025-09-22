Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F1CB8F6D4
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 10:12:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EFA4C32E92;
	Mon, 22 Sep 2025 08:12:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0B9EC3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 08:12:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so2074529f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758528754; x=1759133554;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
 b=PwdUiYBRNmFRP9r3M/eeeioP9exzv3agPG7RceXhW0akY3cOYmyTcgY6g0ery9xQEn
 5d94KcfXRHk0X4BU3oQyYx7YqRg7vVYeIrd9e1LyZ4KMs1TXA4+2UEUdFofyyPYY+Nic
 sjnpvsMz3wmsYeLG9kg5/3hBb2qD3ESs7CJAPjq8wLXDRzgmgK3waTWVWfiEoCPqQ3u8
 4A6Akx5rKuPuFRgp+lzLxdRW7BleBqgjElGdj7gpxZvp9o6Kx+Mgybh9FNE6lBhVIghH
 Nz0X1RRft/ZwMbf9Zyn2n82ujjrNkzlvgO13sZoY8ANwV59pt3I6S66P8/MF7sC/pXPB
 x1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758528754; x=1759133554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
 b=qn3eZiYGIfVdMDm6Ov4NgeS6vyvU6sQRzm3E7WMBMERl7YQPM7pNNvCvzdajtb+BUx
 9PaZR11Enaj+SPqxupSWkgmCCqieO/7h5fvmnj9oSQm8nMeUGm57aTQTlkeEIBBnTXFr
 d1Hx9yaJ1Dz88al4Ef7YJhprpJ7cD6HXADAu/eFOmZ+iaFwhMG4r/f9asZgwqghMFG8N
 kfjNHyeKbL8WMLWGv18tckaTrId1ZluJABEF/BEix6qDkDF17WmOusEOxc7/aFerVVAi
 tlPJYRzoXYvl1XyZtVxNVqJnXwv5sDM+NuxdS9pQaqmcEVUZoZZLuuUnqT/EoaQIRto0
 /y5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd0nbYWC65UUXzvV429Bltqf3rh9ZjKd7hWqgfoVJ+dGsbtI0LCOsuPoxZ3f82crwLlbPb95qhkrHEzg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyttKkxl9QeHCcrgXG/5CTBeqKV5uWMzr8BtczLQoHRANpmesnO
 zWAY2wrwwTdMqmzEMH/MHrZmu1LkWK25+kItZW48iTaqauUdl7WjYEwWlWKnQg==
X-Gm-Gg: ASbGnctCy0slCEXRhImvWtrYPpR/ym5dBoOv2TsvrnbxSyHz6v+ni87mPQSBjyrKWIG
 lxsuAXcQjur9quHG1SyQyqlIn5Tfev6ObpPGEfSx9hXDG3rx6jn6THBDDwDd4QhNhOYrbnCXBVz
 Kd3uX86JpSh0qiw9A6YjFo8Uv8pGpVyTSgizhIEctZBWX9nUgrXToqktoW1IY6Jw6K4K/0RJl/5
 hKhyKn/F3Qee7mbi0OCOz8lP0fcmhFwO/+cYrLphFcKzG3lFx4e99lHfUnvYd+t+JvuaGYsLMYc
 /ZWKOo0z7oWk9cMp6UaKd0ZbWZHa5g7kZY5io4xiDTiiPXTme2BISd271RpYufLwumdIG/O600h
 RXgEkB5iR4hTCTxRrF3d2Jvi2dzO0wgxqwHrZv00cgg6AWYVD5YMwINRYOmL48sEtu/9/0QKYlr
 av3pgnCTyBLUprjxyq
X-Google-Smtp-Source: AGHT+IG7fGN4H1P92BRx3rITJwG9FHeCws+SAhbbvZLAva6UiKbmxu9K+H7jexOc/3MevB0fxM8y9A==
X-Received: by 2002:a05:6000:2383:b0:3ee:15b4:8470 with SMTP id
 ffacd0b85a97d-3ee85e26b27mr11700859f8f.45.1758528753964; 
 Mon, 22 Sep 2025 01:12:33 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07412111sm18642688f8f.28.2025.09.22.01.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 01:12:33 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:20 +0200
MIME-Version: 1.0
Message-Id: <20250922-b4-rcc-upstream-v7-3-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
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
Subject: [Linux-stm32] [PATCH v7 3/3] arm64: dts: st: set rcc as an
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
c3Qvc3RtMzJtcDI1MS5kdHNpIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCmluZGV4IDMwM2FiZjkxNWI4ZS4u
ZmJlZGYyM2RlZjUyIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
NTEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaQpAQCAt
MTY3Nyw2ICsxNjc3LDcgQEAgcmNjOiBjbG9jay1jb250cm9sbGVyQDQ0MjAwMDAwIHsKIAkJCXJl
ZyA9IDwweDQ0MjAwMDAwIDB4MTAwMDA+OwogCQkJI2Nsb2NrLWNlbGxzID0gPDE+OwogCQkJI3Jl
c2V0LWNlbGxzID0gPDE+OworCQkJI2FjY2Vzcy1jb250cm9sbGVyLWNlbGxzID0gPDE+OwogCQkJ
Y2xvY2tzID0gPCZzY21pX2NsayBDS19TQ01JX0hTRT4sCiAJCQkJPCZzY21pX2NsayBDS19TQ01J
X0hTST4sCiAJCQkJPCZzY21pX2NsayBDS19TQ01JX01TST4sCgotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
