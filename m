Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A876849211
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Feb 2024 01:44:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1681BC6B476;
	Mon,  5 Feb 2024 00:44:16 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11EF9C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Feb 2024 00:44:13 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-50eac018059so4532555e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Feb 2024 16:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707093853; x=1707698653;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8pRLyNXA1Vc52Lsv+SyI/OT6snOptfaP6otyX8bc0Yg=;
 b=F7oH28ehiGBVZPnc2c8XdtlfIXtprkkl9AooUG8OI9T/EgquMCxfu395aYJgiBKXyN
 RnFgigUAM66DgnZ73bKfuw4hQ6441W7sYcfmfnxCa9CryS8WDlAT5Z/Qz7kL1CUvwIES
 bfgWChnQTCdTycukE1WoXsKTsgLKZFHm4fZ5HrppzoHQ5R4Wm9wyMuvtnu+d+OoVBK+l
 mlfZBG3eHrziccMqqiFzjQ/nwCwl6HIa/91BpzC2N+wymkwtESeuuG/Z0PqLrr5zw1Kn
 66rVxbsbyihnCzN830Tgi4NQ81GrmopgF3e9FAM7/eICG+wUmgn0EOPgpCPb2KBSOlQL
 KNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707093853; x=1707698653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pRLyNXA1Vc52Lsv+SyI/OT6snOptfaP6otyX8bc0Yg=;
 b=h7TUlnlAcAxm4SC3S20dK4lW/qU6C5ppUGooyJ5X8kI7m2i9XRh6PWEnf87gF75Ltc
 0J2gyZ/52pOUvuu1X/wFPl7B5LHcl04IsZy/7dwA5Ae0c3ds/wwmEX1Df5zTSA0CEfZf
 bD9LX1LwROROcT6wPnKkeljfcvsiKbeSdeAMBGG8RSGlpF0x66x5/QsP/HIBUQ1Eit2K
 FijSarxB5F+MPlUqAEEaXxFqfl0ZvdyA4WzfI9W4cbIYSZPPvjpQgHB7LFgu+gzVvjDu
 6D2OiPjOl+0QaF0k731gTx2FP1tupMdTcCNIzvw/VFLIiEvY1AxS3VjVj/u2rbv/RB86
 4T9Q==
X-Gm-Message-State: AOJu0YzwG5pjW0FdzA2tc96HwRSa7m+XqH0ZqGqq9KaLH343CAjaSs0F
 dczpfB25naTSuzdYAmwnWe3+6+izCYokXeSsD5KUGPMsXFdmiOrM
X-Google-Smtp-Source: AGHT+IEFvRNEOvL4TW43JBOrJ42lWSMt0EtFuLCI7i2L2aDTBb6BqadOD2oDwoUbchIwtj4xKHaTtA==
X-Received: by 2002:a19:7415:0:b0:50e:cd02:b53d with SMTP id
 v21-20020a197415000000b0050ecd02b53dmr4698829lfe.15.1707093852945; 
 Sun, 04 Feb 2024 16:44:12 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXtEWkAkHkm+tUMqIYOWc5ZHxjzdMxzIraTcDNQSS1b1z8fIWYxqFaAE2AMCZUw3GIhLPTmypIs4SGmA1JSmC6+cW8KF3II/ISMxwx43/15Z7qShRtowsW1TAMyL1PxvX357kC4gLy+8C9qrrrjHO4BMjrLjxODgxzYgkHLeZWIcOQpbdxPis9HMqWDg43V3JNUlD5G4yEo9XaAgn6WRBIGw3s44gzgzJyHs05W8/gaRxArhumHNdWGbrAOjtEVaOZxyaz3Epo8jcd46vHC2K3dk49L47E1kDJAEe5jSFt2DTQ+yqowkicHPDf8RumNywuaNTfuc1lTbiUuUAZaG5Z159TKaUrfA4siRSE4SEo1EkUTFZVwjEX1K/mKS9h5qwhUQNNaU4SijUXJWfVAlBkzEsLCrfA=
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 g16-20020ac25390000000b0051149482328sm500715lfh.26.2024.02.04.16.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 16:44:12 -0800 (PST)
Date: Mon, 5 Feb 2024 03:44:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <uzzzxx3mv6yoslijhhzdzyossvcvi52jgbulza54uqh2wrm5kd@ddd5o56b2dhu>
References: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
 <20240202-stmmac-axi-config-v2-3-64eab2bab17b@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202-stmmac-axi-config-v2-3-64eab2bab17b@nvidia.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Configure
 AXI on Tegra234 MGBE
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

On Fri, Feb 02, 2024 at 12:53:35PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Allow the device to use bursts and increase the maximum number of
> outstanding requests to improve performance. Measurements show an
> increase in throughput of around 5x on a 1 Gbps link.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> index bab57d1675df..b6bfa48f279d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> @@ -199,6 +199,12 @@ static void mgbe_uphy_lane_bringup_serdes_down(struct net_device *ndev, void *mg
>  	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
>  }
>  
> +static const struct stmmac_axi tegra234_mgbe_axi = {
> +	.axi_wr_osr_lmt = 63,
> +	.axi_rd_osr_lmt = 63,
> +	.axi_blen = { 256, },
> +};
> +
>  static int tegra_mgbe_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat;
> @@ -284,6 +290,9 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto disable_clks;
>  
> +	/* setup default AXI configuration */
> +	res.axi = &tegra234_mgbe_axi;
> +
>  	plat = devm_stmmac_probe_config_dt(pdev, &res);
>  	if (IS_ERR(plat)) {
>  		err = PTR_ERR(plat);

The entire series can be converted to just a few lines of change:

 	plat = devm_stmmac_probe_config_dt(pdev, res.mac);
 	if (IS_ERR(plat)) {
 		err = PTR_ERR(plat);
 		goto disable_clks;
 	}
+
+	if (IS_ERR_OR_NULL(plat->axi)) {
+		plat->axi = devm_kzalloc(&pdev->dev, sizeof(*axi), GFP_KERNEL);
+		if (!plat->axi) {
+			ret = -ENOMEM;
+			goto disable_clks;
+		}
+	} /* else memset plat->axi with zeros if you wish */
+
+	plat->axi->axi_wr_osr_lmt = 63;
+	plat->axi->axi_rd_osr_lmt = 63;
+	plat->axi->axi_blen[0] = 256;
 
 	plat->has_xgmac = 1;
 	plat->flags |= STMMAC_FLAG_TSO_EN;
 	plat->pmt = 1;

Please don't overcomplicate the already overcomplicated driver with a
functionality which can be reached by the default one. In this case
the easiest way is to let the generic code work and then
override/replace/fix/etc the retrieved values. Thus there won't be
need in adding the redundant functionality and keep the generic
DT-platform code a bit simpler to read.

-Serge(y)

> 
> -- 
> 2.43.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
