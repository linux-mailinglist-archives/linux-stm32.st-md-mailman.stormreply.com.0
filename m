Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA966331E0
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 02:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9B45C6507C;
	Tue, 22 Nov 2022 01:08:14 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5672C640E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 01:08:08 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id s5so18566078edc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 17:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NXlietmMDnMDDCbd3vt3QmKB/26LHM3Ufg/KK8xRGJ8=;
 b=m0TewJWW7KhTdSXchwcIkyxlc1EkvKyFWq5uJQv+yKMBp+IF5UtjELWqTQSb6qyCew
 kJHBq5X2f6gtjHpqsgh3S4R+eSNqeSybw4Z++QF6NViBx9aQNs9n6HbaVslpThBjx+8Y
 z85ErMR41r9qSXqg2hznA9QNL6CaZ4N3UymM3Ml9fqxpmgFNJHzKuK3g51mbb04B14oL
 6Cc1EOYi14h1Qu7wmDAPRkY4+Ot8gdVQMu+ubmNtFivjU97hBzmtHhCtlwuUdI9UF9ee
 kueWGK/JDg0GEw9aVPF4x3B+j2tCzomWngtlys7Z8cxOYlblZulqOdR0txPc88AqW6W2
 nhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NXlietmMDnMDDCbd3vt3QmKB/26LHM3Ufg/KK8xRGJ8=;
 b=LDUqqYRQDAljvs3r/VwWTtO8LhwtYm71X6lotJsu5/T3/wksCuqEo48xOeN+Mn8fjZ
 oY9ts9xT6yclrQGdAtuM0N0Q7EeOUe35pwjI4SHAWLP+rsxE/Mgaiy/HyTEGoF+aLJ5n
 leRuC96HC6rtMFR7XkeIbj0xay0cqbDRKUlQrSgM8krGIh79TDTXxw91oHf4O26SwPpv
 0uyARfse8pN0lf52vZXnkxwn0GJSmp2sX+Lb7A2cU3LFtu3Z8wIIlvL1kpsC+OgTZaym
 nUM4fLHr+yM5eM2SdQDap/bvzKHm1+Mc1VBVfjqmBV70d8t+Vzjt5Lg2InJd9nlPbY5R
 PzVw==
X-Gm-Message-State: ANoB5pnYblYBu+HLckuUiPspbDrNIxOoR6UZs+fVPEU3xUADgCsFfwUl
 n/3cgktO0dXDQu/c5/oMLsyc5A==
X-Google-Smtp-Source: AA0mqf6YHtIfMeR6UPTvsarDA6CMoaDvypsfuFvEc487eJW3bla0HrQAC73iEkA2LGGrx+B9tWkmow==
X-Received: by 2002:aa7:cc14:0:b0:468:58d4:a10e with SMTP id
 q20-20020aa7cc14000000b0046858d4a10emr19202803edt.222.1669079287797; 
 Mon, 21 Nov 2022 17:08:07 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 17:08:07 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 22 Nov 2022 02:07:46 +0100
Message-Id: <20221122010753.3126828-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v2 0/7] Remove the pins-are-numbered DT
	property
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

During the review of my MT8365 support patchset
(https://lore.kernel.org/linux-mediatek/20221117210356.3178578-1-bero@baylibre.com/),
the issue of the "pins-are-numbered" DeviceTree property has come up.

This property is unique to Mediatek MT65xx and STM32 pinctrls, and
doesn't seem to serve any purpose (both the Mediatek and STM32 drivers
simply refuse to deal with a device unless pins-are-numbered is set to
true).

There is no other use of this property in the kernel or in other projects
using DeviceTrees (checked u-boot and FreeBSD -- in both of those, the
flag is present in Mediatek and STM devicetrees, but not used anywhere).

There is also no known use in userspace (in fact, a userland application
relying on the property would be broken because it would get true on
any Mediatek or STM chipset and false on all others, even though other
chipsets use numbered pins).

This patchset removes all uses of pins-are-numbered and marks the
property as deprecated.

v2:
  - Deprecate the property instead of removing it completely from
    schemas
  - squash some related commits

 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 5 ++---
 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml        | 7 +++----
 arch/arm/boot/dts/mt2701.dtsi                                          | 1 -
 arch/arm/boot/dts/mt7623.dtsi                                          | 1 -
 arch/arm/boot/dts/mt8135.dtsi                                          | 1 -
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi                                 | 1 -
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi                                 | 1 -
 arch/arm/boot/dts/stm32h743.dtsi                                       | 1 -
 arch/arm/boot/dts/stm32mp131.dtsi                                      | 1 -
 arch/arm/boot/dts/stm32mp151.dtsi                                      | 2 --
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi                              | 1 -
 arch/arm64/boot/dts/mediatek/mt8167.dtsi                               | 1 -
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi                           | 1 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                               | 1 -
 arch/arm64/boot/dts/mediatek/mt8516.dtsi                               | 1 -
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c                          | 6 ------
 drivers/pinctrl/stm32/pinctrl-stm32.c                                  | 5 -----
 17 files changed, 5 insertions(+), 32 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
