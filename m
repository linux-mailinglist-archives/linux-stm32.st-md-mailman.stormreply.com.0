Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9281C84E957
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Feb 2024 21:06:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49900C6C841;
	Thu,  8 Feb 2024 20:06:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88FA7C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Feb 2024 20:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707422806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ANys47F0NxoVUIOHDguuU7C7l2/Ixa/qHxdOlZRmRWc=;
 b=hsOyviIpXGysn+o/JY/DPzjcIY3kz2CF5uVPqLGOPdEL2FRbiZuwajyQ6skfJPVJbwnl/e
 m5+OlBTBIPrJ8q00v8crdWiZaLVYVLh7i5P0WANJcmAmzx5SHZJv9gv8qFtd5HR6DrZoX3
 l8YQvTib9yulvPZq3swsC6/M1mYRdnY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-M_XftVheM5W7hjN4gVGQIQ-1; Thu, 08 Feb 2024 15:06:45 -0500
X-MC-Unique: M_XftVheM5W7hjN4gVGQIQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-78315f41c6cso28179785a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Feb 2024 12:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707422805; x=1708027605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANys47F0NxoVUIOHDguuU7C7l2/Ixa/qHxdOlZRmRWc=;
 b=YxQIj5q81SHavmu8gNiwiWDsrCd7KFYzL5Ulw8ySdUYokF04PBK/AYoQXjFwk2Tw0v
 dKx6zG02kg7JqHIJIDMjMsvbjCoen4D5X9dgKFoi8WgDaJoeYqH06d9uidftN//Z1VCl
 HykELzmSw91+sEpwrKXM3eewS3EyqCWB24xZgCFN2Uhg8hKXbRUvLkE07eBt4anTnTFI
 ePpERTfRoDn0abcmhyvbJ83LcUsRgf/90/OmD+roVVWXok03Y4R6XUGtyCgeW4rLRJ+H
 h6oZIhHQqLilTI355PYv1v2QtnZFSP58RE8gHgKj0nxuncxuYORe1lrIhQl5Y0X33AYF
 DKrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRW2cdVEbtkXiljnc2g4tb3DEQyXict/Tz3/r6RifCApP+mPPMyoW4akbLFHuDE1LiAgRmRXurqEClDx0O/NL2goZqGnxM5Rzfxcqv8+uaC/XShpHe0foc
X-Gm-Message-State: AOJu0YxY94P3yT8g0Qt29pj1AJ1HNA2w05q6n5VPf4L7EAugCVHzuEAc
 6l8MB9fiucr9igP0P1XUTTcB1SUq16M9QBIozUmqbxEUZFm28CLj7Mx33bU09Aw2QHSeevoVKw2
 qV8X8NPHd2J6OgQhMSUbAimiUuiuGsfIL08lmXP7QMEJe6Sfmds50KsT9i2yodv/iaMravAmcvr
 pxvQ==
X-Received: by 2002:a05:620a:9c3:b0:785:ac12:e4b5 with SMTP id
 y3-20020a05620a09c300b00785ac12e4b5mr574423qky.55.1707422804898; 
 Thu, 08 Feb 2024 12:06:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuq4yeSZLglLwVkXsC5eH+I4vEuR70T8am1BFRQodf/cnjwEjFuwBGgJLIgQIc31AFA38WaQ==
X-Received: by 2002:a05:620a:9c3:b0:785:ac12:e4b5 with SMTP id
 y3-20020a05620a09c300b00785ac12e4b5mr574395qky.55.1707422804605; 
 Thu, 08 Feb 2024 12:06:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXYxnneQ2myYwNQ9XHVjYFXa6X60+lUgyO9TTq4kAi/WOA/HjG/z0yklvZLAMzZDECVVDXsBsbSDt+Ic9UZIOmG1G5dLK1DKUQtYSk+4SECN4g5TExgPfHjb+t5Nl09pJvRguZgjdp71fW7BJRS6tenMtZBWUCQrbgKOKLsRLlLtdFRF83Pe5hWRggNNqTOVDmU/++S9cdhAaZ3pjp56calv63pkhSwsK3BtYMHyg7WyiVaLEyV0Yq2DH5I0GH+mSTkZJmWhN9iBbQYB2Ss6qmDxMghuPXOLXtcA4jKavTFX+HHRDDrmy5g+48mkdbc8gZO+nW7sYFCJTUb62st+NLVW47BxLzEyAz3eoDdpb6YbE81/qoRtyz2sRaEv+7EMItFfpBBRK4URBgothCCqOfvB8H1qm6pEAENaOSVLy5XAQmKITQYIpAe1UkJ3KBWJzhP/00852p0KnCxgTulaJmB33o=
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a05620a034200b007859ee84641sm125675qkm.6.2024.02.08.12.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 12:06:44 -0800 (PST)
Date: Thu, 8 Feb 2024 14:06:41 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Message-ID: <yamtu6i6bzre2ewmgh5eert35j74ofcw65554zr2g57ydzsjqa@crxdyszih4tw>
References: <20240207224001.2109224-1-quic_abchauha@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240207224001.2109224-1-quic_abchauha@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: stmmac:
 dwmac-qcom-ethqos: Enable TBS on all queues but 0
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

On Wed, Feb 07, 2024 at 02:40:01PM -0800, Abhishek Chauhan wrote:
> TSO and TBS cannot co-exist. TBS requires special descriptor to be
> allocated at bootup. Initialising Tx queues at probe to support
> TSO and TBS can help in allocating those resources at bootup.
> 
> TX queues with TBS can support etf qdisc hw offload.
> 
> This is similar to the patch raised by NXP
> commit 3b12ec8f618e ("net: stmmac: dwmac-imx: set TSO/TBS TX queues default 
> settings")
> 
> Changes since v2:
> - Fixed the styling of comment in the dwmac-qcom-ethqos.c
> - Followed the upstream format to give other glue
>   driver references to solve the same problem
> - Appended  the subject with net-next
> - Discussion of why this patch is required is discussed in
> https://lore.kernel.org/netdev/c2497eef-1041-4cd0-8220-42622c8902f4@quicinc.com/
> 
> Changes since v1:
> - Subject is changed as per upstream guidelines
> - Added a reference of a similar change done by NXP in
>   body of the commit message
> 
> Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>

Please add my:

    Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

when submitting v4 with the changelog moved as Jeff mentioned. This
seems to work well (I can enable ETF on all queues but 0, and as far as
I can tell after trying to test that for a while it seems to work as
expected).

Thanks,
Andrew

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..2691a250a5a7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -728,7 +728,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	struct stmmac_resources stmmac_res;
>  	struct device *dev = &pdev->dev;
>  	struct qcom_ethqos *ethqos;
> -	int ret;
> +	int ret, i;
>  
>  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>  	if (ret)
> @@ -822,6 +822,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
>  	}
>  
> +	/* Enable TSO on queue0 and enable TBS on rest of the queues */
> +	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
> +		plat_dat->tx_queues_cfg[i].tbs_en = 1;
> +
>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }
>  
> -- 
> 2.25.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
