Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E562FB5107D
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:07:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8465DC35E00;
	Wed, 10 Sep 2025 08:07:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D492C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:07:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45cb5e5e71eso33369545e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491665; x=1758096465;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZVm/deDTR4I7zgxqPdQwaIpbJb7N4tc5cNwrlaMAz50=;
 b=VNDr3XuzDkeyhvPfq2bXrwrLZ46Ayi6xBee6Ihw1DskaSl9mHF8x40+3QpKSEoqHCx
 SQ2pz+VeQkFypW01KHIjm+FhEKUmRYvdOEQpPyOqDqOFwdoGJVJuILytudx4BXMHL7Z/
 QW5dOYdC2IsylRYv7wn1LVzvRS5ogStVi86hUefAzz1ZHcplmFhm0eGdOm8/fdJ4yilW
 y/MlBOU0Yjq6h63Wv8Lg/1oi8m5biEs3zkTBAR6J/916U/tdcYVIT9pt9FXKggl2tYyN
 eKyVJf5C89Frwnwc7TZF3tBHh/FXoS/+am9hpImnAyBRn4Br2fAI7U2HjhBZjtzXjoVn
 zU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757491665; x=1758096465;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZVm/deDTR4I7zgxqPdQwaIpbJb7N4tc5cNwrlaMAz50=;
 b=HhLmc4dmW6nOBDFT6mKzDi0+h09VLGg5LeQIHu2L0loY3TKUYA3h5X0MPbPQP7xM/w
 4XKof1xuaZ1hN00wIBOMmEg4zdne3dALw7BWzGuEMCiH2VC/bodLl1r6MpZywZo07qPg
 tzpuywLN7uPKer6QbC6drJIlYlVSWFUJ2as5WbJQBuz3G03CIdhi563k90rCEuDz+n4F
 9I5cOo3mmcznJJFqH38kZv3rCi4UQBa0GWKQfxIfWllpnj0Kr0VxEcxals/imj0nrdhb
 wl5yYM8nQUQyc4Se7SeET0tPtgxwmrrd3XtC5qnQDvJzYER33ZRHGV3+RyQe6hlnwaih
 P/BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+Y+UbLKRJ0HOolyeaHt6gBPlZ/AySZUVlIO5vS/tZIcIfvJzTvil/WIV/n6TE8zoQb1eD630+0gOCyw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6jZh90lYUumYVyihIDqFZBhJPqPWUjRP912qP0fNreQ8NbqFi
 uYF5AN/IPJLm4jQpClWMSiO0SgkKIVUnR25Z3Hhm0oxLU4q9TXqMxeSHyjVKNb9HFk0=
X-Gm-Gg: ASbGncvHCrQaKCQVHYBhdlDk5qNaxQ7pfOGMRi4EGHBMOY0uSpPYGUcqQmQ/pUPM1hT
 ph92yAur5tZt40iGkKFEgP/eQR2+MC/WP05LP5XGy5sgqzk/GxZCIx7r9vtgKk4MirH3yrwfU9Y
 0E0K+enNYh1OlwoiVzhteyY5gTsyG9Ws1jh5dFdQwjT94mHhrATTOcDmF6EXuGQ37wzQxW/O1fc
 xOf9wMAAbDlxqoO336kJXS8X9Wcg/vPhyBbAveBAWwHKjOdAYpc1D6In6WAp3yzgZVJr7H9dzT4
 X1iEqVKlRydvejH1jBAA/UVRpGPxvVmi/7eqEDt97rodfPmUd+i+y9gRD4QRRfX5YcGeUi9N2Zc
 NRsy/HPY4T1Fk8uYerdJUG7VqYLlA
X-Google-Smtp-Source: AGHT+IFBs8UXGxgkaSg80fNb2XLa7R8prdLQ6TRj1KMntX+P6s5LJFVMk2sAxSEGFFCGhjD2XvI0jw==
X-Received: by 2002:a05:600c:5493:b0:45d:98be:ee9e with SMTP id
 5b1f17b1804b1-45ddde6a3f0mr115055345e9.1.1757491663893; 
 Wed, 10 Sep 2025 01:07:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 01:07:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:37 +0200
Message-Id: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMkxwWgC/x3MMQqAMAxA0auUzAZqNCpeRRxKjZpBrS2IIN7d4
 viG/x9IElUS9OaBKJcmPfaMsjDgV7cvgjplA1li29oaT39smFxHzAFlcx67urFUsfNcEuQuRJn
 1/p/D+L4fffhoTmMAAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dSk6AGhrmnQiBMVkm4iUfkoi5uR3VSQpSwlqk/H1gAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHMa0WXc9aZw47LWizXetwGI4lOfCYN4Ubg/
 S0JYjTkmO2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzAAKCRARpy6gFHHX
 cuN7EACjo0XR4wFpMDKfJ5JkLwH6gCaoqJ2aZHjkmrd16YbueY63wBPoyxG9WXQv0Pf1CaStyXl
 EgOiXcb0+VDPxR3B91vaK9IMbRiGNPYTMQdKA4yfwEsQE5v4Zkad+jyKkw/LKTklVjgk7SLWsCF
 GdZDPsOv3Ql1EjwsdolRyF+lV1G97YwOrgnh5I8Xcpdj5FZ7cdPyaG0jX2D0mAjUHLn5qQjeuaY
 LF1eOrWKp+jEO7c72nmCpUYiSoOYfms0RZf0ehpTDsivB6ZjRpE3ovGKQc818SKermDhNho1jhk
 J0up1Qexbsfn2ijnAtEPz6n01wuFc6kr24DVj4bwvM+X1GwezbR3Ta86Pb5T7CQdkiSCOUwhZX/
 c73JWNRheNuYte3uRpGaDwLHAKPfZfMAMIUFXN5yGUUCQbCcIYEu1DQbgv/SPE8sef+5v9zE1xN
 lngurd+guGXjCYXBBp2iLx6LL2WDHR5oe6FmXMbwo/3J4/+790ec4uy/xAPpVJiGZ26dnu8MNd3
 PrJgMyP8CUQLYrX6pDmy2ZcoXy0B2DR1cVZBsN+nFarBqZpwS/8F6dO2UkWhs5tun5ukzTs77mY
 j+/QSI9gT93gh018RqOXMK8DG+UWcl6UZ7cK69n4R/hqhgpU1szBSSzLSDOco8Hxfi8He9Lvjzb
 TCgZ4/r96lqxrVQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/9] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings, new DTS
nodes and driver changes required to support the MAC in the STMMAC
driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (9):
      arm64: dts: qcom: sa8255: add ethernet nodes
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts          | 201 ++++++++++++
 arch/arm64/boot/dts/qcom/sa8255p.dtsi              |  44 +++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 345 +++++++++++++++++----
 7 files changed, 633 insertions(+), 65 deletions(-)
---
base-commit: b6a291a76ecaef3b49d8a9760865abb3d8480dff
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
