Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3809D41A2
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63DA0C7BF86;
	Wed, 20 Nov 2024 17:49:47 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45F31C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 19:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
 s=s1-ionos; t=1732045652; x=1732650452; i=parker@finest.io;
 bh=psRyF88Lgs3hRSIlO7wrFe0tOotT7zyqin9CJPdcNE4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=zPOMX9BAZd8AS/wZR7mhpcqxF14qxHW90ALGb8ayWPTS+e4qc81jXbmECGzo79zg
 +JfzIH6KsljVW5VeXYaskddQ1xOn1myr3o7zMXP6lon/l62vIe5O7COHLNixq9oVr
 e+9ebK/nZPDJOPgBQBFR3T2sjBB45FZhgLHRo2EZm7iI0+5euJc7bsSVJBFg6cubv
 nL59nc6KOMs2hbZ//kWtBDkJF3aoBslkGOFCX+aIGMry/P2ro6xVtg1VUPPclnRnT
 yuRrfWgRjgq7LpigRZVidECyM1Bs/xQ7BXWGDGQV/UlEv6CE5UnPywNvthTPw23Wh
 E5qdSmRouICUNH1J6A==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SWDEV2.connecttech.local ([98.159.241.229]) by
 mrelay.perfora.net (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0MUpdy-1tEUmm1ruW-00Uouj; Tue, 19 Nov 2024 20:47:32 +0100
Date: Tue, 19 Nov 2024 14:47:29 -0500
From: Parker Newman <parker@finest.io>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20241119144729.72e048a5.parker@finest.io>
In-Reply-To: <f00bccd3-62d5-46a9-b448-051894267c7a@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
 <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
 <20241119131336.371af397.parker@finest.io>
 <f00bccd3-62d5-46a9-b448-051894267c7a@lunn.ch>
Organization: Connect Tech Inc.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Nxu9rCdnIdW3P3qv7y+GUlOIPEyiicHtMkFAMxXbfvmXszGgWhq
 gytl6783/qhiYLAevL+5SRNu1dIjK8X5lDnRB5bmAt5lUmQ8G5PUYRElqKIxTnncpv8lskl
 FY1iHU9NHFl+nmPHbXA+tUrcMj1jNYH7GHtd+fQpalFRF1WKk5isUyPVv/GkblnDpTpe0j+
 ySk7+CTMlKlcg9c9UylKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IeTAM+Wzek0=;+TNVcZ5NOiYCiXgQHseq8IgxQmL
 KvE5z0B4ZyftUxgXFHiU/EYakeRN04yXl9IUYPk2UeEH1AV7tFa2piWIFRWtH12w9eB/mcu2G
 JZg7GKMM8YGFiqc5yfiVGzeM4CFFyeAAqxDYWbn9WoQjNe1C8eMaiw0XajULmJZDe4uX7Njnm
 /KN8VbIJtx1LhD9pkcyJyqHgBmlltSw6WxL6LmQcmhHaBXXSqjqZLqYpUPbUzkoonOpS+F12m
 Ryh+0fqnG6vae3EC0SmcfFhpBW++7bYP65crB3MfGHGP77favBbt0+Bphslji26RTjm9y3JoU
 RiY8fBnxXDa6RwKy1/5sXozMg29yXACBK3NrKoRv4Lni5lrORgllTzUmz52e/1eXclKYE/RsD
 bKZXwmFSJZpKwfqMr+NFhEihBI4vRuZRKMhwWcLnX1SQ1v5+4x1dtgWxPKI9M1uMF06MyNqq2
 W6hQYuepFsvgfk1vFx5R28US59P2ZdJND38etpcOj5E1OznyMK/WcnTEDtCvzpeDVkVgZfj4y
 O1EBrfifSgZ+502mc21SyPdbljqlUjrishtaFvP83VTm/8JpPBCrPdZM7CK2OP6p3D6VVWyxG
 uMjCuvQMgIsu8rPoIFjEOPEew7/8dbmHEglfBOtxZDHhnFQ/Jv+r6MsGMVu1Krv50jK1PAVay
 K00UWgJtI4/O7O7LJeygh5dfEtGaFL9a2kilgvQs+ejuPADFX76WChAGmDgVeLtvOy6TbNpQy
 lXpgxC2mcOZd0/TBjHvRHDu5pWdS5xUQmhDWR3FoKUyXQXF7rn8rpg/6jVFwTuwB8cC3yi4tS
 ziVHN/ZisJoo2SVXdEcKOj30zDgmqFlSwL6QFOIA8chB9ZCJgMPH3wOyTvJ6y9deJ2
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: Parker Newman <pnewman@connecttech.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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

On Tue, 19 Nov 2024 20:18:00 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > I think there is some confusion here. I will try to summarize:
> > - Ihe iommu is supported by the Tegra SOC.
> > - The way the mgbe driver is written the iommu DT property is REQUIRED.
>
> If it is required, please also include a patch to
> nvidia,tegra234-mgbe.yaml and make iommus required.
>

I will add this when I submit a v2 of the patch.

> > - "iommus" is a SOC DT property and is defined in tegra234.dtsi.
> > - The mgbe device tree nodes in tegra234.dtsi DO have the iommus property.
> > - There are no device tree changes required to to make this patch work.
> > - This patch works fine with existing device trees.
> >
> > I will add the fallback however in case there is changes made to the iommu
> > subsystem in the future.
>
> I would suggest you make iommus a required property and run the tests
> over the existing .dts files.
>
> I looked at the history of tegra234.dtsi. The ethernet nodes were
> added in:
>
> 610cdf3186bc604961bf04851e300deefd318038
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Thu Jul 7 09:48:15 2022 +0200
>
>     arm64: tegra: Add MGBE nodes on Tegra234
>
> and the iommus property is present. So the requires is safe.
>
> Please expand the commit message. It is clear from all the questions
> and backwards and forwards, it does not provide enough details.
>

I will add more details when I submit V2.

> I just have one open issue. The code has been like this for over 2
> years. Why has it only now started crashing?
>

It is rare for Nvidia Jetson users to use the mainline kernel. Nvidia
provides a custom kernel package with many out of tree drivers including a
driver for the mgbe controllers.

Also, while the Orin AGX SOC (tegra234) has 4 instances of the mgbe controller,
the Nvidia Orin AGX devkit only uses mgbe0. Connect Tech has carrier boards
that use 2 or more of the mgbe controllers which is why we found the bug.

Thanks,
Parker
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
