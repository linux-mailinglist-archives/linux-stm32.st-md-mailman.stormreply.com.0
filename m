Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C18899C5545
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 12:03:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 772D2C78F80;
	Tue, 12 Nov 2024 11:03:25 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ADDEC78F7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 11:03:18 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so7133037a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 03:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731409397; x=1732014197;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=iPcFHCJG8NGsuskBY+kZ5XWMDYsQmMFc2+wJS3PWRtM=;
 b=HQkAkA8ktFmYk2x5S5llQ7mxaRwJoKQyBLCEd4Q2S5vsHruf7Z1bgmiTq24q4EF+uC
 b75oY+fhnDWSL543W7QRt2yk2o0zRnrGyun+wDVy/ij+nx7AWReg2gT2nlZTJkzZKCaN
 W/EWC0urOormIpXEcOQJOPzpk2cRv/O35lsgprBZpo91Y0AJiRrLekffyvhPjngjSwSi
 2JDAUtOxd6lLWTVwiCz+q9zM3VtahUhlSkT2mriVrVIyRMS2k+a/HrfAkvu7OQVWeRun
 CKshZXHZcZLQmBJIr1ttj5Mpv9qmNmdSuIP0wLDMI022/QdgfYwlQmls358J6AlRzSeS
 wefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731409397; x=1732014197;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPcFHCJG8NGsuskBY+kZ5XWMDYsQmMFc2+wJS3PWRtM=;
 b=KpnrM62581aUhvafLldOr+PjuYK3hwfZ7yi8h1SOyU13hp7trVdrXkR8/ECeci5saO
 qz0lxefVVzjz/A8mZ318l1WO1/tWZ8DRXR9PmVUUDmY1Wdszw/Gi7rgBzG+4MfKmqt97
 unSYq8NWTYhp0s3Ac2DYfXkiAR+5M5vXcRBU0hGRA9Ja/OF3mvqJ7i8KMYvKwCYd0Y77
 5DO3uCARv5Jl20PiNQn1q+HnOOSxjXWUS5Ix6ycRaO6ry6pDDw3GFVKtpQ7qn/HFtMTO
 WhH/WIRMVDEScVKSqYpL0WYX6UfpeVT9KCsMG2uzjxtf/rL99p0roEkK0kEHbJ2RO46Z
 emRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp5Lofb490ACHCxP+Zb3vO+lLItmHYRcfd/a6mr7WK8kXywKeNAs3QAVdrpxEmn7DFHVVvNhpCFoAHog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwMdO+IDwh/RwDMs3okDmMaduNZFDX4SSsm+4Rgg9sI+JCghlZZ
 t9K5ldLK1TWJqgz4lLAsGw5JjEUV+ojRGXRZTKJFfoofcQWJ3WBz
X-Google-Smtp-Source: AGHT+IHX4cUH9pyL7LKsapletYqx2kvV8JoES6EsVn/ceuKd30jkLRNMQcJatb/QouJT6jLYgTQnMA==
X-Received: by 2002:a05:6402:254b:b0:5cf:45c2:981a with SMTP id
 4fb4d7f45d1cf-5cf45c29904mr4046359a12.34.1731409397257; 
 Tue, 12 Nov 2024 03:03:17 -0800 (PST)
Received: from ?IPV6:2a02:3100:a46e:ea00:90f0:9049:6891:55f?
 (dynamic-2a02-3100-a46e-ea00-90f0-9049-6891-055f.310.pool.telefonica.de.
 [2a02:3100:a46e:ea00:90f0:9049:6891:55f])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03c4ecaesm5872673a12.70.2024.11.12.03.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 03:03:16 -0800 (PST)
Message-ID: <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
Date: Tue, 12 Nov 2024 12:03:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] net: phy: Introduce
 phy_update_eee() to update eee_cfg values
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

On 12.11.2024 08:24, Choong Yong Liang wrote:
> The commit fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
> introduced eee_cfg, which is used to check the existing settings against
> the requested changes. When the 'ethtool --show-eee' command is issued,
> it reads the values from eee_cfg. However, the 'show-eee' command does
> not show the correct result after system boot-up, link up, and link down.
> 

In stmmac_ethtool_op_get_eee() you have the following:

edata->tx_lpi_timer = priv->tx_lpi_timer;
edata->tx_lpi_enabled = priv->tx_lpi_enabled;
return phylink_ethtool_get_eee(priv->phylink, edata);

You have to call phylink_ethtool_get_eee() first, otherwise the manually
set values will be overridden. However setting tx_lpi_enabled shouldn't
be needed if you respect phydev->enable_tx_lpi.

> For system boot-up, the commit 49168d1980e2
> ("net: phy: Add phy_support_eee() indicating MAC support EEE") introduced
> phy_support_eee to set eee_cfg as the default value. However, the values
> set were not always correct, as after autonegotiation or speed changes,
> the selected speed might not be supported by EEE.
> 
> phy_update_eee() was introduced to update the correct values for eee_cfg
> during link up and down, ensuring that 'ethtool --show-eee' shows
> the correct status.
> 
> Fixes: fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> ---
>  drivers/net/phy/phy_device.c | 24 ++++++++++++++++++++++++
>  include/linux/phy.h          |  2 ++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 499797646580..94dadf011ca6 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -3016,6 +3016,30 @@ void phy_support_eee(struct phy_device *phydev)
>  }
>  EXPORT_SYMBOL(phy_support_eee);
>  
> +/**
> + * phy_update_eee - Update the Energy Efficient Ethernet (EEE) settings
> + * @phydev: target phy_device struct
> + * @tx_lpi_enabled: boolean indicating if Low Power Idle (LPI) for
> + * transmission is enabled.
> + * @eee_enabled: boolean indicating if Energy Efficient Ethernet (EEE) is
> + * enabled.
> + * @tx_lpi_timer: the Low Power Idle (LPI) timer value (in microseconds) for
> + * transmission.
> + *
> + * Description:
> + * This function updates the Energy Efficient Ethernet (EEE) settings for the
> + * specified PHY device. It is typically called during link up and down events
> + * to configure the EEE parameters according to the current link state.
> + */
> +void phy_update_eee(struct phy_device *phydev, bool tx_lpi_enabled,
> +		    bool eee_enabled, u32 tx_lpi_timer)
> +{
> +	phydev->eee_cfg.tx_lpi_enabled = tx_lpi_enabled;
> +	phydev->eee_cfg.eee_enabled = eee_enabled;
> +	phydev->eee_cfg.tx_lpi_timer = tx_lpi_timer;
> +}
> +EXPORT_SYMBOL(phy_update_eee);
> +
>  /**
>   * phy_support_sym_pause - Enable support of symmetrical pause
>   * @phydev: target phy_device struct
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index a98bc91a0cde..6c300ba47a2d 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -2004,6 +2004,8 @@ void phy_advertise_eee_all(struct phy_device *phydev);
>  void phy_support_sym_pause(struct phy_device *phydev);
>  void phy_support_asym_pause(struct phy_device *phydev);
>  void phy_support_eee(struct phy_device *phydev);
> +void phy_update_eee(struct phy_device *phydev, bool tx_lpi_enabled,
> +		    bool eee_enabled, u32 tx_lpi_timer);
>  void phy_set_sym_pause(struct phy_device *phydev, bool rx, bool tx,
>  		       bool autoneg);
>  void phy_set_asym_pause(struct phy_device *phydev, bool rx, bool tx);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
