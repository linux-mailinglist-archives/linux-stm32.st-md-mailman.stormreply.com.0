Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB45DB4A9B8
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2FD8C3F939;
	Tue,  9 Sep 2025 10:12:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 542C9C3FAC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b9853e630so50325975e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412746; x=1758017546;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
 b=ekhNevQwNbDg1C2i2WfeO48l9+/E049rnXsCzXL96X4uK8JczEz/xmkauZNzeRPn1z
 F/KUP1s61Mcaspoay/A1zF8llSNcx81nRigd2yqZAj9VfPCfkUxEx0iViTxcewf3vbax
 6O1h7Ohu/GBk+SKoH6aBQktTqNCHgxBqzUsMxdLOgQ0kLqgTKk/NKDOSAStfVjzAs64w
 8lT0xdGMwTrgkRgxtJoTrjyJW43NkRRatmm8/RwDneIBQjX9IAGrELYeFYBgSFrse+nY
 ICR3E1VUjrxaZPA0cnkO/Z6RWqaoliGu0M1aWhvJEEzHdorpK4R5BLnAGUZUi69GL7P0
 VJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412746; x=1758017546;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
 b=MP0coxxLwnYh3HUFSXWA/aL/8DS40sg2D7D3fM0jSRUCuLqBJLXr0WKdJ0Dhnuo4ok
 RcdF62fNh6nuZk4J9+iM3X2/AybnCGWfj0wupwFjrZ1So8RgxrEV+XsKi5SOU7iPrOQp
 YOrbWi8rdeN92TtDqk6jsJPddF8mok5T7bwJsKUt7HE97GVzLToJqXX2ihwwhZJID1rV
 Szvuw2/N5k3kc9+zVjjOY3i6Hkr/aq6zl73YvdBgNGIRngYGudgC4OTAkRvUuvemGe/X
 ZX+/iE3g/ClsSXOaYmBDFnHk+7gBmZnuEiIJosh4L8YsCf4nsDpLyYeMS4gC9hd/KmSr
 DZXQ==
X-Gm-Message-State: AOJu0YxhMHnBz47fEZyboKLaEdgd4+9Hxf1T3PGWmw7RLSivAot0phuc
 60Yf7trR775aRawU4Yr7TL2AzVuG4el+nwqNClFPzbdpU9zinOWcTRtI
X-Gm-Gg: ASbGnctlf78/9AJB0cWts3n9Q651W1EykAU+nq7M/4VGn/cXSJ40zpmu1xfQ4ZR/SAf
 hyliLwlIRSPxwDW6+110Svq6AXkQdJHtkqgalokhbDPGUmw0fqRXYXXldZqRYkjQvrkIRI48QE9
 dwose/Zl2gVuY0NP6PArSHQ9gHDZngACwaWonMjMwsaO6gwGcHBAQSnQnSh0GgWGO1mWi49r+2E
 BjeCNW6R4Yi4NdbVZpx/W4WvcK275mTQp4Hxpa2/aqWPMU78GlQmufyLqqdoQKoCGpFG/gSCVbR
 HOVUgRovh9SvtMtQ+PQq7r9L39/vwukLTgeewWRz/8q4S1WIcE048LtPg6Baf0jQ7rDUJRlOmKN
 PeQMAjQbY2cQF7UDuZ8aSsakYVehr7yxVn/Wiuh2Fgz3c4ebIO7fW1fVn5qWxj64ppR43qoVOWm
 yLhIY14L3M2pEm59c=
X-Google-Smtp-Source: AGHT+IF3GDagRAyMPN5BSQODUHSp0iGmT0I36aBlmWYUaQ/w665uvtY5Iu4mjHI3U5ucVSesodrKQA==
X-Received: by 2002:a05:600c:4683:b0:45b:8f5e:529a with SMTP id
 5b1f17b1804b1-45ddde9764dmr80596335e9.14.1757412745694; 
 Tue, 09 Sep 2025 03:12:25 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9a6ecfafsm334757015e9.21.2025.09.09.03.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:25 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:11 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-4-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 04/20] arm64: dts: st: set rcc as an
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
