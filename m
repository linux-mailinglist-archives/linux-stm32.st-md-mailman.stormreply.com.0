Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDBD8040B6
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 22:07:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B5A9C6C855;
	Mon,  4 Dec 2023 21:07:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2906C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701724069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJ2aLBuQ82UANlQlbiQPqkEKJKPRAic/HCDLBzYoX6s=;
 b=hU55N5BBgmvl5g7rjoBJBl1OAwMviz+jO2NtvDOwUv23KrvIgW9FdarpbHbUfV/Q1rgZo4
 qA3XiCHxlryfeGwO58H3CdeE+awZAw7g0YaXhnfactlg6nqFzhp1SNf3O018Yc6Qs7MYHc
 49WwqC6sSQH3XM4dv3a9eHOVFERLCXw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-yh1Xm0lvNEqXWQ2qCP_Rhg-1; Mon, 04 Dec 2023 16:07:48 -0500
X-MC-Unique: yh1Xm0lvNEqXWQ2qCP_Rhg-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-423dba1e166so76410871cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 13:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701724068; x=1702328868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJ2aLBuQ82UANlQlbiQPqkEKJKPRAic/HCDLBzYoX6s=;
 b=kcNi17QWCtJJlyCyMWICZCBfq9i78z95E9iMWST2caBYiQhyG5ApmRoOpgc62yfoIy
 C0tKygc8BzRfrU9xHVQKHQW0VtwGI2VpOKLeucaabfc16f9mqDk3ZlkwS4V+QS1XtrQa
 aC8bVduUl1zTWDuKvQh/HxDalOltbHgInXb69dqTwRUQSajvGrzXPfXW/tq1DwWMIXpq
 TL6A0HEEjd0u0TrOIUXEJW2C7R9oGti1tQeDLFoh5ByrA8/AoNVl6+YTJ9U06IwYuqiI
 azZebdpkxIcJP4hpjw/vN6suAkOJ3DXQKAThMjpHIeZSvHqR7FaVF0dDJ7YkoXpg6r3H
 gnrg==
X-Gm-Message-State: AOJu0Yyl+GqOxSkyoTqLx4m3JQ/Rwqf5bRt3mGJeB6pNhipjRrqpiYSY
 0LnezQdQJZrigKWkhVHoVk7UlWR7C1DhdpO2itkx6Ufy+h8Pm9BzqFxlDkbNrC77hSxHWNRC/dt
 yBw9Pz+7K7odwjoJE5VLBitFrTTLrjJKhUrrNWeLj
X-Received: by 2002:a05:622a:612:b0:423:9887:cd3e with SMTP id
 z18-20020a05622a061200b004239887cd3emr209058qta.32.1701724068017; 
 Mon, 04 Dec 2023 13:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbFKSKjTKx+Yam65LOYaKr2UKx4QIOdb9/HID8MZGjV0GNxiebXUhSTXBgxjLjto4QiruptA==
X-Received: by 2002:a05:622a:612:b0:423:9887:cd3e with SMTP id
 z18-20020a05622a061200b004239887cd3emr209036qta.32.1701724067678; 
 Mon, 04 Dec 2023 13:07:47 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 o16-20020ac841d0000000b00423829b6d91sm4583237qtm.8.2023.12.04.13.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 13:07:47 -0800 (PST)
Date: Mon, 4 Dec 2023 15:07:45 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <zf4fsrtrd736kxweputr2fulu7ffagivwi7zodctcsdg3uj6e2@iquglstf2gqb>
References: <20231201100548.12994-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20231201100548.12994-1-quic_snehshah@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: update Rx clk divider for
	10M SGMII
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

On Fri, Dec 01, 2023 at 03:35:48PM +0530, Sneh Shah wrote:
> SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
> Update configure SGMII function with rx clk divider programming.
> 
> Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

I can confirm that without this patch traffic doesn't seem to work when
I force things in to SPEED_10 with ethtool (which required another
change to this driver in stmmac_ethtool.c to do so, which as far as I
understand Sarosh from your group will be upstreaming soon and is an
independent issue).

I am curious, I expected to see some dropped/errors output in ip link
when things weren't working. I guess the sgmii phy in the soc is
rejecting these prior to handing them to the mac? Or am I
misunderstanding how that works?

> ---
> v2 changelog:
> - Use FIELD_PREP to prepare bifield values in place of GENMASK
> - Add fixes tag
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index d3bf42d0fceb..df6ff8bcdb5c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -34,6 +34,7 @@
>  #define RGMII_CONFIG_LOOPBACK_EN		BIT(2)
>  #define RGMII_CONFIG_PROG_SWAP			BIT(1)
>  #define RGMII_CONFIG_DDR_MODE			BIT(0)
> +#define RGMII_CONFIG_SGMII_CLK_DVDR		GENMASK(18, 10)
>  
>  /* SDCC_HC_REG_DLL_CONFIG fields */
>  #define SDCC_DLL_CONFIG_DLL_RST			BIT(30)
> @@ -617,6 +618,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> +		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
> +			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 0x31),
> +			      RGMII_IO_MACRO_CONFIG);

Russell requested a comment about why you must program this every time,
I think it's a good idea too: https://lore.kernel.org/netdev/ZWch7LIqbMEaLRLW@shell.armlinux.org.uk/

Also on my wishlist is making 0x31 less magic, but Santa might not bring
that for me :)

>  		break;
>  	}
>  
> -- 
> 2.17.1
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
