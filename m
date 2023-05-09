Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC1D6FCF1B
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 22:09:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 658AAC6904F;
	Tue,  9 May 2023 20:09:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7598DC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 20:09:22 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6435bbedb4fso6861814b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 May 2023 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683662961; x=1686254961;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k+FKrsLIVkKYcsIeLT6acEHQnxxZ6Q1AY/ul3RhcaDc=;
 b=t7HcuJJ8yNGZSd5jU/xlsEmIR0LbZB3y+UKrWSXF1bjCnP1H/mulK2qxWbB9om6c5e
 EPoNhS+2F2SY6TDpNh93OfYIaBuWtDyA0WUhhijzdrOdZ209vJFBMBDEstCsarasou+9
 +aaguV9fWmvqneuHb9CoJTE/qx66MsyzXT+Vxlf3Z99RhkANcfNe43TH2ZxXjLdx2+BS
 HuT1Mt+LUKLIi9eC3VKE3enmhVi2+4/fEeTRQlISUfpnrQX7AiRV2EtLIcQYI0O8DYbA
 SgRhafl44CnHhh1/jjt5W5eRfmOo6Y3wvHoZfrVQ9hLa4M2QjasbOPOES3SF4ouZL3OB
 lEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683662961; x=1686254961;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k+FKrsLIVkKYcsIeLT6acEHQnxxZ6Q1AY/ul3RhcaDc=;
 b=adUvaKWF4JzRp8ImKnFD4YPHLQY/9cfiFn7zx+Za2R0rQZTNA4E+q6eYYG1dg7Ex/W
 h81OZ7AqvlJxWyU3ijn/gBV1BWsl8f7w0pjNnxjruMN8FVDe76THfHr+mjmWyiCyxP3G
 GTGXENLxPFCxEnw3yYE2a1Y3O7k8RrydusoSK/a/WL0cZWueXH5cRExegfo2P5fUKJGX
 LA17tv6W6NNv0gNLpVudobYdAQrSHqPb2iUpsWPunOC7eq6xyOvGvpX8ttJOoOY+5nUS
 Lutm7LIdU5GGK8u2heSKPHxzxqaK9Rd44DKcobCe3rOv5URDdqnYXqDUZp/ziW5DNonI
 ewRg==
X-Gm-Message-State: AC+VfDzTTSbnD6/c2tEWuVRu+8+Eg4y8COXIiMz4TmxsVrbA+aD0nADP
 iWo/doUST7CHsZ32nK93YfiNgg==
X-Google-Smtp-Source: ACHHUZ7DY1IJhZ58XkyYQJW/n6N11Hq8FL8JnuzhTJRQRu0mHe/ZFZZkYof5BJbwpbwYX39JmI5wDQ==
X-Received: by 2002:a05:6a21:6317:b0:f3:3810:8a89 with SMTP id
 wu23-20020a056a21631700b000f338108a89mr16127445pzb.51.1683662960788; 
 Tue, 09 May 2023 13:09:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5e48:ff40:3eaf:3f9e])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a63e409000000b0050376cedb3asm1756976pgi.24.2023.05.09.13.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 13:09:20 -0700 (PDT)
Date: Tue, 9 May 2023 14:09:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZFqobZAfdlu+Rdtt@p14s>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, kernel@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/18] remoteproc: Convert to platform
 remove callback returning void
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, May 04, 2023 at 09:44:35PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> this patch series adapts most platform drivers below drivers/remoteproc
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak. One driver suffering from
> this problem (s3c2410) is fixed by the first patch.
> =

> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
> =

> There is one driver (i.e. ti_k3_dsp_remoteproc.c) that might return an
> error code in .remove(). I didn't look in detail into this driver, but
> if that error happens, we have exactly the bad situation described
> above. (Note that kproc->mem and the register mapping goes away.)
> =

> Best regards
> Uwe
> =

> Uwe Kleine-K=F6nig (18):
>   remoteproc: da8xx: Convert to platform remove callback returning void
>   remoteproc: imx_dsp: Convert to platform remove callback returning
>     void
>   remoteproc: imx: Convert to platform remove callback returning void
>   remoteproc: keystone: Convert to platform remove callback returning
>     void
>   remoteproc: meson_mx_ao_arc: Convert to platform remove callback
>     returning void
>   remoteproc: mtk_scp: Convert to platform remove callback returning
>     void
>   remoteproc: omap: Convert to platform remove callback returning void
>   remoteproc: pru: Convert to platform remove callback returning void
>   remoteproc: qcom_q6v5_adsp: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_q6v5_mss: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_q6v5_pas: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_q6v5_wcss: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_wcnss: Convert to platform remove callback returning
>     void
>   remoteproc: rcar: Convert to platform remove callback returning void
>   remoteproc: virtio: Convert to platform remove callback returning void
>   remoteproc: st: Convert to platform remove callback returning void
>   remoteproc: stm32: Convert to platform remove callback returning void
>   remoteproc: wkup_m3: Convert to platform remove callback returning
>     void
> =

>  drivers/remoteproc/da8xx_remoteproc.c    | 6 ++----
>  drivers/remoteproc/imx_dsp_rproc.c       | 6 ++----
>  drivers/remoteproc/imx_rproc.c           | 6 ++----
>  drivers/remoteproc/keystone_remoteproc.c | 6 ++----
>  drivers/remoteproc/meson_mx_ao_arc.c     | 6 ++----
>  drivers/remoteproc/mtk_scp.c             | 6 ++----
>  drivers/remoteproc/omap_remoteproc.c     | 6 ++----
>  drivers/remoteproc/pru_rproc.c           | 6 ++----
>  drivers/remoteproc/qcom_q6v5_adsp.c      | 6 ++----
>  drivers/remoteproc/qcom_q6v5_mss.c       | 6 ++----
>  drivers/remoteproc/qcom_q6v5_pas.c       | 6 ++----
>  drivers/remoteproc/qcom_q6v5_wcss.c      | 6 ++----
>  drivers/remoteproc/qcom_wcnss.c          | 6 ++----
>  drivers/remoteproc/rcar_rproc.c          | 6 ++----
>  drivers/remoteproc/remoteproc_virtio.c   | 6 ++----
>  drivers/remoteproc/st_remoteproc.c       | 6 ++----
>  drivers/remoteproc/stm32_rproc.c         | 6 ++----
>  drivers/remoteproc/wkup_m3_rproc.c       | 6 ++----
>  18 files changed, 36 insertions(+), 72 deletions(-)
>

I have applied this set.

Thanks,
Mathieu

> =

> base-commit: 1a5304fecee523060f26e2778d9d8e33c0562df3
> -- =

> 2.39.2
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
