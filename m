Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC280ADB2
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 21:20:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E10F5C6A613;
	Fri,  8 Dec 2023 20:20:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07D9EC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 20:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702066834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2FTOMdJpRPbHn3vU2n7KIGDnUrhFTCYmrUCTOtwVngI=;
 b=AEj7wduWuOMjhRtIoYB/xGVSxs0CBorjhRxcPuJCu5G8k5sjTKhpR7NQCyVZe4a4cbEKi/
 cvi47nyLgA25gfMMp7hPmuoGJCzd68zWEti5aJDuXSnR98jmF+R2ksDK06xtf0uWWCAiM+
 ToMCqMxX8eSliaCo57JWbWclIgyxUAQ=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-qwjSJuRmObuqj7qenhbTyw-1; Fri, 08 Dec 2023 15:20:31 -0500
X-MC-Unique: qwjSJuRmObuqj7qenhbTyw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1fb0a385ab8so4840079fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Dec 2023 12:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702066830; x=1702671630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FTOMdJpRPbHn3vU2n7KIGDnUrhFTCYmrUCTOtwVngI=;
 b=RTTRPeHZTEpxbkIe/xOX6yN2VxkvkabAjvGRLsibEaf7XdpppPVaum9KE+y4wUUaIb
 cqMtOm3i8emJBptUp6zxhAba+6RTY1QUnjJ8MH/G6FhnfGNm2skcKySkUbP2ry/hyVcs
 LVTS2mf8ozJ/XRIspPZ+2SVC7+Q/oj4DvL5NnsLK8Jhvjd7BCtx03ckddQbvcfKn5Rsw
 z535XB5D71VFqbxMLeWUaXhfUzsP9P8pGB2Kvrm+kZJkvqxVUiOssZfjNCC8WR0wPTj8
 MAQw3ODjTo4vuycjbEfm7biaMZnUBPOzZ455t0aMf4hfnzSoqrA6IRyo5o8KSwG27X+B
 /77g==
X-Gm-Message-State: AOJu0Yw+ADfAT7/ud1IuANZtDTG7A1GWOmJ3nl9pzPVNp2jO3d6RtOdg
 inuyHtNqN/fLBQxZzM21GvawqFgpfqzTi+zZqPug6ySubdWQeTsXcT+tsd+5GqjRTsWFSAToSi4
 locA/VwUTAUWaYFz6t9PK3jnuWKkiD+78yGfFkw0p
X-Received: by 2002:a05:6359:4585:b0:170:17eb:9c51 with SMTP id
 no5-20020a056359458500b0017017eb9c51mr481916rwb.50.1702066830537; 
 Fri, 08 Dec 2023 12:20:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLWmk2lhCMiTr98WkK9KeFFVT1gu2su5EkI3YZa49gE9uU8KYl5h62TvxFqSxd5sJ7laeJbw==
X-Received: by 2002:a05:6359:4585:b0:170:17eb:9c51 with SMTP id
 no5-20020a056359458500b0017017eb9c51mr481899rwb.50.1702066830252; 
 Fri, 08 Dec 2023 12:20:30 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 po8-20020a05620a384800b0077f0a9ec24bsm927364qkn.105.2023.12.08.12.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 12:20:29 -0800 (PST)
Date: Fri, 8 Dec 2023 14:20:27 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <2yx7snbvbvjycuszzonmwxokr4pvqslz2bpy4eoyrri5tzlymb@t3t23x7eeknq>
References: <20231208062502.13124-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20231208062502.13124-1-quic_snehshah@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: update Rx clk divider
	for 10M SGMII
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

On Fri, Dec 08, 2023 at 11:55:02AM +0530, Sneh Shah wrote:
> SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
> Update configure SGMII function with rx clk divider programming.
> 
> Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")

You didn't add my:

    Tested-by: Andrew Halaney <ahalaney@redhat.com>

from the last version. Typically that's fine to do even if you post a
new version as long as the changes are minor (in your case it's just the
comment that was added since I tested, so definitely fine to do).

> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
> v3 changelog:
> - Added comment to explain why MAC needs to be reconfigured for SGMII
> v2 changelog:
> - Use FIELD_PREP to prepare bifield values in place of GENMASK
> - Add fixes tag
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index d3bf42d0fceb..ab2245995bc6 100644
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
> @@ -598,6 +599,9 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
>  	return 0;
>  }
>  
> +/* On interface toggle MAC registetrs gets reset.
> + * Configure MAC block for SGMII on ethernet phy link up
> + */

s/registetrs/registers/

>  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  {
>  	int val;
> @@ -617,6 +621,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> +		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
> +			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 0x31),
> +			      RGMII_IO_MACRO_CONFIG);
>  		break;
>  	}
>  
> -- 
> 2.17.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
