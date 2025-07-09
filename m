Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D85AFEBB0
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 16:22:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1465C36B2A;
	Wed,  9 Jul 2025 14:22:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 833B6C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 14:22:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 94858613B1;
 Wed,  9 Jul 2025 14:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6623FC4CEEF;
 Wed,  9 Jul 2025 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752070952;
 bh=RuYtf+o/prZlkiX+R1ATPE24ug38zrQkLBU6YbtB9gk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NamG7SQzyQWJ5KWdWWQHeVwsQhVqWV9f1070NVbepNAVaJWziLWvw4WxtupUVj5AY
 nuKJgYBWeMXoAm/HtGW1fkcZLHjaGk6CQsHImC0C5QwSHqsmT/sknOo5FNWalDWTl4
 RoIWCU5yClKHjTKMGDEfc4wzk6g+wccEpjZe4+bz0dsQeolEG7j3eZioyxg9MPKdZm
 9vAPQZ6b0De2Rp/z8XNoJe6moCn5k7qm+d72v7Zl3yIKew+sB6/nEvwPefnoC3jmBi
 xwwD6e2JbKdag1hgELjSnKJd6l/L+HPlswWndrbN71xXbznIqSyMhHFdlp5tRoZH/a
 wh0WrBv/dDi3Q==
Date: Wed, 9 Jul 2025 16:22:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <2o7ptcsi2akaphtofm57ok7te7qdxrchygpeqmdjaiushfjffs@5k47ncrcrgxk>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/3] Fix STM32 I2C dma operations
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Clement,

Thanks for following up on the reviews.

> Cl=E9ment Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer

I applied the two above in i2c/i2c-host-fixes. I'm not sure we
need the "Fixes:" tag in the first patch, though, as we are not
fixing a real bug. But I'm keeping it there for the time being.

>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

This one depends on the previous two to be appliex, so that for
now I added it in i2c/i2c-host-next. I will place it in the
proper branch after the weekly pull request.

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
