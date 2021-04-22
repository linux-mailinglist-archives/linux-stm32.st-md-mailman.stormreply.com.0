Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C33684E4
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 18:32:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AA58C5719E;
	Thu, 22 Apr 2021 16:32:22 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6738FC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 16:32:21 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id n10so12658897plc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cozMNl4x0aoDfS151vd4k3rQFwhI4XY6oBVsQT9uHNQ=;
 b=Nn248TtiVAoPlwvqR27j4chs/hwfU/A16DV50RupiPpu/t46mpFxp07L1eIAVXAFq0
 8+rmYuoevJMFuOBc5+rZWv1sO8jgLjU+X9MnOuov5H40vc9O1B4o4OBAn8eCt2znBw1K
 zsk7pAdtxtX03L2SPZyca9kC6Z3QehisnxckskRcBVm8N0f74qMvAe4uQY98nltmGMzk
 CLovQr/wxoJiiiNJFkqzQg8weB/t6DHb50ktkSUh/aCPxYY1OK1TdwASNC473IReV9IP
 svTny4CV8QwOCqW6DpLkWfXrj+SBEtz1CB5pqT4zH/CCAPWS+dp3L4fNyC3i3UOulnK8
 qszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cozMNl4x0aoDfS151vd4k3rQFwhI4XY6oBVsQT9uHNQ=;
 b=tyHQKvoBVDJ4LzsZ8aE4Vb4aMG9ySbjwhExs5tyQN7ux+3Kdf5Z7f0pr0wRXlzBa3z
 wrSmlg7Es17iRTFA9yrBzYgVPiU2bYr2arxgbVlKze2sYPxCCvK9WaAX8/0t5HWyDLoI
 esu7WLCxKWx0wob6ORAiLZlYlTqT9ivBZvrP0lByOB9jfCgi8PaYepmN/CtP2mWttDr+
 T4voSCpmBKkHGNvtdB8Tc4ER9BYVHmxs+4Atz/sp1RT3gU1dMJsz8iczeEsUINxi7V4q
 jjJUiWOnUcR32iEKF4bcHUqQ/NyoXk7tEa2gbWxWUhOtBZ4FSKi/ng0CupmyJ7Yq44GB
 tjFA==
X-Gm-Message-State: AOAM532AA/p3GgNfDEGdwUFM3uFym02tQZfGqGP89O8ueA1O5s9WJUaO
 U15ODYmWssV6W9VNh7q0XBVJQg==
X-Google-Smtp-Source: ABdhPJzF2Qsbwpp8tTcZe/nkV/+BMAURDtxF0quVJv8hmQraI3YmZbIo9O4WxwfiFlKpAnHrEPwrdA==
X-Received: by 2002:a17:90a:a78c:: with SMTP id
 f12mr873180pjq.219.1619109139744; 
 Thu, 22 Apr 2021 09:32:19 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id z188sm2717992pgb.89.2021.04.22.09.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 09:32:19 -0700 (PDT)
Date: Thu, 22 Apr 2021 10:32:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210422163217.GB1256950@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-3-arnaud.pouliquen@foss.st.com>
 <20210421180455.GE1223348@xps15>
 <bb376229-006f-af16-2006-4ef9edea87f5@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb376229-006f-af16-2006-4ef9edea87f5@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/7] rpmsg: Move the rpmsg control
 device from rpmsg_char to rpmsg_ctrl
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

On Thu, Apr 22, 2021 at 09:56:41AM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 4/21/21 8:04 PM, Mathieu Poirier wrote:
> > On Tue, Apr 13, 2021 at 03:44:53PM +0200, Arnaud Pouliquen wrote:
> >> Create the rpmsg_ctrl.c module and move the code related to the
> >> rpmsg_ctrldev device in this new module.
> >>
> >> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> >> kconfig file.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >> update from v1:
> >> - keep "rpmsg_chrdev" driver name in rpmsg_ctrl, driver will be renamed
> >>   in next path that renames the rpmsg_chrdev_create_eptdev.
> >> - rename the chardev regions
> >> - move RPMSG_DEV_MAX to rpmsg_char.h
> >> ---
> >>  drivers/rpmsg/Kconfig      |   9 ++
> >>  drivers/rpmsg/Makefile     |   1 +
> >>  drivers/rpmsg/rpmsg_char.c | 181 +----------------------------
> >>  drivers/rpmsg/rpmsg_char.h |   2 +
> >>  drivers/rpmsg/rpmsg_ctrl.c | 231 +++++++++++++++++++++++++++++++++++++
> >>  5 files changed, 245 insertions(+), 179 deletions(-)
> >>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> >>
> >> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> >> index 0b4407abdf13..d822ec9ec692 100644
> >> --- a/drivers/rpmsg/Kconfig
> 
> snip[...]
> 
> >> +static int rpmsg_ctrldev_init(void)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
> >> +	if (ret < 0) {
> >> +		pr_err("rpmsg: failed to allocate char dev region\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> > 
> > This class thing really bothers me.  Keeping this here means that rpmsg_eptdevs
> > created from user space will be associated to this rpmsg_class but those created
> > from the name service won't.  As such I propose to move this to rpmsg_char and
> > simply not associate the control device to the class.
> > 
> > Otherwise we'd have to introduce some mechanic only to deal with the creation of
> > the class and I don't think it is worth.  We can revise that approach if someone
> > complains we broke their user space. 
> 
> I agree with that as it was my first proposed approach here [1]

Yeah, sorry about that.  This patch review process is not an exact science...

> 
> [1] https://www.spinics.net/lists/linux-arm-msm/msg81194.html
> 
> Thanks,
> Arnaud
> 
> > 
> > 
> >> +	if (IS_ERR(rpmsg_class)) {
> >> +		pr_err("failed to create rpmsg class\n");
> >> +		ret = PTR_ERR(rpmsg_class);
> >> +		goto free_region;
> >> +	}
> >> +
> >> +	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
> >> +	if (ret < 0) {
> >> +		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
> >> +		goto free_class;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +free_class:
> >> +	class_destroy(rpmsg_class);
> >> +free_region:
> >> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >> +
> >> +	return ret;
> >> +}
> >> +postcore_initcall(rpmsg_ctrldev_init);
> >> +
> >> +static void rpmsg_ctrldev_exit(void)
> >> +{
> >> +	unregister_rpmsg_driver(&rpmsg_ctrldev_driver);
> >> +	class_destroy(rpmsg_class);
> >> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >> +}
> >> +module_exit(rpmsg_ctrldev_exit);
> >> +
> >> +MODULE_DESCRIPTION("rpmsg control interface");
> >> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
> >> +MODULE_LICENSE("GPL v2");
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
