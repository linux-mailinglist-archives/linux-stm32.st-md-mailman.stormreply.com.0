Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B2E84C63E
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 09:26:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DECA8C7800D;
	Wed,  7 Feb 2024 08:26:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52921C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 23:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707262178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kGuKJfCI04HqdOMRiRGUxI5yLSI9wasd/RUKvuSvTE8=;
 b=AlHlheDBQbQrgCJ24NV6822Nk1ZMX2hmlltx/3TolxyfQ+HyBua8scqSDCPKj6B/RU+4GO
 owI3s3I0KdWjHdbXkI5XgRJMBViMDST6wDMTWkrr8tb64X06waYuXcwOnV383zWaXUhh1l
 mSpn5oqZ8o7XXBKcGqpgYwKe0qOf28s=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-o7GRlBv9ONmebgFDN9gIsw-1; Tue, 06 Feb 2024 18:29:35 -0500
X-MC-Unique: o7GRlBv9ONmebgFDN9gIsw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-783f4adb738so638225385a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 15:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707262175; x=1707866975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGuKJfCI04HqdOMRiRGUxI5yLSI9wasd/RUKvuSvTE8=;
 b=RMZT/hw9vL6gRKD8X/p/pkNpaDXI2WetOlyqGBaENbOUx/HG0zm2/s5izrYkZFRXyQ
 uMcEQJdUuCte9zpxsNKpO4G9b8/GlV9gVZTFMeKzKEMNCUpzAaet0N2noO6X5nyrnLCk
 TZRZLuUT6TspyqL11L+ZD43UCX13zbOIPevqh1gfpR7WjnZ2HZA9WT8y05P+xYcqLl9a
 AZWijg7VVaeHj2COpFwlqW1LkzKfViOc8iIN1nCXj/cU6b0YDxeTrOzA8WpR/3vzh3B4
 247T9CePlQFYBY53JldI7O+G6yE+qSKpy7w/BO+9dpKxX1/f9zviUmlV6Up68TrqMLy0
 hQtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqikWpnAACdmyaA9gU4hjlAsQSExs4PAda6HqyvzkjtFyvKoQKLMX8iueOpOmNMnJvaVa0x62ZrICuS7pNb+ApWFlZHDjOMP/70HW/j0TZzY6y+++RrR/W
X-Gm-Message-State: AOJu0Yz7h0hMA27R/DexYDMRWoHei2rv4EZI+ms5khhNulRZanGGK0Eh
 fuj3EbshQyc6dbd1TVRJ2sOOZSjaDeYHHzSR+nenzFyzeEKHNbkjqJYXSt0LzkB3vR0XJuoBp8r
 NeiWM84fanzC9DPFKH2ehagBDp9Gc+H3t0e6R44KLimDsajpCWYR0evXArhCvPljaJgguODrilx
 K0Yg==
X-Received: by 2002:a05:620a:954:b0:783:6943:26d9 with SMTP id
 w20-20020a05620a095400b00783694326d9mr3538729qkw.72.1707262174747; 
 Tue, 06 Feb 2024 15:29:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzxDP7R0yen2yo1PCk013ut+Q4BlMwWCQioC3aozlnsOonH4eG8xY5gzlWpshjgLrV00I1Ow==
X-Received: by 2002:a05:620a:954:b0:783:6943:26d9 with SMTP id
 w20-20020a05620a095400b00783694326d9mr3538704qkw.72.1707262174447; 
 Tue, 06 Feb 2024 15:29:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWn7QpGTl7tuRLSbSHbLtGrThhE2QQZsdD9HxTI/kAsC/lMTLONidoD6JCzM4ob3KPWP151kUMo+jzEzuM+UC8wdgldgzf37xpaeBke52O5TawY5b38PM0mGH3xDU2b6JWiYFdqnSod3g7qxsgqhq9mU5ElK0F+N0/QSvBRu0NOauUzVM/YI3xwAe0GAk8g5IXS6k6mXVmta5VKDZWRNdPl5eNHryvxOfFf2RL3LsIi/GrN8CkwJuzj4tWlzKgeiWQdDiC1lrVe1V7mTd+f0FqAYx8ZMSNj8EYdfyvyfiGXRDJI+JBBIC7h6iKFM3Js0FdA67hhhvAOv3uCfc7PBPZyI/0U22PR6z/HqKjTFVc5vwuVl1L173g0YV21h1qV0wU0fscwC9//3ZVFw34sQ2ZnxH9Ptqtr827WwoHmAygiQTQSuYO/KILvWvDHQdZ1KnVE5LEXsM3tbyXiO5tTaoCjWk0OcDYa5CFSJoFIvBw07fIbb0D5Duw8edAqEPvNa3jGXCJpTwm9BE09RW7sXLnFQUS1NMj9iDeg9x1TjH1gy1LaV4P/20jN6MseX+boOnNIIoHhfBD4IVdNJjVg+7rRHT3ltUwFkaT97uvZfcLAu6mUtC+T9vRpIACKvkkNYGn/6gUyUfl1x6LlErTZZM82rT7yBYgU2Tfp/SvtgzwQN5E5P6f0cQfVqCiwmIG1ZwCLKlXJa62ZfAkqLb+LqoDHAi6Bhqd3APWP4thGNPOIOyAm3csqM9bL
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a05620a167800b00783e1590ebasm1357761qko.82.2024.02.06.15.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 15:29:34 -0800 (PST)
Date: Tue, 6 Feb 2024 17:29:31 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Message-ID: <uihm7fwg5s6vqdmkz3poasuukdhuc4ztep7doqxnvhhsbfmfop@iikjtrb4jwoi>
References: <20240206212734.1209920-1-quic_abchauha@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240206212734.1209920-1-quic_abchauha@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 07 Feb 2024 08:26:35 +0000
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1] TSO and TBS cannot co-exist. TBS
 requires special descriptor to be allocated at bootup. Initialising Tx
 queues at probe to support TSO and TBS can help in allocating those
 resources at bootup.
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

Hey Abhishek,

Thanks for the patch!

This is a new feature for netdev, so the Subject should have "net-next"
in it: https://docs.kernel.org/process/maintainer-netdev.html#tl-dr

Another thing, the kernel is very particular about the commit messages.
I thought checkpatch.pl would complain about the subject line, but
surprisingly it didn't.

Usually going with a "when in rome" approach is good (i.e. take a look
at the git log). So here something like:

    "net: stmmac: dwmac-qcom-ethqos: Enable TBS on all queues but 0"

would be better. Its a short one line subject, that has the appropriate
prefix, etc. You could then embed the information about TSO and TBS
being exclusive, and maybe explain your reasoning on why this allocation
of queues (TSO on 0, TBS on the rest) was done.. etc in the body. Maybe even
pointing to the similar NXP related patch Esben posted recently would be
smart since your motivation is the same:

    commit 3b12ec8f618ebaccfe43ea4621a6f5fb586edef8
    Author: Esben Haabendal <esben@geanix.com>
    Date:   Fri Jan 26 10:10:42 2024 +0100

        net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings

        TSO and TBS cannot coexist. For now we set i.MX Ethernet QOS controller to
        use the first TX queue with TSO and the rest for TBS.

        TX queues with TBS can support etf qdisc hw offload.

        Signed-off-by: Esben Haabendal <esben@geanix.com>
        Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
        Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
        Signed-off-by: Paolo Abeni <pabeni@redhat.com>

i.e. something like (please make it your own):

    In a similar vein to 3b12ec8f618e
    ("net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings"),
    let's leave TSO enabled on queue 0 and enable TBS on all other queues.
    This allows using the etf qdisc with hw offload on the TBS enabled
    queues.

On Tue, Feb 06, 2024 at 01:27:34PM -0800, Abhishek Chauhan wrote:
> TX queues with TBS can support etf qdisc hw offload.
> 
> Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..d2f9b8f6c027 100644
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
> +	/*Enable TSO on queue0 and enable TBS on rest of the queues*/

nitpicky: Please put spaces between the comments

> +	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
> +		plat_dat->tx_queues_cfg[i].tbs_en = 1;
> +
>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }
>  
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
