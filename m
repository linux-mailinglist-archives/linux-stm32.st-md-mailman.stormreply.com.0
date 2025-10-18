Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5722BEC2F6
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Oct 2025 02:44:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C89BC57B42;
	Sat, 18 Oct 2025 00:44:41 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63E39C57A42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 00:44:40 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-290b48e09a7so27318595ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 17:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760748279; x=1761353079;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3QafKpBA9ev9tZ8RtBiTe7ilN8YrDWJs4uzq+MACIIs=;
 b=WdIM8/fhbPg3HzL4C9DtiSTzxYcb4AgIs/GOM1rE2+H0FHH7RvTM+LEd5h5Q3rTG8K
 6Yq1NoCDytN2P6UszzP9QW7EPWCz6zXnsouSBjkRB8Js5sN/TYEO1Pqbm/ck9rUkjtGE
 ZIYf829LL+H5tLKta9ewlfzOyW8dzuBgx4Yb4DynBWmhrMFc9yTb5MXE2S0GIViaaMEG
 iEbkyXXNpy4wXGGLhkmKbenxSICrEndGPxJTlnIdLy19NH0mib6oSCCOwrBy0jQVuKC8
 yVNuWtuUdGRjn0kl08EwYtRsv0KaInoiaNiizXg9DACSN3+coScv4zzgvnDTBpX16WoU
 j8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760748279; x=1761353079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3QafKpBA9ev9tZ8RtBiTe7ilN8YrDWJs4uzq+MACIIs=;
 b=hHUC5FhuAfGL1wgHf/Vum3hrEnvBCz03PJ6EorP1mYIczkOLjTJJNbYWc6vzIAYNa0
 hE7IEMv8oK2GY2FamQY4+ieQfEvXrDaP066iSC/UrIFY3jQZ0QkZtuUCOrOVcR53deZe
 qdlvGPtxlBhXrEkUr7uvnKMID7HRgfkLdD6iJdw1wMu6s2UgD3NBFGLscBpIKbyl9HZE
 rOrDW2fFLWa/a5+fO7Yy2F1/XvZu/JahSE7b9YRdjGeQC6JYzzncYYkKEqHxtv8IckBx
 EGlSus/6mDTfXPRGbkrhJYrrldXnpjM2UlfQAIG/7mOMBvhwZnS0BqBJDmiTx/em/qnR
 2F4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMppt8HX2Uq0kPWDi52C1UhZgLMBUDgCXp8CngL9YyF8ipv8cZT0C6bJzWavcH9iiRS74ErJ/IzsWMhg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yym5Eg6NzdtoONX8QBhk9IQvO2qJ+YtiXN4q4RctAegJgzgYf2R
 G/sW5DlpXS+p1IzDQL3GP3/n0OCMjPqLmtdm6hHqRnwJNm1ozf7UwADA
X-Gm-Gg: ASbGncuxavwl8CFKhRwCYWEP6XVM1kKXV/nQzAAhIFutFYeNrYjveAxP/UhKAnQd9Co
 5GJkgr9Itx5wZ9EWXkuLYA7l7QWDMtQRHbnLAlnWjsASsTnqhbgEG+UyLZT5C0iKwjMItj7ydsV
 GFlq/zdqnnVqnq/zP4rQ39z7noLmBXknOIjtOxFXHb9nox7afaTEj9QfBNd1rLGaLcO2Z5xj6ji
 sIQJ72YHe7vbxOWjV9xz4rRcyUB3xOnmdTZHrwLtkCnD5iQUWoGFVLgzf9c4GgiteIibc2fxC7Y
 M0XlfiVECcf9YmvHBYlsngQKfIH6IXb0+yG3gQJPkniIZ264n7w2icbzgp4QJfqbm0Bu3LUetJn
 JELtaisqub56EDIzMSm46D1fNksdWIEtW5SRNhC33U5X2e7TwJcFP/jy7dWDoruMmEf24GNY9JW
 c=
X-Google-Smtp-Source: AGHT+IEJHzKpBZuNZNa18WS/ADFtdVavA7SE/dNX1ygVUM8SyYneHAxGCurSyYxg3cW6a8KtgONCXg==
X-Received: by 2002:a17:902:ea01:b0:267:d2f9:2327 with SMTP id
 d9443c01a7336-290c9cf2d88mr81827755ad.27.1760748278692; 
 Fri, 17 Oct 2025 17:44:38 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2924721b6fdsm7874395ad.118.2025.10.17.17.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 17:44:38 -0700 (PDT)
Date: Sat, 18 Oct 2025 08:43:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <hmch7csqotxt42snddksce2mpnjeglbgvoxs6r5qlu7v2ayxyk@zctj7xhugeln>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <20251018000548-GYA1481334@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251018000548-GYA1481334@gentoo.org>
Cc: linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
 sophgo@lists.linux.dev, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Longbin Li <looong.bin@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

On Sat, Oct 18, 2025 at 08:05:48AM +0800, Yixun Lan wrote:
> Hi Inochi,
> 
> On 09:18 Fri 17 Oct     , Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be remove
>                                                      s/remove/removed/
> > when init the mac, otherwise the phy will be misconfigurated.
> s/init/initialize/
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 25 ++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > index 3b7947a7a7ba..b2dee1399eb0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > @@ -7,6 +7,7 @@
> > 
> >  #include <linux/clk.h>
> >  #include <linux/module.h>
> > +#include <linux/property.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > 
> > @@ -29,8 +30,23 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> >  	return 0;
> >  }
> > 
> > +static int sophgo_sg2042_set_mode(struct plat_stmmacenet_data *plat_dat)
> > +{
> > +	switch (plat_dat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
> > +		return 0;
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >  static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  {
> > +	int (*plat_set_mode)(struct plat_stmmacenet_data *plat_dat);
> >  	struct plat_stmmacenet_data *plat_dat;
> >  	struct stmmac_resources stmmac_res;
> >  	struct device *dev = &pdev->dev;
> > @@ -50,11 +66,18 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> > 
> > +	plat_set_mode = device_get_match_data(&pdev->dev);
> > +	if (plat_set_mode) {
> > +		ret = plat_set_mode(plat_dat);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> >  }
> > 

> >  static const struct of_device_id sophgo_dwmac_match[] = {
> > -	{ .compatible = "sophgo,sg2042-dwmac" },
> > +	{ .compatible = "sophgo,sg2042-dwmac", .data = sophgo_sg2042_set_mode },
> I'd personally prefer to introduce a flag for this, it would be more readable and
> maintainable, something like
> struct sophgo_dwmac_compitable_data {
> 	bool has_internal_rx_delay;
> }
> 
> then.
> 	if (data->has_internal_rx_delay)
> 		sophgo_sg2042_set_mode(..)
> 
> 
> >  	{ .compatible = "sophgo,sg2044-dwmac" },
> >  	{ /* sentinel */ }
> >  };

Yeah, I think this is a good idea, thanks.

Regards,
Inochi

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
