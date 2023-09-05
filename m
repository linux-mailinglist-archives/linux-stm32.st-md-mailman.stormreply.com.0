Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 933B07921B4
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Sep 2023 11:57:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39988C6B454;
	Tue,  5 Sep 2023 09:57:40 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82767C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Sep 2023 09:57:38 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso3844754e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Sep 2023 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693907857; x=1694512657;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AKHR62ul+UyAMBBLZNZLoFrH8efwjpri67YRyIEqGb8=;
 b=Dt+W8L6wQHFxJZ3DzFgvxKP9Q1fMGUyE9MwBvh1ZTivnuJqOtiyEpxWnb4SEvHSqVg
 S3dz4ekKRmJm5LWiKjs79T8E4o6ReENHykLtD/bEffKl1tKgQVeeI6hazSNorYjfgWhP
 M9cLzL3U/hz0oFQ8bOTqkNNCXpA5dM3Z9F1LEV9ije60L3nWhSgepCb/QHeWtk+gxoga
 5bM0r2DvXmsQ6xsdECGDiHnfRuonimxTFAsSK1zyv00gx+3pn+JcfHHzBD5njpICiqof
 jaKGMYvTEEepRF15H1qO+GyemgygbkapxCEh2tCG6cBhljVqyqbpBdbjnw+CKiVVDSnL
 jmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693907857; x=1694512657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKHR62ul+UyAMBBLZNZLoFrH8efwjpri67YRyIEqGb8=;
 b=eqhfOIcfsofX1jaXn5CDaOJiFvRg+NAg9iS8laecfr4IwxwlAH/dO2s1we2Lb5j2Ta
 OKbAnN7oYmtK08JL7xsN2uOVIXOh56t2aus9uRbN4938/tqpt0is36uMZyEj3JryXR3P
 xOO1FFfnBDL5wDuJQXjGi2mM6RgmkpH9Xs6hf7DsUHB5bpH6oGG1XbHAeVQL3BV6lrkt
 LwNOeDvM69V7H+gXZOnpL2Do351TWkDUdEzc/o680c/m9gnd9tlLvlNGQkiagQsD1yAh
 yoLmGb3NrzVXMRvDWXS/2qVJJRyKpNiiI9A7hjSESJLkqyYJ7TgtsswJo9EsEdT9Y+PX
 9qiQ==
X-Gm-Message-State: AOJu0YzoZaT09AXHRyZYM92PjL3f1Oz0mxDkeCOT5rZbHs3MX5rSZXop
 oj1UOX+BGsEUuWEl+9SR2Vgq6A==
X-Google-Smtp-Source: AGHT+IF/Krv9XoaHXmgTX6hA95PT3mrsyeECELy7hFWygISVfjLi7nO3m0A/foR0u3zSojYLTMDlFA==
X-Received: by 2002:a19:8c09:0:b0:500:9d6c:913e with SMTP id
 o9-20020a198c09000000b005009d6c913emr7472258lfd.52.1693907857446; 
 Tue, 05 Sep 2023 02:57:37 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4083000000b0031435731dfasm16913703wrp.35.2023.09.05.02.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 02:57:37 -0700 (PDT)
Date: Tue, 5 Sep 2023 12:57:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Message-ID: <75bcd331-9a62-486f-a15f-6aebf4d1838b@kadam.mountain>
References: <20230814060411.2401817-1-rkannoth@marvell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814060411.2401817-1-rkannoth@marvell.com>
Cc: yonghong.song@linux.dev, kys@microsoft.com, horatiu.vultur@microchip.com,
 wei.liu@kernel.org, longli@microsoft.com, joabreu@synopsys.com,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, Mark-MC.Lee@mediatek.com,
 linux@roeck-us.net, jdelvare@suse.com, hawk@kernel.org,
 linux-omap@vger.kernel.org, ilias.apalodimas@linaro.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 oleksandr_tyshchenko@epam.com, linyunsheng@huawei.com, jolsa@kernel.org,
 saeedm@nvidia.com, shayne.chen@mediatek.com, linux-hyperv@vger.kernel.org,
 simon.horman@corigine.com, song@kernel.org, edumazet@google.com,
 sdf@google.com, sstabellini@kernel.org, shradhagupta@linux.microsoft.com,
 leon@kernel.org, davem@davemloft.net, john.fastabend@gmail.com,
 andrii@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 yisen.zhuang@huawei.com, richardcochran@gmail.com,
 maciej.fijalkowski@intel.com, sean.wang@mediatek.com,
 jaswinder.singh@linaro.org, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com,
 wei.fang@nxp.com, error27@gmail.com, alexanderduyck@fb.com, ast@kernel.org,
 sbhatta@marvell.com, daniel@iogearbox.net, linux-rdma@vger.kernel.org,
 decui@microsoft.com, shenwei.wang@nxp.com, mengyuanlou@net-swift.com,
 lorenzo@kernel.org, grygorii.strashko@ti.com, haiyangz@microsoft.com,
 kpsingh@kernel.org, broonie@kernel.org, john@phrozen.org,
 michael.chan@broadcom.com, linux-hwmon@vger.kernel.org, salil.mehta@huawei.com,
 pabeni@redhat.com, lgirdwood@gmail.com, yang.lee@linux.alibaba.com,
 gakula@marvell.com, vladimir.oltean@nxp.com, thomas.petazzoni@bootlin.com,
 gerhard@engleder-embedded.com, ryder.lee@mediatek.com, linux@armlinux.org.uk,
 xiaoning.wang@nxp.com, kuba@kernel.org, sgoutham@marvell.com, kvalo@kernel.org,
 jiawenwu@trustnetic.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mw@semihalf.com,
 angelogioacchino.delregno@collabora.com, jgross@suse.com,
 netdev@vger.kernel.org, aleksander.lobakin@intel.com, hkelam@marvell.com,
 p.zabel@pengutronix.de, martin.lau@linux.dev, nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH v1 net] page_pool: Cap queue size to 32k.
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

On Mon, Aug 14, 2023 at 11:34:11AM +0530, Ratheesh Kannoth wrote:
> Clamp to 32k instead of returning error.

What is the motivation here?  What is the real world impact for the
users?

> 
> Please find discussion at
> https://lore.kernel.org/lkml/
> CY4PR1801MB1911E15D518A77535F6E51E2D308A@CY4PR1801MB1911.
> namprd18.prod.outlook.com/T/

Please don't break the URL up like this.  I think normally we would just
write up a normal commit message and use the Link: tag.

Fixes: ff7d6b27f894 ("page_pool: refurbish version of page_pool code")
Link: https://lore.kernel.org/lkml/CY4PR1801MB1911E15D518A77535F6E51E2D308A@CY4PR1801MB1911.namprd18.prod.outlook.com/
Signed-off-by:

> @@ -171,9 +171,10 @@ static int page_pool_init(struct page_pool *pool,
>  	if (pool->p.pool_size)
>  		ring_qsize = pool->p.pool_size;
>  
> -	/* Sanity limit mem that can be pinned down */
> +	/* Cap queue size to 32k */
>  	if (ring_qsize > 32768)
> -		return -E2BIG;
> +		ring_qsize = 32768;
> +
>  
>  	/* DMA direction is either DMA_FROM_DEVICE or DMA_BIDIRECTIONAL.

Don't introduce a blank line here.  Checkpatch will complain if you
have to blank lines in a row.  It won't complain about the patch but it
will complain if you apply the patch and then re-run checkpatch -f on
the file.  (I didn't test this but it's wrong either way. :P).

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
