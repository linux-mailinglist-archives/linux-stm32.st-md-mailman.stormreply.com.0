Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F61B64577C
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Dec 2022 11:22:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D555C65E6B;
	Wed,  7 Dec 2022 10:22:58 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CBFEC65E5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 10:22:57 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id x11so20358420ljh.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Dec 2022 02:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1sijU5enLkDTq3DQ0nw0PYtfD3Qi+72BKYHiCTRs2ZU=;
 b=HZxXQqZ3S3FWmVtrocczB6d8HV4sm0tQJeYbpg4VYj1wUZu5In8brBDiGw5LJHzZEh
 zarVKSoEq5WN7ZOvOL4qZ+QAACHaJ3hZRjtS/u/PWaFnpuj3VJ8YcKj+1YfDTxgmPo4v
 CErSg8d8YiyQgIZsNb3NVn/ySgblrjRn9kYXtDOdO0YyQn5y255pH16yDlt3sOU5LYG3
 2TVtzB8YghEkfZ9Y7z6Mscy1fDDgD3OgJmNMr9Dcisba2yyfU2reI8Rny6r/ZqOG1vJr
 EoUYzUhbmQcy3BRUz7QOLxWbKT2EwWys5YqmirMvHz17JzH11jYwxgkv/wRYjCXu8x8Q
 jfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1sijU5enLkDTq3DQ0nw0PYtfD3Qi+72BKYHiCTRs2ZU=;
 b=W9l7ueTJi8/dwV3fsHgrdF8EJVZFPpHD0jmaDURGiVFCT2vE26mBoN0p3Tp9aZF7tu
 y7M7k6LdBNtynnKoVcegYKA3YsdpZGbhPbfYybXROlFILnLk96HmXAqMmB0q0d4ygc0D
 PtFDFqMKbdQTjfjT1drrEdtqlB/pd02TqfbrvJ54p23EXCbm8mFERw7Uarww2Y9KYg65
 lN3CWv+vQSgr0sSiJiODVFqaoB5HBHb7GWbVLTQggOfjS1GXXf69LQLfmz72hj9ELrOa
 +jc9buf6gkNNN6OsieQa/JFCyU8MLNpBajWBI5e/TOMlpLF+Py9yu9vMmCM4pGwkqYFk
 uTfg==
X-Gm-Message-State: ANoB5pnn+ETkUPGNw5an7o7mTxr2U/BJaBUpDBRfkLuKB8spuyFGj2U2
 3G3WRRzsmjXNlZm/OiY+i5PmqQ==
X-Google-Smtp-Source: AA0mqf5h4sxrFTul2bwSrjyQP2HZcpafzgXYhRs9WtHjL8fjJIlDzOVwcLZqY3H4sd1gKZL9bdaOjg==
X-Received: by 2002:a05:651c:1147:b0:277:4726:bcf2 with SMTP id
 h7-20020a05651c114700b002774726bcf2mr26270843ljo.107.1670408576811; 
 Wed, 07 Dec 2022 02:22:56 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 02:22:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Joe Tessler <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed,  7 Dec 2022 11:22:44 +0100
Message-Id: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v3 0/9] media: dt-bindings: common CEC
	properties
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

Changes since v2:
================
1. nvidia,tegra114-cec: Rename to nvidia,tegra114-cec.yaml.
2. nvidia,tegra114-cec: Nvidia->NVIDIA.
3. Add acks/rb tags.

Changes since v1
================
1. chrontel,ch7322: fix node name to 'cec'.
2. Add ack tags.

Best regards,
Krzysztof

Krzysztof Kozlowski (9):
  media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
  media: dt-bindings: st,stm32-cec: move to cec subfolder
  media: dt-bindings: cec: convert common CEC properties to DT schema
  media: dt-bindings: amlogic,meson-gx-ao-cec: reference common CEC
    properties
  media: dt-bindings: chrontel,ch7322: reference common CEC properties
  media: dt-bindings: samsung,s5p-cec: convert to DT schema
  media: dt-bindings: cec-gpio: convert to DT schema
  media: dt-bindings: nvidia,tegra114-cec: convert to DT schema
  media: dt-bindings: st,stih-cec: convert to DT schema

 .../devicetree/bindings/media/cec-gpio.txt    | 42 -----------
 .../devicetree/bindings/media/cec.txt         |  8 --
 .../{ => cec}/amlogic,meson-gx-ao-cec.yaml    | 11 +--
 .../bindings/media/cec/cec-common.yaml        | 28 +++++++
 .../bindings/media/cec/cec-gpio.yaml          | 73 +++++++++++++++++++
 .../media/cec/nvidia,tegra114-cec.yaml        | 58 +++++++++++++++
 .../bindings/media/cec/samsung,s5p-cec.yaml   | 66 +++++++++++++++++
 .../bindings/media/cec/st,stih-cec.yaml       | 66 +++++++++++++++++
 .../media/{ => cec}/st,stm32-cec.yaml         |  4 +-
 .../bindings/media/i2c/chrontel,ch7322.yaml   | 11 ++-
 .../devicetree/bindings/media/s5p-cec.txt     | 36 ---------
 .../devicetree/bindings/media/stih-cec.txt    | 27 -------
 .../devicetree/bindings/media/tegra-cec.txt   | 27 -------
 MAINTAINERS                                   | 12 +--
 14 files changed, 308 insertions(+), 161 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (86%)
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
 rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)
 delete mode 100644 Documentation/devicetree/bindings/media/s5p-cec.txt
 delete mode 100644 Documentation/devicetree/bindings/media/stih-cec.txt
 delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
