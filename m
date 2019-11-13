Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF70FB3F6
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2019 16:43:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C4F8C36B0B;
	Wed, 13 Nov 2019 15:43:38 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 799F6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 15:43:36 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id 31so789371uas.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 07:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Vi/nAUFrYq+Z81VivMqWJ6fhk9sFE6uoRaEGSyG7LY=;
 b=eaXcyDxzW5Wq4bEa2mTFE+456S59OzhTQYiZPfJETT/aHklwJKeLmekruQ2WAfteKc
 lmJYTJpHyTE5zmZ/adbDYCJg57zdTiwi2vmgSfSoZH5EjqfKfOgCQnf/SrBb0+RTPDTN
 4LgJWW2fe/2Rn+2bpAx6Vz7xHx1S2Xmn98gKFhpEX+7WpXY08hANvj3PL2lHeJW63yCu
 35Ef6Z1hxneuZTwcrd6Jaycuc/DDXkuWiOM5qkcRUBmWjTksUHMS43G5aao+gWCn5LWP
 ooKIrc4c3CzmDKD2K2SFi/ikfdWfhM/wBQjJWui2L/IQqicpiy8LUCxXMhNKcOOqAJPD
 JrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Vi/nAUFrYq+Z81VivMqWJ6fhk9sFE6uoRaEGSyG7LY=;
 b=V4WZAIZUOKjjfC7ridnbtlCF+D1d5lhaVBJOLquF438Bix3DV5BhghIEcmzyEM0Yq5
 87i+hRnpF3URv/RXqIDhmNZPUElliA+kf/oIOOhLmSbY9UiW8dGx++7AbDRjeJAHY2cw
 2uGkLPensGC8I3n7XiADjB/rr5V5yopexonDTKq9CTWgCuLpMITEuIf81bBDpX7Qlv/r
 9GCRyz6TD/Xu8jhhZa0gLPh9zX673Hc0VQLnQTVYKl4RocM3nRe27fuDwEyFlflFZrB5
 InGNVzJbr7zjQoXisoLCdzZQ8HViVTdjGdBNSSgUhEGvUL6xIxYLODnZghiPRmVcicIB
 rjhg==
X-Gm-Message-State: APjAAAVeY0+de6jxNDp/omReOg15TfJaSAnXXcF01M62H/GvG8ks26jm
 KDDzCe/h86JlNVvwhe8YEx0uvfwfBd2uj3AQ1hM=
X-Google-Smtp-Source: APXvYqyWd8hfrLRPwCngx48jvavKfYDtnbc3w9HChvejMMB4srKR3Nc94lmckPsm/62oZMiU7s0R6Oi/Qu5dSFVFGGc=
X-Received: by 2002:ab0:14e8:: with SMTP id f37mr2198362uae.64.1573659815058; 
 Wed, 13 Nov 2019 07:43:35 -0800 (PST)
MIME-Version: 1.0
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
 <20191106163031.808061-4-adrian.ratiu@collabora.com>
In-Reply-To: <20191106163031.808061-4-adrian.ratiu@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 Nov 2019 15:43:08 +0000
Message-ID: <CACvgo50xc9NKgNn2uzGFbW1TwBDFRPmC3geCSC_63P-OXbm6DA@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/4] drm: imx: Add i.MX 6 MIPI DSI host
	driver
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

On Wed, 6 Nov 2019 at 16:31, Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> This adds support for the Synopsis DesignWare MIPI DSI v1.01 host
> controller which is embedded in i.MX 6 SoCs.
>
> Based on following patches, but updated/extended to work with existing
> support found in the kernel:
>
> - drm: imx: Support Synopsys DesignWare MIPI DSI host controller
>   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
>
> - ARM: dtsi: imx6qdl: Add support for MIPI DSI host controller
>   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
With the const nitpick below, the patch is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

Aside, for the future consider having a change log in the patch itself.
What I tend to do is:
 - v2: Keep DW version specifics in dw-mipi-dsi.c (Emil)

<snip>

> +static struct dw_mipi_dsi_variant dw_mipi_dsi_v101_layout = {

Nit: make this a const.


> +       .cfg_dpi_vid =                  REG_FIELD(DSI_DPI_CFG, 0, 1),
> +       .cfg_dpi_color_coding =         REG_FIELD(DSI_DPI_CFG, 2, 4),
> +       .cfg_dpi_18loosely_en =         REG_FIELD(DSI_DPI_CFG, 10, 10),
> +       .cfg_dpi_vsync_active_low =     REG_FIELD(DSI_DPI_CFG, 6, 6),
> +       .cfg_dpi_hsync_active_low =     REG_FIELD(DSI_DPI_CFG, 7, 7),
> +       .cfg_cmd_mode_en =              REG_FIELD(DSI_CMD_MODE_CFG_V101, 0, 0),
> +       .cfg_cmd_mode_all_lp_en =       REG_FIELD(DSI_CMD_MODE_CFG_V101, 1, 12),
> +       .cfg_cmd_mode_ack_rqst_en =     REG_FIELD(DSI_CMD_MODE_CFG_V101, 13, 13),
> +       .cfg_cmd_pkt_status =           REG_FIELD(DSI_CMD_PKT_STATUS_V101, 0, 14),
> +       .cfg_vid_mode_en =              REG_FIELD(DSI_VID_MODE_CFG_V101, 0, 0),
> +       .cfg_vid_mode_type =            REG_FIELD(DSI_VID_MODE_CFG_V101, 1, 2),
> +       .cfg_vid_mode_low_power =       REG_FIELD(DSI_VID_MODE_CFG_V101, 3, 8),
> +       .cfg_vid_pkt_size =             REG_FIELD(DSI_VID_PKT_CFG, 0, 10),
> +       .cfg_vid_hsa_time =             REG_FIELD(DSI_TMR_LINE_CFG, 0, 8),
> +       .cfg_vid_hbp_time =             REG_FIELD(DSI_TMR_LINE_CFG, 9, 17),
> +       .cfg_vid_hline_time =           REG_FIELD(DSI_TMR_LINE_CFG, 18, 31),
> +       .cfg_vid_vsa_time =             REG_FIELD(DSI_VTIMING_CFG, 0, 3),
> +       .cfg_vid_vbp_time =             REG_FIELD(DSI_VTIMING_CFG, 4, 9),
> +       .cfg_vid_vfp_time =             REG_FIELD(DSI_VTIMING_CFG, 10, 15),
> +       .cfg_vid_vactive_time =         REG_FIELD(DSI_VTIMING_CFG, 16, 26),
> +       .cfg_phy_txrequestclkhs =       REG_FIELD(DSI_PHY_IF_CTRL, 0, 0),
> +       .cfg_phy_bta_time =             REG_FIELD(DSI_PHY_TMR_CFG_V101, 0, 11),
> +       .cfg_phy_lp2hs_time =           REG_FIELD(DSI_PHY_TMR_CFG_V101, 12, 19),
> +       .cfg_phy_hs2lp_time =           REG_FIELD(DSI_PHY_TMR_CFG_V101, 20, 27),
> +       .cfg_phy_testclr =              REG_FIELD(DSI_PHY_TST_CTRL0_V101, 0, 0),
> +       .cfg_phy_unshutdownz =          REG_FIELD(DSI_PHY_RSTZ_V101, 0, 0),
> +       .cfg_phy_unrstz =               REG_FIELD(DSI_PHY_RSTZ_V101, 1, 1),
> +       .cfg_phy_enableclk =            REG_FIELD(DSI_PHY_RSTZ_V101, 2, 2),
> +       .cfg_phy_nlanes =               REG_FIELD(DSI_PHY_IF_CFG_V101, 0, 1),
> +       .cfg_phy_stop_wait_time =       REG_FIELD(DSI_PHY_IF_CFG_V101, 2, 9),
> +       .cfg_phy_status =               REG_FIELD(DSI_PHY_STATUS_V101, 0, 0),
> +       .cfg_pckhdl_cfg =               REG_FIELD(DSI_PCKHDL_CFG_V101, 0, 4),
> +       .cfg_hstx_timeout_counter =     REG_FIELD(DSI_TO_CNT_CFG_V101, 0, 15),
> +       .cfg_lprx_timeout_counter =     REG_FIELD(DSI_TO_CNT_CFG_V101, 16, 31),
> +       .cfg_int_stat0 =                REG_FIELD(DSI_ERROR_ST0_V101, 0, 20),
> +       .cfg_int_stat1 =                REG_FIELD(DSI_ERROR_ST1_V101, 0, 17),
> +       .cfg_int_mask0 =                REG_FIELD(DSI_ERROR_MSK0_V101, 0, 20),
> +       .cfg_int_mask1 =                REG_FIELD(DSI_ERROR_MSK1_V101, 0, 17),
> +       .cfg_gen_hdr =                  REG_FIELD(DSI_GEN_HDR_V101, 0, 31),
> +       .cfg_gen_payload =              REG_FIELD(DSI_GEN_PLD_DATA_V101, 0, 31),
> +};
if we start getting a lot of these, one way to keep things brief is to
reuse the GEN._FEATURES approach in gpu/drm/i915/i915_pci.c

Namely:
#define 100_FEATURES \
 .foo = ... \
 .bar = ...

.... v100_layout = {
100_FEATURES,
};
... v101_layout = {
100_FEATURES,
// extra 101 changes
.foo = ...101, \
.bar = ...101
};

But that for another day.

HTH
-Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
