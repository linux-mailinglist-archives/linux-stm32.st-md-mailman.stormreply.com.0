Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C755ECCF
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 20:44:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6DBFC5F1EF;
	Tue, 28 Jun 2022 18:44:07 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A3C4C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 18:44:07 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id o43so21402331qvo.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 11:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=srd0vxfduo9pXREXizXvQ1Gwi/kEACFP1rdXcY0Aglg=;
 b=QDfPPT0fYl+zbzIvYII9znFGb4s02ZWc7rdJXgoVlQii3pb6MPHXUbo2NQcshGpobE
 dWlWXPBgu4AcM4BoWih7Z1Nr6ImLeGEz2FZoCblM4qyf8MsycIzs6ej4nXX7nwNpGP6Q
 WS2wAoLm7tunOmWFHsCTXENR5aJ2dwangh3Hiy+KajaZLCQ31/GJ39i5LG+HlW0f/4Yp
 DzCT3gMR3JvAVHruRt3NJZXTCo87e7XIf3RRiCTD40KLgGYQ8Oy9U016RK3fPhyNykEI
 VcI+7whSObzV9gDqoR9iwpi6V1hWpQPbHnX1dl7fE5ec/owdsM9r7W03JXKpNXxaLmSi
 lJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=srd0vxfduo9pXREXizXvQ1Gwi/kEACFP1rdXcY0Aglg=;
 b=75bAHRQHFC7p8lPoQzd+uqvE6sMDZ48lft/WR2YQJE/hAh0JjxqBD2yNjoAsaxtqaS
 cThCR+/tKsqkDCf8uwTr3r++dm0l0EhFLcky3wOGJB+BEbhD/Louz1n0DxLSRjxYONMq
 vTxHnkyY8yAjn10AnrcHqr/yljEyGzWm2ay0mvjzY6zxlKF577OTw/eOP9vQX3aOBZqn
 gWaHOEmloxk1BxfztEnIFGZBl4vR/y6Qkhi0+ojX6XqhFyWyA+LffZrUZvA3nXoaebP6
 lRjNuTOmDkHqRAtKoKEbDFuq92EfokaUw5rW/zDme14qbaA4UzLJM3CTeVTEg5phySI0
 skpg==
X-Gm-Message-State: AJIora+thFsn4ZxESviWNyqJGjRVPrGBzj6ejEKBizEfCTKy7G59I27n
 lugi74+DL6e4rIRkuh33DHug8w==
X-Google-Smtp-Source: AGRyM1uBRJ6m7mmrK5Ju1JW1doBHC+UzIgAGX/xwYqaVx3XSmh4juFCDP3TjiYp7BZ5iZ3elpoeXxg==
X-Received: by 2002:a05:622a:7:b0:31b:74bd:1597 with SMTP id
 x7-20020a05622a000700b0031b74bd1597mr6494688qtw.677.1656441846052; 
 Tue, 28 Jun 2022 11:44:06 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 h9-20020ac85149000000b003050bd1f7c9sm9708477qtn.76.2022.06.28.11.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:44:05 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1o6GBw-0035y2-Fs; Tue, 28 Jun 2022 15:44:04 -0300
Date: Tue, 28 Jun 2022 15:44:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20220628184404.GS23621@ziepe.ca>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
 <20220628004052.GM23621@ziepe.ca> <202206281009.4332AA33@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202206281009.4332AA33@keescook>
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, linux-rdma@vger.kernel.org,
 x86@kernel.org, kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, v9fs-developer@lists.sourceforge.net,
 linux-mips@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, virtualization@lists.linux-foundation.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH][next] treewide: uapi: Replace zero-length
 arrays with flexible-array members
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

On Tue, Jun 28, 2022 at 10:54:58AM -0700, Kees Cook wrote:

 
> which must also be assuming it's a header. So probably better to just
> drop the driver_data field? I don't see anything using it (that I can
> find) besides as a sanity-check that the field exists and is at the end
> of the struct.

The field is guaranteeing alignment of the following structure. IIRC
there are a few cases that we don't have a u64 already to force this.

Jason
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
