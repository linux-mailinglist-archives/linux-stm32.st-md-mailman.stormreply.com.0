Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B33F476A91
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 07:46:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4467C5E2C6;
	Thu, 16 Dec 2021 06:46:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2CBAC5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 06:46:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8E1B61C0A;
 Thu, 16 Dec 2021 06:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F96C36AE4;
 Thu, 16 Dec 2021 06:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639637171;
 bh=r2Y+GjX5e/u0eXEE0tEbkKF/KjAvJAimzMqFv0ZBGYU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ADCsw8pfq2mOoE1ULgtQ8P6dcADLMTui7q7yRxQPQcQxvtrSUMpSF5c3T4IgBuN4R
 6rt4PLhvQgD742ygjyggvrIrGDg6H+ZoqtOvIKjGOFcloXgKpH+J8LO0BLYx/g23Jd
 MNNMKGSMNmNGdFvWtw6WTfoy7nHC9lJ150ChrXfXVjnQHjXe1YHJO1VHONfZAQi1S2
 V+iOLKVbqXm/UWnyw6TXa9S4xbgpAdwiKUFtT3Vq4Uk/c3WIgqiclm4cbu0pXz8Yzz
 wPEIJBCh9tzCVP2sheG9cL+lt1XbhSSe7Kk1AAhK6INULJehZj+N+XlyTKu/hwabgX
 gk/TzozCFc1DA==
MIME-Version: 1.0
In-Reply-To: <CAL9mu0LVBSorMK9KbZ3kXYcnubi44yPDxzMroKYVYB2c=o+xjQ@mail.gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
 <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0LVBSorMK9KbZ3kXYcnubi44yPDxzMroKYVYB2c=o+xjQ@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dillon Min <dillon.minfei@gmail.com>
Date: Wed, 15 Dec 2021 22:46:10 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216064611.45F96C36AE4@smtp.kernel.org>
Cc: gnurou@gmail.com, kbuild-all@lists.01.org,
 Pi-Hsun Shih <pihsun@chromium.org>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 mchehab+huawei@kernel.org, hugues.fruchet@foss.st.com, llvm@lists.linux.dev,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel test robot <lkp@intel.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, ezequiel@collabora.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 09/10] clk: stm32: Fix ltdc's clock
	turn off by clk_disable_unused() after system enter shell
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

Quoting Dillon Min (2021-11-11 18:40:09)
> Hi Stephen
> 
> Would you pick up this patch? Thanks.
> 

Ok.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
