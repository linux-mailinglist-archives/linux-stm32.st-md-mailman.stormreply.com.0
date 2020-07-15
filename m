Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CF2217A9
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jul 2020 00:19:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA38CC36B29;
	Wed, 15 Jul 2020 22:19:21 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 684E7C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 22:19:19 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c16so3937308ioi.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 15:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uamVRmBnq/LyIAwWR9vTRtXE6KJjN16bes8FQWmt5qc=;
 b=LP9YnNKBDUyZc5hldm+tOuZM/Xv9Dq6jUSsWZh3iCZOkud47rfRGMe+VGiH1HmC9f9
 xNGiaCcq6okAfg1P08F+1dwmDew22YigqRGMFIE2XNBGjG+e29WOiWN+IrRdlArL2r7y
 zIvaW91RxDvXWsCJAv1vj8Pe0vzK4xq70ISaYWajxjaNCSYaIs0fv2RoRrSvGqt8gLxV
 /kW2vuuYIvgAJGPekOs73MICUoQ37PrUpC7k7DpWEJXwmsess9lxUuYgbIsOi7Qi3zIb
 byafvAUIQVyn8mMu2L301RALWXTA6C2xsI/0AT6nMN42UnLVD4JySNglI0ePaotrQGfv
 OZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uamVRmBnq/LyIAwWR9vTRtXE6KJjN16bes8FQWmt5qc=;
 b=LimcA1wodRB8nLKfdG0JmiOMHvP6W/blHqCGPBN2HdixusynT97zZoOGcnyKGVUJwj
 S8iBxPDVcJke3gALudAEMcOiYaSdFohdp2q1A2ZAxZuIvnxv/rY2aaOXX11OAY3ftl90
 letoeIuPcWheGbwVp8uWdIxM256irgtRWrHFyNP04+3IrwkWqNxBFxXeOgrIET5JAmU7
 BkxV1JKwRXtdXzyDqiAQaTqin3pkvmWRJd9C6hByqoMTHEfIFLk15xvGhrFjBT6UA8m4
 oKneM3wt66xCXs+CrnXWs2ck38NLqEo2DcVd6+TQ44sOso+u6fnzvwwvpz0pfCjQyNRZ
 Y+cg==
X-Gm-Message-State: AOAM533hWOhlgWlIMIuH/s2ROVeTgawSK7qub+6vl37B7KIDil46C/wB
 68i60Xlqk0fRbW3y5wg9gRtpDL/FGVivtFh7IXj+7w==
X-Google-Smtp-Source: ABdhPJxanTTddn1ct1kSr/GGgdJAB/ArrrDHYsVVxx4CSGuJVHDOZIRP8qD8hAuix1aIu35jzjzgXUi0p+0yiT3+pyg=
X-Received: by 2002:a5d:8853:: with SMTP id t19mr1496520ios.73.1594851558125; 
 Wed, 15 Jul 2020 15:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200707213112.928383-7-mathieu.poirier@linaro.org>
 <202007150455.m7mLaFaF%lkp@intel.com>
In-Reply-To: <202007150455.m7mLaFaF%lkp@intel.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 15 Jul 2020 16:19:07 -0600
Message-ID: <CANLsYkwWe_zfpafBKNF10BEqV4w1tHTjrTOPUca36LkTD+Nu=Q@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kbuild-all@lists.01.org,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 clang-built-linux@googlegroups.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 06/11] remoteproc: stm32: Properly set
 co-processor state when attaching
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

Hi Robot,

On Tue, 14 Jul 2020 at 14:31, kernel test robot <lkp@intel.com> wrote:
>
> Hi Mathieu,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linux/master]
> [also build test ERROR on linus/master v5.8-rc5 next-20200714]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Mathieu-Poirier/remoteproc-stm32-Add-support-for-attaching-to-M4/20200708-053515
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68
> config: arm-randconfig-r011-20200714 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 02946de3802d3bc65bc9f2eb9b8d4969b5a7add8)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/remoteproc/stm32_rproc.c:697:18: error: use of undeclared identifier 'RPROC_DETACHED'
>                    rproc->state = RPROC_DETACHED;
>                                   ^
>    1 error generated.

This patchset depends on this one [1], something that is clearly
stated in the cover letter.  Compiling this set on top of [1]
generates no error.

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=318275

>
> vim +/RPROC_DETACHED +697 drivers/remoteproc/stm32_rproc.c
>
>    661
>    662
>    663  static int stm32_rproc_probe(struct platform_device *pdev)
>    664  {
>    665          struct device *dev = &pdev->dev;
>    666          struct stm32_rproc *ddata;
>    667          struct device_node *np = dev->of_node;
>    668          struct rproc *rproc;
>    669          unsigned int state;
>    670          int ret;
>    671
>    672          ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
>    673          if (ret)
>    674                  return ret;
>    675
>    676          rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
>    677          if (!rproc)
>    678                  return -ENOMEM;
>    679
>    680          ddata = rproc->priv;
>    681
>    682          rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>    683
>    684          ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
>    685          if (ret)
>    686                  goto free_rproc;
>    687
>    688          ret = stm32_rproc_of_memory_translations(pdev, ddata);
>    689          if (ret)
>    690                  goto free_rproc;
>    691
>    692          ret = stm32_rproc_get_m4_status(ddata, &state);
>    693          if (ret)
>    694                  goto free_rproc;
>    695
>    696          if (state == M4_STATE_CRUN)
>  > 697                  rproc->state = RPROC_DETACHED;
>    698
>    699          rproc->has_iommu = false;
>    700          ddata->workqueue = create_workqueue(dev_name(dev));
>    701          if (!ddata->workqueue) {
>    702                  dev_err(dev, "cannot create workqueue\n");
>    703                  ret = -ENOMEM;
>    704                  goto free_rproc;
>    705          }
>    706
>    707          platform_set_drvdata(pdev, rproc);
>    708
>    709          ret = stm32_rproc_request_mbox(rproc);
>    710          if (ret)
>    711                  goto free_wkq;
>    712
>    713          ret = rproc_add(rproc);
>    714          if (ret)
>    715                  goto free_mb;
>    716
>    717          return 0;
>    718
>    719  free_mb:
>    720          stm32_rproc_free_mbox(rproc);
>    721  free_wkq:
>    722          destroy_workqueue(ddata->workqueue);
>    723  free_rproc:
>    724          if (device_may_wakeup(dev)) {
>    725                  dev_pm_clear_wake_irq(dev);
>    726                  device_init_wakeup(dev, false);
>    727          }
>    728          rproc_free(rproc);
>    729          return ret;
>    730  }
>    731
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
