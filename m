Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A851493F9FF
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 661C0C78F63;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 302E2C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 22:35:23 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-376266a65c8so13658725ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 15:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720910122; x=1721514922;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z9djOW17Hq6Bkvn3DcF8Wpe8/RB5nd3f1kRECjv6cq8=;
 b=BenVwobgbiqgJMimquE14OpHmY39NSOUvXoCnZtnvfhmgger4TjP79JJuqwgNiVzfO
 H2Au+qJdoRDnVyEN5OcfXqY5gxjnNGPV2yzo8x+RhEAAw4Hlo6Rf6ezUILzgSPbYyxFM
 wRmvVpc3ok/EWITsviKkcow9my3WcaqCCpYGVYcagiyjXFuiQzZJetLvdjFpk+qSfSAM
 g1Hes7NHOIYFRTQUVnKSIgoHZY5VV5NqaNU0ulZUBWhdxAD73SIwHbx56KqpiwYdE3jQ
 QVQZTPEOm2UwAGXD9FdwlCudBZ93kIjKvKRLtMUKU7Ra03ILD5bPOk4mokt5DpmXUbnY
 rRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720910122; x=1721514922;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z9djOW17Hq6Bkvn3DcF8Wpe8/RB5nd3f1kRECjv6cq8=;
 b=V8UfgFWr9x14CnWUvmSbKXFQNW2/rooQNq5q7yt1pMyQoOQc7q/stRrL2Jd3VdLz21
 n08K4JvLbPpqAO0BUFQzmhRWUrjimlMLBDU07qW4LrxZgYqSNVW0yuVfJC9g/j9XRgD4
 kVP26SNtA55AIWBS71MuF/2zC86UZy6rAyKWXf1L2a04MK08T12KhXSEhSu9L1Us7A8m
 2tpvBL1lptPg8NaG938F27NHynl1R7tcVk7MRU/rUY1QXyBkWFadJk24rfBSBDnQy/05
 5TJb5fG3b11ot+HZ0IeqMbGK1P9D8zY1BI57f3/MtERa/GcsQgxwLQv7qCQ+/MjMkkld
 8krg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWte21yVCKDqUeEwCO6R8Ymb9hdDiCXptUVslp3APFgMczIcqf7iFwACZ22i18A5p8QbUgWIC2CQULbHwoX3p7O5egMnTVr8rqXMSu4fpEAL8X8i/k0Eohv
X-Gm-Message-State: AOJu0YwusQSBuKRDtyoDbtSps/g5QzXuLJWzhJbFnabbiEo8bCNGLfOB
 60Qzc/kknQyukHuN2NhkeuM2ZRnw9mRThDPU7zj8QoO2aeYtdV/FNwKkByahT0Y=
X-Google-Smtp-Source: AGHT+IGNoMVxgXKi4Huov/Am3Ivchl0iprmp4ADpiiyaxEKkK4U/SDRcp1yh3lV7jZtqlVQMYQIEhg==
X-Received: by 2002:a05:6e02:1aaa:b0:37a:a9f0:f263 with SMTP id
 e9e14a558f8ab-38a5910a9dbmr198272225ab.20.1720910122467; 
 Sat, 13 Jul 2024 15:35:22 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:d7fc:57d0:ada6:13b7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc4d9d8sm14640025ad.264.2024.07.13.15.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 15:35:22 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Sat, 13 Jul 2024 15:35:10 -0700
MIME-Version: 1.0
Message-Id: <20240713-thead-dwmac-v1-1-81f04480cd31@tenstorrent.com>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
In-Reply-To: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720910119; l=1130;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=L968+RrYNmrkLCbknalApiDQwXty2dLJdHRIixXyCag=;
 b=L3rqLpVjtvL21xgmZs17aB0F6yoEoEFcG/yalWgNg23k2p7NGXFOeub8Bz4u6U8EICTfuR3s6
 7Lx5UJrPN2QAxVkpjpSt/mOQiqvngcDggj0buGRWYjAWtMSM++8boGB
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 1/4] dt-bindings: net: snps,
 dwmac: allow dwmac-3.70a to set pbl properties
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

From: Jisheng Zhang <jszhang@kernel.org>

snps dwmac 3.70a also supports setting pbl related properties, such as
"snps,pbl", "snps,txpbl", "snps,rxpbl" and "snps,no-pbl-x8".

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20230827091710.1483-2-jszhang@kernel.org
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 21cc27e75f50..0ad3bf5dafa7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -584,6 +584,7 @@ allOf:
               - qcom,sa8775p-ethqos
               - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
+              - snps,dwmac-3.70a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
               - snps,dwmac-5.20

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
