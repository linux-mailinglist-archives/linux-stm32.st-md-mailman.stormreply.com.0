Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 720383A5E06
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jun 2021 10:01:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F802C597B0;
	Mon, 14 Jun 2021 08:01:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE4EBC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:38:43 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id h1so3427657plt.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9KuDiR0/afvizS4hj5Loo8cboTWM7MdUw0YpF4dlIWg=;
 b=e4OQoZbapGBsd95gfs4ae/RGRxzuezrU1OD20VjNZ+lKu4GxF+x99x2e53E8snHBK6
 ig/LOzry5seJ8nfXzMZIMt7/EQjtmm3CWfQgDbkg72fk5BZrzApvbOnZpgPGTB1NpIfv
 uXVHas6DXCpm9VXaajj7YO/CP70/8LkJRmN9HOSmQWN8m4j0RAa19Zz8Sndpke/Rh6n9
 uf7z8L7fC2NgMlioRgSfs/78sHpJBjUqgBajwR1JDFXP1bfDbSl5qGEMbtT4cLBq2Lkt
 90Tqa6Oadb2agJvehPwbyGu1EmgwOZ4s5gnAAUQrczA0CsZq5A7ku/Rt7FHSP3M1Dfmy
 Zsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9KuDiR0/afvizS4hj5Loo8cboTWM7MdUw0YpF4dlIWg=;
 b=GP7jKch8iOgsOB03fw+yFvFL5+5dj30WK9ukPdHOCZYXxcyUeBpZ604/4xVdH6D15k
 ZXQ48OjDkqFVIJeot+Hhmfbt44OzJVHep4kHvg2oG//6d5N1At4Lqv+1t1IbepMIf+Ly
 mqev20wgUXzuu0N6iMMapLAEjMHkanPVdWoOQXOrprOfOF+NPzk41S3Fx0LWZhi7ZdD9
 QnhnQNrV4ngE3p7vGqBbfgawECIWc4i7uJ9GhfFPpWquuNku7JeNweEA7gKyy1IJPRBp
 gKdUF8VbrZuGG5ueH6dhNmqbOsNiPi5xHYlmAT0YnwqH3eVIM1oIo/0dYvByHeGkpudg
 LVLA==
X-Gm-Message-State: AOAM533P51i6zibuPUWVlSi5c4gu+GHq23YxyhB0vr/Af/mgSsFCGp49
 GqwqTv+UVB5FwWmLs6lym4k=
X-Google-Smtp-Source: ABdhPJxLceusjx4BsvK+pZ5JF8d1cmFw4KqrcEPZXtIyorMmdM28WNXXW5VjmcskR1gznU91dg5x+w==
X-Received: by 2002:a17:90a:8804:: with SMTP id
 s4mr6227626pjn.200.1623443922151; 
 Fri, 11 Jun 2021 13:38:42 -0700 (PDT)
Received: from localhost (g151.115-65-219.ppp.wakwak.ne.jp. [115.65.219.151])
 by smtp.gmail.com with ESMTPSA id
 i128sm5690754pfc.142.2021.06.11.13.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:38:41 -0700 (PDT)
Date: Sat, 12 Jun 2021 05:38:39 +0900
From: Stafford Horne <shorne@gmail.com>
To: trix@redhat.com
Message-ID: <YMPJPO9S9wiM5B23@antec>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-5-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610214438.3161140-5-trix@redhat.com>
X-Mailman-Approved-At: Mon, 14 Jun 2021 08:01:26 +0000
Cc: zhangqing@loongson.cn, mholenko@antmicro.com, linux-iio@vger.kernel.org,
 alexandre.torgue@foss.st.com, jiaxun.yang@flygoat.com,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, lars@metafoo.de,
 chenhuacai@kernel.org, gsomlo@gmail.com, linux-arm-kernel@lists.infradead.org,
 pczarnecki@internships.antmicro.com, lukas.bulwahn@gmail.com,
 tomas.winkler@intel.com, devicetree@vger.kernel.org, arnd@arndb.de,
 sean.wang@mediatek.com, ryder.lee@mediatek.com,
 linux-mediatek@lists.infradead.org, davidgow@google.com, kuba@kernel.org,
 apw@canonical.com, Soul.Huang@mediatek.com, kvalo@codeaurora.org,
 tsbogend@alpha.franken.de, jbhayana@google.com, lorenzo.bianconi83@gmail.com,
 gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 dwaipayanray1@gmail.com, joe@perches.com, shayne.chen@mediatek.com,
 davem@davemloft.net, jic23@kernel.org, nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH 3/7] drivers/soc/litex: fix spelling of
	SPDX tag
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

On Thu, Jun 10, 2021 at 02:44:34PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> checkpatch looks for SPDX-License-Identifier.
> So change the '_' to '-'
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  drivers/soc/litex/Kconfig  | 2 +-
>  drivers/soc/litex/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/litex/Kconfig b/drivers/soc/litex/Kconfig
> index e7011d665b151..c03b1f816cc08 100644
> --- a/drivers/soc/litex/Kconfig
> +++ b/drivers/soc/litex/Kconfig
> @@ -1,4 +1,4 @@
> -# SPDX-License_Identifier: GPL-2.0
> +# SPDX-License-Identifier: GPL-2.0
>  
>  menu "Enable LiteX SoC Builder specific drivers"
>  
> diff --git a/drivers/soc/litex/Makefile b/drivers/soc/litex/Makefile
> index 98ff7325b1c07..aeae1f4165a70 100644
> --- a/drivers/soc/litex/Makefile
> +++ b/drivers/soc/litex/Makefile
> @@ -1,3 +1,3 @@
> -# SPDX-License_Identifier: GPL-2.0
> +# SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_LITEX_SOC_CONTROLLER)	+= litex_soc_ctrl.o
> -- 
> 2.26.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
