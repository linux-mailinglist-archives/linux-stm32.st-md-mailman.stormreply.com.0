Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E3198B20
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 06:21:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E97CAC36B0B;
	Tue, 31 Mar 2020 04:21:36 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BBF1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 04:21:35 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u68so9724862pfb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=k3B7w4bhrBAg+tJ7Oq6jA/zTQXLHWO2Kq0NSUIUVhf0=;
 b=tE8Z7RKWxIuJUwJIOS8v8w5J4WKnYNbmyAz9bROWGrmJnH4AtP86Dxd/+0+XZcMvi+
 x/Y5Y8GqmBJOa4MIqgFgMVVuBgv3nzr9qtHaMmaS8yzsT/yI6p3VkdPHo04d/pi1TTlM
 iWsNsK+qTbD1FRkTsKD7rBRHeLTEmXJppL/o4Dzb+a6CZchoTGOpdLmAuIHgW1LKBpQ4
 zLRt3StzZelb4ZkG4uEUQP25tr0WYzirtTR38ZZkeyAfmngUr3u2o8jj0BHPbUG2ZfTv
 mtkbhQo4GILm4Tr6C6ihTZ2WemMFuuxPjEL5o7LdpnBEN8VSSi1mZC0eSh3Y3hE46mnS
 Ashg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k3B7w4bhrBAg+tJ7Oq6jA/zTQXLHWO2Kq0NSUIUVhf0=;
 b=GmPbn7QzmGrj3BivOsj1dg68phZSvxFpsWAur0hzaunw1qF6JoTfgtI93Hb4Qs9QFQ
 uwVo1QsYDg1653jIEhq+d8jFYUPkZjboa7yrDOFGAlIRwShtUEaccoHjDvDXf84JFnbG
 bi/86sGqYutk4gNHLVxHWRnMeiReYQJAHni1OV68BiLuyqE7ENTGA5611TzRd+Ga1YRd
 GXRhyJLs+85vD31CebKYZGB8fbFO7+d22jH6hP49qBkpUolY/177VDB24zVvpchDuCRi
 Xe+AOBfqa4LqZqFoanc/2RFtbZGbz1s5P6PvODdIVEE0ut8vLFG92inGiwDWIGdaV0h0
 /Ajg==
X-Gm-Message-State: ANhLgQ1TV9KSzf7u+XcYtndYyjulDwqviCm3At180FFfETwIiQHebfGt
 pkoBBFdwFIiSG/JuTemDWXwT
X-Google-Smtp-Source: ADFU+vtU9x44XpdUroKCGOJR1vy+xJYJxOUsjha4D4WRir4U/dqBzhIrbBCjioOpBYKZR18MedqZ7Q==
X-Received: by 2002:aa7:8bdc:: with SMTP id s28mr17095510pfd.110.1585628493675; 
 Mon, 30 Mar 2020 21:21:33 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id v20sm10007971pgo.34.2020.03.30.21.21.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 21:21:33 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:51:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331042127.GE14274@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331005701.283998-4-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331005701.283998-4-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 03/22] ARM: dts: stm32: Add missing
 ethernet PHY reset on AV96
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

On Tue, Mar 31, 2020 at 02:56:42AM +0200, Marek Vasut wrote:
> Add PHY reset GPIO on AV96 ethernet PHY.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: No change
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index 1d15b745feeb..a568d3824cb0 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -87,6 +87,8 @@ &ethernet0 {
>  	phy-mode = "rgmii";
>  	max-speed = <1000>;
>  	phy-handle = <&phy0>;
> +	phy-reset-gpios = <&gpioz 2 GPIO_ACTIVE_LOW>;
> +	phy-reset-duration = <100>;

I don't think "phy-reset-duration" property is used by the ethernet controller
driver.

Other than this,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

>  
>  	mdio0 {
>  		#address-cells = <1>;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
