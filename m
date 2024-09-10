Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A8974252
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 20:38:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 945BAC78011;
	Tue, 10 Sep 2024 18:38:05 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2C95C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 18:37:58 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f75e5f3debso33128451fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 11:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725993478; x=1726598278;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MGJTDyPZrPgud+em+SoTe59IhXK+nc1Nr17gxYaoJ8M=;
 b=R3fxz/CV0yxc/pl+WLOxMr+654EdpEfZ9QOaldV+K1APN6qb1GRAq/c7wnrz5Pp8ZH
 GL1gFzbKvGNJzcmT7DT6mqfRl5Jp97dEmNM54/PV/pADO8pQ4w4kwOMt6rLRiXkIlJVV
 0fWXA/2ZQsGk3NdpmkGVleSR76b1g9XB5dAb1b4KI0S3UpyYPbDegRwKb0PzjdFDNlAO
 wZiXxEk0RN7vOoBK4vUX6RMGj1znO/rvV4mMP7p8B8ana4bJtz8s9AoJbn1z7OjTJfVH
 1kvj7XTjmrfybw59wmA9QTevtwKVgVvAgC5LaXHGf2z1fd/JCW7NdVXXs9WFH5iHHbgf
 EhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725993478; x=1726598278;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGJTDyPZrPgud+em+SoTe59IhXK+nc1Nr17gxYaoJ8M=;
 b=aDDsysjVI5hDEbppY+270+404sGWtZNo9bvME2OARDZtGr8h+qJ3PClM88UtnpBPfv
 WjdV/Ecqd+X1q0QVYFJNcte27uOYuHurJorWwOs6WRY0sQLI6WkxP9tbxLnORC17VKTy
 MjIoMPeDf/oFV/WqaU75K29GPtjx9CVc8hHXKF6ulOYJq7euvNF41SBmoicNJlM+5w2e
 2w6483441Q6ix0HZrT3VS7I/O0HlePGzqdoSHrrsFU1IJmzsCXkiZx5QdeHMehSdXL2a
 DCG22D9lQhkr227H+s5aVQ7V/7Cqp1fwiEEaX1lhtrN5xREe71dWmiHtkweBrfXCERDN
 6qgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKrweSrB5yi6keXCcSCRuMZE2SwhDiqsmTo9FV4a58RC082075lSiyeIy+dWWUfke/7ZXUKKK0kmmIdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxk/hYk9qULJjkGX4ZIuH2+lM8BnGQ2wy7r6vDWm6HWjzlYK9Op
 a1JXcUfCo19f6wlC9E6IYJcflq4TtZIZ7dvWvH9sVEVPiRyspCh2
X-Google-Smtp-Source: AGHT+IGJ5N5cpAoAAMGa06fcAXoZykutRUQ7ciz6dqZCopzWKg9EwW64N+1kd17OukpLdCRli+ei0A==
X-Received: by 2002:a2e:80d2:0:b0:2f7:5759:db45 with SMTP id
 38308e7fff4ca-2f75b93079dmr59037311fa.31.1725993476881; 
 Tue, 10 Sep 2024 11:37:56 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75c098e9esm13200291fa.116.2024.09.10.11.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 11:37:56 -0700 (PDT)
Date: Tue, 10 Sep 2024 21:37:52 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <7foqi3vdgc3kvyw5rrnqsqsakgfgcrhw5sihnqwza4okdnh5dd@pdsdjn32ya6u>
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
 <20240904054815.1341712-2-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904054815.1341712-2-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/5] net: stmmac: Add HDMA
 mapping for dw25gmac support
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

On Tue, Sep 03, 2024 at 10:48:11PM -0700, jitendra.vegiraju@broadcom.com wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> Add hdma configuration support in include/linux/stmmac.h file.
> The hdma configuration includes mapping of virtual DMAs to physical DMAs.
> Define a new data structure stmmac_hdma_cfg to provide the mapping.
> 
> Introduce new plat_stmmacenet_data::snps_id,snps_dev_id to allow glue
> drivers to specify synopsys ID and device id respectively.
> These values take precedence over reading from HW register. This facility
> provides a mechanism to use setup function from stmmac core module and yet
> override MAC.VERSION CSR if the glue driver chooses to do so.
> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> ---
>  include/linux/stmmac.h | 48 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 338991c08f00..eb8136680a7b 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -89,6 +89,51 @@ struct stmmac_mdio_bus_data {
>  	bool needs_reset;
>  };
>  
> +/* DW25GMAC Hyper-DMA Overview
> + * Hyper-DMA allows support for large number of Virtual DMA(VDMA)
> + * channels using a smaller set of physical DMA channels(PDMA).
> + * This is supported by the mapping of VDMAs to Traffic Class(TC)
> + * and PDMA to TC in each traffic direction as shown below.
> + *
> + *        VDMAs            Traffic Class      PDMA
> + *       +--------+          +------+         +-----------+
> + *       |VDMA0   |--------->| TC0  |-------->|PDMA0/TXQ0 |
> + *TX     +--------+   |----->+------+         +-----------+
> + *Host=> +--------+   |      +------+         +-----------+ => MAC
> + *SW     |VDMA1   |---+      | TC1  |    +--->|PDMA1/TXQ1 |
> + *       +--------+          +------+    |    +-----------+
> + *       +--------+          +------+----+    +-----------+
> + *       |VDMA2   |--------->| TC2  |-------->|PDMA2/TXQ1 |
> + *       +--------+          +------+         +-----------+
> + *            .                 .                 .
> + *       +--------+          +------+         +-----------+
> + *       |VDMAn-1 |--------->| TCx-1|-------->|PDMAm/TXQm |
> + *       +--------+          +------+         +-----------+
> + *
> + *       +------+          +------+         +------+
> + *       |PDMA0 |--------->| TC0  |-------->|VDMA0 |
> + *       +------+   |----->+------+         +------+
> + *MAC => +------+   |      +------+         +------+
> + *RXQs   |PDMA1 |---+      | TC1  |    +--->|VDMA1 |  => Host
> + *       +------+          +------+    |    +------+
> + *            .                 .                 .
> + */
> +

> +/* Hyper-DMA mapping configuration
> + * Traffic Class associated with each VDMA/PDMA mapping
> + * is stored in corresponding array entry.
> + */
> +struct stmmac_hdma_cfg {
> +	u32 tx_vdmas;	/* TX VDMA count */
> +	u32 rx_vdmas;	/* RX VDMA count */
> +	u32 tx_pdmas;	/* TX PDMA count */
> +	u32 rx_pdmas;	/* RX PDMA count */
> +	u8 *tvdma_tc;	/* Tx VDMA to TC mapping array */
> +	u8 *rvdma_tc;	/* Rx VDMA to TC mapping array */
> +	u8 *tpdma_tc;	/* Tx PDMA to TC mapping array */
> +	u8 *rpdma_tc;	/* Rx PDMA to TC mapping array */
> +};
> +
>  struct stmmac_dma_cfg {
>  	int pbl;
>  	int txpbl;
> @@ -101,6 +146,7 @@ struct stmmac_dma_cfg {
>  	bool multi_msi_en;
>  	bool dche;
>  	bool atds;
> +	struct stmmac_hdma_cfg *hdma_cfg;

Based on what you are implementing the _static_ VDMA-TC-PDMA channels
mapping I really don't see a value of adding all of these data here.
The whole implementation gets to be needlessly overcomplicated.
Moreover AFAICS there are some channels left misconfigured in the
Patch 2 code.  Please see my comments there for more details.

>  };
>  
>  #define AXI_BLEN	7
> @@ -303,5 +349,7 @@ struct plat_stmmacenet_data {
>  	int msi_tx_base_vec;
>  	const struct dwmac4_addrs *dwmac4_addrs;
>  	unsigned int flags;

> +	u32 snps_id;
> +	u32 snps_dev_id;

Please move these fields to the head of the structure as the kind of
crucial ones, and convert snps_dev_id to just dev_id.

snps_id field name was selected based on the VERSION.SNPSVER field
name (see SNPS prefix). Following that logic the VERSION.DEVID field
should be converted to the dev_id name.

-Serge(y)

>  };
>  #endif
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
