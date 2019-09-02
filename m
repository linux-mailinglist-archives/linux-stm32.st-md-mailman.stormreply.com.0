Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89366A5B79
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 18:42:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 431C1C35E01;
	Mon,  2 Sep 2019 16:42:40 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E268C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2019 16:42:39 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n7so16186841qtb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Sep 2019 09:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ESVPzvoDmyhr0qPHPc2dAllaJ5z0kVzBcRcJ6MBqm24=;
 b=bpbvnBrd3PCQB+v9NgCG841OSGxygFjRle3CVASbp/JG4oLxdTeaLFpmoQuAjA3kjI
 EKapdP75grpgUV6kcufZbSJ95Kn4AHdNkzP6keS2UdSB7vQimrQra6VphWfxwgzAuyHn
 Vr3LT73OnRmFJ6i9fSfrj61ZdXfbZimidDHOtmPacZ8MhtKIc4pvimFk2Ak3nh+nXFaI
 DUkjFq3fTiwJyIqjbpoNiCpaNJ86sDXylndkaTucT6rWcqvLTnN7pyv57VZw04GRdVV0
 us4q7siyxSjz6Om2FZNQlUYjddO0nBroIb9bh+qYqylKQ/IMz1beJt400ac1YTEKR3ND
 n2mw==
X-Gm-Message-State: APjAAAUqDZK6CSqlCLqvWGmFVAyLwkNBLBUfdUWsy8F5lrE8gE57yT5d
 iHIO5AcSqz8Xn+27yPq9fBgPgAfyvnxi29IfmBk=
X-Google-Smtp-Source: APXvYqyBIip2MdBOWy21R2bhPQrCc7eiTrHZFC+NOHCN4Z9fnQKXYsfcYC6/YlQc/qHGnz8aoQ0TFDMFoEZIE2D91R0=
X-Received: by 2002:a0c:e74b:: with SMTP id g11mr18622746qvn.62.1567442558193; 
 Mon, 02 Sep 2019 09:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <1567440041-19220-1-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1567440041-19220-1-git-send-email-olivier.moysan@st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 2 Sep 2019 18:42:21 +0200
Message-ID: <CAK8P3a3WvXmMys3mamCZef1-ychtdg+XbV=H-WTs2ZN6Jsrcbg@mail.gmail.com>
To: Olivier Moysan <olivier.moysan@st.com>
Cc: Tony Lindgren <tony@atomide.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Yannick Fertre <yannick.fertre@st.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 0/4] ARM: multi_v7_defconfig: add audio
	support for stm32mp157a-dk1
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

On Mon, Sep 2, 2019 at 6:01 PM Olivier Moysan <olivier.moysan@st.com> wrote:
>
> This patchset adds audio support for stm32mp157a-dk1 board.
>
> Olivier Moysan (4):
>   ARM: multi_v7_defconfig: enable stm32 sai support
>   ARM: multi_v7_defconfig: enable stm32 i2s support
>   ARM: multi_v7_defconfig: enable cs42l51 codec support
>   ARM: multi_v7_defconfig: enable audio graph card support

The changes are ok, and I expect Alexandre will pick them up and forward
to the soc tree.

However, I would prefer these to just be a single patch, as there is little
use in splitting the intended change up into one line per patch.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
