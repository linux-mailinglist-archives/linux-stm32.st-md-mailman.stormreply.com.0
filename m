Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8861B3E207D
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Aug 2021 03:10:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50217C597BE;
	Fri,  6 Aug 2021 01:10:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 323EEC597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Aug 2021 01:10:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2CC3610E7;
 Fri,  6 Aug 2021 01:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628212250;
 bh=RABKd+OBGIGq+hL+Zan571iiylejaLL5KcYDrs0gUcc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fFZqsrn9QRjW235OIiyDO41H3DQoidEty8youhyT79WR3UrV+vztHWn4CKS2tyNpP
 aNHjFNIlONfnWPposonpJugeMJxxq0I6dF7ckPXfBsMfC43sGsMesQrGpgMFxw/ve7
 Cx2FqgoJRZnfcwQq4K5JWWqu093RQ15hJBg1YQ3YBhdFkNBaeGXDXlMEiNE3/S0hPR
 KUxE+P6fT1Qze0Y1N4oz69jrKpHJhG75i5tyKopb78GgD9K4vXOtsaQXB5YGXsWDf7
 83bFDMMdLJx8Xqv0Uiof4Oq2hVF9wQTv2CSPFUTrRFMl/mcSj96u4rlD3YiKgVLVLL
 G6NxrY6fdTPng==
MIME-Version: 1.0
In-Reply-To: <20210702225145.2643303-7-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
 <20210702225145.2643303-7-martin.blumenstingl@googlemail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org
Date: Thu, 05 Aug 2021 18:10:49 -0700
Message-ID: <162821224952.19113.2518483135031133024@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 6/6] clk: stm32mp1: Switch to
	clk_divider.determine_rate
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

Quoting Martin Blumenstingl (2021-07-02 15:51:45)
> .determine_rate is meant to replace .round_rate in CCF in the future.
> Switch over to .determine_rate now that clk_divider_ops has gained
> support for that.
> 
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
