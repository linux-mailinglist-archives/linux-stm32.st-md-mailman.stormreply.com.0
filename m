Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA665CF8B
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jan 2023 10:30:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4858C6905D;
	Wed,  4 Jan 2023 09:30:51 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D933EC03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jan 2023 09:30:49 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id tz12so81179457ejc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Jan 2023 01:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8CmEXY85Wfe5zRCPYTM22tY3+v8slzBjcPUwowPXH7Q=;
 b=YbFROjWcXuYpdMirg154U9mKDnTGYVd9fIuzWkgW4bVOFDMxgXQ0zHIUxFUcyrX2Zb
 30BKXYeNJWNG4wOeKq0Anr2+a692z3+W/K1xC7AsfzpEfRLviiG04KgVmDJDPc+BcP4J
 l6riXWXBS8z1jliXdzP22d7oVVY/qT16oX8N76iWJXMs0/SCWdVEZLamFmHli+QVQoOH
 JVfGKyQRbvs7ibMd/j1CiCoeleZJU1egZ+AD9owYwKmFbV77po19ss0O50OcqHSpFz3T
 44G3FcZ0Yp/++aj/aiYEdpko21rITUVVHczq1OHEFhSsXKv3FoZO+opchShyr6v/tWeG
 nTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8CmEXY85Wfe5zRCPYTM22tY3+v8slzBjcPUwowPXH7Q=;
 b=GSV5MoIzNfzQRUxp55lvt26P42vlm98LMe+jrrLs1U1WTOKo3oUGKtigXkIxdyMhEd
 wz+A7KoafRo9DntAkUyIECc0lcgk5rnWXoekitS2Z9FZ+cQG40tQY03h+67fxrG5U+1r
 bgOxf64BvQroHJcho7+Sn0h4g6L3/lztgAQ1WPmzYhfaxLLFzvnVyTalNlMC+5Px9FHb
 PtRg4dvN4i0xRTlP7UE80d5vQ4zFy4ICHj+4vJVotjeQFzMmMJ0l3+rHuMeFItrOrucr
 tfdeFjHm+dcOFKe1V2wZX4+DlW7EnzIB//TOeHV/5411X98woDXEOTQc9k3LoPtQy6jk
 OeSw==
X-Gm-Message-State: AFqh2koOcsyEVt0BBlRgH6XFx2BCGgAn6QiP8mfyXuY5E8xRZe1DDEa9
 FVEszMBM8zBk4xKWsswqd/VEYid/rd5s9AyLkBnzhg==
X-Google-Smtp-Source: AMrXdXs4jpYwJfABguan7RaoumMvEbg/uoMMMOFjsNNkGDgxEDFMlvnkPmf+x3Fxi8UykbA7W2HuYOVd7GPQt7af9fU=
X-Received: by 2002:a17:906:4ecb:b0:7bc:2ad:fae with SMTP id
 i11-20020a1709064ecb00b007bc02ad0faemr3244245ejv.724.1672824649391; Wed, 04
 Jan 2023 01:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20230103140521.187678-1-patrick.delaunay@foss.st.com>
 <20230103150515.v4.3.I59210046e368cfc22bd3cca2afe1653674f8ece8@changeid>
In-Reply-To: <20230103150515.v4.3.I59210046e368cfc22bd3cca2afe1653674f8ece8@changeid>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 4 Jan 2023 10:30:38 +0100
Message-ID: <CAN5uoS-dXLSs9DiJFBTAOJbPZPp4BUfxqZ7ND_irzBbUEwaUHg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/3] nvmem: stm32: detect bsec pta
	presence for STM32MP15x
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

Hi Patrick,

On Tue, 3 Jan 2023 at 15:08, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> On STM32MP15x SoC, the SMC backend is optional when OP-TEE is used;
> the PTA BSEC should be used as it is done on STM32MP13x platform,
> but the BSEC SMC can be also used: it is a legacy mode in OP-TEE,
> not recommended but used in previous OP-TEE firmware.
>
> The presence of OP-TEE is dynamically detected in STM32MP15x device tree
> and the supported NVMEM backend is dynamically detected:
> - PTA with stm32_bsec_pta_find
> - SMC with stm32_bsec_check
>
> With OP-TEE but without PTA and SMC detection, the probe is deferred for
> STM32MP15x devices.
>
> On STM32MP13x platform, only the PTA is supported with cfg->ta = true
> and this detection is skipped.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - use of_find_compatible_node in optee_presence_check function
>   instead of of_find_node_by_path("/firmware/optee")
>
> Changes in v2:
> - Added patch in the serie for BSEC PTA support on STM32MP15x
>   with dynamic detection of OP-TEE presence and SMC support (legacy mode)
>
>  drivers/nvmem/stm32-romem.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
> index 2edc61925e52..1b90c78301fa 100644
> --- a/drivers/nvmem/stm32-romem.c
> +++ b/drivers/nvmem/stm32-romem.c
> @@ -159,6 +159,31 @@ static int stm32_bsec_pta_write(void *context, unsigned int offset, void *buf,
>         return stm32_bsec_optee_ta_write(priv->ctx, priv->lower, offset, buf, bytes);
>  }
>
> +static bool stm32_bsec_smc_check(void)
> +{
> +       u32 val;
> +       int ret;
> +
> +       /* check that the OP-TEE support the BSEC SMC (legacy mode) */
> +       ret = stm32_bsec_smc(STM32_SMC_READ_SHADOW, 0, 0, &val);
> +
> +       return !ret;
> +}
> +
> +static bool optee_presence_check(void)
> +{
> +       struct device_node *np;
> +       bool tee_detected = false;
> +
> +       /* check that the OP-TEE node is present and available. */
> +       np = of_find_compatible_node(NULL, NULL, "linaro,optee-tz");
> +       if (np && of_device_is_available(np))
> +               tee_detected = true;
> +       of_node_put(np);
> +
> +       return tee_detected;
> +}
> +
>  static int stm32_romem_probe(struct platform_device *pdev)
>  {
>         const struct stm32_romem_cfg *cfg;
> @@ -195,10 +220,14 @@ static int stm32_romem_probe(struct platform_device *pdev)
>         } else {
>                 priv->cfg.size = cfg->size;
>                 priv->lower = cfg->lower;
> -               if (cfg->ta) {
> +               if (cfg->ta || optee_presence_check()) {
>                         rc = stm32_bsec_optee_ta_open(&priv->ctx);
>                         /* wait for OP-TEE client driver to be up and ready */
> -                       if (rc)
> +                       if (rc == -EPROBE_DEFER) {
> +                               /* BSEC PTA is required or SMC not ready */
> +                               if (cfg->ta || !stm32_bsec_smc_check())
> +                                       return -EPROBE_DEFER;
> +                       } else if (rc)

Could you fix the logic? The sequence here fails to fallback to BSEC
SMC service if optee does not embed BSEC PTA service and optee driver
is probed before stm32_romem.

Br,
etienne

>                                 return rc;
>                         rc = devm_add_action_or_reset(dev, stm32_bsec_optee_ta_close, priv->ctx);
>                         if (rc) {
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
