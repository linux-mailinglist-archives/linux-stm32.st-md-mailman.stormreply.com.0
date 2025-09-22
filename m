Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C988AB8FE85
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 12:06:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91A80C3F92E;
	Mon, 22 Sep 2025 10:06:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F570C32EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 10:06:30 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3ef166e625aso2070500f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758535590; x=1759140390;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
 b=nfi2fZgOE+4PdKc4vU87SNiwI0L6FgIYQIgy+ueLAos+FDsOVsz5lt3JRa4mFq7X3V
 8fBCQveqWVAchIBiZmRHYgIjDAD3NIa1hUTq1WbTNh3aSb8CG21ngEK0X1CD7XuU617e
 6t5o9lI0nknj3qSc3xVw5F7ObG/lY/UVP4H9ok4CopSyfly9ssxDbp/PKIeqlsMrJgEQ
 GEzgTjUJ+hc/iJfVlovvIl6apj2b02ppzM4GirkqNbOJVQBynsukpEsltABwGU5s8cmA
 WyeIGD5ujz9kbSi8LJQ1ok4J+AtVvcDkohXdh2pd1WxraUGJNjVMCSW5pmKBsJ91MPiX
 RI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758535590; x=1759140390;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
 b=NhRkqZUp3vqrcJdzfsUA/JX7fz37N0ylDASUvNWl0u1h7XSfHVEPjOAtfvux+1CC3w
 RC+mJU2r6zJC/9c7kEwAJYMKxrONrJJAH3sxCGL9fMBmU1+aNOr84Vm8YzXD3SkzvrBe
 +Y5/diC96+Vex7YUc1CXtm1gsLJpgKfebGRr2qAK8JDiitLuYZAhi9gG1+LBu8qcQhcg
 JKwuSBymam+OIfanuQGU/d5JJpfQ8JRgPZ68T2QNSksuJKqXJX8Af+gdvIutbtJifOf8
 pRtWKkUBbJnTjylYDzz+h2R8MpYJmupuGOJBxWuP7/TuMmZnUGlu9Savneh+UdOtaHiJ
 qD5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV84B6HoFulU6Pcdn3Xv9jgq8I9WAJWqPoM2s8rDlDehTKrUQrHoj0zdOKBeivbUNXDobY73l86lQbuWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxVo0zOjfv/IuvAe6ivl7YNR6R93WR/fVqJfR3c3JB3TLBHTOJ4
 x5j9P3/3KfLz1C3jKWtYw+NUHCtZsS3zxpgQ+9L4Ur85PgpgUXW1TxVQ
X-Gm-Gg: ASbGncvpWi4ldpkbpVeIxbiAse4FwAVGsla9ive0FQr1irgzQ7LZ99/rlpnYFy8o9B+
 qrbxuWTgRty8pLA9GfSuhMahc7X8p8EaiOEC7o31QmAIlD/olLf+mzboH4BE3bxxRygi9m1mgFz
 EhjIZFUrRj83gSSqG0Wq0NCMj3f25Tk4b631T9eWQgIZl4ls9T10dL5xsEmCI28h7VXiEQwVZWz
 8GKyr1s5xZN/eEfGuiqpPBpVbOioW+rDbyl5mBYiievp2EAH2cB8MGXP/AGicRnmjYI743Ul2aX
 nw63SOJNTmPio63iKzrRoD5hvI3IFVFOfJXr6NNl1KgDz6sez5qJsT/I8RsGMMvkFrvulkIuN5o
 ecvRfFfjt6hVMhjnvnRfaDTLzjp8LBeyJWiY00bb9B88n4rbMky5nYePINalVyJLOV2HKbKJD3j
 JNFrtQEwPPxzsENj39
X-Google-Smtp-Source: AGHT+IFMdYeYi2iaeAdjrGDcnkGPmrB4GjWSDhVK2rF2FgfKPc6GjT1SHKlJ9mXDLcRp77TRnBlKDg==
X-Received: by 2002:a5d:5d88:0:b0:3ee:13ba:e140 with SMTP id
 ffacd0b85a97d-3ee7e1059b9mr9638251f8f.21.1758535589473; 
 Mon, 22 Sep 2025 03:06:29 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbc7188sm19867335f8f.37.2025.09.22.03.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:06:29 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:20 +0200
MIME-Version: 1.0
Message-Id: <20250922-b4-ddr-bindings-v7-7-b3dd20e54db6@gmail.com>
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
Subject: [Linux-stm32] [PATCH v7 7/7] arm64: dts: st: add DDR channel to
 stm32mp257f-ev1 board
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
QWRkIDMyYml0cyBERFI0IGNoYW5uZWwgdG8gdGhlIHN0bTMybXAyNTdmLWRrIGJvYXJkLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRA
Z21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0
cyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cwppbmRleCA4MzZiMTk1OGNlNjUuLmM0
MjIzZjA2Mzk2YSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3
Zi1ldjEuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0
cwpAQCAtNDEsNiArNDEsMTMgQEAgcGFkX2NsazogcGFkLWNsayB7CiAJCX07CiAJfTsKIAorCWRk
cl9jaGFubmVsOiBzZHJhbS1jaGFubmVsLTAgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJ
I3NpemUtY2VsbHMgPSA8MD47CisJCWNvbXBhdGlibGUgPSAiamVkZWMsZGRyNC1jaGFubmVsIjsK
KwkJaW8td2lkdGggPSA8MzI+OworCX07CisKIAlpbXgzMzVfMnY5OiByZWd1bGF0b3ItMnY5IHsK
IAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwogCQlyZWd1bGF0b3ItbmFtZSA9ICJp
bXgzMzUtYXZkZCI7CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
