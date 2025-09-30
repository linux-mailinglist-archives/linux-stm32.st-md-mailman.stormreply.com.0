Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E92BAC1C7
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 10:47:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D797C424CE;
	Tue, 30 Sep 2025 08:47:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E49F5C424CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 08:46:59 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so38702605e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759222019; x=1759826819;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
 b=dRfmWnFCHm07YI8Wlu06oKH474yyxHPymUQYa6gEqD4JUjFWXtJ9nLVFD3imFzjy1q
 8W+BW8JQfE1Tcmro7tf+tNOFJORsy2pd1Q57VOmSwFZ2xDz3Gkx8vWAg7UxcQNU8SgXX
 7bZIpuG9AfqR74cn4JceyannhIRA8eoUuhCHe6EhNsdBwknCsp0H4/UVltxNAo1EsP9d
 N6TqKdN4f/7MmlabuvsrMSq8oCQ2aSQ9TczdioJ0Qor56RHMoj2Iobt/2NOVISlq3hXn
 RDXtCWnA7k7fJX2Xgw6qQ2DaGZabHK96NzajQpL4JAgG5wGMAVSQeNkbXPhnALMIn/ed
 QKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759222019; x=1759826819;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
 b=OqJUrUIkNdq9W7B+04LdkQsoxNvDE1DwhQx7cZVxnbLBeh5Wn8S6FdCMjYTTpGJZds
 Vly6YJ655xZCSk8VeWFyEU5Km6nbSfWYF3hZtO5Ad9DpSreDuZuruCe2z6jbCG+eZFLD
 VH9Pi0VgxR5hKFTSzNRIAeug5ICSen61WqNL4qcNJ+vyyfaNpOX88V8m4FNyOojsEvEm
 em+A5iTVcwPfxw7o74B8fBka4Cbgai4iSamSA6dmGjEEPxBGQVObvTzjP5j90vwNFM4o
 kgX2rmEYcm5abDZl5JrcNKK4PizdwkJIg6ohtgSFAKwdDOf5/7d5igEkBxB7Qh2QlDOZ
 hGoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGgVyVnyDIsfFZDT8hN4cRj7+7c+Eu425o7McSVw4fW2cNZS8JR+3WKzOXjE3QYgflmgGiclgwCm63EQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyus0PgRefLGkfd1hjxw4kk1seoBPidwdhKAmeiAnOQ0x3QwNCc
 fOoW5eKGCdTYhJHT6ROJj0bLLLfSpv6ECqWHs0SXZKeTRjOHQOUDMZdH
X-Gm-Gg: ASbGncsxqnliXnbPABw6tlkBB0yBXTGJ/iGLsnMzoDDsCOPNbkHHSJEVBDd7NX35A1f
 6snhKFowe4jZGStvEOl7F2H5MYrRPiDWNfIEjW1+A/dUP1fiuHizU2uS21AbyoBWxlteuHryy5g
 zykQioxToonQFbO9PiqEvfxwbZOBbUl/uKIwVFrcZT3hhJCzEsZzdOcO8Ciaaf43UX1UBP1hVe/
 9d/n9ULpmluhKlebAWlW6uJiatpuLhibhgjvscPSuJofdG4pzrG58YFokAsbtmYmd893POZAIGA
 psnqQqlNyOZrUtzxLOqv4ltE/OSHGl+TEZ7VN9zB6Lu4ZyeGKGVmJR0CIXzCLNHrhiFuqXrUmte
 usl63mSMpxnz2UTpbEah3vdkyqqbBGgs05SyXVHuLi4qDPByYJwDh14z0XBGGfKFkebMHqrfAoN
 MoMkveUGE2F9eagdtnaaEMDn8XTRxJHryIU9pGpz+L
X-Google-Smtp-Source: AGHT+IF8wHDDTceWxUz+RFjOgHkPZcIHe9m5mYQi6GvRX5Bpn1/rX4YugXhmgUIs5mTCb6j8tM/B3A==
X-Received: by 2002:a05:600c:3f12:b0:46e:42cb:d93f with SMTP id
 5b1f17b1804b1-46e42cbdbacmr127109955e9.15.1759222019299; 
 Tue, 30 Sep 2025 01:46:59 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net.
 [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e572683ccsm48034325e9.22.2025.09.30.01.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:46:58 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:49 +0200
MIME-Version: 1.0
Message-Id: <20250930-b4-ddr-bindings-v8-6-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
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
Subject: [Linux-stm32] [PATCH v8 6/7] arm64: dts: st: add LPDDR channel to
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
