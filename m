Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D23286CB8CF
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 09:56:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D34EC6A5FA;
	Tue, 28 Mar 2023 07:56:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BBA2C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 07:42:46 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j24so11160001wrd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 00:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679989366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=reWFyQdHA0Txjoyw/asL10WD0B3MGC9C1OYGnj8cjLU=;
 b=WCqPg7kj6QzLXEOVdoQ1xMWD4fQdgnzUfP73CB10wcAeR2+Rvyv6nLGcAmRfEqAPBN
 uxsVum3wm7djw1PR/wmloQ3SbizDsX/f0KKbyGVdMrIp1eRklDFd+0mUKYHzhJWdy3Ok
 hoK4vhXeeWa7NGRBpfPq9ZeaL9R9E2inGfpoDAD+bZT41NplWgWq2QHxWZWGRX5Pb21M
 yjGyPJV7+LorCR4Qv1Ro9oWOXMjVTMoyQR2HW502gC1l5q/gCpND23aQMEfoLZezPoYG
 NkrPghb3zVtL3KeYo3roJmiQrOEArrxbSVIX7vN/EG+zdE89GSbv5TpVUBTU3imGpeUE
 Ak9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679989366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reWFyQdHA0Txjoyw/asL10WD0B3MGC9C1OYGnj8cjLU=;
 b=MwKZrXcRdq3lQs1htscnWm/CzZRjxxgUWE8I00lgjYKmD17pWjGNth5M2qYToPETT5
 JGf2tHEpcGHZNMgKm5/ivUTRXykyp1q4Bx/TgGxoows5fiDgy16z8gh/NvpNz0FMnYcn
 hd/gUGGQCTQNBVbIBmhspFx+FWWbXNa96gO0UtsGYIZJSM7XI6ODQVgYixeNrW03p1x4
 7Cs7EYVgDPIGJaR8J3NDaLgvePMdzCPhPtXHxROuRoeP4yQIgKd30DVMPVrfcaB89157
 3LuQsJs6WNt3jFXHGJsdmkUfIxvVLSLCS+tgaiTSoOXDFK7NZvH6WvJMI8FIKCDfTjMz
 V1wQ==
X-Gm-Message-State: AAQBX9fwKKkMhsRxzpVhrZDvCfnel+oqYCQ//qvdhBEJAxnLJu/w/3u5
 45AqbMP6n6lSXZhEXk27bgk=
X-Google-Smtp-Source: AKy350ae8pPppl5m9E/fAgObS0u170HobthBF6NK9Qjbn7LyCnoBrzLmAj4S8NpGj1TURzpOwmkCFg==
X-Received: by 2002:a5d:5691:0:b0:2d7:d4b:b33 with SMTP id
 f17-20020a5d5691000000b002d70d4b0b33mr12209300wrv.21.1679989365793; 
 Tue, 28 Mar 2023 00:42:45 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 v7-20020a5d4b07000000b002c56af32e8csm26731234wrq.35.2023.03.28.00.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 00:42:45 -0700 (PDT)
Date: Tue, 28 Mar 2023 10:42:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yu Zhe <yuzhe@nfschina.com>
Message-ID: <fdcfe2ae-fa49-4758-8b5c-b853cc6a0b80@kili.mountain>
References: <20230328015749.1608-1-yuzhe@nfschina.com>
 <20230328024907.29791-1-yuzhe@nfschina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230328024907.29791-1-yuzhe@nfschina.com>
X-Mailman-Approved-At: Tue, 28 Mar 2023 07:56:36 +0000
Cc: liqiong@nfschina.com, kernel-janitors@vger.kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v4] remoteproc: remove unnecessary (void*)
	conversions
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

On Tue, Mar 28, 2023 at 10:49:07AM +0800, Yu Zhe wrote:
> Pointer variables of void * type do not require type cast.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303272213.jOYrwBZu-lkp@intel.com/
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
> ---
> 
> v3->v4:
>  Drop wrong modifies

Seems okay.  (I haven't tried compiling it or anything).

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
