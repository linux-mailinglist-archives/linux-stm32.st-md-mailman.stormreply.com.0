Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 027883CD635
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jul 2021 15:57:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DCC1C57B6B;
	Mon, 19 Jul 2021 13:57:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64270C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 13:57:48 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so11610826wmf.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fHSWNGrkSNMuhKj8Y5R+6EmJuzKK0O4I+/H5FE1TxZI=;
 b=ehvH3h10VqLMU2d3VGggNensqAWDt36VXVH5tFmiAP2rYqogx9g5rn3sBXySowE2jz
 YqBF7ymr2swE3J9gm4/udp6mzcJPc8St+1m+29O1usWEyWqjHID7BUTkd/rgk4PNY4KW
 LfHsXs31hQ5SGUQ1N1qWm5vzPAAi1Y7OQsif0DqlgUhjc9jKZ/10ugFAHQDUfXFB5j9Y
 Z0HAbJkxeXBdbVSfVPtpYIniNE5fkq7kKi4Nq2X6cr+/nXFDiVmDUuD+IZ4XbwJCMLxa
 2VKmMeg5JioLqJxXkB9bv/6W1SEc5rFgQ6gkXfqRo0z0gRqisFCqQ6CpGOlEeWM6z36S
 ghxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fHSWNGrkSNMuhKj8Y5R+6EmJuzKK0O4I+/H5FE1TxZI=;
 b=BeN1N/ZzyzSHomCi1CuMnNoLNWj+XCAnZJULcMRGopST85oESvHT3hXBXNJVWPQ6L/
 6wa/FY+0jQ6Kvmzg9B7jXdwtjN/U/GHgAs0gLjpGdCMcU3Rgeafjs+5q9+luyRoOKQBt
 9Um/irX/Lv/fr9oAHtrxN/00UC6SmTbTgWLw1qhqCcSLrvUAatxxrHgfUrwOHVt1TqXy
 N6gH3ZhajJx9OCipeAzpmJO2zGIV1Yxi9Kd3MEhXeIckYAo/f9JhvyqEwt3jWYZGp6ih
 k2zJqfZoJ3KaeO4QEHxzD2EJjzCwQNhDdfom0jhtL824/gmBdlHsAfGbadLnGX9YxVAP
 AsEw==
X-Gm-Message-State: AOAM533wsMW+vATqQds6l1FmqZECjKiof62ySzYpaHwS5al6mDdA2V4Z
 DKAb/yfLoffnaTKLV81LETk=
X-Google-Smtp-Source: ABdhPJxpZVyKzzV95B4qNAECc1RYoS1nhyoGQQlnOYEssfAtJiFFn2/iqqNnkBxzcHukNwvcPwR5EQ==
X-Received: by 2002:a05:600c:1c08:: with SMTP id
 j8mr26635864wms.50.1626703068197; 
 Mon, 19 Jul 2021 06:57:48 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f3f:3d00:980:d4f8:8883:9389?
 (p200300ea8f3f3d000980d4f888839389.dip0.t-ipconnect.de.
 [2003:ea:8f3f:3d00:980:d4f8:8883:9389])
 by smtp.googlemail.com with ESMTPSA id e6sm23756165wrg.18.2021.07.19.06.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 06:57:47 -0700 (PDT)
To: Hao Chen <chenhaoa@uniontech.com>
References: <20210719130845.2102-1-chenhaoa@uniontech.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <b0c93757-dd32-9d85-6f9e-12956d766661@gmail.com>
Date: Mon, 19 Jul 2021 15:57:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210719130845.2102-1-chenhaoa@uniontech.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux@armlinux.org.uk, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5] net: stmmac: fix 'ethtool -P' return
	-EBUSY
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

On 19.07.2021 15:08, Hao Chen wrote:
> The permanent mac address should be available for query when the device
> is not up.
> NetworkManager, the system network daemon, uses 'ethtool -P' to obtain
> the permanent address after the kernel start. When the network device
> is not up, it will return the device busy error with 'ethtool -P'. At
> that time, it is unable to access the Internet through the permanent
> address by NetworkManager.

At first a few formal aspects:
- You don't get a lot of new friends when posting a new version every
  few hours. Consolidate feedback and then post a new version,
  typically not more than one version per day. Mileage of maintainers
  may vary here.
- When posting a new version include a change log.
- Properly annotate the patch as net vs. net-next.
- If you declare something to be a fix, add a Fixes tag.

> I think that the '.begin' is not used to check if the device is up, it's
> just a pre hook for ethtool. We shouldn't check if the device is up
> there.
> 

Supposedly the check is there for a reason. Your statement leaves the
impression that you're not aware of why the check exists.
Therefore: First understand this, and then explain why it's safe to
remove the check. This drivers uses runtime pm, so device
might be in PCI D3 if interface is down (don't know this driver in
detail). Therefore registers may not be accessible what may impact
certain ethtool ops.

> Signed-off-by: Hao Chen <chenhaoa@uniontech.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index d0ce608b81c3..8901dc9f758e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -410,13 +410,6 @@ static void stmmac_ethtool_setmsglevel(struct net_device *dev, u32 level)
>  
>  }
>  
> -static int stmmac_check_if_running(struct net_device *dev)
> -{
> -	if (!netif_running(dev))
> -		return -EBUSY;
> -	return 0;
> -}
> -
>  static int stmmac_ethtool_get_regs_len(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
> @@ -1073,7 +1066,6 @@ static int stmmac_set_tunable(struct net_device *dev,
>  static const struct ethtool_ops stmmac_ethtool_ops = {
>  	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
>  				     ETHTOOL_COALESCE_MAX_FRAMES,
> -	.begin = stmmac_check_if_running,
>  	.get_drvinfo = stmmac_ethtool_getdrvinfo,
>  	.get_msglevel = stmmac_ethtool_getmsglevel,
>  	.set_msglevel = stmmac_ethtool_setmsglevel,
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
