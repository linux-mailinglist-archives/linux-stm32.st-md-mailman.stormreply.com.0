Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 146FDB1B196
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Aug 2025 11:59:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54FF5C3F92D;
	Tue,  5 Aug 2025 09:59:24 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 170D8C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Aug 2025 09:59:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D96F2AD0;
 Tue,  5 Aug 2025 11:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754387915;
 bh=RV+XSnddoBH4JRWHZZy+4T5rBIZcZFEquw455N0WQVA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=aPIOyP3CCN60ghQ95OYLB9emUWH/n0b6O3gtc9ZoA+uMAITK5524gPFOoFe3iPgrR
 PeGZgkGvvmEIfAIjVWqinSJN2vlhZuO+XIf+jbLxH1tzVI09y3TIRrSaAcZCkteW9d
 f9FcX+PdukMOKmU3dXioC96DYHeFg17Pwv6UxHrs=
MIME-Version: 1.0
In-Reply-To: <20250802-media-private-data-v1-42-eb140ddd6a9d@ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-42-eb140ddd6a9d@ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 05 Aug 2025 10:59:19 +0100
Message-ID: <175438795943.1641235.15440393062572657340@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 42/65] media: renesas: Access v4l2_fh from
	file
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

Quoting Jacopo Mondi (2025-08-02 10:23:04)
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
> 
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
> 
> While at it, remove the now unused fh_to_ctx() macro.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 11 +++--------
>  drivers/media/platform/renesas/rcar_jpu.c  | 21 ++++++++-------------
>  2 files changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
> index e78d8fb104e9544d27c8ace38888995ca170483f..84c3901a2e5dc3e7ccfb3b44062e839f8f19ee02 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -630,11 +630,6 @@ struct fdp1_ctx {
>         struct fdp1_field_buffer        *previous;
>  };
>  
> -static inline struct fdp1_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -       return container_of(fh, struct fdp1_ctx, fh);
> -}
> -
>  static inline struct fdp1_ctx *file_to_ctx(struct file *filp)
>  {
>         return container_of(file_to_v4l2_fh(filp), struct fdp1_ctx, fh);
> @@ -1411,8 +1406,8 @@ static int fdp1_enum_fmt_vid_out(struct file *file, void *priv,
>  
>  static int fdp1_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  {
> +       struct fdp1_ctx *ctx = file_to_ctx(file);
>         struct fdp1_q_data *q_data;
> -       struct fdp1_ctx *ctx = fh_to_ctx(priv);
>  
>         if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
>                 return -EINVAL;
> @@ -1589,7 +1584,7 @@ static void fdp1_try_fmt_capture(struct fdp1_ctx *ctx,
>  
>  static int fdp1_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  {
> -       struct fdp1_ctx *ctx = fh_to_ctx(priv);
> +       struct fdp1_ctx *ctx = file_to_ctx(file);
>  
>         if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>                 fdp1_try_fmt_output(ctx, NULL, &f->fmt.pix_mp);
> @@ -1660,7 +1655,7 @@ static void fdp1_set_format(struct fdp1_ctx *ctx,
>  
>  static int fdp1_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  {
> -       struct fdp1_ctx *ctx = fh_to_ctx(priv);
> +       struct fdp1_ctx *ctx = file_to_ctx(file);
>         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>         struct vb2_queue *vq = v4l2_m2m_get_vq(m2m_ctx, f->type);
>  
> diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
> index 058fcfb967bd98440f33272db42f0d973299d572..9c70a74a2969fce6446b0f26e0637a68eade3942 100644
> --- a/drivers/media/platform/renesas/rcar_jpu.c
> +++ b/drivers/media/platform/renesas/rcar_jpu.c
> @@ -480,11 +480,6 @@ static struct jpu_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
>         return container_of(c->handler, struct jpu_ctx, ctrl_handler);
>  }
>  
> -static struct jpu_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -       return container_of(fh, struct jpu_ctx, fh);
> -}
> -
>  static struct jpu_ctx *file_to_ctx(struct file *filp)
>  {
>         return container_of(file_to_v4l2_fh(filp), struct jpu_ctx, fh);
> @@ -661,7 +656,7 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
>  static int jpu_querycap(struct file *file, void *priv,
>                         struct v4l2_capability *cap)
>  {
> -       struct jpu_ctx *ctx = fh_to_ctx(priv);
> +       struct jpu_ctx *ctx = file_to_ctx(file);
>  
>         if (ctx->encoder)
>                 strscpy(cap->card, DRV_NAME " encoder", sizeof(cap->card));
> @@ -719,7 +714,7 @@ static int jpu_enum_fmt(struct v4l2_fmtdesc *f, u32 type)
>  static int jpu_enum_fmt_cap(struct file *file, void *priv,
>                             struct v4l2_fmtdesc *f)
>  {
> -       struct jpu_ctx *ctx = fh_to_ctx(priv);
> +       struct jpu_ctx *ctx = file_to_ctx(file);
>  
>         return jpu_enum_fmt(f, ctx->encoder ? JPU_ENC_CAPTURE :
>                             JPU_DEC_CAPTURE);
> @@ -728,7 +723,7 @@ static int jpu_enum_fmt_cap(struct file *file, void *priv,
>  static int jpu_enum_fmt_out(struct file *file, void *priv,
>                             struct v4l2_fmtdesc *f)
>  {
> -       struct jpu_ctx *ctx = fh_to_ctx(priv);
> +       struct jpu_ctx *ctx = file_to_ctx(file);
>  
>         return jpu_enum_fmt(f, ctx->encoder ? JPU_ENC_OUTPUT : JPU_DEC_OUTPUT);
>  }
> @@ -828,7 +823,7 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct jpu_fmt **fmtinfo,
>  
>  static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  {
> -       struct jpu_ctx *ctx = fh_to_ctx(priv);
> +       struct jpu_ctx *ctx = file_to_ctx(file);
>  
>         if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
>                 return -EINVAL;
> @@ -839,7 +834,7 @@ static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  {
>         struct vb2_queue *vq;
> -       struct jpu_ctx *ctx = fh_to_ctx(priv);
> +       struct jpu_ctx *ctx = file_to_ctx(file);
>         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>         struct jpu_fmt *fmtinfo;
>         struct jpu_q_data *q_data;
> @@ -868,8 +863,8 @@ static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  
>  static int jpu_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  {
> +       struct jpu_ctx *ctx = file_to_ctx(file);
>         struct jpu_q_data *q_data;
> -       struct jpu_ctx *ctx = fh_to_ctx(priv);
>  
>         if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
>                 return -EINVAL;
> @@ -902,8 +897,8 @@ static const struct v4l2_ctrl_ops jpu_ctrl_ops = {
>  
>  static int jpu_streamon(struct file *file, void *priv, enum v4l2_buf_type type)
>  {
> -       struct jpu_ctx *ctx = fh_to_ctx(priv);
>         struct jpu_q_data *src_q_data, *dst_q_data, *orig, adj, *ref;
> +       struct jpu_ctx *ctx = file_to_ctx(file);
>         enum v4l2_buf_type adj_type;
>  
>         src_q_data = jpu_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> @@ -1284,8 +1279,8 @@ static int jpu_open(struct file *file)
>  
>  static int jpu_release(struct file *file)
>  {
> -       struct jpu *jpu = video_drvdata(file);
>         struct jpu_ctx *ctx = file_to_ctx(file);
> +       struct jpu *jpu = video_drvdata(file);
>  
>         v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>         v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> 
> -- 
> 2.49.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
