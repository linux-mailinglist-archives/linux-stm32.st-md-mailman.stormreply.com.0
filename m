Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 089008398EF
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jan 2024 20:01:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1419C6DD6D;
	Tue, 23 Jan 2024 19:01:40 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45F66C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 19:01:39 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1d51ba18e1bso41741345ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 11:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706036498; x=1706641298;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QftPz4jN6kiEorTzivfoGB9qpSpYd51y/PnesCdYvNE=;
 b=VoSw9P/L+SMlVX9ets3pqAeKIE8tdxRVKMQxkK6cGKzZlBhiv5vxIa9ns7ySlFv+Q7
 k975Q5mQIO7gQyDwAR0X+lAdJxvQRedOtxgA4iRq/7INbYiEALf2AQrBxt0Dg+PM3nTn
 UYsWNoqny2CatRsaYxXqtxUqlHloC7xYknzWxW+1OTRTukLN741pw+tpzUc3OntzAyZp
 aqWwu30k26SMuZbxtbcxbrXNxO+gmfQhCWFbpkDwkyfXz/znzolbvrSZ64ZspSvjlOfv
 mmcEECCf4oEW9IkVdJ6K47nvNDYXDIlMoaXUicuOuB16M6u6in6LeEKXFkRQYn0naxNZ
 Mu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706036498; x=1706641298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QftPz4jN6kiEorTzivfoGB9qpSpYd51y/PnesCdYvNE=;
 b=X+DX1gDKA5G6UVH+TDKdwjh2v5RJ6nptUrqxk2sETequgbh6HjZfiSkSsHBx5iDbHh
 DlNKVAJfods4pE6C3NUvee7x3e3BukbjwPkC68a6sNh8Jf9wC7/rvIXWQXMztrv4Erz9
 oc80bqMzXyG4JZUoxWxwtUpzTVgsihH1HMFyMkz1kDpwcoTs6FaMfA1md1Y8WOWTLpj9
 IAZdv8zWG4rWKcog9+Cf9OLwozFJOMPTIaMw3P5+pDZ5E1Et9lJ8H7WaJsY1MRVqLI8e
 vOS/ukJRJeSOFn1APWgML02sjSEA66c6c2RNvxUiEX5m2JWO3aTM2ikCLOOMdO+N1jQu
 q8BQ==
X-Gm-Message-State: AOJu0YxfqZG8H+f/P3x9BIBoZOBjyPJuiiiNK5JMob65SjmE68qC48vp
 W1goxvLmX3KhiajVG2xbycUq4lXsdh7Fq/rM0mJ8CWc6uyohG5y/2MsXGuaq2p0=
X-Google-Smtp-Source: AGHT+IGSBclA+Hqx0rOpncJoFhZkG7syO/DKiq9G4IhsfvHgLmfHisQAwDJNkh3QWq8BBP9daPAqKg==
X-Received: by 2002:a17:902:ebc6:b0:1d7:78ed:4b7e with SMTP id
 p6-20020a170902ebc600b001d778ed4b7emr909437plg.35.1706036497410; 
 Tue, 23 Jan 2024 11:01:37 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:e343:f944:5fc8:eec1])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170902db0a00b001d7069c0302sm8956884plx.272.2024.01.23.11.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 11:01:37 -0800 (PST)
Date: Tue, 23 Jan 2024 12:01:34 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZbANDtaHHY5CkC43@p14s>
References: <20240117135312.3381936-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117135312.3381936-1-arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/2] remoteproc: stm32: Fix sparse warnings
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

On Wed, Jan 17, 2024 at 02:53:10PM +0100, Arnaud Pouliquen wrote:
> Fix warnings reported by sparse using make option "C=1"
> 
> Arnaud Pouliquen (2):
>   remoteproc: stm32: Fix incorrect type in assignment for va
>   remoteproc: stm32: Fix incorrect type assignment returned by
>     stm32_rproc_get_loaded_rsc_tablef
> 
>  drivers/remoteproc/stm32_rproc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

I have applied this set.

Thanks,
Mathieu

> 
> base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
