Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 414CF476D1A
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 10:13:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 050F4C5E2C5;
	Thu, 16 Dec 2021 09:13:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E753BC5E2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 09:13:29 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CE52981184;
 Thu, 16 Dec 2021 10:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1639646009;
 bh=dICm1q4PWYye78j3bTjDPHLcvcI6iZNmCbGLRnoLBGI=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=qincm+ciIW5GL38TqrKgtHeLGDv6xlSWqOjbkvZviXLgi/dJ4iTcaNzvrC7A5mqnD
 deLxZeqGFZOI/arnRK3JbI4F/wQETJfeJMTkYwvYM/fUYdJOdrWG1SUPYQ+Xfs7cj4
 S0zAErG2PhgFO/h05MjWZA9BDe4X0Ie/1xNmYNjytpWNWbsvBDfTevAM6YDXEWSkIh
 Yk0KcMuM3mMHuC07Q5szz5lCdkgWkGzQbzt6EKw3Z+RpLBmaNqB20U/qXSOxJd4jv1
 dsJm/eyrr8BpV8oXhYvqwWFXJxUFJuGq92ThekbNaZrEkcH+bT3C9h4coviinqwG1V
 0txiIUDgORTxQ==
Message-ID: <05ab7b52-190e-048f-3803-7bed51e2b09c@denx.de>
Date: Thu, 16 Dec 2021 10:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20211215141727.4901-1-yann.gautier@foss.st.com>
 <20211215141727.4901-4-yann.gautier@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20211215141727.4901-4-yann.gautier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, u.kleine-koenig@pengutronix.de,
 Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [Linux-stm32] [PATCH 3/4] mmc: mmci: stm32: clear DLYB_CR after
 sending tuning command
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

On 12/15/21 15:17, Yann Gautier wrote:
> During test campaign, and especially after several unbind/bind sequences,
> it has been seen that the SD-card on SDMMC1 thread could freeze.
> The freeze always appear on a CMD23 following a CMD19.
> Checking SDMMC internal registers shows that the tuning command (CMD19)
> has failed.
> The freeze is then due to the delay block involved in the tuning sequence.
> To correct this, clear the delay block register DLYB_CR register after
> the tuning commands.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
>   drivers/mmc/host/mmci_stm32_sdmmc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index fdaa11f92fe6..a75d3dd34d18 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -441,6 +441,8 @@ static int sdmmc_dlyb_phase_tuning(struct mmci_host *host, u32 opcode)
>   		return -EINVAL;
>   	}
>   
> +	writel_relaxed(0, dlyb->base + DLYB_CR);
> +
>   	phase = end_of_len - max_len / 2;
>   	sdmmc_dlyb_set_cfgr(dlyb, dlyb->unit, phase, false);

Shouldn't this have a Fixes: tag and be CC stable ?
This seems like a bugfix, no ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
