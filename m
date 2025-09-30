Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B15BAC1BA
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 10:46:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51935C424C0;
	Tue, 30 Sep 2025 08:46:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF48BC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 08:46:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-46e317bc647so36091765e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759222013; x=1759826813;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V33lrbDBdpgDfc9x4hYQa/F6X3VcQqYOJF639C+QnLE=;
 b=JcRuYhe/buUSkjUyLqnzr9UwydVAZxMIUYWo0fgs9zg4jVvEkuxtfqQzmyv3pOMeRj
 jloTGuXOhxdNMjEHSQmU2bc3ctnPHE02wRre6jXYQKYThMsD044bCjIn7s1UBMmas2VI
 pXE10Ckio3btoC2KQihEO0GyM6K4EIXid7gBkAWrGTPaNbLDK/QBAxC9jENI7WmNzz1p
 dotYI9xxel+1dba30Km9oDJJLUfld5ktdkojWNB2cOavTNZ7zMLZY1mVN9hwBvnx6njU
 UlAE02jIEYOniQpgxjZzAgy1f5Wr/MmVJzYysx1xcRXAvBY7xOHRLYN+Nnv8cFySIGWQ
 KAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759222013; x=1759826813;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V33lrbDBdpgDfc9x4hYQa/F6X3VcQqYOJF639C+QnLE=;
 b=jjNTcaI1bNRov6Fb1RQP2cfMOLNjmniU+k+sOL4JQo7AgApzZ4Tpg9/UMnAHnEeIsx
 bq4b/+cmYS1rcBVumvFV4hr/QYS5XzM27K2eR8Pm3I9MXtnl7oSvYOUlSTfsGFQzCS1B
 /ts21sqkLvVW8QPSCrrgsT0vVBE3C+ula3aF8NwcmMGJ6vaXGMde4WqV+3YJ3QUltaGT
 pz5CxHWMmBufokHohJCvS1KQLPtV6KAtNdobEBaOHIjFIpvBxO8os8FibO4XDis+8+iP
 ocBr3oe1pB6PSDL26+gP83N2NEMoHpbaHhQ22wWiZCNrY+zNUFl2YP5+Aj+UsmyUsMYZ
 86jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWXgCZ/OePZc0bZ74yYSO5ncdzDBPHq1WaK6ceYapt0yz6/zZjI5zS//QcuA24X9cQRhol+HWZk1RVug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxld7hFAAnplkcYt5zn9WMxeGxQyXYB8eO01RaN2cXrs+uASz8u
 ldLHXZeOuXsUp3G4sH2jnD0/fsOU6HYz21eF+9mJeX1TafiJnqxcnrcF
X-Gm-Gg: ASbGncvT+mFxEEjHDzGFAOecuxhgMSywiIAZgVul2DY5LP6oS2b6bpug6c/V1cLL2oA
 vdG59/j0dS3HZmIxzlBWSPcXyWbahLyk/N1SXPL8hxZHSdHBkDwUrQExEaRTNFdSRqDejNPSGCr
 nDSl8M9w/JPRDY69DudSl86DQB1gA9Uw2OW/Bv6//nf9wkwiKEtAIuwSFb7vFWNFZyLRk+TMToi
 VYXcVYyiCjBh+GXVhYhmXocValDFM5uNL2JPLdoyfDIvNmvAOsw0UI0fUecTbkHm5MAgaSdkuWI
 Pf5ULK+dFk3lvjkN6qemkpodOeTLUm+j1jxnc/u1IC7B7+NRggtyxQIE4HFzMiw7bzoqpqDrhq/
 Glpo/nD4IluOgOQEtelECYOiEQOvngWIzqdMUObxRDQYQ5jG+xuy3FQV/gsQYoKOxh1+ihzYdh+
 xKCTiqHGNXLkcHU8ngyPsIGX3Ykckzig0WYs0CGz6p
X-Google-Smtp-Source: AGHT+IE6t7X9LCnai11B2rSAFpAnlmP2yS3ko2WKL5rG+zgL8fO97OZwBT8DQj4yAE2uWbubKrm0RA==
X-Received: by 2002:a05:600c:a0d:b0:46e:45f7:34f3 with SMTP id
 5b1f17b1804b1-46e45f736d6mr114824825e9.8.1759222012854; 
 Tue, 30 Sep 2025 01:46:52 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net.
 [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f3dcacsm48573735e9.2.2025.09.30.01.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:46:52 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:45 +0200
MIME-Version: 1.0
Message-Id: <20250930-b4-ddr-bindings-v8-2-fe4d8c015a50@gmail.com>
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
Subject: [Linux-stm32] [PATCH v8 2/7] dt-bindings: memory: introduce DDR4
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
SW50cm9kdWNlIEpFREVDIGNvbXBsaWFudCBERFIgYmluZGluZ3MsIHRoYXQgdXNlIG5ldyBtZW1v
cnktcHJvcHMgYmluZGluZy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29m
ZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xs
ZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMs
ZGRyNC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250
cm9sbGVycy9kZHIvamVkZWMsZGRyNC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uYTJlYjZmNjNjMGNlCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyNC55
YW1sCkBAIC0wLDAgKzEsMzQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwj
Ciskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
KwordGl0bGU6IEREUjQgU0RSQU0gY29tcGxpYW50IHRvIEpFREVDIEpFU0Q3OS00RAorCittYWlu
dGFpbmVyczoKKyAgLSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CisKK2Fs
bE9mOgorICAtICRyZWY6IGplZGVjLHNkcmFtLXByb3BzLnlhbWwjCisKK3Byb3BlcnRpZXM6Cisg
IGNvbXBhdGlibGU6CisgICAgaXRlbXM6CisgICAgICAtIHBhdHRlcm46ICJeZGRyNC1bMC05YS1m
XXs0fSxbYS16XXsxLDIwfSxbMC05YS1mXXsyfSQiCisgICAgICAtIGNvbnN0OiBqZWRlYyxkZHI0
CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBkZW5zaXR5CisgIC0gaW8td2lkdGgK
KwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAg
ZGRyIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJkZHI0LTAwZmYsYXpheixmZiIsICJqZWRlYyxk
ZHI0IjsKKyAgICAgICAgZGVuc2l0eSA9IDw4MTkyPjsKKyAgICAgICAgaW8td2lkdGggPSA8OD47
CisgICAgfTsKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
