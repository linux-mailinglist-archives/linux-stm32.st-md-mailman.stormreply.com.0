Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA852DB295
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Dec 2020 18:30:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDCC0C32E90;
	Tue, 15 Dec 2020 17:30:43 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3271EC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 17:30:43 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id s75so24196798oih.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 09:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f37RWrXwsiv+0EoW1Yj6ZpyoDuIYg2z238UxVLI0rTM=;
 b=dKgKHtN11Jsc6+BBol3Kd9iEEF0mzQj1B/nXsEetfQYDH9xUOQ13xPaJ0RDLgVmudq
 qj+JDM0kqhVE9efHvkE28d7ZG8c/175DD+kPgEUn3rg3BJ0P7R4ohkKa5+llgccMB+mk
 JWJdJC7SIoHIz9Rkb/dYH6OoePiWclF5GfoZvl8RLPGqD9e9TarxiCDGyFMG6aGmYN96
 rC4grZ6RtnGCxzTCPzItMHRYzQ4+GgrYs/xCPDnMkgA2/pwPGUTW+P08rSwuYsjGGThV
 TAuMuNJMSjll/fGrOBqhM7NzKj/wCWyT6+WxLqbfN7uVIMitSigCiGsCEgXH8jfOsYqh
 Z7mg==
X-Gm-Message-State: AOAM5310C35bR49bc5HgYkHk4aT0XQa+N4dNyzUT7DJSXd+r/WgYGyiD
 S3+K0I6FCxKw/WEHyqqDKw==
X-Google-Smtp-Source: ABdhPJy+h89dvJUr6gfADjtGId8WiKWymjBfz57RzC+lV7rbruhDVmEpT328hNNnZ8Hu5ffbr8zbtA==
X-Received: by 2002:aca:cd85:: with SMTP id d127mr21918090oig.59.1608053441932; 
 Tue, 15 Dec 2020 09:30:41 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v17sm1517451oou.41.2020.12.15.09.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:30:41 -0800 (PST)
Received: (nullmailer pid 4072081 invoked by uid 1000);
 Tue, 15 Dec 2020 17:30:39 -0000
Date: Tue, 15 Dec 2020 11:30:39 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20201215173039.GA4072051@robh.at.kernel.org>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
 <20201214091616.13545-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214091616.13545-6-Sergey.Semin@baikalelectronics.ru>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lars Persson <larper@axis.com>,
 Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/25] dt-bindings: net: dwmac: Elaborate
 stmmaceth/pclk description
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

On Mon, 14 Dec 2020 12:15:55 +0300, Serge Semin wrote:
> Current clocks description doesn't provide a comprehensive notion about
> what "stmmaceth" and "pclk" actually represent from the IP-core manual
> point of view. The bindings file states:
> stmmaceth - "GMAC main clock",
> apb - "Peripheral registers interface clock".
> It isn't that easy to understand what they actually mean especially seeing
> the DW *MAC manual operates with clock definitions like Application,
> System, Host, CSR, Transmit, Receive, etc clocks. Moreover the clocks
> usage in the driver doesn't shade a full light on their essence. What
> inferred from there is that the "stmmaceth" name has been assigned to the
> common clock, which feeds both system and CSR interfaces. But what about
> "apb"? The bindings defines it as the clock for "peripheral registers
> interface". So it's close to the CSR clock in the IP-core manual notation.
> If so then when "apb" clock is specified aside with the "stmmaceth", it
> represents a case when the DW *MAC is synthesized with CSR_SLV_CLK=y
> (separate system and CSR clocks). But even though the "apb" clock is
> requested in the MAC driver, the driver doesn't actually use it as a
> separate CSR clock where the IP-core manual requires. All of that makes me
> thinking that the case of separate system and CSR clocks isn't correctly
> implemented in the driver.
> 
> Let's start with elaborating the clocks description so anyone reading
> the DW *MAC bindings file would understand that "stmmaceth" is the
> system clock and "pclk" is actually the CSR clock. Indeed in accordance
> with sheets depicted in [1]:
> system/application clock can be either of: hclk_i, aclk_i, clk_app_i;
> CSR clock can be either of: hclk_i, aclk_i, clk_app_i, clk_csr_i.
> (Most likely the similar definitions present in the others IP-core
> manuals.) So the CSR clock can be tied to the application clock
> considering the later as the main clock, but not the other way around. In
> case if there is only "stmmaceth" clock specified in a DT node, then it
> will be considered as a source of clocks for both application and CSR. But
> if "pclk" is also specified in the list of the device clocks, then it will
> be perceived as the separate CSR clock.
> 
> [1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
>     October 2013, p. 564.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml          | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
