Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD0766428
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 08:34:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26B2EC6B46A;
	Fri, 28 Jul 2023 06:34:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AB33C6B45C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 06:34:25 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-52256241b76so2223283a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 23:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1690526064; x=1691130864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PU0Mm1LqR6Sd23PVyNdW/l5iyuu7GETQ6ileDMCjS3c=;
 b=MAL6quypMmxcdDXDyIfmE1EcLbwuJ+ytTfEPqf4tf2CkR3L1x2Woz+D5VrdldmYxab
 K5cbUlRFdGK3UNWSFMG21W8lQWJkXn8OZB+xIR+7JvpjEFm2CCerjyrRKZAuWh/GWcPo
 cvtF2r+VnMGdKDo5iNmJYwGOrAG2JRigeXFfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690526064; x=1691130864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PU0Mm1LqR6Sd23PVyNdW/l5iyuu7GETQ6ileDMCjS3c=;
 b=YN1vhvP7iKNre73kewLJ9bNacYEFFVngmj0JlpZROHZLUrxdeSRo8+Ld3WH6+stQxv
 572xbdpYCvcEEdyiIDbkurmEeehA6NPZVw99lgfPko1ImcG2y/yneIwAqyGFJtNNnBHu
 ValNzmCaWITr/QISOJ/wg2IGK5as7Ih0yGfAyjrBWSPE7SfIDCyj7FnuD2CxC0vO9eyx
 jEb3pvzIuEHrGbcFhlmln92jQcmPptc49pglxmKWI7P7Lajqd63TLtiiirhFin0UZMiX
 iKdo1vzFg2RsmbhPEcdBsEI4BFEkf1ztEk8LB1WeviikEKgJ/gttNw43tZ+qHXuUWUTb
 DliA==
X-Gm-Message-State: ABy/qLZuPmctHsOUv35PXM50g8iG5J1WFgK9NsijvR9oABkommKWmR+S
 7Zjhf2J0r0ZEJUjBulO7ceFfdw==
X-Google-Smtp-Source: APBJJlEwVS10HgWPALySQfhw1BUCzGHABzjXnfKJaWlGokty4ZOXpOwaA7BlcsIIEnAynXI76Qm70g==
X-Received: by 2002:a05:6402:296:b0:51e:34d5:a23f with SMTP id
 l22-20020a056402029600b0051e34d5a23fmr1074950edv.23.1690526064620; 
 Thu, 27 Jul 2023 23:34:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-232-62-70.retail.telecomitalia.it. [95.232.62.70])
 by smtp.gmail.com with ESMTPSA id
 n21-20020aa7d055000000b0051e26c7a154sm1425057edo.18.2023.07.27.23.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 23:34:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 28 Jul 2023 08:34:15 +0200
Message-Id: <20230728063417.2980091-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728063417.2980091-1-dario.binacchi@amarulasolutions.com>
References: <20230728063417.2980091-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 2/3] ARM: dts: stm32: add pin map for LTDC
	on stm32f7
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
