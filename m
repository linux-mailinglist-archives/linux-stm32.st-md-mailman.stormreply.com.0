Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134988CE51
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4598AC71288;
	Tue, 26 Mar 2024 20:24:33 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EDE6C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:31 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56899d9bf52so7619114a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484671; x=1712089471;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lXijxDwurJAwpy4OgwF7Dn1W0Fknvemik+ebgBgDuPM=;
 b=Px7d5jzlYAhIjNFkTWfZfM9pj9bUuaaAQo1RXyE0hHVzDULFMbrUsyZopXw9YV2DZ4
 PllJfApRlIgWVgIwvr/S+L6k07Wash5y0M7Fp9pMBBZyr+J1LIl+XWqgz4ufdDRG+neD
 uLVfdXVFGqnyadgEA9dGyxaT/ze2+chaD+dtJghbKEcrcrst0OpKNFjbpviFl8a5VvbC
 aa/e75OpsrI+UjuWuQOdEFr4d/MVazLoqJQzX/71K4I/5nk4hpnfH1mvkCLrHJ+KcqJI
 hW45eUbyQ+rwUFUCBb5apaM9SNBvOTsl9uZC+AAmZq94Qh0JDP6HdDgNXTv4lAj6Kz1o
 xxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484671; x=1712089471;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lXijxDwurJAwpy4OgwF7Dn1W0Fknvemik+ebgBgDuPM=;
 b=pb6oWAgoXeoCziN6++aptrKTlH1+pSuMTUIM25ltqsiDe7ZcDnKzcJwKAhSQoCOw2O
 yiIJ4x/BE9qR4X7SNolRvPBZcu45R6XGph1V6FW6mIWPD4iZzpmslKWU6bqANolC5ukQ
 E5INJ1ApV2lHPfY1+dRUKXWHTftu+TwLYN5AS138l5NLfafwQH5WzjePoBRjYKsRq1Nt
 W4N5fsQf++fakWaqK+yqiENFYfpqLeaIOPE5IJp04kHxDv8sz2R1196aFaSI0Z3XqrHN
 ZfcyyGgXaUOfV6Dz8TDQOMYiqJOSyIvlUF+YlfFMF28tNp63jjaxbbcBiR3Y3AS51JS/
 BE2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSc4ZtQNTs+L7kOIZ1ibHE6bYqZjnc1W87Dr+U2gtkdAaGWLTWLu/NygeI4jeGJP90fZmj8+bpdsLwEe8xbgl8hyYaikNUQ6JKuZdyGNs34DzWPOWCw85g
X-Gm-Message-State: AOJu0YywpMSDInWmsQB+2pzLiDoLceazRUOmQyC/MpnqsjDcDB75JXJs
 cEeP0eihWiCDIlcE3o3i/BjtC4ZpY9zGLj5Tuu0jCiw4OkpwGsC/MlCmfpCYcQs=
X-Google-Smtp-Source: AGHT+IH+MF6HMAlumoucfJgmT6Y1hg8bse6cOZfY4xpBVKLtIAbnvV6kQmywSZQ7rPfpLYzfDM9UIg==
X-Received: by 2002:a17:906:dac9:b0:a4d:ffda:be73 with SMTP id
 xi9-20020a170906dac900b00a4dffdabe73mr355431ejb.28.1711484670790; 
 Tue, 26 Mar 2024 13:24:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:45 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-15-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=691;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kLMu95DaVyD3knCLGVkowZHpAylz58hzFrQ+URJH4DU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7YBe/M9Df6IUB55QNaFLqs4yC0bdwkUCg/5
 Jk7IlEkDvKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu2AAKCRDBN2bmhouD
 1wviD/459VuBb+pLzNupwEbp8Ij//1Y+Vs9Tou4sQQWi31pSfU/O68/wT5/dcaul7V2krx74O3I
 QXA9TAp2MScshnl7KPtr/+DqaB8/YCwTeJsUXCUrpw3rMldXYrN20WqH4OKsqMUV7Xbuf/PnQNO
 eoiPiRMsugqaTklPZrKxb/QMSgWs7G8gxZSWBNJoZxDS3/UicggJ+xxCKea4lenCf6Uk2jAQJVm
 11k7+/l1DjwA7p+LlX/wcc0GGclkinVoB0VCwg6kJe0aOxmo75YSXswBXARpIKS+4HQhjOw9ioM
 D1BzZMGN0yEx47DqH4MWncC/nO2W7s0gQArwR2UrKvEequzAgg80RCn2K0ErfAdWoAYeBi/I2+2
 M6elzx3MxUCPVyfmzk5Sr8f5ttLWw5FG6HfMXhJssTakm64iA+Ww9cWDiqXfwr3LbYMSEP68ku7
 Gr0bhl89HYqS0neDfUUDVgrkZbWEUffQLTc9xNv5OBE7ru9kBD35W2MxILrUx3ZWziAj7nawXuD
 5kkkpSN5Iyf27d2RKscMZdvLbu4k3CyNMiSE5oNpUYVnMB2mRl/Yzyed0mCmtHoKeRQPVvo6byA
 kjWxRB9EthpBvPLZB88ZgaWDaNWQDCGRzn2/gloP/oPmf55XX2Q6cDxOKp9E7jiu9R73vNmV7og
 gcdz3VNwvGxMJ0w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 15/19] hwrng: nomadik: drop owner assignment
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

Depends on first amba patch.
---
 drivers/char/hw_random/nomadik-rng.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/hw_random/nomadik-rng.c b/drivers/char/hw_random/nomadik-rng.c
index a2009fc4ad3c..f2a2aa7a531c 100644
--- a/drivers/char/hw_random/nomadik-rng.c
+++ b/drivers/char/hw_random/nomadik-rng.c
@@ -78,7 +78,6 @@ MODULE_DEVICE_TABLE(amba, nmk_rng_ids);
 
 static struct amba_driver nmk_rng_driver = {
 	.drv = {
-		.owner = THIS_MODULE,
 		.name = "rng",
 		},
 	.probe = nmk_rng_probe,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
