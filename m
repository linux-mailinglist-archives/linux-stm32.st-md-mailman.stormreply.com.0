Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D316CBCFB
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 13:03:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DB7CC69069;
	Tue, 28 Mar 2023 11:03:02 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C646EC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 11:03:01 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1ph76I-0005mW-Es; Tue, 28 Mar 2023 13:02:50 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1ph76F-0003Or-5S; Tue, 28 Mar 2023 13:02:47 +0200
Date: Tue, 28 Mar 2023 13:02:47 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <20230328110247.GE15196@pengutronix.de>
References: <20230323123242.3763673-1-o.rempel@pengutronix.de>
 <1a2d16c8-8c16-5fcc-7906-7b454a81922f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a2d16c8-8c16-5fcc-7906-7b454a81922f@foss.st.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] ARM: dts: stm32: prtt1c: Add PoDL PSE
	regulator nodes
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

On Tue, Mar 28, 2023 at 11:58:34AM +0200, Alexandre TORGUE wrote:
> Hi Oleksij
> 
> On 3/23/23 13:32, Oleksij Rempel wrote:
> > This commit introduces Power over Data Line (PoDL) Power Source
> > Equipment (PSE) regulator nodes to the PRTT1C devicetree. The addition
> > of these nodes enables support for PoDL in PRTT1C devices, allowing
> > power delivery and data transmission over a single twisted pair.
> > 
> > The new PoDL PSE regulator nodes provide voltage capability information
> > of the current board design, which can be used as a hint for system
> > administrators when configuring and managing power settings. This
> > update enhances the versatility and simplifies the power management of
> > PRTT1C devices while ensuring compatibility with connected Powered
> > Devices (PDs).
> > 
> > After applying this patch, the power delivery can be controlled from
> > user space with a patched [1] ethtool version using the following commands:
> >    ethtool --set-pse t1l2 podl-pse-admin-control enable
> > to enable power delivery, and
> >    ethtool --show-pse t1l2
> > to display the PoDL PSE settings.
> > 
> > By integrating PoDL PSE support into the PRTT1C devicetree, users can
> > benefit from streamlined power and data connections in their
> > deployments, improving overall system efficiency and reducing cabling
> > complexity.
> > 
> > [1] https://lore.kernel.org/all/20230317093024.1051999-1-o.rempel@pengutronix.de/
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> 
> Please, fix the introduction of those new yaml validation errors:
> 
> arch/arm/boot/dts/stm32mp151a-prtt1c.dtb: ethernet-pse-1: $nodename:0:
> 'ethernet-pse-1' does not match '^ethernet-pse(@.*)?$'
>         From schema:
> /Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml
> arch/arm/boot/dts/stm32mp151a-prtt1c.dtb: ethernet-pse-2: $nodename:0:
> 'ethernet-pse-2' does not match '^ethernet-pse(@.*)?$'
>         From schema: /local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml

Using ethernet-pse@1 will require to use "reg" or "ranges" properties.
Which makes no sense in this use case. I need to fix the schema instead by
allowing this patter with following regex: "^ethernet-pse(@.*|-[0-9a-f])*$"

Should I send schema fix together with this patch?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
