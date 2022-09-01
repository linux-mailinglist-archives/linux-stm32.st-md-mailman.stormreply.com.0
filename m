Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 898375A90C1
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Sep 2022 09:43:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C751C03FDB;
	Thu,  1 Sep 2022 07:43:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65E78C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Sep 2022 07:26:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id u17so1840530wrp.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Sep 2022 00:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6URCR0Wpeb5bQwy5urRdO0hju2iSMx2+jAWiT1nTtYU=;
 b=i9ZaVzgL8K3GGHTwz2QyJmc8n7L7qiM/bBnfx/nSkWGefaZQ4zA/eCl/SUs++RWrW+
 9kln9KIUdPPWlFXp8r53l8+ZxNmLb6Fu85zL9/ifiDdm1BBcnglO/sKPceEDzdAwhOFq
 59mXVSFlC6SaaTzMEld8AvynlHJpUj6bRDvwDHazLlZhEKl9EGKh7LRhEOTiAefzSfHS
 u+b7bQPpe5g7XGtuSWGUUDtnWQBHGr6cPMSAsZCkvatNduKM1t9WPbaWt36CwMYL82XM
 Mnn5lvLYn+50F5jsJ384+PwWdxp54C9SYkscTd5A0DOC3SIKRXiLeiAgfiJrn7GtjKuN
 Tu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6URCR0Wpeb5bQwy5urRdO0hju2iSMx2+jAWiT1nTtYU=;
 b=wdcfrfZ8epGD2KMtQh/ZnJgfX4vb4JiWOgdajkwVowtN0ExJKs30yiOC2BicvhLzSO
 8nXHA39eOfpBbtMvUhGJZU8Ai2rI1qr2ASaWH+jJmHH59/RdzZaujMhpZn3jvhWN2CWA
 k1iTdoJQzCQR02amzbvjJHGb4qiGOp+EcXlJCZpz+16KM26U/cm90IC7XwO3V+EiM7EK
 uh/8FH/Bet6mZux0iWgQONvE0BHHsDdqJ56HpHVqf9RwOfxS7706lcp0IIhvozEOCuBN
 zpb1HSZIcpcGEpqD2I0VlQmVkfsDJy7Zt5yk11t6EdCbXGCyIwRZgBwH0AXcoKXEYYd8
 WUMw==
X-Gm-Message-State: ACgBeo3GoycoGGaMlnqKcNKlDNqpRbEEsiOhpxf2Z8S7Sz2hMDdReAG1
 Po9objiu430DMebFUM6n85HIie1XxcXDAxM5z5U7tw==
X-Google-Smtp-Source: AA6agR4uWYbjZlVSMUEptQVzKN0UtnQh2gv8/PRyEudCuSAsJ2mxPXVlecKHf7qG3XkS1wn1a3vxDtN4k03iipWQw0Q=
X-Received: by 2002:a05:6000:1549:b0:225:652e:45d4 with SMTP id
 9-20020a056000154900b00225652e45d4mr14211030wry.15.1662017179994; Thu, 01 Sep
 2022 00:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220829065044.1736-1-anand@edgeble.ai>
 <20220829065044.1736-2-anand@edgeble.ai> <Ywy6o2d9j4Z7+WYX@lunn.ch>
In-Reply-To: <Ywy6o2d9j4Z7+WYX@lunn.ch>
From: Jagan Teki <jagan@edgeble.ai>
Date: Thu, 1 Sep 2022 12:56:09 +0530
Message-ID: <CA+VMnFzNcPesS8Mn2mwr-RDXf5sRz-2A3K+syDmpCo1va6JwMw@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailman-Approved-At: Thu, 01 Sep 2022 07:43:28 +0000
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 David Wu <david.wu@rock-chips.com>, Anand Moon <anand@edgeble.ai>,
 linux-stm32@st-md-mailman.stormreply.com,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: ethernet: stmicro: stmmac:
	dwmac-rk: Add rv1126 support
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

On Mon, 29 Aug 2022 at 18:40, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 29, 2022 at 06:50:42AM +0000, Anand Moon wrote:
> > Rockchip RV1126 has GMAC 10/100/1000M ethernet controller
> > via RGMII and RMII interfaces are configured via M0 and M1 pinmux.
> >
> > This patch adds rv1126 support by adding delay lines of M0 and M1
> > simultaneously.
>
> What does 'delay lines' mean with respect to RGMII?

These are MAC receive clock delay lengths.

>
> The RGMII signals need a 2ns delay between the clock and the data
> lines. There are three places this can happen:
>
> 1) In the PHY
> 2) Extra long lines on the PCB
> 3) In the MAC
>
> Generally, 1) is used, and controlled via phy-mode. A value of
> PHY_INTERFACE_MODE_RGMII_ID passed to the PHY driver means it will add
> these delays.
>
> You don't want both the MAC and the PHY adding delays.

Yes, but these are specific to MAC, not related to PHY delays. Similar
to what is there in other Rockchip SoC families like RK3366, 3368,
3399, 3128, but these MAC clock delay lengths are grouped based on the
iomux group in RV1126. We have iomux group 0 (M0) and group 1 (M1), so
the rgmii has to set these lengths irrespective of whether PHY add's
or not.

Thanks,
Jagan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
