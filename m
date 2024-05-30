Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BB98D4B88
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 14:25:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF090C7128F;
	Thu, 30 May 2024 12:25:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6002BC7128D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 12:25:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOxKT034113;
 Thu, 30 May 2024 07:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717071899;
 bh=FVIbjwAsFaFZWRgoPUKirsf6tpEDW8Ks1o2FW9abcxk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=T6lYpbTHhfW37wdva6/ZNm+iELEtlXKazO0PL+QnZaYRdnwqd66ABmn8Xf5X5p9fB
 0D7veZmaMrjPgYdUIk2IFWDxENnqYk00SFtrEABjmxPkse2HG3DgDOcqUqhyXYK+HO
 sGVCX5URyMqX2Igbn9swZwFbRFuIXCenNI8WVYQQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UCOxoJ094935
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 07:24:59 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 07:24:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 07:24:58 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOvkU115006;
 Thu, 30 May 2024 07:24:58 -0500
From: <kamlesh@ti.com>
To: <herbert@gondor.apana.org.au>, <kristo@kernel.org>, <will@kernel.org>
Date: Thu, 30 May 2024 17:54:28 +0530
Message-ID: <20240524-mcrc64-upstream-v3-6-24b94d8e8578@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Kamlesh Gurudasani <kamlesh@ti.com>, akpm@linux-foundation.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Subject: [Linux-stm32] [PATCH v3 6/6 DONOTMERGE] arm64: defconfig: enable TI
	MCRC64 module
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

From: Kamlesh Gurudasani <kamlesh@ti.com>

J722S and all AM62** devices include MCRC64 engine for crc64 calculation.
Enable module to be built for them.

Also enable algif_hash module, which is needed to access MCRC64 module
from userspace.

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2c30d617e180..aaeee392df10 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1630,6 +1630,7 @@ CONFIG_CRYPTO_TEST=m
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
@@ -1653,6 +1654,7 @@ CONFIG_CRYPTO_DEV_HISI_ZIP=m
 CONFIG_CRYPTO_DEV_HISI_HPRE=m
 CONFIG_CRYPTO_DEV_HISI_TRNG=m
 CONFIG_CRYPTO_DEV_SA2UL=m
+CONFIG_CRYPTO_DEV_TI_MCRC64=m
 CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y

-- 
2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
