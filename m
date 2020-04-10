Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 390651A441B
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2020 11:00:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C95AC36B0B;
	Fri, 10 Apr 2020 09:00:39 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E43BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 09:00:33 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 22so800229pfa.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fq3PsPG42pQs7vQPghfm68ekbP1cDmzNOWQtKbUdjrQ=;
 b=QMjlK+aEy3ZRYdQyeHZvfHtDOLYh66mg1FDXniVJ5I8ZsqEjJprYHdCzjlNZ9QDE3J
 tR7dEm7nLFvx7FTf/NFkPD4pfu2F+sXeEp1qtxQboYEJVuIeCg2/4J64WQOiUlsQMSQj
 8fDt3DcyPKqU/7hUtF3W4i2lUkZoZbp5ZLheOeKipujcHwM912Dudzf+HAjcvtC9snJy
 uI+ZWwu8D3odp1ukRAeKSc7ie4MuVETrcrgLD6GVw0GTCHSiN7sLYwlrMOCcSSQXcOr2
 QJEZJ8EcHJcg7Dpdcs7qjAgEPpHC2TF1WyJX9YmCO1fYQLksROeh9sBONjMbiZ6fNyhw
 Regg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fq3PsPG42pQs7vQPghfm68ekbP1cDmzNOWQtKbUdjrQ=;
 b=jousYWUrDAQBvG42fZbVgahg/I+svQaKCdKzfLG6ZYrgBgcQ4lH+J03M52GqaOj9jN
 j7KbesHx1qIWWIKJEaZdEIvHbYEKZNJvaDK8EstmHYX4/sKnc2jeiX5dVOEocRbxj1hJ
 uA6z9Vzn+hZ9z1NNeIAhH4u3e/IlwTmWCP1g4sz0nwwjf7+lhdyXlsPWTDn0/cE51uvy
 UcUNVhGmZDSJZANYbW2YGEZRJo4+36vSrruq3pPB0iD9jA3IlQMyk9SV+Vd3DujA0CMj
 YFxFzm5mYr3IisELP4BnhQo0eVExuWqLUvex5ZPenRyB6IeeqHoEzp7M4ITi/056OkQD
 PhJw==
X-Gm-Message-State: AGi0PuZPC0dz/snPt1XgrfCMpwq1lkQwiwRuCAOFBq/MIyQiPJX/XXLh
 ua6+bf3NOtun93FACB8jJNef
X-Google-Smtp-Source: APiQypIJxX0BPeeAlvhVQg0PScQbrudCvqWcwYXIPlMDUwnkVVzUy3//tbKQGuO3ttoalDzCOoH24Q==
X-Received: by 2002:a63:a34d:: with SMTP id v13mr3542486pgn.10.1586509231387; 
 Fri, 10 Apr 2020 02:00:31 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:999:4ceb:ac45:4d4a:5a11:afed])
 by smtp.gmail.com with ESMTPSA id k24sm1187859pfk.164.2020.04.10.02.00.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Apr 2020 02:00:30 -0700 (PDT)
Date: Fri, 10 Apr 2020 14:30:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200410090024.GB5723@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200406072728.GI2937@Mani-XPS-13-9360>
 <9c51236f-a543-99dc-ca4f-5113831451ea@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c51236f-a543-99dc-ca4f-5113831451ea@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 00/22] ARM: dts: stm32: Repair AV96
	board
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

Hi,

On Tue, Apr 07, 2020 at 05:32:31PM +0200, Marek Vasut wrote:
> On 4/6/20 9:27 AM, Manivannan Sadhasivam wrote:
> > Hi,
> 
> Hi,
> 
> > On Wed, Apr 01, 2020 at 03:22:15PM +0200, Marek Vasut wrote:
> >> The AV96 board device tree is completely broken and does not match the
> >> hardware. This series fixes it up.
> >>
> >> Marek Vasut (22):
> >>   ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
> >>   ARM: dts: stm32: Repair ethernet operation on AV96
> >>   ARM: dts: stm32: Add missing ethernet PHY reset on AV96
> >>   ARM: dts: stm32: Add missing ethernet PHY skews on AV96
> > 
> > Ethernet works fine with cold boot but after warm reboot it fails with below
> > message,
> > 
> > [   18.192842] stm32-dwmac 5800a000.ethernet eth0: no phy at addr -1
> > [   18.197539] stm32-dwmac 5800a000.ethernet eth0: stmmac_open: Cannot attach to PHY (err)
> 
> Try this patch:
> 

[   17.270826] stm32-dwmac 5800a000.ethernet eth0: no phy at addr -1
[   17.275519] stm32-dwmac 5800a000.ethernet eth0: stmmac_open: Cannot attach to PHY (err)

It doesn't work. Sorry, I don't have much time to dig into this issue so
I'll leave it up to you :)

Thanks,
Mani

> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> index 9fcc15b6e76d..3387d6353418 100644
> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> @@ -136,12 +136,14 @@ &ethernet0 {
>         phy-mode = "rgmii";
>         max-speed = <1000>;
>         phy-handle = <&phy0>;
> -       phy-reset-gpios = <&gpioz 2 GPIO_ACTIVE_LOW>;
> 
>         mdio0 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 compatible = "snps,dwmac-mdio";
> +               reset-gpios = <&gpioz 2 GPIO_ACTIVE_LOW>;
> +               reset-delay-us = <1000>;
> +
>                 phy0: ethernet-phy@7 {
>                         reg = <7>;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
