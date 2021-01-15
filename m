Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 061CE2F88C4
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jan 2021 23:48:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E870C32EA8;
	Fri, 15 Jan 2021 22:48:21 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3A33C424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 22:48:20 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id h205so15496175lfd.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 14:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t0KsXg4M0TSgcfgr9q1Aup9OVbSWH5qsGP6P1HJnqQI=;
 b=nr+3FESaeWSQDMXMqoTYe9Bk9PtqoTIrwf9XdcUu2x0sINiKCaKFTzjbG+rygAShu9
 btbasOZbysR+2vTTnVZCzcjqMPbRwMGZxQqpnM6FWD757/yRz6x05YQPCORUcVS/uZpL
 bRRLFEg11+tXzId0tQhEFlR8cUi6dUYwy9MFCgYCl2W2gutZFdAvlb9bRL4SdFiCJdEH
 A6PWXiGgyBgo95Ya0y12+vmmEWCWauKvrWGhwdxsVxT6vaJFHyUDSDCqyhlBV3tyUOtg
 JCo9qeCGt2CVPYMUWkRwLdb+Hik/oz+7Ooct+MuBUTuFGZlq4n1/cdyLzx7b3xiINmey
 rdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t0KsXg4M0TSgcfgr9q1Aup9OVbSWH5qsGP6P1HJnqQI=;
 b=lC6xB1tCwqyA7f/ENkIfVzWIPrTNCAXQitAGTm3auZ+WaTZf7xisRpOGtmZC1LU6Wq
 dT8xsq7IX7YA5QWXcauAX/yaTZlnTP41Yr0l8QsCmpPtx2tizol4dHNZfs4DQwOwQn8n
 fdeshIblYiJ7rro40kOqpccMHMQ0/htAflEK2TIB1JfBfMruWU67+QlrcxojrYqOPUbD
 8zx0sJDHGM6vtthC+rMjETO3GkbreWWSg7rL4jTNuZ9JqBf/eD1YHc/xFGd/Q3WjAMoo
 Kw3pbXZvPXDPrspcniIn7XObCmbeXLSWshkecBFdiQWIaVnjJazk3XCAgjbJU6gW5Es5
 4bZQ==
X-Gm-Message-State: AOAM531jXFvcLj/Kcrrwc52sEGN8PG6sM+pijNWHWhaGxVgQuO/sSe9V
 K3rOK2PmFaTuxSmSSyCNZ1ZUMOckqRwjvxUBpm6pAQ==
X-Google-Smtp-Source: ABdhPJz2hZxTvU/zr8AHqrJtJDbXDHkTHS35avmmlk+VmFA/9HJluc++NkALp2tU5yeYzH51QeLr2kgVYf70798dJbk=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr6198270lfd.291.1610750900040; 
 Fri, 15 Jan 2021 14:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20210105140718.122752-1-marex@denx.de>
 <CAPDyKFoQfm2ZtPdsZSZtOCDH-FJqNzihYqZny-vUdK4Q4tWTzQ@mail.gmail.com>
 <b83c1112-010b-a40f-319f-84c755424b0f@denx.de>
In-Reply-To: <b83c1112-010b-a40f-319f-84c755424b0f@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 15 Jan 2021 23:48:09 +0100
Message-ID: <CACRpkdarRZ=pFna5BWAqVdS4-ik1diKuXwMa_t9WwG23=pX_3g@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] [RFC] mmc: mmci: Add support for probing
 bus voltage level translator
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

On Wed, Jan 13, 2021 at 12:34 PM Marek Vasut <marex@denx.de> wrote:

> My understanding is that "init" is the way pins are configured before
> the driver reconfigures them to whatever the driver needs to configure
> them to. The "default" state is the normal operational state of the
> hardware, which often is the same as "init".

This is correct. "init" is optional and especially for situations like
this one.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
