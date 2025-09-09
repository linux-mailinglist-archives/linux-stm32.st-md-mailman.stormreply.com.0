Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24DB4A9D1
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC824C3FAC8;
	Tue,  9 Sep 2025 10:12:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1363C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3e2055ce7b3so3304713f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412770; x=1758017570;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kqkLiWItq44+h/R1+EtYWkRm5AyzksHBQoJeAh9biR8=;
 b=RBZ/argWAN7UOG1wXH2Jwjjjey/HK+79rgXKkFJyH9CbwabV64R0aQq9MK/HkWNQit
 3vqpujkCSlNxFxuUUbMssRflAMwAGZqbcd7DEiaZp/00pM35TGfMyyzy59zj1Ax4jFjM
 hcCIrncK6CW7FuxaGCsOkvgYbW5n+HvNH+V+HASWlghjBlaq47hIukf9SGA/93P7uZJl
 P8cTb5AtEolW64qhvd13uBgLbdqpRcMX84SS8KDsiP/Iq79IFJ3FIBKbIq60yM56T3RH
 NDC0ioaVyM1izwmqFIaWw1UQnlGBX9pHeMeEOuoDwUXuBSkIv+aJYL5DWuacD3BBLj5W
 Sv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412770; x=1758017570;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqkLiWItq44+h/R1+EtYWkRm5AyzksHBQoJeAh9biR8=;
 b=SXr5669TZtYw57H4R6yNHtoeK+9BcwS/W98cNap99Yx1TEPs0wzx/Rlp81j3M24cZn
 zyFPveVklYjApRt5AqKERDgg7BWCofUAR4HbWU6U/FL/ixC7hHiKrRrNTerC5IokqiLT
 JZWGpPS3cHzgCBI1INwgBg43hQ08CLxQngFLnq2vyk8oizOrUBxEu1K5L+KoIbbFRxx2
 q2pCTRqZpMS/dJspcGesYVRsJLxBOy18qp3PFixid8RyQASWS7qm2SAdo5fjPcv9v9kJ
 OtyZKsMZYVWsD0f3L4APsPxWwCpY3Dpv4RV1g3NH4ePgOdnGybBJvZ7Mye41+L8JWdnr
 CzGw==
X-Gm-Message-State: AOJu0Yzc8tz7GvPiwMuSQHV8qGYL88u44aM288hOcU0MeWozHVCAIczG
 GIKGzaP3Fcg2OwZddFXXLopDUbvu1GwaUMNUj5+PzE9fuABrGiiQvdtu
X-Gm-Gg: ASbGncuxdEg4N5nc3dnmwXZMzFwHxnnVeiiorOXqN7SQ5uhbSVS186ZO5TnairF+TFm
 iyvVmQSMneG7gJyTpWN7+lzBQAvZKvdIfRDtVV7YRUoZSHDCITK9MDPptnaK05Q6Z+xtHeLPa1K
 MYc0H2Ms4qwzNCOeTANg/d59d9h6PxYZujeFVznE3FgQG8HjLyPgI+o1bEBNnom3t0/1FnYgNAz
 zU2L+NEVBHK66llpVZz8hLHZiSVjdZvVMwl1f9wib2BJLYoBN5h6TPfNT6YULiLN1UYDg3j1cIN
 LJWDskl9Ym8rDt/b8uJ4Ha6L05nzEIy/TqSDMGrwAvRtEFHQAMHTJpay0CBON2rZ2SWUlz/HasU
 /zCLaP9isFxb6d90TqMCunH97bIm0tAcakEHpW1NaE6vehUlak/6geOMQ8UZt/U4b34yNw86GAx
 cre+PzpLogbAvMpcdIk32rwo1svA==
X-Google-Smtp-Source: AGHT+IEb/Uh0bOqYUD5CpTPjyWpptnA7lRTRp1bQevh63jpbLTzKsCg28IzONQcxTOeXGoqoY9SRmQ==
X-Received: by 2002:a5d:5f92:0:b0:3e1:4d93:5580 with SMTP id
 ffacd0b85a97d-3e643ff64ecmr6456919f8f.37.1757412770106; 
 Tue, 09 Sep 2025 03:12:50 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7521bfdbbsm2111014f8f.10.2025.09.09.03.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:49 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:26 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-19-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 19/20] arm64: dts: st: support ddrperfm on
 stm32mp257f-dk
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
Q29uZmlndXJlIEREUlBFUkZNIG5vZGUgb24gc3RtMzJtcDI1N2YtZGsgYm9hcmQuCkRpc2FibGUg
dGhlIG5vZGUgYXMgRERSUEVSRk0gd2lsbCBwcm9kdWNlIGFuIGVycm9yIG1lc3NhZ2UgaWYgaXQn
cyBjbG9jawooc2hhcmVkIHdpdGggdGhlIEREUkNUUkwgb24gU1RNMzJNUDI1eCkgaXMgc2VjdXJl
ZCBieSBjb21tb24gYm9vdGxvYWRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2Zm
aWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50
IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02NC9i
b290L2R0cy9zdC9zdG0zMm1wMjU3Zi1kay5kdHMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0z
Mm1wMjU3Zi1kay5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0
cwppbmRleCA0NWZmYTM1OGM4MDAuLjgxYjExNTI4MGJkNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1kay5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjU3Zi1kay5kdHMKQEAgLTg0LDYgKzg0LDExIEBAICZhcm1fd2R0IHsKIAlz
dGF0dXMgPSAib2theSI7CiB9OwogCismZGRycGVyZm0geworCW1lbW9yeS1jaGFubmVsID0gPCZs
cGRkcl9jaGFubmVsPjsKKwlzdGF0dXMgPSAiZGlzYWJsZWQiOworfTsKKwogJnNjbWlfcmVndSB7
CiAJc2NtaV92ZGRpbzE6IHJlZ3VsYXRvckAwIHsKIAkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQg
PSA8MTgwMDAwMD47CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
