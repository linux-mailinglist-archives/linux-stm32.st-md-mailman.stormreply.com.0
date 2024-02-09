Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB784F9DE
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Feb 2024 17:44:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A43A9C6C859;
	Fri,  9 Feb 2024 16:44:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EE13C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Feb 2024 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707497064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k3HiufRFOq7vi28Eqly0vEDaDdHwR8LxB2v5P2jtSCw=;
 b=AfYOOMZPHxpGnSmXTBvIJwRcCClBkbj6fKIUx5B4EueZZ/IOAH9GViT4WT0bUtUEHzjZW/
 Ga+bfDQqA9g0SCpopRPipfzvE/hF5OyaZ7pm0ciba6qdYr0QyufuM9FaTQMRAt7OxhfTni
 ffAIcKh8YFGvY4+PCdVtuumUsJbz1T8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-1QjfFs1kO6SnWbMYdEpoZg-1; Fri, 09 Feb 2024 11:44:22 -0500
X-MC-Unique: 1QjfFs1kO6SnWbMYdEpoZg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-785bd90f3acso51958585a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Feb 2024 08:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707497062; x=1708101862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3HiufRFOq7vi28Eqly0vEDaDdHwR8LxB2v5P2jtSCw=;
 b=bA2+tqqepZmQxIDrt25cBMyxY5ImnwAPipy/1INVdqAiRQr8iHF0LzHFPQaN6MY40X
 ntJslQUKSEHJoezcdpDy/YH0+6gVZ07OC6YEDBDmc44e+awFUP4F0/Ijwd9b7QBSPHX4
 nrCp2P1RmEBb9v14bENf4fCmNJW9GcQelMizJgW5fMnnWkMKgXF6rYOyOuxpd5hgeGKE
 MXSbsS8gkt2u973weme7KefCCyYnO6OMTPGKSWM8cZOWI0RXMv3e4CRTJQLi4pAWYcmm
 K4vT1LZHNmQ4SZy7QTGInppJDaT44/xThK6tkJ6whWijq1l+noLQ/c+l4/kYMe629zzi
 vrOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuyevMAFnsbgJgIM7uo/tJmA3yoH53kTnFaHAR2f4jI6DtIAzhKTsYo6S8oZqtQ5fmUyu79QWmTbN/CV9isocD0VDtG1Bz1+olgyAlv86n7EhAkMS0bgPm
X-Gm-Message-State: AOJu0YwebeWT3iQJGcK3Vaz/cWnrHoa+otxctKVw0sgb47yBDDBngOcD
 b6cZKPIwmzbOiRBnMs886uzEcPpj17LXD+PA8qs0da9lTcIhZdas3Xf9a7Rx0dCFmeLiiYOA3qK
 iaOLzHXQFZV4SubIDzJYmuCC/KIgksMyDGgdKn4uey+VTKqpSk6/j1NAPFGwh6L4jglKwEi3uNd
 bfhw==
X-Received: by 2002:a05:620a:40d1:b0:785:bf37:38f with SMTP id
 g17-20020a05620a40d100b00785bf37038fmr657044qko.11.1707497061982; 
 Fri, 09 Feb 2024 08:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENVlA0qg0+4v3P91wiIIxEpOzL+466GK2dg+eDP2qJSP6DtjO3gdikAce6wgZD8KW4lb3G3w==
X-Received: by 2002:a05:620a:40d1:b0:785:bf37:38f with SMTP id
 g17-20020a05620a40d100b00785bf37038fmr657021qko.11.1707497061667; 
 Fri, 09 Feb 2024 08:44:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXIu8tS+YN+nAnwmSQTK3nqYx/bNMiFOQfgHipM2vrWJG2F/T3h8FvYmc9sp26zQKA8kRWeXTlFjy5PqWMMMB06Le4B1D3VrK7uk+jvefd3gRc6JwN/cXMo8ya359E9TOHld3SBT8QDePHqAfKIglTQJi/kTdIx/ptsgS57YRqRlcs8BE3OlYDYt+M31mvj0MWKqkkB2oPw/VmwDRTT1aq2+px67RQ+GB8oxTa0jyVOaBe1pP4pldi/EU7s74bsCzmagbrXRPLyj5dcSPaelYmCRC6lN5zZ25atB9oYuPWOCkC6C9HLRV7cuLgf3sPLEqeTV581C7U/H9CentaZ23iF6Fe4pnJQOEA8LnTdwv1mK6ZQZ7Vi+vJbTjxpvJpQXUBsyrSiMIsclgOubE7AnvCcMdKWNkgz63/OZLHAk8l3faG5vQBBXzXcXrYIBn5NXjvqFIZs/hVxQPwWnHradKVH2xQ=
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a05620a099900b00783f77b968fsm843857qkx.109.2024.02.09.08.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 08:44:21 -0800 (PST)
Date: Fri, 9 Feb 2024 10:44:19 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Message-ID: <xtwaz7cma6tc42hwslpp3j5htxhsefkmgjntciihphhhkislk7@dy6kr4qfs7mf>
References: <20240208231145.2732931-1-quic_abchauha@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240208231145.2732931-1-quic_abchauha@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: stmmac:
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

On Thu, Feb 08, 2024 at 03:11:45PM -0800, Abhishek Chauhan wrote:
> TSO and TBS cannot co-exist. TBS requires special descriptor to be
> allocated at bootup. Initialising Tx queues at probe to support
> TSO and TBS can help in allocating those resources at bootup.
> 
> TX queues with TBS can support etf qdisc hw offload.
> 
> This is similar to the patch raised by NXP
> commit 3b12ec8f618e ("net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings")
> 
> Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride
> Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> Changes since v3:
> - The change is Tested-by Andrew Halaney <ahalaney@redhat.com>
>   on Qualcomm Ride platform
> - Change log is removed from the commit text
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
