Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AEE769A50
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 17:05:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82703C6B46E;
	Mon, 31 Jul 2023 15:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78EE2C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 15:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=0+kFd0PeLKGw7bCHBy4dn6TcM2mrgGMssJUohhcTcA0=; b=K8xAm8d84ZvAl6tQ0q8q3Xrfw9
 jzmMF7NG3Idujlq0AT6Rt2ArZwBhnJV3iNneG0vsF0uEVWgnt8TsZC/e+8R4zJ0c9AvFSCM2p5heh
 fLh1v88Fwx2Ff0v4gxerNhyojk3Go/acQuGmE1eaUWh3gOozCa//gT3/uR21xcZWKgHQmIVViaKsX
 E/ly9B1HPJqJGDjQU+4IRR1/EECWiTtSd+uSnrI1gKBfOuj3sXVF7twJdgj35Tfz94xSmgfUKDCAe
 4tczCaJd8HbQOHF9pA9cjFMkiZZS+hQuGyqkNdotAPSSLa1NsR6d0Lske76wByU19CCuzzpmaHUiB
 FMHQSTSw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qQUSX-00GFIi-2e; Mon, 31 Jul 2023 15:05:21 +0000
Message-ID: <a6d9857c-fcbd-74d0-bc97-fc86a8c1b820@infradead.org>
Date: Mon, 31 Jul 2023 08:05:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Masahisa Kojima <masahisa.kojima@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jens Wiklander
 <jens.wiklander@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org
References: <20230731065041.1447-1-masahisa.kojima@linaro.org>
 <20230731065041.1447-4-masahisa.kojima@linaro.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230731065041.1447-4-masahisa.kojima@linaro.org>
Cc: linux-efi@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 3/5] efi: Add tee-based EFI variable
	driver
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



On 7/30/23 23:50, Masahisa Kojima wrote:
> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
> index 043ca31c114e..aa38089d1e4a 100644
> --- a/drivers/firmware/efi/Kconfig
> +++ b/drivers/firmware/efi/Kconfig
> @@ -287,3 +287,18 @@ config UEFI_CPER_X86
>  	bool
>  	depends on UEFI_CPER && X86
>  	default y
> +
> +config TEE_STMM_EFI
> +	tristate "TEE based EFI runtime variable service driver"

	          TEE-based

> +	depends on EFI && OPTEE && !EFI_VARS_PSTORE
> +	help
> +	  Select this config option if TEE is compiled to include StandAloneMM
> +	  as a separate secure partition it has the ability to check and store

	                       partition. It has the ability

> +	  EFI variables on an RPMB or any other non-volatile medium used by
> +	  StandAloneMM.
> +
> +	  Enabling this will change the EFI runtime services from the firmware
> +	  provided functions to TEE calls.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called tee_stmm_efi.

-- 
~Randy
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
