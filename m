Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D110930F88D
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Feb 2021 17:53:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 999FAC57B52;
	Thu,  4 Feb 2021 16:53:27 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ACB1C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Feb 2021 16:53:26 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id s24so3930944iob.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Feb 2021 08:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMoigY62yIJ7YQaLvSh4gO6ndgFj/k+MzZAps0WdCQs=;
 b=OE8iFElv37z11BKMC5+6KSNhX01GCu8+++7vUS94adQ9iwXQQnxf147b25qPiqp+hX
 Hgobvl6Ru5cEOpk0jtdEb1B87VV+tohUA8qDl4s2vocK9ekMW1S5U2YLfto46yuNmT1i
 fP0SH18Y95ac34e5yi6J1rDzbFFjDaJKLVASWjP+uf9VMFRPpkV2gLnKKb2DC6K9zA8b
 JqixsoMYE7s8YOI4GNLG1BmQ2e+ubgjQOKR4Jvq+01CH37dW0ONjBao3ToP+kXxzyJ5L
 w19dokqqy6+LcS2IpZnVmeOQwtB7d72qMuk3Iapgveh2qYLp647jsezdEI10KuGSs5Fk
 l1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMoigY62yIJ7YQaLvSh4gO6ndgFj/k+MzZAps0WdCQs=;
 b=c4fpdJrh0yFTYcZh3lvilCJvMNjml9k+KAWGetUs/dzqATtux2pon4Ee9Lztd43Avy
 kqC5byp8+o2N4I3z3imbLQv+PG3g2LprATzlUlVSRNS4rAQd7nbtw3R0QcAc5ifP222Q
 CAQturLsr1Ot9ZDBjP5zMZ9A95pUVfgZu+QWo2jy88JCckhM+PNAdGjCmXQ63ujbSUN8
 qFb2kH3uoAxtRfac8ax4S0gNWKuWtuUHmXLFsFq2NPZx1vKIggdEJzH2D+3wQ9pgXYN9
 nOanor1tyPpTBCUizdFayHo4HYtkQ3p8lhDxF0OhYQoLG8qMDJ/tm+peu740rNFBfXy9
 N5ow==
X-Gm-Message-State: AOAM5317iXNbwruOUR4zrSuen2oQZWP+zbW2jmFl2VBQrgepOfDfagvv
 gGdGKV3NLdj24DSInax+TVNQ1VXYNWCNFTjW+mkkrw==
X-Google-Smtp-Source: ABdhPJzO7TUlQbNvG8Aoc7Cz2V5sQT7YSsyfoUAEWn1aZ1T8jBPXSoj10FQUGe52QiWokGGHWxeONpr4LBRCD0s1vl8=
X-Received: by 2002:a05:6638:1928:: with SMTP id
 p40mr428995jal.71.1612457604904; 
 Thu, 04 Feb 2021 08:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20210204084534.10516-7-arnaud.pouliquen@foss.st.com>
 <202102042006.UBNrTXCE-lkp@intel.com>
 <c853e1f6-d5f9-4270-5a78-2e9730e5089e@foss.st.com>
In-Reply-To: <c853e1f6-d5f9-4270-5a78-2e9730e5089e@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 4 Feb 2021 09:53:13 -0700
Message-ID: <CANLsYky5r2BjBxjXaB4xNFNcb+zyVJshWZzgMUqf6C5Q9op9BA@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 06/15] rpmsg: update
	rpmsg_chrdev_register_device function
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

On Thu, 4 Feb 2021 at 08:11, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
>
>
> On 2/4/21 1:44 PM, kernel test robot wrote:
> > Hi Arnaud,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v5.11-rc6 next-20210125]
> > [cannot apply to rpmsg/for-next agross-msm/qcom/for-next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210204-165337
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 61556703b610a104de324e4f061dc6cf7b218b46
> > config: openrisc-randconfig-r001-20210204 (attached as .config)
> > compiler: or1k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/23c166e0b157f0695fa7daefb8c5e30f383c3efd
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210204-165337
> >         git checkout 23c166e0b157f0695fa7daefb8c5e30f383c3efd
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=openrisc
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>>
> > All errors (new ones prefixed by >>):
> >
> >    or1k-linux-ld: drivers/rpmsg/qcom_glink_native.o: in function `qcom_glink_native_probe':
> >>> qcom_glink_native.c:(.text+0x2e88): undefined reference to `rpmsg_ctrl_register_device'
> >    qcom_glink_native.c:(.text+0x2e88): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `rpmsg_ctrl_register_device'
>
> Thanks for highlighting it!
>
> I await further review comments first, but I will address this in my next
> revision, if it still relevant.

I will be surprised if I get to look at your patchset before February
22nd so it may be better to address the above.

>
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
