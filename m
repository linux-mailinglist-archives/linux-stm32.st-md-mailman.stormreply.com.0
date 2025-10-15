Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C50B4BDDED7
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 12:11:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29ED7C5661C;
	Wed, 15 Oct 2025 10:11:58 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6DF7C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 10:11:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1v8yU1-0005fF-P4; Wed, 15 Oct 2025 12:11:49 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1v8yTv-003hwe-3D;
 Wed, 15 Oct 2025 12:11:44 +0200
Received: from pza by lupine with local (Exim 4.98.2)
 (envelope-from <p.zabel@pengutronix.de>) id 1v8yTv-000000007QM-3dJv;
 Wed, 15 Oct 2025 12:11:43 +0200
Message-ID: <14f49cddfcb1c86598105ee394cd43a2bdf7fa89.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-staging@lists.linux.dev
Date: Wed, 15 Oct 2025 12:11:43 +0200
In-Reply-To: <20251015100118.8755-1-laurent.pinchart@ideasonboard.com>
References: <20251015100118.8755-1-laurent.pinchart@ideasonboard.com>
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Heiko Stuebner <heiko@sntech.de>, Devarsh Thakkar <devarsht@ti.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Steve Longerbeam <slongerbeam@gmail.com>, Bin Liu <bin.liu@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Kocialkowski <paulk@sys-base.io>, Maxime Ripard <mripard@kernel.org>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Hans Verkuil <hverkuil@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Ming Qian <ming.qian@nxp.com>
Subject: Re: [Linux-stm32] [PATCH v2] media: v4l2-mem2mem: Don't copy frame
 flags in v4l2_m2m_buf_copy_metadata()
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

On Mi, 2025-10-15 at 13:01 +0300, Laurent Pinchart wrote:
> The v4l2_m2m_buf_copy_metadata() function takes a boolean
> copy_frame_flags argument. When true, it causes the function to copy the
> V4L2_BUF_FLAG_KEYFRAME, V4L2_BUF_FLAG_BFRAME and V4L2_BUF_FLAG_PFRAME
> flags from the output buffer to the capture buffer.
> 
> There is no use cases in any upstream driver for copying the flags.
> KEY/P/B frames are properties of the bitstream buffer in some formats.
> Once decoded, this is no longer a property of the video frame and should
> be discarded.
> 
> It was considered useful to know if an uncompressed frame was decoded
> from a KEY/P/B compressed frame, and to preserve that information if
> that same uncompressed frame was passed through another M2M device (e.g.
> a scaler). However, the V4L2 documentation makes it clear that the flags
> are meant for compressed frames only.
> 
> Drop the copy_frame_flags argument from v4l2_m2m_buf_copy_metadata().
> The change to drivers was performed with the following Coccinelle
> semantic patch:
> 
> @@
> expression src;
> expression dst;
> expression flag;
> @@
> -       v4l2_m2m_buf_copy_metadata(src, dst, flag);
> +       v4l2_m2m_buf_copy_metadata(src, dst);
> 
> include/media/v4l2-mem2mem.h and drivers/media/v4l2-core/v4l2-mem2mem.c
> have been updated manually.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
