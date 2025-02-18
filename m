Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3784A3A246
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 17:13:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70DC6C78F95;
	Tue, 18 Feb 2025 16:13:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5C66C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=/v+sG3TD6jlERhEZjj4JDFveXDMRMidR1SaMnbjck9w=; b=Jlil5M0o3R9rb3t3PBPnDyNjWf
 rwe6CYWwux1Fnga6sHKoWl84G7d8BUb3Q3ShtwqBUTFhP/AkvdSAnT0ng5LzjovAGacDbnMRfo7WS
 2mzW28ZKoVORAWY77+8Dx89RqD86A3RKjMCuWDUsCQSHAUWOJVU3g4pRHOBb7PV3xikg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tkQDy-00FLX1-UW; Tue, 18 Feb 2025 17:13:30 +0100
Date: Tue, 18 Feb 2025 17:13:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Philipp Stanner <phasta@kernel.org>
Message-ID: <c88920f3-ec6f-4ee9-a1d6-8423668480d0@lunn.ch>
References: <20250218132120.124038-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250218132120.124038-2-phasta@kernel.org>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>,
 netdev@vger.kernel.org, Yinggang Gu <guyinggang@loongson.cn>,
 Yanteng Si <si.yanteng@linux.dev>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] stmmac: Replace deprecated PCI
	functions
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

On Tue, Feb 18, 2025 at 02:21:21PM +0100, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> The PCI functions
>   - pcim_iomap_regions()
>   - pcim_iomap_table() and
>   - pcim_iounmap_regions()
> have been deprecated.
> 
> The usage of pcim_* cleanup functions in the driver detach path (remove
> callback) is actually not necessary, since they perform that cleanup
> automatically.
> 
> Furthermore, loongson_dwmac_probe() contains a surplus loop. That loop
> does not use index i in pcim_iomap_regions(), but costantly attempts to
> request and ioremap BAR 0. This would actually fail (since you cannot
> request the same BAR more than once), but presumably never fails because
> the preceding length check detects that all BARs except for 0 do not
> exist.

Thanks for the extended commit message.

It would be nice if the loongson Maintainers comment about the removal
of the loop. I will leave it a couple of days before adding a
Reviewed-by.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
