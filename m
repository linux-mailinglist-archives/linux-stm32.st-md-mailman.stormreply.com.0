Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 730DC716915
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 18:20:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF811C6A613;
	Tue, 30 May 2023 16:20:53 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02D93C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 16:20:52 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-25691a1b2b8so1325221a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 09:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685463651; x=1688055651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vf4YK7Nlt1xMm1TWJQkBoFqPmDurlTxDp8HiK/k4M8k=;
 b=VjGC5EGOqpWtBh+mIxKe7Jr2JgXDaZaiVvkxKwrmhnXgWfX8Vxd90dSarJ5pyfyIG4
 DI/4s4lFuf929W4CVXxTBTAyblpUiNV9MG/mQAaZ8YLhccAmXasXKDV3JGSRg77PgFZf
 IkVKZprTL0nTEc9FQ9yhI8Fi65/hmkZt4rkQ/GsI3DXr4gC7kQ7apCemi6NhXu23gJfp
 qzBq0yqJ0HP7nEFCbNLZttq/HtbDMWII9eSidc0CR+JHEuOm4uXRd6gKzDb0FxsrrWWM
 z2N2D05S5LZml3cCs2UpK2IiFT63UMNoUo1v3rJwMN41Fk36hrhEzJy60Wr6NVhH6wFs
 HriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685463651; x=1688055651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vf4YK7Nlt1xMm1TWJQkBoFqPmDurlTxDp8HiK/k4M8k=;
 b=dEmjT9G2V+xkpu9RNP+eXpgQPGNmpPjQHtrZV7e/kyuLKJoY9MovRJutRLCW3wIOVg
 8n4plvyV31L4wm0x0Oz73kvbmIsiS0jNiQDTalW278YSV5xWRSRtWI7rdgmkMp4P20v9
 NABi83clepOWYP1qz+Ze4ZAsducouWW/AyVf+eZSkuc1WNOxbufnViqIkE9ydiyAF0kh
 nRxwLKNklKJAhwNvDwNM5HjRc08hleJyVzWkJZQ6oCepgmtmLOFfXPWo0Z0XGMe6PTDk
 NiOVicwZNLIdEzjA5DuXxO9Isunr5KZi94vhtEaCjcpNOkfTI8/TETxMhAUWDYD74V7v
 uTUw==
X-Gm-Message-State: AC+VfDwJQZh+1EhxbJMbE/x2UbShdirmGPq9BWm2dNms2/DxVQo1J8/7
 46naptmAF481LjYGO+8gMzUsLQ==
X-Google-Smtp-Source: ACHHUZ6l87ILYGpW4MUVWIF+xyHlCkMCs7tBbloFyheBZTZyYhcowO1DlaakYntogeCKPeP80JhOKA==
X-Received: by 2002:a17:90a:c695:b0:256:c44d:e115 with SMTP id
 n21-20020a17090ac69500b00256c44de115mr2309344pjt.12.1685463651451; 
 Tue, 30 May 2023 09:20:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ec0e:68f8:4f49:7581])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a634d03000000b0053f3797fc4asm8370567pgb.0.2023.05.30.09.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 09:20:51 -0700 (PDT)
Date: Tue, 30 May 2023 10:20:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZHYiYGMHdqxBaDzc@p14s>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 0/4] introduction of a remoteproc tee
 to load signed firmware images
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

On Tue, May 23, 2023 at 11:13:46AM +0200, Arnaud Pouliquen wrote:
> This RFC proposes an implementation of a remoteproc tee driver to
> communicate with a TEE trusted application in charge of authenticating
> and loading remoteproc firmware image in an Arm secure context.
> 
> The services implemented are the same as those offered by the Linux
> remoteproc framework:
> - load of a signed firmware
> - start/stop of a coprocessor
> - get the resource table
> 
> 
> The OP-TEE code in charge of providing the service in a trusted application
> is proposed for upstream here:
> https://github.com/OP-TEE/optee_os/pull/6027
> 
> For more details on the implementation a presentation is available here:
> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
> 
> Arnaud Pouliquen (4):
>   tee: Re-enable vmalloc page support for shared memory
>   remoteproc: Add TEE support
>   dt-bindings: remoteproc: add compatibility for TEE support
>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> 
>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  33 +-
>  drivers/remoteproc/Kconfig                    |   9 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/stm32_rproc.c              | 234 +++++++++--
>  drivers/remoteproc/tee_remoteproc.c           | 397 ++++++++++++++++++
>  drivers/tee/tee_shm.c                         |  24 +-
>  include/linux/tee_remoteproc.h                | 101 +++++
>  7 files changed, 753 insertions(+), 46 deletions(-)
>  create mode 100644 drivers/remoteproc/tee_remoteproc.c
>  create mode 100644 include/linux/tee_remoteproc.h

Looking at comments from Christoph, there seems to be a good refactoring
exercise in store for this pathset.  As such I will wait for the next revision
to look at it.

Thanks,
Mathieu

> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
