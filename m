Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7401795CE5D
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 15:49:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16474C71289;
	Fri, 23 Aug 2024 13:49:12 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02140C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 13:49:04 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5334e41c30bso2129127e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 06:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724420944; x=1725025744;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j0rAa/Diw1/WxbqtV5SQj80lVWGH9itqJcEAREaEyNk=;
 b=lbFo7umjUtb8FXEuiaPwfUW9J8FmjfUrowu+LOJwSTFX0be45r7hpXoNTnli3irEX3
 by5V38+e9K6rBSsbxZsEfqqUysC4p5/PbjgVRd6UQHVLR61lFWThqH8s+g5hDkUFFDYj
 j6gww9wwXVh9RByJo9qtkI+2pw7oT48wSMwW5CcQ+l1r8/CMxhdt+HGbg9syX6fAKhdZ
 yewK73aAl/wAlvrfbBQeeiUo/qXmqnhJ8L1rin78ZePeHc6wO2vaIoQ8xQiUhFxfvPfj
 f5rMYUQOc0eAHEXsrX1vUi0UB836umsNoMB7gPTiCmh8Mf1gbW7GiyWhiTDnH2hCyZwa
 6G8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724420944; x=1725025744;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j0rAa/Diw1/WxbqtV5SQj80lVWGH9itqJcEAREaEyNk=;
 b=jFNkSPz7qhBVtU8BtAuflmjtvzn38FN62PIma6y/YsYtdpIs53qjaxA8MnY43hlg/8
 /I9JfnIssG+4beRcL+IP1maVLfRkLwT5gOXOPGmDxMT7HBibgNl1tQecIj5Vx54uxNrc
 LI+IX7PHsQZBOdtjeXcI8gsQpYaRkgqI0SJkWXtJuhVYAXNZ7ZbEJKMCd6ryD6G9hPGc
 Mfii/aoWBYHhUtfuR40f6BlMYLAFhjnntEDwrKGJHfhypDF9ab8CRueEmOhcDqRFK/bj
 co/65n5KXA0vlE8GlXyanujj2szSG6uqZg3DFhVOp29+E7XmHeIKdDPdPd+jG7oGFUQM
 j2wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/uifqnIrwBeFV1bDbGfbj2/78ugyd3D0bptvpYrg2Kv91e8iOqwnmehR3mhfulQ944DEWpBgpiigwiw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyufohZkiGiHrbAFIKNm94R6MaHrsxzlzyjTIFryJdVPUXkD8ZC
 njuG4ANwxWMYrqSYJcetEl+KIeFwIF6MwGJMZ/+SPnBXNS+pDOf/
X-Google-Smtp-Source: AGHT+IGm6RnZflH6pQQEhkfwEn48Hiaxow66a2JnEtfny/y8K7ryKkohPurdHVQhp41PUetWoXRf4A==
X-Received: by 2002:a05:6512:39c5:b0:533:46cc:a736 with SMTP id
 2adb3069b0e04-534387be65emr1558356e87.37.1724420943446; 
 Fri, 23 Aug 2024 06:49:03 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea36c0esm544064e87.98.2024.08.23.06.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 06:49:03 -0700 (PDT)
Date: Fri, 23 Aug 2024 16:48:59 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <vxpwwstbvbruaafcatq5zyi257hf25x5levct3y7s7ympcsqvh@b6wmfkd4cxfy>
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
 <20240814221818.2612484-4-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814221818.2612484-4-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, linux@armlinux.org.uk,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v4 3/5] net: stmmac: Integrate dw25gmac
 into stmmac hwif handling
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

Hi Jitendra

On Wed, Aug 14, 2024 at 03:18:16PM -0700, jitendra.vegiraju@broadcom.com wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> Integrate dw25gmac support into stmmac hardware interface handling.
> Added a new entry to the stmmac_hw table in hwif.c.
> Define new macros DW25GMAC_CORE_4_00 and DW25GMAC_ID to identify 25GMAC
> device.
> Since BCM8958x is an early adaptor device, the synopsis_id reported in HW
> is 0x32 and device_id is DWXGMAC_ID. Provide override support by defining
> synopsys_dev_id member in struct stmmac_priv so that driver specific setup
> functions can override the hardware reported values.
> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h |  2 ++
>  drivers/net/ethernet/stmicro/stmmac/hwif.c   | 25 ++++++++++++++++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h |  1 +
>  3 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 684489156dce..46edbe73a124 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -38,9 +38,11 @@
>  #define DWXGMAC_CORE_2_10	0x21
>  #define DWXGMAC_CORE_2_20	0x22
>  #define DWXLGMAC_CORE_2_00	0x20
> +#define DW25GMAC_CORE_4_00	0x40
>  
>  /* Device ID */
>  #define DWXGMAC_ID		0x76
> +#define DW25GMAC_ID		0x55
>  #define DWXLGMAC_ID		0x27
>  
>  #define STMMAC_CHAN0	0	/* Always supported and default for all chips */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 29367105df54..97e5594ddcda 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -278,6 +278,27 @@ static const struct stmmac_hwif_entry {
>  		.est = &dwmac510_est_ops,
>  		.setup = dwxlgmac2_setup,
>  		.quirks = stmmac_dwxlgmac_quirks,

> +	}, {
> +		.gmac = false,
> +		.gmac4 = false,
> +		.xgmac = true,
> +		.min_id = DW25GMAC_CORE_4_00,
> +		.dev_id = DW25GMAC_ID,
> +		.regs = {
> +			.ptp_off = PTP_XGMAC_OFFSET,
> +			.mmc_off = MMC_XGMAC_OFFSET,
> +			.est_off = EST_XGMAC_OFFSET,
> +		},
> +		.desc = &dwxgmac210_desc_ops,
> +		.dma = &dw25gmac400_dma_ops,
> +		.mac = &dwxgmac210_ops,
> +		.hwtimestamp = &stmmac_ptp,
> +		.mode = NULL,
> +		.tc = &dwmac510_tc_ops,
> +		.mmc = &dwxgmac_mmc_ops,
> +		.est = &dwmac510_est_ops,
> +		.setup = dwxgmac2_setup,
> +		.quirks = NULL,
>  	},

This can be replaced with just:

+	}, {
+		.gmac = false,
+		.gmac4 = false,
+		.xgmac = true,
+		.min_id = DW25GMAC_CORE_4_00,
+		.dev_id = DWXGMAC_ID, /* Early DW 25GMAC IP-core had XGMAC ID */
+		.regs = {
+			.ptp_off = PTP_XGMAC_OFFSET,
+			.mmc_off = MMC_XGMAC_OFFSET,
+			.est_off = EST_XGMAC_OFFSET,
+		},
+		.desc = &dwxgmac210_desc_ops,
+		.dma = &dw25gmac400_dma_ops,
+		.mac = &dwxgmac210_ops,
+		.hwtimestamp = &stmmac_ptp,
+		.mode = NULL,
+		.tc = &dwmac510_tc_ops,
+		.mmc = &dwxgmac_mmc_ops,
+		.est = &dwmac510_est_ops,
+		.setup = dw25gmac_setup,
+		.quirks = NULL,
	}

and you won't need to pre-define the setup() method in the
glue driver. Instead you can define a new dw25xgmac_setup() method in
the dwxgmac2_core.c as it's done for the DW XGMAC/LXGMAC IP-cores.

Note if your device is capable to work with up to 10Gbps speed, then
just set the plat_stmmacenet_data::max_speed field to SPEED_10000.
Alternatively if you really need to specify the exact MAC
capabilities, then you can implement what Russell suggested here
sometime ago:
https://lore.kernel.org/netdev/Zf3ifH%2FCjyHtmXE3@shell.armlinux.org.uk/

If you also have a DW 25GMAC-based device with 0x55 device ID, then
just add another stmmac_hw[] array entry.

>  };
>  
> @@ -304,7 +325,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
>  
>  	/* Save ID for later use */
>  	priv->synopsys_id = id;
> -
> +	priv->synopsys_dev_id = dev_id;
>  	/* Lets assume some safe values first */
>  	priv->ptpaddr = priv->ioaddr +
>  		(needs_gmac4 ? PTP_GMAC4_OFFSET : PTP_GMAC3_X_OFFSET);
> @@ -339,7 +360,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
>  		/* Use synopsys_id var because some setups can override this */
>  		if (priv->synopsys_id < entry->min_id)
>  			continue;
> -		if (needs_xgmac && (dev_id ^ entry->dev_id))
> +		if (needs_xgmac && (priv->synopsys_dev_id ^ entry->dev_id))
>  			continue;
>  
>  		/* Only use generic HW helpers if needed */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index b23b920eedb1..9784bbaf9a51 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -282,6 +282,7 @@ struct stmmac_priv {
>  	struct stmmac_counters mmc;
>  	int hw_cap_support;
>  	int synopsys_id;

> +	int synopsys_dev_id;

With the suggestion above implemented you won't need this.

-Serge(y)

>  	u32 msg_enable;
>  	int wolopts;
>  	int wol_irq;
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
