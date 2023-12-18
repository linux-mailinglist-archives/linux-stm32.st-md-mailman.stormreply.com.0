Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E68177B3
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 17:39:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90055C6DD70;
	Mon, 18 Dec 2023 16:39:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 235E9C6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 16:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702917570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RzF2JbZXyIcepSdPLxopsW7MW0ToCu0TxILicJdkReA=;
 b=RQKrctnURRnw5uRDnf4FqRplvwo2iITHE6zHuftJTRkTpAm5UEak0ZkQmHxLKV57vn1rWQ
 iPyVn2QlGzGcY8NkvUC6SpsOZA/63r/AG76X+0EshtiMpAeSHBQzLUhHKfPmZ+ZRWgXIKT
 L983qVCS9acVJ/kHMloSPcICJsMC26E=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-bxUsNvy0O1OVOvpOtDLyfQ-1; Mon, 18 Dec 2023 11:39:28 -0500
X-MC-Unique: bxUsNvy0O1OVOvpOtDLyfQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-591202b7fa3so3135105eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 08:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702917568; x=1703522368;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RzF2JbZXyIcepSdPLxopsW7MW0ToCu0TxILicJdkReA=;
 b=XiJSqYADIn3W/GalNP/kugq0ynegkFxGbvJ4Eb9X57tgtvUPidbgikSqMAifc0krqK
 IHG8aKRjUiemuI7aS2h5/FWwrEk3J//7p040TyuUtuz3PehNPUmDa9jouGcZTHQAxHgS
 K1cVm3j9A2mVipPumihdGSpQnv/mcxwZEppTGBvqcxZbqUvHxc4xIVRhpbiSM87hDspm
 SOhZMTm2MBrtQTo8Zfgn7EYq1UVMSVx86LP0hq1jOT4jZ6GwoEL4SkKehcbwEONjFNu6
 kLTck1mxKKVKcE5qgptuLZd8pt32pA6Xihu3vit2QFxsy6PxG7IfHolm4c62WDQhmGGg
 u5Vg==
X-Gm-Message-State: AOJu0Yz/OliHEP9W6xVVusIdrKD1aIuWgwuqnU4/bchl+YuOuTipQ62T
 Q9mbGGR63KKEtHHCpj86Nj+MXOrVkJe2y4pZzA2nf0xoQS/P9OR94lkCfNEBha9tIT1BICsQYq1
 6oub/ZD3SN3Jgfsx06OTB+tmokI43l7sQ6DL3/ojG
X-Received: by 2002:a0c:d84d:0:b0:67e:f2a3:65b3 with SMTP id
 i13-20020a0cd84d000000b0067ef2a365b3mr10243367qvj.43.1702916069118; 
 Mon, 18 Dec 2023 08:14:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6/x18YmncDwyp50UjFRfP/NiAFTZa/XpjJpoegbGivyb5S1NuE3buhOUOC8ymOCWqVGkP/Q==
X-Received: by 2002:a0c:d84d:0:b0:67e:f2a3:65b3 with SMTP id
 i13-20020a0cd84d000000b0067ef2a365b3mr10243358qvj.43.1702916068894; 
 Mon, 18 Dec 2023 08:14:28 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a0ce84a000000b0067f38f0afd1sm1644254qvo.19.2023.12.18.08.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 08:14:28 -0800 (PST)
Date: Mon, 18 Dec 2023 10:14:25 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <lcfvxawesjc3r2n66zjd2qu5gan7gvvpefgjqjzqwcxosh3n4l@kcggappvytkm>
References: <20231218135032.27209-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20231218135032.27209-1-quic_snehshah@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Fix ethool link
 settings ops for integrated PCS
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

I think the subject should be [PATCH net] since this is a fix.

On Mon, Dec 18, 2023 at 07:20:32PM +0530, Sneh Shah wrote:
> Currently get/set_link_ksettings ethtool ops are dependent on PCS.
> When PCS is integrated in MAC, it will not have separate link config.
> Bypass cofiguring and checking PCS link config for integrated PCS.

s/cofiguring/configuring/

Please add:

    Fixes: ("aa571b6275fb net: stmmac: add new switch to struct plat_stmmacenet_data")

This fixes using the ethtool ops for me so also please feel free to add:

    Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

Thanks for the patch!

> 
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index f628411ae4ae..e3ba4cd47b8d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -311,8 +311,9 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
> -	    priv->hw->pcs & STMMAC_PCS_SGMII) {
> +	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
> +	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
> +	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
>  		struct rgmii_adv adv;
>  		u32 supported, advertising, lp_advertising;
>  
> @@ -397,8 +398,9 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
> -	    priv->hw->pcs & STMMAC_PCS_SGMII) {
> +	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
> +	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
> +	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
>  		/* Only support ANE */
>  		if (cmd->base.autoneg != AUTONEG_ENABLE)
>  			return -EINVAL;
> -- 
> 2.17.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
