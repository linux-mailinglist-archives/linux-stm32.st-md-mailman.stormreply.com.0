Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C36CEF7E
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 18:33:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 956F4C69069;
	Wed, 29 Mar 2023 16:33:22 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64CF9C65E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 16:33:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 7D47537E;
 Wed, 29 Mar 2023 16:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7D47537E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1680107599; bh=vol0vvvhGjAXnQgJjKN6stpyWJ0f2d8ePSYRTCwAwYA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ihosdN4WItM866ffFQWb3ysY0HQ+4JNv0Ex277nQD7s1iwV7Ulo4JTQlIucat+l6b
 0pyoIZazWgoW+FW8biDU68LMOFVKxo2ZXDLEbHBSmVI60VgPV+flrRP8TLZ6p8GXS8
 KNsBbi0iQb73UAuJ9CwRJM6Vw2oZcqVl/JYbG9M5MsCQ3uuth6q20gPlPRKBazMuj6
 PY0hEe3zL1fgFUsj2Y4WJEu9GXMXjlBTVu5tUd7Hp5/K/GnfLFwYXAEVQVTt+idKh1
 Adh78kfNcl+tEwXwBTUnLL14XhtMv4xyQo91CLXdMsR/0OjKC04JjaUnBlpFmCTQwW
 k/qiiTu4H5aOQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Roan van Dijk <roan@protonic.nl>
In-Reply-To: <20230329095600.1355049-1-roan@protonic.nl>
References: <20230329095600.1355049-1-roan@protonic.nl>
Date: Wed, 29 Mar 2023 10:33:18 -0600
Message-ID: <87ilejjz5d.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: stm32: add initial documentation for
	STM32MP151
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

Roan van Dijk <roan@protonic.nl> writes:

> This patch adds initial documentation of STM32MP151 microprocessor (MPU)
> based on Arm Cortex-A7.
>
> Signed-off-by: Roan van Dijk <roan@protonic.nl>
> ---
>  .../arm/stm32/stm32mp151-overview.rst         | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/arm/stm32/stm32mp151-overview.rst

You will need to add this new file to .../arm/index.rst or it won't be
pulled into the docs build (and will add a new warning).

Thanks,

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
