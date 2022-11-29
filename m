Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF2C63B7EB
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 03:34:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61AE2C65E6A;
	Tue, 29 Nov 2022 02:34:09 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 790F3C65E6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 02:34:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ha10so30558811ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHzYJsu6o55ysC/VZNy1p8R//hSsaPxHyoFnYfPzMc8=;
 b=Qi76vhF9q8A9ALrP1+nc4tr5vlTzbIx+o5acojEYZAQkcuANvn184hZhGaE/aDUxUI
 xrW0IIdoQ7vGR63MoGSAIbqf8hB9Ou3g8KXNqTfRTi4T33aeuefIDhOax+tou03onUVf
 F7m7RWHYie6X+A2J0bUnRxxjVl2WqlWZZipS4uh9ymC/LPhm2tU6rzAxnALilhxm7JAS
 W9bL6ZdYxCgtwG9Z2BksBP3BvrDKtYYc5Mn/XicFYlYN4U7ld0I9CVPZqitM5agMTH2K
 RJlPeGjVkh8sHAorzQG7u72wfSg+OigOzB1Q5pTMk5itN7Rni9aW7ij1OK8Z3b+lwr1w
 7U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHzYJsu6o55ysC/VZNy1p8R//hSsaPxHyoFnYfPzMc8=;
 b=PmfIi/PX94RJO+/SbDy9bmIM78NgyjrqFyI+TuezfFd3Khr9UVirATrtBZLhsFyKFR
 CmcVPA+GSo0WmrYdrCqvAglQdv1Br89PlkBiB5IDUEBQYlw57R+80ud4BZlBOxsll6pe
 f7M5T/kgR/dhG80+DGzVOFsvrdbpzbVUbXSvCLlwxKibqrgb+d8LWlyXTKUSOnqijwhN
 BgYegL10kDOfNnrQb18oH3jHNVtUzW52t2WXaY6j60RWxDWIlIZ3zu1ww9hUYutj1RTB
 Gt0vyNnBLSbBZV3xjEVfEizV2WRGtbjFov8Yl0xXcQfJwG0M53lw+JqAVDev7g0G9yof
 eK8w==
X-Gm-Message-State: ANoB5pkzQ+DJLLas2tGKWr/gHWh7cJQVzHnsYwqqZbjF40beEvwHDs+y
 f2ZvQDoug0hLkGivIrvE0EisbQ==
X-Google-Smtp-Source: AA0mqf6Lf3AT2mq69lc2sJzPEUfGRFH+/ZCr1QgpSmG6gf71FTbd3ODAM1B5nKyNTERJ7d+muhccug==
X-Received: by 2002:a17:907:d042:b0:78c:c893:1965 with SMTP id
 vb2-20020a170907d04200b0078cc8931965mr44638929ejc.247.1669689247159; 
 Mon, 28 Nov 2022 18:34:07 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 18:34:06 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 29 Nov 2022 03:33:58 +0100
Message-Id: <20221129023401.278780-5-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v3 4/7] dt-bindings: pinctrl: st,
	stm32: Deprecate pins-are-numbered
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

RGVwcmVjYXRlIHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eQoKU2lnbmVkLW9mZi1ieTog
QmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBN
YXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgpBY2tlZC1ieTogS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgotLS0KIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1sICAgICAgfCA3
ICsrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwv
c3Qsc3RtMzItcGluY3RybC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1sCmluZGV4IDlkNTkyMDhkODNjMTguLmVlYjI5
YjRhZDRkMWEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1waW5jdHJsLnlhbWwKQEAgLTM0LDcgKzM0LDkg
QEAgcHJvcGVydGllczoKICAgICBjb25zdDogMQogCiAgIHJhbmdlczogdHJ1ZQotICBwaW5zLWFy
ZS1udW1iZXJlZDogdHJ1ZQorICBwaW5zLWFyZS1udW1iZXJlZDoKKyAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFnCisgICAgZGVwcmVjYXRlZDogdHJ1ZQogICBo
d2xvY2tzOiB0cnVlCiAKICAgaW50ZXJydXB0czoKQEAgLTIwNiw3ICsyMDgsNiBAQCByZXF1aXJl
ZDoKICAgLSAnI2FkZHJlc3MtY2VsbHMnCiAgIC0gJyNzaXplLWNlbGxzJwogICAtIHJhbmdlcwot
ICAtIHBpbnMtYXJlLW51bWJlcmVkCiAKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQogCkBA
IC0yMjAsNyArMjIxLDYgQEAgZXhhbXBsZXM6CiAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDE+OwogICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMyZjQyOS1waW5jdHJsIjsK
ICAgICAgICAgICAgICAgcmFuZ2VzID0gPDAgMHg0MDAyMDAwMCAweDMwMDA+OwotICAgICAgICAg
ICAgICBwaW5zLWFyZS1udW1iZXJlZDsKIAogICAgICAgICAgICAgICBncGlvYTogZ3Bpb0AwIHsK
ICAgICAgICAgICAgICAgICAgICAgICBncGlvLWNvbnRyb2xsZXI7CkBAIC0yMzgsNyArMjM4LDYg
QEAgZXhhbXBsZXM6CiAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+OwogICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMyZjQyOS1waW5jdHJsIjsKICAgICAgICAgICAgICAg
cmFuZ2VzID0gPDAgMHg1MDAyMDAwMCAweDMwMDA+OwotICAgICAgICAgICAgICBwaW5zLWFyZS1u
dW1iZXJlZDsKIAogICAgICAgICAgICAgICBncGlvYjogZ3Bpb0AxMDAwIHsKICAgICAgICAgICAg
ICAgICAgICAgICBncGlvLWNvbnRyb2xsZXI7Ci0tIAoyLjM4LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
