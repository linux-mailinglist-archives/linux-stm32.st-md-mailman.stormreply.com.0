Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3EA95EFDB
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 13:36:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC0C7C6DD94;
	Mon, 26 Aug 2024 11:36:54 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E014C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 11:36:47 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e115c8aa51fso4133308276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724672206; x=1725277006;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3WuBkNkQq7ncBHhLfidrPpVIWONY2++qBbCcAKeFG0A=;
 b=aFH4dybKss1dgDDT3Gs5pk7CyPMhxMeosZpHki2TvoRiyDvqDy9CsXsbVjnRbtGnoo
 MQpoAEhA+QRW3dgVL5RrbtVPoQPrfyXHRibgMm82voGO9Yio7Y9cW0T2wHq1jt9Wv9Gt
 ldTb7ssb1uiqWgGvAUAiE6UjuOIZY1gRHbRHqbW4cqP6uCvbL1pm/AkWPMxAzBuOCCw+
 E4fs7NCO5+eVS8MyeSEaTIivTf9yF3qVFZeNp+G7XrBpIlBMYK5ckzqhUHR4+gImPBf4
 6cKiEiQ4xri0DodJwvq6hCFW8qq7sNX8C4uxIdD+9HO+6YAivjBKdxj/mSVdB/SByLqj
 8fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724672206; x=1725277006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3WuBkNkQq7ncBHhLfidrPpVIWONY2++qBbCcAKeFG0A=;
 b=pGHToxKIFrxgIRWAEQ9GXdC0kpoY9u25JyLMOwz3NjEGRMp7JTuSUEc9aKBD1a6UNP
 0tpsfTZoYCXrxJCTMfJ4UenoFDpCEFDw2Ru09AI79cdpT29F+yRwkmN+7XAjZJP3Q7Em
 gU2y3wDhW7m5jQ4HpgZQNGbukHp32zLF3vOJRgeD4iGORkvViuP6Uk/AGGCBsMZ2nxDb
 tkEg+932sN/WQiEpHBzcfC3z9RJz/5kn3inkzvBQJpD3i/8gsJcJPl7NZUiRUpQ/6a/R
 WeO2YkROhEwk150YQdwI0BQ4Yvh/YKqoFe5LSD8gVfECMLIZaD9ERN9CD5GkSGWWtpWZ
 2mEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG8F3dQaaLddPFtTPXobHiyVfLA9KCxG3wJo1hWOxTEssq2mjaxIC+MgF0Hh8XgawnzbTRwlET9Q8lWg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGlJXdArQdxqZeU302bYBrbw6KStLAlQdl7fFx8eRR9GEhyPiA
 gwoyEJwjeLpP2nQR/GHDFL9qVVn0x2u6EV863CzLQS38V6BBqwISE5qryINq0/ZeAfnLnyb5IDa
 amodhLhOCaMoFIa+qIv9LunSujez8cPBavKfgHA==
X-Google-Smtp-Source: AGHT+IFTmCOXbkWFVjFKxNQjfliOW8Z+x4s+zXNlqgxkRfvBAgPO0UAeheCBnSP89lF7epHbxvk3ur82nxWQLLc8Og4=
X-Received: by 2002:a05:6902:1a46:b0:e0b:4045:ada0 with SMTP id
 3f1490d57ef6-e17a83d45d4mr9340283276.23.1724672206061; Mon, 26 Aug 2024
 04:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240824034925.1163244-1-hch@lst.de>
 <20240824034925.1163244-5-hch@lst.de>
In-Reply-To: <20240824034925.1163244-5-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 26 Aug 2024 13:36:09 +0200
Message-ID: <CAPDyKFrnP5uZ8H3CL5P7bwjRnPwNPDF-U7amm1fwGeob63GYmw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-hyperv@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 4/4] dma-mapping: don't return errors from
	dma_set_max_seg_size
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

On Sat, 24 Aug 2024 at 05:51, Christoph Hellwig <hch@lst.de> wrote:
>
> A NULL dev->dma_parms indicates either a bus that is not DMA capable or
> grave bug in the implementation of the bus code.
>
> There isn't much the driver can do in terms of error handling for either
> case, so just warn and continue as DMA operations will fail anyway.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/accel/qaic/qaic_drv.c                         |  4 +---
>  drivers/dma/idma64.c                                  |  4 +---
>  drivers/dma/pl330.c                                   |  5 +----
>  drivers/dma/qcom/bam_dma.c                            |  6 +-----
>  drivers/dma/sh/rcar-dmac.c                            |  4 +---
>  drivers/dma/ste_dma40.c                               |  6 +-----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c                |  6 +-----
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c |  3 +--
>  drivers/media/pci/intel/ipu6/ipu6.c                   |  4 +---
>  drivers/mmc/host/mmci_stm32_sdmmc.c                   |  3 ++-
>  drivers/net/ethernet/microsoft/mana/gdma_main.c       |  6 +-----
>  drivers/scsi/lpfc/lpfc_init.c                         |  7 +------
>  include/linux/dma-mapping.h                           | 10 ++++------
>  13 files changed, 17 insertions(+), 51 deletions(-)

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

Kind regards
Uffe

>
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 580b29ed190217..bf10156c334e71 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -447,9 +447,7 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
>         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>         if (ret)
>                 return ret;
> -       ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> -       if (ret)
> -               return ret;
> +       dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>
>         qdev->bar_0 = devm_ioremap_resource(&pdev->dev, &pdev->resource[0]);
>         if (IS_ERR(qdev->bar_0))
> diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
> index e3505e56784b1a..1398814d8fbb63 100644
> --- a/drivers/dma/idma64.c
> +++ b/drivers/dma/idma64.c
> @@ -598,9 +598,7 @@ static int idma64_probe(struct idma64_chip *chip)
>
>         idma64->dma.dev = chip->sysdev;
>
> -       ret = dma_set_max_seg_size(idma64->dma.dev, IDMA64C_CTLH_BLOCK_TS_MASK);
> -       if (ret)
> -               return ret;
> +       dma_set_max_seg_size(idma64->dma.dev, IDMA64C_CTLH_BLOCK_TS_MASK);
>
>         ret = dma_async_device_register(&idma64->dma);
>         if (ret)
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 60c4de8dac1d2a..82a9fe88ad54c9 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -3163,10 +3163,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>          * This is the limit for transfers with a buswidth of 1, larger
>          * buswidths will have larger limits.
>          */
> -       ret = dma_set_max_seg_size(&adev->dev, 1900800);
> -       if (ret)
> -               dev_err(&adev->dev, "unable to set the seg size\n");
> -
> +       dma_set_max_seg_size(&adev->dev, 1900800);
>
>         init_pl330_debugfs(pl330);
>         dev_info(&adev->dev,
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 5e7d332731e0c1..368ffaa4003789 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1325,11 +1325,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>
>         /* set max dma segment size */
>         bdev->common.dev = bdev->dev;
> -       ret = dma_set_max_seg_size(bdev->common.dev, BAM_FIFO_SIZE);
> -       if (ret) {
> -               dev_err(bdev->dev, "cannot set maximum segment size\n");
> -               goto err_bam_channel_exit;
> -       }
> +       dma_set_max_seg_size(bdev->common.dev, BAM_FIFO_SIZE);
>
>         platform_set_drvdata(pdev, bdev);
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 40482cb73d798a..1094a2f821649c 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1868,9 +1868,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>
>         dmac->dev = &pdev->dev;
>         platform_set_drvdata(pdev, dmac);
> -       ret = dma_set_max_seg_size(dmac->dev, RCAR_DMATCR_MASK);
> -       if (ret)
> -               return ret;
> +       dma_set_max_seg_size(dmac->dev, RCAR_DMATCR_MASK);
>
>         ret = dma_set_mask_and_coherent(dmac->dev, DMA_BIT_MASK(40));
>         if (ret)
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 2c489299148eee..d52e1685aed53f 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3632,11 +3632,7 @@ static int __init d40_probe(struct platform_device *pdev)
>         if (ret)
>                 goto destroy_cache;
>
> -       ret = dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
> -       if (ret) {
> -               d40_err(dev, "Failed to set dma max seg size\n");
> -               goto destroy_cache;
> -       }
> +       dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
>
>         d40_hw_init(base);
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 77b50c56c124ce..3e807195a0d03a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -559,11 +559,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>          * Configure the DMA segment size to make sure we get contiguous IOVA
>          * when importing PRIME buffers.
>          */
> -       ret = dma_set_max_seg_size(dma_dev, UINT_MAX);
> -       if (ret) {
> -               dev_err(dma_dev, "Failed to set DMA segment size\n");
> -               goto err_component_unbind;
> -       }
> +       dma_set_max_seg_size(dma_dev, UINT_MAX);
>
>         ret = drm_vblank_init(drm, MAX_CRTC);
>         if (ret < 0)
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 3d4fd4ef53107c..bb0b7fa67b539a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -854,8 +854,7 @@ int vb2_dma_contig_set_max_seg_size(struct device *dev, unsigned int size)
>                 return -ENODEV;
>         }
>         if (dma_get_max_seg_size(dev) < size)
> -               return dma_set_max_seg_size(dev, size);
> -
> +               dma_set_max_seg_size(dev, size);
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index bbd646378ab3ed..83e70c692d957f 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -576,9 +576,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
>
> -       ret = dma_set_max_seg_size(dev, UINT_MAX);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "Failed to set max_seg_size\n");
> +       dma_set_max_seg_size(dev, UINT_MAX);
>
>         ret = ipu6_pci_config_setup(pdev, isp->hw_ver);
>         if (ret)
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index f5da7f9baa52d4..9dc51859c2e51e 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -213,7 +213,8 @@ static int sdmmc_idma_setup(struct mmci_host *host)
>                 host->mmc->max_seg_size = host->mmc->max_req_size;
>         }
>
> -       return dma_set_max_seg_size(dev, host->mmc->max_seg_size);
> +       dma_set_max_seg_size(dev, host->mmc->max_seg_size);
> +       return 0;
>  }
>
>  static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
> diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> index ddb8f68d80a206..ca4ed58f1206dd 100644
> --- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
> +++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> @@ -1496,11 +1496,7 @@ static int mana_gd_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>         if (err)
>                 goto release_region;
>
> -       err = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> -       if (err) {
> -               dev_err(&pdev->dev, "Failed to set dma device segment size\n");
> -               goto release_region;
> -       }
> +       dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>
>         err = -ENOMEM;
>         gc = vzalloc(sizeof(*gc));
> diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
> index e1dfa96c2a553a..50620918becd59 100644
> --- a/drivers/scsi/lpfc/lpfc_init.c
> +++ b/drivers/scsi/lpfc/lpfc_init.c
> @@ -13861,12 +13861,7 @@ lpfc_get_sli4_parameters(struct lpfc_hba *phba, LPFC_MBOXQ_t *mboxq)
>         if (sli4_params->sge_supp_len > LPFC_MAX_SGE_SIZE)
>                 sli4_params->sge_supp_len = LPFC_MAX_SGE_SIZE;
>
> -       rc = dma_set_max_seg_size(&phba->pcidev->dev, sli4_params->sge_supp_len);
> -       if (unlikely(rc)) {
> -               lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
> -                               "6400 Can't set dma maximum segment size\n");
> -               return rc;
> -       }
> +       dma_set_max_seg_size(&phba->pcidev->dev, sli4_params->sge_supp_len);
>
>         /*
>          * Check whether the adapter supports an embedded copy of the
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 6bd1333dbacb9b..1524da363734af 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -524,13 +524,11 @@ static inline unsigned int dma_get_max_seg_size(struct device *dev)
>         return SZ_64K;
>  }
>
> -static inline int dma_set_max_seg_size(struct device *dev, unsigned int size)
> +static inline void dma_set_max_seg_size(struct device *dev, unsigned int size)
>  {
> -       if (dev->dma_parms) {
> -               dev->dma_parms->max_segment_size = size;
> -               return 0;
> -       }
> -       return -EIO;
> +       if (WARN_ON_ONCE(!dev->dma_parms))
> +               return;
> +       dev->dma_parms->max_segment_size = size;
>  }
>
>  static inline unsigned long dma_get_seg_boundary(struct device *dev)
> --
> 2.43.0
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
