Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD7288CE57
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67A0EC71289;
	Tue, 26 Mar 2024 20:24:37 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27024C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:37 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so722701266b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484676; x=1712089476;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wwMQZ0nF23w//xAHnzD/oAWHiNTRM8AzxRIOUkQer54=;
 b=vZ9WAxARtc4uUwje/EbRSu040C4aUY5oKFznV4EdjtykN/vSzC9y6hn28ZGyWWehOI
 7QFavDn6L8ITgClrDb8dRcm58q46UFdw9Goc40uALvH39e7CEE/4JdNNvwl8dmW6br4o
 PqUXDtknGvzlKhW7aeE4YY8XRDKN9Ca5DhP0ippYvWVzqfcFzgXtxxFAIGrPS7EXBFtO
 TJ3zjrrg+uhKbkpTqUuebHN2oRE9LmDjLC/y9S4N38sl50BLp382ez+C8DnvZ+7LKrXQ
 q5ZfL2sPn0q/FxcbB+0iuKlbY6XDUgfkBrDzPtA0zeoIwSGfm1t16mbL3c74t3RZjF3Y
 NK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484676; x=1712089476;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wwMQZ0nF23w//xAHnzD/oAWHiNTRM8AzxRIOUkQer54=;
 b=iQmzktUzZaZLImvwvbyzdWKaTulI99r7ixICAbcc1UYWpgwMLu5D05GdTt12cnAnp/
 P2cf83gFJ5NtbXSHevdk+fWDh0dhAovZGiqrEKAGk4O0/1thDXyii/LOgIPC18qTSWKu
 NOgh9ij35hh1bTNnImhbwQhH35pC5LWhd0zNJ4uN/Ls9aIh60sjxHfAP8xzWZoZggQ1i
 qmhZfX0yUAYIxFYJtVCob0pXDmnXEQipzDVZvNn9241PU/PR+/clbHLCyfp3YKJijUpV
 uqvlnXGJWWAhXC1DxDrnz9jrasFXPrq3y8OMSz/1PuV9bGhZEaH5C0YBa84lw2REjBXD
 KcMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/DRazMh+E5qLwOm0MgwS9MiW9XaS/wQPezjZGkC3lrzWOoVpLb/Fc/KMuA30o+7GmLMDl7m39EtNlO9pp+MSqWN7qnZWxqwUdXzW9TNR/bFd5+NYKdTbN
X-Gm-Message-State: AOJu0YxuQ4j25hsGRdPCbXv3dIsyTjqHuzAv15wqYcghngzMBUUzlpvw
 Btt49nV7LMgpQLrOO8Wuo3IMwi7T+eIVL35Hc2CDBwI06bXfP2Y/iM4+FRvIsv0=
X-Google-Smtp-Source: AGHT+IFS7eYAhT+0AUpcj5ewpNo7OFKsTCoZ3JxCFeHwDILA0YZF9b4V+IaNGjXTAqigOEH5hMb4FA==
X-Received: by 2002:a17:907:a42:b0:a47:7795:db82 with SMTP id
 be2-20020a1709070a4200b00a477795db82mr7398894ejc.34.1711484676683; 
 Tue, 26 Mar 2024 13:24:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:48 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-18-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=711;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=INljxUCSw+yVREcFpthVyGE5rYMeWITztmBOHKglJhs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7bfvePYsjxBuLD9vY3zAenH82u7tT/SAlQL
 Z3EnQYXLHCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu2wAKCRDBN2bmhouD
 11byD/wPpXiOrbOF/vSfkJBrTVrF0LZH7r75M7Vz/+aPxzvKY8FKsSOw2SmV92MkLf4QuOdFOdd
 IMhZX1fpOObZ/FD21xlOjv+QFmb7DExusNcalkxdRxZKYEpCCvzYR0byulPTkfd/PDoCr4R5RF3
 bWRSvd16bNGp3ourlRN+o1Cki1isMO2ab6YQUCXal2ZYM3uWqp8uFBEAtGq0i4KErceJYGTDk0K
 yU+bGCWdUCDmVBIXQktl1gdxTJJeIshTNLGc0VbYhdQ5/144yeDXYpj9JxZj+kEd0MhBSgeyL+y
 qnx8vkit6hx7qw7DwYQbpqqsjvf89L401ck2ZHokDx5WQF/O6gUuXqJj1lkj95RKuAUY9iMAgEK
 wpayvepNRgr3xnMEhn8g8/BQllMQBHmg04Men8h09jhg5TSmEJzO6lkQpzd4wAIpwYWe4pGd22q
 QUnRxrhNWRj/GsSaPG5T8QJsROjVv+a/6Qt+0+KRsJCWt/uMricJD+r6L/VL2THandxryixg5yg
 qRL2e3R3i8BvYEj+k76Goc5dxAzDMCylHnG0Ksya2oTV74WPS8ZCSvY1wLAhBD/F0pL6M0MRWTg
 hAo/aTuE/uXOEvWCV88JCz9nnTmGnOYhJmVG2P0xSnLg2K7iNg0jYh1qiVA2Scb5rSklBBc3z7Q
 6WZIljKIBnSxNMg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 18/19] memory: pl353-smc: drop owner assignment
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

As memory controllers maintainer: this has my Ack. :)

Depends on first amba patch.
---
 drivers/memory/pl353-smc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index 48540817e046..56e51737c81f 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -154,7 +154,6 @@ MODULE_DEVICE_TABLE(amba, pl353_ids);
 
 static struct amba_driver pl353_smc_driver = {
 	.drv = {
-		.owner = THIS_MODULE,
 		.name = "pl353-smc",
 		.pm = &pl353_smc_dev_pm_ops,
 	},

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
