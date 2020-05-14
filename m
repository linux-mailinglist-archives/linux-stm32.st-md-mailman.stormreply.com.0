Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F331D269B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 07:17:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CECF4C3F938;
	Thu, 14 May 2020 05:17:30 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59CC8C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 05:17:28 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id s69so3767737pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 22:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GjJPgwHAWLCdp+4b5y9We0V/4Ec6i8aFUo1gPxwMZ7w=;
 b=MkuhUNV21I7fxjv4MrVDEcmFSHwUJ9lvNGa8cXCPIn1dx62l2uSsNsmmCeUQUAS43c
 nSBL/PzySbiBqaxWXoaUqcFN4ADbjC3t4Xb9Lvu49f4EjFmeUeGrJ3izVna5vv3tvv3q
 CulRTby5nRpPCy1ASOPVRug05M2Ky27e6fZQ+faMWY3rzOeXkdzbjf/QghV0sgzv9sfU
 7TRQ58vGck02M+Wrm/1GoCQ0sdlvDSoFrEOmQo+bQB6vZ1gPEqYB4BwIA7+BHFNlhp/p
 d6BqcGuXO/C2zmjGPLXrbWachYsg3NZ1dIU9EauzT7U0aS9REMPNzBRSGJZ10hk/BUJG
 lOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GjJPgwHAWLCdp+4b5y9We0V/4Ec6i8aFUo1gPxwMZ7w=;
 b=iHyxXqDHu2bDpT8x5YI3uAN++kdck2ZYcOdVOs3p3vL5unTy9TVCA2yy18c+lNbbsi
 XZMNXteXwJ0YMEYqRJ6XRYUaOHt8RAbCGOy1zeO50sfRKN4IN2Nii+chJhLnegxY51BX
 ExC3i8UlDlsLlZxUKzAPBTcwQd9kVEdk5AR8dFeV/WVt9Wxs+LBsHi39dHTAhTPdZkxw
 NZXFhG1sI6k6O84qImHgKq+IYmXDlvAWUSY0RtqRFZRiAwWGg5rCnRAbUTcYXzPoE4CX
 gtYQnM6p3Q+X24g/7NIsZLK6gNSgq85ubiET84eNmBcRCYfvF7HjPRAJB+EJwVdcVmmM
 gnEw==
X-Gm-Message-State: AOAM532C0WgoxRwQEkuiEffMfpuihCbTGGqQm3dslHdIAnn+8OOR7taj
 U349IUnyu81F8/fsRj74hcsmcQ==
X-Google-Smtp-Source: ABdhPJwPKu284FGW2y3JeQslHbE7FXQ0tLPsAtF5Z1Sd1/eTKJSL1+BfVYzPKbw4EN2fAafX5g9fYw==
X-Received: by 2002:a17:902:c406:: with SMTP id
 k6mr2369370plk.203.1589433447383; 
 Wed, 13 May 2020 22:17:27 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id a7sm1126526pfg.157.2020.05.13.22.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 22:17:26 -0700 (PDT)
Date: Wed, 13 May 2020 22:15:56 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <20200514051556.GB396285@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-12-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-12-mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 11/12] remoteproc: stm32: Introduce new
 loaded rsc ops for synchronisation
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

On Fri 24 Apr 13:25 PDT 2020, Mathieu Poirier wrote:

> Introduce new elf find loaded resource table rproc_ops functions to be
> used when synchonising with an MCU.
> 
> Mainly based on the work published by Arnaud Pouliquen [1].
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


But I would have preferred if we during probe (when we discover rsc_va)
could just set it on the rproc.

Regards,
Bjorn

> ---
>  drivers/remoteproc/stm32_rproc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index b8ae8aed5585..dcae6103e3df 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -319,6 +319,15 @@ static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
>  	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
>  }
>  
> +static struct resource_table *
> +stm32_rproc_sync_elf_find_loaded_rsc_table(struct rproc *rproc,
> +					   const struct firmware *fw)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +
> +	return (struct resource_table *)ddata->rsc_va;
> +}
> +
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev = data;
> @@ -593,6 +602,7 @@ static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
>  	.start		= stm32_rproc_sync_start,
>  	.stop		= stm32_rproc_stop,
>  	.parse_fw       = stm32_rproc_sync_parse_fw,
> +	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
>  };
>  
>  static const struct of_device_id stm32_rproc_match[] = {
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
