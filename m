Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1499CB1DE88
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 22:56:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4B83C36B1E;
	Thu,  7 Aug 2025 20:56:25 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D609EC36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 20:56:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 45851A5678A;
 Thu,  7 Aug 2025 20:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32684C4CEEB;
 Thu,  7 Aug 2025 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754600181;
 bh=BX04sWEIDsCaRBan7PyYb0KpNjHE60LvB/JqYRa6tAY=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=XOpAmv85RAoFTprnPROYoP6S6zGA1Mj2ECQ3JR9+naoX0dnS6SjFrVuczAPp1DIM6
 OvO5plgxXhpdlmBB1QC8K0GjYB/iFnkQDT9v5iQmAYQdsW8ga7EWvj+Sd3xqE6zHlv
 J5qfEEb7GQeqSwVSheUZQ/Ag2yi6pKp33xuH0TGcBjQd1xeu28dbOt8z+KBQqmitgn
 uAycxisUp+vCKzfDFqmmyZL8N3XMcvqkHJEszmXCEemAHeiFjDX8PkQ4pG1yMd5X8K
 4GywTKEq1u8Pq8scoMO5CLpEDPtSNri+67angPs5ca1SAuqxtiyyz18sGCxiXQjdA6
 KOR0Tv4tbfmfA==
Message-ID: <7d2f307c-ab21-47b0-afaf-0ba51ffbd215@kernel.org>
Date: Thu, 7 Aug 2025 22:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-65-eb140ddd6a9d@ideasonboard.com>
 <5bda2b73-0538-41d1-b065-9b541a027475@kernel.org>
 <28ddf35a-3e7a-4470-8305-c64a551fd8c7@kernel.org>
 <20250807203328.GI11583@pendragon.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250807203328.GI11583@pendragon.ideasonboard.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Devarsh Thakkar <devarsht@ti.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Steve Longerbeam <slongerbeam@gmail.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Nas Chung <nas.chung@chipsnmedia.com>, Andy Walls <awalls@md.metrocast.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-usb@vger.kernel.org,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Ming Qian <ming.qian@nxp.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-doc@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Yanteng Si <si.yanteng@linux.dev>,
 Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Dongliang Mu <dzm91@hust.edu.cn>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jerome Brunet <jbrunet@baylibre.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 linux-media@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, imx@lists.linux.dev,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Mike Isely <isely@pobox.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>, linux-staging@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bin Liu <bin.liu@mediatek.com>,
 mjpeg-users@lists.sourceforge.net,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>, Tomasz Figa <tfiga@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Alex Shi <alexs@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Benoit Parrot <bparrot@ti.com>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [Linux-stm32] [PATCH 65/65] media: v4l2-ioctl: Stop passing fh
 pointer to ioctl handlers
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

On 07/08/2025 22:33, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Thu, Aug 07, 2025 at 09:58:34AM +0200, Hans Verkuil wrote:
>> On 07/08/2025 09:26, Hans Verkuil wrote:
>>> On 02/08/2025 11:23, Jacopo Mondi wrote:
>>>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>
>>>> Now that all drivers access the v4l2_fh from the file structure, there
>>>> is no need to pass it as an explicit argument to ioctl handlers. Set the
>>>> argument to NULL in the w__video_do_ioctl(), and drop the name of the
>>>> void *fh argument in the ioctl handler declarations to indicate it is
>>>> not used.
>>>>
>>>> The argument could be removed altogether with a mechanical change
>>>> (probably using coccinelle), but there are plans to pass a new argument
>>>> to the ioctl handlers in the near future. The tree-wide change to remove
>>>> the argument, only to add another one soon after, would be too much
>>>> churn.
>>>>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-ioctl.c |   5 +-
>>>>  include/media/v4l2-ioctl.h           | 236 +++++++++++++++++------------------
>>>>  2 files changed, 120 insertions(+), 121 deletions(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> index 44c2f5ef3dae407d9786c5278d13efc982be2ff0..248a0b5b56ec7a09f2d4c61114f81aa5a9b8b041 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> @@ -3078,7 +3078,6 @@ static long __video_do_ioctl(struct file *file,
>>>>  	bool write_only = false;
>>>>  	struct v4l2_ioctl_info default_info;
>>>>  	const struct v4l2_ioctl_info *info;
>>>> -	void *fh = file_to_v4l2_fh(file);
>>>>  	struct v4l2_fh *vfh = NULL;
>>>>  	int dev_debug = vfd->dev_debug;
>>>>  	long ret = -ENOTTY;
>>>> @@ -3140,11 +3139,11 @@ static long __video_do_ioctl(struct file *file,
>>>>  
>>>>  	write_only = _IOC_DIR(cmd) == _IOC_WRITE;
>>>>  	if (info != &default_info) {
>>>> -		ret = info->func(ops, file, fh, arg);
>>>> +		ret = info->func(ops, file, NULL, arg);
>>>>  	} else if (!ops->vidioc_default) {
>>>>  		ret = -ENOTTY;
>>>>  	} else {
>>>> -		ret = ops->vidioc_default(file, fh,
>>>> +		ret = ops->vidioc_default(file, NULL,
>>>>  			vfh ? v4l2_prio_check(vfd->prio, vfh->prio) >= 0 : 0,
>>>>  			cmd, arg);
>>>>  	}
>>>
>>> drivers/media/v4l2-core/v4l2-compat-ioctl32.c also calls ops->vidioc_query_ext_ctrl
>>> directly, but still passes the fh as second argument: that needs to be replaced by
>>> a NULL pointer as well. That should be fixed in this patch as well.
> 
> Oops, I missed it. Will be fixed in v2.
> 
>>> Regarding v4l2-ioctl.c: I would like a follow-up patch that pushes the NULL pointer
>>> down into each ioctl helper function. I.e. drop the 'void *fh' argument in the
>>> struct v4l2_ioctl_info 'func' callback, and all callbacks like v4l_g_fmt() just
>>> replace 'fh' by 'NULL' when they call the vidioc op.
> 
> I'll add a patch in v2.
> 
>>> Part of it is that the core functions currently suggest that the second argument is
>>> a filehandle (since it's still named 'fh'), which is obviously wrong. And I also think
>>> that the core framework shouldn't use a dummy second argument at all. I admit that
>>> changing all vidioc callbacks in the whole subsystem to drop the second argument is
>>> too much churn, but for this core file I think it is something that should be done.
>>
>> A follow-up on this: I would not be against a large patch that drops the second priv
>> argument from all vidioc ops since it is now unused. If nothing else, it helps ensure
>> that it is really unused by all drivers :-)
> 
> I've considered that. We're working on introducing a video_device_state
> that will likely be passed as an argument to the ioctl handlers, and we
> thought that not removing the void *priv argument yet could mean less
> churn in drivers when we add the new argument, taking over the void
> *priv. However, the state should be passed through an explicitly typed
> pointer, so we'll have to patch all drivers anyway. I suppose we could
> drop the void pointer now, and add a new pointer later. What do you
> think ?

It depends on how what you think is the ETA for the video_device_state :-)

I think we can shelve this for now, but as mentioned below, at least replace
'fh' by 'priv' for the test drivers, pci skeleton driver and (I think) uvc.

Regards,

	Hans

> 
>> But if you don't want to go there, then there is something that I think need to be addressed:
>> a lot of drivers name the second argument 'fh' or '_fh' or even 'fh0'. Can we add a patch that
>> renames the second arg to 'priv'?
>>
>> At minimum I think this should be done for drivers/media/test-drivers and
>> samples/v4l/v4l2-pci-skeleton.c. These drivers are often used as reference drivers,
>> so they should be up-to-date.
>>
>> I would also suggest to do this for uvc since it is by far the most widely used media
>> driver.
>>
>> I also see the use of 'fh' in v4l2-mem2mem.c in a few places.
>>
>>>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
>>>> index 82695c3a300a73219f262fb556ed61a8f09d273e..223e2c7a3516fc96fb486ab64226163e52f775a6 100644
>>>> --- a/include/media/v4l2-ioctl.h
>>>> +++ b/include/media/v4l2-ioctl.h
>>>> @@ -293,144 +293,144 @@ struct v4l2_ioctl_ops {
>>>>  	/* ioctl callbacks */
>>>>  
>>>>  	/* VIDIOC_QUERYCAP handler */
>>>> -	int (*vidioc_querycap)(struct file *file, void *fh,
>>>> +	int (*vidioc_querycap)(struct file *file, void *,
>>>>  			       struct v4l2_capability *cap);
>>>>  
>>>>  	/* VIDIOC_ENUM_FMT handlers */
>>>> -	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *,
>>>>  				       struct v4l2_fmtdesc *f);
>>>> -	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *,
>>>>  					   struct v4l2_fmtdesc *f);
>>>> -	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *,
>>>>  				       struct v4l2_fmtdesc *f);
>>>> -	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *,
>>>>  				       struct v4l2_fmtdesc *f);
>>>> -	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *,
>>>>  				       struct v4l2_fmtdesc *f);
>>>> -	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *,
>>>>  					struct v4l2_fmtdesc *f);
>>>> -	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *,
>>>>  					struct v4l2_fmtdesc *f);
>>>>  
>>>>  	/* VIDIOC_G_FMT handlers */
>>>> -	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *,
>>>>  					struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_vid_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_vid_out)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *,
>>>>  					    struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *,
>>>>  					   struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *,
>>>>  					   struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *,
>>>>  					   struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *,
>>>>  					   struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *,
>>>>  				     struct v4l2_format *f);
>>>> -	int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_fmt_meta_out)(struct file *file, void *,
>>>>  				     struct v4l2_format *f);
>>>>  
>>>>  	/* VIDIOC_S_FMT handlers */
>>>> -	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *,
>>>>  					struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_vid_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_vid_out)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *,
>>>>  					    struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *,
>>>>  					   struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *,
>>>>  					   struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *,
>>>>  					   struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *,
>>>>  					   struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *,
>>>>  				    struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *,
>>>>  				     struct v4l2_format *f);
>>>> -	int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fmt_meta_out)(struct file *file, void *,
>>>>  				     struct v4l2_format *f);
>>>>  
>>>>  	/* VIDIOC_TRY_FMT handlers */
>>>> -	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *,
>>>>  				      struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *,
>>>>  					  struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_vid_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_vid_out)(struct file *file, void *,
>>>>  				      struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *,
>>>>  					     struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *,
>>>>  				      struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *,
>>>>  				      struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *,
>>>>  					     struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *,
>>>>  					     struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *,
>>>>  					     struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *,
>>>>  					     struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *,
>>>>  				      struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *,
>>>>  				      struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *,
>>>>  				       struct v4l2_format *f);
>>>> -	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_fmt_meta_out)(struct file *file, void *,
>>>>  				       struct v4l2_format *f);
>>>>  
>>>>  	/* Buffer handlers */
>>>> -	int (*vidioc_reqbufs)(struct file *file, void *fh,
>>>> +	int (*vidioc_reqbufs)(struct file *file, void *,
>>>>  			      struct v4l2_requestbuffers *b);
>>>> -	int (*vidioc_querybuf)(struct file *file, void *fh,
>>>> +	int (*vidioc_querybuf)(struct file *file, void *,
>>>>  			       struct v4l2_buffer *b);
>>>> -	int (*vidioc_qbuf)(struct file *file, void *fh,
>>>> +	int (*vidioc_qbuf)(struct file *file, void *,
>>>>  			   struct v4l2_buffer *b);
>>>> -	int (*vidioc_expbuf)(struct file *file, void *fh,
>>>> +	int (*vidioc_expbuf)(struct file *file, void *,
>>>>  			     struct v4l2_exportbuffer *e);
>>>> -	int (*vidioc_dqbuf)(struct file *file, void *fh,
>>>> +	int (*vidioc_dqbuf)(struct file *file, void *,
>>>>  			    struct v4l2_buffer *b);
>>>>  
>>>> -	int (*vidioc_create_bufs)(struct file *file, void *fh,
>>>> +	int (*vidioc_create_bufs)(struct file *file, void *,
>>>>  				  struct v4l2_create_buffers *b);
>>>> -	int (*vidioc_prepare_buf)(struct file *file, void *fh,
>>>> +	int (*vidioc_prepare_buf)(struct file *file, void *,
>>>>  				  struct v4l2_buffer *b);
>>>> -	int (*vidioc_remove_bufs)(struct file *file, void *fh,
>>>> +	int (*vidioc_remove_bufs)(struct file *file, void *,
>>>>  				  struct v4l2_remove_buffers *d);
>>>>  
>>>> -	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
>>>> -	int (*vidioc_g_fbuf)(struct file *file, void *fh,
>>>> +	int (*vidioc_overlay)(struct file *file, void *, unsigned int i);
>>>> +	int (*vidioc_g_fbuf)(struct file *file, void *,
>>>>  			     struct v4l2_framebuffer *a);
>>>> -	int (*vidioc_s_fbuf)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_fbuf)(struct file *file, void *,
>>>>  			     const struct v4l2_framebuffer *a);
>>>>  
>>>>  		/* Stream on/off */
>>>> -	int (*vidioc_streamon)(struct file *file, void *fh,
>>>> +	int (*vidioc_streamon)(struct file *file, void *,
>>>>  			       enum v4l2_buf_type i);
>>>> -	int (*vidioc_streamoff)(struct file *file, void *fh,
>>>> +	int (*vidioc_streamoff)(struct file *file, void *,
>>>>  				enum v4l2_buf_type i);
>>>>  
>>>>  		/*
>>>> @@ -438,135 +438,135 @@ struct v4l2_ioctl_ops {
>>>>  		 *
>>>>  		 * Note: ENUMSTD is handled by videodev.c
>>>>  		 */
>>>> -	int (*vidioc_g_std)(struct file *file, void *fh, v4l2_std_id *norm);
>>>> -	int (*vidioc_s_std)(struct file *file, void *fh, v4l2_std_id norm);
>>>> -	int (*vidioc_querystd)(struct file *file, void *fh, v4l2_std_id *a);
>>>> +	int (*vidioc_g_std)(struct file *file, void *, v4l2_std_id *norm);
>>>> +	int (*vidioc_s_std)(struct file *file, void *, v4l2_std_id norm);
>>>> +	int (*vidioc_querystd)(struct file *file, void *, v4l2_std_id *a);
>>>>  
>>>>  		/* Input handling */
>>>> -	int (*vidioc_enum_input)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_input)(struct file *file, void *,
>>>>  				 struct v4l2_input *inp);
>>>> -	int (*vidioc_g_input)(struct file *file, void *fh, unsigned int *i);
>>>> -	int (*vidioc_s_input)(struct file *file, void *fh, unsigned int i);
>>>> +	int (*vidioc_g_input)(struct file *file, void *, unsigned int *i);
>>>> +	int (*vidioc_s_input)(struct file *file, void *, unsigned int i);
>>>>  
>>>>  		/* Output handling */
>>>> -	int (*vidioc_enum_output)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_output)(struct file *file, void *,
>>>>  				  struct v4l2_output *a);
>>>> -	int (*vidioc_g_output)(struct file *file, void *fh, unsigned int *i);
>>>> -	int (*vidioc_s_output)(struct file *file, void *fh, unsigned int i);
>>>> +	int (*vidioc_g_output)(struct file *file, void *, unsigned int *i);
>>>> +	int (*vidioc_s_output)(struct file *file, void *, unsigned int i);
>>>>  
>>>>  		/* Control handling */
>>>> -	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
>>>> +	int (*vidioc_query_ext_ctrl)(struct file *file, void *,
>>>>  				     struct v4l2_query_ext_ctrl *a);
>>>> -	int (*vidioc_g_ext_ctrls)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_ext_ctrls)(struct file *file, void *,
>>>>  				  struct v4l2_ext_controls *a);
>>>> -	int (*vidioc_s_ext_ctrls)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_ext_ctrls)(struct file *file, void *,
>>>>  				  struct v4l2_ext_controls *a);
>>>> -	int (*vidioc_try_ext_ctrls)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_ext_ctrls)(struct file *file, void *,
>>>>  				    struct v4l2_ext_controls *a);
>>>> -	int (*vidioc_querymenu)(struct file *file, void *fh,
>>>> +	int (*vidioc_querymenu)(struct file *file, void *,
>>>>  				struct v4l2_querymenu *a);
>>>>  
>>>>  	/* Audio ioctls */
>>>> -	int (*vidioc_enumaudio)(struct file *file, void *fh,
>>>> +	int (*vidioc_enumaudio)(struct file *file, void *,
>>>>  				struct v4l2_audio *a);
>>>> -	int (*vidioc_g_audio)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_audio)(struct file *file, void *,
>>>>  			      struct v4l2_audio *a);
>>>> -	int (*vidioc_s_audio)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_audio)(struct file *file, void *,
>>>>  			      const struct v4l2_audio *a);
>>>>  
>>>>  	/* Audio out ioctls */
>>>> -	int (*vidioc_enumaudout)(struct file *file, void *fh,
>>>> +	int (*vidioc_enumaudout)(struct file *file, void *,
>>>>  				 struct v4l2_audioout *a);
>>>> -	int (*vidioc_g_audout)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_audout)(struct file *file, void *,
>>>>  			       struct v4l2_audioout *a);
>>>> -	int (*vidioc_s_audout)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_audout)(struct file *file, void *,
>>>>  			       const struct v4l2_audioout *a);
>>>> -	int (*vidioc_g_modulator)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_modulator)(struct file *file, void *,
>>>>  				  struct v4l2_modulator *a);
>>>> -	int (*vidioc_s_modulator)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_modulator)(struct file *file, void *,
>>>>  				  const struct v4l2_modulator *a);
>>>>  	/* Crop ioctls */
>>>> -	int (*vidioc_g_pixelaspect)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_pixelaspect)(struct file *file, void *,
>>>>  				    int buf_type, struct v4l2_fract *aspect);
>>>> -	int (*vidioc_g_selection)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_selection)(struct file *file, void *,
>>>>  				  struct v4l2_selection *s);
>>>> -	int (*vidioc_s_selection)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_selection)(struct file *file, void *,
>>>>  				  struct v4l2_selection *s);
>>>>  	/* Compression ioctls */
>>>> -	int (*vidioc_g_jpegcomp)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_jpegcomp)(struct file *file, void *,
>>>>  				 struct v4l2_jpegcompression *a);
>>>> -	int (*vidioc_s_jpegcomp)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_jpegcomp)(struct file *file, void *,
>>>>  				 const struct v4l2_jpegcompression *a);
>>>> -	int (*vidioc_g_enc_index)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_enc_index)(struct file *file, void *,
>>>>  				  struct v4l2_enc_idx *a);
>>>> -	int (*vidioc_encoder_cmd)(struct file *file, void *fh,
>>>> +	int (*vidioc_encoder_cmd)(struct file *file, void *,
>>>>  				  struct v4l2_encoder_cmd *a);
>>>> -	int (*vidioc_try_encoder_cmd)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_encoder_cmd)(struct file *file, void *,
>>>>  				      struct v4l2_encoder_cmd *a);
>>>> -	int (*vidioc_decoder_cmd)(struct file *file, void *fh,
>>>> +	int (*vidioc_decoder_cmd)(struct file *file, void *,
>>>>  				  struct v4l2_decoder_cmd *a);
>>>> -	int (*vidioc_try_decoder_cmd)(struct file *file, void *fh,
>>>> +	int (*vidioc_try_decoder_cmd)(struct file *file, void *,
>>>>  				      struct v4l2_decoder_cmd *a);
>>>>  
>>>>  	/* Stream type-dependent parameter ioctls */
>>>> -	int (*vidioc_g_parm)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_parm)(struct file *file, void *,
>>>>  			     struct v4l2_streamparm *a);
>>>> -	int (*vidioc_s_parm)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_parm)(struct file *file, void *,
>>>>  			     struct v4l2_streamparm *a);
>>>>  
>>>>  	/* Tuner ioctls */
>>>> -	int (*vidioc_g_tuner)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_tuner)(struct file *file, void *,
>>>>  			      struct v4l2_tuner *a);
>>>> -	int (*vidioc_s_tuner)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_tuner)(struct file *file, void *,
>>>>  			      const struct v4l2_tuner *a);
>>>> -	int (*vidioc_g_frequency)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_frequency)(struct file *file, void *,
>>>>  				  struct v4l2_frequency *a);
>>>> -	int (*vidioc_s_frequency)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_frequency)(struct file *file, void *,
>>>>  				  const struct v4l2_frequency *a);
>>>> -	int (*vidioc_enum_freq_bands)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_freq_bands)(struct file *file, void *,
>>>>  				      struct v4l2_frequency_band *band);
>>>>  
>>>>  	/* Sliced VBI cap */
>>>> -	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *,
>>>>  				       struct v4l2_sliced_vbi_cap *a);
>>>>  
>>>>  	/* Log status ioctl */
>>>> -	int (*vidioc_log_status)(struct file *file, void *fh);
>>>> +	int (*vidioc_log_status)(struct file *file, void *);
>>>>  
>>>> -	int (*vidioc_s_hw_freq_seek)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_hw_freq_seek)(struct file *file, void *,
>>>>  				     const struct v4l2_hw_freq_seek *a);
>>>>  
>>>>  	/* Debugging ioctls */
>>>>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>>>> -	int (*vidioc_g_register)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_register)(struct file *file, void *,
>>>>  				 struct v4l2_dbg_register *reg);
>>>> -	int (*vidioc_s_register)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_register)(struct file *file, void *,
>>>>  				 const struct v4l2_dbg_register *reg);
>>>>  
>>>> -	int (*vidioc_g_chip_info)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_chip_info)(struct file *file, void *,
>>>>  				  struct v4l2_dbg_chip_info *chip);
>>>>  #endif
>>>>  
>>>> -	int (*vidioc_enum_framesizes)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_framesizes)(struct file *file, void *,
>>>>  				      struct v4l2_frmsizeenum *fsize);
>>>>  
>>>> -	int (*vidioc_enum_frameintervals)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_frameintervals)(struct file *file, void *,
>>>>  					  struct v4l2_frmivalenum *fival);
>>>>  
>>>>  	/* DV Timings IOCTLs */
>>>> -	int (*vidioc_s_dv_timings)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_dv_timings)(struct file *file, void *,
>>>>  				   struct v4l2_dv_timings *timings);
>>>> -	int (*vidioc_g_dv_timings)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_dv_timings)(struct file *file, void *,
>>>>  				   struct v4l2_dv_timings *timings);
>>>> -	int (*vidioc_query_dv_timings)(struct file *file, void *fh,
>>>> +	int (*vidioc_query_dv_timings)(struct file *file, void *,
>>>>  				       struct v4l2_dv_timings *timings);
>>>> -	int (*vidioc_enum_dv_timings)(struct file *file, void *fh,
>>>> +	int (*vidioc_enum_dv_timings)(struct file *file, void *,
>>>>  				      struct v4l2_enum_dv_timings *timings);
>>>> -	int (*vidioc_dv_timings_cap)(struct file *file, void *fh,
>>>> +	int (*vidioc_dv_timings_cap)(struct file *file, void *,
>>>>  				     struct v4l2_dv_timings_cap *cap);
>>>> -	int (*vidioc_g_edid)(struct file *file, void *fh,
>>>> +	int (*vidioc_g_edid)(struct file *file, void *,
>>>>  			     struct v4l2_edid *edid);
>>>> -	int (*vidioc_s_edid)(struct file *file, void *fh,
>>>> +	int (*vidioc_s_edid)(struct file *file, void *,
>>>>  			     struct v4l2_edid *edid);
>>>>  
>>>>  	int (*vidioc_subscribe_event)(struct v4l2_fh *fh,
>>>> @@ -575,7 +575,7 @@ struct v4l2_ioctl_ops {
>>>>  					const struct v4l2_event_subscription *sub);
>>>>  
>>>>  	/* For other private ioctls */
>>>> -	long (*vidioc_default)(struct file *file, void *fh,
>>>> +	long (*vidioc_default)(struct file *file, void *,
>>>>  			       bool valid_prio, unsigned int cmd, void *arg);
>>>>  };
>>>>  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
