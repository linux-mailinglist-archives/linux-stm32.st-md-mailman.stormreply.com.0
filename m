Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D146B654
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 09:46:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E9F1C5F1E8;
	Tue,  7 Dec 2021 08:46:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D10DEC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 08:16:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so1591087wms.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Dec 2021 00:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wV05YmqytZZ4i77GlP1Brthyva63mRUa2qE0+W2OXv4=;
 b=cC1Hbczjdh2dzt9ciK2qiKC3ZkYz1fGNc8p1h3oLUa2PWAkb2rVdSC0aavqJ+hIEzx
 pcvAhgPMbMkSHKM2in+pdz8ejZ2PqF/iimPZYtPQuW4YbhrLGril86javjmtKtUImtuH
 ZbQ9sVHkJZyetxai1yhoAKKC9qIRnccfGo4bqqCYFOUoJ0nMsc4ZaNR4ohPMMBMLYeq7
 5uSC9mLsvmQineh9UG21iURMUPJPQuwv8iGgoi/PBa323WyfEWbcdE7FWPdyC/L6aDau
 PXbmlej1r2JWIDKbmZZVVFWUIEidbsWHPyibno6dYOAKDAvZ/QWNTpn80CUMKZO2uJqe
 Q38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wV05YmqytZZ4i77GlP1Brthyva63mRUa2qE0+W2OXv4=;
 b=xxny6kFXW9OznB+6daT/PbH0p4uuqG0Cw2JPk7Er6JJ+GplesTZt9y8UsTcoukX4ww
 PCMj0Azv1bZK5AwnHmM1RX8lyqkmdu+Syj5Imz9YvlwMOsu6bdvc6UonXojXOsYFOZIK
 U6agi23bF+EuoBZ/tIhvGbu50ueRcvC+QauuW9Oc1TNCPjEOeZ4Ef2/3mkYXbZFXx9yS
 S5xZSTTGCI4ABJ/E/PNgWgsOaKHKPwwV8cxG653EglaBHC4oA2XOiQKbPc6wd2f3VVxU
 tHa2HLBeHpCVOzl+n81+Lu2h3j9svAuEpOjWtfjEh/ZB7kHdif8kECXzt88OlvL+cT4v
 sIkQ==
X-Gm-Message-State: AOAM533/9aHL7G4ITvhYBsaQZ0ELP4mdxvv+Smmfdlv46gWnlI+VAu3L
 UmLAWxiq5Ifp5NZZBhzn8OpBJ6MNfP6FCx1T3G2/3Q==
X-Google-Smtp-Source: ABdhPJy/5bX081hEllcHF+ciiU1wOWxT4YMmlv0lSO4Mp0uNC6xawLDFYKeG14mC3/pJJ+ZqaKc0D9h7/Cwk8IFQCsM=
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr5087144wmk.59.1638864974238; 
 Tue, 07 Dec 2021 00:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
 <20211207080843.21222-6-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20211207080843.21222-6-arnaud.pouliquen@foss.st.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Dec 2021 13:46:03 +0530
Message-ID: <CAAhSdy3GDArfbQgusdDg-mi1bdTfDhFMaF4qa5-KFv1regwJ-Q@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
X-Mailman-Approved-At: Tue, 07 Dec 2021 08:46:53 +0000
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 05/13] RISC-V: configs: Configs that
 had RPMSG_CHAR now get RPMSG_CTRL
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

On Tue, Dec 7, 2021 at 1:39 PM Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> In the patch "rpmsg: Move the rpmsg control device from rpmsg_char
> to rpmsg_ctrl", we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> cc: linux-riscv@lists.infradead.org

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index c252fd5706d2..c0439d3ffb8c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -97,6 +97,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 434ef5b64599..99eabad7ca0f 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -89,6 +89,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
