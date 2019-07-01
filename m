Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA0100F6
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 22:37:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AE4BC35E04
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 20:37:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCBF3C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 20:37:38 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 591222177B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 20:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556656657;
 bh=ZEkaWl3bqlpN5zzBHSyjdUuA6td/ImB+VcUu5ceXrrg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D0l93wFAe+/YN05cfhvTTgYM2RMcBCdm1owCHx5HUWwwPu3jqbGwSdgpwwQg/sRS2
 bigpXK1w2fl6yGiGYF6RN3GzyJhfpfNjJVx2I32Fz06iXjnzMgKLm6V/Og61HScmDf
 g7Za+xaTyAU2Tcrxm1vsdglqnMepM1F9Las23Yqs=
Received: by mail-qt1-f175.google.com with SMTP id g4so17892264qtq.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 13:37:37 -0700 (PDT)
X-Gm-Message-State: APjAAAVjD84AMMk5sdxylyXkeWnrb6/6Hun+Ig/8iw1MyeRY3OUnEGnW
 GajYer1ZdYmzigm3JQo3kLrz4LyQskEbiWkHqw==
X-Google-Smtp-Source: APXvYqwhJElVj2x60tjUvvUMfvJRbF5otvzYyJ38emJ6ljN0SKbxGhiYJUKEaTnMuzrXbrepMqwwQHnR0axvr0viC3c=
X-Received: by 2002:ac8:610f:: with SMTP id a15mr47505444qtm.257.1556656656572; 
 Tue, 30 Apr 2019 13:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <1555426699-5340-1-git-send-email-fabien.dessenne@st.com>
 <1555426699-5340-3-git-send-email-fabien.dessenne@st.com>
 <20190430004051.GA7391@bogus>
 <ff424530-6e7b-cec9-910f-1897d60de2a1@st.com>
In-Reply-To: <ff424530-6e7b-cec9-910f-1897d60de2a1@st.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Apr 2019 15:37:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJjMy43Juhse_PwRqjwjG2swkiJsQgagZWAb53an9B-6Q@mail.gmail.com>
Message-ID: <CAL_JsqJjMy43Juhse_PwRqjwjG2swkiJsQgagZWAb53an9B-6Q@mail.gmail.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/8] dt-bindings: remoteproc: add
 bindings for stm32 remote processor driver
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

On Tue, Apr 30, 2019 at 9:15 AM Fabien DESSENNE <fabien.dessenne@st.com> wrote:
>
> Hi Rob,
>
>
> On 30/04/2019 2:40 AM, Rob Herring wrote:
> > On Tue, Apr 16, 2019 at 04:58:13PM +0200, Fabien Dessenne wrote:
> >> Add the device tree bindings document for the stm32 remoteproc devices.
> >>
> >> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> >> ---
> >>   .../devicetree/bindings/remoteproc/stm32-rproc.txt | 64 ++++++++++++++++++++++
> >>   1 file changed, 64 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> >> new file mode 100644
> >> index 0000000..430132c
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> >> @@ -0,0 +1,64 @@
> >> +STMicroelectronics STM32 Remoteproc
> >> +-----------------------------------
> >> +This document defines the binding for the remoteproc component that loads and
> >> +boots firmwares on the ST32MP family chipset.
> >> +
> >> +Required properties:
> >> +- compatible:       Must be "st,stm32mp1-m4"
> >> +- reg:              Address ranges of the remote processor dedicated memories.
> >> +            The parent node should provide an appropriate ranges property
> >> +            for properly translating these into bus addresses.
> > dma-ranges, but that's independent of 'reg'.
> >
> > It needs to list how many reg regions and what they are.
>
> The "reg" property needs to be removed since it is not used by the
> driver : the "memory-region" property (defined below) provides with all
> the needed memory information.

I'm not sure that's the right direction. reserved-memory nodes
generally should be in the range of system memory (i.e. what /memory
nodes define).

> Unfortunately, when I remove this "reg" property from the DeviceTree, I
> have this warning when building (W=123) the DTB:
>
>   "Warning (avoid_unnecessary_addr_size): /mlahb: unnecessary
> #address-cells/#size-cells without "ranges" or child "reg" property"
>
> IMHO, there is something wrong in the dtc script which seems to ignore
> the "dma-ranges" property that needs to have #address-cells/#size-cells
> defined. Just like "ranges".

Perhaps.

>
> The quick patch below (add check for "dma-ranges" ) in
> scripts/dtc/checks.c solves this issue.
>
> static void check_avoid_unnecessary_addr_size(struct check *c, struct
> dt_info *dti,
>                            struct node *node)
> {
> ...
>      if (get_property(node, "ranges") || get_property(node,
> "dma-ranges") || !node->children)
>          return;
> ...
>
> Can you confirm that I can remove the "reg" property and ignore the warning?

That should cause another warning because the 'simple-bus' checks
expect to have nodes with addresses as 'simple-bus' means MMIO bus.
That may have been the check which was broken for a while and I just
fixed not too long ago.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
