Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D1D99FA6B
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 23:46:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8E9AC78030;
	Tue, 15 Oct 2024 21:46:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C006C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 21:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RUPcqvj52wd/KjEg+PkVdtP+IR/bopp5LHO/Jp2z01M=; b=cpFpC9ARaM8RcbFr8RHpRDm14t
 tOVx/wx1A9POxxO+hU821j+9zVuC+0PBN9oxjAb3hoqsdNz+JJcHJvJo5bbqnRblcVey9kaiDjg7i
 aalEeuurdqp4+hg4qrAH1v1/dsTW3m/ZTvPyfiWueMlGYIibThGgwfgoWVLM3JNbzNF3DBasKoi8I
 B2wnM8BFagGHtpMi7AYVuCTZuYwrGxq3JmDikzTCJ09QJuy+nEJ29cZshbqbSVUc7n6ejTO+TTqER
 JH3AEknjgDIqXTdPUJAkcK40sPPnW7rF2lDmFIHzUJYvgkxCYXvJkaN3dyBLqyC1SOHIUOf97rCvI
 g8ckQE7Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51334)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1t0pNJ-0004Co-17;
 Tue, 15 Oct 2024 22:46:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1t0pNG-0004cP-2r;
 Tue, 15 Oct 2024 22:46:38 +0100
Date: Tue, 15 Oct 2024 22:46:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <Zw7ivkeqKWzkQrN2@shell.armlinux.org.uk>
References: <20241015-arm-kasan-vmalloc-crash-v1-0-dbb23592ca83@linaro.org>
 <20241015-arm-kasan-vmalloc-crash-v1-1-dbb23592ca83@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241015-arm-kasan-vmalloc-crash-v1-1-dbb23592ca83@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: ioremap: Flush PGDs for VMALLOC
	shadow
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

On Tue, Oct 15, 2024 at 11:37:14PM +0200, Linus Walleij wrote:
> @@ -125,6 +126,12 @@ void __check_vmalloc_seq(struct mm_struct *mm)
>  		       pgd_offset_k(VMALLOC_START),
>  		       sizeof(pgd_t) * (pgd_index(VMALLOC_END) -
>  					pgd_index(VMALLOC_START)));
> +		if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
> +			memcpy(pgd_offset(mm, (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START)),
> +			       pgd_offset_k((unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START)),
> +			       sizeof(pgd_t) * (pgd_index((unsigned long)kasan_mem_to_shadow((void *)VMALLOC_END)) -
> +						pgd_index((unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START))));

Maybe the following would be more readable:

static unsigned long arm_kasan_mem_to_shadow(unsigned long addr)
{
	return (unsigned long)kasan_mem_to_shadow((void *)addr);
}

static void memcpy_pgd(struct mm_struct *mm, unsigned long start,
		       unsigned long end)
{
	memcpy(pgd_offset(mm, start), pgd_offset_k(start),
	       sizeof(pgd_t) * (pgd_index(end) - pgd_index(start)));
}

		seq = ...;
		memcpy_pgd(mm, VMALLOC_START, VMALLOC_END);

		if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
			unsigned long start =
				arm_kasan_mem_to_shadow(VMALLOC_START);
			unsigned long end =
				arm_kasan_mem_to_shadow(VMALLOC_END);

			memcpy_pgd(mm, start, end);
> +		}

?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
