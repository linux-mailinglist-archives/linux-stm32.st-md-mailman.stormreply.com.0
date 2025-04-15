Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FBFA897AB
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 11:14:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD154C78F68;
	Tue, 15 Apr 2025 09:14:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A531DCFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744708491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xBj6wYND6XkoPsEsHNHqa6He4rhHss1QsFv4wuPqUQ=;
 b=b9hH2PkubbKFvEiaoqCSk4hyKnsX1lEvmVzyBmwGB/Xt1EG80je2FgdT1cnfaZlKBLnEK2
 85Vd9I3JnCGctCeZVz8nIWCwjObi523m2OfFUa88wuIuSZLtert/1MfyBkgW2wBmRe9vK6
 CHaB60DjYvFD9ryM414kKd3p2abhZtc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-BSs3Qn65N0yRbWNY7jdwtw-1; Tue, 15 Apr 2025 05:14:49 -0400
X-MC-Unique: BSs3Qn65N0yRbWNY7jdwtw-1
X-Mimecast-MFC-AGG-ID: BSs3Qn65N0yRbWNY7jdwtw_1744708489
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43eed325461so32277255e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 02:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744708489; x=1745313289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0xBj6wYND6XkoPsEsHNHqa6He4rhHss1QsFv4wuPqUQ=;
 b=MDHxZuo0GR6YtulDvWSGC2w0VnkosuXrR31QQHn4TEQPH1KBpcS9VqB3AVHOSqjZr7
 6Ht6Tdhwg/5j2KEy6GakK8DlkRZr73hvNmVOauzHH4+ASarf3D3FomDHrxokH0ODv4xJ
 Uu3ws5J70g71Q6fOFZ99TRJwsE7cFuYGlP9hCfQhpBerQEkNpFzWtWeQJb4kggawwHIL
 08I5H7vgvloJVrzAJUtWApnti4fCxKArbMe2MJcgS76mF7E5rkzqhGvxeC62dKRCHPtW
 9XLcjItJ/hfcA7lZnHKRRRvvnUt3aR2W0+uNVDTt3vb7PycToxIp8fe7NapW3ZmUSFVu
 H8sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXekBxEwzFPRYcHe3nRhaZL67/06T7WAt+AXQnOJd0cyxCI/PMkLY2FzGKU3zr7LMIAJDCdooE79OxY6g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzDLLXfDgZgnDQacXojLm3XXjNIrbysGFt0cWQ1l4n97RwoNfB6
 5lw393qsAKhkCnsocFS+sBdUe4x0aS1YkqokMfw90Ifbs22XYzMaUJoNBsfE4PmZtLxMvZs678T
 UEiy85aAvLK04lf09W4LvU+QHsJ0NmsKNkoYGMyoN2LA4uEvWGGTYI89DA/+Djbl5RYnbHT4Jo1
 ax4A==
X-Gm-Gg: ASbGnctfHqhFbFHWWgr96+BhdS0enOHappWOQN7isy73PULvnpLv1+AvX/mt9KUn8Rr
 LrHCpE2AUbYVm9f9AOxGjDzUd88+7zrJGkvznL5HZ1wxF1c1gwDhuA0QleN0TZJGGGtI2Obvwmz
 Zdhc756ucuIs+S8yTcwVqvYSdCInYIe1a6MbhxjIyNzABvrV+CBhGoSmmWNTSULAApdkk4KL3Cq
 JnPh6DM5Os1Zj8HQYiTqchrLt6BolUXt5g+MD4DRAo+44xUpj9fTP8lHZuWEtAOkeNmrohBlchL
 F3E/Bi+rmK8UCErO1NfgUzW5B4i71ax58FList8=
X-Received: by 2002:a05:600c:4704:b0:43b:d0fe:b8ac with SMTP id
 5b1f17b1804b1-43f3a9af837mr161581255e9.30.1744708488745; 
 Tue, 15 Apr 2025 02:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfovw9rzSF7/UhE9C8ntddanjESFbdGIFJq3+2VnKz80vs7HYJjirXobBVEqXPkTQJgbF6JA==
X-Received: by 2002:a05:600c:4704:b0:43b:d0fe:b8ac with SMTP id
 5b1f17b1804b1-43f3a9af837mr161580875e9.30.1744708488359; 
 Tue, 15 Apr 2025 02:14:48 -0700 (PDT)
Received: from [192.168.88.253] (146-241-34-52.dyn.eolo.it. [146.241.34.52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9797aasm13673088f8f.56.2025.04.15.02.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:14:47 -0700 (PDT)
Message-ID: <6851d6b8-109c-4de0-89a8-a56659c87cf4@redhat.com>
Date: Tue, 15 Apr 2025 11:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org
References: <20250410070453.61178-1-minda.chen@starfivetech.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250410070453.61178-1-minda.chen@starfivetech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5LQk7bvxnPDHkfQKl84KwZvkLbnzA2mhGnCr9qXw2HQ_1744708489
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [net-next v1] net: stmmac: starfive: Add serdes
 PHY init/deinit function
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

On 4/10/25 9:04 AM, Minda Chen wrote:
> To support SGMII interface, add internal serdes PHY powerup/
> powerdown function.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 2013d7477eb7..f5923f847100 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -9,6 +9,8 @@
>  
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>
>  #include <linux/property.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> @@ -28,6 +30,7 @@ struct starfive_dwmac_data {
>  struct starfive_dwmac {
>  	struct device *dev;
>  	const struct starfive_dwmac_data *data;
> +	struct phy *serdes_phy;
>  };
>  
>  static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> @@ -80,6 +83,26 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return 0;
>  }
>  
> +static int starfive_dwmac_serdes_powerup(struct net_device *ndev, void *priv)
> +{
> +	struct starfive_dwmac *dwmac = priv;
> +	int ret;
> +
> +	ret = phy_init(dwmac->serdes_phy);
> +	if (ret)
> +		return ret;

This is called also in case of PM suspend/resume. Do you need to keep
the init here, or should that moved at probe time only? Similar question
for phy_exit() below.

Thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
