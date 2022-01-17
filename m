Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 224634911FA
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jan 2022 23:55:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3CA1C5C82B;
	Mon, 17 Jan 2022 22:55:25 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7636C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 22:55:24 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id t9so25703749oie.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 14:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JgHdHThslfW8cWYgVZ7DrTIIbA1uJdRWFcKirFlKvos=;
 b=MhsS8EUXaQkCE2tOPqkbsGLNOXTZAO7ApasVgwy+ZLjMTQjBRQiRCevhCsEQ5z2C3A
 JbDvrP3ZnTPkV9o+F+EZ+1UR9S3NirPjX+R1yryE5LszoaLRj3mDwhFk2nE5TNEJ+mj4
 rgs4ye7Lw1BKcgI/lesO+wW8DTEEw18UZIfB6rRiYvXHfPBJh0d0q5hDYci0KEd3nrMo
 ymaw8anHdpPEytqUGi5AsuqFD7MVJQg2grITha+UpLkPtDTRe3IZh0ozAPrwf74z6xJL
 i+NQoi23Cw6Kr6Pw8+n583FvCE5xTjE54YqA1b6zAq5a/IJqWrRKon2rvk/QjggCWPla
 BgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JgHdHThslfW8cWYgVZ7DrTIIbA1uJdRWFcKirFlKvos=;
 b=t3g3OLi1pHUxFPGeS2OqrfLpjJzermRiqjX7BPzifIptz+0PVXozmC6cG1XGlbQhH9
 H/Dw83pRFlrSX+kg5TqZFqJLXvj0jSdcahi9lZZH71NT0zGV0yLSd8HYH19GvOFy2NZk
 4MWYmc86H2rx2u2RrG/vo0dxVw92NwlRw+ZPyBK3Khw/IcVLRhaJATo0AFO7euZlxIX6
 aG1bShPwBf5Z9SwTU8bldiJge/0bH3gumsnry61uAiAfhl28b+LRqoVC+2VQsgCR9eWJ
 wMtem11OAsFqnJHS0EyMKqwRBYmMHmJo+yaMgbsAgundZUbXM6qlalZz/P8JPuGGthfD
 celw==
X-Gm-Message-State: AOAM531rq3goYR4ptJCyUo8oUSkCPocmwDGJkYMiOmwpKNpJ6b60+rKX
 B4yDpeMv7ogNTP6YAPy1Yf1jpQ==
X-Google-Smtp-Source: ABdhPJxRiubKKOWsfwr2r2Qn1nnjS9IzlDf478fuYhB8DEUNrxy2LBICJg0Ql7X+rAspt6g+C28LLg==
X-Received: by 2002:a05:6808:1148:: with SMTP id
 u8mr3297802oiu.19.1642460123552; 
 Mon, 17 Jan 2022 14:55:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id k10sm7443332oil.36.2022.01.17.14.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 14:55:22 -0800 (PST)
Date: Mon, 17 Jan 2022 16:55:21 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YeXz2SFqYr+eUvnw@builder.lan>
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
 <20211207080843.21222-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211207080843.21222-4-arnaud.pouliquen@foss.st.com>
Cc: julien.massot@iot.bzh, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 03/13] rpmsg: Move the rpmsg control
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

On Tue 07 Dec 02:08 CST 2021, Arnaud Pouliquen wrote:
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
[..]
> -static void rpmsg_ctrldev_release_device(struct device *dev)
> -{
> -	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
> -
> -	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> -	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -	cdev_del(&ctrldev->cdev);
> -	kfree(ctrldev);
> -}
> -
> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> -{
> -	struct rpmsg_ctrldev *ctrldev;
> -	struct device *dev;
> -	int ret;
> -
> -	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
> -	if (!ctrldev)
> -		return -ENOMEM;
> -
> -	ctrldev->rpdev = rpdev;
> -
> -	dev = &ctrldev->dev;
> -	device_initialize(dev);
> -	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;
> -
> -	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> -	ctrldev->cdev.owner = THIS_MODULE;
> -
> -	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_ctrldev;
> -	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> -
> -	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_minor_ida;
> -	dev->id = ret;
> -	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
> -
> -	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);

This turns out to be incomplete and the cdev_del above is in the wrong
place. This, and the same for eptdev, is being corrected in:

https://lore.kernel.org/linux-remoteproc/164245960510.1698571.4998090450663669237.b4-ty@linaro.org/T/#t

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
