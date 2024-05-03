Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B98BAAB7
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 12:28:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A47AFC712A2;
	Fri,  3 May 2024 10:28:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4028C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 10:28:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 542A760A69;
 Fri,  3 May 2024 10:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C52C116B1;
 Fri,  3 May 2024 10:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714732094;
 bh=OntdBaerXi3AJ/zLXyZcNtMvP/PzL6ZafwOb4BeMmI8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CVexwY3lU9pEyrjVDtImt5My3VLqjq0O6pu4tXHAYXra+R/yyivA0NvhfTLZ09e0A
 cxbBIdKBwsREn30DGoNQVdBGNnjfuk75/VpipXdN/6ZvWZCfIKVtqVsOxiXD66T88L
 3sCcvCfpeYvNOoP9K2/otFr5CSejsUV24l3x7xiLmlJ2OYwtrX4t6Z6ZRbVrQ+yG7x
 8TpvvQD0STMgj41jXX4MiXNiccAK0MNa6GSxqKlDQTZ05zw2Bzltst6RLpU6SK1jGx
 3MalcpgYNan36bYB7hjf438rPRn0mK7fZRYgacV4KlzCbym7pY6M6KQ7QdGTsVih8M
 SjyAg0MIerKAg==
Date: Fri, 3 May 2024 11:27:58 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <20240503112758.763d8d31@sal.lan>
In-Reply-To: <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sergey Kozlov <serjk@netup.ru>,
 Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH v3 26/26] media: dvb-frontends: tda10048:
 Make the range of z explicit.
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

Em Mon, 29 Apr 2024 15:05:05 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> We do not expect the sample_freq to be over 613MHz.
> 
> Found by cocci:
> drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/tda10048.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> index 3e725cdcc66b..1886f733dbbf 100644
> --- a/drivers/media/dvb-frontends/tda10048.c
> +++ b/drivers/media/dvb-frontends/tda10048.c
> @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>  			     u32 bw)
>  {
>  	struct tda10048_state *state = fe->demodulator_priv;
> -	u64 t, z;
> +	u32 z;
> +	u64 t;
>  
>  	dprintk(1, "%s()\n", __func__);
>  
> @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>  	/* t *= 2147483648 on 32bit platforms */
>  	t *= (2048 * 1024);
>  	t *= 1024;
> +	/* Sample frequency is under 613MHz */

Are you sure about that? Some DVB devices have very high frequency 
clocks, specially if they're also used for satellite, so I can't
be sure by just looking at the driver's code.

Also, we had already a bunch of regressions with "fixes" like this
that actually broke frontend drivers.

If you're sure, please add a note at the description mentioning 
on what part of the datasheet you got it.

Otherwise, let's stick with the current code and address cocci
warning on a different way.

Regards,
Mauro

PS.: I partially applied this patch series. I left a few
patches out of the merge to let other people review/comment
(and/or for me to take a deeper look later on).

Regards,
Mauro
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
