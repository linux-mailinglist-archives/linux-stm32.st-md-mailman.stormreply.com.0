Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B78768DD6
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4519CC6DD98;
	Mon, 31 Jul 2023 07:17:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC4F9C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 15:49:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CEA361865;
 Wed, 12 Jul 2023 15:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A3CC433C8;
 Wed, 12 Jul 2023 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689176998;
 bh=2yLML1+ttVQqnGZfr76FCmXkJZijkmDKHwOJtoT4PNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rgfAdf4KfbFAY7xO70bp8077yG6NwBSnZrgNDosTM9zedqDd/7ySHiamiOF8Gw6qT
 30BoQvaK9wjjyZGF7JHGuToaJ3yVxb24UmP73pyuigeJE8abKaca31Gy2Rn+PNiTM5
 bvfK6IkxYRh5s+XZvvm3rJEvI/uKeuGqWAhz/mpJKX+IKLpH27O4nAYXL/38lEs67B
 b5vXG8kgZQjqH7GVa/VowodDUAmogu0iYpAGDX4avactpGDxzgf6i+ZkX6CenB9jqQ
 WikZIHCXDtXNim5VpV06M9PEj2doGLpPbxf1K2f/N78kJ4SHWBQjfZmjee9WC1yPZF
 2oYf2TQ4Ni1xg==
Date: Wed, 12 Jul 2023 17:49:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230712154952.dbmskjqnm2itkpan@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
 <20230710063351.17490-5-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-5-frank.li@vivo.com>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 05/11] i2c: stm32f4: Use
 devm_platform_get_and_ioremap_resource()
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

Hi Yangtao,

On Mon, Jul 10, 2023 at 02:33:44PM +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
