Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHCZHStZHGq7NAkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:52:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1BB617038
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:52:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 125F0C8F29C;
	Sun, 31 May 2026 15:52:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BBDBC8F265
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 15:52:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C3E0940BC1;
 Sun, 31 May 2026 15:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94DD1F00893;
 Sun, 31 May 2026 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780242727;
 bh=eR7tTyyqGKiLll6lxmnF9fbyjgtiuG6PiIQ2to9I1lg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=h7RlG9KI/qfwxt2MsBovFn4HsnPdEBEKVBXKizu1orQVjrTKARHZbjpD8kKgxlssj
 wltUyYNcOlBeaT/p8R8eNPrfW3FzOTjAyA5ZW44rJqOoSqVtI9A2EmPSgW39EnhzlC
 oewlM5ij6RXj4miHavwwDBWMRmyMVQe21ko0yV8+8Sr4D2OFrSBh0Z61g9ifiThWze
 7Hdl2u6trUHg3TZXxiubT2kew7hUo5d49LGShYYVkLrwcFikOBYmBnDPwHcoQ+enVg
 VM5gGJ0TodGV5zk8t3B2uBzIFVoCeHTX7FQIdxG/qf3uqK8FVoCfOsh2dg9hsZQXWk
 Nd4CAFthuAUzw==
Date: Sun, 31 May 2026 16:51:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Message-ID: <20260531165155.13e586cd@jic23-huawei>
In-Reply-To: <20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
 <20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 04/11] m68k: defconfig: update stmark2
	defconfig
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,gmail.com,uclinux.org,baylibre.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.959];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,baylibre.com:email]
X-Rspamd-Queue-Id: 1C1BB617038
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 31 May 2026 17:25:57 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Update stmark2 defconfig enabling MCF5441X DACs.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>  arch/m68k/configs/stmark2_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> index b3fb95f73a95..3941113bc60b 100644
> --- a/arch/m68k/configs/stmark2_defconfig
> +++ b/arch/m68k/configs/stmark2_defconfig
> @@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
>  CONFIG_MCF_EDMA=y
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
> +CONFIG_IIO=y
> +CONFIG_MCF54415_DAC=y

Sashiko makes the reasonable point that this symbol doesn't exist yet.
We don't care that much as they make different paths anyway but generally
I'd make sure defconfig updates are after the symbols are added.

https://sashiko.dev/#/patchset/20260531-wip-stmark2-dac-v4-0-7e65ab4215dd%40baylibre.com
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT2_FS_XATTR=y
>  CONFIG_EXT2_FS_POSIX_ACL=y
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
