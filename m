Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBADA50BCED
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 18:26:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8186CC6049A;
	Fri, 22 Apr 2022 16:26:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1906FC6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 16:26:34 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0279383D4B;
 Fri, 22 Apr 2022 18:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650644793;
 bh=DEvATQUcmAUvQtZt+xl0HhiXkCZH3A3i2rSRnjRahGM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=jKUSyRNQXt+3uKyhT+4qpG0zhfDqsIKb0MBe+7dwBIJclr3+0t+w6Ln8rjXZrzxCD
 xsSvW7US62e0SpaA9TMWJPC/safVtElF5FYHE31gz3JgklEPwIW9KFUtR2QQQ0ozQN
 agRKE947CU4MdHKxst1LEtQIiMauosoyl//jME5tgChBF4S59bKxydkKbWQ1hCTNQI
 JTdmBiIdnsHz97Xy8ptppSto0l0m1qwnBrJGkJR11U8+PG0tFYrjduXU8kNVhEy1nD
 XwbQTh5F+jyvWjb+fXvvK5mPi9WgegzMnHLZthTR+AxdlgVquuEcHBvVzeomwheuCb
 ASx+DqSWM6ORw==
Message-ID: <c48500cd-50be-1d70-2f2c-02c2dcede1eb@denx.de>
Date: Fri, 22 Apr 2022 18:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220422143608.226580-1-fabien.dessenne@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220422143608.226580-1-fabien.dessenne@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: improve bank clocks
	management
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

On 4/22/22 16:36, Fabien Dessenne wrote:
> Instead of enabling/disabling the clock at each IO configuration update,
> just keep the clock enabled from the probe.
> This makes things simpler and more efficient (e.g. the time required to
> toggle an output IO is drastically decreased) without significantly
> increasing the power consumption.

[...]

>   static struct irq_domain *stm32_pctrl_get_irq_domain(struct device_node *np)
> @@ -1575,6 +1537,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   			ret = stm32_gpiolib_register_bank(pctl, child);
>   			if (ret) {
>   				of_node_put(child);
> +
> +				for (i = 0; i < pctl->nbanks; i++)
> +					clk_disable_unprepare(pctl->banks[i].clk);
> +

There are clk_bulk_*() functions, maybe you can use those to get rid of 
these loops ?

The rest looks good to me.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
