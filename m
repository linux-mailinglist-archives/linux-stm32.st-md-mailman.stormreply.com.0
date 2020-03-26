Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC945194144
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2020 15:28:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63B52C36B0B;
	Thu, 26 Mar 2020 14:28:06 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B38FCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 14:28:04 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id r7so1047103vsg.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 07:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nwrqr8fUwcczi1tkKbhoCAaTj0Lz9vANHD/lv6450Ik=;
 b=s0AYeRSme5ZYMG5Hj00MtSphy+ZF1hJEIT/x2laNKAPH6uwyawibNxjdwbP2n3VcAz
 csHlsS0gxGoa5DicQVyRyza5fvlnbU7gXob7YwmrF1iP6Arowk1BTPlr0kz4O3XeecgF
 1zk9ZTQ+jv4zeHagRLkhqZrvKEFdH+oNeK135nUnNRS91hY2ue714O+FEjcV14/4YNSF
 LfEKcr0FypAkSBknWreQBXQ7JbSB7qSlCdDz+6IHoDYmn4ebQwicF5K71DOR0GD0cCFh
 bCHWHd0BIGOXrsyTGs9lNM+SLJBnuSpHOhufi/2mLRvJCbJQ5z5/y/CztJiv8Q92tTQi
 xs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nwrqr8fUwcczi1tkKbhoCAaTj0Lz9vANHD/lv6450Ik=;
 b=NZjoZLEajki26p5K0IEgHPDdoclFnJ0EZF9mUbWTauuRtReGiVm/Bb2CdB2A2EKLGD
 xG0ai2e21EAVVIcX9yF8Sl9W+1mGT5ibuUvemBUnmDc0S+DyfnlBqUhO/ITkQqu0ObZC
 Ckyz5oCPYJKcGI1aUggbT4WD+q+rXLp8r9p7NQ8mpjvqm4mmXsogYgzJ8nctrUFvJS+C
 kuGb+4lDgP76yg3eVfBWe5lkxT7zTz73XdNxJCGoehzFRZ/o6R0rpebPCgyXUSyDH0sJ
 XIvPG5lcbXA5rEisNhOC6n4tjkNQ0Zw8Ri1KvqGb1HzhbIQhjryPv1Lbmp3tCY5YdTrf
 D+Jg==
X-Gm-Message-State: ANhLgQ0UKYoVeNcNCASvSeovMMa8mcEUtgRfByYinQIRpiUW8Yq3PU4M
 qM6cFASaX4UypMgr02IQfM4weD5RL2uplJU4rotX6A==
X-Google-Smtp-Source: ADFU+vsDl0E1ShxlqFNIKGgRphr3dXzKQ2BouqsiqJSyqwn2BTjEQZNw7vYZJmX1XaoteUXkIePuQWywtUNQtEW50KM=
X-Received: by 2002:a67:2ec6:: with SMTP id u189mr7072856vsu.200.1585232883289; 
 Thu, 26 Mar 2020 07:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200325143409.13005-1-ludovic.barre@st.com>
 <20200325143409.13005-3-ludovic.barre@st.com>
In-Reply-To: <20200325143409.13005-3-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2020 15:27:27 +0100
Message-ID: <CAPDyKFpO40Ois8pNwYOeqZrJbV9UeCLok=i8z4GWML+A7TP2-w@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 2/2] mmc: mmci: initialize
 pwr|clk|datactrl_reg with their hardware values
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

On Wed, 25 Mar 2020 at 15:34, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> In mmci_write_pwr|clk|datactrlreg functions, if the desired value
> is equal to corresponding variable (pwr_reg|clk_reg|datactrl_reg),
> the value is not written in the register.
>
> At probe pwr|clk|datactrl_reg of mmci_host structure are initialized
> to 0 (kzalloc of mmc_alloc_host). But they does not necessarily reflect
> hardware value of these registers, if they are used while boot level.
> This is problematic, if we want to write 0 in these registers.

It could be, but I don't see that we ever needs to do that - at least
not before we have written some other non-zero values to them (through
the helper functions).

>
> This patch initializes pwr|clk|datactrl_reg variables with their
> hardware values while probing.

Hmm, so in principle this change seems quite okay, but I am hesitant
to pick it up - unless it really addresses a problem that you have
observed.

The reason is, this change may lead to avoiding to re-write the
register with the same value it got during boot - and who knows what
is best here.

Kind regards
Uffe

>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 647567def612..f378ae18d5dc 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -2085,6 +2085,10 @@ static int mmci_probe(struct amba_device *dev,
>         else if (plat->ocr_mask)
>                 dev_warn(mmc_dev(mmc), "Platform OCR mask is ignored\n");
>
> +       host->pwr_reg = readl_relaxed(host->base + MMCIPOWER);
> +       host->clk_reg = readl_relaxed(host->base + MMCICLOCK);
> +       host->datactrl_reg = readl_relaxed(host->base + MMCIDATACTRL);
> +
>         /* We support these capabilities. */
>         mmc->caps |= MMC_CAP_CMD23;
>
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
