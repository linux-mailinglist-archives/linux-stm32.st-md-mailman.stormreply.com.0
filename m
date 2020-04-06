Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A54A019F042
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 08:10:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 489A7C36B0B;
	Mon,  6 Apr 2020 06:10:48 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 416D1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 06:10:46 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id z3so6001224pjr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Apr 2020 23:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1Zg4t84vPftQTf/y3Iv/U1NbyjZxzuCO/RKd2H7Y9d8=;
 b=M3aksN4tt0GoC0h3mAt+pYMJThnpjnApXLmXptxVARkQRkl/TwvsTMKvssyTvikjDO
 7Jxrk5JmHldI+0XydSw+xyGLsHkn7ptf7ORky6D3Yp+acC6/nmofP+Ujnp2EJjVZw/KV
 RZFUnJtyFjepwUSWBS/3qbGxgYr5M2E3wApA567JsKg+djGOCz+DVuEwEu0nitEgZ+v8
 Bq/OjEKdON0OUGtXigHzUe4IRUHegES+N8LsRaKaIvBYIXIW4g3X9dzxcOUkugGAhF5I
 ruVxF6vv16EGBRLJylJ+7wwPgkUwR68Ed9rVd0IXwClmVuznnf47ygt+Gf0jT8yrBwrR
 aWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1Zg4t84vPftQTf/y3Iv/U1NbyjZxzuCO/RKd2H7Y9d8=;
 b=hSwRgcTI5J0QmRuoPQducQRtLGQbUXm2v8prTrIYUqc14OBZUGnjAl3Dpf5hiZImm6
 keN1qFJIMUf0Hl3ka6X4JVHr+jHuT9S3CcbhthS/fNPiUSKcSHsMGOFdep4FvGqHLj1P
 I2xz7LjcxQA/cqY3CMEWaZbpvR6Y9+YZs7GIFwaK4DlHcxQy0yz1nX2Uenet682kJc+x
 eaydW94Kl+Dl3WmRCvtbbAxeJ5sET6v/RsnakqePNuxrjCoGoW0u6t5eKExlw5CZel/F
 NuCJCktJ1ipcuBqiXhr/hbnYZYANfeHzbUss6jyza6cWXz1K2UUlGO1vAVM6by19tV1C
 raiw==
X-Gm-Message-State: AGi0PubUh6RD09kzF7/hm3TjJtb9R97mz6bUFYk39KgQ+6nePm8yJkrU
 EX2IiYRPvw8MeQbUMaeElVBB
X-Google-Smtp-Source: APiQypKIF7ce0U/nBSU49NCSCIod9dmywDVGV6I5gJiGEZR/N2PDz/q+tRtLilOUYGCVqezA/cBBqA==
X-Received: by 2002:a17:90b:911:: with SMTP id
 bo17mr823822pjb.40.1586153444380; 
 Sun, 05 Apr 2020 23:10:44 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e80:687d:9124:eff9:55e8:1727])
 by smtp.gmail.com with ESMTPSA id s12sm10071497pgi.38.2020.04.05.23.10.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 23:10:43 -0700 (PDT)
Date: Mon, 6 Apr 2020 11:40:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200406061036.GB2937@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-4-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401132237.60880-4-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 03/22] ARM: dts: stm32: Add missing
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

On Wed, Apr 01, 2020 at 03:22:18PM +0200, Marek Vasut wrote:
> Add PHY reset GPIO on AV96 ethernet PHY.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: No change
> V3: Drop phy-reset-duration
> V4: Rebase on stm32-next
> ---
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index a66b86a456c9..a33fddd3e023 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -87,6 +87,7 @@ &ethernet0 {
>  	phy-mode = "rgmii";
>  	max-speed = <1000>;
>  	phy-handle = <&phy0>;
> +	phy-reset-gpios = <&gpioz 2 GPIO_ACTIVE_LOW>;
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
