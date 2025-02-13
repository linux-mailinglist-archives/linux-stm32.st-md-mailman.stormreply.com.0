Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31616A3395B
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 08:57:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E82DBC78039;
	Thu, 13 Feb 2025 07:57:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37C5DC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 07:56:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A0A145C4D46;
 Thu, 13 Feb 2025 07:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A1CC4CED1;
 Thu, 13 Feb 2025 07:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739433413;
 bh=Iw7l11wmjpe86HkNwFn62sRLFVZeqZaemNraot+F2wU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=quqrMz3uae0Oo1jl94HETvKATZAtuY6Grn6QVvedAs+nhmiWU8iCf+PIUUT7Iu1xw
 7nxDal0wUQhsjviUmX1uPIMG4lyuTPZhKuZ88TJebIcXLgk0mfUHMnQ6OeeDuSEfnF
 jB2WzNmyh+d12OSzhCxG6Ji03eMbFciaMXtvJLwzZqRwe+eudo8nI0VzWTuuODYGbK
 0yOvGYX+kX/lOji/xeGL+dJOfCPCQesBt1gUgRJ5g9zxMwgeYFhU23A6+yE6/PlLNf
 t/EBJx7NytUfUgxyERrzXkug8Zj9wkBpQaqtSEtk0fObmkhyR7t1XRXgkfJ6sfTwBv
 1zK6LVJ+zIoxQ==
Date: Thu, 13 Feb 2025 08:56:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <20250213-lush-rainbow-moth-0f5e18@krzk-bin>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210131826.220318-1-patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/8] Add STM32MP25 SPI NOR support
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

On Mon, Feb 10, 2025 at 02:18:18PM +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics,
> for that it adds support for:
>   - Octo Memory Manager driver.
>   - Octo SPI driver.
>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
> 

You combined three different subsystems in one patchset and nothing here
explains why and what is the merging intention. Either split your work
or explain dependencies/merging.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
