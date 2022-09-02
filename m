Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 589905AAAA1
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Sep 2022 10:52:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7313C5EC6B;
	Fri,  2 Sep 2022 08:52:02 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC530C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Sep 2022 08:52:00 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id q81so1071707iod.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Sep 2022 01:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fP5QUufc8/nDF8+DKG6kWqz0eNAOkgRskOzTNgrAPTY=;
 b=EVSQlDtpd3k83YmFx7EANYTPSj6pRkjkBpZTnZ3YsQVqwLh5bkWw04Rsq4WALtMlQP
 bNUxfYGeuwsjlw1cc4NZ95JJJgWqtpvU1UKFRR0GuLTyMCUFkza77EXIIkYAyjyfmnxJ
 r5SGXWd3T2Zogth/tQwHhtDjoHGVQ9hc3xloflJ0xO74TrzfsWxebKIbINXZyvxZrdsP
 PLD8EAAfKJ4HapDpsx2AqDi9zT0L9mB6B2ai/Ow77OA4oIZLqCq/e/aEo0XoIOkIh2FY
 M2drf6KSfMSCb9EDvfql4lqIo1d6pChqjGpdvar4l55XiWDo5pkDJlO8+uj5el7u4FH6
 djDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fP5QUufc8/nDF8+DKG6kWqz0eNAOkgRskOzTNgrAPTY=;
 b=k47P4SkpZu0tqHlSn1IcphrsCKex6W8MALtIL978XYupg+5f1bUSQWYWbhstSQoldp
 8zuQHjicAI1ocWepMLnNVYOe98h6ccO7p5n467LQT1YfSkygS+VGNB4FhnzkA6fftDGu
 AjuBzpR58hS7zuwYiESeyUx5HeTQNp0zJ9MzwG7+Pyo06lc4eCzScJ6PK6QnBxPIt3cX
 1eNjhkfGQyQgjOFFH5Rz/oYtxJ6hPfj7ZM74ZhT7j19lop+GBXwJCwFdd8UHYmT4fFtW
 dMOFRlUGD0tpZFgsU5IA68VQh/NbmTiM3np1CbHmQTeTiupMZ/vZYZoUpqIEd+lJ5sS5
 jf8Q==
X-Gm-Message-State: ACgBeo3lpsRo/0wKxklq98QeTdJCo+ntbf+4n42SrGkkO2KKlfdo6KTS
 8/fWvFVbe9UW4GgolkhsE/98Xw0WJ9wve4Wpyr8uig==
X-Google-Smtp-Source: AA6agR4w6j8Z8678KqWSVpdc1/Jc0po1marz2l8xOyZP+RhwkUrNvN3wWEP5gPchjuSBEMB+vtt29IjvqNLQVmup2mg=
X-Received: by 2002:a02:ce8e:0:b0:349:ce44:38dc with SMTP id
 y14-20020a02ce8e000000b00349ce4438dcmr20231978jaq.298.1662108719577; Fri, 02
 Sep 2022 01:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220829065044.1736-1-anand@edgeble.ai>
 <20220829065044.1736-2-anand@edgeble.ai> <Ywy6o2d9j4Z7+WYX@lunn.ch>
 <CA+VMnFzNcPesS8Mn2mwr-RDXf5sRz-2A3K+syDmpCo1va6JwMw@mail.gmail.com>
 <YxChtBzavS1Fooxs@lunn.ch>
In-Reply-To: <YxChtBzavS1Fooxs@lunn.ch>
From: Jagan Teki <jagan@edgeble.ai>
Date: Fri, 2 Sep 2022 14:21:48 +0530
Message-ID: <CA+VMnFy7KUzY_Hj5sX16XR1K=FouA+J7hCKu5j_94khHVmbEJg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
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

On Thu, 1 Sept 2022 at 17:42, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Sep 01, 2022 at 12:56:09PM +0530, Jagan Teki wrote:
> > On Mon, 29 Aug 2022 at 18:40, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > On Mon, Aug 29, 2022 at 06:50:42AM +0000, Anand Moon wrote:
> > > > Rockchip RV1126 has GMAC 10/100/1000M ethernet controller
> > > > via RGMII and RMII interfaces are configured via M0 and M1 pinmux.
> > > >
> > > > This patch adds rv1126 support by adding delay lines of M0 and M1
> > > > simultaneously.
> > >
> > > What does 'delay lines' mean with respect to RGMII?
> >
> > These are MAC receive clock delay lengths.
> >
> > >
> > > The RGMII signals need a 2ns delay between the clock and the data
> > > lines. There are three places this can happen:
> > >
> > > 1) In the PHY
> > > 2) Extra long lines on the PCB
> > > 3) In the MAC
> > >
> > > Generally, 1) is used, and controlled via phy-mode. A value of
> > > PHY_INTERFACE_MODE_RGMII_ID passed to the PHY driver means it will add
> > > these delays.
> > >
> > > You don't want both the MAC and the PHY adding delays.
> >
> > Yes, but these are specific to MAC, not related to PHY delays. Similar
> > to what is there in other Rockchip SoC families like RK3366, 3368,
> > 3399, 3128, but these MAC clock delay lengths are grouped based on the
> > iomux group in RV1126. We have iomux group 0 (M0) and group 1 (M1), so
> > the rgmii has to set these lengths irrespective of whether PHY add's
> > or not.
>
> So this is just fine tuning, in the order of pico seconds?
>
> If that is all it is, then this is fine. It becomes a problem when it
> is 2ns.

Yes, it is fine I think. We have tested the delay mentioned as per the
documentation.

tx_delay: Range value is 0~0x7F
rx_delay: Range value is 0~0x7F

Thanks,
Jagan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
