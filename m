Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A4FB9935C
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 11:44:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A1C5C36B2C;
	Wed, 24 Sep 2025 09:44:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6787EC36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 09:44:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3f1aff41e7eso5536085f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 02:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758707089; x=1759311889;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
 b=Jpl+e75TDgqrsGjVX1l7VzgOBW95O9J1iBSkVz3KiB1MlUb/23I1o7ev/Rgz9xhg1h
 rBd4eAPZepAF995Zgx+DU5Nb1we6Wq7kB0CjyzNvcMtNJlwp0NeQ0XjTT5LhAPm1aXf9
 bgpPWhsOgED4eVutpKH2bcz3lWzvu64hwqqOByy155l8VnxCapsvX1tCzxtcDWJrbOsX
 LTYdTvJHrB6Apcs4PRG7iF8Sa2Vu2PTbIWZrK62xiLZPUi8OYfbtPmpygsO02yPYQw+4
 XCRYUmoAjK3tToHTPT2PsKLwqRBy83ZJN55VmzZGtDJavHG+cyKcBtPdK4ivzR6qvgbh
 Ev1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758707089; x=1759311889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
 b=UrMH2XY0nv1ANH8iRdpEQnbss683inC32p8lXn0xqyL/qHabCgqYqKlUqDyIbtJi/+
 ERL/uetL6UA78HzyTTRdruEaqVufhjQjDSUDmYJ+tsbkHpBqgadsa4FQof3vmwdB1o3L
 DGTizgPWT6fpAnvWB9urq6zjA1XUSBJKFYRo8xsB8lQRflCyFOoITFZ/Xu4w9TOOqn3P
 KXPSPlrBuTK+jsCtBxyAwd9Ut7eiWcYlootOuG558fL0DLbjIbWs7EGMutTApG8Uqp2F
 V7yzX0Qu384wjl9rkqPmcqyV/WwjD3VzGMyabSKDHvSlOJspdnV6Bq3H1HULLS+Ol86P
 m7sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9PQwKWlzndtW6MuZ9R/tk0f/+qq217OFXBLdcWMcFSfQX95e0K/Je8/PUjBady18QnE+igQFdCWX51Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywr2LxMIrpHPjnRKnpdY2MdWSsyd9uaoP2cti0hMcdmgCtjIYz4
 dZVn0IGY5KH09bRZIlA1/3MlOXTvDrkXAHDYIdYgC9yF1GES4sV0NkLN
X-Gm-Gg: ASbGnctl7ZGlC1ffwGQAdWAek8uqjUkpN1+M93/E62Tr6IW2NCMARN7sgqEsQW3w+Wg
 hVkdvtyD7Wo9iJAsxBXh3tIJC7Q16TdBRQVqXJ2tRXZ30iSgdC87Jopv4krJ9sYpqik74do9Pot
 RKyH+UPByzB4jsghp+ZpSN53gSY1U3n8B7VW+vxSfGf67qND4LC1yNv0W8ppOmyIK39zWtWZdn0
 twtsGw11EUjCYefCAFdZP5xKAlWBhbXzJhhuEyPwcXqc7lJGoS7jHeiaUjp3UqmyZkRcbufjo09
 iRwUfVIZKC47W/lwZf2bAgQVtMK2u9WFhyrzrJ5eWgJy0btjNRWtnpxXYLn31drJee/UgCzFhnF
 /yngYCWY+iExg3K/VjAPbhwYtTWD0gb335XQqo+cMRPU7977OlLKKJBcGbxLS8WHczGycUMut4+
 tt6HboL16Ohxnbyg==
X-Google-Smtp-Source: AGHT+IFDGC5gILr6xmz9HYWmbPGf7fv1JpRWluY5ULikXOKvBqLdmUKtTk3mYXekw57q/HwxxJNkVQ==
X-Received: by 2002:a05:6000:186c:b0:3f0:9bf0:a369 with SMTP id
 ffacd0b85a97d-405c6d1024dmr5131775f8f.14.1758707088783; 
 Wed, 24 Sep 2025 02:44:48 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net.
 [2a02:8440:7503:805b:76:f865:8f03:23d3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee141e9cf7sm27213765f8f.12.2025.09.24.02.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 02:44:48 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Wed, 24 Sep 2025 11:44:42 +0200
MIME-Version: 1.0
Message-Id: <20250924-b4-rcc-upstream-v8-1-b32d46f71a38@gmail.com>
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
Subject: [Linux-stm32] [PATCH v8 1/3] dt-bindings: stm32: stm32mp25: add
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
