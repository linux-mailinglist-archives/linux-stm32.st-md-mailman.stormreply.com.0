Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9552C33C9
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 23:22:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EBAEC56630;
	Tue, 24 Nov 2020 22:22:12 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAB57C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 22:22:09 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i2so4219wrs.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 14:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Zjy5WrLgbZYh4W/KRF1nXj3IJsH6phdhD0tx3ox+N7A=;
 b=gSRABH986L+Cgqpbjk8+wlggkwGG0ANS5k6+DL+6zTXCmCApeMZRYbkpdJNeoooQ60
 bLA4DM8Rn38LubWajqpMlDMKyjEXiLwbafuDUPgyGjeTpWyJ6GuLKSQ7Yxjd1MaQjrJB
 gguoJR/hgrY5oIh3HCP8Cha2TC5rF2Qg8yOwGTu8IXPAqWWLbgMAfHFVxFSpFxszgfps
 N6fjlgFsqYO9XvjnvflJxfS9AgsBioj0ZoC2o4lXk351VhZAewFMaSGp8NIUyWEJmO9J
 0Qqdxs+ijBtXjL/gsB+A3PQ5ekI+YTMp68zOAQ6Vrt5Okg1ZeMhCpQYCpEqifMqDLqwt
 oyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=Zjy5WrLgbZYh4W/KRF1nXj3IJsH6phdhD0tx3ox+N7A=;
 b=EIOO6bLeli6nhP8rzLE6OLbwchx3oyp9Z/u2LAYCwHHevgo4FAgjeArfX1RgqJU/D8
 1fasgepCu2q5Uq4CjvYMASQcPzgtBAQfiicQ3DBlJx/T7YtDQQTSR2m5x83cD9mGErW9
 k6BMt97RXuP9TZIxQ7QbiolmafWG6XjwxWt77311crLGcmNkATVEpRu1Rzx3LZcIHIUf
 KEidqA+wnXuyjJvvoAmMaE+unfxw6BUfi3MoMaKIFoP6Ac2kbg54ws1D1ui2Ivcj3nso
 nVP+5MH31YNug0I00u+ejwQzSh4I8OPUo3wWFfS24gb5TrIiAzy0aWFwh0F1b2WffHFt
 FiDw==
X-Gm-Message-State: AOAM532xsHIJRYAzrvzlISwzIRiDnYSRiVEdudeU9HrS2UMk5XWH4/dg
 I3g6gXalH+DNShwHwR7oWaU=
X-Google-Smtp-Source: ABdhPJxYZpUpEtEGo235T6saHwlCQ9Ta+1cHzalvVzG+vViJeTKCRZk93xdh0Cwed981euVdDzKGBA==
X-Received: by 2002:a5d:67c5:: with SMTP id n5mr668390wrw.179.1606256529444;
 Tue, 24 Nov 2020 14:22:09 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:145e:bd05:1fb8:712a?
 (p200300ea8f232800145ebd051fb8712a.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:145e:bd05:1fb8:712a])
 by smtp.googlemail.com with ESMTPSA id k81sm1140599wma.2.2020.11.24.14.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 14:22:08 -0800 (PST)
To: Antonio Borneo <antonio.borneo@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Yonglong Liu <liuyonglong@huawei.com>,
 Willy Liu <willy.liu@realtek.com>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124215932.885306-1-antonio.borneo@st.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <7d8bf728-7d73-fa8c-d63d-49e9e6c872fd@gmail.com>
Date: Tue, 24 Nov 2020 23:22:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124215932.885306-1-antonio.borneo@st.com>
Cc: linux-kernel@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 linuxarm@huawei.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] net: phy: realtek: read actual speed
 on rtl8211f to detect downshift
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

Am 24.11.2020 um 22:59 schrieb Antonio Borneo:
> The rtl8211f supports downshift and before commit 5502b218e001
> ("net: phy: use phy_resolve_aneg_linkmode in genphy_read_status")
> the read-back of register MII_CTRL1000 was used to detect the
> negotiated link speed.
> The code added in commit d445dff2df60 ("net: phy: realtek: read
> actual speed to detect downshift") is working fine also for this
> phy and it's trivial re-using it to restore the downshift
> detection on rtl8211f.
> 
> Add the phy specific read_status() pointing to the existing
> function rtlgen_read_status().
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Link: https://lore.kernel.org/r/478f871a-583d-01f1-9cc5-2eea56d8c2a7@huawei.com
> ---
> To: Andrew Lunn <andrew@lunn.ch>
> To: Heiner Kallweit <hkallweit1@gmail.com>
> To: Russell King <linux@armlinux.org.uk>
> To: "David S. Miller" <davem@davemloft.net>
> To: Jakub Kicinski <kuba@kernel.org>
> To: netdev@vger.kernel.org
> To: Yonglong Liu <liuyonglong@huawei.com>
> To: Willy Liu <willy.liu@realtek.com>
> Cc: linuxarm@huawei.com
> Cc: Salil Mehta <salil.mehta@huawei.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-kernel@vger.kernel.org
> In-Reply-To: <20201124143848.874894-1-antonio.borneo@st.com>
> 
> V1 => V2
> 	move from a generic implementation affecting every phy
> 	to a rtl8211f specific implementation
> ---
>  drivers/net/phy/realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
> index 575580d3ffe0..8ff8a4edc173 100644
> --- a/drivers/net/phy/realtek.c
> +++ b/drivers/net/phy/realtek.c
> @@ -621,6 +621,7 @@ static struct phy_driver realtek_drvs[] = {
>  		PHY_ID_MATCH_EXACT(0x001cc916),
>  		.name		= "RTL8211F Gigabit Ethernet",
>  		.config_init	= &rtl8211f_config_init,
> +		.read_status	= rtlgen_read_status,
>  		.ack_interrupt	= &rtl8211f_ack_interrupt,
>  		.config_intr	= &rtl8211f_config_intr,
>  		.suspend	= genphy_suspend,
> 
> base-commit: 9bd2702d292cb7b565b09e949d30288ab7a26d51
> 

Pefect would be to make this a fix for 5502b218e001,
but rtlgen_read_status() was added one year after this change.
Marking the change that added rtlgen_read_status() as "Fixes"
would be technically ok, but as it's not actually broken not
everybody may be happy with this.
Having said that I'd be fine with treating this as an improvement,
downshift should be a rare case.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
