Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494678470C
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF5A5C6C82C;
	Tue, 22 Aug 2023 16:25:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AE27C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 20:22:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37AKLmkd026494;
 Thu, 10 Aug 2023 15:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1691698908;
 bh=j1aDevVbccNYpcdFHjgIPkEX2CjbS6rxvkxWOg9hKF8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=A7QpFeL43WW9ooMRiJiYV5cmKnUZM+60d4yzCSW/TCgVPiK4yZr8A5FA9hga4tVur
 xD8BJQMLBj9Zv64thcpM1LLqPVWKf1LBN+mCAwwStG+cj1pQriLs1rF2yUdk7Ld0t3
 +bqNBQtDkDYPy0FP12pRf9EBT1lKv3NgWv+Sasqk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37AKLm13028698
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Aug 2023 15:21:48 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Aug 2023 15:21:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Aug 2023 15:21:47 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37AKLlLx018218;
 Thu, 10 Aug 2023 15:21:47 -0500
Date: Thu, 10 Aug 2023 15:21:47 -0500
From: Nishanth Menon <nm@ti.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Message-ID: <20230810202147.lh5m66t5ttfhsqr4@gloomily>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230719-mcrc-upstream-v2-5-4152b987e4c2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719-mcrc-upstream-v2-5-4152b987e4c2@ti.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 5/6] arm64: dts: ti: k3-am62: Add dt
 node, cbass_main ranges for MCRC64
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
> Add the address space for MCRC64 to the ranges property of the
> cbass_main node and add dt node for MCRC64 engine
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---

Please mark device tree changes in the same series (if you are posting) as
"DONOTMERGE" to help driver maintainers understand that the dts come in
via SoC tree (most maintainers do not need this, but it keeps things
sane and adjust your expectation that this will hit the next window from
where the driver gets in).

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
