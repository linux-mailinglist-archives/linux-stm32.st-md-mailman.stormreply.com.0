Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8CA8FAB6A
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 08:53:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CC8FC6B460;
	Tue,  4 Jun 2024 06:53:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61BD4C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 06:53:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3CBE788428;
 Tue,  4 Jun 2024 08:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717484016;
 bh=z8LELpLRxNFVqAyf1ACDj5F4E+vB1ToGwte/0yWmT9Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R8TTouyD7xrGY6pYqt0QGch0CdwlTVTgJL9PgEZzaaqbKp00nL6BzWtst44+cU/5B
 OgGw+GFeLcmg8x1v7GQG9BcsTgOAQ1VhkrHYngFLB3L0/i622mftzOb3sUKYEaFb3B
 E9PRg+7SoBAKA4Blg2bQVDx6JRTVBZ8KcoDO+/Bgp08PPQSAi2VKgQrLZCnfWJtcj+
 ulVLG+2LAF1aUZujbH4oWAqYJPgHyulEJhHNWMpyUbUsayekfjJZCXD6Xy6TdHrPLI
 zz0/shIZ5iPb0F4xgCg4/UlT8VAmYxF8HtnWKmA+G73aR3DBoCXMuXIYhkyuk5xk6Y
 SlBDyrPzVzqzQ==
Message-ID: <6c0ba026-55f5-4b9a-8cfa-864c289940a5@denx.de>
Date: Tue, 4 Jun 2024 08:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
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
 <20240603092757.71902-8-christophe.roullier@foss.st.com>
 <d5ce5037-7b77-42bc-8551-2165b7ed668f@prevas.dk>
 <a992ecc9-bbb7-41af-9a0a-ff63a55d1652@denx.de>
 <9bbcd934-1d47-4e98-9e02-9ed18242bf1e@prevas.dk>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <9bbcd934-1d47-4e98-9e02-9ed18242bf1e@prevas.dk>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 07/11] net: ethernet: stmmac: add
 management of stm32mp13 for stm32
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

On 6/3/24 4:38 PM, Rasmus Villemoes wrote:
> On 03/06/2024 15.01, Marek Vasut wrote:
>> On 6/3/24 1:30 PM, Rasmus Villemoes wrote:
> 
>>> Also, please include a base-id in the cover letter so one knows what it
>>> applies to.
>>
>> Just out of curiosity, I know one can generate cover letter from branch
>> description with git branch --edit-description and git format-patch
>> --cover-from-description= , but is there something to automatically fill
>> in the merge base (I assume that's what you want) ?
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information
> 
> Seems to have been in git since v2.9 (2016ish).

Nice, thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
