Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE658A6526
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 09:32:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B9C9C6B45B;
	Tue, 16 Apr 2024 07:32:21 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDB46C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:32:19 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a524ecaf215so322505366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713252739; x=1713857539;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8R9bVOGo16amHaHdQgn3vohiOg/80cUEYV+3t7qlHzM=;
 b=VLKuBooNcCvFW+vtTzbrd/781t9iBQiP74fbk7o93eHpWJd3G/FWMUAhooILdK0OMG
 yjBfwkKHlKUMFzRuWXLRsZdOHdR+Sk26GP3VfQDAKCb3ArBB0D8/4hww7cTCowpIVIIm
 jZA1M7lvaGwHg1jANwGvyvSuP0G7PxJAh/gRus2LfTpvTcMOEAUffXUrWJaxpMDhI44v
 +BOkiKnfEQ7fzWlzRf+YMm3aZnd7NxORfXkFuwJRz/P1XOOp2E9uTXU0MOz/Mhuku80+
 pDl30jHuPj8zaWHDT6qycCgy46UlShD7+G5kUBG9I5Uvc0ulJgAiYdd1JhwxnvpKXuUG
 jl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713252739; x=1713857539;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8R9bVOGo16amHaHdQgn3vohiOg/80cUEYV+3t7qlHzM=;
 b=Y3gAqtQ/cCBzNr9jJrCg0K5LGIyFNSE3rrNI+PrD6e+Xq4uXYIYP5anuPOZl1iiqVB
 NFojOOTIuCcZUhLEmpt+CZsJTSw6ut9ULhxB+6/YYpkNVdwWXW6spYv/eV0fcDAofSIO
 dKXUVhWvsAwvNd+0EsEG0unTTp1ryrfnUPyr2CweKnlFRtF9TDl40UeTQrX/ebaTd9IH
 GrzeXjE+VZpIjBFM3SthHVtINo4UsoVbEbep9SkUOrr+07nzddUKKXRveHPe0Oc5XvoW
 Oj7S2PBO0vd2x7xbNYIF0rw/Rmpjf8yDDtadCIA+Pshp0Eb7LarrlxrTS+c8LM5ulxEK
 2+ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWkhPXR1bQkAhrz2rIHJexwHZNVWHhnrx1DUANwtgUAifYq4Mox1ANlHB2nw5qJwqYe9IRbhDzDq/dD1DIHU2dm2f/4VnpKo/qcgrCF9/BAIMYyZNlgbVR
X-Gm-Message-State: AOJu0YxrWGdXySkhQYy19JyIkPsM73ycgxSClua+a7pr8bp7OqqkUZpm
 z1gPIxMVLibeUt0y3cnHO6aYhGSxRzD1GTAyFv+owVSs6JLUz1x73YO/IAdsgIQ=
X-Google-Smtp-Source: AGHT+IEiSwmXJXJlRrwBTxtu6/XHomvPQRR0BAqxebaWeb0WkKlHDct2PHGh5ytZktKV5zyNXHYwQg==
X-Received: by 2002:a17:906:57d6:b0:a52:6c4e:25ae with SMTP id
 u22-20020a17090657d600b00a526c4e25aemr2620587ejr.44.1713252739010; 
 Tue, 16 Apr 2024 00:32:19 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 qb11-20020a1709077e8b00b00a51ab065bf0sm6421883ejc.202.2024.04.16.00.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 00:32:18 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:32:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <e5824d5b-9aa4-4b92-91a4-7e26de8b293d@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-2-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-2-477afb23728b@chromium.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sergey Kozlov <serjk@netup.ru>, Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [Linux-stm32] [PATCH 02/35] media: stb0899: Remove unreacheable
	code
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

On Mon, Apr 15, 2024 at 07:34:19PM +0000, Ricardo Ribalda wrote:
> chip_id is an unsigned number, it can never be < 0
> 
> Fixes cocci check:
> drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/stb0899_drv.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
> index 2f4d8fb400cd..222b5476ebfd 100644
> --- a/drivers/media/dvb-frontends/stb0899_drv.c
> +++ b/drivers/media/dvb-frontends/stb0899_drv.c
> @@ -1277,11 +1277,6 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
>  	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
>  	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
>  	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
> -	if (! (chip_id > 0)) {

This is not dead code.  It's possible for chip_id to be equal to 0.

regards,
dan carpenter

> -		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
> -
> -		return -ENODEV;
> -	}
>  	dprintk(state->verbose, FE_ERROR, 1, "FEC Core ID=[%s], Version=[%d]", (char*) &fec_str, fec_ver);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
