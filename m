Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D8AB8FE70
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 12:06:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3633AC32E92;
	Mon, 22 Sep 2025 10:06:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26007C32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 10:06:23 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45df7dc1b98so24663385e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758535582; x=1759140382;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=;
 b=SgvPwopxceeNF/vViNGyr0j+bqRJXkX0FRSsJIoCutI+Pf3ezM7TIZy9EKDi4CxBJW
 jOVqhEmNRZX9ZOqEA5FZ9r/O9GnoRKVnliCqMyx8kQKzGN1+AJAVMywGpXlSUO7sc8TT
 J8dcvGP3NX/dFNpQAId41JdE6TBIycnQUWRZmYVIB/71ZNQauXjYdWQbrJS1bh98M5TC
 ZXFZiTx8+i+YiymycV3v7HCcXGaSR6mDlrOQBtFo6Vnb1+M2mBCDeCbzximARa0Cem7Z
 XprJ8+MJWDcOc/S44Jsx8Lvv1dk0fZTi6PcPv1AhQhhvREC2Y5TcwxC8QsszRaxpHvTo
 7M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758535582; x=1759140382;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=;
 b=RjKa9NvHduIqPYFWFSqMFfvhBHsWOKngPHkJHNqu0hKNH6jR97Zx1T16tFnMK1tlX7
 1veDcnvwv+J+hjBnNNgzBuQPppEgOxoZV0xc4SLN3DOBqprQIY7DpzOgq5CcT7eSHWTE
 yKS2OLgsMI0+f9exMAnCld7hHrRaFKX+k5BZKqgctcRS4LkxeguszclwsE9LidhuZrFP
 f6z+q0v9wGnIKD9DQWr5NLGNyoDIncfitBUl0qg+QgT3JeJxotBcM9hNgpcMuUUZxmOy
 2stBiSYd6fiK2xVvoD0BDZIOELt4l+uYz9MpJsaYfRCq3JDJNQdUeAc4RzsiiTttbSzg
 RuIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8TCoPh3/YLYB3RNKmJt+kpXwHU6ITXdBcEmVXT+KMEIqv3TuS2RujIs1REoQMdG93bdbMEcRIOcn6Bw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxEp2x9EQ3/icAvYXqptVbo8CUgdovF1HFWSoy4D5oyhSQ6YBjb
 WWESXLHyma2dS51tM8B9YxtbvcgtZSWXqZkLgIk5yXh2Gi1De4rCiKRo
X-Gm-Gg: ASbGnctpVrgz9DJ8/vedpIbT6mqlxrxhM6JvskwMN0oqifstOPyWFX3Hcbmc98aqASm
 mNM1z4JEv5+mghdYug5S2gy0yl2LHvfw6JWUPhE3WNUfmil8sU6pFWqeKCwwHqL/NUmRy0mczAc
 AfxQlDionoEUNMtY/ruFhdk3bHHbETF/LaEajHR8q0YfsTCcHK05wNrb6g6hzZ2F7mAxvYBuJVE
 RR8Ce4GZrW/2FURjShf1gkLOr3iO4+fRGbS3bCkj+0BKm6RE23HjVEO0Q3X0PRqmOIABcSANNdX
 Vk4dSno7qC9fUK3+pyTWWqxfB4cMNQAmdcdvUDuv3taj6Xb8fdkyv8XyIvnyd4xsTrFb3CGEZwQ
 RmBuGgxZDZXuo81nnhmeZ7QzJBTEiUvB/J9ZhhZ/4hVaey46zJV12QkHbuM76rCvtI7R9XWtrfH
 CDYHo3/lS1Bn1sOMHy
X-Google-Smtp-Source: AGHT+IEHy+Y2fzQAk3dZV6QahdRxDSlEBeTRexcfOlN/UPgG/shF6Jti+KLhEJkls/9J12eMEfDQeA==
X-Received: by 2002:a05:600c:b8d:b0:45d:d287:d339 with SMTP id
 5b1f17b1804b1-467ebbbfd0amr108011225e9.25.1758535582246; 
 Mon, 22 Sep 2025 03:06:22 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f527d6cdsm221293315e9.12.2025.09.22.03.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:06:21 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:15 +0200
MIME-Version: 1.0
Message-Id: <20250922-b4-ddr-bindings-v7-2-b3dd20e54db6@gmail.com>
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
Subject: [Linux-stm32] [PATCH v7 2/7] dt-bindings: memory: introduce DDR4
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
MDAwMDAwMDAwMC4uYmYxZGFlMTViNjViCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyNC55
YW1sCkBAIC0wLDAgKzEsMzQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwj
Ciskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
KwordGl0bGU6IEREUjQgU0RSQU0gY29tcGxpYW50IHRvIEpFREVDIEpFU0Q3OS00RAorCittYWlu
dGFpbmVyczoKKyAgLSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CisKK2Fs
bE9mOgorICAtICRyZWY6IGplZGVjLHNkcmFtLXByb3BzLnlhbWwjCisKK3Byb3BlcnRpZXM6Cisg
IGNvbXBhdGlibGU6CisgICAgaXRlbXM6CisgICAgICAtIHBhdHRlcm46ICJeZGRyNC1bMC05YS1m
XXs0fSxbYS16XXsxLDEwfSxbMC05YS1mXXsyfSQiCisgICAgICAtIGNvbnN0OiBqZWRlYyxkZHI0
CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBkZW5zaXR5CisgIC0gaW8td2lkdGgK
KwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAg
ZGRyIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJkZHI0LTAwZmYsYXpheixmZiIsICJqZWRlYyxk
ZHI0IjsKKyAgICAgICAgZGVuc2l0eSA9IDw4MTkyPjsKKyAgICAgICAgaW8td2lkdGggPSA8OD47
CisgICAgfTsKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
