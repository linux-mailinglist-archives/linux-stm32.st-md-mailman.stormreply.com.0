Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 192345F4A45
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Oct 2022 22:25:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B973DC640E7;
	Tue,  4 Oct 2022 20:25:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDA47C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 20:25:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2B5B6150F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 20:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233C6C433D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 20:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664915129;
 bh=Gp9cdLKe6m1kFsqSy/5mBkVFGvqBOxid7eIAjNrmn4E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nmtazlZPq0y5BWW/hH+YOfV3we9ePhnGDhBq819JwdhXmgXfLP7wcAXri7odudhtb
 K98sz/q2JC+nJPlk+dypfuB7MaijOfasddK4peYyZW3a4coNDviVrAl6DaP+ZavXGg
 KVaobbZESAajfuSsoyROTYZ1xxFGtQauZ68ZHvUMb1+NxJObLAk8f5JaQ2xN+AwWpq
 /RHmKWEoA3GeSVNBj+3qIqOofjGrUgY/8nbq8KYIbtg8j/gloAybY/fhwcli9a/EiE
 DvC3ETiQhtI9dkMCLcRUAM+JZIpPrbARbga4puDl5NEihKycRhsVMl+a/FdKsYtPxF
 ZhVVAm1O7obFg==
Received: by mail-vs1-f41.google.com with SMTP id d187so15888687vsd.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Oct 2022 13:25:29 -0700 (PDT)
X-Gm-Message-State: ACrzQf2fqFBb97tzzdfO6zplXMFdZuYzeHc0+QRS1fSIM2ZddrAZktx0
 1coXlaFL6Ksit+tycITMg6mt07aldp5Lpq2Bsg==
X-Google-Smtp-Source: AMsMyM73U8/w0X5x9WHM1FGcPigF80k5hOdTK5S6tGVEPqEjkoUEvCSHJHfIqeA8+uStNeAYXF5Qul0qcPwrqqDMEF0=
X-Received: by 2002:a05:6102:3fa7:b0:3a6:72a4:3188 with SMTP id
 o39-20020a0561023fa700b003a672a43188mr6081434vsv.0.1664915128118; Tue, 04 Oct
 2022 13:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221004174018.3319712-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20221004174018.3319712-1-arnaud.pouliquen@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Oct 2022 15:25:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKohUguae=s8+eH8afPchtJMnXzE-V-QF+H=yEkD3WbOA@mail.gmail.com>
Message-ID: <CAL_JsqKohUguae=s8+eH8afPchtJMnXzE-V-QF+H=yEkD3WbOA@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: virtio: Fix warning on
 bindings by removing the of_match_table
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

On Tue, Oct 4, 2022 at 12:40 PM Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> The checkpatch tool complains that "virtio,rproc" is not documented.
> But it is not possible to probe the device "rproc-virtio" by declaring
> it in the device tree. So documenting it in the bindings does not make
> sense.
> This commit solves the checkpatch warning by suppressing the useless
> of_match_table.
>
> Fix-suggested-by: Rob Herring <robh@kernel.org>
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 6 ------
>  1 file changed, 6 deletions(-)

There might be an include you don't need anymore, but otherwise:

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
