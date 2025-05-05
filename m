Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD8AA928D
	for <lists+linux-stm32@lfdr.de>; Mon,  5 May 2025 13:58:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 251BBC78F62;
	Mon,  5 May 2025 11:58:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA4E4C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 11:58:38 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5f6fb95f431so9869754a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 May 2025 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746446318; x=1747051118;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
 b=QWtmtK1X81aUDlQhm/HG4xEiBTxOxkdiWwQ2i6BNUltIeevo6U3Glzpngp3R3sP9mI
 CCCRsO6UBPAk+GDWR18uPeZnWWRuS9GYSoOPZptDRWEnG6ilJ3Ml+Jb25jYDhbswwB6i
 5KtrIVSqufdfl1ExkrCoxnMqX5Y8gGrNvMpuJw//XpkoE5/p8pRQ7hFnhwmiTnHhnEi1
 ifBdp2ydyVjuKT8NvXxpZNZgfXik2rHK9TgRL+glQVmXmWARPUjxTDfonfFyWkdyqMw+
 CXVH6U4ZSH42+8WQvccJxDA7C0PChRV7qyC95VL3wm72IWJDt2QYbef3EtGadrsxNaJO
 pzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746446318; x=1747051118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
 b=fdiAquJFXIXnEuYA6Z56Hd6ZCTFcSwEn7yRUXGoFqoA/4FktTjawtMtfCz0ljUtqpi
 7lAaMIrsDCOM7oEdSt4VGWlaPgXFX4Ggnie1ds1h5TrIzjnoXNNmr8xRJADnU83yA/O2
 Bwdji618C8Yu3+BM4JkvKDO52qHGdhdrxwS99c5X+O+coqfQM0SaHT0G+407MfRSS3LT
 nA7HXFw5Bo1EDs/syqf8RyAGqwiS0PFr2r2/qr5On904MwwN1DMk+OyCSEPZnxFgDP6+
 zRouIv1SMaZ14k8gFkSjgad9K6LUW1AM5FOZD1kWpOUPZRAKq+jOORa5dqlBkmJEdnI9
 y/Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEXTnNW/hT1s0ClcAU2CjPdlfTi3tQsa+/jex8ndyZe1C0uMYV5O5NpdlmCEJSR68HkiBnUoNpF9FJIA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyq3fakhSWkuN78x/7fPLGpORuXBzVceTQ++SMbEORTfEnbupXS
 O7P06WGxRHJ3Tn8cGQh1gvTZoYDMVicYWJbnme4aSkGIy5JEPbXC
X-Gm-Gg: ASbGncuDc/yUg7OLk0eeMGL3Icue7jyrzc2yhayo9BK/rAVw50bp1KzkX/kD6/kll0l
 v4IGMX27EuYsOdW/AfTtKnYUdmlZz4Zr8aGP8YYij7Bqih4q8VL66F5PlolsDHAkKlHp/NbMRBg
 nDBZbXE1CkuDmM4qkKVzNt0zL4tC62JOzfkjy9/iTngjUWYHOkgOyvIWkyAN1Vc8UNtP7pGlICU
 K7gowHIFR4iIZlqd6lvQtVb1lKsMVgLyXc0SqXpgkg4IbDAu5IVNns5tpSJrSXojQRKS8cSyOP3
 4s9bxnMyCLwR1vfKzamoJAv2FFSqct6UOqhDM3b8zNWdEgDo45dzrUkgoDb1zMCPqU/KmDttvyT
 Ikg==
X-Google-Smtp-Source: AGHT+IHumqO2HEtVZQqU6y21OIhwqmx6WMl1zZofroVgIP8P5LdpNm2LFNH9OFJLdEBy/IULZh6H/A==
X-Received: by 2002:a17:907:999a:b0:ace:51fa:be56 with SMTP id
 a640c23a62f3a-ad17af32ce4mr937803566b.19.1746446318015; 
 Mon, 05 May 2025 04:58:38 -0700 (PDT)
Received: from wslxew242.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3c53sm489568566b.56.2025.05.05.04.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 04:58:37 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon,  5 May 2025 13:58:23 +0200
Message-ID: <20250505115827.29593-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505115827.29593-1-goran.radni@gmail.com>
References: <20250505115827.29593-1-goran.radni@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 2/4] dt-bindings: arm: stm32: Document
	Ultratronik's Fly board DT binding
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

VGhpcyBjb21taXQgZG9jdW1lbnRzIHVsdHJhLWZseS1zYmMgZGV2aWNldHJlZSBiaW5kaW5nIGJh
c2VkIG9uClNUTTMyTVAxNTcgU29DLgoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEdvcmFuIFJhxJFlbm92acSHIDxnb3Jhbi5yYWRu
aUBnbWFpbC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9z
dG0zMi9zdG0zMi55YW1sIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3Rt
MzIvc3RtMzIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3Rt
MzIvc3RtMzIueWFtbAppbmRleCA1ZmVlMmYzOGZmMjUuLjY1YzRkY2RiZGYxZCAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIu
eWFtbApAQCAtMTg0LDYgKzE4NCwxMSBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgIC0gY29uc3Q6
IHBoeXRlYyxwaHljb3JlLXN0bTMybXAxNTdjLXNvbQogICAgICAgICAgIC0gY29uc3Q6IHN0LHN0
bTMybXAxNTcKIAorICAgICAgLSBkZXNjcmlwdGlvbjogVWx0cmF0cm9uaWsgU1RNMzJNUDEgU0JD
IGJhc2VkIEJvYXJkcworICAgICAgICBpdGVtczoKKyAgICAgICAgICAtIGNvbnN0OiB1bHRyYXRy
b25payxzdG0zMm1wMTU3Yy11bHRyYS1mbHktc2JjCisgICAgICAgICAgLSBjb25zdDogc3Qsc3Rt
MzJtcDE1NworCiAgICAgICAtIGRlc2NyaXB0aW9uOiBTVCBTVE0zMk1QMjU3IGJhc2VkIEJvYXJk
cwogICAgICAgICBpdGVtczoKICAgICAgICAgICAtIGVudW06Ci0tIAoyLjQzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
