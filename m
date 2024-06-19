Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C190EFBE
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 16:09:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B4BFC71288;
	Wed, 19 Jun 2024 14:09:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66D69C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 14:09:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3230488428;
 Wed, 19 Jun 2024 16:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718806172;
 bh=2tFlSH74W8+2RQdC7szAY3eA9dHEvz08hbHTqrK0XfE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=We5TTLnA2KguroNAn1p/cOOT8Ip6tdK4hpfzcourjB0PUyH5Fgt1SPPYqmJbqBqjH
 xGXIw10XqFrHbZUbSUUuv7LyrSZ05nE/zlYPV9MY4YeiWAjunddTuP+xqf04ftW+qR
 65IWkp3jHlIWMJbqrozS0WuaN6ghr4QakICIcjE8ouwm8vyU3DFDoEgYXSLzalrBpE
 KF+LkTJUBWYC94KASjOOutc5DFo3rxh8Gk/qgSauMai2SVVaIfaua9Xu25Zdi+37cw
 GofTAIEwLmX5W4DokVt+mawMYer9OImFVWZNl1gSEdQoH/f6DzTJD0Zo2osti/DYqo
 1906YPkNSM3+Q==
Message-ID: <d9a03fa6-5d35-4a18-9ae7-8dad98f65dc6@denx.de>
Date: Wed, 19 Jun 2024 15:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240619125815.358207-1-christophe.roullier@foss.st.com>
 <20240619125815.358207-2-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240619125815.358207-2-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] arm64: dts: st: add ethernet1 and
 ethernet2 support on stm32mp25
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

On 6/19/24 2:58 PM, Christophe Roullier wrote:
> Both instances ethernet based on GMAC SNPS IP on stm32mp25.
> GMAC IP version is SNPS 5.3
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>

I don't have an MP2 device, so I cannot provide much technical feedback. 
But from the DT standpoint, this looks OK, so

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
