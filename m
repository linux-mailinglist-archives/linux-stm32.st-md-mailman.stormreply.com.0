Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 924404D85C2
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 14:10:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5052CC60468;
	Mon, 14 Mar 2022 13:10:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1B2BC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 13:10:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6832061180;
 Mon, 14 Mar 2022 13:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD52C340F4;
 Mon, 14 Mar 2022 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647263416;
 bh=OBsH32SjfImTKdIFeqvuOy2qDlC46bBa8wDT6FSKdbM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DAVj1ByBt79KtNtPHtU5zXvZRDutA5kApkHANV/eigsree1RcJAEuSX6H4IYyb2aW
 vYNIA52qquCy91eM4cnDHyMhx/806ak8xEjzbKL++6rzx+LSLP/ejxcu9ET/DVcNRp
 KBALhthOq0JA6VPFJrDRrvAAsxH/ZxmqSNV4MUphu1tJNCtSfHqTApO4PkYWGjwbMV
 Xp+zb+EdiqsR7Zx14HYkLLLiPFcM1c5ONLwazaLSSgoBbqDHyy4GFrnR60z360RqRA
 oCDCGrJ2oxrNDMUx6+KVJ5SUDAl+HBLpjSL4zFScwIBFW/NSYCKGVLPKoDN74lFdqA
 TkBaZomph875w==
Date: Mon, 14 Mar 2022 14:10:08 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <20220314141008.13e32acd@coco.lan>
In-Reply-To: <1122a956-0650-f948-512b-d3447e34df30@foss.st.com>
References: <cover.1647167750.git.mchehab@kernel.org>
 <dc5be62a56ac19c6f49f4c8432558fd7b0efe7e6.1647167750.git.mchehab@kernel.org>
 <20220314083942.GA526468@gnbcxd0016.gnb.st.com>
 <20220314121454.7432e231@coco.lan>
 <1122a956-0650-f948-512b-d3447e34df30@foss.st.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, Leon Romanovsky <leon@kernel.org>,
 Dmitriy Ulitin <ulitin@ispras.ru>, Alain Volmat <alain.volmat@foss.st.com>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Dillon Min <dillon.minfei@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Niklas =?UTF-8?B?U8O2ZGVybHVu?= =?UTF-8?B?ZA==?=
 <niklas.soderlund+renesas@ragnatech.se>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Eugen Hristev <eugen.hristev@microchip.com>, Ming Qian <ming.qian@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH 17/24] media: platform: rename stm32/ to
	sti/stm32/
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

Em Mon, 14 Mar 2022 12:34:47 +0100
Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com> escreveu:

> Hi Mauro,
> 
> Ideally we would like to stick to sti/ and stm32/ at same level, as it 
> is done in various other locations:
> 
> ./Documentation/arm/sti/
> ./Documentation/arm/stm32/
> 
> ./arch/arm/mach-sti
> ./arch/arm/mach-stm32
> 
> ./drivers/media/cec/platform/sti/
> ./drivers/media/cec/platform/stm32/
> 
> ./drivers/gpu/drm/sti/
> ./drivers/gpu/drm/stm/
> 
> ./sound/soc/sti/
> ./sound/soc/stm/
> 
> Is this possible to keep those media folders as is ?

If we add them under:
	./drivers/media/platform/stm/sti/
	./drivers/media/platform/stm/stm32/

They'll both be at the same level. 

It has been increasingly hard to maintain media/platform, as the file
become too big and disorganized. Sorting it per-vendor seems to be the
best thing, as it will keep things better organized. 

As a side effect, with such kind of change, it is now possible to 
have a MAINTAINERS entry that would point to a mailing list and/or 
some SoC maintainers/reviewers that should be c/c to all patches 
affecting drivers/media/platform/<vendor>.

Thanks,
Mauro
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
