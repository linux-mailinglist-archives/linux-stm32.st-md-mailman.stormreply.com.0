Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB69E4D2F
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 06:13:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 072F1C71292;
	Thu,  5 Dec 2024 05:13:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7BACC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 05:13:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E6F8C88EDD;
 Thu,  5 Dec 2024 06:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1733375588;
 bh=dWyo9Bu5l9XOsB4Q8M1dSJaLQtxfsxiyf7xxvykE+sk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SstSwugAf14DWGV0olpYo99gQMHuNa+3siS4StFcJh/xEgnrORDiQssMO2Li27VH3
 401H97eV0rRm0NbmB6ei5GhU/JrlUrBdG/6OCb+8Aeykufm/pJCiLP6rmXOKCOhjBf
 fuuE8RIqUFBGgJOcNyVQS/oaImdI8HeOPC8/PG2AM1jvK1EehTfMpmGy8Rfi9KHDB1
 fB18rdFu5bJaMxU7TA0XkCCrt4YUklofs56efQjO/8v1qfBuHoxzFycT/jI+Tk1COJ
 trpyNocUyirAsChlZITCNZw6jj/uONDppuWKyAyN9JQNOvl6We6A3A23w+RnQ6XOkn
 0dbwhMVeE69Vw==
Message-ID: <3c809cae-991b-4b13-8d8b-bd6cbcc9a9b9@denx.de>
Date: Thu, 5 Dec 2024 06:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mingwei Zheng <zmw12306@gmail.com>, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn,
 peng.fan@nxp.com, fabien.dessenne@foss.st.com
References: <20241205045942.2441430-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241205045942.2441430-1-zmw12306@gmail.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-gpio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: Add check for clk_enable()
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

On 12/5/24 5:59 AM, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error. Add a cleanup loop to disable clocks already enabled in case
> of an error during clock enabling for subsequent banks.
> 
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 5b7fa77c1184..eb7b2f864d88 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1738,10 +1738,16 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
>   {
>   	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
>   	struct stm32_pinctrl_group *g = pctl->groups;
> -	int i;
> +	int i, j, ret;
>   
> -	for (i = 0; i < pctl->nbanks; i++)
> -		clk_enable(pctl->banks[i].clk);
> +	for (i = 0; i < pctl->nbanks; i++) {
> +		ret = clk_enable(pctl->banks[i].clk);
> +		if (ret) {
> +			for (j = 0; j < i; j++)

Instead of this open-coded loop, can you please convert the driver to 
clk_bulk*() API and then do simple clk_bulk_enable()/clk_bulk_disable() 
here and everywhere ?

Thank you
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
