Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F19004A4
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 15:24:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BB48C7129F;
	Fri,  7 Jun 2024 13:24:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5189C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717766645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h0njwWl4Xr7B/zKqo02JfY8aEgwHTV+DbOrvBRuVJ/0=;
 b=YOciSxvAug6nc5BW8/tv2jzIOa+J/QxSBg5IBYPVN8QZw/SC5cgRn3zogtinPRfbGDrsk0
 CQ0tDCJe0L5fCkMk68qowhZnJYSo87Z7UdSuXlOnpaQkWHLGZTAj6//elvQmuKO1DovreD
 NnGqEML9XyXQAWxPaKl3Qm8PzbObshE=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-tA4xnPHMNROqcafTmneAkw-1; Fri, 07 Jun 2024 09:24:04 -0400
X-MC-Unique: tA4xnPHMNROqcafTmneAkw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-250a7122b8aso2949238fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Jun 2024 06:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717766644; x=1718371444;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0njwWl4Xr7B/zKqo02JfY8aEgwHTV+DbOrvBRuVJ/0=;
 b=in2p+bhMXIHvMRd+9S+yqA2HzdupstQGjr5EWAUsMf1ZdvC7f8ct2ZSQDH8DuVkxDe
 /3NQj5cFoIz58TPsyR5HBnBYD0+iw+gXtyvHVtP7mWANTS7Q72W3ggS7z6oo9UjmGzdW
 dusm9ky6LOgfhhMI0PPnLBLXAc4GyLp/3lMkB8vyh2qMoCsmdJvTiRQMU9Yv5WyEyCOi
 ooRalH9zd5U5j6s7Y+UVTltquflb0ulxdTP8U8KaYT6fUlUMi3YnJ6KoIc56BHp1W2NH
 WYAJBYOd3pq9Ma7fFcwedTcvQ6AI2/VwAC9dzYMvsXtdS6sWd966ZPZEG2x5vfmeZtry
 bMuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMJ8JGpHaZBrzkZmbUUXn4LpmsI6KI7sgSqpSMeqp1I5Ew9Ess/OazsvMO8or8KWAj2meTwovdFoPdCQaJtvYs2xlnq64XXvpq4LPQNpEAP6/yJpBhsFEW
X-Gm-Message-State: AOJu0Yw2GSMCvHd7bEshw7CKGMz+oDHnCQDk8uem8qLNcjShvPLeuAlW
 vXrPK8nXT1+x4qMpirkLUR7Zon/4oU0QotEUn6W4p9tN9n9S3f8f6rfk5MxW3uh5rHY0PFsdPFs
 bUbn8h+P6wHosuG0UgL0SmQvNzO3QjByZUpEaDP8P0HMfWkmWWERCkbOVfEJmGhy20CunGufUcw
 8pBg==
X-Received: by 2002:a05:6870:1647:b0:250:7f7e:fa6a with SMTP id
 586e51a60fabf-254644ebe85mr2654546fac.23.1717766643659; 
 Fri, 07 Jun 2024 06:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwA2CSDWzl4DWmECTbOWHWFKZGJkdSO88z6FFhYWwsyVS9MiJccFJLIeEIllG1fQtMcqXfeA==
X-Received: by 2002:a05:6870:1647:b0:250:7f7e:fa6a with SMTP id
 586e51a60fabf-254644ebe85mr2654518fac.23.1717766643236; 
 Fri, 07 Jun 2024 06:24:03 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-795332e2111sm163946885a.133.2024.06.07.06.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:24:02 -0700 (PDT)
Date: Fri, 7 Jun 2024 08:24:00 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <jtalwaityx7fyakigggyahhhor23fml76yic3e3xkeoimdqoj2@i7fiqzacowq3>
References: <20240605-configure_ethernet_host_dma_width-v2-1-4cc34edfa388@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240605-configure_ethernet_host_dma_width-v2-1-4cc34edfa388@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Eric Dumazet <edumazet@google.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: dwmac-qcom-ethqos:
 Configure host DMA width
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

On Wed, Jun 05, 2024 at 11:57:18AM GMT, Sagar Cheluvegowda wrote:
> Commit 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA
> address width") added support in the stmmac driver for platform drivers
> to indicate the host DMA width, but left it up to authors of the
> specific platforms to indicate if their width differed from the addr64
> register read from the MAC itself.
> 
> Qualcomm's EMAC4 integration supports only up to 36 bit width (as
> opposed to the addr64 register indicating 40 bit width). Let's indicate
> that in the platform driver to avoid a scenario where the driver will
> allocate descriptors of size that is supported by the CPU which in our
> case is 36 bit, but as the addr64 register is still capable of 40 bits
> the device will use two descriptors as one address.
> 
> Fixes: 8c4d92e82d50 ("net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms")
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> Changes in v2:
> Fix commit message to include a commit body
> Replace the proper fixes tag
> Remove the change-Id
> - Link to v1: https://lore.kernel.org/r/20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e254b21fdb59..65d7370b47d5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -93,6 +93,7 @@ struct ethqos_emac_driver_data {
>  	bool has_emac_ge_3;
>  	const char *link_clk_name;
>  	bool has_integrated_pcs;
> +	u32 dma_addr_width;
>  	struct dwmac4_addrs dwmac4_addrs;
>  };
>  
> @@ -276,6 +277,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
>  	.has_emac_ge_3 = true,
>  	.link_clk_name = "phyaux",
>  	.has_integrated_pcs = true,
> +	.dma_addr_width = 36,
>  	.dwmac4_addrs = {
>  		.dma_chan = 0x00008100,
>  		.dma_chan_offset = 0x1000,
> @@ -845,6 +847,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
>  	if (data->has_integrated_pcs)
>  		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
> +	if (data->dma_addr_width)
> +		plat_dat->host_dma_width = data->dma_addr_width;
>  
>  	if (ethqos->serdes_phy) {
>  		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
> 
> ---
> base-commit: 1b10b390d945a19747d75b34a6e01035ac7b9155
> change-id: 20240515-configure_ethernet_host_dma_width-c619d552992d
> 
> Best regards,
> -- 
> Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
