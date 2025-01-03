Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9836AA00C72
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 17:56:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35F44C78F68;
	Fri,  3 Jan 2025 16:56:02 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C035AC78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 16:55:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 481DAA40FB5;
 Fri,  3 Jan 2025 16:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21A3C4CED6;
 Fri,  3 Jan 2025 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735923352;
 bh=UATO23qcVHHPiRn6kDJDY1d+aEUGAULwRtnzqvBFyqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rPEHieJGdOEaNX3/Kp2mxHAlEEktfnj+x+ZdjGzUex7p4YLkQ8xbNklRG8FapebDT
 m9Fo3FfoXXE7hcWKwedvwVLxRh3jrHSO2jdPalbLsXnrJKBWDVwQAACQF1YIMWJGmw
 k7UcOatr9Nj9OAxJLm9+EK1QPYQ0X8PDPj3QvGxVi5yO5ZZTqscr9xmUwVaescqHqc
 6LEIwV/Nzo9DjyAHtNad/w4Flvtp2FOzdJFzVwLbf7gE+KnFGVEsAk2tA6qiyratCc
 ax4Di4ycV3nrsNgNnpS/7RBAX9NS9jWvooEBTO9aWve7B9a/Wver/FjhbzSR9zueuW
 8bhIOkDVA3G9g==
Date: Fri, 3 Jan 2025 10:55:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <173592330334.2414402.4730979254460270593.robh@kernel.org>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250103063241.2306312-2-a0987203069@gmail.com>
Cc: richardcochran@gmail.com, devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 yclu4@nuvoton.com, davem@davemloft.net, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, schung@nuvoton.com,
 peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 1/3] dt-bindings: net:
 nuvoton: Add schema for Nuvoton MA35 family GMAC
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


On Fri, 03 Jan 2025 14:32:39 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
