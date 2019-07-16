Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B59DF6AB12
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2019 16:55:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61D83C930ED
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2019 14:55:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1DFBC930D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2019 14:51:18 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58D982182B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2019 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563288677;
 bh=sonO2Wj/dB2WVkbnigGOIptZBiYzU9g2oAVvNNhm8N0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cJpVGUzwvpQrBfw5VxnjM7fZDMqN8buukyY5uNJV0ilBSNzK8xmxbSP8KeFgOPVGk
 CdhPYLcquPdpNPv9IfGMnbk93gK1YgS3rEW3NEieCmVZ/yyatbJnN9K/XZrO4tC0sv
 vpJ81lt0Z15VjbKndmSpPGS7eGfx6pNckGHuM6H8=
Received: by mail-oi1-f180.google.com with SMTP id e189so15708954oib.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2019 07:51:17 -0700 (PDT)
X-Gm-Message-State: APjAAAWDimNkCJytU94wxaLYgIaQjiqCCA6mYvaPgOG9Qz8XcjKDfkdc
 VQ4NobMeV5Z0/mMbY4hl5OoHxqi/0wTHf37oxTc=
X-Google-Smtp-Source: APXvYqznotTEvyaymhJh/wAMu0w2H5gcuDv5j22SZvycyNMyxsk7XBmOnJ7QXnjodYkrV1FF1kduEHzUtbpafqpVCNU=
X-Received: by 2002:aca:1b0c:: with SMTP id b12mr2605814oib.123.1563288676578; 
 Tue, 16 Jul 2019 07:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
 <20190712022018.27989-2-alex.shi@linux.alibaba.com>
In-Reply-To: <20190712022018.27989-2-alex.shi@linux.alibaba.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 16 Jul 2019 16:51:05 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcnMM=h9-MW4qg4OTxaY5eBQ=4tH=Gbd3tSuckFvSOPcw@mail.gmail.com>
Message-ID: <CAJKOXPcnMM=h9-MW4qg4OTxaY5eBQ=4tH=Gbd3tSuckFvSOPcw@mail.gmail.com>
To: Alex Shi <alex.shi@linux.alibaba.com>
X-Mailman-Approved-At: Tue, 16 Jul 2019 14:55:44 +0000
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-serial@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/12] Documentation/arm: repointer docs
	to Documentation/arch/arm
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

On Fri, 12 Jul 2019 at 04:20, Alex Shi <alex.shi@linux.alibaba.com> wrote:
>
> Since we move 'arm/arm64' docs to Documentation/arch/{arm,arm64} dir,
> redirect the doc pointer to them.
>
> Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> ---
>  Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt    |  2 +-
>  .../arch/arm/Samsung-S3C24XX/Overview.txt          |  6 +++---
>  Documentation/arch/arm/Samsung/GPIO.txt            |  2 +-
>  Documentation/arch/arm/Samsung/Overview.txt        |  4 ++--
>  Documentation/devicetree/bindings/arm/xen.txt      |  2 +-
>  Documentation/devicetree/booting-without-of.txt    |  4 ++--
>  Documentation/translations/zh_CN/arm/Booting       |  4 ++--
>  .../translations/zh_CN/arm/kernel_user_helpers.txt |  4 ++--
>  MAINTAINERS                                        |  6 +++---

I assume it will go through doc tree, so for Samsung:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
