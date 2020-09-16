Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C174026C5FF
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Sep 2020 19:29:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81C5DC3FAE1;
	Wed, 16 Sep 2020 17:29:15 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D7B0C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 17:29:12 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id o20so4355903pfp.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l5QENNkdAGMuTC5nW+iy9KsmDtcHDjxhRO+rPJdPpPM=;
 b=nkIZ1Yz1wfmopDGdAEt3hWupDEXkUSS2QDMSF+v9DPARbfQn6vsqnk8bCov1jPMn0g
 4pa8QZzKZdN88lkxxeCOw5BlWjiXdOJgAL0RThOFEVSPu0mUFsbo54bWePy/sGrnNSKl
 ZN5e8Y8mcrfC7NfnclUreQzj9thUQRob/6UsGMSvhRk3NDf2oBLZFxd8GjDN9RjmrljZ
 YxkLzqD/3RcS73PZWRjcWZZ6EoDdKYg0S4c1o+Fd6nYe0V1vir9f0Mz+XJm8TcKtDxSH
 S3Rr82PuU/NL59rs9DU0VBgx2qTeMy4yHtcANIrc7//6jaARjy49MtCEi3tYS1DpKXJD
 BINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l5QENNkdAGMuTC5nW+iy9KsmDtcHDjxhRO+rPJdPpPM=;
 b=CbNPUplULItU5rcDkt7FwMeq1o+oNHfPM548LnzchTm8+XTiO23dULv8dWe+fFDiAt
 7nrWAGSyeedlOBUmnBaGpsHdvaLKwfjpzYfwV+Xf/8ljxXggTvo7cr1/jhx4IU3w8Q7e
 Y6aex9qHovYLyZ/jWsYB2XcQJ3dk+HGcUmCBa49upatTE/bJUeUYnGtqmHU0+x1r7yGm
 dSVMp/6Ls9CG2dDIN+2WSAWP7HiAHeTPm2dB7E7Gr4f12wTL7p64Ib7TvXO0plfMKXF+
 8OcuWh8TrMZ7G5QA1ny2ZojWEJmghnT6tKOoDxVOAFPRUN7CLxD9MDcV/2lkHVPIZfz8
 N/3A==
X-Gm-Message-State: AOAM531E2iCmAXEivpHXyAKzwlPaJYyLP01sRJJGVBq9txXS15uAhYoG
 KFz92ETWoPY5l0mMKGY1/9k=
X-Google-Smtp-Source: ABdhPJxmtmqYNX393z5XpwmaQERqHPEt7Mlp1Syuz6+p5V+ykLZgZDqJP1FGN2p2enupG+I2XQqgeQ==
X-Received: by 2002:a63:6881:: with SMTP id
 d123mr19452899pgc.370.1600277350575; 
 Wed, 16 Sep 2020 10:29:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id gd17sm3230369pjb.6.2020.09.16.10.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 10:29:10 -0700 (PDT)
Date: Wed, 16 Sep 2020 10:29:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20200916172907.GK1681290@dtor-ws>
References: <20200916141941.16684-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916141941.16684-1-yuehaibing@huawei.com>
Cc: mcoquelin.stm32@gmail.com, robh@kernel.org, linux-kernel@vger.kernel.org,
 javier@osg.samsung.com, andi@etezian.org, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] Input: stmfts - Fix a & vs && typo
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

On Wed, Sep 16, 2020 at 10:19:41PM +0800, YueHaibing wrote:
> In stmfts_sysfs_hover_enable_write(), we should check
> value and sdata->hover_enabled is all true.
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
