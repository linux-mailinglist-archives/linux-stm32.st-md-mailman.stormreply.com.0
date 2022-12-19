Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E647650609
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Dec 2022 02:07:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BED6C65E52;
	Mon, 19 Dec 2022 01:07:12 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 051E2C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Dec 2022 01:07:10 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id x66so5204654pfx.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Dec 2022 17:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=at2ZIJN0aArK83g7h6ll8s+9NXONWJZLA6sQDdvOrT8=;
 b=X4x/cJtvxS/zc9GvbTX2iFVt5nkFOJQ6SXrXGrKrGpp8m0g1vgKbS/wq7rOtfJ+lL9
 aA/2zYMjt+84oSrJ1HqT1x6+rXBYvhVD7EtwBSL8TsTEaiwFHr7tjpFcu07kaLpKtO3I
 bnHlbwcP2U+KTb3sgqAz0YkxkGxm8jjYMpbKEv78IIeMNr+GISSTJplYUVWQC0SQEuun
 UInK4wBoKfsuJQhi6+OAoixHakcHNq6Q2j7ticPOa94nYg5UbG6jLZu+cOvrCmlK01sj
 OQD+BBi8DOcnq5yAUl4OJAiDMZK4usgJn4/SqLVXRRlpsxQQr68xlpjXb6+5UkYi2tR5
 RZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=at2ZIJN0aArK83g7h6ll8s+9NXONWJZLA6sQDdvOrT8=;
 b=slL0wTS9NESfQHvLIJdrUD1SHuqasY5dqnwj3jNevxesus1qnhGn+skC+/Iaiq/8LR
 jBLqd+YiIF4YcUCkeT41dIc0F+trX73jZy6xCIVShLQbMux+2VaTm5N6QQAREQwz+HuD
 IJhwr70pF+FtwQWe6allinRpfGtpOGkURdKqC3hXZT8EjysUUupMBftxm+z5W3VVY0+/
 ygq/lOsuDxclko/Yhu2+H6rt6Kacw6zL2D3F+Kgc2J33z4KAZLufxrK4HOXQjlJHy4eQ
 NYR6H6XRzJ2uNm7b7xi/v7QaUGmUFx70LatTCmo9b2sefjhIDt7PVn0IBrm/F8EWmSH0
 bcqw==
X-Gm-Message-State: AFqh2krYV0ZhqCnCDM5hJktUWhGfa+1mEWIjJ6/unWoElyEt51Ibas9N
 pIFvB6PeoTss7OQ1u/ERp5g=
X-Google-Smtp-Source: AMrXdXt+agRNzKN4/SqOXLSpUgul8kx/brh9hJvOqVESYpVXNkja/n92FhRpVLTAoC+oUTKgzyYMWw==
X-Received: by 2002:aa7:850c:0:b0:57f:69a8:1e04 with SMTP id
 v12-20020aa7850c000000b0057f69a81e04mr10300084pfn.26.1671412029102; 
 Sun, 18 Dec 2022 17:07:09 -0800 (PST)
Received: from cyhuang-hp-elitebook-840-g3.rt
 ([2402:7500:568:adee:c012:1ba9:3520:947a])
 by smtp.gmail.com with ESMTPSA id
 k74-20020a62844d000000b00576e4c7b9ecsm5186190pfd.214.2022.12.18.17.07.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Dec 2022 17:07:08 -0800 (PST)
Date: Mon, 19 Dec 2022 09:07:01 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20221219010656.GA6977@cyhuang-hp-elitebook-840-g3.rt>
References: <20221218160741.927862-1-sashal@kernel.org>
 <20221218160741.927862-70-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221218160741.927862-70-sashal@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: markgross@kernel.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, lgirdwood@gmail.com, djrscally@gmail.com,
 ChiYuan Huang <cy_huang@richtek.com>, Mark Brown <broonie@kernel.org>,
 mcoquelin.stm32@gmail.com, Yang Yingliang <yangyingliang@huawei.com>,
 platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH AUTOSEL 6.0 70/73] regulator: core: Use
 different devices for resource allocation and DT lookup
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

On Sun, Dec 18, 2022 at 11:07:38AM -0500, Sasha Levin wrote:
Hi,
  Thanks, but there's one more case not considered.
  It may cause a unexpected regulator shutdown by regulator core.

  Here's the discussion link that reported from Marek Szyprowski.
  https://lore.kernel.org/lkml/dd329b51-f11a-2af6-9549-c8a014fd5a71@samsung.com/

  I have post a patch to fix it.
  You may need to cherry-pick the below patch also.
  0debed5b117d ("regulator: core: Fix resolve supply lookup issue")

Best regards,
ChiYuan.

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> [ Upstream commit 8f3cbcd6b440032ebc7f7d48a1689dcc70a4eb98 ]
> 
> Following by the below discussion, there's the potential UAF issue
> between regulator and mfd.
> https://lore.kernel.org/all/20221128143601.1698148-1-yangyingliang@huawei.com/
> 
> >From the analysis of Yingliang
> 
> CPU A				|CPU B
> mt6370_probe()			|
>   devm_mfd_add_devices()	|
> 				|mt6370_regulator_probe()
> 				|  regulator_register()
> 				|    //allocate init_data and add it to devres
> 				|    regulator_of_get_init_data()
> i2c_unregister_device()		|
>   device_del()			|
>     devres_release_all()	|
>       // init_data is freed	|
>       release_nodes()		|
> 				|  // using init_data causes UAF
> 				|  regulator_register()
> 
> It's common to use mfd core to create child device for the regulator.
> In order to do the DT lookup for init data, the child that registered
> the regulator would pass its parent as the parameter. And this causes
> init data resource allocated to its parent, not itself. The issue happen
> when parent device is going to release and regulator core is still doing
> some operation of init data constraint for the regulator of child device.
> 
> To fix it, this patch expand 'regulator_register' API to use the
> different devices for init data allocation and DT lookup.
> 
> Reported-by: Yang Yingliang <yangyingliang@huawei.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Link: https://lore.kernel.org/r/1670311341-32664-1-git-send-email-u0084500@gmail.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/platform/x86/intel/int3472/clk_and_regulator.c | 3 ++-
>  drivers/regulator/core.c                               | 8 ++++----
>  drivers/regulator/devres.c                             | 2 +-
>  drivers/regulator/of_regulator.c                       | 2 +-
>  drivers/regulator/stm32-vrefbuf.c                      | 2 +-
>  include/linux/regulator/driver.h                       | 3 ++-
>  6 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 1cf958983e86..b2342b3d78c7 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -185,7 +185,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  	cfg.init_data = &init_data;
>  	cfg.ena_gpiod = int3472->regulator.gpio;
>  
> -	int3472->regulator.rdev = regulator_register(&int3472->regulator.rdesc,
> +	int3472->regulator.rdev = regulator_register(int3472->dev,
> +						     &int3472->regulator.rdesc,
>  						     &cfg);
>  	if (IS_ERR(int3472->regulator.rdev)) {
>  		ret = PTR_ERR(int3472->regulator.rdev);
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 02ea917c7fd1..d7119b92c0b4 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -5386,6 +5386,7 @@ static struct regulator_coupler generic_regulator_coupler = {
>  
>  /**
>   * regulator_register - register regulator
> + * @dev: the device that drive the regulator
>   * @regulator_desc: regulator to register
>   * @cfg: runtime configuration for regulator
>   *
> @@ -5394,7 +5395,8 @@ static struct regulator_coupler generic_regulator_coupler = {
>   * or an ERR_PTR() on error.
>   */
>  struct regulator_dev *
> -regulator_register(const struct regulator_desc *regulator_desc,
> +regulator_register(struct device *dev,
> +		   const struct regulator_desc *regulator_desc,
>  		   const struct regulator_config *cfg)
>  {
>  	const struct regulator_init_data *init_data;
> @@ -5403,7 +5405,6 @@ regulator_register(const struct regulator_desc *regulator_desc,
>  	struct regulator_dev *rdev;
>  	bool dangling_cfg_gpiod = false;
>  	bool dangling_of_gpiod = false;
> -	struct device *dev;
>  	int ret, i;
>  
>  	if (cfg == NULL)
> @@ -5415,8 +5416,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
>  		goto rinse;
>  	}
>  
> -	dev = cfg->dev;
> -	WARN_ON(!dev);
> +	WARN_ON(!dev || !cfg->dev);
>  
>  	if (regulator_desc->name == NULL || regulator_desc->ops == NULL) {
>  		ret = -EINVAL;
> diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
> index 32823a87fd40..d94db64cd490 100644
> --- a/drivers/regulator/devres.c
> +++ b/drivers/regulator/devres.c
> @@ -221,7 +221,7 @@ struct regulator_dev *devm_regulator_register(struct device *dev,
>  	if (!ptr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	rdev = regulator_register(regulator_desc, config);
> +	rdev = regulator_register(dev, regulator_desc, config);
>  	if (!IS_ERR(rdev)) {
>  		*ptr = rdev;
>  		devres_add(dev, ptr);
> diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
> index e12b681c72e5..bd0c5d1fd647 100644
> --- a/drivers/regulator/of_regulator.c
> +++ b/drivers/regulator/of_regulator.c
> @@ -505,7 +505,7 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
>  	struct device_node *child;
>  	struct regulator_init_data *init_data = NULL;
>  
> -	child = regulator_of_get_init_node(dev, desc);
> +	child = regulator_of_get_init_node(config->dev, desc);
>  	if (!child)
>  		return NULL;
>  
> diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vrefbuf.c
> index 30ea3bc8ca19..7a454b7b6eab 100644
> --- a/drivers/regulator/stm32-vrefbuf.c
> +++ b/drivers/regulator/stm32-vrefbuf.c
> @@ -210,7 +210,7 @@ static int stm32_vrefbuf_probe(struct platform_device *pdev)
>  						      pdev->dev.of_node,
>  						      &stm32_vrefbuf_regu);
>  
> -	rdev = regulator_register(&stm32_vrefbuf_regu, &config);
> +	rdev = regulator_register(&pdev->dev, &stm32_vrefbuf_regu, &config);
>  	if (IS_ERR(rdev)) {
>  		ret = PTR_ERR(rdev);
>  		dev_err(&pdev->dev, "register failed with error %d\n", ret);
> diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
> index f9a7461e72b8..d3b4a3d4514a 100644
> --- a/include/linux/regulator/driver.h
> +++ b/include/linux/regulator/driver.h
> @@ -687,7 +687,8 @@ static inline int regulator_err2notif(int err)
>  
>  
>  struct regulator_dev *
> -regulator_register(const struct regulator_desc *regulator_desc,
> +regulator_register(struct device *dev,
> +		   const struct regulator_desc *regulator_desc,
>  		   const struct regulator_config *config);
>  struct regulator_dev *
>  devm_regulator_register(struct device *dev,
> -- 
> 2.35.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
