Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A59814D9720
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Mar 2022 10:07:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F39BC60468;
	Tue, 15 Mar 2022 09:07:42 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21EB8C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 09:07:41 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id bt26so31779678lfb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zeeeJfWkS5svYpn4HoxGdh9ciDWv9LeSzory1b+B2SY=;
 b=Lguir7+cdxtMoTZewkioJxEtHGNhM9VYzYPuNv0Zkv6l8LPQqhI1JbHWhTvJaZr7Iv
 w5pKN21tWrKVA0imsDR+eix7wbRQ/1sdLV9jZZ9C3iODy0hm6yHTzGlMhZGI3+vOmSQq
 uPRp9jsfu+1pCPwvydWSM1iqDCDyVkJvPsVCM7LoT7Bth5PrsYvvFwomMu7bsN8eqESa
 Sksbb2zIowZaJ3A4aRZghSl5m4IdIAcJpyDuNPsL8KCMHTda0A8yNLcGosT/UGBEEOq7
 DmMIRvbN3Ydzz5DohLHu9F7hIVkbOVf4MILPhvKFxLiWyQq2DopYrCN69vSk2r0x8Ucq
 OFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zeeeJfWkS5svYpn4HoxGdh9ciDWv9LeSzory1b+B2SY=;
 b=jxxo+ud0qncbuG3GbPwNVAoNJ+NNO8mbUMawP9zdk7MvHw+Yqsh9hCocMEkrNOUyMT
 Uy0XQWs2jK0+ZcoucxMotWtqPqF/p5YUIi9WD3stR7nRabNeBg8YX6pRnP+X7lqJy0ZV
 NWwykS6quE7DAWrHlQX0A2YW4q0quijhPNbTgx/mhAEoc2XWmzJ6BgzsbVBYDKFsHkAl
 tU1Lr15/7agRiZ4ySanCRUk0d1tPY8kfcDTIbI5BEgYLy7BbvntxH54NMYXPg+uZf3Ah
 7J9ldBF8ZRtdYwa3dZZ3rvys1AOeja3eUMQJvcsLNEB0QpK02jhz7UkchhRO6QIFFl1P
 WJrA==
X-Gm-Message-State: AOAM532RvbjdTpv4KUNsiuuCm0jfkbcL42vjYNY+rAWFxjr+1AuHAcu6
 9rDgi4fPUB5zaeuE3nxu6sXeldJiM1ZpvRLR0D7Quw==
X-Google-Smtp-Source: ABdhPJwMXDC4aNor5zLv9pw8OVQFFJXZ1VbOemFJnvj+EVSvjVIz4oxBW0h2HW79H2IdIi/HGrG+DumX2QL04EqSRW8=
X-Received: by 2002:a05:6512:260b:b0:445:c54c:4157 with SMTP id
 bt11-20020a056512260b00b00445c54c4157mr16046322lfb.254.1647335260309; Tue, 15
 Mar 2022 02:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220314095225.53563-1-yann.gautier@foss.st.com>
 <20220314125554.190574-1-yann.gautier@foss.st.com>
 <CAPDyKFruN9Xwk4uqFumwBdcn4SjKQcSQVBbALa3kVxY4mVzOnQ@mail.gmail.com>
 <9e4fbf6a-1309-3aee-fcb0-be7c2c683892@foss.st.com>
 <CAPDyKFq2Du1UWpvRFpVF_qL65SP0DfEV872U9Xe-9i7xKxXhqg@mail.gmail.com>
 <ce29e53a-59ff-000a-6b88-0b7ae538c515@foss.st.com>
In-Reply-To: <ce29e53a-59ff-000a-6b88-0b7ae538c515@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Mar 2022 10:07:03 +0100
Message-ID: <CAPDyKFq29+nwxXkV-Fyn91WD62-6REk+5UryVAK6XC4xKhcsfg@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, Marek Vasut <marex@denx.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 kernel@dh-electronics.com, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: manage MMC_PM_KEEP_POWER
	per variant config
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

On Mon, 14 Mar 2022 at 17:52, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> On 3/14/22 17:18, Ulf Hansson wrote:
> > On Mon, 14 Mar 2022 at 15:34, Yann Gautier <yann.gautier@foss.st.com> wrote:
> >>
> >> On 3/14/22 14:03, Ulf Hansson wrote:
> >>> On Mon, 14 Mar 2022 at 13:56, Yann Gautier <yann.gautier@foss.st.com> wrote:
> >>>>
> >>>> Add a disable_keep_power field in variant_data struct. The
> >>>> MMC_PM_KEEP_POWER flag will be enabled if disable_keep_power is not set.
> >>>> It is only set to true for stm32_sdmmc variants.
> >>>>
> >>>> The issue was seen on STM32MP157C-DK2 board, which embeds a wifi chip.
> >>>> It doesn't correctly support low power on this board. The Wifi chip
> >>>> awaits an always-on regulator, but it was connected to v3v3 which is off
> >>>> in low-power sequence. MMC_PM_KEEP_POWER should then be disabled.
> >>>
> >>> Just to make sure I get this correct.
> >>>
> >>> Why can't the regulator stay on during system suspend? The point is,
> >>> we don't need an always on regulator to cope with this.
> >>>
> >>> Kind regards
> >>> Uffe
> >>
> >> Hi Ulf,
> >>
> >> This v3v3 regulator powers most of the devices on this board. So we need
> >> to switch it off to gain power in suspend mode.
> >
> > I see. Thanks for sharing that information.
> >
> > The MMC_PM_KEEP_POWER flag is there to describe what is supported by
> > the platform/host. It doesn't mean that the card *must* stay powered
> > on during system suspend. Instead that depends on whether system
> > wakeup for the SDIO/WiFi is supported too - and if that is enabled by
> > userspace. If not, the regulator will be turned off for the SDIO card
> > during system suspend.
> >
> > Assuming the regulator is implemented as a proper regulator and can
> > remain on during system suspend, the right thing would be to keep the
> > MMC_PM_KEEP_POWER flag around.
> >
> > Kind regards
> > Uffe
> >
>
> OK, but in the wifi driver we use on this platform (brcmfmac), the
> suspend/resume functions (brcmf_ops_sdio_suspend/brcmf_ops_sdio_resume)
> use the flag to check regu was off, and then call probe function during
> resume, to re-init Wifi chip and reload its firmware.

I had a closer look at the brcmfmac driver, thanks for the pointers.

In my opinion, I think we should change the brcmfmac driver, so it
decides to power off the SDIO card, unless the WiFi chip is configured
to serve us with system wakeups.

I can send a patch for brcmfmac that we can try, unless you want to
send it yourself?

>
>
> Best regards,
> Yann

Kind regards
Uffe

>
> >>
> >>
> >> Yann
> >>
> >>>
> >>>>
> >>>> The flag can still be enabled through DT property:
> >>>> keep-power-in-suspend.
> >>>>
> >>>> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> >>>> ---
> >>>> Update in v2:
> >>>> Reword commit message to better explain the issue.
> >>>>
> >>>> Resend the patch alone. It was previoulsy in a series [1] for which the
> >>>> other patches will be reworked.
> >>>>
> >>>> [1] https://lore.kernel.org/lkml/20220304135134.47827-1-yann.gautier@foss.st.com/
> >>>>
> >>>>    drivers/mmc/host/mmci.c | 5 ++++-
> >>>>    drivers/mmc/host/mmci.h | 1 +
> >>>>    2 files changed, 5 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> >>>> index 45b8608c935c..0e2f2f5d6a52 100644
> >>>> --- a/drivers/mmc/host/mmci.c
> >>>> +++ b/drivers/mmc/host/mmci.c
> >>>> @@ -274,6 +274,7 @@ static struct variant_data variant_stm32_sdmmc = {
> >>>>           .busy_detect            = true,
> >>>>           .busy_detect_flag       = MCI_STM32_BUSYD0,
> >>>>           .busy_detect_mask       = MCI_STM32_BUSYD0ENDMASK,
> >>>> +       .disable_keep_power     = true,
> >>>>           .init                   = sdmmc_variant_init,
> >>>>    };
> >>>>
> >>>> @@ -301,6 +302,7 @@ static struct variant_data variant_stm32_sdmmcv2 = {
> >>>>           .busy_detect            = true,
> >>>>           .busy_detect_flag       = MCI_STM32_BUSYD0,
> >>>>           .busy_detect_mask       = MCI_STM32_BUSYD0ENDMASK,
> >>>> +       .disable_keep_power     = true,
> >>>>           .init                   = sdmmc_variant_init,
> >>>>    };
> >>>>
> >>>> @@ -2172,7 +2174,8 @@ static int mmci_probe(struct amba_device *dev,
> >>>>           host->stop_abort.flags = MMC_RSP_R1B | MMC_CMD_AC;
> >>>>
> >>>>           /* We support these PM capabilities. */
> >>>> -       mmc->pm_caps |= MMC_PM_KEEP_POWER;
> >>>> +       if (!variant->disable_keep_power)
> >>>> +               mmc->pm_caps |= MMC_PM_KEEP_POWER;
> >>>>
> >>>>           /*
> >>>>            * We can do SGIO
> >>>> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> >>>> index e1a9b96a3396..2cad1ef9766a 100644
> >>>> --- a/drivers/mmc/host/mmci.h
> >>>> +++ b/drivers/mmc/host/mmci.h
> >>>> @@ -361,6 +361,7 @@ struct variant_data {
> >>>>           u32                     opendrain;
> >>>>           u8                      dma_lli:1;
> >>>>           u32                     stm32_idmabsize_mask;
> >>>> +       u8                      disable_keep_power:1;
> >>>>           void (*init)(struct mmci_host *host);
> >>>>    };
> >>>>
> >>>> --
> >>>> 2.25.1
> >>>>
> >>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
