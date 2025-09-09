Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F11DDB4A9D0
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B44C5C3F939;
	Tue,  9 Sep 2025 10:12:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BB84C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3d44d734cabso3753634f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412768; x=1758017568;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cSHpkOd4uK0+LGgGfUUkh18hfW5funXXjdKKM0dPo6M=;
 b=LKmYb1FouhmErlEz1I9eEBcUxnBd204lycJDN3RWw5PYN2JJrBi7hP5XIEdOXTqN4o
 YC721URzSUYI/pD9qo3fQOvMyunZUQuG7c3kBXZE5qSFrLwTTx3GmibZCgBwKB4KHMSj
 3Kx9oI9oFbmLppJcbDJEs1vHldEA312Ye+wv/F6+XMJzAvTS2U1/wz6JJF1n1Njk2DHd
 NQ2svCmqAWpujU0RxYIuaLCwDN1QQXCJW0VAVf+3bztjkY1O1MgF2hRcA55XWUTLWQiK
 tiooRw0uBS6XKjZUCo7Fn+pLXe9wafZSxm+tYyJ0MxLnJ80MBKtvkXarlyWTiRC+i8r8
 ZB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412768; x=1758017568;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSHpkOd4uK0+LGgGfUUkh18hfW5funXXjdKKM0dPo6M=;
 b=ZxXPqz3LCLJLJWxCiQ1Sc0naac4x1YyQc3RQOO7bxryDtbX7NDVX7WTLqJxWIgNLiR
 FVjPk4IkZFnhyhick6OuycD0fNbGmDU6pq6DcTDQJSSIPC+RpMyQq+S5pzTH26jgXUHm
 t+b3Uw1XC3n2tOkWCkbNRU4mvjRYI9FHZlp7ePVbsx4A62o/2gyWwot/7R9cjAVcl9BX
 srfknP1Kl24y6ecgjK805GRokRmmYE73uBlN15qDfyuFz6HynjwfAmBJuxXJOoWwbBe1
 b84W3nl2KukxfJ1E26K8lAa54D/mLR1+E5zFhTBjcQZY2AefNOWBophwi1zzbq+njz7k
 Uf1A==
X-Gm-Message-State: AOJu0Yz5M3ag/BbN7fP4namwBwLPGGVhDms7411f0bCyKetY5SoAG/Wg
 CwI7DHyUkKKseem4J0ec2sjQsNM2g4FHZr6LTl7jjoHGQ6VqPZorlzLy
X-Gm-Gg: ASbGnctjPjOry1O+IAw+650kv8HV6sbKCfouB3+sKZoKgj4yldmFRw4KPp7l6bjrNtq
 Ti8vk9Ow7tWa1Af29M2W/gTX/weZwAkWFhZyTRry6dBegWZHiNPr8EnuscnbNB/SccoY+zumq2C
 Id0gEFVe+/8AW/8wldaeMM9KEUV7E/IxlazG3DpDFp5+NTVsJ5y5RUJ1qGCk+a0HyEAMXc/3OVA
 PfIqMhdQXZqs50gnKlZH3k6K4gTC9yC9z875Hh/MfCNNpS3iB2RwtOS3+JMQz6Pty+JWxtG/x6F
 A5EojMQx+F0EyG3PD45S9/ApEBUZIFbFQu+knfc6om4IXAMkT9rFFpASDzGr54HhF8IU3TkLNB9
 4Uek4uPJXb3JVGEAJEy1ZcwtD070XtlqWQ1sdvHWCO5AtFaRbllXwRxedEz3BsK4Hc154il6Tnq
 dojwwBhaQbq6omQL0=
X-Google-Smtp-Source: AGHT+IEBMPQ+x6q1DQHn6tfQDdXdqZ5wpu49XiP27S3xqO3Tqwiv+/CrXaWQp/nERl98m+vIT28Mxg==
X-Received: by 2002:a05:6000:2003:b0:3de:d33c:60da with SMTP id
 ffacd0b85a97d-3e642f9057amr7829659f8f.21.1757412768431; 
 Tue, 09 Sep 2025 03:12:48 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e752238820sm2018879f8f.35.2025.09.09.03.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:48 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:25 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-18-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 18/20] arm64: dts: st: add ddrperfm on
	stm32mp251
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
VGhlIEREUlBFUkZNIGlzIHRoZSBERFIgUGVyZm9ybWFuY2UgTW9uaXRvciBlbWJlZGRlZCBpbiBT
VE0zMk1QMjUxIFNvQy4KCktlZXAgdGhlIG5vZGUgZGlzYWJsZWQgYXQgU29DIGxldmVsIGFzIGl0
IHJlcXVpcmVzIHRoZSBwcm9wZXJ0eQpgc3QsZHJhbS10eXBlYCB3aGljaCBpcyBwcm92aWRlZCBp
biBib2FyZCBkdHNpIGZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNs
ZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdv
ZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEu
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCmluZGV4IGZiZWRm
MjNkZWY1Mi4uNjlmMDI3NmQzMzI0IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0
L3N0bTMybXAyNTEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEu
ZHRzaQpAQCAtMjEwMCw1ICsyMTAwLDEyIEBAIGV4dGkyOiBpbnRlcnJ1cHQtY29udHJvbGxlckA0
NjIzMDAwMCB7CiAJCQkJPDA+LAogCQkJCTwmaW50YyBHSUNfU1BJIDIxMyBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsJLyogRVhUSV83MCAqLwogCQl9OworCisJCWRkcnBlcmZtOiBwZXJmQDQ4MDQxMDAw
IHsKKwkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1MS1kZHItcG11IjsKKwkJCXJlZyA9IDww
eDQ4MDQxMDAwIDB4NDAwPjsKKwkJCWFjY2Vzcy1jb250cm9sbGVycyA9IDwmcmNjIDEwND47CisJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQl9OwogCX07CiB9OwoKLS0gCjIuNDMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
