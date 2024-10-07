Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467B992E53
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 16:08:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D91BBC6DD94;
	Mon,  7 Oct 2024 14:08:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6B10C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 14:08:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9E59788CEA;
 Mon,  7 Oct 2024 16:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728310116;
 bh=vQdGIKHRyzU9Q7dYLvDcZB3dYRUP1mo2poi+xhjUMpM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iKafxCqT9JhqZEyW4zfSeS9snXdsUCDWX61pe3Ua5BmCPeaBUSu44WXHz3Mp6Ut0N
 p6GMyZ3CbBeGILW2bTLXp8yd2Ws1d02/+QPQ9Q+oAeaLTIZHuNKzN1QFHMY6PU1EHG
 446dsLrGukHnDjLIhVwvEgRBho3s00PC8JGHB4ssPHAkS/MbG4aSUxH4BZykRBKJ9i
 HCGUPgkbmd19vVQTAO/sbuoWRokDk1j1m0CxcDZAT5zufJpQ1Hzd9GAII7SGl0x3B5
 6r6G12dSMYK3NqJ+QzmN3oRJxa/prvxjYNfSQrNHbtu0pSNGsctHN6VtT0C52RoJ2O
 6KdibxfTnx8Ng==
Message-ID: <41fb71cf-7ae8-47b8-bd0e-fc24da9d0bd3@denx.de>
Date: Mon, 7 Oct 2024 15:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
 <20241007132721.168428-4-gatien.chevallier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241007132721.168428-4-gatien.chevallier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] hwrng: stm32 - update STM32MP15 RNG
 max clock frequency
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/7/24 3:27 PM, Gatien Chevallier wrote:
> RNG max clock frequency can be updated to 48MHz for stm32mp1x
> platforms according to the latest specifications.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Does this also apply to MP13 ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
