Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2891B4A9B3
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 799EEC3F939;
	Tue,  9 Sep 2025 10:12:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 596D2C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45de1084868so12926155e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412743; x=1758017543;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
 b=hvABsn2zOIEhk8Syu+dg6h5xEKelwQRKex871h0X7aREcs1dZ9+jOcE6sDZf+C+L8I
 YbEjOzCbWNUQG50G/wEtWHW45GTP8d2uGXIqjEZrioNodUk+MAYJXgMNGFekdJDHQW3Y
 hEc/jcyKjKivb7e0T5hgJtxkU+/SI9LJPYxNVWSFF9e8SIlLIKBlU9nmdltLr6YG48yn
 Xy+cPlHdnCaJ2cKZPtZB6MvXa3zAIrfGw5184QP3itPgTemhThPMF2ka8YMI6aKZwpHE
 mnQub5kJQdFw7UVW5Kp6RbSJAN7rZotcrdlV0zcdnbxkxer9RSaYDMUGcGdlq1a8a4qo
 r8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412743; x=1758017543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
 b=kP9e1Z69yBeL21lRnMku44L5hMq1gCPChhH97GG1rEQmgF5ezGjgbACXgqa9grJqI6
 TyYdi0dP8weEj0Pe+qr1z+OyUCi4KZrp8M3vo2zck8aDIz775MMSgMNloiXa/RQgU2qM
 b1JE3Tfl+DymPgV3RezUZvKTnJljnN9lA4jfjWykGmwCcnDu85sa4McO055VugV2fRfA
 hi83JGq+Lbns1cEFg5lpEOrDZuZ46qiiJShrHEMS3xLcvipCX7RzO1YzGg+/qKjjIOjA
 t9bMyObinwbnUANkn8ET994ETQ0NXNZIsr9N6Hv/05+qgY5oBmRmZ+rZctkLShhjCE80
 3JfA==
X-Gm-Message-State: AOJu0YzJm/CmBo+2jOZ9EU9pNa+eKfAgtlOun7N/Fwqyh5Nz/qbAYrON
 vP3FGwAknZ+0NVUvf1P+NcSp0nOK69oJJQ03JxWQCM/zYyg0mUiYr952
X-Gm-Gg: ASbGncv8bUR+t8q1rJVLizlogI2HKotVdUT3buE2VH83CuiIW72yvL4q1uFmgc7mdG5
 O5EUk4hsUIAf2mKOf8exGfcsn6APGKoJCAJqzW2+NZQ1gqMYpRCPJ3OWS89vszSV4dwVe8Lkjhp
 c+CrYn7BSPXEkA6ouIp5qYpdYc22u3yOq+PopEoSmHY/IMj/Sf4QDImlvLu4fZcpQtJYWJKVUoJ
 BzB6CWidt6vuMtCbffNcEFgcKt32WZeCKA7Ck7kRqIJgbyB9Mj1LPdDUy5/ebw/8JOA/5pxwrSD
 a0pSa0nx2jygQPmNdsQ2y4XxyRx5ebSTZEj32SU9FQrpcR603qCFnRAv9gDGkWXXBy6IY9lV9ZK
 r0UL/AoEp66cbBuU50grD/bXNrjMKl8SZRHm5kP8wyfO+FMN6DsWiIGV4SQ5JaoblLxs1WclYkr
 pNH75oW3i7oyipFfnM0GTOY1Nhig==
X-Google-Smtp-Source: AGHT+IFNpcDqm5syw25D09i7ExBBWVEcooFgL+UUg7LLOjlL1pEopNlXuqGDOd1C5bTyB3d6ZXQWuA==
X-Received: by 2002:a5d:5f46:0:b0:3d8:e1de:7e4f with SMTP id
 ffacd0b85a97d-3e642da5119mr7865674f8f.21.1757412742627; 
 Tue, 09 Sep 2025 03:12:22 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd2304e16sm229761215e9.7.2025.09.09.03.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:22 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:09 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-2-ce082cc801b5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v6 02/20] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
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
UkNDIGlzIGFibGUgdG8gY2hlY2sgdGhlIGF2YWlsYWJpbGl0eSBvZiBhIGNsb2NrLgpBbGxvdyB0
byBxdWVyeSB0aGUgUkNDIHdpdGggYSBmaXJld2FsbCBJRC4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KQWNrZWQtYnk6IFJv
YiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50
IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MueWFtbCB8IDcgKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJj
Yy55YW1sCmluZGV4IDg4ZTUyZjEwZDFlYy4uNGQ0NzFlM2Q4OWJjIDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1w
MjUtcmNjLnlhbWwKQEAgLTMxLDYgKzMxLDExIEBAIHByb3BlcnRpZXM6CiAgICcjcmVzZXQtY2Vs
bHMnOgogICAgIGNvbnN0OiAxCiAKKyAgJyNhY2Nlc3MtY29udHJvbGxlci1jZWxscyc6CisgICAg
Y29uc3Q6IDEKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIENvbnRhaW5zIHRoZSBmaXJld2FsbCBJ
RCBhc3NvY2lhdGVkIHRvIHRoZSBwZXJpcGhlcmFsLgorCiAgIGNsb2NrczoKICAgICBpdGVtczoK
ICAgICAgIC0gZGVzY3JpcHRpb246IENLX1NDTUlfSFNFIEhpZ2ggU3BlZWQgRXh0ZXJuYWwgb3Nj
aWxsYXRvciAoOCB0byA0OCBNSHopCkBAIC0xMjMsNiArMTI4LDcgQEAgcmVxdWlyZWQ6CiAgIC0g
cmVnCiAgIC0gJyNjbG9jay1jZWxscycKICAgLSAnI3Jlc2V0LWNlbGxzJworICAtICcjYWNjZXNz
LWNvbnRyb2xsZXItY2VsbHMnCiAgIC0gY2xvY2tzCiAKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQpAQCAtMTM2LDYgKzE0Miw3IEBAIGV4YW1wbGVzOgogICAgICAgICByZWcgPSA8MHg0NDIw
MDAwMCAweDEwMDAwPjsKICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+OwogICAgICAgICAjcmVz
ZXQtY2VsbHMgPSA8MT47CisgICAgICAgICNhY2Nlc3MtY29udHJvbGxlci1jZWxscyA9IDwxPjsK
ICAgICAgICAgY2xvY2tzID0gIDwmc2NtaV9jbGsgQ0tfU0NNSV9IU0U+LAogICAgICAgICAgICAg
ICAgICAgPCZzY21pX2NsayBDS19TQ01JX0hTST4sCiAgICAgICAgICAgICAgICAgICA8JnNjbWlf
Y2xrIENLX1NDTUlfTVNJPiwKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
