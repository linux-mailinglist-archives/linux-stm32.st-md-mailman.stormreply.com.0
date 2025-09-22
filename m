Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9D0B8FE7C
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 12:06:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74BE7C32E92;
	Mon, 22 Sep 2025 10:06:29 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C410C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 10:06:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso2210320f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758535587; x=1759140387;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
 b=Z37AewijPF387BCsallLdCNG56hau+tOFB6e3lXG9g2JIF/dEOnbkhOJKf/t1dd1GR
 kpVV4wcqh+FoygnY/CUP8mIhchbhhdQbS8A/kh6UaXXvBAuGoXm9J8GPLXQOHs1Jx16V
 Lob8LFgVa+oyefthrHutSGjPuiylMkPqw7CsruNgYDxmWq6BkocSS8imz8EdEAO3fj1G
 WxF8B+FrXhY3EcoaNqMgWAhVCAtVvpJm2WaXmkzOCKOBSFwTocMPxF7CAX+1nTF/0+mb
 ia6EoHu6bdxh7QPVNUJSJRB/POPS0LnnaLZJRSkBvJM6fvXM4PAjkT7w1YZS7rk78oVH
 hLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758535587; x=1759140387;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
 b=EgQgkqlzwQC4V8w5eRDKCoPpLsWviCpFnIXvopdkS3kQtdsADgaj1cBdIAY8wnQ1HO
 1y4j6Q7IPDJktlMuIfLDMvEpxdUX0KvOec1te7O1nB3imJAsU82AFlGytM+aQZ/W1Yzg
 9U0+sgJ425bIgUfPHS5LUqNfClTqe2Yy6QZo5wt6MJVC5+5z0z2BLVBUCG5Lzrnld4KV
 mV1+UErIX1teB+88JCmQf5QVgPU4jnbkD7tcAqRscxMxVRH/b+/5nHEy8Sujgs3IRrSP
 YvN304FqWmN2GRfZu1Qpxf8m8eWeROvEyjAyl2XzIZ8UqCSkn6Roor6/P/iut3RCHMCI
 yVOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrnnFB25f7lscj1cdGd2R90q43FtoPqLdponfuuULo61dH/r5yWFuZ1uY7zKyi/CqfSZvPvWupjYzlkg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz8mDRyg+SNqrFDQZUYgyiCWhNh1CpZLuyqE08ckLBu22xXdS29
 Or8jt/AtPvMmcfcRWaM42pzzIggClrWr02mXOg63GDhXdOUCP3JSeJOG
X-Gm-Gg: ASbGncvUE1mJ1yXUs1BBOliXoY2VkU00LWwHlbvGuAdorJ+FNw+kFtHmgJcItHeJug0
 ilORYQdyPLlE1Whwsh44+17k5hafJPifmWLN1o5CQMKVJXlJwcTOjdD1fQ/e9FrYQ7ifiiWFjm2
 Of5g/EeapJ5Edu7G0n1JZYpieYcnfpT1IgV9/zC+qH9KWbxdPDV81wDghLV+8VWWJdjni1cuJ3h
 gYIiek6CYfpWrILJUZXb5t7ecV6NZ4wvR51ySL4d4hJFcCKGLsbQGeCyUR6VCLraxjgmcqkVYSB
 RdNoBxfSXd5Jk/j400GOCKKa0JDku9Q8oAFtH43CUhSoNcU/lW+UW/ILSMMJlFvJ6P5xvBgQ+HT
 Swm7hMwgt+eYfciQYKODOWn0TYv2wLOm/p++yrq4beHV62KUfDz6BNYyFveRqvw1PYjqw7AVyvw
 ge1alFa6/7fvrt3iTFfvhFxoNAkHI=
X-Google-Smtp-Source: AGHT+IG5CaKIu1s56p3TpWS5l1RWL/b3CenMfj9WhML69rXhvqLaZjx6Zs78DXIYN5FpHbWguxd0TA==
X-Received: by 2002:a05:6000:2902:b0:402:71e6:5e12 with SMTP id
 ffacd0b85a97d-40271e6616emr918355f8f.46.1758535586492; 
 Mon, 22 Sep 2025 03:06:26 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46d1f3e1b03sm40913405e9.23.2025.09.22.03.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:06:26 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:18 +0200
MIME-Version: 1.0
Message-Id: <20250922-b4-ddr-bindings-v7-5-b3dd20e54db6@gmail.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
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
Subject: [Linux-stm32] [PATCH v7 5/7] dt-bindings: memory: SDRAM channel:
 standardise node name
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
QWRkIGEgcGF0dGVybiBmb3Igc2RyYW0gY2hhbm5lbCBub2RlIG5hbWUuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+ClJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29tPgotLS0KIC4u
Li9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5uZWwueWFt
bCAgICAgICB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFubmVsLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRl
YyxzZHJhbS1jaGFubmVsLnlhbWwKaW5kZXggODY2YWY0MGI2NTRkLi41Y2RkOGVmNDUxMDAgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJv
bGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5uZWwueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFu
bmVsLnlhbWwKQEAgLTE3LDYgKzE3LDkgQEAgbWFpbnRhaW5lcnM6CiAgIC0gSnVsaXVzIFdlcm5l
ciA8andlcm5lckBjaHJvbWl1bS5vcmc+CiAKIHByb3BlcnRpZXM6CisgICRub2RlbmFtZToKKyAg
ICBwYXR0ZXJuOiAic2RyYW0tY2hhbm5lbC1bMC05XSskIgorCiAgIGNvbXBhdGlibGU6CiAgICAg
ZW51bToKICAgICAgIC0gamVkZWMsZGRyNC1jaGFubmVsCkBAIC0xMTgsNyArMTIxLDcgQEAgYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgogICAtIHwKLSAgICBscGRkci1j
aGFubmVsMCB7CisgICAgc2RyYW0tY2hhbm5lbC0wIHsKICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+OwogICAgICAgI3NpemUtY2VsbHMgPSA8MD47CiAgICAgICBjb21wYXRpYmxlID0gImplZGVj
LGxwZGRyMy1jaGFubmVsIjsKQEAgLTEzMyw3ICsxMzYsNyBAQCBleGFtcGxlczoKICAgICAgIH07
CiAgICAgfTsKIAotICAgIGxwZGRyLWNoYW5uZWwxIHsKKyAgICBzZHJhbS1jaGFubmVsLTEgewog
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKICAg
ICAgIGNvbXBhdGlibGUgPSAiamVkZWMsbHBkZHI0LWNoYW5uZWwiOwoKLS0gCjIuNDMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
