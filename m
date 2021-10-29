Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E324B43FE63
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Oct 2021 16:23:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D4AAC5E2C2;
	Fri, 29 Oct 2021 14:23:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41FFCC23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Oct 2021 14:23:54 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5D71F835BF;
 Fri, 29 Oct 2021 16:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1635517433;
 bh=ZWEwn6xxH9thjtW69prVFZ20jiDIdEX/mAl5N86y5gs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=zQ6qmJoFsbPLo4fNjIbKsn7lCU5pFd4Y+8R5ranowo4Nxmas9/BVTJiCfFUc9Vyh3
 hyAYHqJu5yndLGFMzAldklvksqkCdo4lAuL8oqscb8d/0+j8BQ/EtyaYROLCSOXkU4
 zmZeeAm8fxHrLRtp8QxPEa1tp2roO99pUmRUBIxpOO6camEULH5Q+SMQASl9l2jB0g
 gRAnVQ32ftQYow2aLiU4szUBz9eX1n2b4oiau9TeOlvmvRUQ3PIZ+Jp+IxpF8PK7Ev
 BEyy+eT/r0COf5T/gWGoWQHV0YZu00+3FS6PYaY5XkpUk5JeZUBQkuH9c+CaLuPX36
 sv5H18B800xYg==
To: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20211029135454.4383-1-nicolas.toromanoff@foss.st.com>
 <20211029135454.4383-5-nicolas.toromanoff@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <1ec60d9c-1ab4-8a92-1c6d-8093232ca039@denx.de>
Date: Fri, 29 Oct 2021 16:23:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211029135454.4383-5-nicolas.toromanoff@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 4/8] crypto: stm32/cryp - fix race
	condition
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/29/21 3:54 PM, Nicolas Toromanoff wrote:
> Erase key before finalizing request.
> Fixes: 9e054ec21ef8 ("crypto: stm32 - Support for STM32 CRYP crypto module")

Can you be a bit more specific in your commit messages ? That applies to 
the entire patchset. It is absolutely impossible to tell what race is 
fixed here or why it is fixed by exactly this change. This applies to 
the entire series.

And while I am at it, does the CRYP finally pass at least the most basic 
kernel boot time crypto tests or does running those still overwrite 
kernel memory and/or completely crash or lock up the machine ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
