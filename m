Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A033868F
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 08:31:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDA3DC5718B;
	Fri, 12 Mar 2021 07:31:42 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D38FC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 22:48:09 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id o10so14609467pgg.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 14:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yp/zf/TAjp/DgsBtmkn2h95rlPfAql88KAJ1HBTmgds=;
 b=NoCXrC5czDoRZm1zH+/fUkf7tRUM+vrKMCNN8yYX9+ErzwqAvcNRDDHpekm4PCTxQT
 Gk37toit2SR+kRTswPm0Q0UCsSmUHX9QIDpUiGhpCh5MJ4XlLExe6R4hHu9k6yhiu4vT
 tJLJd/IoOcghyIxbDbEefc/sMYc099vjXgfIqEwZ9fAOIHgTd5ozDw3sac8LJ672JoxA
 MnHj5mjWAoawDo4YhFASMYmZY0ibCaxMM/Oww6eTo9m3VnLWxbjrwc5Mv+33p06ZxoIG
 JR4BWVUgdT09ZgXC/gSyWgJGwFEHekoKnx/QzQWA3rxOqsj4x56Xug3oSM/kmGZviJO+
 9tqQ==
X-Gm-Message-State: AOAM532lrbWtl0WVQh5U8mviuouh/AHyJcHk47XY80OEB8/FVN3vjAVb
 PvXt+HD4zmY5XsQ9hkZs3G8=
X-Google-Smtp-Source: ABdhPJz8cvoO7cjx+Ydi2AzXzvDOKfJqCw7+rk33vFgwXIa9cNT/DNeCu3LAtFW6UsvUmJpd+zx4VQ==
X-Received: by 2002:a63:5c1e:: with SMTP id q30mr8763269pgb.259.1615502887491; 
 Thu, 11 Mar 2021 14:48:07 -0800 (PST)
Received: from localhost ([2601:647:5b00:1161:a4cc:eef9:fbc0:2781])
 by smtp.gmail.com with ESMTPSA id n10sm3227074pgk.91.2021.03.11.14.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 14:48:06 -0800 (PST)
Date: Thu, 11 Mar 2021 14:48:05 -0800
From: Moritz Fischer <mdf@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YEqeJSFnQJVV15P1@epycbox.lan>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152735.1318487-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311152735.1318487-1-krzysztof.kozlowski@canonical.com>
X-Mailman-Approved-At: Fri, 12 Mar 2021 07:31:41 +0000
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Tom Rix <trix@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
 Robert Richter <rric@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Borislav Petkov <bp@alien8.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 12/15] fpga: altera: use
 ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
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

Hi Krzysztof,

On Thu, Mar 11, 2021 at 04:27:35PM +0100, Krzysztof Kozlowski wrote:
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Moritz Fischer <mdf@kernel.org>
> ---
>  drivers/fpga/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index fd325e9c5ce6..b1026c6fb119 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -14,13 +14,13 @@ if FPGA
>  
>  config FPGA_MGR_SOCFPGA
>  	tristate "Altera SOCFPGA FPGA Manager"
> -	depends on ARCH_SOCFPGA || COMPILE_TEST
> +	depends on ARCH_INTEL_SOCFPGA || COMPILE_TEST
>  	help
>  	  FPGA manager driver support for Altera SOCFPGA.
>  
>  config FPGA_MGR_SOCFPGA_A10
>  	tristate "Altera SoCFPGA Arria10"
> -	depends on ARCH_SOCFPGA || COMPILE_TEST
> +	depends on ARCH_INTEL_SOCFPGA || COMPILE_TEST
>  	select REGMAP_MMIO
>  	help
>  	  FPGA manager driver support for Altera Arria10 SoCFPGA.
> @@ -99,7 +99,7 @@ config FPGA_BRIDGE
>  
>  config SOCFPGA_FPGA_BRIDGE
>  	tristate "Altera SoCFPGA FPGA Bridges"
> -	depends on ARCH_SOCFPGA && FPGA_BRIDGE
> +	depends on ARCH_INTEL_SOCFPGA && FPGA_BRIDGE
>  	help
>  	  Say Y to enable drivers for FPGA bridges for Altera SOCFPGA
>  	  devices.
> -- 
> 2.25.1
> 
Thanks,
Moritz
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
