Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8449E7FFA
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Dec 2024 13:59:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 802D4C7802B;
	Sat,  7 Dec 2024 12:59:08 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8065C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Dec 2024 12:59:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1C90F89182;
 Sat,  7 Dec 2024 13:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1733576340;
 bh=ecF4TE66khefvBf5h2UrJt6LgwhU3O5F2VlOQKZYwRE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YrZoYS3EpSJcl+nxxUQImZJ3aUI06M2S+KIz6rT5LfZuCxXtlPe4HmZOOjfGRs5/F
 eaBMNZkkBL9QI8MaCaJt3ofy6f+tvf37U/1eYOttO9HeCTkqixeeJz6IvndCuEo70c
 p/YN7l+KA3thWROzL+kbRgMeAiWZO8koqmKKH1YW7TDp2mntcGxyvz8VNCMooV3fCp
 5VBSJW0LNxGqdp/jJ85e6p387N5+fhFy4bzEW9rZmH0ymaxWE49y48WYqoTvyTVS+1
 GDCuF7TemhSdDeOu+FoLsfXRVn3VlL1xEAlxUmHy6Qh0QOZ32bP6TywNBbi8lSwjnc
 OeFwsC12+NQGw==
Message-ID: <9830993d-943b-4079-b31d-7c77ee83d306@denx.de>
Date: Sat, 7 Dec 2024 12:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mingwei Zheng <zmw12306@gmail.com>
References: <20241206214315.3385033-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241206214315.3385033-1-zmw12306@gmail.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: peng.fan@nxp.com, make24@iscas.ac.cn, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] pinctrl: stm32: Add check for
	clk_enable()
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

On 12/6/24 10:43 PM, Mingwei Zheng wrote:

[...]

> @@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		if (ret) {
>   			fwnode_handle_put(child);
>   
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> +			clk_bulk_disable(pctl->nbanks, pctl->clks);
> +			clk_bulk_unprepare(pctl->nbanks, pctl->clks);

Use clk_bulk_disable_unprepare()

include/linux/clk.h:static inline void clk_bulk_disable_unprepare(int 
num_clks,

It looks pretty good otherwise, thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
