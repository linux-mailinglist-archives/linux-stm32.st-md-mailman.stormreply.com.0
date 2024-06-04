Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7B8FB46C
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 15:51:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E95EC6B444;
	Tue,  4 Jun 2024 13:51:23 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32476C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 13:51:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BDB30CE1194;
 Tue,  4 Jun 2024 13:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B2CC4AF09;
 Tue,  4 Jun 2024 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717509072;
 bh=6xWYDutldmMdcEkucQUkKgPmzAOHM4lh+zj5TzXtvmc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a5cqBTk53wDuwp5jLOYMAT/95tu7fByNPys0vZYQCYJujVPoZwKQFBYy/MEJ/Eo43
 InXyWgz0rLSRLNAEdKNy3oJL4EgJ4EZrqTSJff4vd6tflzndv0TMXmlRM3a1GfrH2I
 DAA3ivw+YMIteKFMe7PuuLlmDBfgP4QiZLth5qXFyz3gXSfYg2y/84vfA11mr5L0zZ
 lzNG91CbWM7D3ExQ1mXyNifoS//VJR9qHTju/N60bZlcl8sbbBzXANIJioO3/x27e9
 eLfYOL9Bm2W8TneLUPHcFQ4/Kg3CYRjakLCdr2sc2OxPz3T12LUH7ywvcnutRls8DU
 rVVwzB5HZrDJA==
Date: Tue, 4 Jun 2024 06:51:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christophe ROULLIER <christophe.roullier@foss.st.com>
Message-ID: <20240604065110.462d01c0@kernel.org>
In-Reply-To: <c41e4379-d118-4182-8a7a-f6cf6c789be0@foss.st.com>
References: <20240603092757.71902-1-christophe.roullier@foss.st.com>
 <20240603092757.71902-9-christophe.roullier@foss.st.com>
 <e753d3fa-cdfd-426c-9e66-859a4897ec3b@denx.de>
 <c41e4379-d118-4182-8a7a-f6cf6c789be0@foss.st.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 08/11] ARM: dts: stm32: add ethernet1
 and ethernet2 support on stm32mp13
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

On Tue, 4 Jun 2024 11:29:11 +0200 Christophe ROULLIER wrote:
> I prefer to push documentation YAML + glue + DT together, it goes 
> together, further more patch 11, it is also link to MP13 Ethernet, so 
> need to be in this serie.

Unfortunately what maintainers prefer is more important.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
