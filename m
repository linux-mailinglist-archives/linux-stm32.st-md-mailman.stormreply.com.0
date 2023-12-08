Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0903880A9E3
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 17:59:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0534C6B475;
	Fri,  8 Dec 2023 16:59:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40247C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 16:59:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 83653B82E8B;
 Fri,  8 Dec 2023 16:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC84DC433C8;
 Fri,  8 Dec 2023 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702054742;
 bh=h0JkAKzYF1eCC3VCUFet/wUloQePgRqJtpyUOwrwHs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VV9pLQrduCHZxqG1gp2gsdESd89zqUJ8T/ztaw9WJVw7s21G8m8muHVlDot3+Gf40
 65myTt3MriTs13uBBjQtrCxREZctMcuNBTs7qnGtm24UGeLP0ZZIHk1cDe2BqhGoG5
 6n9im+9fMvwh7N5TggcZFvP6o6io3PyaZcgCS1iYmLOW+edW4FBFuzCKI3FXRVqssq
 gBwKneVYebD7Q/ruS5A6bejC3WL/NZroDaT74VKIptNNKVPIXywOlsdC0uq209XkCP
 And+nEwHTfPBhvawAtMy7NfdJGgiRcPQgMJR+qF0p4bLHgxxd7/yjMuh2w1hz5BSiS
 rFmD07v7UUqtw==
Date: Fri, 8 Dec 2023 16:58:55 +0000
From: Simon Horman <horms@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20231208165855.GA8459@kernel.org>
References: <20231204101113.276368-1-raphael.gallais-pou@foss.st.com>
 <20231204101113.276368-4-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204101113.276368-4-raphael.gallais-pou@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/4] drm/stm: dsi: expose DSI PHY
	internal clock
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

On Mon, Dec 04, 2023 at 11:11:12AM +0100, Raphael Gallais-Pou wrote:

...

> @@ -514,18 +675,40 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>  		dsi->lane_max_kbps *= 2;
>  	}
>  
> -	dw_mipi_dsi_stm_plat_data.base = dsi->base;
> -	dw_mipi_dsi_stm_plat_data.priv_data = dsi;
> +	dsi->pdata = *pdata;
> +	dsi->pdata.base = dsi->base;
> +	dsi->pdata.priv_data = dsi;
> +
> +	dsi->pdata.max_data_lanes = 2;
> +	dsi->pdata.phy_ops = &dw_mipi_dsi_stm_phy_ops;
>  
>  	platform_set_drvdata(pdev, dsi);
>  
> -	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
> +	dsi->dsi = dw_mipi_dsi_probe(pdev, &dsi->pdata);
>  	if (IS_ERR(dsi->dsi)) {
>  		ret = PTR_ERR(dsi->dsi);
>  		dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
>  		goto err_dsi_probe;
>  	}
>  
> +	/*
> +	 * We need to wait for the generic bridge to probe before enabling and
> +	 * register the internal pixel clock.
> +	 */
> +	ret = clk_prepare_enable(dsi->pclk);
> +	if (ret) {
> +		DRM_ERROR("%s: Failed to enable peripheral clk\n", __func__);
> +		goto err_dsi_probe;
> +	}
> +
> +	ret = dw_mipi_dsi_clk_register(dsi, dev);
> +	if (ret) {
> +		DRM_ERROR("Failed to register DSI pixel clock: %d\n", ret);

Hi Raphael,

Does clk_disable_unprepare(dsi->pclk) need to be added to this unwind
chain?

Flagged by Smatch.

> +		goto err_dsi_probe;
> +	}
> +
> +	clk_disable_unprepare(dsi->pclk);
> +
>  	return 0;
>  
>  err_dsi_probe:

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
