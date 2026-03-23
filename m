Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PyVCzLewGn6NQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 07:31:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BFA2ED133
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 07:31:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3695FC87EBD;
	Mon, 23 Mar 2026 06:31:13 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B7FFC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 06:31:12 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-829ac4670c4so2898138b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Mar 2026 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774247470; x=1774852270;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=;
 b=ioOdqSQHf6ZHe9NFvaFiAqn9AfKKH+G5pM7JOm8mk3EEdqqQLXkIxQ/22L/AzhjZdE
 WpAHPHoT4wa0uohc9wTitXtLkgmfpfKUc9Qokzlcv8gCumw3DcIuZT019aYwpTgFEibK
 fCU/BIQlYXEJgrr+gZnxICMJGw6E8vnFj9bORF4J4ymn/Q0owL1lJ34Pc8352ymyVKhY
 bnlYxd9rvTbRkZsjPuxrvc9zHgBh+lDwfEPPi2x0svBX5zUaQFiIJgm9dETPDcCP+oh9
 x7azdS6CRLK/cHcc2ixdoV3UA7lCGDSVaD+YkrLL5XbNTH9iXGGKWqciCkM96Wd8Dfsy
 Mwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774247470; x=1774852270;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=;
 b=kP5LyoTGXvC/pDJtukZIac/r2B37kB/GX2QMFc4tGV66mf/PPZru9iFMJ0oRhm2nL9
 EI+IM1oHteE3V09kLQZuiuWNEePCYDYBr0IYy8/Sj3qlIt7hjSA2hiFHL67m6/TlWq5t
 WqrLof8w56WPvenwse6dfpU9W8MbLqtjMjj1ldGKe5ySOyTjkG2/B+kCFq+7dgugYar0
 eToL8cRbqX/RSruHdQApC/tRlzN6SXexBKEDl4f1wm81AjAO1L/hNpO6adsH4DDW3SbT
 laRyoI2q046Okh1Xd6xCJDZAysMzq9y8u+gWE8i3JGvVmT1ZcmnWCQs0Xxlpy4++owmk
 kydQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh84z6vNeyexzZ40khmLpvUWo8TVy5r79B7hhVZFKUcw/BmEWS6OKHgRpEswdaMkGrya4chXqfsL9Vcw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy3kAStEYo9zwRAR7JHQDcwfgYM4dwUCLQ3WSUZI/mLednPAYWQ
 oZ04Bujpi2ggkJSGouDWZMCahbJqwm+8W21PPq/t8xHBuwCaki5DrP/Q
X-Gm-Gg: ATEYQzxpLk8GnCEgR2oPAgCw4H5H9KHtZ6kb7pAsjJBksLNTLBfuGenI0XNel3tFzhl
 fgm5i1f/a9ZokUf1eMrbhQIYdkQvJi3vasAxuYVP8kQ4sZiZy2JeYOG96xa96A3+cfxuuOUK3/K
 cXiz2Uj8AJ87iKNdAvqqbZWDYJdCWfrQy0kIzo4u68PAFyRPFxAanvFOiDrfQJHAADey9rZnkMQ
 LIpws7ubZel4rEj+WqMTK2TzJNEI15W5uZuhamCoFixj7oe28bkHJCqirB944BRumuWkJg0+FWz
 D9uahTVngcQK2TZaZJI60FR9/+yIjXuDPQxwqaDUSDQoTaRbefjFQolCb8LWHg4pKR2nQaYMG3n
 kdNHMjVsSE/fz7KsMH1EspfAmfXBmv5rKbUI7ypzgNlJ+QJlPkSE2Y2gHJJKfwbaUk+V+5y8i5T
 jj/KKyz66T6L64h3HopvT/EZN89izPWL74DFHQybzW9wZWugz+v308Xr9p5YwHMn+aTX1hA9Y/9
 yen
X-Received: by 2002:a05:6a20:7f82:b0:398:919a:ddf5 with SMTP id
 adf61e73a8af0-39bce9e9efemr10260089637.24.1774247470439; 
 Sun, 22 Mar 2026 23:31:10 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c743a938743sm6476741a12.19.2026.03.22.23.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Mar 2026 23:31:09 -0700 (PDT)
Message-ID: <e381ce59-c13d-4cb4-b0d3-70f15a500999@gmail.com>
Date: Mon, 23 Mar 2026 14:31:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Horman <horms@kernel.org>
References: <20260316055427.1310569-4-a0987203069@gmail.com>
 <20260318082346.1825390-1-horms@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260318082346.1825390-1-horms@kernel.org>
Cc: andrew@lunn.ch, ychuang3@nuvoton.com, edumazet@google.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next, v14,
 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35
 family
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:horms@kernel.org,m:andrew@lunn.ch,m:ychuang3@nuvoton.com,m:edumazet@google.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:openbmc@lists.ozlabs.org,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,nuvoton.com,google.com,st-md-mailman.stormreply.com,kernel.org,lists.ozlabs.org,synopsys.com,redhat.com,vger.kernel.org,gmail.com,st.com,lists.infradead.org,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: B2BFA2ED133
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/18/2026 4:23 PM, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
>
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac
> driver.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> [ ... ]
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> [ ... ]
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> @@ -0,0 +1,136 @@
> [ ... ]
>
>> +static int nvt_gmac_probe(struct platform_device *pdev)
>> +{
>> +	struct plat_stmmacenet_data *plat_dat;
>> +	struct stmmac_resources stmmac_res;
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *priv;
>> +	int ret;
>> +
>> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
>> +
>> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>> +	if (IS_ERR(plat_dat))
>> +		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
>> +
>> +	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
>> +							    1, &priv->macid);
>> +	if (IS_ERR(priv->regmap))
>> +		ret = dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
>> +
>> +	if (priv->macid > 1)
>> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>>                                                                                    ^^^^
> Does this code return the error on failure? The dev_err_probe() result is
> assigned to ret but the function continues execution without returning.
>
> Russell King's v12 review suggested using set_phy_intf_sel callback,
> which led to significant refactoring in v12. This refactoring appears to
> have inadvertently broken the error handling here and below.
>
> The code should be:
> 	if (IS_ERR(priv->regmap))
> 		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
>
> 	if (priv->macid > 1)
> 		return dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>
> See Russell's v12 review:
> https://lore.kernel.org/netdev/aYsurPBMnzWDZCco@shell.armlinux.org.uk/

Sorry for missing that, I'll fix it so that function properly returns 
failure.

Joey

>
>> +
>> +	plat_dat->bsp_priv = priv;
>> +	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
>> +
>> +	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>> +}
> [ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
