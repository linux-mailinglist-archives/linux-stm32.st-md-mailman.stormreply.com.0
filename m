Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 881BE861BAD
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 19:32:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BA0EC6B47E;
	Fri, 23 Feb 2024 18:32:55 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A409C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 18:32:53 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6e4e2380588so562520b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 10:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708713171; x=1709317971;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dXNKJkVEkUZdoKeA6PbFxQU2RahxqYWMcCRd6gZZ97g=;
 b=YGRzF3AVQVevvRie8fYtb2weGurvvQ5uQP6EKHg2NMFA3ljA7n2eeUwDXELLvZv276
 XGuFsBhdLQGrc8X4WVEnAw4Otf3MuQMSXswWAGSTI0ks3keQnpJvl/N+LThlVOEiIwz3
 C2xYAJoJUxfIzNTIL/Q0UJK6+0QEWIXb2Fx1MGMPUlHqM1ATfCibj4aQdE+IQIkIe+8U
 XGYtROH1W6ggDvdPCWXAYC+uapxT4vXDrVfjSMfVBRY3HGNPQJkb1SIw0B2NfIQ2dfGX
 RS+QyJ/8HE5NOySm4dHYSkWr92GikSSQJjVZSTP2gimiOfzyVSQALPN8kHls2Ym0AbCj
 MYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708713171; x=1709317971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dXNKJkVEkUZdoKeA6PbFxQU2RahxqYWMcCRd6gZZ97g=;
 b=Rud3OnlZhejYDdfFNNCWVP1fgPCj4yL4EJ65W1aQfcsVNMyZP3mB/Tr/FccOXOSLjk
 7HAlboWzLSYQ+jiUnRB3vmv3o4SJnaNMprpIZooyTryCQrB5OcB8vZz8dgTdkZTmSyrY
 Hk0jdx+aSAFrPUilexr2vhmEcPrc4A8B92WF9DZfkCuGz7CM17W/Tm1ItHsjUpFJpPxW
 XiqAiEV3Jrwb1OdaD04V6uCZqbDo2EdMY9MU9tBfVDHDnuPXo6CA+vZKcUBZjT82llSF
 awhrY7RHCBz4VyD+JYjkUEQORKGGfRIeBpCAaG2Tch7pVAWqbG1Wh+w8xyWjI8zLtbYV
 XNLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMgLELqhZHB5eR9c5ul/vKZ3fUJGf4AIU35hIvdgjYjhdvId2TS+Nyw9X9N2zUnw4Jx+cwOJ7rpeChpXTfGi5OGwMiJOuSgs5rsrAABOuKC+VbKZDw4HgV
X-Gm-Message-State: AOJu0YxbqjQnVrOfcz5RWZoFejITEcE15rpMttQiHCU9b6mAAbMzvdNt
 ctXvOzSgxYcUhMMcYLbC1tBcrsvbkY5KthURFAPdy3t25/hZiCPIXS8rzUX8bCc=
X-Google-Smtp-Source: AGHT+IG4UQYH68MX7y3iRYfp2fJ92YT55kxRllR+ksVeb/ZiaoCE5+Ml7rd1sXmqZO+dsdfexxhreQ==
X-Received: by 2002:a05:6a00:2310:b0:6e4:cf7c:6c28 with SMTP id
 h16-20020a056a00231000b006e4cf7c6c28mr599071pfh.22.1708713170112; 
 Fri, 23 Feb 2024 10:32:50 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a9ba:9d9e:b797:23f1])
 by smtp.gmail.com with ESMTPSA id
 fn21-20020a056a002fd500b006e47e3e139esm7520820pfb.26.2024.02.23.10.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 10:32:49 -0800 (PST)
Date: Fri, 23 Feb 2024 11:32:47 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <Zdjkz9bgaz+QkLg1@p14s>
References: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
 <20240214172127.1022199-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214172127.1022199-4-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/7] remoteproc: core: Add check on
 cached_table pointer
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

On Wed, Feb 14, 2024 at 06:21:23PM +0100, Arnaud Pouliquen wrote:
> Add a check on the optional rproc->cached_table to perform the memory
> copy only if it is not null.
> 
> 2 use cases to support:
> - starting on boot, in which case rproc->cached_table can be null,
> - starting on crash recovery, where the cached table is used to save
>   the resource table configuration on stop and re-apply the configuration
>   on the re-start.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 283ca071e35c..34b0093689da 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1278,7 +1278,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	 * that any subsequent changes will be applied to the loaded version.
>  	 */
>  	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> -	if (loaded_table) {
> +	if (loaded_table && rproc->cached_table) {

... and this becomes:

        if (loaded_table != rproc->cached_table)

with a detailed comment about what is going on and a reference to
tee_rproc_parse_fw().

There are other things to adjust in this patchset but starting with that will
hopefully deal with a few of them.  We can address the rest at the next
iteration.

I am done reviewing this set.

Thanks,
Mathieu
>  		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>  		rproc->table_ptr = loaded_table;
>  	}
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
