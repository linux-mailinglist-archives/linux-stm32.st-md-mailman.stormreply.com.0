Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F98478470E
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8EAAC6C82F;
	Tue, 22 Aug 2023 16:25:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8205C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 20:25:19 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37AKP4hU027029;
 Thu, 10 Aug 2023 15:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1691699104;
 bh=LlM4ebmHJM3OSNZTcjpf5OxbeJgDHb88khhaM1SpUmk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=W7rrHvPZ6yLGXjVOAjztdXjjgJIPcYxSE7MuWdtGiJ7LM+Aqty4PiPEpDUupWSPUv
 hoX3fkShO6po+Kics77kcBhOEKqtovu5KmlNnY9/FRAiWWi/QhoR1AE2xtW1hLkrub
 4Jh9LeLoKF9Tq4WmJkwop8k5BRl/hEv/lACkcjoI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37AKP4I4012077
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Aug 2023 15:25:04 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Aug 2023 15:25:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Aug 2023 15:25:04 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37AKP4HT021038;
 Thu, 10 Aug 2023 15:25:04 -0500
Date: Thu, 10 Aug 2023 15:25:04 -0500
From: Nishanth Menon <nm@ti.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Message-ID: <20230810202504.ujmjaqos5tfqlmna@plentiful>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230719-mcrc-upstream-v2-6-4152b987e4c2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719-mcrc-upstream-v2-6-4152b987e4c2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:58 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [Linux-stm32] [PATCH v2 6/6] arm64: defconfig: enable TI MCRC64
	module
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

On 00:58-20230811, Kamlesh Gurudasani wrote:
> K3 devices include MCRC64 engine for crc64 calculation.
> Enable module to be built for K3 devices.
> 
> Also enable algif_hash module, which is needed to access MCRC64 module
> from userspace.
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---

There are few things to improve in this series, but we can discuss this
as part of defconfig merge

See thread: https://lore.kernel.org/linux-arm-kernel/ae2ad056-96de-41b7-8df4-1d9c0f5c469b@app.fastmail.com/
for additional info.

K3 devices is too broad, you want to specify specific boards that will
benefit out of this.

I suggest to keep this as "DONOTMERGE" to indicate this should'nt go via
subsystem maintainer tree (most maintainers are  aware of it, but
explicitly calling it out helps keep things sane)


>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index bf13d5c46578..4d555a125315 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1535,6 +1535,7 @@ CONFIG_CRYPTO_TEST=m
>  CONFIG_CRYPTO_ECHAINIV=y
>  CONFIG_CRYPTO_MICHAEL_MIC=m
>  CONFIG_CRYPTO_ANSI_CPRNG=y
> +CONFIG_CRYPTO_USER_API_HASH=m
>  CONFIG_CRYPTO_USER_API_RNG=m
>  CONFIG_CRYPTO_CHACHA20_NEON=m
>  CONFIG_CRYPTO_GHASH_ARM64_CE=y
> @@ -1558,6 +1559,7 @@ CONFIG_CRYPTO_DEV_HISI_ZIP=m
>  CONFIG_CRYPTO_DEV_HISI_HPRE=m
>  CONFIG_CRYPTO_DEV_HISI_TRNG=m
>  CONFIG_CRYPTO_DEV_SA2UL=m
> +CONFIG_CRYPTO_DEV_TI_MCRC64=m
>  CONFIG_DMA_RESTRICTED_POOL=y
>  CONFIG_CMA_SIZE_MBYTES=32
>  CONFIG_PRINTK_TIME=y
> 
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
