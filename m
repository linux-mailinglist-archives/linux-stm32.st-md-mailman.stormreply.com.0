Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF93A3BF3
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 08:14:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0214CC58D5B;
	Fri, 11 Jun 2021 06:14:31 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6DE1C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 06:14:27 +0000 (UTC)
IronPort-SDR: cb4pDSLMf9BTG9CUA5i8Z0lalJs3gqrEhyXN6Ub5If+lNLL3h6Hi5TuWnvGyiK22ww0kBRppFU
 xeMAgcN8RNdA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="202443373"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="202443373"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 23:14:23 -0700
IronPort-SDR: J0RkFeg3TbRmOA1vksM6Zzb9jbMU3xaY46QEB0aEjePdyjO8H3Gbg71A6Goc4JQEHGmO8+2+M0
 GIKdcp7/cMxw==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="450657291"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 23:14:15 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 23EA42036A;
 Fri, 11 Jun 2021 09:14:13 +0300 (EEST)
Date: Fri, 11 Jun 2021 09:14:13 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <20210611061413.GM3@paasikivi.fi.intel.com>
References: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-rockchip@lists.infradead.org, Mickael Guene <mickael.guene@st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Heiko Stuebner <heiko@sntech.de>, Leon Luo <leonl@leopardimaging.com>,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Mats Randgaard <matrandg@cisco.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shunqian Zheng <zhengsq@rock-chips.com>,
 Tim Harvey <tharvey@gateworks.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 linux-media@vger.kernel.org, Shawn Tu <shawnx.tu@intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Wenyou Yang <wenyou.yang@microchip.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benoit Parrot <bparrot@ti.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Helen Koike <helen.koike@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andy Walls <awalls@md.metrocast.net>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Heungjun Kim <riverful.kim@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Hyungwoo Yang <hyungwoo.yang@intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@lists.linux.dev,
 Dan Scally <djrscally@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Eugen Hristev <eugen.hristev@microchip.com>, Yong Zhi <yong.zhi@intel.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [Linux-stm32] [PATCH v5 0/9] media: v4l2-subdev: add
	subdev-wide state struct
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

Moi,

On Thu, Jun 10, 2021 at 05:55:57PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> v5 of the series. No content changes compared to v4, but the series is
> split into smaller parts to enable reviews.
> 
> The split is artificial, and all the patches need to be squashed into
> one before merging.
> 
> The point of the series is explained in "media: v4l2-subdev: add
> subdev-wide state struct", but for easier reviews I add it partially
> here:
> 
> We have 'struct v4l2_subdev_pad_config' which contains configuration for
> a single pad used for the TRY functionality, and an array of those
> structs is passed to various v4l2_subdev_pad_ops.
> 
> I was working on subdev internal routing between pads, and realized that
> there's no way to add TRY functionality for routes, which is not pad
> specific configuration. Adding a separate struct for try-route config
> wouldn't work either, as e.g. set-fmt needs to know the try-route
> configuration to propagate the settings.
> 
> This patch adds a new struct, 'struct v4l2_subdev_state' (which at the
> moment only contains the v4l2_subdev_pad_config array) and the new
> struct is used in most of the places where v4l2_subdev_pad_config was
> used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
> are changed to instead take v4l2_subdev_state.

Thanks for the update.

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Terveisin,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
