Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67331770F11
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 11:32:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EA17C6B474;
	Sat,  5 Aug 2023 09:32:11 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A01BAC6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 09:32:10 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-99357737980so406398866b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Aug 2023 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691227930; x=1691832730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PU0Mm1LqR6Sd23PVyNdW/l5iyuu7GETQ6ileDMCjS3c=;
 b=ShcmEtOxOcxh8Ra+ZrnyCXiLvGdvy66Qe834X+l4o4ColTafa2s7FQabcHJ7pd41Z8
 VGEoZnsZ61WcwOZKPnLPgk8jvK1iLvsPQ1zOjMCoMSstdNV+HLwb17RY/mzywp4uQqdp
 yKr/gEnh19hjxdorHA0mImP/vuS4UH8QguKvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691227930; x=1691832730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PU0Mm1LqR6Sd23PVyNdW/l5iyuu7GETQ6ileDMCjS3c=;
 b=ECY+Z2meZuX6QLrsqLj8OvUTOzb6wMBlbxn0xTZlN76TzZhIomC72kOj0GqlYVQdW1
 rtWA0/VqC3fySXHYJeHI8wif7zdAX65YCGe+wkc2AaBQP2kBs4E7mii9vw8aiD6IB59+
 9W8UGLpEeKBk8cp+z/uOKBfLLIarhXwc3fTgVG+5d1zSv0R57QIjQAxDVDQMIHkJ3lOc
 IvIOhxpQ5JUp8ZdGA+rlD9nCD+HyHHP6SJQi4wMF5vM8lJVZ1T0ZCcTdXiVcVCHqoDsc
 OYm7JSwTnI0kBFLmwUPH50n7tZ901i+bPeJWnXnidjedPwUtovEuKM+QCMbrm6gQ4jKL
 NQsQ==
X-Gm-Message-State: AOJu0Yx7NlUDisy/RE/PBbZCKXzQ86wSIJUIjOKwPoqWc5Svaithy+7y
 tF5aWc8FwdnOvjkCqIuY35isEQ==
X-Google-Smtp-Source: AGHT+IFLw4j0bbGPR63vRSuWnCt7hC5dc52zhDYTamFBTkW3DJ+duJwVXTNgwXIKssTfvn9FsO3ZeA==
X-Received: by 2002:a17:906:3f1e:b0:975:63f4:4b with SMTP id
 c30-20020a1709063f1e00b0097563f4004bmr3566000ejj.36.1691227930254; 
 Sat, 05 Aug 2023 02:32:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-12-96.retail.telecomitalia.it. [82.52.12.96])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a170906430f00b0099b76c3041csm2491083ejm.7.2023.08.05.02.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Aug 2023 02:32:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  5 Aug 2023 11:32:01 +0200
Message-Id: <20230805093203.3988194-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805093203.3988194-1-dario.binacchi@amarulasolutions.com>
References: <20230805093203.3988194-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v7 2/3] ARM: dts: stm32: add pin map
	for LTDC on stm32f7
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

QWRkIHBpbiBjb25maWd1cmF0aW9ucyBmb3IgdXNpbmcgTFREQyAoTENELXRmdCBEaXNwbGF5IENv
bnRyb2xsZXIpIG9uCnN0bTMyZjc0Ni1kaXNjbyBib2FyZC4KClNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KUmV2aWV3ZWQt
Ynk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29t
PgoKLS0tCgpDaGFuZ2VzIGluIHY3OgotIEFkZCAnUmV2aWV3ZWQtYnknIHRhZyBJIGZvcmdvdCBp
biB2Ni4KICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjMwNjI5
MDgzNzI2Ljg0OTEwLTEtZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20vVC8KCkNo
YW5nZXMgaW4gdjM6Ci0gcmVuYW1lIGx0ZGMtcGlucy1hLTAgdG8gbHRkYy0wLgoKIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMyZjctcGluY3RybC5kdHNpIHwgMzUgKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNy1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMmY3LXBpbmN0cmwuZHRzaQppbmRleCA5ZjY1NDAzMjk1Y2EuLjM2ZGFkNDBkZDBj
NyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNy1waW5jdHJsLmR0c2kK
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNy1waW5jdHJsLmR0c2kKQEAgLTM2NSw2
ICszNjUsNDEgQEAgcGluczIgewogCQkJCQliaWFzLXB1bGwtdXA7CiAJCQkJfTsKIAkJCX07CisK
KworCQkJbHRkY19waW5zX2E6IGx0ZGMtMCB7CisJCQkJcGlucyB7CisJCQkJCXBpbm11eCA9IDxT
VE0zMl9QSU5NVVgoJ0UnLCA0LCBBRjE0KT4sIC8qIExDRF9CMCAqLworCQkJCQkJIDxTVE0zMl9Q
SU5NVVgoJ0cnLDEyLCBBRjkpPiwgIC8qIExDRF9CNCAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgo
J0knLCA5LCBBRjE0KT4sIC8qIExDRF9WU1lOQyAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0kn
LDEwLCBBRjE0KT4sIC8qIExDRF9IU1lOQyAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0knLDE0
LCBBRjE0KT4sIC8qIExDRF9DTEsgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdJJywxNSwgQUYx
NCk+LCAvKiBMQ0RfUjAgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgMCwgQUYxNCk+LCAv
KiBMQ0RfUjEgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgMSwgQUYxNCk+LCAvKiBMQ0Rf
UjIgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgMiwgQUYxNCk+LCAvKiBMQ0RfUjMgKi8K
KwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgMywgQUYxNCk+LCAvKiBMQ0RfUjQgKi8KKwkJCQkJ
CSA8U1RNMzJfUElOTVVYKCdKJywgNCwgQUYxNCk+LCAvKiBMQ0RfUjUgKi8KKwkJCQkJCSA8U1RN
MzJfUElOTVVYKCdKJywgNSwgQUYxNCk+LCAvKiBMQ0RfUjYgKi8KKwkJCQkJCSA8U1RNMzJfUElO
TVVYKCdKJywgNiwgQUYxNCk+LCAvKiBMQ0RfUjcgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdK
JywgNywgQUYxNCk+LCAvKiBMQ0RfRzAgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgOCwg
QUYxNCk+LCAvKiBMQ0RfRzEgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgOSwgQUYxNCk+
LCAvKiBMQ0RfRzIgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywxMCwgQUYxNCk+LCAvKiBM
Q0RfRzMgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywxMSwgQUYxNCk+LCAvKiBMQ0RfRzQg
Ki8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywxMywgQUYxNCk+LCAvKiBMQ0RfQjEgKi8KKwkJ
CQkJCSA8U1RNMzJfUElOTVVYKCdKJywxNCwgQUYxNCk+LCAvKiBMQ0RfQjIgKi8KKwkJCQkJCSA8
U1RNMzJfUElOTVVYKCdKJywxNSwgQUYxNCk+LCAvKiBMQ0RfQjMgKi8KKwkJCQkJCSA8U1RNMzJf
UElOTVVYKCdLJywgMCwgQUYxNCk+LCAvKiBMQ0RfRzUgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVY
KCdLJywgMSwgQUYxNCk+LCAvKiBMQ0RfRzYgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywg
MiwgQUYxNCk+LCAvKiBMQ0RfRzcgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywgNCwgQUYx
NCk+LCAvKiBMQ0RfQjUgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywgNSwgQUYxNCk+LCAv
KiBMQ0RfQjYgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywgNiwgQUYxNCk+LCAvKiBMQ0Rf
QjcgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywgNywgQUYxNCk+OyAvKiBMQ0RfREUgKi8K
KwkJCQkJc2xldy1yYXRlID0gPDI+OworCQkJCX07CisJCQl9OwogCQl9OwogCX07CiB9OwotLSAK
Mi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
