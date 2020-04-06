Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F419F0BC
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 09:27:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE941C36B0B;
	Mon,  6 Apr 2020 07:27:38 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5396EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 07:27:37 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t4so5558406plq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Apr 2020 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tO5+FH6asKDJ62tqVe4ousdxNeX5ekZ+eF6mjYohlI0=;
 b=G0+p4C3RxyPFSpWJYOG6PrthAMiPhKC2bPWxF/wIWYGy52krDBkTRzvXhGkQQniG+F
 BBwVuxTShwD30hqnI2Bytjb8IZhQCSfr8T3Rqr+o+oPAdgh51wykn/SJkoLIx+uKJBbg
 a34eJdOAK/FX/0MUHWVksJrIWH6lDZoeQ8kLVpUkxkKux8d0aW6XLzcHlXRoNbx8NIeR
 tW9cWrDqw/qlT735jIVamOVCBxU7IqJAT3T5OMZqnNWHGvMb3tsoDEj2e1qF/lNOQy2w
 R4N+ds83Bu0D+GR+WyckurW+QZ32CcTicC9ql0lG0ydynCE7kMntTY59mPVaPLiTzBgc
 b88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tO5+FH6asKDJ62tqVe4ousdxNeX5ekZ+eF6mjYohlI0=;
 b=bTCVIDHvC2XCwCljCufpdLriMyQtTsMZRgzzHvQ2MQShiCIatYh7djosiDYNTa/ICi
 vlbDS9a9mpd3S7JaNR1y+hpTTimMVReFl6OrPNyh0VATYCumGrhz8pOef5maQV+5wwZq
 g4UPJuw4lFw6VwUdYh9QWIN0R+e+FupmZkKcsvcNI/xY1JVVQxWP6Im9KrRUnOOO01XD
 u8YE7avQECzdNdcqlMsykVwEdz97Vs/wuQXTlsLrTCn6rjf1tF4Ft+XBq1roaTPEOAu7
 1OVxeE6PzCmpNpzCVhYT/Fwp2c/6zudrPUR1qWJBS9DNCPWD+PDxJiAuWmme7SbRsgxF
 /9hA==
X-Gm-Message-State: AGi0PubVxo7ExNXv73aPHarpNTmy1jXoQhHaQrogu7oKo5tpBwu120Ws
 FbDrXAxZZl0xtFWZOX+QCE6h
X-Google-Smtp-Source: APiQypIVme/rFuSK72P45JBkET5vhhi2LUUdhRi+2z3KShtvx2W3bJvszSaZ8YF9ZOE8rc5OunQxgw==
X-Received: by 2002:a17:902:9892:: with SMTP id
 s18mr19610218plp.321.1586158055744; 
 Mon, 06 Apr 2020 00:27:35 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e80:687d:9124:eff9:55e8:1727])
 by smtp.gmail.com with ESMTPSA id e7sm10980871pfm.3.2020.04.06.00.27.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 00:27:34 -0700 (PDT)
Date: Mon, 6 Apr 2020 12:57:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200406072728.GI2937@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401132237.60880-1-marex@denx.de>
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

On Wed, Apr 01, 2020 at 03:22:15PM +0200, Marek Vasut wrote:
> The AV96 board device tree is completely broken and does not match the
> hardware. This series fixes it up.
> 
> Marek Vasut (22):
>   ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
>   ARM: dts: stm32: Repair ethernet operation on AV96
>   ARM: dts: stm32: Add missing ethernet PHY reset on AV96
>   ARM: dts: stm32: Add missing ethernet PHY skews on AV96

Ethernet works fine with cold boot but after warm reboot it fails with below
message,

[   18.192842] stm32-dwmac 5800a000.ethernet eth0: no phy at addr -1
[   18.197539] stm32-dwmac 5800a000.ethernet eth0: stmmac_open: Cannot attach to PHY (err)

Thanks,
Mani

>   ARM: dts: stm32: Add alternate pinmux for SDMMC1 direction pins
>   ARM: dts: stm32: Repair SDMMC1 operation on AV96
>   ARM: dts: stm32: Repair PMIC configuration on AV96
>   ARM: dts: stm32: Repair PMIC interrupt on AV96
>   ARM: dts: stm32: Add alternate pinmux for SDMMC2 pins 4-7
>   ARM: dts: stm32: Add eMMC attached to SDMMC2 on AV96
>   ARM: dts: stm32: Add QSPI NOR on AV96
>   ARM: dts: stm32: Add configuration EEPROM on AV96
>   ARM: dts: stm32: Add alternate pinmux for SDMMC3 pins
>   ARM: dts: stm32: Enable WiFi on AV96
>   ARM: dts: stm32: Add alternate pinmux for USART2 pins
>   ARM: dts: stm32: Enable Bluetooth on AV96
>   ARM: dts: stm32: Add alternate pinmux for LTDC pins
>   ARM: dts: stm32: Add bindings for HDMI video on AV96
>   ARM: dts: stm32: Add alternate pinmux for SAI2 pins
>   ARM: dts: stm32: Add bindings for audio on AV96
>   ARM: dts: stm32: Add bindings for USB on AV96
>   ARM: dts: stm32: Rename LEDs to match silkscreen on AV96
> 
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi    | 280 +++++++++++++++++
>  arch/arm/boot/dts/stm32mp157a-avenger96.dts | 324 ++++++++++++++++++--
>  2 files changed, 571 insertions(+), 33 deletions(-)
> 
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
