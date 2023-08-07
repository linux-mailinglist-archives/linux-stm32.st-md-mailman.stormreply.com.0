Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C268772EAE
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 21:31:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31895C6B45C;
	Mon,  7 Aug 2023 19:31:34 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6B17C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 19:31:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-3fe24dd8898so42073325e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Aug 2023 12:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691436692; x=1692041492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eRSwV6Gm+XzxbXgNMBpKpDlEh6gTRS+MFq99dQgncbQ=;
 b=mHrDzRq+wq6uTZHPmwteMcteTqBarR3Nk2/LC+UMcpxDdpyYVB/0FPzO+LDxTTbbNr
 hRhzkXWggtKCLT4xwA7fIp3dNwm5RWOSGd3w4YU41OwbdBx+3TsaQno03l0rK33u9g29
 Mm3pzAcNw4BPYcA6KtUHgbmxynAXxh683LDni4HrDhgv95CoIFLQOyru7phiWKQkGpPI
 LecLAQigg50nsbneHX72Bl9nT/Umvd5U9X6d/NHRYZWJrzCXRsQ0oxSGLsRB6I04PHxm
 pomhLzO6E0p/XZZ9ABl879hBlfPQi9HFO3KNgYy1Nc8E7e3gSGuQk5OWV4X7lV4DBs+G
 oFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691436692; x=1692041492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eRSwV6Gm+XzxbXgNMBpKpDlEh6gTRS+MFq99dQgncbQ=;
 b=jyyOis4nsQlEANY5+Wl5vv2BQ31fnfw03YaCpHuQ29vBwBrGTQby7X9wVOxsIaYMHP
 YOVE6EPEpmNUudFMRmftcu3Xc1SIdIpaiIxF97k6y7RCtOrw0MgXmxFx2w0EYkHCpbuN
 oOWBnzlQbmJcFPUYqfZ6wPt4FGXbKt9W5taUlhTKaEQFOCzWwncf57vuU3P/oH7NtMx1
 F7eSe/PAvfZx/jzJz3xddwS+Kia1nnBPQK633rBIOe7u+97c71Ox1jkO9HdxSCoZdScB
 RwbcyVWDusz4xMV+u/qoWhEoLkACGiH3/Ox2H48igse2m4pzdIx/3APcBl78s9ydjn0/
 5GPw==
X-Gm-Message-State: AOJu0YxDRThhZ01BMBAxo39vULA4qQO/3s0GD1Fp4x/StQ9zZpYsdRGJ
 m3dWTSsXKzexpm7YMy8aN2YfvQ==
X-Google-Smtp-Source: AGHT+IHcrhdGZU6crsuk18nFD4cu1qWw7VPP+T0+AdP+h8J/EgCXLVdYCouqFEEXXaCm890UjwpwOg==
X-Received: by 2002:a1c:740b:0:b0:3fe:5053:1a0b with SMTP id
 p11-20020a1c740b000000b003fe50531a0bmr4034769wmc.11.1691436692253; 
 Mon, 07 Aug 2023 12:31:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b3d6:9e6:79d9:37cd])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a7bc347000000b003fbdbd0a7desm15985654wmj.27.2023.08.07.12.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 12:31:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, Alex Elder <elder@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Date: Mon,  7 Aug 2023 21:31:00 +0200
Message-Id: <20230807193102.6374-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] net: stmmac: allow sharing MDIO lines
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Two MACs may share MDIO lines to the PHYs. Let's allow that in the
stmmac driver by providing a new device-tree property allowing one MAC
node to reference the MDIO bus defined on a second MAC node.

Bartosz Golaszewski (2):
  dt-bindings: net: snps,dwmac: document the snps,shared-mdio property
  net: stmmac: support shared MDIO

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c     | 8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 6 ++++++
 include/linux/stmmac.h                                | 1 +
 4 files changed, 21 insertions(+)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
