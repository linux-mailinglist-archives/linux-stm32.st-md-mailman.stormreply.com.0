Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25B11F3C9
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2019 21:10:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5B4AC36B0B;
	Sat, 14 Dec 2019 20:10:56 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E40A9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2019 20:10:54 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 2so3353364pfx.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2019 12:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=wuX1wX7F3A4+ViJ/F0TGocQYp+UHpk0d54KJOh0KWqY=;
 b=moI3aNp2gAT6fiipm7VKPiy+ExbuP/KxOwHz1IvtGmHQpyBlujqY4lGo6og4s01Gws
 COU2gYcZ6Jap8JvjadlrRSn8S/33mTnO9RURXanWwir+y0Tsuo4HoczUlYHUr/8Jm597
 AGPgZE52gf9NtvdT2YMBmDPipmfP1Pe6DwgwIB8O41VmdOvsyEC/ELaxLf10l9/xtCDl
 yOZ9c0QPLMm8Fx+e4XfJIn/SbHihOD6YoBI/D6OVtv93VWXeb+gHNKGuOO7Lhbi5IwiO
 Ir7xCXz2QuYtYIu8IPu2YpqubPJgvxIHPJeE9p2ae1QoTxoLSbSMxfjAvSpmNqJRe3gd
 oCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=wuX1wX7F3A4+ViJ/F0TGocQYp+UHpk0d54KJOh0KWqY=;
 b=jIfk3naVb0iEQRzDi3KqlWsjtR6tRMsPbSx/X/KNdJUejlmXuTGxHXIDWxoAwWzh4F
 L73r/7kay6ngedcFUnzBxxiYwCnI+YVARZ/TsvDO7CfbK1O2TFSvKqBSB1LKGGJYYgM2
 ZfTB347x1Vc4vCeK7X23kyPgWpxa9+wFwWTw8RkJ5QXV0Xjb6GvLGziW2CE2j09Vl90z
 Y+XMgB6p5nAYYxn9P8LnMKhOaEU1q5ic9/9FeKxpl11rKGN63f0b+dMHlzLEcAHb+7Cq
 D1mQsuTSMe5Jokedr3Q0w0A0pk1W09Z086Nh4phEhumgUQPhMLaH0SCmxQDGs8OvimPT
 gtXQ==
X-Gm-Message-State: APjAAAULkm4ChvSp6AEgF/SH23A350NnR0qcOeZ4NVfaEkRaAvCn6YwF
 eNo3dJfieWqRyrd4fE6Z+Uncvg==
X-Google-Smtp-Source: APXvYqyZIZpkQnsmmMbQQozox77o8oKzuyqEEgz/qPk80xmbgKB8F2SyKW2zohfp580A6GNPcxBONw==
X-Received: by 2002:aa7:9205:: with SMTP id 5mr7043338pfo.213.1576354253427;
 Sat, 14 Dec 2019 12:10:53 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id y22sm16280523pfn.122.2019.12.14.12.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2019 12:10:53 -0800 (PST)
Date: Sat, 14 Dec 2019 12:10:49 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Xu Wang <vulab@iscas.ac.cn>
Message-ID: <20191214121049.266b656f@cakuba.netronome.com>
In-Reply-To: <1576060284-12371-1-git-send-email-vulab@iscas.ac.cn>
References: <1576060284-12371-1-git-send-email-vulab@iscas.ac.cn>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: platform: Remove unnecessary
	conditions
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

On Wed, 11 Dec 2019 10:31:24 +0000, Xu Wang wrote:
> Remove conditions where if and else branch are identical.
> This issue is detected by coccinelle.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index bedaff0..1d26691 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -229,8 +229,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
>  		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WFQ;
>  	else if (of_property_read_bool(tx_node, "snps,tx-sched-dwrr"))
>  		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_DWRR;
> -	else if (of_property_read_bool(tx_node, "snps,tx-sched-sp"))
> -		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
>  	else
>  		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
>  

Thanks for the patch but in this case it looks like this code is
intentionally written this way to enumerate all options. Maintainers -
please speak up if you prefer to have the patch applied, otherwise 
I'm dropping it.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
