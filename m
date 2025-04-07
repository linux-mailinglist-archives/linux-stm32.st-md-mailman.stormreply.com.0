Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3497FA7E69B
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 18:33:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD5D3C78F97;
	Mon,  7 Apr 2025 16:33:40 +0000 (UTC)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1883CC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 16:33:39 +0000 (UTC)
Message-ID: <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1744043618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFg4OMSXqyZAd4XoQGwUdaygVVdJ30SNWIcU9tJnxO4=;
 b=UJWGbxFqDDyMWF8b4G2fYOD53tA+BWAfWoGwac3pflGNx/7Q8PgHH198LIFtBZ+wsx8gh/
 XnnznK1WuR4pSzwX7dn9Bt8JcNWp1s5DrdqgsT/GTNhH4Vgnu+/qhtSKjA+JF6SZ4FceM1
 MRxTN0uezDbNPzPZHXbHspuUXvMOgC8=
Date: Mon, 7 Apr 2025 12:33:28 -0400
MIME-Version: 1.0
To: Kory Maincent <kory.maincent@bootlin.com>
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250407182738.498d96b0@kmaincent-XPS-13-7390>
X-Migadu-Flow: FLOW_OUT
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Saravana Kannan <saravanak@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, linux-doc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, UNGLinuxDriver@microchip.com,
 Clark Wang <xiaoning.wang@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christian Marangi <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Robert Hancock <robert.hancock@calian.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [RFC net-next PATCH 00/13] Add PCS core support
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

On 4/7/25 12:27, Kory Maincent wrote:
> On Thu,  3 Apr 2025 14:18:54 -0400
> Sean Anderson <sean.anderson@linux.dev> wrote:
> 
>> This series adds support for creating PCSs as devices on a bus with a
>> driver (patch 3). As initial users,
>> 
>> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
>> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
>> - The Cadence MACB driver is converted to support external PCSs (namely
>>   the Xilinx PCS) (patches 9-10).
>> 
>> The last few patches add device links for pcs-handle to improve boot times,
>> and add compatibles for all Lynx PCSs.
>> 
>> Care has been taken to ensure backwards-compatibility. The main source
>> of this is that many PCS devices lack compatibles and get detected as
>> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
>> the devicetree to add appropriate compatibles.
> 
> I don't dive into your patch series and I don't know if you have heard about it
> but Christian Marangi is currently working on fwnode for PCS:
> https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> 
> Maybe you should sync with him!

I saw that series and made some comments. He is CC'd on this one.

I think this approach has two advantages:

- It completely solves the problem of the PCS being unregistered while the netdev
  (or whatever) is up
- I have designed the interface to make it easy to convert existing
  drivers that may not be able to use the "standard" probing process
  (because they have to support other devicetree structures for
  backwards-compatibility).

--Sean
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
