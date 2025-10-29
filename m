Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD6CC1ABA2
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 14:34:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CC72C62D44;
	Wed, 29 Oct 2025 13:34:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34724C62D3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 13:34:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 71AA84E413CE;
 Wed, 29 Oct 2025 13:34:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3C4CB606E8;
 Wed, 29 Oct 2025 13:34:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A5403117F80A7; Wed, 29 Oct 2025 14:34:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761744849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=wKk+FxFdhXoaDcRKRxsyJt9b/J7SbDXNlJUTNBILMfk=;
 b=IlvV06IPxNV2S5cD3etgy/hG0vlnjV/OCq7pn1FljLu3y+j9LSE8lJ+s37shkWZW0mMdTk
 eMWXv/Ppz0BCT8/zs8UuD+EDdLzvwEnPhHnKlk5bQNO5EsyUOnileffmhKTPKgfHHXd3R/
 WxEHlJKZA8JGmH50riHR7E4iq6+ohacOWUHCtPz5Iam2AquOuVF+6uysOV1+ZW8cLz8c/z
 QIMN1lgRw7C07B+283adVEJrTHS2iQcpxEtErsytiGX5WR0C7O89fvYuR2tyAHMIABCYtP
 K8gHywFCOqvzhRqY3WUxcJsw8jeNI7TOi8tlzCFEYg5pQPBLkO5tIyOTPpuF/Q==
Message-ID: <a871daac-364e-4c2c-8343-d458b373e1fd@bootlin.com>
Date: Wed, 29 Oct 2025 14:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rohan.g.thomas@altera.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
References: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
 <20251029-agilex5_ext-v1-1-1931132d77d6@altera.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251029-agilex5_ext-v1-1-1931132d77d6@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] net: stmmac: socfpga:
 Agilex5 EMAC platform configuration
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

Hi Rohan,

On 29/10/2025 09:06, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Agilex5 HPS EMAC uses the dwxgmac-3.10a IP, unlike previous socfpga
> platforms which use dwmac1000 IP. Due to differences in platform
> configuration, Agilex5 requires a distinct setup.
> 
> Introduce a setup_plat_dat() callback in socfpga_dwmac_ops to handle
> platform-specific setup. This callback is invoked before
> stmmac_dvr_probe() to ensure the platform data is correctly
> configured. Also, implemented separate setup_plat_dat() callback for
> current socfpga platforms and Agilex5.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 53 ++++++++++++++++++----
>  1 file changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 2ff5db6d41ca08a1652d57f3eb73923b9a9558bf..3dae4f3c103802ed1c2cd390634bd5473192d4ee 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -44,6 +44,7 @@
>  struct socfpga_dwmac;
>  struct socfpga_dwmac_ops {
>  	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv);
> +	void (*setup_plat_dat)(struct socfpga_dwmac *dwmac_priv);
>  };
>  
>  struct socfpga_dwmac {
> @@ -441,6 +442,39 @@ static int socfpga_dwmac_init(struct platform_device *pdev, void *bsp_priv)
>  	return dwmac->ops->set_phy_mode(dwmac);
>  }
>  
> +static void socfpga_common_plat_dat(struct socfpga_dwmac *dwmac)
> +{
> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
> +
> +	plat_dat->bsp_priv = dwmac;
> +	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
> +	plat_dat->init = socfpga_dwmac_init;
> +	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
> +	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
> +	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
> +}
> +
> +static void socfpga_gen5_setup_plat_dat(struct socfpga_dwmac *dwmac)
> +{
> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
> +
> +	socfpga_common_plat_dat(dwmac);
> +
> +	plat_dat->core_type = DWMAC_CORE_GMAC;
> +
> +	/* Rx watchdog timer in dwmac is buggy in this hw */
> +	plat_dat->riwt_off = 1;
> +}
> +
> +static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
> +{
> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
> +
> +	socfpga_common_plat_dat(dwmac);

I"m not familiar with this device (I only have a Cyclone V on hand), does
it still make sense to try to instantiate a Lynx (i.e. Altera TSE) PCS
for that IP ?

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
