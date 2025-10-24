Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18161C06361
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 14:20:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9CA5C5F1DC;
	Fri, 24 Oct 2025 12:20:15 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5710C5F1D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 12:20:13 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=ratatoskr.pengutronix.de)
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1vCGmD-0000ek-3D; Fri, 24 Oct 2025 14:20:13 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <b486bb52-7e95-44d3-ac65-1c28d4d0e40e@kernel.org> (Dinh Nguyen's
 message of "Fri, 24 Oct 2025 07:00:36 -0500")
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-6-4c4a51159eeb@pengutronix.de>
 <b486bb52-7e95-44d3-ac65-1c28d4d0e40e@kernel.org>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Fri, 24 Oct 2025 14:20:09 +0200
Message-ID: <87zf9g7apy.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 06/10] arm64: dts: socfpga: agilex5:
 add dwxgmac compatible
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


Hi Dinh,

On 2025-10-24 at 07:00 -05, Dinh Nguyen <dinguyen@kernel.org> wrote:

> Hi Steffen,
> 
> On 10/24/25 06:49, Steffen Trumtrar wrote:
> > The gmac0/1/2 are also compatible to the more generic "snps,dwxgmac"
> > compatible. The platform code checks this to decide if it is a GMAC or
> > GMAC4 compatible IP core.
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> > diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> > b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> > index 4ccfebfd9d322..d0c139f03541e 100644
> > --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> > +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> > @@ -536,7 +536,8 @@ qspi: spi@108d2000 {
> >     		gmac0: ethernet@10810000 {
> >   			compatible = "altr,socfpga-stmmac-agilex5",
> > -				     "snps,dwxgmac-2.10";
> > +				     "snps,dwxgmac-2.10",
> > +				     "snps,dwxgmac";
> >   			reg = <0x10810000 0x3500>;
> >   			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> >   			interrupt-names = "macirq";
> > @@ -649,7 +650,8 @@ queue7 {
> >     		gmac1: ethernet@10820000 {
> >   			compatible = "altr,socfpga-stmmac-agilex5",
> > -				     "snps,dwxgmac-2.10";
> > +				     "snps,dwxgmac-2.10",
> > +				     "snps,dwxgmac";
> >   			reg = <0x10820000 0x3500>;
> >   			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
> >   			interrupt-names = "macirq";
> > @@ -762,7 +764,8 @@ queue7 {
> >     		gmac2: ethernet@10830000 {
> >   			compatible = "altr,socfpga-stmmac-agilex5",
> > -				     "snps,dwxgmac-2.10";
> > +				     "snps,dwxgmac-2.10",
> > +				     "snps,dwxgmac";
> >   			reg = <0x10830000 0x3500>;
> >   			interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> >   			interrupt-names = "macirq";
> > 
> 
> I just sent a patch for this yesterday:
> 
> https://lore.kernel.org/all/20251023214012.283600-1-dinguyen@kernel.org/
>

ah, I missed that, than this patch is unneccessary.

> I'll make sure to include you on future submissions.
> 
> I didn't add it to the bindings document though.
>

As I always get complains from dt-check bot, I remembered to add it ;)


Best regards,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
