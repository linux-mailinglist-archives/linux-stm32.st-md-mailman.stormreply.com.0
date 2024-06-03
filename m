Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C8C8D84FE
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 16:30:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E78FCC7128F;
	Mon,  3 Jun 2024 14:30:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 969A9C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 14:30:09 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 22234882EF;
 Mon,  3 Jun 2024 16:30:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717425009;
 bh=SfqsBTN3MtJf9fvXPp4/6/xuI3PMILN+3xSeSA4Cei4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IyVcxsq+9lZG5RBF3xAWjE/kj1VnNaYETJnaQiVRIJnjT1A02Fzz9O1IivX2ORKZa
 sQZ6WrChIsT1BmvyyBsJHKFaj9kjcM4F1W4Xwm9KZ3sve/nvsUQOEKeUKUHuvFu71o
 7atXrfHkATgEPxXQlLYVPW8FGXAZBOarUZ9GHuvp5XKh84bhycEgJoZ9+DFlqTjHGR
 cYBe8IX5dETTrSUklIVoalCPYR/2PBkd6j0t35Ev3qCOydst78xISHQA4TpO7BhVT4
 MKghslcyFkCJ5g1Pr3BB3ABga4u29i56ObCJlSLTXXehD8FlZqtSSiQcwh9tVd8b0s
 0eoHhFY7qS92w==
Message-ID: <e753d3fa-cdfd-426c-9e66-859a4897ec3b@denx.de>
Date: Mon, 3 Jun 2024 15:03:22 +0200
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
References: <20240603092757.71902-1-christophe.roullier@foss.st.com>
 <20240603092757.71902-9-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240603092757.71902-9-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 6/3/24 11:27 AM, Christophe Roullier wrote:
> Both instances ethernet based on GMAC SNPS IP on stm32mp13.
> GMAC IP version is SNPS 4.20.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>

I think it would be best to split off the DT patches into separate 
series so they can go through Alexandre and have the netdev patches go 
through netdev . In the next round, please send 01..07 as separate 
series and 08..10 as another one , and I suspect 11 as a separate patch.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
