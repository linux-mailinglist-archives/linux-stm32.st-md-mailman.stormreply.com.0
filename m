Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE5088CE4C
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15B30C71287;
	Tue, 26 Mar 2024 20:24:26 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C41F0C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a4734ae95b3so593852866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484664; x=1712089464;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0+KofsDX7b8B7he35yQ05XHUdu1qHb7C3AOSdJZ0YF4=;
 b=ya5jaOtk3qmfCPG+6Ut2yry9Okje5xBJohiHoTiGLmYIoiahtqGmPqgP2zidQWBOtk
 mF0WJ9WTdVN+c/hoAnW3P6qiFRXEU/dAW+UPFXsyeXfMqHCwXMy7by4EwEtbpJMdlsep
 g+u+kddVz54UMGZTk7P3HBRCS/uEppXlo1pOS73AwLoKZKg+SlSHT2v5ojTAf976xg2l
 QNOEmWItDfUYrZUkfMrr8dV+MbqpsoRvkK4kJbo9G5FU29ivaUPwu8KpUszwwVgXTTYE
 hebHx84en3iPoN8jUZ93ySKcg2od/kWk+CbQDJHygf/nDMyq5hzimH6m7LkW3u/l3k/N
 tcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484664; x=1712089464;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+KofsDX7b8B7he35yQ05XHUdu1qHb7C3AOSdJZ0YF4=;
 b=bGNsqV8eEKtkMd4aguzbRuzndQ4jlQK9RWDDhLlJyuQck6WCRi7BBVdiMnzWtocfAp
 kKt0eizZvmXGbLock4hpXbtMbnO5DKoH391GSSopr/8Rk5aG8GvxNCcWBAY4vpshvcLE
 wDRMsbevJwdB3qeTIHpNEZtfsjp2NZnjdX7lXskhTb7Tog1s3WzPAIXqLh530GvlUHtg
 LV9YRMZYgmJ5wf0/CshbUv3qMw3HSsEXGa4oS8F1bk+zkKvojXK1frMTGKmNvuyyj/+t
 tCKf7IHNkvSkVwHljoFlZ9N2L4sWKxCUk51bOjBi1oCkS34Y48c6dwXFWtRUj9cO3Nnw
 c/JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmexYXoS6a8CYsA3xWywSV8172L7PZdtHBdsYkjV3j9BKZiTQpbVRGTzTvlV1yfDigEaUZZc83lv4lIAszTPzyUe6ALV92fhDprbWzt2Y2F+gsnCN9SeMa
X-Gm-Message-State: AOJu0YyT6aTtCBqo4HWo4ZpKS/zXMFviLRHnQjh8K75PUPzvwf59MxSv
 GIO/mRz/V/eqdRLmUGFBdEAF4Bb05s6sXiMkRvF+NALCT4wb8k+pm8np5L9lH5w=
X-Google-Smtp-Source: AGHT+IFm8CFi29yR95ZJLmtNPItA91IHSPbKKy14cjzd8kPq+ryRNulw1lIA4wR1RkRJVc0q7PGSoQ==
X-Received: by 2002:a17:906:304e:b0:a49:56d4:d643 with SMTP id
 d14-20020a170906304e00b00a4956d4d643mr539291ejd.36.1711484664359; 
 Tue, 26 Mar 2024 13:24:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:42 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-12-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WaOdPxQDLRUP1i4wGsr9OiyCK6VXAW85SV74ALGfvjU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7VRj7R1J4HzEG/Gqt70vwCECGo9q1EyZWXt
 w1kKN5twZGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu1QAKCRDBN2bmhouD
 11sAEACIpsCGKurOsdyhjt6Sh3nUouIrbZZk0aR8BhRFTpdJTwryo1ef40TZZrvrMOMfwvapB5M
 ghzPBFB5vOzAV2o/BNkPJepUzhRojqMIvm+JOay+U272jYuPKfgP3BimNdADbVHy5gSo0JcFz1q
 bBJLmPf1Gwly+2vyygEz2L3Pe2+xIAgCJ4z0S6rv03z+wLXdQYKXd5KzrlCYMyb9GWFYFJM/wJ3
 t1QlO82WYHJ9RJjxlEHO6qI9+9UknzKa4BxAF3PQnX4wWwU9fSqZUUkryO4fJOcnZW/fvbi73S0
 8Jk9MApU5+XARrgatq504SjsVK00ZEcIYNEJK5Xsy8IY1zFUiW0uzeLs/E5hT7GmX82aAZHh3DV
 4CkyGRxfTEeYqbcSx7/y5mKrFiQMGnrlx3A1JWMcXP1muz3qF4iA5TdHC+Vl/sbNEUeXSlN9PAg
 2wNC09dWLimreHgexDrI92RYIlcoQbVLnDzE7g9slTwk3cqK5jr6g2oiuEakApm39rCVXymjmpC
 u9vui5Q7j7sx+Sql9cUAdkFNzz9QX0tV5jtQgMEN1YjrZ/2gJZ7AR+L/Z+92T0/CroN/L1TMQiP
 7K3Wm8uSpe85UYUvEws4GDRefaeLlj4txksJZM4wbeNW03VPat7Cknbv0NN2cRfsbBLyxvjLnPl
 y6NGCqzOagwzZ3w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 12/19] coresight: tpdm: drop owner assignment
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

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index a9708ab0d488..0726f8842552 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1310,7 +1310,6 @@ static struct amba_id tpdm_ids[] = {
 static struct amba_driver tpdm_driver = {
 	.drv = {
 		.name   = "coresight-tpdm",
-		.owner	= THIS_MODULE,
 		.suppress_bind_attrs = true,
 	},
 	.probe          = tpdm_probe,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
