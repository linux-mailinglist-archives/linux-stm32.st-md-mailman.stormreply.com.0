Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE83687E46F
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Mar 2024 08:54:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48CD8C71287;
	Mon, 18 Mar 2024 07:54:23 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9DCFC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 23:26:18 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a466a27d30aso479601566b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 16:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710717978; x=1711322778;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7+6mkHILiQfAFfw53RlDGTHQc/Jh7baPT9IsykWK7bc=;
 b=deQvEZddVhZ+112OSRbHEFfr2rvlGLk+Ax70MKt7aD+RFVsuNxh3NvfQJQc5TSvoht
 GUI5Dfmg2jH1yovPVjXic5onVD3Uc2ZgI7AO326IXI9hyPSR4U6Iio9UvxagCK1Rrr5Z
 CsmwvMQXN46BWPb3piZ668gBcM6kndVc5uY9vaHr7c6DeYiA7i2ZmVySOl0G03ZcXyXz
 yCYaboHpjzquxz1q7QCpiM4Is1J1lhNVEOM54My4yphUah1riSkKtrOesVjczYbkKQlZ
 MXbvWbhZ5/JagJydz2N+zWrSovpFelu6Zqa1dvrT/bZ5xSiR7EbG1YfjijHkljkGxIVJ
 +pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710717978; x=1711322778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+6mkHILiQfAFfw53RlDGTHQc/Jh7baPT9IsykWK7bc=;
 b=jjM3ee8tAJf18wN4mQPYasvcCXUeg+/xNzIWFqp8M5W4c+mCJRoM2Z2kmyOXpYGIli
 WKUAtmKKz44Fz274oaxqlp+qXOJwB0ssG2LjiJ+6F96eFja/879o4RCaRa2mgfEtyNHH
 wRFqTEDn7fSGgup/G3ojyR79MtuIrjbRPs1bNj+3Y9h2BXYvIhJNUkXwv+z3AN2KhmOT
 ifhOj7/+iZ9eWSx37zWNcKbKrdjH9V9yfF8e5dJV+Ls42/fvn1PATemYDc9Dzf7ZgXr6
 +CqH+D9AxAhO8lrj0aldhGy4C9xTaGaM8oodcYksY5Ob+ZIxvKxqNsgeaInOUKIMIQdc
 41Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhSV+6bLHyVEri2iElZoP35vUPLeR1GPj1SlBDukveW9pHm70phVFNxh0Q0m91Fr5M+d+J0S7t+DYf/ZxEbFAFz9Vdm1zYAJgj0LCs9uWj69hnDVGiL5up
X-Gm-Message-State: AOJu0YxserDuAeD05cjjkKIm3zm3TDxBe+YyimTvGRwW65pmBmqXo4xj
 UD/Q6TvQ/JyLmLSF4pFmrwN0GbibzflpFYN6Gp65yZku/SWUF439
X-Google-Smtp-Source: AGHT+IHyDJ6+V3tdElVtInMQ550m0MOes+J8YEpEEg6j7ceeQZvmwyhF5Zm0A4bO+BPTsaryLFJ/Jw==
X-Received: by 2002:a17:906:ecb2:b0:a46:b028:7dd2 with SMTP id
 qh18-20020a170906ecb200b00a46b0287dd2mr1869705ejb.48.1710717978225; 
 Sun, 17 Mar 2024 16:26:18 -0700 (PDT)
Received: from bhlegrsu.conti.de ([2a02:908:2525:6ea0::f845])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a1709060dd400b00a46a3e4ef11sm2123968eji.92.2024.03.17.16.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 16:26:17 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
X-Google-Original-From: Wadim Mueller <wadim.mueller@continental.com>
Date: Mon, 18 Mar 2024 00:26:15 +0100
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240317232615.GB22886@bhlegrsu.conti.de>
References: <20240315222754.22366-1-wafgo01@gmail.com>
 <20240315222754.22366-3-wafgo01@gmail.com>
 <2316e61d-ad7d-46fb-9f55-67964552855a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2316e61d-ad7d-46fb-9f55-67964552855a@linaro.org>
X-Mailman-Approved-At: Mon, 18 Mar 2024 07:54:20 +0000
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Wadim Mueller <wafgo01@gmail.com>,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-clk@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 2/3] net: stmmac: Add NXP S32 SoC family
	support
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

On Sun, Mar 17, 2024 at 03:53:19PM +0100, Krzysztof Kozlowski wrote:
> On 15/03/2024 23:27, Wadim Mueller wrote:
> > Add support for NXP S32 SoC family's GMAC to the stmmac network driver. This driver implementation is based on the patchset originally contributed by Chester Lin [1], which itself draws heavily from NXP's downstream implementation [2]. The patchset was never merged.
> > 
> > The S32G2/3 SoCs feature multiple Ethernet interfaces (PFE0, PFE1, PFE2, and GMAC) which can be routed through a SerDes Subsystem, supporting various interfaces such as SGMII and RGMII. However, the current Glue Code lacks support for SerDes routing and pinctrl handling, relying solely on correct settings in U-Boot. Clock settings for this SoC are managed by the ATF Firmware.
> 
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.
> 
> Read how commit msg should be wrapped.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> > 
> > Changes made compared to [1]:
> > 
> >     Rebased onto Linux 6.8-rc7
> >     Consolidated into a single commit
> >     Minor adjustments in naming and usage of dev_err()/dev_info()
> > 
> > Test Environment:
> > The driver has been successfully tested on the official S32G-VNP-RDB3 Reference Design Board from NXP, utilizing an S32G3 SoC. The firmware and U-Boot used were from the BSP39 Release. The official BSP39 Ubuntu 22.04 Release was successfully booted. A network stress test using iperf [3] was also executed without issues.
> > 
> > [1] https://patchwork.kernel.org/project/netdevbpf/patch/20221031101052.14956-6-clin@suse.com/#25068228
> > [2] https://github.com/nxp-auto-linux/linux/blob/release/bsp39.0-5.15.129-rt/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
> > [3] https://linux.die.net/man/1/iperf
> > [4] https://github.com/nxp-auto-linux/u-boot
> > [5] https://github.com/nxp-auto-linux/arm-trusted-firmware
> > 
> > Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> 
> That's totally unrelated to DTS. Do not mix independent work in one
> patchset. This targets net-next, not SoC, so please send it as separate
> patchset when net-next reopens, so after merge window.
>

Let me try to explain why I was thinking that both should be part of the
same patchset. 

The DTS file patch [1/3] is refering to a NIC for which there is no
upstream driver (or lets call it better glue code for the real driver) available. 

This patch here is supposed to add support for this driver. So without this part the DT
node named "gmac0" of [1/3] is not of much use. Thats why I was thinking they
should be part of one patchset.

But your statement also totally makes sense to me.

Thanks for the feedback!

> >  drivers/net/ethernet/stmicro/stmmac/common.h  |   3 +
> >  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 313 ++++++++++++++++++
> >  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   9 +
> >  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |   3 +
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h    |   5 +
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c |   7 +
> >  include/linux/stmmac.h                        |   9 +
> >  9 files changed, 362 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > index 85dcda51df05..1cdf2da0251c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -142,6 +142,18 @@ config DWMAC_ROCKCHIP
> >  	  This selects the Rockchip RK3288 SoC glue layer support for
> >  	  the stmmac device drive
> 
> 
> ...
> 
> > +
> > +	plat_dat->safety_feat_cfg->tsoee = 1;
> > +	plat_dat->safety_feat_cfg->mrxpee = 1;
> > +	plat_dat->safety_feat_cfg->mestee = 1;
> > +	plat_dat->safety_feat_cfg->mrxee = 1;
> > +	plat_dat->safety_feat_cfg->mtxee = 1;
> > +	plat_dat->safety_feat_cfg->epsi = 1;
> > +	plat_dat->safety_feat_cfg->edpp = 1;
> > +	plat_dat->safety_feat_cfg->prtyen = 1;
> > +	plat_dat->safety_feat_cfg->tmouten = 1;
> > +
> > +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> > +	if (ret)
> > +		goto err_gmac_exit;
> > +
> > +	return 0;
> > +
> > +err_gmac_exit:
> > +	s32_gmac_exit(pdev, plat_dat->bsp_priv);
> > +	return ret;
> > +}
> > +
> > +static const struct of_device_id s32_dwmac_match[] = {
> > +	{ .compatible = "nxp,s32-dwmac" },
> 
> 
> Missing bindings.
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.
> 
> > +	{}
> > +};
> 
> 
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
