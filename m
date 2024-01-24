Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4041F83ABFD
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 15:36:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE5BFC6B444;
	Wed, 24 Jan 2024 14:36:16 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7997BC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 14:36:15 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2cdfa8e69b5so60984671fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 06:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706106975; x=1706711775;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MpDjSBPxR7jul3F3D7fG96de10Q/B8xuAEUwbLIyapo=;
 b=KYbx8HPcDV6AQTP88WFeusEUdPSNKMOpdKzHvHIzTLxSe10T6kfPk8rqOwloDB3jCs
 iIWmmE+LsMOwN7RBdfESWBiDRPmopcWtcW4y6IAmx4w8191SsBfdbht9rlN5lRnOkEfh
 5g/B/8fm5DJ2PFaixt4Ljg6NtasYH07WLPBC8CT3c6N/3O1W6h/OY/vCemP2/Urw4V8T
 B+disgKXfONzrOSNZQP1m1LffwFluRgxy5o/0Hx/ow48A1y3Yxumt0mXK5L37OLZngv3
 2k+ndcbS75a31GPgyziqmGSbwnYuV7GXejD8/MIyObESwpbN4blG5z8Z0zNTfae+SXB5
 WAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706106975; x=1706711775;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MpDjSBPxR7jul3F3D7fG96de10Q/B8xuAEUwbLIyapo=;
 b=BiZOu7vWRWzK27+UMcrSF5oOdKymtvPg1UOj+KC8oiCiIJ/LwNT1cjzzVeojiZj6H4
 /GBpDW94cynIicWoO9xBq9d/1P6y45eAaiyePiUKIQvvRQIchr55L0vOzQwkmgDkXFqf
 qxoANqKndKF6CWtB2BsfxctrqWCg6gzbQ2Lrt2h09tDfN7175iXazvYCt6l7gFAtpuqS
 S3zvW37CvjHVJ9+On54ij3hbhSKoSczwn7Cs6T+HQhBIg6gt52L2reFlFCLbC0inqc3o
 TPyanlPUOZyeqbwlWkO11EpkyuRtPx1/Hif1z0DCgocFso1tOLNS2Fi/3H/EHk1gjvCb
 Vmdg==
X-Gm-Message-State: AOJu0YymAFPwvmkuot0GMrYH4tWesYUV2Sqdg5lyox/8u571ZY23Bu27
 qH1dIR94KU8eXDlXHZAIpSOg6fjxmAZzdpcz0hiCEO17PwpdeYnW
X-Google-Smtp-Source: AGHT+IE4diP+Bzi1Qt1K35z7Xbr+sJlFYRnMivzS2AX1CTOywsuripJaMAufPOPXgEYRgRWvFi0pXg==
X-Received: by 2002:a2e:870c:0:b0:2cd:f540:e397 with SMTP id
 m12-20020a2e870c000000b002cdf540e397mr482645lji.55.1706106974534; 
 Wed, 24 Jan 2024 06:36:14 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a2e9e16000000b002cd628d6ea3sm4033353ljk.112.2024.01.24.06.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 06:36:13 -0800 (PST)
Date: Wed, 24 Jan 2024 17:36:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <vsert76o6lxxc676tjiiikir577qobfonyo6sgo5eek6alzxlo@tb6hq5s2qcsp>
References: <20240123095006.979437-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123095006.979437-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix handling of
 DPP safety error for DMA channels
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

On Tue, Jan 23, 2024 at 05:50:06PM +0800, Furong Xu wrote:
> Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> XGMAC core") checks and reports safety errors, but leaves the
> Data Path Parity Errors for each channel in DMA unhandled at all, lead to
> a storm of interrupt.
> Fix it by checking and clearing the DMA_DPP_Interrupt_Status register.
> 
> Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 1 +
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 207ff1799f2c..188e11683136 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -385,6 +385,7 @@
>  #define XGMAC_DCEIE			BIT(1)
>  #define XGMAC_TCEIE			BIT(0)
>  #define XGMAC_DMA_ECC_INT_STATUS	0x0000306c
> +#define XGMAC_DMA_DPP_INT_STATUS	0x00003074
>  #define XGMAC_DMA_CH_CONTROL(x)		(0x00003100 + (0x80 * (x)))
>  #define XGMAC_SPH			BIT(24)
>  #define XGMAC_PBLx8			BIT(16)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index eb48211d9b0e..874e85b499e2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -745,6 +745,12 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
>  
>  	dwxgmac3_log_error(ndev, value, correctable, "MAC",
>  			   dwxgmac3_mac_errors, STAT_OFF(mac_errors), stats);
> +
> +	value = readl(ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> +	writel(value, ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> +
> +	if (value)
> +		netdev_err(ndev, "Found DMA_DPP error, status: 0x%x\n", value);

1. Why not to implement this in the same way as the rest of the safety
errors handle code? (with the flags described by the
dwxgmac3_error_desc-based table and the respective counters being
incremented should the errors were detected)

2. I don't see this IRQ being enabled in the dwxgmac3_safety_feat_config()
method. How come the respective event has turned to be triggered
anyway?

-Serge(y) 

>  }
>  
>  static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
