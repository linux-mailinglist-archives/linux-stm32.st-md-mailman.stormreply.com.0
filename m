Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFW0LQM5gGlX4wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Feb 2026 06:41:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0F8C8567
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Feb 2026 06:41:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3EF0CFAC40;
	Mon,  2 Feb 2026 05:41:22 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96669C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Feb 2026 05:41:21 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c2dd0c24e5cso1548569a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Feb 2026 21:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770010880; x=1770615680;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w/OodEpFjOF1QKMpfh/He7lSljXTwFAUK5yvvx1mDI8=;
 b=d/v3tN0yf1pJF7c5D9+3R/9VKDQeXY6FbFd4uEv7cIGsoJoTpXFHmrNRVJS5G4buVr
 nHBAfkXobNAAqO1S3EuwbvydM+Cc8FQoL7AC7uVxjzlQMhM8WMlSqmADOoClDBcaVPkh
 8jYFqGMRMXK7LMziA+xN3KEQiHXHbLxFXBINnU5EcVySVKpc7mtpG15sye8GbsATLsX7
 JpEfpod6OJcNyTqILbPLsBxpETP7goFxI3zWa6/Ze2DDykAhkORXzGVgOH2A8CE713ul
 PBcQJXsGEkFcIPn8trb3cHUq3J4XT7F6l8ynAzHKiKRZvIaX4iHTWaoXM8YxR78J2vu5
 obWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770010880; x=1770615680;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w/OodEpFjOF1QKMpfh/He7lSljXTwFAUK5yvvx1mDI8=;
 b=B5tc2FCFeQV47lIYra2HtNeX05J7Ce85qMQLlL7nqm9x6IrkQZjVpcX4KgQQD93URJ
 VmZwuQQAagMotRBIe1PuXIccWxfPrQa/0AafR3QuJDEFVRlsy7HRe39hPywU1SP+HtM8
 ur4JvTUv1rydh5i8Rh0waIzueviJh73+YicH6AyhsaFiqE+cjXroQHDmZTiZt7ycGueD
 PIPnVHo38H0hiZJZTfBkJoXMENQBo8or0XeHpjQbQfpAwgwVvkuyFIWdSRzF9B7rbNtV
 QatszY2eb1XLn+SVFFMj6cBc1jKIc9dRDut84WankEccbEPA5Xw+1MOymS4K9AnnwuL5
 zPnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX99qEDgJ+5DtON5/9Wg7oKj7v+iJSYPwCPbTkzTDNNGOTc3+JINtmUSdZ+3qIOWKxg9HhI54gLlsWBXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy7szi86ooUPc7bC1t1WrUS9utODNdIXBpLIq5xrqWiKOk5Ljqr
 KfQoSNhCOUBRucGHIdolb8Z25wWDPFRhdL3Klui5NpWxP5rggWCXNmUw
X-Gm-Gg: AZuq6aJwR6C2hJDStWyughBlWbOJC2DY4QkENQ0fdY3YW3QOTJzASID9u8Ko3ZwVuJy
 V1V81RvrrZk8TzB+am5jghF2djuRRKgx7BFOeYhRn74U8HIImhlhqZi3uzUK0vxsnh0w2mGQF22
 BcZh9BbUoHg/StnASOr9Gny4SmZFm/nvQLRR4iMg53QCe0yiNfLuJdRX2B/IuCGLUaPXY1scyjF
 NNWu2euFdAPnIsTtDFiZagvKytd1GvPi6CH6U4Yosd52brULNer51KAQ4hpEXsJqoa5YbyKj3hj
 QezYLY/S8aQZykAPHvyz2PMBOJFFW8dnTtfEZLdIz8iITaRajIdXde/ePEmA0ss1xrwRz70GyM8
 erBlAU8m5Pl/Ewldae/rEEqD22xB0r6GUQ55+osBpPB9e4+1f8R+8zHO7800sfTgRM70gp/Cb04
 xxLXaFVXK71WQPOxTXK2GwD/boBN2YnzoSqXf1Vg/e3ZyC/TGN/3zzqvi6hZJnKhwQ4b6XvCywY
 /g=
X-Received: by 2002:a05:6a20:12d6:b0:351:2c6e:6246 with SMTP id
 adf61e73a8af0-392e0148042mr8658013637.56.1770010879891; 
 Sun, 01 Feb 2026 21:41:19 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c64276efb16sm13296475a12.4.2026.02.01.21.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 21:41:19 -0800 (PST)
Message-ID: <217f7407-ede2-4be8-bbd8-f2e499170e24@gmail.com>
Date: Mon, 2 Feb 2026 13:41:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20260129054445.416242-4-a0987203069@gmail.com>
 <20260131015008.970729-1-kuba@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260131015008.970729-1-kuba@kernel.org>
Cc: andrew@lunn.ch, ychuang3@nuvoton.com, edumazet@google.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next, v10,
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
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:ychuang3@nuvoton.com,m:edumazet@google.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:openbmc@lists.ozlabs.org,m:joabreu@synopsys.com,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 4F0F8C8567
X-Rspamd-Action: no action


On 1/31/2026 9:50 AM, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
>
> Adds Gigabit Ethernet support for Nuvoton MA35 series SoCs using
> the stmmac driver framework.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> [ ... ]
>
>> +static struct nvt_priv_data *
>> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *bsp_priv;
> [ ... ]
>
>> +	bsp_priv->regmap =
>> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
>> +	if (IS_ERR(bsp_priv->regmap)) {
>> +		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
>> +		return ERR_PTR(-ENODEV);
>                             ^^^^^^
>
> Should this propagate the actual error code from
> syscon_regmap_lookup_by_phandle_args() instead of always returning
> -ENODEV? If the syscon lookup returns -EPROBE_DEFER, this will lose
> that error code and prevent the driver from properly deferring its
> probe when dependencies aren't ready yet.
>
> Other dwmac drivers (dwmac-loongson1, dwmac-starfive, dwmac-sun8i) use
> something like:
>
>      return dev_err_probe(dev, PTR_ERR(regmap), "...\n");
>
> or
>
>      return PTR_ERR(regmap);
>
> to propagate the error.

Thanks for pointing this out. I'll fix it in the next revision.

Joey

>
>> +	}
> [ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
