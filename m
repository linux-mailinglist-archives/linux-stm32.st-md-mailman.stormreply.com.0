Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3CF94C773
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 01:47:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F795C78019;
	Thu,  8 Aug 2024 23:47:55 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6F4DC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2024 23:47:46 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7106e2d0ec1so1337865b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Aug 2024 16:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723160865; x=1723765665;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iOehbxoiyY/eLywGgqw542GpH2EfYYIjh/sRT6jc9w8=;
 b=avvh5pINqesmDSJZQADrZ3YKsaRWrttf8wwDPmbLRapP8myB+83whGROYporlN+1ZA
 U7RyWMqOFFFFPW6dS/WQzmSKOGgn/3Is+1EM7u0s8iUxC4fheZlzZI+nMvelU/2xEAtz
 r2AfuunzuDOyhTSKftsK23PvwMlBNcvzwy1mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723160865; x=1723765665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iOehbxoiyY/eLywGgqw542GpH2EfYYIjh/sRT6jc9w8=;
 b=ZquU1GZS97Tu8KwQ+/ytLmFzHKfdXUwnP3YjOyMh6XkxfnIsCqW59BbH6Hvb9BwIl9
 EJXNdemlpTNxoH5YvB7nh0Nvu42ToCrb+73CeWidLTVH6Nl1dplp6US4W8huvkMS63c9
 nLgV9tauNVlVOID0iEqZSvThvuiSuZWOsM6owQYuh5i1GqDwPzFwOya8C1PeyZLW/loY
 6YgiLCPXOXKdtSj6ukfnFB4TqXSKoXySIxqsTcqNKvJP3aasEGda3QbnZl+GgzVxdud6
 sNRLL+JESa7KvHrMrzv8ip7Klz8QasJYaLZG2/y7hpY8CpLWpt/xhXpvJrBVMKviV2N5
 jMeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVujpcm8Z77q/iGxy8gLwHo8p3GdrAibZreV7xeeBCFtVhPf6TCps50sD+2QB/RL8cg9YM7ry96lR9CeoEz4LPxAiVhoy1ey/Nt4MA7oe+4nFCn2zn816Al
X-Gm-Message-State: AOJu0YwQ1G3vDwrRrHTfBgeiPLzMjj3tHUl7OQgeJbLdhVxVKfks4c6i
 6NnANPnHDwL7Gmqs5c9PXSX3m01rZF8jk0J5ZQPvz2CESfBuP5ZohqqTmUVI/wYqTZ+vMunHhoU
 77dMOqAPoIMtmrZNhJGR3yguHxwAY6q0Bk5bu
X-Google-Smtp-Source: AGHT+IG4h4rCJz3YrK+c1dyySm6gG6KjedbSrmSw34qV38ZxzHkFMGd5pUpoSZRTwTUllv79NyN1m9d/9j/aasXXT8A=
X-Received: by 2002:a05:6a20:6ab0:b0:1c8:95c9:307c with SMTP id
 adf61e73a8af0-1c895c93ce7mr906909637.28.1723160865219; Thu, 08 Aug 2024
 16:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-2-jitendra.vegiraju@broadcom.com>
 <zlbtbzch6reo656d72it5h2s7p5bnwhexire36v3w63mazidta@cqyiza4k562t>
In-Reply-To: <zlbtbzch6reo656d72it5h2s7p5bnwhexire36v3w63mazidta@cqyiza4k562t>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Thu, 8 Aug 2024 16:47:33 -0700
Message-ID: <CAMdnO-KM0T79wWtgOm3pbFsrW9siV7cnjNt195nd3Er0-J=kVQ@mail.gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: andrew@lunn.ch, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] net: stmmac: Add basic
 dwxgmac4 support to stmmac core
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
Content-Type: multipart/mixed; boundary="===============4507091034292280303=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4507091034292280303==
Content-Type: multipart/alternative; boundary="00000000000043fd20061f34a7d6"

--00000000000043fd20061f34a7d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 2:56=E2=80=AFPM Serge Semin <fancer.lancer@gmail.com=
> wrote:
>
> On Thu, Aug 01, 2024 at 08:18:20PM -0700, jitendra.vegiraju@broadcom.com
wrote:
> > From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> >
> > Adds support for DWC_xgmac version 4.00a in stmmac core module.
> > This version adds enhancements to DMA architecture for virtualization
> > scalability. This is realized by decoupling physical DMA channels (PDMA=
)
> > from Virtual DMA channels (VDMA). The  VDMAs are software abastractions
> > that map to PDMAs for frame transmission and reception.
> >
> > The virtualization enhancements are currently not being used and hence
> > a fixed mapping of VDMA to PDMA is configured in the init functions.
> > Because of the new init functions, a new instance of struct
stmmac_dma_ops
> > dwxgmac400_dma_ops is added.
> > Most of the other dma operation functions in existing dwxgamc2_dma.c
file
> > can be reused.
>
> As we figured out (didn't we?) that it's actually the DW 25GMAC, then
> it should be taken into account across the entire series.
>
Yes, indeed.
Its confirmed by the design team that we received an early adopter version
of 25GMAC IP.
It is also confirmed that 25GMAC always comes with HDMA .
The revision id is 4.xx and device id is 0x55.
With that in mind, we will change naming to 25GMAC throughout the patch .
> >
> > Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
> >  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  31 ++++
> >  .../net/ethernet/stmicro/stmmac/dwxgmac4.c    | 142 ++++++++++++++++++
> >  .../net/ethernet/stmicro/stmmac/dwxgmac4.h    |  84 +++++++++++
> >  4 files changed, 258 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile
b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > index c2f0e91f6bf8..2f637612513d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > @@ -6,7 +6,7 @@ stmmac-objs:=3D stmmac_main.o stmmac_ethtool.o
stmmac_mdio.o ring_mode.o        \
> >             mmc_core.o stmmac_hwtstamp.o stmmac_ptp.o dwmac4_descs.o  \
> >             dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
> >             stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o
\
> > -           stmmac_xdp.o stmmac_est.o \
>
> > +           stmmac_xdp.o stmmac_est.o dwxgmac4.o \
>
> dw25gmac.o?
>
> >             $(stmmac-y)
> >
> >  stmmac-$(CONFIG_STMMAC_SELFTESTS) +=3D stmmac_selftests.o
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> > index dd2ab6185c40..c15f5247aaa8 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/iopoll.h>
> >  #include "stmmac.h"
> >  #include "dwxgmac2.h"
>
> > +#include "dwxgmac4.h"
>
> "dw25gmac.h"?
>
> >
> >  static int dwxgmac2_dma_reset(void __iomem *ioaddr)
> >  {
> > @@ -641,3 +642,33 @@ const struct stmmac_dma_ops dwxgmac210_dma_ops =3D=
 {
> >       .enable_sph =3D dwxgmac2_enable_sph,
> >       .enable_tbs =3D dwxgmac2_enable_tbs,
> >  };
> > +
>
> > +const struct stmmac_dma_ops dwxgmac400_dma_ops =3D {
>
> dw25gmac_dma_ops?
>
> > +     .reset =3D dwxgmac2_dma_reset,
>
> > +     .init =3D dwxgmac4_dma_init,
> > +     .init_chan =3D dwxgmac2_dma_init_chan,
> > +     .init_rx_chan =3D dwxgmac4_dma_init_rx_chan,
> > +     .init_tx_chan =3D dwxgmac4_dma_init_tx_chan,
>
> dw25gmac_dma_init, dw25gmac_dma_init_rx_chan, dw25gmac_dma_init_tx_chan?
>
> > +     .axi =3D dwxgmac2_dma_axi,
> > +     .dump_regs =3D dwxgmac2_dma_dump_regs,
> > +     .dma_rx_mode =3D dwxgmac2_dma_rx_mode,
> > +     .dma_tx_mode =3D dwxgmac2_dma_tx_mode,
> > +     .enable_dma_irq =3D dwxgmac2_enable_dma_irq,
> > +     .disable_dma_irq =3D dwxgmac2_disable_dma_irq,
> > +     .start_tx =3D dwxgmac2_dma_start_tx,
> > +     .stop_tx =3D dwxgmac2_dma_stop_tx,
> > +     .start_rx =3D dwxgmac2_dma_start_rx,
> > +     .stop_rx =3D dwxgmac2_dma_stop_rx,
> > +     .dma_interrupt =3D dwxgmac2_dma_interrupt,
> > +     .get_hw_feature =3D dwxgmac2_get_hw_feature,
> > +     .rx_watchdog =3D dwxgmac2_rx_watchdog,
> > +     .set_rx_ring_len =3D dwxgmac2_set_rx_ring_len,
> > +     .set_tx_ring_len =3D dwxgmac2_set_tx_ring_len,
> > +     .set_rx_tail_ptr =3D dwxgmac2_set_rx_tail_ptr,
> > +     .set_tx_tail_ptr =3D dwxgmac2_set_tx_tail_ptr,
> > +     .enable_tso =3D dwxgmac2_enable_tso,
> > +     .qmode =3D dwxgmac2_qmode,
> > +     .set_bfsize =3D dwxgmac2_set_bfsize,
> > +     .enable_sph =3D dwxgmac2_enable_sph,
> > +     .enable_tbs =3D dwxgmac2_enable_tbs,
> > +};
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c
b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c
> > new file mode 100644
> > index 000000000000..9c8748122dc6
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c
>
> dw25gmac.c?
>
> > @@ -0,0 +1,142 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2024 Broadcom Corporation
> > + */
> > +#include "dwxgmac2.h"
>
> > +#include "dwxgmac4.h"
>
> dw25gmac.h?
>
> > +
> > +static int rd_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel)
> > +{
> > +     u32 reg_val =3D 0;
> > +     u32 val =3D 0;
> > +
> > +     reg_val |=3D mode << XGMAC4_MSEL_SHIFT & XGMAC4_MODE_SELECT;
> > +     reg_val |=3D channel << XGMAC4_AOFF_SHIFT & XGMAC4_ADDR_OFFSET;
> > +     reg_val |=3D XGMAC4_CMD_TYPE | XGMAC4_OB;
> > +     writel(reg_val, ioaddr + XGMAC4_DMA_CH_IND_CONTROL);
> > +     val =3D readl(ioaddr + XGMAC4_DMA_CH_IND_DATA);
> > +     return val;
> > +}
> > +
> > +static void wr_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel,
u32 val)
> > +{
> > +     u32 reg_val =3D 0;
> > +
> > +     writel(val, ioaddr + XGMAC4_DMA_CH_IND_DATA);
> > +     reg_val |=3D mode << XGMAC4_MSEL_SHIFT & XGMAC4_MODE_SELECT;
> > +     reg_val |=3D channel << XGMAC4_AOFF_SHIFT & XGMAC4_ADDR_OFFSET;
> > +     reg_val |=3D XGMAC_OB;
> > +     writel(reg_val, ioaddr + XGMAC4_DMA_CH_IND_CONTROL);
> > +}
> > +
>
> > +static void xgmac4_tp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32
tc_num)
> > +{
> > +     u32 val =3D 0;
> > +
> > +     val =3D rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, pdma_ch);
> > +     val &=3D ~XGMAC4_TP2TCMP;
> > +     val |=3D tc_num << XGMAC4_TP2TCMP_SHIFT & XGMAC4_TP2TCMP;
> > +     wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, pdma_ch, val);
> > +}
> > +
> > +static void xgmac4_rp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32
tc_num)
> > +{
> > +     u32 val =3D 0;
> > +
> > +     val =3D rd_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch);
> > +     val &=3D ~XGMAC4_RP2TCMP;
> > +     val |=3D tc_num << XGMAC4_RP2TCMP_SHIFT & XGMAC4_RP2TCMP;
> > +     wr_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch, val);
> > +}
>
> What does "tc" stand for? Traffic control? If it's a kind of queue
> then what about implementing the stmmac_ops::map_mtl_to_dma interface
> method?
"TC" stands for traffic class. Its is mechanism to classify and schedule
traffic
to DMA channels between VDMAs and PDMAs.
 An example VDMA to PDMA mapping shown below
TX and RX.
         VDMAs            Traffic Class      PDMA
         +--------+          +------+         +-----------+
         |VDMA0   |--------->| TC0  |-------->|PDMA0/TXQ0 |
  TX     +--------+   |----->+------+         +-----------+
 Host =3D> +--------+   |      +------+         +-----------+  =3D> to MAC
  SW     |VDMA1   |---+      | TC1  |    +--->|PDMA1/TXQ1 |
         +--------+          +------+    |    +-----------+
         +--------+          +------+----+    +-----------+
         |VDMA2   |--------->| TC2  |-------->|PDMA2/TXQ1 |
         +--------+          +------+         +-----------+
         +--------+          +------+         +-----------+
         |VDMAn-1 |--------->| TCx-1|-------->|PDMAm/TXQm |
         +--------+          +------+         +-----------+

        PDMAs            Traffic Class      VDMAs
         +------+          +------+         +------+
         |PDMA0 |--------->| TC0  |-------->|VDMA0 |
         +------+   |----->+------+         +------+
 MAC =3D>  +------+   |      +------+         +------+
  RXQs   |PDMA1 |---+      | TC1  |    +--->|VDMA1 |  =3D> Host
         +------+          +------+    |    +------+   Software
         +------+          +------+----+    +------+
         |PDMA2 |--------->| TC2  |-------->|VDMA2 |
         +------+          +------+         +------+
         +-------+         +------+        +--------+
         |PDMAn-1|-------->| TCx-1|------->|VDMAm-1 |
         +-------+         +------+        +--------+

> > +
> > +void dwxgmac4_dma_init(void __iomem *ioaddr,
> > +                    struct stmmac_dma_cfg *dma_cfg, int atds)
> > +{
> > +     u32 value;
> > +     u32 i;
> > +
> > +     value =3D readl(ioaddr + XGMAC_DMA_SYSBUS_MODE);
> > +
> > +     if (dma_cfg->aal)
> > +             value |=3D XGMAC_AAL;
> > +
> > +     if (dma_cfg->eame)
> > +             value |=3D XGMAC_EAME;
> > +
> > +     writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
> > +
> > +     for (i =3D 0; i < VDMA_TOTAL_CH_COUNT; i++) {
>
> > +             value =3D rd_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i);
> > +             value &=3D ~XGMAC4_TXDCSZ;
> > +             value |=3D 0x3;
> > +             value &=3D ~XGMAC4_TDPS;
> > +             value |=3D (3 << XGMAC4_TDPS_SHIFT) & XGMAC4_TDPS;
> > +             wr_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i, value);
> > +
> > +             value =3D rd_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i);
> > +             value &=3D ~XGMAC4_RXDCSZ;
> > +             value |=3D 0x3;
> > +             value &=3D ~XGMAC4_RDPS;
> > +             value |=3D (3 << XGMAC4_RDPS_SHIFT) & XGMAC4_RDPS;
> > +             wr_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i, value);
>
> I know that the TDPS/RDPS means Tx/Rx Descriptor Pre-fetch threshold
> Size. What does the TXDCSZ/RXDCSZ config mean?
>
> Most importantly why are these parameters hardcoded to 3? It
> doesn't seem right.
TXDCSZ/RXDCSZ specify the per channel DMA descriptor cache size
I missed defining macro for the valid values, for example 3 indicates 256
bytes.
Will fix it in next patch update.
>
> > +     }
> > +
>
> > +     for (i =3D 0; i < PDMA_TX_CH_COUNT; i++) {
> > +             value =3D rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i);
> > +             value &=3D ~(XGMAC4_TXPBL | XGMAC4_TPBLX8_MODE);
> > +             if (dma_cfg->pblx8)
> > +                     value |=3D XGMAC4_TPBLX8_MODE;
> > +             value |=3D (dma_cfg->pbl << XGMAC4_TXPBL_SHIFT) &
XGMAC4_TXPBL;
> > +             wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i, value);
> > +             xgmac4_tp2tc_map(ioaddr, i, i);
> > +     }
> > +
> > +     for (i =3D 0; i < PDMA_RX_CH_COUNT; i++) {
> > +             value =3D rd_dma_ch_ind(ioaddr, MODE_RXEXTCFG, i);
> > +             value &=3D ~(XGMAC4_RXPBL | XGMAC4_RPBLX8_MODE);
> > +             if (dma_cfg->pblx8)
> > +                     value |=3D XGMAC4_RPBLX8_MODE;
> > +             value |=3D (dma_cfg->pbl << XGMAC4_RXPBL_SHIFT) &
XGMAC4_RXPBL;
> > +             wr_dma_ch_ind(ioaddr, MODE_RXEXTCFG, i, value);
> > +             if (i < PDMA_MAX_TC_COUNT)
> > +                     xgmac4_rp2tc_map(ioaddr, i, i);
> > +             else
> > +                     xgmac4_rp2tc_map(ioaddr, i, PDMA_MAX_TC_COUNT -
1);
> > +     }
>
> Shouldn't these initialization be done on the per-channel basis only
> for only activated queues
> plat_stmmacenet_data::{rx_queues_to_use,tx_queues_to_use} (the STMMAC
> driver one-on-one maps queues and DMA-channels if no custom mapping
> was specified)?
>
This is a mapping between VDMA and PDMA channels. We are starting with a
default any to any mapping.

> > +}
> > +
> > +void dwxgmac4_dma_init_tx_chan(struct stmmac_priv *priv,
> > +                            void __iomem *ioaddr,
> > +                            struct stmmac_dma_cfg *dma_cfg,
> > +                            dma_addr_t dma_addr, u32 chan)
> > +{
> > +     u32 value;
> > +
> > +     value =3D readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> > +     value &=3D ~XGMAC4_TVDMA2TCMP;
> > +     value |=3D (chan << XGMAC4_TVDMA2TCMP_SHIFT) & XGMAC4_TVDMA2TCMP;
> > +     writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> > +
> > +     writel(upper_32_bits(dma_addr),
> > +            ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
> > +     writel(lower_32_bits(dma_addr),
> > +            ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
> > +}
> > +
> > +void dwxgmac4_dma_init_rx_chan(struct stmmac_priv *priv,
> > +                            void __iomem *ioaddr,
> > +                            struct stmmac_dma_cfg *dma_cfg,
> > +                            dma_addr_t dma_addr, u32 chan)
> > +{
> > +     u32 value;
> > +
> > +     value =3D readl(ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
> > +     value &=3D ~XGMAC4_RVDMA2TCMP;
> > +     value |=3D (chan << XGMAC4_RVDMA2TCMP_SHIFT) & XGMAC4_RVDMA2TCMP;
> > +     writel(value, ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
> > +
> > +     writel(upper_32_bits(dma_addr),
> > +            ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
> > +     writel(lower_32_bits(dma_addr),
> > +            ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
> > +}
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h
b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h
> > new file mode 100644
> > index 000000000000..0ce1856b0b34
> > --- /dev/null
>
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h
>
> dw25gmac.h?
>
> > @@ -0,0 +1,84 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/* Copyright (c) 2024 Broadcom Corporation
> > + * XGMAC4 definitions.
> > + */
> > +#ifndef __STMMAC_DWXGMAC4_H__
> > +#define __STMMAC_DWXGMAC4_H__
> > +
> > +/* DMA Indirect Registers*/
>
> > +#define XGMAC4_DMA_CH_IND_CONTROL    0X00003080
>
> XXVGMAC_*?
>
> > +#define XGMAC4_MODE_SELECT           GENMASK(27, 24)
> > +#define XGMAC4_MSEL_SHIFT            24
> > +enum dma_ch_ind_modes {
> > +     MODE_TXEXTCFG    =3D 0x0,   /* Tx Extended Config */
> > +     MODE_RXEXTCFG    =3D 0x1,   /* Rx Extended Config */
> > +     MODE_TXDBGSTS    =3D 0x2,   /* Tx Debug Status */
> > +     MODE_RXDBGSTS    =3D 0x3,   /* Rx Debug Status */
> > +     MODE_TXDESCCTRL  =3D 0x4,   /* Tx Descriptor control */
> > +     MODE_RXDESCCTRL  =3D 0x5,   /* Rx Descriptor control */
> > +};
> > +
> > +#define XGMAC4_ADDR_OFFSET           GENMASK(14, 8)
> > +#define XGMAC4_AOFF_SHIFT            8
> > +#define XGMAC4_AUTO_INCR             GENMASK(5, 4)
> > +#define XGMAC4_AUTO_SHIFT            4
> > +#define XGMAC4_CMD_TYPE                      BIT(1)
> > +#define XGMAC4_OB                    BIT(0)
> > +#define XGMAC4_DMA_CH_IND_DATA               0X00003084
> > +
> > +/* TX Config definitions */
> > +#define XGMAC4_TXPBL                 GENMASK(29, 24)
> > +#define XGMAC4_TXPBL_SHIFT           24
> > +#define XGMAC4_TPBLX8_MODE           BIT(19)
> > +#define XGMAC4_TP2TCMP                       GENMASK(18, 16)
> > +#define XGMAC4_TP2TCMP_SHIFT         16
> > +#define XGMAC4_ORRQ                  GENMASK(13, 8)
> > +/* RX Config definitions */
> > +#define XGMAC4_RXPBL                 GENMASK(29, 24)
> > +#define XGMAC4_RXPBL_SHIFT           24
> > +#define XGMAC4_RPBLX8_MODE           BIT(19)
> > +#define XGMAC4_RP2TCMP                       GENMASK(18, 16)
> > +#define XGMAC4_RP2TCMP_SHIFT         16
> > +#define XGMAC4_OWRQ                  GENMASK(13, 8)
> > +/* Tx Descriptor control */
> > +#define XGMAC4_TXDCSZ                        GENMASK(2, 0)
> > +#define XGMAC4_TDPS                  GENMASK(5, 3)
> > +#define XGMAC4_TDPS_SHIFT            3
> > +/* Rx Descriptor control */
> > +#define XGMAC4_RXDCSZ                        GENMASK(2, 0)
> > +#define XGMAC4_RDPS                  GENMASK(5, 3)
> > +#define XGMAC4_RDPS_SHIFT            3
> > +
> > +/* DWCXG_DMA_CH(#i) Registers*/
> > +#define XGMAC4_DSL                   GENMASK(20, 18)
> > +#define XGMAC4_MSS                   GENMASK(13, 0)
> > +#define XGMAC4_TFSEL                 GENMASK(30, 29)
> > +#define XGMAC4_TQOS                  GENMASK(27, 24)
> > +#define XGMAC4_IPBL                  BIT(15)
> > +#define XGMAC4_TVDMA2TCMP            GENMASK(6, 4)
> > +#define XGMAC4_TVDMA2TCMP_SHIFT              4
> > +#define XGMAC4_RPF                   BIT(31)
> > +#define XGMAC4_RVDMA2TCMP            GENMASK(30, 28)
> > +#define XGMAC4_RVDMA2TCMP_SHIFT              28
> > +#define XGMAC4_RQOS                  GENMASK(27, 24)
> > +
>
> > +/* PDMA Channel count */
> > +#define PDMA_TX_CH_COUNT             8
> > +#define PDMA_RX_CH_COUNT             10
> > +#define PDMA_MAX_TC_COUNT            8
> > +
> > +/* VDMA channel count */
> > +#define VDMA_TOTAL_CH_COUNT          32
>
> These seems like the vendor-specific constant. What are the actual DW
> 25GMAC constraints?
>
These are the constraints in this device. We can read from the hardware, we
will fix it in the next patch.

> -Serge(y)
>
> > +
> > +void dwxgmac4_dma_init(void __iomem *ioaddr,
> > +                    struct stmmac_dma_cfg *dma_cfg, int atds);
> > +
> > +void dwxgmac4_dma_init_tx_chan(struct stmmac_priv *priv,
> > +                            void __iomem *ioaddr,
> > +                            struct stmmac_dma_cfg *dma_cfg,
> > +                            dma_addr_t dma_addr, u32 chan);
> > +void dwxgmac4_dma_init_rx_chan(struct stmmac_priv *priv,
> > +                            void __iomem *ioaddr,
> > +                            struct stmmac_dma_cfg *dma_cfg,
> > +                            dma_addr_t dma_addr, u32 chan);
> > +#endif /* __STMMAC_DWXGMAC4_H__ */
> > --
> > 2.34.1
> >
> >

--00000000000043fd20061f34a7d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Aug 6, 2024 at 2:56=E2=80=AFPM Serge Semin &lt;<a =
href=3D"mailto:fancer.lancer@gmail.com">fancer.lancer@gmail.com</a>&gt; wro=
te:<br>&gt;<br>&gt; On Thu, Aug 01, 2024 at 08:18:20PM -0700, <a href=3D"ma=
ilto:jitendra.vegiraju@broadcom.com">jitendra.vegiraju@broadcom.com</a> wro=
te:<br>&gt; &gt; From: Jitendra Vegiraju &lt;<a href=3D"mailto:jitendra.veg=
iraju@broadcom.com">jitendra.vegiraju@broadcom.com</a>&gt;<br>&gt; &gt;<br>=
&gt; &gt; Adds support for DWC_xgmac version 4.00a in stmmac core module.<b=
r>&gt; &gt; This version adds enhancements to DMA architecture for virtuali=
zation<br>&gt; &gt; scalability. This is realized by decoupling physical DM=
A channels (PDMA)<br>&gt; &gt; from Virtual DMA channels (VDMA). The =C2=A0=
VDMAs are software abastractions<br>&gt; &gt; that map to PDMAs for frame t=
ransmission and reception.<br>&gt; &gt;<br>&gt; &gt; The virtualization enh=
ancements are currently not being used and hence<br>&gt; &gt; a fixed mappi=
ng of VDMA to PDMA is configured in the init functions.<br>&gt; &gt; Becaus=
e of the new init functions, a new instance of struct stmmac_dma_ops<br>&gt=
; &gt; dwxgmac400_dma_ops is added.<br>&gt; &gt; Most of the other dma oper=
ation functions in existing dwxgamc2_dma.c file<br>&gt; &gt; can be reused.=
<br>&gt;<br>&gt; As we figured out (didn&#39;t we?) that it&#39;s actually =
the DW 25GMAC, then<br>&gt; it should be taken into account across the enti=
re series.<br>&gt;<br>Yes, indeed.<br>Its confirmed by the design team that=
 we received an early adopter version of 25GMAC IP.<br>It is also confirmed=
 that 25GMAC always comes with HDMA .<br>The revision id is 4.xx and device=
 id is 0x55.<br>With that in mind, we will change naming to 25GMAC througho=
ut the patch .<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Jitendra Vegiraju &=
lt;<a href=3D"mailto:jitendra.vegiraju@broadcom.com">jitendra.vegiraju@broa=
dcom.com</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0drivers/net/ethernet/s=
tmicro/stmmac/Makefile =C2=A0| =C2=A0 2 +-<br>&gt; &gt; =C2=A0.../ethernet/=
stmicro/stmmac/dwxgmac2_dma.c =C2=A0 =C2=A0| =C2=A031 ++++<br>&gt; &gt; =C2=
=A0.../net/ethernet/stmicro/stmmac/dwxgmac4.c =C2=A0 =C2=A0| 142 ++++++++++=
++++++++<br>&gt; &gt; =C2=A0.../net/ethernet/stmicro/stmmac/dwxgmac4.h =C2=
=A0 =C2=A0| =C2=A084 +++++++++++<br>&gt; &gt; =C2=A04 files changed, 258 in=
sertions(+), 1 deletion(-)<br>&gt; &gt; =C2=A0create mode 100644 drivers/ne=
t/ethernet/stmicro/stmmac/dwxgmac4.c<br>&gt; &gt; =C2=A0create mode 100644 =
drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h<br>&gt; &gt;<br>&gt; &gt; di=
ff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ether=
net/stmicro/stmmac/Makefile<br>&gt; &gt; index c2f0e91f6bf8..2f637612513d 1=
00644<br>&gt; &gt; --- a/drivers/net/ethernet/stmicro/stmmac/Makefile<br>&g=
t; &gt; +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile<br>&gt; &gt; @@ =
-6,7 +6,7 @@ stmmac-objs:=3D stmmac_main.o stmmac_ethtool.o stmmac_mdio.o r=
ing_mode.o =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 mmc_core.o stmmac_hwtstamp.o stmmac_ptp.o dwmac4_descs=
.o =C2=A0\<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dwmac4_dm=
a.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \<br>&gt; &gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwx=
gmac2_descs.o \<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stmmac_xd=
p.o stmmac_est.o \<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 stmmac_xdp.o stmmac_est.o dwxgmac4.o \<br>&gt;<br>&gt; dw25gmac.o?<br>&=
gt;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(stmmac-y)<br>&=
gt; &gt;<br>&gt; &gt; =C2=A0stmmac-$(CONFIG_STMMAC_SELFTESTS) +=3D stmmac_s=
elftests.o<br>&gt; &gt; diff --git a/drivers/net/ethernet/stmicro/stmmac/dw=
xgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c<br>&gt; &=
gt; index dd2ab6185c40..c15f5247aaa8 100644<br>&gt; &gt; --- a/drivers/net/=
ethernet/stmicro/stmmac/dwxgmac2_dma.c<br>&gt; &gt; +++ b/drivers/net/ether=
net/stmicro/stmmac/dwxgmac2_dma.c<br>&gt; &gt; @@ -7,6 +7,7 @@<br>&gt; &gt;=
 =C2=A0#include &lt;linux/iopoll.h&gt;<br>&gt; &gt; =C2=A0#include &quot;st=
mmac.h&quot;<br>&gt; &gt; =C2=A0#include &quot;dwxgmac2.h&quot;<br>&gt;<br>=
&gt; &gt; +#include &quot;dwxgmac4.h&quot;<br>&gt;<br>&gt; &quot;dw25gmac.h=
&quot;?<br>&gt;<br>&gt; &gt;<br>&gt; &gt; =C2=A0static int dwxgmac2_dma_res=
et(void __iomem *ioaddr)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; @@ -641,3 +642,3=
3 @@ const struct stmmac_dma_ops dwxgmac210_dma_ops =3D {<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 .enable_sph =3D dwxgmac2_enable_sph,<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0 .enable_tbs =3D dwxgmac2_enable_tbs,<br>&gt; &gt; =C2=A0};<br=
>&gt; &gt; +<br>&gt;<br>&gt; &gt; +const struct stmmac_dma_ops dwxgmac400_d=
ma_ops =3D {<br>&gt;<br>&gt; dw25gmac_dma_ops?<br>&gt;<br>&gt; &gt; + =C2=
=A0 =C2=A0 .reset =3D dwxgmac2_dma_reset,<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=
=A0 .init =3D dwxgmac4_dma_init,<br>&gt; &gt; + =C2=A0 =C2=A0 .init_chan =
=3D dwxgmac2_dma_init_chan,<br>&gt; &gt; + =C2=A0 =C2=A0 .init_rx_chan =3D =
dwxgmac4_dma_init_rx_chan,<br>&gt; &gt; + =C2=A0 =C2=A0 .init_tx_chan =3D d=
wxgmac4_dma_init_tx_chan,<br>&gt;<br>&gt; dw25gmac_dma_init, dw25gmac_dma_i=
nit_rx_chan, dw25gmac_dma_init_tx_chan?<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=
=A0 .axi =3D dwxgmac2_dma_axi,<br>&gt; &gt; + =C2=A0 =C2=A0 .dump_regs =3D =
dwxgmac2_dma_dump_regs,<br>&gt; &gt; + =C2=A0 =C2=A0 .dma_rx_mode =3D dwxgm=
ac2_dma_rx_mode,<br>&gt; &gt; + =C2=A0 =C2=A0 .dma_tx_mode =3D dwxgmac2_dma=
_tx_mode,<br>&gt; &gt; + =C2=A0 =C2=A0 .enable_dma_irq =3D dwxgmac2_enable_=
dma_irq,<br>&gt; &gt; + =C2=A0 =C2=A0 .disable_dma_irq =3D dwxgmac2_disable=
_dma_irq,<br>&gt; &gt; + =C2=A0 =C2=A0 .start_tx =3D dwxgmac2_dma_start_tx,=
<br>&gt; &gt; + =C2=A0 =C2=A0 .stop_tx =3D dwxgmac2_dma_stop_tx,<br>&gt; &g=
t; + =C2=A0 =C2=A0 .start_rx =3D dwxgmac2_dma_start_rx,<br>&gt; &gt; + =C2=
=A0 =C2=A0 .stop_rx =3D dwxgmac2_dma_stop_rx,<br>&gt; &gt; + =C2=A0 =C2=A0 =
.dma_interrupt =3D dwxgmac2_dma_interrupt,<br>&gt; &gt; + =C2=A0 =C2=A0 .ge=
t_hw_feature =3D dwxgmac2_get_hw_feature,<br>&gt; &gt; + =C2=A0 =C2=A0 .rx_=
watchdog =3D dwxgmac2_rx_watchdog,<br>&gt; &gt; + =C2=A0 =C2=A0 .set_rx_rin=
g_len =3D dwxgmac2_set_rx_ring_len,<br>&gt; &gt; + =C2=A0 =C2=A0 .set_tx_ri=
ng_len =3D dwxgmac2_set_tx_ring_len,<br>&gt; &gt; + =C2=A0 =C2=A0 .set_rx_t=
ail_ptr =3D dwxgmac2_set_rx_tail_ptr,<br>&gt; &gt; + =C2=A0 =C2=A0 .set_tx_=
tail_ptr =3D dwxgmac2_set_tx_tail_ptr,<br>&gt; &gt; + =C2=A0 =C2=A0 .enable=
_tso =3D dwxgmac2_enable_tso,<br>&gt; &gt; + =C2=A0 =C2=A0 .qmode =3D dwxgm=
ac2_qmode,<br>&gt; &gt; + =C2=A0 =C2=A0 .set_bfsize =3D dwxgmac2_set_bfsize=
,<br>&gt; &gt; + =C2=A0 =C2=A0 .enable_sph =3D dwxgmac2_enable_sph,<br>&gt;=
 &gt; + =C2=A0 =C2=A0 .enable_tbs =3D dwxgmac2_enable_tbs,<br>&gt; &gt; +};=
<br>&gt;<br>&gt; &gt; diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxg=
mac4.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c<br>&gt; &gt; new fi=
le mode 100644<br>&gt; &gt; index 000000000000..9c8748122dc6<br>&gt; &gt; -=
-- /dev/null<br>&gt; &gt; +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac=
4.c<br>&gt;<br>&gt; dw25gmac.c?<br>&gt;<br>&gt; &gt; @@ -0,0 +1,142 @@<br>&=
gt; &gt; +// SPDX-License-Identifier: GPL-2.0-only<br>&gt; &gt; +/*<br>&gt;=
 &gt; + * Copyright (c) 2024 Broadcom Corporation<br>&gt; &gt; + */<br>&gt;=
 &gt; +#include &quot;dwxgmac2.h&quot;<br>&gt;<br>&gt; &gt; +#include &quot=
;dwxgmac4.h&quot;<br>&gt;<br>&gt; dw25gmac.h?<br>&gt;<br>&gt; &gt; +<br>&gt=
; &gt; +static int rd_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel=
)<br>&gt; &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 u32 reg_val =3D 0;<br>&gt; &=
gt; + =C2=A0 =C2=A0 u32 val =3D 0;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=
=A0 reg_val |=3D mode &lt;&lt; XGMAC4_MSEL_SHIFT &amp; XGMAC4_MODE_SELECT;<=
br>&gt; &gt; + =C2=A0 =C2=A0 reg_val |=3D channel &lt;&lt; XGMAC4_AOFF_SHIF=
T &amp; XGMAC4_ADDR_OFFSET;<br>&gt; &gt; + =C2=A0 =C2=A0 reg_val |=3D XGMAC=
4_CMD_TYPE | XGMAC4_OB;<br>&gt; &gt; + =C2=A0 =C2=A0 writel(reg_val, ioaddr=
 + XGMAC4_DMA_CH_IND_CONTROL);<br>&gt; &gt; + =C2=A0 =C2=A0 val =3D readl(i=
oaddr + XGMAC4_DMA_CH_IND_DATA);<br>&gt; &gt; + =C2=A0 =C2=A0 return val;<b=
r>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static void wr_dma_ch_ind(void =
__iomem *ioaddr, u8 mode, u32 channel, u32 val)<br>&gt; &gt; +{<br>&gt; &gt=
; + =C2=A0 =C2=A0 u32 reg_val =3D 0;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =
=C2=A0 writel(val, ioaddr + XGMAC4_DMA_CH_IND_DATA);<br>&gt; &gt; + =C2=A0 =
=C2=A0 reg_val |=3D mode &lt;&lt; XGMAC4_MSEL_SHIFT &amp; XGMAC4_MODE_SELEC=
T;<br>&gt; &gt; + =C2=A0 =C2=A0 reg_val |=3D channel &lt;&lt; XGMAC4_AOFF_S=
HIFT &amp; XGMAC4_ADDR_OFFSET;<br>&gt; &gt; + =C2=A0 =C2=A0 reg_val |=3D XG=
MAC_OB;<br>&gt; &gt; + =C2=A0 =C2=A0 writel(reg_val, ioaddr + XGMAC4_DMA_CH=
_IND_CONTROL);<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt;<br>&gt; &gt; +static =
void xgmac4_tp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32 tc_num)<br>&gt;=
 &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 u32 val =3D 0;<br>&gt; &gt; +<br>&gt;=
 &gt; + =C2=A0 =C2=A0 val =3D rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, pdma_ch)=
;<br>&gt; &gt; + =C2=A0 =C2=A0 val &amp;=3D ~XGMAC4_TP2TCMP;<br>&gt; &gt; +=
 =C2=A0 =C2=A0 val |=3D tc_num &lt;&lt; XGMAC4_TP2TCMP_SHIFT &amp; XGMAC4_T=
P2TCMP;<br>&gt; &gt; + =C2=A0 =C2=A0 wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, p=
dma_ch, val);<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static void xgma=
c4_rp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32 tc_num)<br>&gt; &gt; +{<=
br>&gt; &gt; + =C2=A0 =C2=A0 u32 val =3D 0;<br>&gt; &gt; +<br>&gt; &gt; + =
=C2=A0 =C2=A0 val =3D rd_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch);<br>&gt=
; &gt; + =C2=A0 =C2=A0 val &amp;=3D ~XGMAC4_RP2TCMP;<br>&gt; &gt; + =C2=A0 =
=C2=A0 val |=3D tc_num &lt;&lt; XGMAC4_RP2TCMP_SHIFT &amp; XGMAC4_RP2TCMP;<=
br>&gt; &gt; + =C2=A0 =C2=A0 wr_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch, =
val);<br>&gt; &gt; +}<br>&gt;<br>&gt; What does &quot;tc&quot; stand for? T=
raffic control? If it&#39;s a kind of queue<br>&gt; then what about impleme=
nting the stmmac_ops::map_mtl_to_dma interface<br>&gt; method?<br>&quot;TC&=
quot; stands for traffic class. Its is mechanism to classify and schedule t=
raffic<div>to DMA channels between VDMAs and PDMAs.<br><div>=C2=A0An exampl=
e VDMA to PDMA mapping shown below<br>TX and RX.<br><font face=3D"monospace=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VDMAs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Traffic Class =C2=A0 =C2=A0 =C2=A0PDMA<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0+--------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 +-----------+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|VD=
MA0 =C2=A0 |---------&gt;| TC0 =C2=A0|--------&gt;|PDMA0/TXQ0 |<br>=C2=A0 T=
X =C2=A0 =C2=A0 +--------+ =C2=A0 |-----&gt;+------+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 +-----------+<br>=C2=A0Host =3D&gt; +--------+ =C2=A0 | =C2=A0 =C2=
=A0 =C2=A0+------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 +-----------+ =C2=A0=3D&gt; =
to MAC<br>=C2=A0 SW =C2=A0 =C2=A0 |VDMA1 =C2=A0 |---+ =C2=A0 =C2=A0 =C2=A0|=
 TC1 =C2=A0| =C2=A0 =C2=A0+---&gt;|PDMA1/TXQ1 |<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+--------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =C2=
=A0| =C2=A0 =C2=A0+-----------+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+-----=
---+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+----+ =C2=A0 =C2=A0+--------=
---+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|VDMA2 =C2=A0 |---------&gt;| TC2=
 =C2=A0|--------&gt;|PDMA2/TXQ1 |<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+---=
-----+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 +-----------+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+--------+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 +----------=
-+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|VDMAn-1 |---------&gt;| TCx-1|----=
----&gt;|PDMAm/TXQm |<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+--------+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 +------=
-----+<br></font><br><div><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PDMAs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Traffic Class =C2=A0 =C2=
=A0 =C2=A0VDMAs<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 +------+<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|PDMA0 |---------&gt;| TC0 =C2=A0|--------&g=
t;|VDMA0 |<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 |-----&gt;+=
------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 +------+<br>=C2=A0MAC =3D&gt; =C2=A0+--=
----+ =C2=A0 | =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 +--=
----+<br>=C2=A0 RXQs =C2=A0 |PDMA1 |---+ =C2=A0 =C2=A0 =C2=A0| TC1 =C2=A0| =
=C2=A0 =C2=A0+---&gt;|VDMA1 | =C2=A0=3D&gt; Host<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0+------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =C2=
=A0| =C2=A0 =C2=A0+------+=C2=A0 =C2=A0Software<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+----+ =C2=A0 =
=C2=A0+------+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|PDMA2 |---------&gt;| =
TC2 =C2=A0|--------&gt;|VDMA2 |<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+-----=
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
------+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+-------+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 +------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0+--------+<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|PDMAn-1|--------&gt;| TCx-1|-------&gt;|VDMAm-1 |<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+-------+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 +-----=
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0+--------+<br><br></font>&gt; &gt; +<br>&gt; =
&gt; +void dwxgmac4_dma_init(void __iomem *ioaddr,<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stmmac=
_dma_cfg *dma_cfg, int atds)<br>&gt; &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 u=
32 value;<br>&gt; &gt; + =C2=A0 =C2=A0 u32 i;<br>&gt; &gt; +<br>&gt; &gt; +=
 =C2=A0 =C2=A0 value =3D readl(ioaddr + XGMAC_DMA_SYSBUS_MODE);<br>&gt; &gt=
; +<br>&gt; &gt; + =C2=A0 =C2=A0 if (dma_cfg-&gt;aal)<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value |=3D XGMAC_AAL;<br>&gt; &gt; +<br=
>&gt; &gt; + =C2=A0 =C2=A0 if (dma_cfg-&gt;eame)<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value |=3D XGMAC_EAME;<br>&gt; &gt; +<br>&g=
t; &gt; + =C2=A0 =C2=A0 writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);<br>&=
gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 for (i =3D 0; i &lt; VDMA_TOTAL_CH_=
COUNT; i++) {<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 value =3D rd_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i);<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D ~XGMAC4_TXDCSZ;<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value |=3D 0x3;<br>&gt;=
 &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D ~XGMAC4_TD=
PS;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value |=3D (3 =
&lt;&lt; XGMAC4_TDPS_SHIFT) &amp; XGMAC4_TDPS;<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wr_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i, valu=
e);<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 value =3D rd_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i);<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D ~XGMAC4_RXDCSZ;<br>&gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value |=3D 0x3;<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D ~XGMAC4_RDPS;=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value |=3D (3 &lt=
;&lt; XGMAC4_RDPS_SHIFT) &amp; XGMAC4_RDPS;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wr_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i, value=
);<br>&gt;<br>&gt; I know that the TDPS/RDPS means Tx/Rx Descriptor Pre-fet=
ch threshold<br>&gt; Size. What does the TXDCSZ/RXDCSZ config mean?<br>&gt;=
<br>&gt; Most importantly why are these parameters hardcoded to 3? It<br>&g=
t; doesn&#39;t seem right.</div><div>TXDCSZ/RXDCSZ=C2=A0specify the per cha=
nnel DMA descriptor cache size=C2=A0</div><div>I missed defining macro for =
the valid values, for example 3 indicates 256 bytes.</div><div>Will fix it =
in next patch update.<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 }<br>&gt; &gt; +=
<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 for (i =3D 0; i &lt; PDMA_TX_CH_COUNT=
; i++) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D=
 rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D ~(XGMAC4_TXPBL | XGMAC4_TPBLX8_MODE=
);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dma_cfg-&gt=
;pblx8)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 value |=3D XGMAC4_TPBLX8_MODE;<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value |=3D (dma_cfg-&gt;pbl &lt;&lt; XGMAC4=
_TXPBL_SHIFT) &amp; XGMAC4_TXPBL;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i, value);<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xgmac4_tp2tc_map(ioaddr, i,=
 i);<br>&gt; &gt; + =C2=A0 =C2=A0 }<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =
=C2=A0 for (i =3D 0; i &lt; PDMA_RX_CH_COUNT; i++) {<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D rd_dma_ch_ind(ioaddr, MODE_RXE=
XTCFG, i);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &=
amp;=3D ~(XGMAC4_RXPBL | XGMAC4_RPBLX8_MODE);<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dma_cfg-&gt;pblx8)<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value |=3D X=
GMAC4_RPBLX8_MODE;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 value |=3D (dma_cfg-&gt;pbl &lt;&lt; XGMAC4_RXPBL_SHIFT) &amp; XGMAC4_RXPB=
L;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wr_dma_ch_ind(i=
oaddr, MODE_RXEXTCFG, i, value);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if (i &lt; PDMA_MAX_TC_COUNT)<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xgmac4_rp2tc_map(io=
addr, i, i);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xgmac4_rp2tc_map(ioaddr, i, PDMA_MAX_TC_COUNT - 1);<br>&gt; &gt;=
 + =C2=A0 =C2=A0 }<br>&gt;<br>&gt; Shouldn&#39;t these initialization be do=
ne on the per-channel basis only<br>&gt; for only activated queues<br>&gt; =
plat_stmmacenet_data::{rx_queues_to_use,tx_queues_to_use} (the STMMAC<br>&g=
t; driver one-on-one maps queues and DMA-channels if no custom mapping<br>&=
gt; was specified)?<br>&gt;</div><div>This is a mapping between VDMA and PD=
MA=C2=A0channels. We are starting with a default any to any mapping.</div><=
div><br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +void dwxgmac4_dma_init_tx=
_chan(struct stmmac_priv *priv,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void _=
_iomem *ioaddr,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stmmac_dma_cf=
g *dma_cfg,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_addr, u32 c=
han)<br>&gt; &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 u32 value;<br>&gt; &gt; +=
<br>&gt; &gt; + =C2=A0 =C2=A0 value =3D readl(ioaddr + XGMAC_DMA_CH_TX_CONT=
ROL(chan));<br>&gt; &gt; + =C2=A0 =C2=A0 value &amp;=3D ~XGMAC4_TVDMA2TCMP;=
<br>&gt; &gt; + =C2=A0 =C2=A0 value |=3D (chan &lt;&lt; XGMAC4_TVDMA2TCMP_S=
HIFT) &amp; XGMAC4_TVDMA2TCMP;<br>&gt; &gt; + =C2=A0 =C2=A0 writel(value, i=
oaddr + XGMAC_DMA_CH_TX_CONTROL(chan));<br>&gt; &gt; +<br>&gt; &gt; + =C2=
=A0 =C2=A0 writel(upper_32_bits(dma_addr),<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));<br>&gt; =
&gt; + =C2=A0 =C2=A0 writel(lower_32_bits(dma_addr),<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan))=
;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +void dwxgmac4_dma_init_rx_ch=
an(struct stmmac_priv *priv,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __io=
mem *ioaddr,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stmmac_dma_cfg *=
dma_cfg,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_addr, u32 ch=
an)<br>&gt; &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 u32 value;<br>&gt; &gt; +<=
br>&gt; &gt; + =C2=A0 =C2=A0 value =3D readl(ioaddr + XGMAC_DMA_CH_RX_CONTR=
OL(chan));<br>&gt; &gt; + =C2=A0 =C2=A0 value &amp;=3D ~XGMAC4_RVDMA2TCMP;<=
br>&gt; &gt; + =C2=A0 =C2=A0 value |=3D (chan &lt;&lt; XGMAC4_RVDMA2TCMP_SH=
IFT) &amp; XGMAC4_RVDMA2TCMP;<br>&gt; &gt; + =C2=A0 =C2=A0 writel(value, io=
addr + XGMAC_DMA_CH_RX_CONTROL(chan));<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0=
 =C2=A0 writel(upper_32_bits(dma_addr),<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));<br>&gt; &gt=
; + =C2=A0 =C2=A0 writel(lower_32_bits(dma_addr),<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));<b=
r>&gt; &gt; +}<br>&gt; &gt; diff --git a/drivers/net/ethernet/stmicro/stmma=
c/dwxgmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h<br>&gt; &gt; =
new file mode 100644<br>&gt; &gt; index 000000000000..0ce1856b0b34<br>&gt; =
&gt; --- /dev/null<br>&gt;<br>&gt; &gt; +++ b/drivers/net/ethernet/stmicro/=
stmmac/dwxgmac4.h<br>&gt;<br>&gt; dw25gmac.h?<br>&gt;<br>&gt; &gt; @@ -0,0 =
+1,84 @@<br>&gt; &gt; +/* SPDX-License-Identifier: GPL-2.0-only */<br>&gt; =
&gt; +/* Copyright (c) 2024 Broadcom Corporation<br>&gt; &gt; + * XGMAC4 de=
finitions.<br>&gt; &gt; + */<br>&gt; &gt; +#ifndef __STMMAC_DWXGMAC4_H__<br=
>&gt; &gt; +#define __STMMAC_DWXGMAC4_H__<br>&gt; &gt; +<br>&gt; &gt; +/* D=
MA Indirect Registers*/<br>&gt;<br>&gt; &gt; +#define XGMAC4_DMA_CH_IND_CON=
TROL =C2=A0 =C2=A00X00003080<br>&gt;<br>&gt; XXVGMAC_*?<br>&gt;<br>&gt; &gt=
; +#define XGMAC4_MODE_SELECT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMASK(27=
, 24)<br>&gt; &gt; +#define XGMAC4_MSEL_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A024<br>&gt; &gt; +enum dma_ch_ind_modes {<br>&gt; &gt; + =C2=A0=
 =C2=A0 MODE_TXEXTCFG =C2=A0 =C2=A0=3D 0x0, =C2=A0 /* Tx Extended Config */=
<br>&gt; &gt; + =C2=A0 =C2=A0 MODE_RXEXTCFG =C2=A0 =C2=A0=3D 0x1, =C2=A0 /*=
 Rx Extended Config */<br>&gt; &gt; + =C2=A0 =C2=A0 MODE_TXDBGSTS =C2=A0 =
=C2=A0=3D 0x2, =C2=A0 /* Tx Debug Status */<br>&gt; &gt; + =C2=A0 =C2=A0 MO=
DE_RXDBGSTS =C2=A0 =C2=A0=3D 0x3, =C2=A0 /* Rx Debug Status */<br>&gt; &gt;=
 + =C2=A0 =C2=A0 MODE_TXDESCCTRL =C2=A0=3D 0x4, =C2=A0 /* Tx Descriptor con=
trol */<br>&gt; &gt; + =C2=A0 =C2=A0 MODE_RXDESCCTRL =C2=A0=3D 0x5, =C2=A0 =
/* Rx Descriptor control */<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +#=
define XGMAC4_ADDR_OFFSET =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMASK(14, 8)=
<br>&gt; &gt; +#define XGMAC4_AOFF_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A08<br>&gt; &gt; +#define XGMAC4_AUTO_INCR =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 GENMASK(5, 4)<br>&gt; &gt; +#define XGMAC4_AUTO_SHIFT =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>&gt; &gt; +#define XGMAC4_CMD_TYPE =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(1)<br>&gt; &gt; +#define XGMAC4_OB =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>&gt; &gt; +#define XGMAC4_D=
MA_CH_IND_DATA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0X00003084<=
br>&gt; &gt; +<br>&gt; &gt; +/* TX Config definitions */<br>&gt; &gt; +#def=
ine XGMAC4_TXPBL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GE=
NMASK(29, 24)<br>&gt; &gt; +#define XGMAC4_TXPBL_SHIFT =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 24<br>&gt; &gt; +#define XGMAC4_TPBLX8_MODE =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 BIT(19)<br>&gt; &gt; +#define XGMAC4_TP2TCMP =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(18, 16)<br>&gt; &gt; +#define XGMAC4_TP2TCMP_SHIFT =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 16<br>&gt; &gt; +#define XGMAC4_ORRQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(13, 8)<br>&gt; &gt; +/* RX Config de=
finitions */<br>&gt; &gt; +#define XGMAC4_RXPBL =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMASK(29, 24)<br>&gt; &gt; +#define XGMAC4_R=
XPBL_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 24<br>&gt; &gt; +#define XGMA=
C4_RPBLX8_MODE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(19)<br>&gt; &gt; +#de=
fine XGMAC4_RP2TCMP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 GENMASK(18, 16)<br>&gt; &gt; +#define XGMAC4_RP2TCMP_=
SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>&gt; &gt; +#define XGMAC4_OWRQ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(13, 8)<b=
r>&gt; &gt; +/* Tx Descriptor control */<br>&gt; &gt; +#define XGMAC4_TXDCS=
Z =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0GENMASK(2, 0)<br>&gt; &gt; +#define XGMAC4_TDPS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(5, 3)<br>&gt; &gt; +#d=
efine XGMAC4_TDPS_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03<br>&gt; =
&gt; +/* Rx Descriptor control */<br>&gt; &gt; +#define XGMAC4_RXDCSZ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GENMASK(2, 0)<br>&gt; &gt; +#define XGMAC4_RDPS =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(5, 3)<br>&gt; &gt; +#defin=
e XGMAC4_RDPS_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03<br>&gt; &gt;=
 +<br>&gt; &gt; +/* DWCXG_DMA_CH(#i) Registers*/<br>&gt; &gt; +#define XGMA=
C4_DSL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(20, 18)<br>&gt; &gt; +#define XGMAC4_MSS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMASK(13, 0)<br>&gt; &gt; +#define XGMAC4=
_TFSEL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMASK(30, =
29)<br>&gt; &gt; +#define XGMAC4_TQOS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(27, 24)<br>&gt; &gt; +#define XGMAC4_IPB=
L =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(15)<br>=
&gt; &gt; +#define XGMAC4_TVDMA2TCMP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0GENMASK(6, 4)<br>&gt; &gt; +#define XGMAC4_TVDMA2TCMP_SHIFT =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>&gt; &gt; +#define XGMAC4_RPF =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(31)<br>&=
gt; &gt; +#define XGMAC4_RVDMA2TCMP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0GENMASK(30, 28)<br>&gt; &gt; +#define XGMAC4_RVDMA2TCMP_SHIFT =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028<br>&gt; &gt; +#define XGMAC4_RQOS =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(27, 2=
4)<br>&gt; &gt; +<br>&gt;<br>&gt; &gt; +/* PDMA Channel count */<br>&gt; &g=
t; +#define PDMA_TX_CH_COUNT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br=
>&gt; &gt; +#define PDMA_RX_CH_COUNT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 10<br>&gt; &gt; +#define PDMA_MAX_TC_COUNT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A08<br>&gt; &gt; +<br>&gt; &gt; +/* VDMA channel count */<br>&gt=
; &gt; +#define VDMA_TOTAL_CH_COUNT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032<br=
>&gt;<br>&gt; These seems like the vendor-specific constant. What are the a=
ctual DW<br>&gt; 25GMAC constraints?<br>&gt;</div><div>These are the constr=
aints in this device. We can read from the hardware, we will fix it in the =
next patch.</div><div><br>&gt; -Serge(y)<br>&gt;<br>&gt; &gt; +<br>&gt; &gt=
; +void dwxgmac4_dma_init(void __iomem *ioaddr,<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stmmac_dm=
a_cfg *dma_cfg, int atds);<br>&gt; &gt; +<br>&gt; &gt; +void dwxgmac4_dma_i=
nit_tx_chan(struct stmmac_priv *priv,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0void __iomem *ioaddr,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stmmac=
_dma_cfg *dma_cfg,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_addr=
, u32 chan);<br>&gt; &gt; +void dwxgmac4_dma_init_rx_chan(struct stmmac_pri=
v *priv,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *ioaddr,<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stmmac_dma_cfg *dma_cfg,<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_addr, u32 chan);<br>&gt; &gt; +#=
endif /* __STMMAC_DWXGMAC4_H__ */<br>&gt; &gt; --<br>&gt; &gt; 2.34.1<br>&g=
t; &gt;<br>&gt; &gt;</div></div></div></div>

--00000000000043fd20061f34a7d6--

--===============4507091034292280303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4507091034292280303==--
