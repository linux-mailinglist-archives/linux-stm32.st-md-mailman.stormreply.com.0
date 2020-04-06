Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C63D419FBF2
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 19:45:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DB70C36B0B;
	Mon,  6 Apr 2020 17:45:39 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D9EAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 17:45:38 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z65so610348ede.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Apr 2020 10:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7RXoohFvXLaoEKx3R14gPI97or8iyID+gO/ke9YZLZk=;
 b=pGJxT/+1b5N0eaXPQ8MD+apq1vM1MKAp+Icn53TKKJ0KGEnm05VOa5Y1PXrdWJnued
 R9YUUUBFQ3SAx68o4tq3gsy3sganiQ/LSMuSCuL8zeRVyMPSVBMwijQ+zyheaSWAu3xJ
 M+OPJMGhw6A30yvpkCR1omLvF+gJmffGC2W/3lpB316ys6wZpTVSfHDp9wusrVxG+kTJ
 8QhIM3+WDSWjrfsSpPJlWmuFuQJHkBccKMwVYR+437mDuaT39nIrHtpckrkXjLc15TLB
 3ZQ6bg5krSgAE+jYAaOpI2wf8bRjMTc6TzFNGjCyuxtK4inqkOZaPt0bxepRj/sXaXhc
 GF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7RXoohFvXLaoEKx3R14gPI97or8iyID+gO/ke9YZLZk=;
 b=cx0Pi4UHpZ8D3tDTiQQiZr9gEWkzQe1MTu1IoSkVvA2PJSUj37F9mpcDMkowIM5PWD
 C6l26k/n1/4pAhIViSvgCvn7OUKvyMHnme02NtVu8TmQ+HT33iy1r50C8T7Ck2261vEW
 YiShwtgflan5Bq8ohH3PPjPOlaV7nkXJsmb51D2/M7ZDmltVe9he1xx+S8Wb6n1gLSJf
 8VbYQQc1E3/7h7x9deIfpYfa/Va5Xy4kKLsAZ0JSotTPzK8lxHA8e7/WmqiN2qnrUNsv
 36fj/3YPrJjOD10Sg8HJ5CoXYQnmhxLZiYsbQD8rwrwSk7Q+QZhwGScGRX4huUYIHmhW
 x8Bg==
X-Gm-Message-State: AGi0PuauNarU+nouSUV23S8JX3qAPYIa1EAhJNRBurAgqc3noQWJwtlv
 /ZshjkH3CHp1IFuI0H3JNxcig4dhIawOqb6o6DI=
X-Google-Smtp-Source: APiQypIaHtJ4hn23pa/NkZ7zj/dGv/ZlRU8kWcFi0fx8qH8eIA32EcKufiVaVgryZZ59IaKMiOdYUiH5qzK3Hj5fT5s=
X-Received: by 2002:a50:ed93:: with SMTP id h19mr19481900edr.255.1586195137719; 
 Mon, 06 Apr 2020 10:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
In-Reply-To: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
From: Adrian Pop <pop.adrian61@gmail.com>
Date: Mon, 6 Apr 2020 20:45:26 +0300
Message-ID: <CAP-HsdQtdSeiSe3O8P6Pe587PYAqO48pGJLwf+Tvq20sY_nh=A@mail.gmail.com>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yannick.fertre@st.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] drm/bridge: dw-mipi-dsi.c: Add VPG
 runtime config through debugfs
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

Hello Angelo,

Tested OK on STM32F769i-DISCO, DSI v1.30, on next-20200406. I guess
there is no horizontal for BER.

Regards,
Adrian

On Mon, Apr 6, 2020 at 4:49 PM Angelo Ribeiro
<Angelo.Ribeiro@synopsys.com> wrote:
>
> Add support for the video pattern generator (VPG) BER pattern mode and
> configuration in runtime.
>
> This enables using the debugfs interface to manipulate the VPG after
> the pipeline is set.
> Also, enables the usage of the VPG BER pattern.
>
> Changes in v2:
>   - Added VID_MODE_VPG_MODE
>   - Solved incompatible return type on __get and __set
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Adrian Pop <pop.adrian61@gmail.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: Jose Abreu <jose.abreu@synopsys.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 98 ++++++++++++++++++++++++---
>  1 file changed, 90 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index b18351b..9de3645 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -91,6 +91,7 @@
>  #define VID_MODE_TYPE_BURST                    0x2
>  #define VID_MODE_TYPE_MASK                     0x3
>  #define VID_MODE_VPG_ENABLE            BIT(16)
> +#define VID_MODE_VPG_MODE              BIT(20)
>  #define VID_MODE_VPG_HORIZONTAL                BIT(24)
>
>  #define DSI_VID_PKT_SIZE               0x3c
> @@ -221,6 +222,21 @@
>  #define PHY_STATUS_TIMEOUT_US          10000
>  #define CMD_PKT_STATUS_TIMEOUT_US      20000
>
> +#ifdef CONFIG_DEBUG_FS
> +#define VPG_DEFS(name, dsi) \
> +       ((void __force *)&((*dsi).vpg_defs.name))
> +
> +#define REGISTER(name, mask, dsi) \
> +       { #name, VPG_DEFS(name, dsi), mask, dsi }
> +
> +struct debugfs_entries {
> +       const char                              *name;
> +       bool                                    *reg;
> +       u32                                     mask;
> +       struct dw_mipi_dsi                      *dsi;
> +};
> +#endif /* CONFIG_DEBUG_FS */
> +
>  struct dw_mipi_dsi {
>         struct drm_bridge bridge;
>         struct mipi_dsi_host dsi_host;
> @@ -238,9 +254,12 @@ struct dw_mipi_dsi {
>
>  #ifdef CONFIG_DEBUG_FS
>         struct dentry *debugfs;
> -
> -       bool vpg;
> -       bool vpg_horizontal;
> +       struct debugfs_entries *debugfs_vpg;
> +       struct {
> +               bool vpg;
> +               bool vpg_horizontal;
> +               bool vpg_ber_pattern;
> +       } vpg_defs;
>  #endif /* CONFIG_DEBUG_FS */
>
>         struct dw_mipi_dsi *master; /* dual-dsi master ptr */
> @@ -530,9 +549,11 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
>                 val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
>
>  #ifdef CONFIG_DEBUG_FS
> -       if (dsi->vpg) {
> +       if (dsi->vpg_defs.vpg) {
>                 val |= VID_MODE_VPG_ENABLE;
> -               val |= dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
> +               val |= dsi->vpg_defs.vpg_horizontal ?
> +                      VID_MODE_VPG_HORIZONTAL : 0;
> +               val |= dsi->vpg_defs.vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
>         }
>  #endif /* CONFIG_DEBUG_FS */
>
> @@ -961,6 +982,68 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
>
>  #ifdef CONFIG_DEBUG_FS
>
> +int dw_mipi_dsi_debugfs_write(void *data, u64 val)
> +{
> +       struct debugfs_entries *vpg = data;
> +       struct dw_mipi_dsi *dsi;
> +       u32 mode_cfg;
> +
> +       if (!vpg)
> +               return -ENODEV;
> +
> +       dsi = vpg->dsi;
> +
> +       *vpg->reg = (bool)val;
> +
> +       mode_cfg = dsi_read(dsi, DSI_VID_MODE_CFG);
> +
> +       if (*vpg->reg)
> +               mode_cfg |= vpg->mask;
> +       else
> +               mode_cfg &= ~vpg->mask;
> +
> +       dsi_write(dsi, DSI_VID_MODE_CFG, mode_cfg);
> +
> +       return 0;
> +}
> +
> +int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
> +{
> +       struct debugfs_entries *vpg = data;
> +
> +       if (!vpg)
> +               return -ENODEV;
> +
> +       *val = *vpg->reg;
> +
> +       return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_x32, dw_mipi_dsi_debugfs_show,
> +                        dw_mipi_dsi_debugfs_write, "%llu\n");
> +
> +static void debugfs_create_files(void *data)
> +{
> +       struct dw_mipi_dsi *dsi = data;
> +       struct debugfs_entries debugfs[] = {
> +               REGISTER(vpg, VID_MODE_VPG_ENABLE, dsi),
> +               REGISTER(vpg_horizontal, VID_MODE_VPG_HORIZONTAL, dsi),
> +               REGISTER(vpg_ber_pattern, VID_MODE_VPG_MODE, dsi),
> +       };
> +       int i;
> +
> +       dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
> +       if (!dsi->debugfs_vpg)
> +               return;
> +
> +       memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
> +
> +       for (i = 0; i < ARRAY_SIZE(debugfs); i++)
> +               debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
> +                                   dsi->debugfs, &dsi->debugfs_vpg[i],
> +                                   &fops_x32);
> +}
> +
>  static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
>  {
>         dsi->debugfs = debugfs_create_dir(dev_name(dsi->dev), NULL);
> @@ -969,14 +1052,13 @@ static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
>                 return;
>         }
>
> -       debugfs_create_bool("vpg", 0660, dsi->debugfs, &dsi->vpg);
> -       debugfs_create_bool("vpg_horizontal", 0660, dsi->debugfs,
> -                           &dsi->vpg_horizontal);
> +       debugfs_create_files(dsi);
>  }
>
>  static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi)
>  {
>         debugfs_remove_recursive(dsi->debugfs);
> +       kfree(dsi->debugfs_vpg);
>  }
>
>  #else
> --
> 2.7.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
